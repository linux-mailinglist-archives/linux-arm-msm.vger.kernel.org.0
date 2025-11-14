Return-Path: <linux-arm-msm+bounces-81784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E5059C5B7D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 07:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 962383555A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 06:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C28D2F260F;
	Fri, 14 Nov 2025 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDx8yi/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YntjBLMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DD2F25EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100979; cv=none; b=soBYaSaRDfwgz1rsHalG4uPQOrz5o+fo95pdm9u+RXgkwPN5V02UhSQrJ+ZW1XowpY4mm3gQhG+YkgpIg6NLAAYeuSDHAqPRdD2ojLPPuGprtz4ZdYwRdPFtpvjBSW3WIiMAUXSWIe6v8MHf2dXXwPWjotT8I0oCjVMxN60TgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100979; c=relaxed/simple;
	bh=jYRt3RTxaODqx71JYbGheOlerlryIEhNrU+GahhAiQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WxFl6476Omil8MQ5C1W1WpWGc6YC+fVaj1macvLpB1stjni/rZtvL6HwvN2bm8x+aBZDcv+oQ9xP7ZOC8+2SE+NOW4D6q1Xxe/6QHFwvEPyC9b5YhzQcfLQdmK8diOvwYZrYFg6C9WahtrDHQlsbzto558y7oJTwJG6vzAc0wTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDx8yi/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YntjBLMW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb5RZ1699799
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iIICB4zD+7
	WIbFzn9PEigXRrYfFWYcsGOio1bFbTNg=; b=hDx8yi/h1x/OgDJWFFcCeCwz5gD
	jV1syf+cQ2BcYH5gY7Mvds3LcBluTXmW2j+FwHuee+dwbwDW4mXxrsRsHWmIS8wB
	abcOUEseck4Of4pKjhDbNPUaYwa3AwAu5z01UeRZ8EoEcUNYZ7AENYyK1/n8DkKE
	u2FmrN+kuw7/DHoRoGA+d6+M2iSj0NcIbAomonzApSSFs8fHSgLEKybTasDDYdpV
	PXBY7eEI0/spSOQyUyh+FxBT0Vxc9P43NHeYteM0cpqCDC1xl6/tjoKH008vbL9i
	C3S11svUmx2DUd24jd9pA6vfrFAnqL0//YiSK+UTiLmLUC6jOmb2mWLaT3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e12sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b952a966d7so3686873b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 22:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763100976; x=1763705776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iIICB4zD+7WIbFzn9PEigXRrYfFWYcsGOio1bFbTNg=;
        b=YntjBLMW0iiJkCtdk/TUSs3Fj16fMErPm/lyacmz+qHImmTEo98714QtVrQ3MylGPn
         C8hRvtyIV8JkpMUXI/k+oajlhObcG1/c944tmX5fVgt76FCrkrRndbHS8rmMCwA/YAUq
         FXruRgenHoLqWFXIlVLkPYf8LP4kVZf1G+b5u7YcxgqwHhFYmpQLNVoX9V632VpVJ0V8
         VYDTOLAiDVubkoMju4yx6jxeKTO2P/KThwtYskZ/4JZT4C7RknVdUaa1PXabInsbCI/U
         8fm4RoKafcfB2KrJ7A9GKEoWvg+FkrVra749Fle5sxCtSJY4mEa8EIow/1mAqoOrvzT4
         h6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100976; x=1763705776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4iIICB4zD+7WIbFzn9PEigXRrYfFWYcsGOio1bFbTNg=;
        b=SVY4p02z8MDMxwnKmy1SvXO/AFjvrrWJ5sCoc7SVP+6mpUSRIa/NGU9FoYk4YkgdW/
         64YgfAu9BWck9kjD7SGk1eVvkGrcNfXVLnuTZ2DM2tLlVw0ouvMLih5Jmn1t7+X7MJBr
         pqloqNPqJG0MX0RO4hl5I2ATAGZ3pjSDhHjkhQ5YubEkb45gYi7CS+PHVmBwwsv1fdyy
         drn7dlBeRXdiJTtkCmkcV83ah81RDuVO7+CmSz9AvZEdOFChFvvsTFBMdmZtMm+0cLLo
         yzjcmtezlUXR1DuZjC/wOmPu4BqZqRRk4DKjWDFEeTJarCs3BDipOcZfZP03VzYawPbG
         D+AA==
