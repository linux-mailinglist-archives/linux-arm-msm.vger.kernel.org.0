Return-Path: <linux-arm-msm+bounces-85144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A829CCBA78E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 10:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDE3B30B4516
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 09:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC3C2D59EF;
	Sat, 13 Dec 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezSHUNpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGktA4zH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E412D543A
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618087; cv=none; b=dZD+gFowwj7j4+KF3tWxeJ8nnAk79aVHccQEG9E/jS8sigi+RhuMu230RxZxIQ9JY4vEVL6W4mUBrElck76734qsj3adgoVyzcqQou57n4Y8jy92NufT9aJP4f3uIwnpoMV0fGyktkcKiVa7l9/f895AnkiA+wMGbZNejhd8oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618087; c=relaxed/simple;
	bh=iy8F+oJlsSYyhTykCI+kq/JNiXvr57bBCicaTrkVP2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p1nMiO/skpF5Bn3bO+3RUbCdkNTwvM89EeDgjfZV4dUPYB5gBPpSiitzZjPnV5atBK0/Aa06cxUxglhSlnoC4KSkqG1qk9+KOKDvkmm7kMsEW63GPdoZ4Mr2riyUZuJPsC8BB8BoyPuaepncBhWDcPryEidl11+EsOH+cOxIz/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezSHUNpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGktA4zH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD802v21857927
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hOEsaO7TdvSFs4GhQT325z
	gDjl5q0t8SNGY7qatqYbo=; b=ezSHUNpxMbv9Na8XcNJGbu7ZFjEl5zjyk+zWK9
	kHvp28nUHlR+zdCUv7KHiWl8KLVaLBXvoIuEEWMqJX0s218Hx15ShRq2bUbSlSK4
	Z1qw02n2OJifmNqweAoz/nKfAcGTUNxhJK8W9Idt6VsvE+3qzDzrEVchfcknQ2N0
	ZHZUwWIjZwXuuqE2N/H4cIwU6fuvliCnF4y9SXKCKXSby7G2J9ajfSe/rzaKvHFV
	JYm/doJ6akq8/IhL8y6NHF4Gm9DhQYQAzqBhmSrBeZWOYXNPyxLdESuGZC4K+GEI
	ZbfiqMVvkFS8pv6c0sFl74o0P8QuRvTTt+MxnPVvhDYCsa6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11af8acd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:28:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee27e24711so33579911cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765618084; x=1766222884; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOEsaO7TdvSFs4GhQT325zgDjl5q0t8SNGY7qatqYbo=;
        b=CGktA4zHREhjLXOK7m0u9V0G9wgCkXHkvZKtj9no2MZQivrSWIq7UQfaCCKmRHIssU
         mjVgGMiQMDDx9dABzuWiDFTe4jVj3HUdVIUOLt5RCKozSvdHtssmxvh5078SJwliEFx+
         ynr5suIHJdDLg2XgWTTEd0NKOheXl9zY4OKuvjaGo/vqxMM3oqjV9oHT9bYzz9DngzNM
         4TyuVVBSdcx5BtFjFOZUEaqgqpKX5EHJ51NOlKtodlaXHWZWNrrQTXXsz85lcot0HXTS
         UfSwd51M4wZWNfm3QDgrUt4FiQg3EeLT2Y5wTUvvS67CNb1kW+7DE1T0QkIF7rkHWuvb
         DFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618084; x=1766222884;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOEsaO7TdvSFs4GhQT325zgDjl5q0t8SNGY7qatqYbo=;
        b=WjUqA0kY7Iho4XUfjd4zbWJa9KkIm9ZcDApW/Qn0HZaT/CG5OAzcyRozuyUtCPqCeK
         bRF40dk95sP3FsY24rV9tqK5aV6MmwtUdWBMDa6nH1Q2qrBXLqb+XkRVp8Q5N2WXf+bd
         DZqw7VJHYkamQAVkiWjmtvL+lLrwYnsF7YtwujFKAQIynDrbD1LWgQitJNaZOR/1ivzu
         GRSNMaDL1BLWg0dJKAeBgKXMckw9DY2Cfz6VdctWWqAql2+xlHXUKlYk+bS3e3tvOM61
         6+xPv2I0QJeJAiTkuD1iDGGAgZ5iK9lWesthG3fDt0wTaUtliBWgwBAZHhTUEPOYCAE3
         w2Xg==
X-Gm-Message-State: AOJu0YwbGzX5z184avhesmWw9v0yOLZVKvmREfdK4ljgSIq6JCHVB0ON
	ZlAwrmrw0SwLpuaVl4xo3NM6s4Do8koYvABM2cMkmRCvD4oHObz6Vb81x0YV70838Iwcu6zIKu3
	8RmDDDnZFziQSYf4jFdWw66xl3DMuEnZDPDiRJVfEpsnKyslLf01ajBb1esg/Kvni2RlSd8BkPs
	in
