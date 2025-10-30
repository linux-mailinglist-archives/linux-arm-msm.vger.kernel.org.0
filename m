Return-Path: <linux-arm-msm+bounces-79636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B83DDC1F656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521C43B30EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CE6212557;
	Thu, 30 Oct 2025 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp2ViADf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBgTZ73G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B7284890
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818119; cv=none; b=Lz5jIGOogNdg6D/fhrcPH4qM9qF4KB2udydepeHCtP4mudsZiW2ksiZn55qLn3Uek70O0Z/YnEF01urIlLWreu3Ro6l1IWi6W83MphRWno1LH5wL94E1IEmrcatZmVYXf3KIemS0QKCcQQJ9iILPhKgsjxOYGkRuzgv4EyeLfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818119; c=relaxed/simple;
	bh=sn+bKtHsVI42aoD+4isPVZxb22meB/qiiVkfiZk1lOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3/SfHGHhgf4UDS1FxMHEkgt7aYxu+nlzPpbk8iDlZPLxBlt4yO9Qkof3yXy9kgQLh0GQ1CksILqiNwX6RUlAhjyEh5cloo/94AGdrMjK+HMOuZS4lme2CmnIEVyGB1QoB1iVhRNxZ06XQXHCrLbEz/4TjfugvGGklcWA1xoXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp2ViADf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBgTZ73G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7sOMh1655941
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S2B/u7IAc5KODpSwvJBfygwIgyj16yYs/7b
	v6Cj3hSE=; b=gp2ViADfz0BHMah1LDFQv5ESbJC3KtD1c+Y3fkYDbXs+8BHDdAw
	BntLM8fnYyvHO4mF/aaJYpnJIroC/StNoqZsuFSmbjtS9uUkZyAGNQ22/bDjvQW7
	OGEqqkaOnBy/XHpjomc4SIdXSkvp5AYDwitdX7WUSENnzh+qaoCeBMXZo1ub03P9
	9fowrfLs/Lyn925KiOREAic5RRym9KBFh3TRdq9wVnQaFLu7hcHs8QjrZ9GnDVQX
	awKuIfKrry5DKZNVQXGgDhfyFMxPA5tcNM16FdoHGn6h6s+aXqwIoVCTLlac24a9
	dcONlWKmDMNmMoShfVR63JpydqQNlM2r7uw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptsvxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:55:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a675fbd71eso1052534b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761818116; x=1762422916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2B/u7IAc5KODpSwvJBfygwIgyj16yYs/7bv6Cj3hSE=;
        b=LBgTZ73GkSbKQgy4SlQWVMejwYCce1S/3MjUMmS/t/35VZi9vn/jhjKm9z16OJNFQq
         UtAtnptv7AZluk6gC7hui3iM0whhxbsiIsDgBZol1qi6DblASYpN9cxtxFhxYkC2VTdl
         zkNjIcHgmKoipAoJOo01bIORsL+aKzBslIYyMkYya/wgUd0fu9SlPLNjPk/J6etEE60A
         BdmxlUZ/o+tqaB8SfU+JwJncFYYbBKbotse+l71HAVXUuRQKOeIP8cDikBqQaj+o3aXt
         +adypoEb8e6LiFED2ehaOvGJGjxxZsJFsG+3xwoPrYWbdloKe5Te+H9O2MBlGZ2Z0kG1
         Q2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818116; x=1762422916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2B/u7IAc5KODpSwvJBfygwIgyj16yYs/7bv6Cj3hSE=;
        b=jhv181aIKe+EVKF6Vfod96rnJFg1qCAaFrxla7LbrET05vP8QWLCJbsQrlc9rn9EP2
         Jj6ggO46JAAiZT1anv1j+EWSjZ/2mvvltspRWvC/sdwPG1/RvLXxyHrU3+kjbbYSc01q
         DmT/QZKPo4pWgC/GAzWhwj0i8arKiLRTq8RQKUx/DaYtZ4g01J/iU6lAeyQPY2r6MBKl
         v11/x91lthqgo1pPWToz8ak6Ndd4DFVa/MGcPApivYgNTiWYVJpTssEFw1zA2d6AkeSM
         2ly/S1fZf8z4lQ+VE1sFV2mZGrazZ5NrdME75SETtBiJh05GXAEY6D4f/7dkxNgqKMef
         dvAA==
