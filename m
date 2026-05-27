Return-Path: <linux-arm-msm+bounces-109975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA49Nim/FmpeqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:53:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4025E22E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F04CE30285AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487003ECBF3;
	Wed, 27 May 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8rTOAHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MU06itXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094983E9C0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875109; cv=none; b=g6JH1RTpKbBqhSukxYKyM1zfXHsdMIEdrV2GScqJjX3EvF3zJQhTtxtkFRaMHaZ2xQ8nsadzSV5gn6NpdvPWE4zULAc3YbJf+VN5DV3cLVrZkRp4WLBF/fVMrhOFI16+vyXYbrM4CY5UAazo8C0dwjZ+lOJJtta2JNeIzvZT2zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875109; c=relaxed/simple;
	bh=ls7TrQxCnifOjbx6cWqjTBfc/bkIPwyHs1hYENKhKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2lsu8GnWln9F0ezJfQkSvtsuctijZa+mbL4Z3/gN3j1SpstnBUc+U2o66FG8j1UEWo9KFXsIcl/s2nSLgz1rtRX+OPDRTzAXjznHVQGaad/BNwbR9qxTOLuqzQJij4uLJ0mzlR69QYI73DrV/TkQbxhdCw7rH8uDXZ9ruvwqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8rTOAHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MU06itXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mROi2152246
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lcgjnRSkg+M
	EKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=; b=I8rTOAHMpW4MYuXH9g9zudXl7ne
	z7dzpi6pF6ym2YMIpUgvNxZTxKLw0IB66hxkmThayfqlodHJkMHX829ShyfBQz7G
	Ltv+/a4Gg4WXlmED14u4tJWibNPkQfTZ+lQKf4ALoLz75mA0X5lZyKG/3ab27/Z/
	CgPIVKsVoRzyXO+irj5pB+AgdsnBqVVwez9U1vZWOswQPGaHO5UrXZpueWx/OpA0
	O2HByc85BEEpwslPrpgr1YOUYRRVyO/2r+UZ8FYOQsfv0Mi8I6BgswA83CQaPdu3
	iVqW99IsvvgHx+lGYU/oUbgKu9Oi8Uk6sk3XvUvMp5NO/cVrcv3Wpi8l0zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgt9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so127520565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875107; x=1780479907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcgjnRSkg+MEKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=;
        b=MU06itXEpksGJBnBgpsLNS3j+DeC1aPvTe71cLqH5xQz8KyqRb8prZNHenXzyAxhgM
         JZmYTfgwjaR9NiERiceWTG6Imy6JqLyqM8mT7i4Enzp/Be1H0keCHYOGZUTjY5gDW8ZQ
         b9aqqLTbNja4gZl2pBg42n0fRHmwdJUhjbkoXTHNAHR19t2S1djyd8MoCPN8EDSzx9wZ
         rnR/1aEvjylURtv6srAl9TAywreeLaz6gUKPpeevA55Tswp4LM1OPEBxoou0A9Q1VCWK
         ZElyck3PPCLKR7poN26RuCEhRXkURbA/5EoAsZ8KdAQ4COcTX+p+63EuhWj0+Pu+WptK
         hE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875107; x=1780479907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcgjnRSkg+MEKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=;
        b=UN9w7WZM27025hDXOFMGxud0BiWj3aZZv+2yoaqiP1DCjxh7CpT/Q8YHG3NSZvkEVC
         gm09qJOHq0HcETxrTT1urte2BRlP8LhzUHXH6CuXXvxlKva6KKJgOW2QVIgGhnC+e5H6
         t/T61PcFf7ua0X0u4JPAnYaP6lbfzhJTjvRCizmdqQFnVqfErkufgR51iDVCfvfXkaCu
         rfjs2qA0TORrHOoNBGBoo5mEBEVTjge0XWvmNqIgtgdDeSM02BoIQ78i/lXPhynpgJjT
         L3DSSbxgGdik4oNGtbNlUoslhRAysb3sxrs0Z2AWQqk97sUdyRoQuxAUJylkrw6T4k/7
         nhRA==
