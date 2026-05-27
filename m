Return-Path: <linux-arm-msm+bounces-109967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFCNKXy+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915A5E2219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 928373054B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2775C3EEAFD;
	Wed, 27 May 2026 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1otZ2LX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvIGrnu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8179436728F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875081; cv=none; b=CWnLLu+vyetD0K/wanbVeKJNFpErA3SgG2AqOnTVBuQ88K8od9q9xFbOLVXXPRUArQB3kGxZJZmb3yw2pkUanBPkUN1Xwq6yZ3l/nZNKdEsR/I/9tBQQnoyNKEEbGKqqgdjZUldwRW5zvFkiJsoXvZntgc98ncedCmkIyRj4o7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875081; c=relaxed/simple;
	bh=nT3doCJE1mm1HBx7j7+EiThw1tSZX13medjKcIdVqVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNWN6iKz6PPBNY2rWxIJ3iClgs/I/ctqzTzJsYTeiOcSuz5bmJ6iNMSG+mb+aCt5n1hrGHAWtqgKUgkaEEIswqwgMyzKXvQH+g77s5zgazV41cUDJndS/A29JQe4NJW4gukv+ZXEMm9wQDDKLd2e6lSPm+F4j06rU44lIuxu0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1otZ2LX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvIGrnu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTMZ879318
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rrX/6SAGT1J
	Ef8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=; b=l1otZ2LX0y6zgeTyonhM9YhKzoz
	UEPO9fxf0rJ2XFUoJlyd5G5nEs9MuDCodjCsZSp/IGjp2BNftEHwbqIyuEq6rKid
	Lk/JsdJ/S2BL6/kHI3hOJD65xgjkRDIIMbU8wRrA9F2UtXz5SmFL5r+Ym5I51pk/
	z+hEpB8xdzQGbLLjngYi6Vh8DRRDeDyE2nG6T5IypKo0dwtMRxgB+uEfesCCJGX3
	VGmDTdTcTEF85+o8Lc/HOpTw35Y8OFgZcA/pspwTVcJXDaQpVlTaCzjk+Xdf7hMa
	NdzNnnLvCeaBMzeZgCrxWswluXLxHLG7NtRNDcaVa6S/525N/GvzrT92E7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrct6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba6fe41283so124337535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875075; x=1780479875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrX/6SAGT1JEf8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=;
        b=RvIGrnu/l088MqiYled26WGS+yzRj9JaRJsy9po4hWO+k/uDofl5BRpcDznHqcjdPA
         FNJBBTbGtoVeK3ZeYx/Melb5LHmWM4aOISAvj4H5f4vpXmHvxs5DNe6xFMOijIcPxkAm
         dh6NiVaYi7HxlnAG9LWzN/X/PjMMVDSNUmNFae691/LoX+Mcf8pJ9b+sOUk6JS+6/zfq
         KpsiUv+layDAUqzVYL8+KNDc+fmufORk98yPk2+H6ytDFvdWBg/L5uJ7gP6eEPIAUQ2g
         HWBnrNPBD7bqNub/xFAMTfuTRRu6DRo3irqGlkPric3LKf2uvEHjtAcSGKHYvTlv3gpj
         X+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875075; x=1780479875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrX/6SAGT1JEf8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=;
        b=YpBiNi+JVPqRe+cTGBDdA5V8DdOx9UzKWTgKCwKznS8SCn6R6VtLpNqtdiQrCIbBfR
         IfPGozu2Nyh+Qd26W9Do39EfhAEwfAzSpMlylB17A2BPDZjqWFmU1n4xban/YTBWxLf8
         XknAy1M4axyhmqyqiD0kKC2N2YMIAX1b25l2Qno9/gWATD31gtNxB9TtXuc3yS0/+sCZ
         yNgCs2zRc6ehJTrgUYndlYkx1e4XgDY7moMIwVYeeAD1ATEbDQN2+ink6dUObdXnjGvd
         hNwZ+yMBAck7LkJIp7A5rKWInYh3lUXQ2dV23emFNuPw9bgJixyQ3zKledaZ1B80SckU
         oWYw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZI9Z0YfZRu9uxUozb5MRWLPJI3JB+8ShI0MRSH/ReZXetHxys5FKSENYTGKOECk+NOMjMKopD/Eo1iAYj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Mmcmd+HIVEYk7JcR6aPHIuzVwSjaS6Rs6xESwyVH0sENzd1g
	rnZzO1JZvcmS+nlaRtlHbnzdjpxFFR89nussv+vbXuioP/E8pMaKKughOrKX7IsBxsqKLm3ujLk
	sBucw+7ONGnDHS+sJOqVBcZkFT1hFH6G/eHEcN+OKaCHVsYoZZIuApWAe9Mz8xjvEFNcj
