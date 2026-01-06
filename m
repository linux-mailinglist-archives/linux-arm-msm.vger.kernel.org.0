Return-Path: <linux-arm-msm+bounces-87655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C3CF767E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0F063036C76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DF93093A0;
	Tue,  6 Jan 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dfl406cZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfjKspML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1D3112B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690481; cv=none; b=DoTO2nWkBBuMUG9JmI7RVZrkSQl3dp21Ddki2N/0euwbbFV+M0QKehtTcIR7vtk/V2rGS/sFGwmleIc5vIaUJ+IsZTYL+/DMgeZkLJ4S9XDpE4v4lgpxJG2syN6pkCWzsaBSz341hdkYNWvQwUsL+Weq9vv+0oPBLavOJoEcWdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690481; c=relaxed/simple;
	bh=+MztaN/Rs+ElTlSup0i9GMFOiElYpYi29R9KCwweFTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Im52xY69nMGDoJ7XD4YPJzL/hd0blqed4dszAGDIse+h8876bhUJnsZip9MkY/0KRt5R9Xjm7Q5NthZWY9MzLm9N6CGaGiVRxgMHIWwXDZwK53IwZjwZdNr3KXt3phN7LaxGgbakie9uTeCChi4UjtwMNkY4UiHRw2Wjp+8966M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dfl406cZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfjKspML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649fGr2255371
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jgud0juuzW+0FS/RQDcYMC8ezeyl5Oi2R+cprSqxGw=; b=Dfl406cZQsg1wYeZ
	nMWAaBeJcjjzcYwZ9cUFu5obYtQNWEZyo0gpwuR4TQG2VQD0NF7EY1fhdaIHoRkF
	E9z0wAPDUiRZs3KlZrxUDqVXoN0f0zV+iP1z/RZEbcPy4zns68fp/r6bFtPEyoYf
	xkk6hWfgBJBgJW/L36PqD72f3HKv1jP2srWbV7nTzeSei5d1Ly+c+/29LCk0BvA1
	5SmjepEZOrvohFDvPMXq4v+MdOWyYRrohdxJ7cIHXm85aaR7p79wpXIp58K2KBjt
	VoxMUEt5yczYLzWURMATfYUSzCtolLOSmHQ8kMouXWrkAoC7tNG3j2XHLfCaZJC1
	yU10xQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420u0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:07:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4ab58098eso20846701cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690478; x=1768295278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jgud0juuzW+0FS/RQDcYMC8ezeyl5Oi2R+cprSqxGw=;
        b=CfjKspMLyb7VwWOfc4YVS/L1u9fYFTKVocTHOfwPIg+F7a+NK5kpBgA7hRGNCAjla+
         LAG4RoK7Y35bF3nt+jS9DpL4Lo3pr+qtOzilfgK397oKC6AjjKcmhpRDVMG82ry4c86y
         nlqMA5p2EVabQQ5t8mar+eyVtXYiXBgZDVw+zwbXXVAJNU9G/ZaXu2E+gRojS373yduS
         o8ozm4B3/cIm7nZTLPUSTmR1hLO/1e6iHz0+dHtEz0ewQ1IT+9OxQwRY+wCom15F2VXx
         6k4vHzAjfUzrbcJho9UXCeBvoH5NpZm+elqymz1AjCsgOOFqUx41aWUL3mterkf9uTFq
         Q7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690478; x=1768295278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jgud0juuzW+0FS/RQDcYMC8ezeyl5Oi2R+cprSqxGw=;
        b=bLsjM00aIDLTNysjnWB8GGszvSgdsHydX4uYpVkI2hO1kr74HmEJIluNL/Z/QjKsxw
         o4gEemXlRWIZwJ0caerQsXj0eXv8L4RX+wRwFGWnAIrCzsZbhSM9jjw6yAO03NuupUsp
         XxBxIEsFkAv45FPiX5CSi82EItnTvNDfAZLHjBU37MN06AU76XXJoTrDUK+PmZ9I88cY
         NH41VJil/VzzncqtathdZFdEOjNyxO6cQUR3mfb6k08kekDV8VioT9t0YHbETs3pJxfx
         2jlAgcUiewPK58E4HDviJSwLSqPkFvc1lKTIF7KEtuSAnlwIlqc1WWjUQ4oEI9WvnQ61
         YqLw==
X-Gm-Message-State: AOJu0YwwH/ULI1H29caQPP+yQgtn/BHFNCwGCJ0phT8UQSEb3bM4dtxG
	p/A1aISfjKSChDD0PKKrk5VJwN9V34eZ20KUdS59nhViiGPFaAa++szfKbmpvnkfEdW3PhZz7rl
	Xm0O5yCO+H29RrdA4eHlAh83Ly5QIhIbIcF6b8RhK559/PDYitlztGJCFsGQ5PUc7bk9/
