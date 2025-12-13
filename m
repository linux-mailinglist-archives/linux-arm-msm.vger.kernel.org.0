Return-Path: <linux-arm-msm+bounces-85145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A4CBA794
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 10:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B198A30C2BB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 09:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0652D660D;
	Sat, 13 Dec 2025 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkHw8nsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMCuD3ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811E2D5921
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618088; cv=none; b=CJS4Awfi5JE/iBnjaAEuqX3/X5QAAmtjINDtPQFGs/Wi6f8VGa2E/jZDJtEXZ+ConjwSfgTBfYoIhFzT7FGz08kmt1pcYskO61EyVxGk9fAomCqUeI5CoQl1bBVHtqAmumOYszdJxPWbVqV+ZDlwPrUXU5wtsOtVSBQiZPtyIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618088; c=relaxed/simple;
	bh=Q75hkTxRHlQoFHZT9VQHr0IXAqQLFYv+Z2XFiMz0eDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQk4epSu20zsVDBgIeAioGea+rsanVsgZUTMn+/1posYoEnGxk6apNeO5rKN0Dobj/voiVkD87UnvenzMcBURgvQ73uBRYu5b88ATJZSgK0sI/uMHzKyqmME80s7x38v4qcpKBTGB8gRYn3/FhrOLPXBSzyR4HzuKVMNkxXrqWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkHw8nsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMCuD3ff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD7hXM42383043
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FB9n99JrAMtAXD3HgO1fQtc9vkczcZgKr3RYxZrrUo=; b=WkHw8nsvxES1179y
	o7tUSWzKN1LQjz5xUXix/J1vld8EmuIZtYiRxlRwkVqrkWjlrQPKuJMO/eQH+HCc
	yJSsywUWm0Nvq2zAeNI/P2xVnVvRa5Tcx2dWNhMT9IslTndD1RnfgenSSkOMU9Bj
	j2NiKIeIWuQ6DslgGOJsIp7TIuAVxzOJ5o+3Jcw+CTHrPyMHV1t9OR/li6xQoUDd
	GXodlgqLPD/TA9JC9xciNlRm2QJ0GXO/7Ee/QXd+tMeyoEmEXTp/ONFdtzfGBFlg
	GIZRsfeR+2aqCdui3C98N4h2qe1rAXhAcGCoRB7YcLb4ZTwkzn9IoXGCYN0AIO6Z
	NXQXmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t0a5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so44478841cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765618085; x=1766222885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FB9n99JrAMtAXD3HgO1fQtc9vkczcZgKr3RYxZrrUo=;
        b=ZMCuD3ffRHhAs0SSLf1V1fjAHx1kL32tREs5eSUvqvJaLOpw5lfiNKxloWMQQjtIPm
         /Xxi2n+ESclz+j1A2dKjuK1t044YL4pv5M4LU+CutXmeD4eP8KXQ2mOrz3yQVCExxVF8
         CTprv8MmhPF/4OUbgZUPIDPlwtCKCdPdKO2TrsDwFaf2UNPQ0gxM+d68/EzUiqHvanqn
         fxAvAa0UqBS0JRBLlrt0yQV8BwT6IlDNuhdWWumvRk2Y/tuB386zS/Qdqhfgrii8LReG
         oBBUjFxmbQxzLxHoj30D/LkkTJFACG0iewRVE4lkkEUJdPR0tf6TthLA70a82Ox6RcDF
         BcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618085; x=1766222885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6FB9n99JrAMtAXD3HgO1fQtc9vkczcZgKr3RYxZrrUo=;
        b=NnlCxU4s66UhlcegRrsw87tQ0zdVuNZFm5NmCBKtqCoyefc+XSxN92hkpmuT6rCe4/
         dhdvTEpKxIZyKSbtvkJD3cIUINILYCaj6s4aLeQHu1++3d54GWzsVbC6DztHN9pSJ3Gz
         55EWzcg9bLDXselwhU44EXqZ1HlaqgtK9QaeMRCkk7Jt31/tF3E+tE82UxAXOOgpmrwg
         TbKeityRUppcXEi6JV8WxVdNWSRLLfCxj3BmjOhFZZ8HQ+BGOwhF1LSua+WyIghh6IVT
         3PZpFs56T0GUJWybyMM2FkkQL0KQZfIWikNuLUcnQzY/26LFA3fCCMM3pgkUxmMYRvur
         He7Q==
X-Gm-Message-State: AOJu0YwM/B6j4vRdV0fa8LndB8JQsOCKRKn8AgpBTAoevzu38D6r3hmy
	rud0QbcEWz/1DcCWgpYJjtGxamDyyWHQ5Xe3Nv4Nz+Q0qDWCaB0uTk1twkftzoyiMYE/JxaSOXX
	humhTT7BXxVG0y3ez/N2Ds52xeNrRGPKhijr8/EIFPqIiEtlrvtjAa344eZKStqUxOpe+8jhkqV
	zA