X-Gm-Gg: Acq92OHLGg/R7zIliNOE4aR2F+56bVxbOGgidyS9HANohe+ilVpIOHjYk0eK5IleVBI
	rQvbdBu2r7DadOpwuB9sQuvtdjdAVrhvqs/ab08Tm107WMDwOYA+9ZMX6u6WkZ1JIfCMg3n7D2k
	ZT7omXyR+7m+0MF7AO3pnYdoF62+4DksO9ZBFdCh8XkmRLQHuR6gkgldvIplNMAQ8xf4thf2ZkI
	RFE6ZYE3kSP/C/f8pEpKsKSE8tbB8OAJz6NB+lwWR2OqFaRaCLw94OUNA4rAU4Yrf2egbDUXnYd
	cJYAsHuADYAmZEKddlz7uv73wjwvZqrnlI9bFCkxLM9M/+LX+X0JZhHXexp7ZLapl5BR7FWeCrC
	KWYcstxhM5cMchPr8iu8liPkb7oz4L8EOKMhwualJH77qzaEr
X-Received: by 2002:a17:903:1208:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2beb06730ffmr238744465ad.32.1779875074736;
        Wed, 27 May 2026 02:44:34 -0700 (PDT)
X-Received: by 2002:a17:903:1208:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2beb06730ffmr238744165ad.32.1779875074183;
        Wed, 27 May 2026 02:44:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 13/24] arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:18 +0530
Message-ID: <20260527094333.2311731-14-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX4JJpJkLmU+I9
 IFOILoyO26LNtCRDH+uizNFc3bl98pJt8qlVC7l6kUKQuF9Fn0agTWd/B2XnEf9EaLrWmUnblEt
 V8t4E2LwtyWxBb9FmMUOmnkPvfMBe+b2o4oHhWZwGEuKSpRzEDgh+dWKhJRLWx1+lSuWjLUCvuB
 q5KwhAVW2DTa7sDhCapkfVup7AmOV4RvWXw4JmYb5x/WNZ0DEd9pOvARZot7uSOLDOi/0ruKowN
 jTiYkL67kgqQaIRFNdU9rYM+jgSDW8OePxfeSHTH/+FCC9uRF6XERXOeCX1YIF/y1HT+fAxpd1H
 ZM0vUqs4dmxHuKLPPjvmIm4Fgp2iQDcVHftxTvWPuDic8AwER8cA1YT0Ytsd8fj8FYPeBLWN9AY
 081M68dAW1A86WssupWYmMEsdBN7RGkNZWlJa6RJtj5KhARd5oxMW+c/a3PHmTQqffCnGOFXBe5
 QGqzDe2Jzm6J/np7PIw==
X-Proofpoint-GUID: Dw0pckvGFLzSpp5OocCTODRaW2MqeDA0
X-Proofpoint-ORIG-GUID: Dw0pckvGFLzSpp5OocCTODRaW2MqeDA0
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bd03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MCRu6uKc7IEJv5tjkTYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109967-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af00000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1915A5E2219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8650 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..7a66b79ed336 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5987,7 +5987,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8650-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			interrupt-parent = <&intc>;
 
-- 
2.53.0


