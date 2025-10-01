Return-Path: <linux-arm-msm+bounces-75724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC302BB1ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83C4B7B1DC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1212313528;
	Wed,  1 Oct 2025 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8PBNmo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD6313266
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356348; cv=none; b=MuHgwiwb7pv0xraSmhbY+i2VDp6SZiT0xOp2efRYcaviPyQTQkT9ruLOYgd0awvKu5svaJhAILuFNu0jyAb6bFm+PUB6HlUTJHvsNOZ1bFLpfpARt9CHY/Yl7Im7rg+IXUmuiCSofZKKDc1bAj3E5dVc55yk37f5Z43waNKBRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356348; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=daCiS5J43QUXOD/b/f4bd3qRhyZxwRioiTiigZFzGmBQAz0dxDsu7zlZXpNOynIJn+becQYPooL80fBBhDp5s0MTbB0+may5RMYkH0jllZzJ14YJ6eSNkn3uh2RFLaqY3Hr1TLqFrN3VDsUzn01BBMD27e1KstEg9T6UDXeVGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8PBNmo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic9b0022671
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=m8PBNmo3eyDlXQAQxCYjNuc89IY
	dD4Y7iU5etjHZ6eSWWUsyRRMfSqwJ58XwUkvnPFiGNVJGUGDzrXs184yad/JR7Rh
	CCBPHSqnjTiTooIOt0Usk85xKZH+tvR7Hb2UUSfSOJ6TZdAaxUuYUY9nZDJlCgxi
	a9AfzDqMcvO0NC4ItA5eXfqFefjN0OJIM3vzMwxETCpp2A+Bfk9beXEH4tCZNTyU
	Yuxbp/pXm5OMGWsbOnRkOGesog96sX24Ae7fTExvLMcqYtOgbAW+OHKLLrtfy0vd
	KdURq7l2Mcu2pm5whproNNbPEXelBSLXr9UJ8vjPJRvIwRyCOdueAvLaGuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6bqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so322892a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356344; x=1759961144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=egVIdcG00mE0bNNTOGP2TxUm4v22LOpL6bGSbv8tzZGdNA32/DM2aZu688IuwQkgiT
         CSdisww29IFM9ow3W8Mhi9FhO8kKtajLSiSgZA8qSASsQFeXtPosl/HkQsVZxtyqNqPR
         NJXidX8OsX+qa8fj0Q3ac7t1cCw/CNmqFLnTukqtwe4eKobg2O+GCWu3vj/QUdeafXCo
         0d6GX9nVOytV2UQg/gInLr9sghNtOy9zpwLehCCGwAW+xr5Wzq276OUqNcLPgdaBeXOq
         e6RdVDIke3+kX0O8k2Mi5LQEUEsyPf9yairIzirop2cD41ddLzVejizN4kR+8uuzZPo8
         Upvw==
X-Gm-Message-State: AOJu0YzKvntfgvencrCzSzTitIdO4OQ7mr1GcKqcHbJ1GUt+NcykA1qk
	36yaKCbHPDTmzX7MJg0DzYg7VDVjo3KqtFafkrGhetE0HHIAAvbZprID0SdDW2VTQdBZFWWUvlj
	K0F4otR+6j/wNRdEvGmxpECPUA3B5FGRwQ/5wvAuQ7eVm15SpDqt1Otm8XtWIswLGZQPB
X-Gm-Gg: ASbGncsJJ8j2lmVCOeaAf85g9pRRFPR39MiB85Jcmf1SpJSUJqz4hyi9hmeGUiogQ5e
	tqtMBD2Nn4luWf6fEBIjkxPX1U57rtIR3fUx9QTu1KXef6dYJMCT8P5SClAZ+FQH9Ls50YNbbQH
	Im8Zhlx+fBld92nlFfym2cmvU+/TALoco3PCl/Sniip1itfYFkdfeDPPylgwp3ui98DRZs2w2zw
	MPRhqJ4JnMLiVkKPVB/FcTj76ebxnQ4qNC6lbCf6QNdJZtSHsxUKxsxBgaoAB/DXP5sMpAVaUml
	5KnY50oIQd/kDKJ17YkWUCNZbn9j3T4BOyxXaukJgjeJwuZ3q2uVYYyPQctjkN4NDBC19uNP/yZ
	1Ol7rkG9rkLBQ7FcGzhetag==
X-Received: by 2002:a17:90b:4a87:b0:32e:d600:4fdb with SMTP id 98e67ed59e1d1-339a6f37ce0mr5612392a91.18.1759356344600;
        Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwA03IVPTcB3jPZNykUMsai4acp6hXfEk2fjuAdlgpyO2JlX4KBGXUh1TStolV8ltoQm2vOA==
X-Received: by 2002:a17:90b:4a87:b0:32e:d600:4fdb with SMTP id 98e67ed59e1d1-339a6f37ce0mr5612350a91.18.1759356344166;
        Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed,  1 Oct 2025 15:05:29 -0700
Message-Id: <20251001220534.3166401-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tm0Dyh4HIdlhh6sJuPn_PFpk2qWBgyDV
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dda5b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Tm0Dyh4HIdlhh6sJuPn_PFpk2qWBgyDV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX1qCaAdwkMDPh
 ZE/14Srg+ZQhMImVqvX6I17QQHx1cudFLJT4xETU7MEBfVSF7Tk334AANuAveTndA4PYz638la2
 zTR7JWj0Z5b9VaytdwMeKuTl0u8C2rjZMHNXPM6eGvDouQmAOmJjnwZ5vQ0D6Mh6+a1Zh87b73c
 XaULqAHRllobCWJiF2uPYOS2gk8Eb2xIqj8bTyUPQAw2Nm8Lzaoy/xwuyjY/oBVys5Tni7WTCMj
 kuha1A41HgqW3Wfuk86SgppK8n/rAr4AbN1DOwFAZ+A0mUMtPYJyXfC5KgpUPnfPquMMEuop82c
 RyzuHDobgoQCPxqYIn7c3s6stoH5hcJXL5lceIts7hiXAvcEMw+UODQfCHoPIp9YxgOqyi+ha94
 KXDnz39iEXw1GhTWyn5qrBr5IqctUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

