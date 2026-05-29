Return-Path: <linux-arm-msm+bounces-110286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLR1OAGjGWptyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:30:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D9603956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6603040206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C528343884;
	Fri, 29 May 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVU35zdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjwsux47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8E367B7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064620; cv=none; b=BKSBeTr4Ow/HsY6hdcdMEbkat/tNwZ0HHLkvQHIfe8kfao+/4XEjIO6OsCKTre+KwtZLhjNTZJZ+Th41ACBuhl/54sThMROU+uzdmvrCDzRWL5LcGD84c4f4zAFFf1sGPKmgAY0jqdxwmIx7mb06LXjbP0kq8njSXRgny5zwi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064620; c=relaxed/simple;
	bh=4m/P4aKCqww4XSbIOnY7M5yOKITBB5TUbfT7Znanlmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8PdWdyTxAgQ8ua4ZQcXBP+GE3OuthIIu7gnG+HQs4FEb/YL+Sj9ITIxbHxsvicATYQ5HGykbveNuaisc2I54V9BguUrl/JhtVoG8MV0doB7mX48SI+xC23k3AQCBfQVD7AeZUkLWpJSL1i5WMBCJubm8adxFecC7eksbue/iCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVU35zdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjwsux47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL0M32334950
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dQr3wcVcNRFl/VYU+7/Fxg
	ybHOtzvUmzx4XQAsVMcVY=; b=UVU35zdO3ww/CY71rth0aSfvZGJQXZ4cSUK1Yx
	VOs+NUQrXJoZiSIAr4jEDzUkizUHh4sKSYPNjBm2fn8hyiR/Ls+qtiVQ1cK7/SaC
	AwhPKlA4aE1NA+dmZ49cmIj+yjnT/OfFQbsEnJBYAjx1xhJBRh+h83juTBtoOZLw
	FOajHTvJDkX95lKX5YQU/QIxS303DdUbG/LNyrZdpEL0ScVUEaFL9Y2n56F7xz6w
	5nzbiuwET8tiPlrUr0ur0+33GgV9Ycpbn0XD4aQiaqpMUO4GF+8yCor+TnqzffSo
	9gAwKt1OdWJsjvF0Sd+FqagCe90zBvzk5Hvu60vk+Zmf292w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj253u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso16150525ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064617; x=1780669417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQr3wcVcNRFl/VYU+7/FxgybHOtzvUmzx4XQAsVMcVY=;
        b=kjwsux47GHO+b2kFg8Cdf/YMj4Zne/mlmwX49Ug6juFb9bLB0L5IwBYyiuoYgDxxdW
         ZyD3DTg/+HgcFZiZL5wZU0VjhSe+Jce2rIBzlLhwLa0LCeycg6wND9q6fUsIohgGBdHb
         ZFxmy2Q6YoreIfz6cmdsjY0dw0FBlxX9vx4x9ckyVRh9g9oL72mYALRwwG0l6z6juBB4
         0r6OamiuWDzFJ5PFLMcPZtJg3RatIQ/SQGHcYFcXv5dyUGuasNT8BPSazv3YbOoCORRn
         g70Ea/q3qAZigTWyMVb4XJozQv/EMQ/qmXnpC26GOTE+p6P4Pb6bdJubZvk6kqNbhZ2A
         4dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064617; x=1780669417;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQr3wcVcNRFl/VYU+7/FxgybHOtzvUmzx4XQAsVMcVY=;
        b=nFHemKBWHfHccYu8nWiVJypaDdu7KzARfc+B77bkyp77NZE/hYDNWM1I4S5MWdK6nT
         bqNxs2rpRa7VILd4d+KyCCK9Z0+/ymw+AGG1dpEO1MCSylT3EWuX6lpMBcuxR4KQrF1I
         dJ+S2n0/F0Z83hG1ECKzfuDlAplCmMDRoxW3k4vb0OOET4a4CWMShEgDheQRDf1w4EbQ
         JCIBrx+NetL5XjvBODCwTnMDVLhpcU8vEEAb37BlbOFWHP6Vadq2G+MY7TanBthVq5rI
         U9qrrcDlAVIDezDX4HhlnfmnNEGPKko2g0z1EWcdgmwvSbr67W5n4mJtC4nX0RNAAF6K
         6eRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+J9BNPuKgavy45qIkWCtD310Dv/Nhhlrq/OfpA0/42zE5E4oMn49dctOK7bADIVCKnx8F6Zb6yxD1TVM2B@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOeiDP/Z1uzWvd2CMK7jlHlgrWRsJOMZ+YnnOKIZ+UsvmPxk0
	Cu7XuRvCM+vwIEuA432e2GJQrXS0wt/QdgdMhzdmwjdZ/jQaK44/0xC8AE+fQfPxgpiuZA9yujm
	jW7ar47z+qcaQZs8NmPUnsoyVZFFEdTBg8uJNnIc3e0Efqn/+Rx6Wl0/dC4OS4Lm2r2/t