X-Gm-Gg: AY/fxX5H/vbANoTlM2loTibME+uxiMr/hfGFDc203kNMjlqR8sAbGdp8osazl2vvaWf
	WJLfAv4Qv4dG/z6U30L89SuLC1aSpgJbnicuyN72MPBv9/f1Bn2hQMoIx/XZ40BlSM97ue+raO3
	nF1e0GKJSCPO1Vhng11h8GhMmjRmbvPBQBWvTLtHrwwVac19jdDIk0gMbmyMysKlzb4QhCpyAtY
	fmxkQGEGsEzQEvHpPakNVKlWw+CTnyEQYU+WsRZx//lcAsHh3e1tJDccVODh2qyVxwbTo9MADle
	ghXv8UrL0x1AWWeDFDtjsu1zM+oQAKMjkg9+LSGUC+GkpI1QMF8z2r/LHDvBUny8XhZxv6OYtAs
	3LZjz2m5/qD0v11u7NlwTPB9Pf42jE6tVj3FaGCxMw4iNejPOjNHtWmrEM6a+aY7ES2ZqW6JcRl
	IeSgmOUYuHo/zBurqFGPsjQW0=
X-Received: by 2002:a05:622a:588e:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f1d0608c46mr67194441cf.56.1765618083793;
        Sat, 13 Dec 2025 01:28:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf8VokkKoGhb0KRyT4kgpN7UyedwumZPJ3iCiy4mNL9jhrprY2oTb6g2g7W5Jk/ARqBcjpxA==
X-Received: by 2002:a05:622a:588e:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f1d0608c46mr67194301cf.56.1765618083332;
        Sat, 13 Dec 2025 01:28:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199388sm2882037e87.90.2025.12.13.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:28:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] arch: arm64: dts: qcom: specify ZAP shaders if GPU is
 enabled
Date: Sat, 13 Dec 2025 11:27:59 +0200
Message-Id: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8xPWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nj3arEAt28xNzUYl1zy7TkJPM0MxMT4zQloPqCotS0zAqwWdGxtbU
 A0Pr/3VsAAAA=
X-Change-ID: 20251213-zap-names-79fcb7f6443f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=675;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iy8F+oJlsSYyhTykCI+kq/JNiXvr57bBCicaTrkVP2U=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6at4QI1I+9tHBctfFYe4rlv/smlXds5u+qexMuNBqY2A
 k2H8pU7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRzJfs/1T0tii2uybvX218
 OlN/tkbI3IKlSl/+Ot3evfWegWmaV8cVdwWmjP07dVr+PnrW9PIAW7Zm3QylQvcXP4/HdO4xWlE
 lfvruusMlkS3hu6PUP34xSXaUvzpRvfNuep6Addb+d89ulRyezaySoMXS/3XR09iGn9/v3uzQad
 FzV3uwu3nXDqv/awwjhfg1NH4W52sxGC5j+MPRWVMbvnh7yPSs4Op1Wj/Fpn6RvmQku9bQhIfny
 KGwC+Xb93DYndOeZrOs9OU1Sc64VtX845FFZ8wu1/6XK2DY69458f6iq68r9NbLTuTruP6+SFog
 IKCcbcd27vVT+I94ukapJ0rGPlRe32B04GXvdofkS10PAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693d31a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kAEHBcRh5SDiOJJTxXoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA4MCBTYWx0ZWRfX5gN2wIIR+EfQ
 21jr++qkUEw2bRCkVf6oZIWDTQ7dk0wDCHErQGxdfihz1sekkhK6lzA6KWLfBiw3JbzsWQRHXgc
 oAptsdxlig1crXUFFNZVLgUhK/npk71kqo3RLzC36W9Kno/ZR6vGd7kDOpGobXLe6cdSKAuIW6Y
 LAFVnAGDrY6FfQXJ71KL1pLc+rdyQaKUL4AibOOvRPhM46N+wxSNV1KwtcvCjw3NxNsHT+jMfmM
 ZGllRfRL7p9lz0hhNtVnVsGCzZeT3/kKHLZV43PLu6zeV74gA18p0tz1up7NKeX+MdGLBs652mt
 fpYGZpNObC72NpYauFeNO5R5RY/s847zwUpl4IYtxIcGWp3TXzQPMtscpOfleeQS3uqBpUJUxPr
 j+i2X/HY43gDT63I3FPDXLu/rTHQDw==
X-Proofpoint-GUID: 8r0OXSM2w7Y0MFZmLh7J4rRynYXXJfxe
X-Proofpoint-ORIG-GUID: 8r0OXSM2w7Y0MFZmLh7J4rRynYXXJfxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-13_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130080

Fix several cases when the board file enables GPU, but doesn't specify
location of the ZAP firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP firmware name
      arm64: dts: qcom: sm8250-hdk: specify ZAP firmware name

 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 4 ++++
 3 files changed, 12 insertions(+)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251213-zap-names-79fcb7f6443f

Best regards,
-- 
With best wishes
Dmitry