X-Forwarded-Encrypted: i=1; AFNElJ+syYxf/lyZooSU2E51tXCnkhEdTQd/yDJ4fhrFKkySNeAePJxQouV5zJrL9wQFqFfpKcYwFwRlRoYT8fgN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxemli4bQsAYMEKDxRwSzeQBawT16ct2I06G7N14d9lcHoMAN/s
	bpR2S2/fol60rSIV4AW7jIS/UGCbqQCE58J4dAyhGV6V/DN26187RIP/qaXW/bV++exI+Xz1PUG
	GHpctKZIhAleTcvyvH3o+yuiLwGXScgV+RPMw89LJQNRTJ9WZqKQxVNVJXStisPW6GK00
X-Gm-Gg: Acq92OHAadKbC4Kx2Ed0UFOdVB9ITJ9p56vjlvd0aRsviZu9ArPTEdXuVWFgk1bDNfp
	e7KgTVlrmwjb3gozts7LPNVT7pU3Ir0wfynNPHiJyBdOc4U2XA2MeYrVXvRbN7gVtpUmdHNPFqu
	/lDFuAcqiXc8mwVyyM5Ne0HdhDlQbwul4BwJjSEDyV7Htkf2TD0BUpEWoEU5BA9WZWtE96jXM+x
	xzQJIYBVlW8srLDCIKCH/QCr4rAbOa7LqsSXLcOt8uhp4TTmUtA991d7NdoG9PKk9QptX+0PB7A
	tu7Wil9hLfyN28gL5w6S1V+yjFxCwQX7sm5S/i1xzP5e2R75XaypvZwks/kzLvRAGGk0o8nlJvI
	60mig8OIXdRY6l1Ayow/Ti8m4RhIO8kwpCW2LsFOEQS78KT6+
X-Received: by 2002:a17:903:1a2d:b0:2bd:5ddd:17ab with SMTP id d9443c01a7336-2beb080c8fdmr246010405ad.32.1779875106547;
        Wed, 27 May 2026 02:45:06 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2bd:5ddd:17ab with SMTP id d9443c01a7336-2beb080c8fdmr246010105ad.32.1779875105922;
        Wed, 27 May 2026 02:45:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 21/24] arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:26 +0530
Message-ID: <20260527094333.2311731-22-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16bd23 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DNTF4lp5giEEL2ahYmUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX6Y0ochORnr7x
 aA4y4SQehXj/TrRHdmnrBOP5shFuc8hRuOh1ufMtrNN4NqXO60MYbXVh5+v6BdxXb0IVFeGFw6I
 CwkvCSWiy+UDqf7AxscFJwvAgIw7szAluNksz7PdPG5jV38v547E/7v3qy03FcvbiA1DPxj1QOr
 50NgR4+TYDWcbdIJ4a/1FpR38Gq2lkiIERcQmBivu1+pHhjZDNyR2zzTIHTko9fcatrmjKpru87
 Curpu5EOkkm4XRa6yNGL3dho9eMnsQQJgdC2dR3OXqMhZVD5CTksG+Ip+VHw/w5MX1pe/YZ1gr6
 Eme1NAU8uFuLUWGrjlHaVlaRUih7nfdcHGENHRf9jj9twX4pci6JABUzwVLQiXYLteSzaPZ+vPq
 d6PuceqThkdW7Y0zddTeta9jkt/LIgWpsFYsCFdC5raXrnqLmNWL/ckYnERgPWPWXrGsIajRAAw
 CFtbeASTFtwQSZAcxcA==
X-Proofpoint-GUID: LlXZ8rsvJXbKffsvXP7BtU51Nf7OQsqk
X-Proofpoint-ORIG-GUID: LlXZ8rsvJXbKffsvXP7BtU51Nf7OQsqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109975-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF4025E22E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sdx75 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index d1b61530b562..85cc9c6e6f83 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,7 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
-- 
2.53.0