X-Gm-Gg: Acq92OFhwWU4xiI8vPN1ahM/f6VIA4OAgn/NQzV59lbGPpquS55Q9QUsbs2dTdza+1S
	Ha7Y2B0YycOLMtpMKge/igHrpxYfprwTSoezw0UF88AZkaVi0XOj5mdFt/Gh/jQpsmyctVBWLIm
	Clc8p1VCNSIQKzg7fLguRDEvqbRDejGWplmFg1jZ9wfk/7tnjcmEXPswB+vDGVbXRX48muoSV/5
	GYcQUyuwxPdUCcuqRyd6uOSpi9YErUuCn26+ONox1edFM4pD0sxkJpGYyfcdQmGYOy7eeWMUVOp
	+kOf1ZSmxy/kHoEqqM13xKFgXF23xYiAQTnddqmLPYF0EVoSHqv6PrmlggFS7VrADMTEDI93QYb
	YpO4rTllqOBUHVLm21EoCUflAbQ927viyS0VS3ysz/qTPxYsfiCAoL2HFPFJ528Okw2bE
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr819535ad.11.1780064616595;
        Fri, 29 May 2026 07:23:36 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr818625ad.11.1780064615951;
        Fri, 29 May 2026 07:23:35 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:35 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
Date: Fri, 29 May 2026 19:53:10 +0530
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6hGWoC/5WNUQ6CMBBEr0L67ZK2BgS/vIchZC1baQSKXSQSw
 t2teAJ/JnmTybxVMAVHLM7JKgLNjp0fIuhDIkyLw53ANZGFljqXmS5hZONqXrgOxDRBM8Fvx2B
 9gBEf2CGgLK2RpLHAQsSrMZB1711zrSK3jicflt06q2/7p2BWIOFkjlrlythM3i6eOX2+sDO+7
 9MYotq27QPIRQkE3wAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX/h23ZYUKDTS4
 tgvOffleveIaHaWltTNw1VdcJWT7ev/MoJj6GjFrftnJE3Lgdrjsvm1Ms/ndPeENVn5kwRXiHS5
 JlJBbJ3py0VTPGK27waNBU3pegVpSYxpwMoWTlveiGXvZNrFVZeOB6Sx6HTwFajHaj0hN+J4I7n
 i3WZs25qnVjYLxKkncZhObZ3sOfuZipJEF2+O/B8GcrRBdd+zEKT/kSMayd5KC5V4obd665S/FZ
 4GBEtO8HzZo8vWN29uKCvNYo5ugAgSPe1tkditxGYOLxLRqMagI/T9aeFp2giX8WjJ+nhRmMrSU
 YxCBqBJj2oZDOzQhOmSdPa8+TXQU/dt0jEa0DZiJAh8z4BTErrDOWDHl/mle6HYoyEpSqUpg5Ye
 ESkjEjXyGyV7bqhN/2avty6IBbdu2yz5NkRBJlLP+/jRIJ88asKthdYxUNnFMvIwSFBKRBbl7vN
 XtVnKt7ukdS3aUad3+g==
X-Proofpoint-ORIG-GUID: mqWX_zvyGS6Rf8kl2C9Cz0v2Y8qJ7GCJ
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19a169 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=duSgcVyVFfa5pOUly18A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mqWX_zvyGS6Rf8kl2C9Cz0v2Y8qJ7GCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110286-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 392D9603956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
kaanapali based boards.

These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v2:
- Fixed subject lines.
- Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com

---
Anurag Pateriya (1):
      arm64: dts: qcom: sm8750: add reboot-mode support

Xin Liu (1):
      arm64: dts: qcom: kaanapali: add reboot-mode support

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
 6 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