X-Gm-Gg: AY/fxX7r4MMyfXnTFsUlQ0hNJQeX9B/JBmYcpdS7u3LFO4WtQjnY7CeDCbl+RVW7GuS
	4enGiwItOOuxATR/T7DN6YiKBF2jSFbTEY5QkeYkwUyGz3yHpptJ+F6/r5PYrlnZQttZ2fc+4tk
	otBtC94qWZAKpN/Fi5nwsX3RRz7ssts39LOBNRK34M+o8XzW7/AZ5c4FHNXG236Z5kywc0I3rYI
	IVRt0FkkY1PJmLfeutwdtXCgPrRoaMObaWaIQKafBJp8o0OYT8T9Rg6/WehEzsjuvL9AgI9bxwo
	dJ23yR5zuMb9vCY5ayiaR3Af9ITRfvSrLWSPlKuHEIgeWzvbwt710qdyHIygaGWFEO51ieOHEYz
	G1y/UY2a/rUXsw94cVm82jJ9/n5SyuWy0Wg==
X-Received: by 2002:a05:622a:54f:b0:4f1:dc5b:44ab with SMTP id d75a77b69052e-4ffa77a8cedmr27677111cf.45.1767690478114;
        Tue, 06 Jan 2026 01:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+kzLrzxScPKjJFwNxSlEEDHXGZuRhIuh1BKIp+D/WpHLGWscQ83v2YikOcmQnpSAJ1X9e8g==
X-Received: by 2002:a05:622a:54f:b0:4f1:dc5b:44ab with SMTP id d75a77b69052e-4ffa77a8cedmr27676841cf.45.1767690477547;
        Tue, 06 Jan 2026 01:07:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2bcd30sm176270166b.28.2026.01.06.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:07:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:07:41 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8750-qrd: Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-b4-sm8750-iris-dts-v4-3-97db1d1df3dd@oss.qualcomm.com>
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=636;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+MztaN/Rs+ElTlSup0i9GMFOiElYpYi29R9KCwweFTE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNDn8mfWRUN/LiZnlDCHPgajtwkjulxvvvZ8q
 4usgrZXUaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzQ5wAKCRDBN2bmhouD
 14bjD/0YojgtEKqxBzkXkNEKx6PzL0ZgFy+fqFrAueDxP+laRmhK22QpQplyZ0xEznuRa/1z5Ba
 /O5f4ejsckrIkpV1+b7A2ctftdrmdS0iHUZf74aTdPIcy50ziwAXwyxgv+XRCEznQd2iAxU+Egh
 Fqi8uY6HDCz/swaqR5Ymh+Orl/aiF4ozFIMz5nrG9ululRjL/I+pzqqdeb8GMX5M+063u2QqTZW
 2tcmvn2TBO8dsSGio8AlQvj1qISh04PqwBxY5Y12bEt+PuxNStibeqyAdxJrW+GQZYXLqruxEAu
 GDMOxG22LOsch4FTmFb8gGOaN6c4jT7I9HTcf5dmUYfFa9YWVg7PrmOuGO1uBcNZL69OWEuLAo5
 sG4LouDTYQgbjAGK8k8WsmjVzJJK+27tfXQIZTdFlmWg+KrsAoTmM1CnKW1tmfAE1TWGqZTRF/l
 Fvc1Pdch5Ebvdo5NGJCS92i0ma/LC9XsUS2xZmr5TPsrUuUtI+6uGwYhQudgdWzYYbob+0jbLIH
 CWnkL64buaQnO3z/Es1Hs9Rmdd0s6VPYUbJpql900kTV1RJQW3hQCaLv47i4m61ROD8X+Af1wHf
 6MR+P7rxS5lFo7LW2lXJE2R/cCjBuQNuO/Vqz+YHG3dy7DbeUb/D/f0I1qPJyLiW+6YdP1zLtd/
 b+86lrEKU/e3s0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cd0ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C8SYT3WHa0AdL4wi_OEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: eaXAcwAG5MlMd40-aQNAZPrP3ciQSQ0u
X-Proofpoint-ORIG-GUID: eaXAcwAG5MlMd40-aQNAZPrP3ciQSQ0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX9coBiNnGxgfw
 /ua2SVPZSvaYZwajKB/sCU8sDM+TRNRpcxMbasZ77tHIm8LTj/k7r0GgrIF1YHedz/pKB7qjDSq
 lxJrEprLkbVt/F3FE5cTfO995/s0WvRbpaW6Sil+e/y9FjT4axUnMBkBTmXd2TwDAt9N6KHQ1gT
 O+9vvl+yTYugmMrN0xHd8a7Y0ERBZ5HYlW276MwsDKfFqefe/xgP81yy7r+I61gEX6pFNOj0YRU
 5FexJlJdBI6Ogot7vtotWrl6O3CnmsoqTld3arjqePyUjay1aTfbAymDFk/QrmFKb1lcLQpSXDh
 jDrFdMmjwJfyRPgl63YQUHqW5Lv/Rq3MT19acFdeic2BCeMaAjUAN/AQ8c/SuWCunVDiAW697cd
 cYNhKa+wjHhRPygzP6oV2k/GLidBQpLfrTlRSOWjOAhGd1lAAelOfArAV1ujZISvHkir4NzFYYs
 GvaXxT3cx8qASHQUjeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

Enable on SM8750 QRD the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 439ffb202599..801c46d55602 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -858,6 +858,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 

-- 
2.51.0


