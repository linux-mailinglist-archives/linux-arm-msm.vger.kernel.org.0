Return-Path: <linux-arm-msm+bounces-112669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z028Nvh7KmokqwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF124670471
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IZhJUN3E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="X3XJTxi/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5A9D301DA51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7CE3BA253;
	Thu, 11 Jun 2026 09:09:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A5309EE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:09:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168996; cv=none; b=d2R22ZlTD1Ea2q8JYfx/HTbEZpFqAagxhWkSRbSn/iVMKzDynIuDGRPGS9VLakCVGW2+dvuSk8EFL9HAet/j7ji1yhdtmuUi7zZ3wq0bcG+fJrlNLkykerRY6uz+lH23NjZCS7HVAopU1W4Cy/3aNcMG9x+fbVFlC89vM+/1z+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168996; c=relaxed/simple;
	bh=bqcfhdzuxUamPm1pdsfQKtg0uUtvUiezwZzqRCMONrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bawgri4wUHBMuhu4T6Z1cqGKDLvBPE+ptcQXRLoFNUkioWFoL4lS9EqSyRopeOVHBOClM78DkIYyopXWGJQN0N9iGNnqwM/M3YFMGGfty7kJectZEucPT/OsgrYSD/TTk+0tSdpAXGl8TBx5WFpvETK0IIF+1Q/4+E9j2G/9zEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZhJUN3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3XJTxi/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GCCt3843612
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsU
	RkvaMapw=; b=IZhJUN3EwGI32whFV3/hLybAvgDH+TZ2ThXKM0cVuaqaM4d3w84
	M5eIB51ljgniWQnUhsv6In1lYWWb0EOAJvw8RuEQXgubQ3r/4njw51pvdnVoXrNC
	uFriUNdU+HQBOkQRxLZ7vqg53VqZ/NRbmcpEuYpES29fdHk6nzEOapCdLTZBgCqj
	KPxP2JS248vFWXXOg0p23yi5oPAvWNVemh8K+gn7PwBpJDnaY4VnqukdVAc3G0lK
	LfAnhcAJDx5Mne15hYqHdPPowuNibkQn7katIrDWmNA1V+9TqXBi2WC6mmVSPD5N
	fc2iY/bockxNEKd2iaOuDB4uiNwwgNbxieg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702m3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8604fbe71eso10091424a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168993; x=1781773793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=X3XJTxi/3hZwTCF42KEzleuxR6VEeM9f9CsthLKeIws+g0zBC4xHpqf77mNZkaz20Y
         RR+l3mBrsWO/zZXdv2ioyJtIHQW6fS8P71FuyALpDW5538UCSD7DNEPCnqv/JGMLEeDc
         ecPATB/OOtKdO4JWhUyM7vr+Yd5DcmLk42kFDeJsGhSHiJDoZEpgSE9/oTxHjS1gubQp
         Nygc7olE7Itb3TAMYi+wkwrGx+dXls5zbJ3WPRcVE9fCV7uoqFm6wI5nuqbw0AlytjJO
         fzzVCY3Nqa+aIRwCzxVNVpwTxhdve6KTnIKuViu8byUquGMn+wM9QiLAsg5DOfl3338G
         KO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168993; x=1781773793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=sNQKeXmbwTzIB+pm5YJ31nSsHNdZ4wRfnu83SoEyQcyaYndkOnThYcAq8GI/Ei6tow
         WW9/w8ClqB7uNbYutJ1vgWpHBJsvDe+xlDh+7aTYV5uPj/zlZqqL8QzmTm728vXU6CII
         tgRNJUyRFfmm2omh6B6Mzyf5KbgZ53Er9wuGwR+fMqZHfRbHy18Hdfp3tVAchTM8qqMH
         d7BmMK+hvPY9CD+TdKMku/CCMiTrdlod3vPiSEvzZW2Sf6mudHGwIYuDM02BIQ8UlpLi
         s0gtsx2nmbUEKAYdYBnAwCqAWpBm5v1H24rI086NDqsUjeVrUSLA30ccDqOUne079Wnt
         0a4A==
