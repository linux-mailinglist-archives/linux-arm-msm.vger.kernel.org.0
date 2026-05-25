Return-Path: <linux-arm-msm+bounces-109642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GicFfE2FGpuKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:48:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C69305CA2A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9BF43016491
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EBA37EFEA;
	Mon, 25 May 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gq2W82Sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akhe6P2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02079356743
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709676; cv=none; b=CmYG3dYbmGxRC2R/A4aWij6q9lGeTRy9sHdBC9xs0GOJezzse12mMY7Mt8h9qBntDFe+dwN3a7eokgLvpVGdwg1crfS+OK9PAdpmOwtmTlUNpTHFMX2Lpy3sKpPOvlNgYShIQ8N1WhEuPUB4v69r9uupIs4Gr0h1Fl4DiXgb7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709676; c=relaxed/simple;
	bh=KoxzW3fw4FEsw0k1Ufu2KlWqiqmhbI91UrP7hG6eJ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdN5nr/y5Oi1HWc7PICZPg0bSRDYgLOMrYVI6250KsaDjQ4H1HyF/CIUBw1AdiXpy6aQYdOQd7GyaoIVzGh1Y+M93CdS0Kt9iOp2zIdC8CPxPJiGUPreCLGmUvVgRJOWXyvNMl3LjU+1NKaYcJGd1bRffDbpLAFaXEfvscbzRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gq2W82Sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akhe6P2j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7iGh21850867
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NaE0DGEkfp0
	MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=; b=gq2W82SaqMA44xnryZixRGmpmAy
	1VtJFfhz5eiRBl5BBH/ZNNJz6Ei5aCvgZHsAct5a1dkOwxIS+dfuOvutGoJsSqRb
	TJ55zx7vs0id3lLGSERMoJaV1TvCfA3I7G5pZHDd+b9yas+Mjy326rHjrpQ0XMzk
	NJudlA0rj6ZORXqopS5tekEvPcfJ1aOWRU3YdbC5bB1WUe6Mlcf9+hkm6ShqDN0b
	0C/Obw0L8QEHCIzMO7gaiMWcRpzppTE7Ddnq5okhM1fNEYlyReqouNgswTs33tAC
	3/Prghb3526Gzrq7+r1/5QzGUjIAGKg19DT6kaD4STf1+qQEZnWlPS5/xCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5xv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d53eeb8aso71680651cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779709673; x=1780314473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaE0DGEkfp0MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=;
        b=akhe6P2jX56aaIBbjMRoful4d8bafUgpPC9+TPw2CAmlTVtmdHJG1WTSfQ2fEkH2wj
         d9Z76T0SQrfaQU2cwTlEperPZStqHQ8xwuWRoeDIQ9prO4eHFIRrEg+haZxOh0qcRBsz
         5J0jBIdLdzDgQHPkWWPYPQNiZVPKpOLIlJ6CrNgptiNooozXC3sagSMAFZyI/dNf1n1B
         f3dX35V1yBTrRAPvGy8+z1+zo3BgsXW2YG4nIFqwK5aP9XbvIx9RUhZvHsQaNw/Mi+QN
         odu2LyiEgpsWjYdkeMfZiV7FtK4OFIniMQlN8xvPsAjEk5CB0eWqaTK063ITa5VbPSaR
         Ukvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709673; x=1780314473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaE0DGEkfp0MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=;
        b=rW/hQubinaPXPvIWzsvZiUorurarrVbeej1+xQ0huAXz4WU+Va7vgfzyLL8txuG5Ew
         6gp2j5N8r24ORlZ7skmupdtwHBWucLATzNfy1jA/wdZETjFX3/mtTAHamft4XHVcOjbF
         HxwolZ+dFURA3v+uFoYYkqIOvA1rrYHExylxWs+pAL6b+jwRwzmMkcSMGEQHpnxjPsOo
         4C59oq6M6XjcqSS4EY/+I899cys5RnfU6wKgWh9K63WJLh86YwCVwyjRa9OCb3v1idHN
         RgAHzDsXcKXqHw8V+SaNFu27Qwa8i1k2RelXS3OZyvYn8CTpfK/nSIWzwbNhqM3Fic/E
         DVew==
