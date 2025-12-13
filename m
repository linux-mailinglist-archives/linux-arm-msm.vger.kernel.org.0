Return-Path: <linux-arm-msm+bounces-85146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DDCBA7A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 10:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF15E30E1EC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B682D7DE8;
	Sat, 13 Dec 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIEceDHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OriiyHrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E092D77F7
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618091; cv=none; b=DslHj2V5Id/xclhRaaG4E6hp5NS+Nn85XtVmi1r6OGIVglqzqrpforCywfOtHyiobW/bSz2sOZwq8Vco3lf8UJlu0YbxTfZx2OTAgMNA3edQ/M5n6zVoa7EcaeVonQ9zQ4awKhHFf+gDXdpZ4Po/lr8/vm337AC1HMx+0I6CwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618091; c=relaxed/simple;
	bh=iJAAN8nauez/jRvVVD5QnyIMXaqxvcGQHl1vpdIJPa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LERZrL9H7HO0fw6MZqOsNi56+xSxjlY8IWTFE2SbyYgKVPTVdQzgke/rqV6PXXwOG02bMydMLEoXL5TOVbcVYcNvk0BmVAZecmIK1PvHE3gu2rGtYVm0sKS1IPeW50lI+tycwZZBezR/CzRa3kyMDlQqmgolxjB2cTFHODMJp+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIEceDHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OriiyHrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD7se3Z2405990
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdcrGwsq+KrX2z6WO/OtDq28WPsVepKHgRM9yDmh11w=; b=EIEceDHjLg3QA/Y/
	b6Xvt0oORfGZ0ViCMr4QLHYILnlxQsYT1605H1pl2e7ocndgoSN/Az9k1mZ7dn2s
	Tg7kQIA3RWQTre9Rf5DEFHbXXW3quYp6cDKvX5YOQWV3HJ+EO/pTdHYoJGvWSqi2
	aJG5oikMqjKwMvcUEa3EhWT5HipMyHhjtomFJN5SWWejsjIktRrwCTzym9+nWjOa
	VMD0/rnnRbqIJNmIeV/HVuLvqa+Q8nK3kUt6WlyDZFqbeLOzNULF05on2NurXfvl
	eWHoLyWijej1wft5KtxBusFXDk0gVLxfGNmOLTorLyTNZQ8/MCAw/eAFJwJtgcti
	4jnwjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t0a60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so44479191cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765618087; x=1766222887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdcrGwsq+KrX2z6WO/OtDq28WPsVepKHgRM9yDmh11w=;
        b=OriiyHrGeDRw/ioaqJ/aDiR5rNUlPz2X5vPmT/ueNZLo4jhpeHIu9CAW/wAWTYtwaT
         DCBGyIkLD2DOU7mCMRjaNV42MtvusH9B3hamGqNKxetbkr7DLEAV8jkH+CFt4hDYPyb6
         5zZJEgeNfeUzcRfuBXZamaTuVxyBCaaF3jWMsDy7Prh9CDVvrgRBLfmzXBRXfmnleD2x
         KvIHiGJx775ciZmYryEaUWJVGPowI8WPLcv0ELQsO6F3GlzxW1CshBbQnbZCJ4y8ZVoK
         GRjBePHgb/vkkda1n39Oo4qg4H0DkD9pfuQkdtjwiR9zcikPxZh66ku5ht8vzhmkTfhL
         4xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618087; x=1766222887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdcrGwsq+KrX2z6WO/OtDq28WPsVepKHgRM9yDmh11w=;
        b=uBf+Myk3pZTsLZ11ky8AvXzgZcQ4cXVqK66q1cdGLHcaS5dvYXrg3OYS7Q0v0Lzcnm
         JbUvAE5BCwgedBYCXFnxuw7qWWmwCvz5zLCnaLOCuGWuV0tEdvRlRzhovlXikaF3nqcN
         oSeU8HL0wZK+q1EyJTCZ2fpdMZNNCZt3efEYXD2KWf+jtsVUJFcAQp1H+INuACyGC+2i
         1jxy9iTp13Sw0gx/Kqv4b8sYr0lCMK7W4tgTuMafYZaiNuzYSulha7YZfc9on8CUWUfu
         cgmzaw8LWDJLdJSqu9UTMSuIMgAarFjHRRPa9ff+85UWzdcTO7kVnQEkyyX/thbKUzSv
         TOwQ==
X-Gm-Message-State: AOJu0YyDm+UdGBXyLGuzmbX+v857GAch8va/Umq/eJBNES1M1YwDTFSx
	tJ2bo/rxHMTp4b6Ui3T+pGlE+rfwpfeAW8k2gYIlg84QP605kyssiNgKa9yXZ0Hdfi7NxZDXU4P
	vjgsXgZUrCnUw3R8+Iq2Kf7fd/1jNoBNrdQc2eQw95fySV7vtHm7sw356f/cGTISxdD7gObp6c4
	8N