X-Forwarded-Encrypted: i=1; AFNElJ9ufTgKOgdpEns9sfgXsDSQYVHk0A5dwDzO9HrGaFGMg+InXvGwuBPRiPvbjtfq7jl/2xQgYKNW/qfD/dTi@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/m9naLqvQlwQMNAODR8zAyMfGuLKB5dNxW1fBws7Bec39ZiV
	r3PeY7k4YHs9Jwc/fu5LBN8//5vgq7Th6XF93pox047dp8uUd/w8iVYjYmrKep6X/43HT7G4wTs
	VER9IrGwJclLbyx7aaiSlIduOhj3iEwtc4q2KxXfvCgz4kJw+zW77RUTSY8i35AdKavgS
X-Gm-Gg: Acq92OETB13thqCRy1YF26SwBJ3Ysz+DvrXydr8fDZuz0wnIuV832FnLmLD4P0nJTfF
	tMuSZ4XbeMIZfMaE2lTCEWsXhyM72FXfUOFZlRtXE6tOOets7EElVNjSgC1w/4wGj1RVTQ4nKMw
	JhlSq5zY6HOMTrE2DSGXmZ51hKW3bAeVzyossJ5Mwb+Ui1w7sandM9HRgnX4nTRM7Ai6qDeDNr4
	czA3oqjKFdD+yllwVp0/oHWl6yFEudDNw7Cf1U8V6ec6W7PiFpBEVfupbyjDWILHv90uYB3EwFd
	NJJmT4zf4JD/p2EqjuFYQyBjGMVcndWOtE+jvLzjd3fMTKPCKC2Sllto1dFh9G3/Gq5Ap86cLmr
	wVZLA4Mu2TobSlDUgk7x5+qUBnYnWJcKHAkKkp86STlZ/K9byNpHvUOa0wPh3
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283444637.25.1781168993523;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283404637.25.1781168993063;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8658610cbbsm1083490a12.17.2026.06.11.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:09:52 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable USB_UAS in arm64 configuration
Date: Thu, 11 Jun 2026 14:39:39 +0530
Message-ID: <20260611090946.2790631-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yvzFrjHKq532gj4eOZEvfDQWYQusbIdT
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a7b62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=V7zewc8DsbaxPfsbzs8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX4zxIatfeIjP7
 lgiDj2AglNORBJnkcTeKyUidVdX+yyTzD3bY6/6Ez9PvIoOO5eiTUl/TBWKlLkzTAOwsh2mJHyL
 3NS3PZ/yLT1ZZJ6faO7JNXiLJT7t0OraVcNu7rnz9249RvDZhYN9UIl+TNlzVrgJfZX4TTDYxAT
 BThluAmtBMCVFRWRR28rLsSsEbQ+ifmqKtSZKxqC9+ToW23Lo26PWeYwUc1haLV5YHJQDmzhEo1
 c8PMo2fBSbkBMm2ll3iGypNNTsa4M9tEQRYHNTe5yHQoDE8vWv2cZUOJup7zFSYD3SfhDh40VdL
 ycQfFBCD3MpenmhiG5uihyfAxSEGmyGC3dTgZCsyOKEaKylLeBZxYqd+819LKD+puIxCNNmRrCa
 vqtGvhRTZ7pXqoceCbZE9tapSnBdjCe1c5ukWEEkq0tTlqLjDp1WjoqSk/qYXPBIlX1BbWT37ZQ
 8FCEnzY3wxnUY/az9Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX6BQO/qoEknGp
 +gj5I07GoVGVvkUbrs5p4BnTdqqob5lDXS0rzTWOl2XXjM7EeG24lBXHmQo+RrG3toRxMl3pRnR
 Kl+1brB2MjefEl0VJVMYiu3YvW/MbgU=
X-Proofpoint-ORIG-GUID: yvzFrjHKq532gj4eOZEvfDQWYQusbIdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF124670471

The USB Attached SCSI (UAS) protocol is supported by many modern USB
storage devices. It provides significantly higher performance than the
legacy Mass Storage Class (MSC) by supporting multiple outstanding
commands and command queuing.

Enable CONFIG_USB_UAS=y in the default arm64 configuration to provide
better out-of-the-box performance for USB storage devices on arm64
platforms.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..f82e9df77941 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_ACM=m
 CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
 CONFIG_USB_CDNS_SUPPORT=m
 CONFIG_USB_CDNS3=m
 CONFIG_USB_CDNS3_GADGET=y
-- 
2.43.0