X-Gm-Message-State: AOJu0Yz+WlvBECiCT9bbw67/JqGbFT/AfD7mfhATckBxhDrtI0rHUhtK
	KIQ9rQMCJTdNAZQ1GLjFnTAVMM1grfkjle1QBPkY29uTm0MK5GX1v1vyo+wJ6tLu4580UCo6ApC
	HP2jvsgQ89FEZot1j/MUo8OOyJXKH6j+vXJuiXNuE8FO2ASYlYlVXd3g4ghR0NdTX2NhE
X-Gm-Gg: ASbGnctTbJfY1gughZ8A6HXFjq4MoxuVe4hMuojiv4WpZZTyChoTeMD3WsW7rZIVdNb
	A2g9nQgq5ZOQYFRCs9wLTIvtuPjFo08NGhZS8XfdesOq5XEnzcWM3JD3WRb/zJUIZ8zfBotjcoI
	U2M3NCKvmNkSUBn4Q9wILSm+k5yt44GWrMl3qbO6BVInIGD0kC+RJF2J/URrwSLwDIDMKNHefIm
	jv0Vrn2fU29TXHnrXZLdbuLtp02pGipikGPBflOLp+e7Cpl5SwkPx2MIBGU5KN6HDqmgwpDfQ68
	Qn98f5aYg4Rx3ec/E4+23LAxtcTWu4wx+yvWb0KeUSLhwzzkfJ+vZKky1EMLDMMxxT4LKZrIpvB
	Kzd6grOg8OO6l0KWKL2eJqemPfIjMVQwMQSk4
X-Received: by 2002:a05:6a00:2d87:b0:7b8:6a99:f795 with SMTP id d2e1a72fcca58-7ba3c2725a3mr3423558b3a.32.1763100976463;
        Thu, 13 Nov 2025 22:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRX6azT93c8/2PdjDOhuMO5luLCeGrLQdtXVamXYD5TxuoI0SWsY/+LKcrYuTj52EqYgEx7A==
X-Received: by 2002:a05:6a00:2d87:b0:7b8:6a99:f795 with SMTP id d2e1a72fcca58-7ba3c2725a3mr3423517b3a.32.1763100975972;
        Thu, 13 Nov 2025 22:16:15 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm4021223b3a.66.2025.11.13.22.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:16:15 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdx75: Add missing usb-role-switch property
Date: Fri, 14 Nov 2025 11:45:53 +0530
Message-Id: <20251114061553.512441-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
References: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WvBhtcHz3i4L1GExV8HkLO1fxpJS16Ld
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=6916c931 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iNHPuiuMtRvPBLkl12UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: WvBhtcHz3i4L1GExV8HkLO1fxpJS16Ld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA0NyBTYWx0ZWRfX8J/AjZ+G6x5n
 lOBcPgOsygEo4xFfpuHZN4W+IAKPzgUhnhbULCIlLYRmPqZihxW9U42tMk1kR/0PE3g101xyVxK
 PKtbFzJXZCirOAznoFBNq8v13zU73HueUOEEA1WNRKtF3Y90B6yfsi5Xyj01RMXECZ0ujchvjp5
 SYWUtUF2fTf+PpJiq3Ku3w0BMQPyZu43OFf4qUCyS7MUkfn/w8lvRmx71J0prQ7dxQFOxX91cS1
 9EfqEbVFZ6tbHOJXYarQ6zU0NL3d0xEud530rB88rg4vJZBAjxSCvSsmNPwLQcH9/qDWm6BUfd/
 HRtflJXeBxJpXPG7RnZlSG0DYWkYMFtzhKAxYUZkppPb/TbEOF0/PzFEmKg61V3JVHCuKRno6Ji
 +ia6yiFIP4ryk+10aJjToSm/jzo3RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140047

Add missing usb-role-switch property to usb controller node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index e586b55c155b..6e7695146ff8 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1074,6 +1074,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
+			usb-role-switch;
 			status = "disabled";
 
 			ports {
-- 
2.34.1