X-Gm-Gg: AY/fxX73rYQWUwZQz6eVJBMt7vBEyDYnL/lX9CCEplXKfL265EBDquBhKKVPayULN4S
	Y6jTaT6vTepfDobFia76IFkLzXLl8uRTuCTTN+Qs6ewqxXRYEFPCvztWHxSBmNICxRqd+QeaiBd
	bHaauWHx/5P4tZIicVnE9VQWIicgojBmBM7jv51q/AZ/DapVutMFkurPVBgTN+7g3GgZWM00oND
	90Z9UjpMvf3DkgfDXOyXLJXir+/62IXNZhF0TG7gWLhE8JCLE8iqGAiXxy8YQnMyy60nyO2Rnx2
	VrN03aG1iij0FrMkoBmGUiX+SJg6j4j8DCcot/RtksEtu92CpBg2yoQYTJAUS+l4DM+iO6rWFQb
	8DA2TxJKAEiu7txyWUQKQNuWXvrz8RMHnuDwKAscgFMo/pFkqU75iNWTeWik1fM8la+HCVjtRIE
	IN4UUCjlRPgTKKteL22AcxRnE=
X-Received: by 2002:a05:622a:90c:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f1d04f967dmr67030861cf.25.1765618087418;
        Sat, 13 Dec 2025 01:28:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETD/CBGamP/hoACINrQT2fLmNxqFr0SXDmtwS+FKGa24K9T3KyT9GIZpNU6UOG3+Xnc/RKPw==
X-Received: by 2002:a05:622a:90c:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f1d04f967dmr67030601cf.25.1765618086846;
        Sat, 13 Dec 2025 01:28:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199388sm2882037e87.90.2025.12.13.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:28:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 13 Dec 2025 11:28:01 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250-hdk: specify ZAP firmware
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-zap-names-v1-2-c889af173911@oss.qualcomm.com>
References: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
In-Reply-To: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iJAAN8nauez/jRvVVD5QnyIMXaqxvcGQHl1vpdIJPa4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpPTGgD26RgOQBegPmWO00a7qdve5EvwDtbPmS/
 OFyhBKzv/+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaT0xoAAKCRCLPIo+Aiko
 1fKnB/wKYrN86dcmdLz9Pm6dmHnxEcnZEfin1VaRfSWn6tyTi4QI8G6PLsB0RiYs8IuGoD1V8df
 WIuFwgSveB+z8bn/uDAnbOdIqZwShItkN8dZw/6+oaJFmuBKkdV05ZpzNSDFITrVDBrp0DXDuFg
 U1UdFmQPK38pWDm/RW4V/GQU003KL3g2Ph1Lk4pDv6sKmjaIlVb7w4HBvBBnD3TsngnhmYxIRuY
 Mp9lnv0jMvAf7xT1YU6qYbqDVcvv9gdXLeIYFfcmXBdC2W9+Oxaf6/MyLeDvZkmI2twdORUgJtj
 RGkRRGW2+2hjbarmEQ1fp72IqqFsDqc4aVyrSV2Z3tG++YQQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA4MCBTYWx0ZWRfX1iEyEEh6czYC
 a16ZjE3mSF+6MX0P0DMc3fgI5gmT4WHStogC/loNAdWqC0Y5Zt+Sgq/AWh3joKypQSpvC9xGMDA
 MQ7/U3Mba5FmybFI+oiOuqTUhjXWvzBAOJieiKw4xP1agwvAjXCxIVretFFr2aG9PhuTsc5R9UM
 JowDkM4tCpvUXvag3HIxFPUkasLtTzLTBMtqNeSsfJJnfGj637mw+gDGebIi2zyZavLORlSjxe2
 5tccALJbPH0O4ESEG1AhrpnBYa4Xit2qJoxpVB/+HzhY1BX/SyZlnazv8dYjxhNZJLX+y3O7Jak
 LrvPaLeyIpiRHK24wNsNWVSVkRDXhI3NcsZxt9KB29UWX3KSEiAzS6EPQZRtPhNWTz1bVaKhbdg
 41Cam//d/SPhZ776R7OIfvb48GoQHg==
X-Proofpoint-GUID: 6kFjqX7iTHTaYNm8wtamK5U6bgnIrlwo
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693d31a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DG21z3loRysKqE5jRssA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6kFjqX7iTHTaYNm8wtamK5U6bgnIrlwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-13_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130080

The DT file has GPU node enabled, but doesn't specify the file name of
the ZAP firmware, which means using a default file name. Specify the
name to the ZAP shader firmware, pointing to the file in the
linux-firmware repo.

Fixes: 04a3605b184e ("arm64: dts: qcom: add sm8250 GPU nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index f5c193c6c5f9..3ea9d2b1a7d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -373,6 +373,10 @@ &gpu {
 	status = "okay";
 };
 
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/a650_zap.mbn";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;

-- 
2.47.3