X-Gm-Gg: AY/fxX74gNIKln0YFbX/vzX1J3xsJsDHXtq8JL48H72gaJPJjQTU/Cmw/+/HwwYX2HT
	tjFWWEnTIkteldRhekP1oi0Ryl4CmTXl8p19Xhf+GvrpEOnXamC/tbXO3j1dTB/Ny1CUAB/B+g3
	H8XM+FDJzpoHicBNFtgYadBlQ3rICn7xaRGbgZgSMmwLXCeFT4mKL3ubmdd2YeHhOChS1xD/b4c
	XcDhhXtb+2qzFM+/kVbZj77q/ypddo6jevHBH0NENbNpUYZVsK9FjngOE9wkgW0j7Ny/ltHBX1d
	h/HBEIMtlfcS/P0GSBmwZzn6+D3gUc501jdsQaOsgHWXq7gymk/Z1oLhuk5gbkkj7Dbi5vSQ/BJ
	12ZDz/6fGKx1PCvrx+vkXealNbV7l2xHOIYoAZEnRgkn+4ecw8/U2aVTI/O/8++e9mHtIUofXWS
	Ov0iZXeEhiw+mzQ+HA95VxkyU=
X-Received: by 2002:ac8:6f1b:0:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f1d04f963emr72665761cf.24.1765618084910;
        Sat, 13 Dec 2025 01:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwLXeyVnU6X7D2UI442nfNfVVzaKbiz94Q0JLj0Dp4PTnlpFt+wxqVuVNqKf68uNzNaOndyg==
X-Received: by 2002:ac8:6f1b:0:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f1d04f963emr72665621cf.24.1765618084502;
        Sat, 13 Dec 2025 01:28:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199388sm2882037e87.90.2025.12.13.01.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:28:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 13 Dec 2025 11:28:00 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP firmware
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-zap-names-v1-1-c889af173911@oss.qualcomm.com>
References: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
In-Reply-To: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q75hkTxRHlQoFHZT9VQHr0IXAqQLFYv+Z2XFiMz0eDU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6at4YKUl73u9e7bsnLSzd3tf/iEpz7u6VkpUrz83P826
 2uCWv6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIvCn7f4c13nPMLPdUr6/4
 rW7hIvaeSVD6bfu8xSZhHKrXw/32HVuvW2md/qSottBly6WtCVYi9+6YH2g2P2/panRVLkpywbx
 6ztNbjfVW+7pNiwpZ+6+hJNFJROuLe9lc6/tZj6OjnAKn7VU0Kzd3KIiq+XmCT086z6ubOVrJzc
 pXqclVq1hgxoP5YfuXLjnhujPHY1f1eZlg5aNBCxRPLzJkyVlTtvNUyCkFoZUzdv4QeF6Tns+64
 uDseWIVWwyOBz5qmqHXIv+xXVD29W2v/ZmJ/a+swo94y6dxKHAosE6Oaiv1a4jk5Ak88vZ3nZ/o
 goVtMsGzWPrKW709qhMOFc62ZZuVymAm0b9m/cbHLgA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA4MCBTYWx0ZWRfX9NUKB6UF/okD
 MPrEb471Cw+fQ63twFFHCUJreSPZ6owA2TqTGBZ9qJD7HcwsLRb4f6Y4vEuFcYVI4Vr80WuqLqK
 lW/Ig0FgP3c7MJJ3Gx6Mw1TmPr3BhFKHqvL9PG0BsKreEWrMEd4gJHWwbOtY95HHbIFUpjEdMSo
 +YvwDWzDeLTc5iAy1wGpJj1WQCwSxbZZyFA+daQOYH04gB/A9/FYe/kSwyG3dTEGEJMwS6bg6RD
 pX7sdeXgJ+rmwS8GQZO4rsC6/N0Nw3TMKkl4DqXKrl5mFOKNL1lCuT4gTz4dFWtKaY2J5phAgw6
 36SYYXpbJOBZb9lrEu7gCbVfIf8ZaUqaXybIzeE0b31oTkQ8+iRnfncyBUCvgZ4qBorPBIb/wZ0
 UI8LCAwLhqLAZ7vJgXyzUxwJTokWdw==
X-Proofpoint-GUID: doaeG3xXg9BJmVO2IqFNrSx5v6H-QpeR
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693d31a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mAWmAUWToQKPzkGbk5IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: doaeG3xXg9BJmVO2IqFNrSx5v6H-QpeR
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

Fixes: f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 0339a572f34d..1eea9c5c6684 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -387,6 +387,10 @@ &gpu {
 	status = "okay";
 };
 
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8150/a640_zap.mbn";
+};
+
 &i2c4 {
 	clock-frequency = <100000>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 12e8e1ada6d8..0f2d511624a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -358,6 +358,10 @@ &gpu {
 	status = "okay";
 };
 
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8150/a640_zap.mbn";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;

-- 
2.47.3