X-Forwarded-Encrypted: i=1; AFNElJ/QWOTsKPhQtwTOEZJL2hwFOs+QjwrQEBRDTMrE7JhfjeAWKcbGVE0cuOLLURIIoJIvQEVcK5kOG1FSAw8o@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVqA2R1aoK3J09cehVdjDm4Jc0IH7qcRO+M2kBheZmbhx7XK8
	tcZpSSY8U/U1LNbyjlWqjw77BAGJKqGyT/u9tP//rLdJvppf2pFNdl7287Q/tD5FAwkVsYoL4MJ
	EthCGGWU3BScGFjAA7laYbGItDOaBHiTlvq4c4yvz9U51l3bvVWCcU41aA4pDeFhEUh/j
X-Gm-Gg: Acq92OFbyWcVjuXJaZdPBaqayZa6ISSf/nQm/i2BiuRb2U9Uvfk43WIz1FoRidZCwlk
	R8QD+vXXIljb7ID1Kg1KG/AVCosxjXJfXHiX5tyy4zFQ68OHURn0KoyrMIEIoCdwGBjbnqRWUq6
	/eNYKEF+e4LrHYhiC088f++e3KdQbgqIPSIQxegx3u1hg1ZSt3l+4Me3v2ebsPO6EhKJhOUpx0Y
	m+fyJUiJwv3iztHXYLzFFVJPa80L76VunfaBqOGFHXobKOxERNKo6IrOUkISAcc3u+xpC7YDvFX
	WrVDL9XFd9XmGsvRPk/KrT41HDk/rgXJLpd2XXW1SAEW4AYn2G+iLkSmYP5SXDq2rai+BWy5YSS
	49NWb+tYnLRW4oCgga8HOYZ9ET8caEbo4SbF/QE+EDI4BPGRc7ymyYYVfovd23zXoKYexTSziqv
	M6dwrBOEB5voSwrqAKzZIUvWUlXncaYZgb
X-Received: by 2002:a05:622a:180d:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-516d443c70cmr199563461cf.9.1779709673389;
        Mon, 25 May 2026 04:47:53 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-516d443c70cmr199563231cf.9.1779709672897;
        Mon, 25 May 2026 04:47:52 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dd3efsm384096666b.58.2026.05.25.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
Date: Mon, 25 May 2026 13:47:48 +0200
Message-ID: <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1436ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=Xh_B6YT5a0T53am7tikA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMiBTYWx0ZWRfX7+yqeQ8hpiuG
 JEJf/ZFrNXmn1G3Kmw6pFSeMIw3RNgIcPtprz+60LLAfBNAlQlTOJDSq7g9yTjoQJbaAq9+4EgU
 6nyrcsA3XzHK91s7juwPwRrX+ATWNLV0VStJvtymFP4vkxNbvTQgs85RFvXDdhcADEqQBq63AK+
 QT5n0O/3K52qUJsfBM9H7Y3LRfAjifei9AnmxOGYUEq47Fkq+GtvZcIurLVtaMhthFotZVqyZV0
 DjnxQFpbs0NEP/ZDcUoV2fu+uWZBEiuHHEh6CuGyzvLRBZpEeHFCLAL0VmzYUwMbTvjEeMp8QHR
 urDk1Uqyxrx4ixCYUs8GzzYpuTvlRT8Pxsim9Sacw5p9p/AufZJrQg7oOpt+p+F7ltpUXOVWKkd
 toIAU6TcAh80oapbovhGIcvU65OWO1xo3l8O6ApPPHnIuUZtVd7DVOcy8IrURs77gO8ZDA2tcOQ
 cnAjfr0/LELqnHJpVig==
X-Proofpoint-ORIG-GUID: QnlYumDyyTVcnaij1m717yNbWF6Axj3z
X-Proofpoint-GUID: QnlYumDyyTVcnaij1m717yNbWF6Axj3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[4.239.109.128:email,4.237.230.224:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C69305CA2A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The EFI memtable (shown when booting with efi=debug) shows that the
xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:

efi:   0x000082800000-0x0000829bffff [Reserved    |
efi:   0x0000829c0000-0x000083efffff [Conventional|

This fix aligns the size with the EFI reported size and makes /proc/iomem
correctly show mem blocks matching the EFI memmap:

82800000-829bffff : reserved
829c0000-83efffff : System RAM

Instead of:

82800000-833fffff : reserved
83400000-83efffff : System RAM

before this change

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index de0f2346cb38..5a2e84365901 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
 		};
 
 		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
-			reg = <0x0 0x82800000 0x0 0xc00000>;
+			reg = <0x0 0x82800000 0x0 0x1c0000>;
 			no-map;
 		};
 
-- 
2.54.0