X-Forwarded-Encrypted: i=1; AJvYcCWyyinN5oEC1DIx9Ue4mTbCiOGHpOoKHgxa1kiwnBfe68D51uqG7hht2+alXMEi8A8I0dgEBlLFiY408H/E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5eqRpXgCo0S+bt6ks7GwiGPhEoXaDUlpMAxjPCJNXVNEf4HCy
	SXZP6s0ebn2ENwA1rUOPSV0rC/tI00ectv+xDiMpp0xKbY1kD2g+2Y1UKwH8VRFsWK7nySt2uuU
	vBwCixFGOTNn/RJIwv3Nc3Fm9WY6X/33adz30XQoijJ3hvaBAIvyzWDey6EP0j8DwMqk4
X-Gm-Gg: ASbGncvfjaDxl2UdEUaNgXV+ELD4scf8Pkv5pEI3T3ctvaec9qRNoz2iSc/Z4zBYQNi
	sXiiO9Uto8lEH7KSTJBpTq1oXmI6+raYT6yoFbA6po/0ZGUUtP9Q3r1R4DmgMdk+DlJN6avOMk+
	KBuiSr4bNrLKHrvs3hyjWOAgRVG1auMaIQKHyAOL92Mb3mRqJ4WJ/nVUFvCd9yHq7nuL74YKv6G
	1hx361yHU2dHWQGFwRX3r0nGho9OmfBWGbGeV8BR8Iuy/nScBiruabLK9CASAo3tS4TQ1Tv/lcJ
	F9LKCp0vhv/yGPcmHXy/QVp9JDtoCD6tfUUQ4Fw9kd4losKEPKAvnNSv8m5uM+8VCttkecoRGSM
	jbXMrEb4P9y3EiA7TpYmSNA==
X-Received: by 2002:a05:6a00:ad3:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7a4e55f0e5emr7526619b3a.30.1761818116187;
        Thu, 30 Oct 2025 02:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYE7KRGEkSNV/szJQtJrW6GJ04ajU8Iw5/rPjZPSBhZJYdiAQpQvQzRWBTfSYUwtEKM5px4Q==
X-Received: by 2002:a05:6a00:ad3:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7a4e55f0e5emr7526586b3a.30.1761818115675;
        Thu, 30 Oct 2025 02:55:15 -0700 (PDT)
Received: from work.. ([2409:40f4:310e:1f51:38c1:6dec:226b:be0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414035ecesm18239258b3a.27.2025.10.30.02.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:55:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [RESEND PATCH] arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encryption drivers
Date: Thu, 30 Oct 2025 15:25:09 +0530
Message-ID: <20251030095509.5877-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX05w7XZbaOe96
 IoJ0s0pLiDCytrKA7/DT6iAU0hJEEQrNeq4eBn78rW5MYbnoVhr/Ppb4HGFE4znybYrSHNxxu++
 VqH+mZXlu15Svt9KcTaDh/Kxa7AQA2h7bJzD8VhA98+JXmkGNA2jYb4k8UwzS27v5Hro+To2Etq
 WqF1rUCSMvWxht0413es1HKpaHVOMPK50Un5T8W7cnoBk8f629stH1JddyaK8cu63qn5NNTrT+W
 UjTGgoj+nC+LbZF8LA1yHb3lNMtZBQLhZObmq1kfm4tbZJVesTI70a8QgrLp8s4xp9DH5xT96wW
 AbanGIhn1K0CEW1dmL/gy6wDnR0ZADCSlc3r8q2PZArMsVLh/xPZWN0E0RoDAklJzPwvS5ChmoT
 zBIwHWrSYu1xc+p2lA3BTY+GYR6xTg==
X-Proofpoint-GUID: cnIt4OR1WlYX0AZNNZQLXPAGr6NctmDL
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69033604 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cnIt4OR1WlYX0AZNNZQLXPAGr6NctmDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300080

These drivers will allow using the crypto functionalities of the UFS
device, like Inline Crypto Encryption. Both of these drivers are of type
'bool', so they cannot be built as modules.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---

Compile tested only

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..9f89b3ce1262 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1230,6 +1230,8 @@ CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_TI_J721E=m
 CONFIG_SCSI_UFS_EXYNOS=y
 CONFIG_SCSI_UFS_ROCKCHIP=y
+CONFIG_BLK_INLINE_ENCRYPTION=y
+CONFIG_SCSI_UFS_CRYPTO=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_MULTICOLOR=m
-- 
2.48.1


