Return-Path: <linux-arm-msm+bounces-87819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C9CFC992
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 079493016AD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044A827877F;
	Wed,  7 Jan 2026 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjIzlr1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqdFp7ny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B2286413
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774487; cv=none; b=qsZWjWXAcd7McTb36QyVd8ad/PSOPwOJKSTk/rbl4RGwZtYxtJFVQ2gn/QpLfqv33JEeDgIM9juc1bATDRKE/QAMZnvAWCw+jrwct6Q6cb4bBryduGb2ovJEQESgXhO/aScTpQwT/JTeiMECwyuNWOOZNJwz9MXWixH30H76YK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774487; c=relaxed/simple;
	bh=YuO01J5cCWly3QRXJK2VwnsCcUL+EAOlhGOT+tPLkLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNkp+0aCZrWxMloyyDSt1Ph6Ku5Tpy3Uxa7FptUOGZ4wkBV5ToLAZEPqHiKqBHxVObq/ReFYXWVgqWd/hckXTEGdz59P6wjcqNatVai5yszepgWNVzq1UVu8mOwBtpd9OmPdRwvWUc1gZbEdMScHIO1DKiT/fVh268WLJ1t20AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjIzlr1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqdFp7ny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m0vF1642747
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 08:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=; b=IjIzlr1R3KKnDL48
	B4snHTjz6SONqjd29mx4uQZ3AvJlUhmn02XRlKxkp+RwDNmsJVBv9/es/IYnZcl0
	B94OoR6+JlMDnB3ABDSZCR4N4Sah3Eb0y5lyz0D04hjVx6VmV/XEubFket4cuE17
	CY46JeOZ1m5HwWTsCfA8dirRd5Xxf7Gq/kNq1YJU+8fVNDW+B4+K4iY/QryDH6/P
	edEe7CYGA4XR0peZ2whHfhBmUklhHzZK21BqVg4DccdxFDHnuMtjTwSbi1Fx2pnw
	hsUUL06lkeVTpphXAMXEio6Mhc54SPQhWZYGUGA17WP+P3TY/lSYNDCgRWQM40Gy
	VNqjKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgmug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:28:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so52087961cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774484; x=1768379284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=;
        b=hqdFp7nyW05SypdofsnhU2PsD7DYelj7kJ96jlfB/Cw8GxNgRi0qtaky+Gfq8/8H6g
         Wk3dp+QuOU3qwbY4WDn8IzAIkUL7ex+vBNd+8dBcUS04hJYH1DaoY2nqx3wIb/XtF4oG
         sns64KwVwwqdlKNOBuP1BNGrKlzvM+cWIwJVabExT4QlpttjXDGcq2EtKRe39iM66awy
         VbCPrdgwuT+2qXulzXRsIJ8hukXnMb3iWEfr3V9q9Kj7gRnDoIStuUT7nOsB9KM9tYOB
         iF9IkmGySxdMeGIhFwA3yK5V4yqNINTP/xyz8O5V+KXydOd7WIdTX50bUXFVlsR3Dacb
         Mrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774484; x=1768379284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=;
        b=smqXX062HOKcEIBIDg48+/kFZSCcnfw6AvxyIlXX8MlCF7o8gDoZlQrFoev8eJdMkQ
         sI+564zm4Z/mVdfV7aWyRZeN1W1zBt0YkNZhIaeLoQ/c4wvnGtd9mmuLMc21bEI9BPfD
         UH0javkR4nb/oOQQJbJLwVLxyQu7kw9AnZQC+4ckejkvvF0CGxEy+zJK8NdvDkzUsF9M
         ncwXrv2lz1XTIGk/I/SGgKNI7ijwLUQSltZStPKHmNPxiQsLMu+Io8BCGniKEaf7vCpz
         TNtYyHFe3YMyLjNUxB9U01jHsw969EfhoAwGxqXz2wKVnf4nmY8iVq5RETOuePzSYhbf
         v5eg==
X-Forwarded-Encrypted: i=1; AJvYcCUH2pMc6sCpnAfFzG7EdPPpKFhJP06jetTSvS3/tLINIU4hN8yyfChkFMyrDI4h7We07eXFokLNHeSJ0KoY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0x8mboz7SaOjuTBFjwblrn4baNvLGmhrMxHW13NC0d6d1QnDs
	vnmRHj2i6fs1cPnvRXgQDpYESZq0fN/EllUuDOUi8U2XGAykmJSW+QK0gn3Vjl4DhslbPV6MLAd
	FlHXgugF5q8IUvcx0QgNoO3KU4yb3fLGeoYKcp4UcCsk920h0pQYL9Bd6hhQVl+Xq8lFl
X-Gm-Gg: AY/fxX7Es+JcbPFekogBauxQ85FPy72nxb4SeN0pKTb51fU/2UJsJt5WztEfxhHsEKL
	B9T9oBnT7IhrmtkeqccjfnoIn+v7ycLKrBYLaqlcw/ErdHAk+5Lfg9lTqGSvYyfV2amarwAybgt
	NcQhKYM8rSPtLnuI4F9YxCY3zHtRjpJG6RVqOBOP5OuFNdouvBrpjkOr+b1xPmyDMCgXyfdh04l
	O2Np38beQdjp02Gn9OTSgWG2QtRgDvjA2rZu4gr5fMHxJ2SlvkXp3AEfS3wbkSvSdq9qow1SpFR
	6Ya/a6vXWyZ5zF+gZGFwzLivb5M9xo9UCujwX8aLsnms01d3bibm004NiFhsOOfLwSLfRa5FL2i
	UqBhk/jOC/Nf6952YIFpMFuJ3+zbyLmUIb5uu
X-Received: by 2002:a05:622a:1b9f:b0:4ff:a40d:d2b2 with SMTP id d75a77b69052e-4ffb48636f5mr24099481cf.16.1767774484658;
        Wed, 07 Jan 2026 00:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1MiIvYcTnGKSlwitEUnDPbVgoa6OjhOX+6gyCQTwvT+xhiYWDPGcJ1+Nnrt4tdoBe4eljtA==
X-Received: by 2002:a05:622a:1b9f:b0:4ff:a40d:d2b2 with SMTP id d75a77b69052e-4ffb48636f5mr24099151cf.16.1767774484256;
        Wed, 07 Jan 2026 00:28:04 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm8276575e9.1.2026.01.07.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:28:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 00/14] power: sequencing: extend WCN driver to support WCN399x device
Date: Wed,  7 Jan 2026 09:28:00 +0100
Message-ID: <176777447710.14370.7888531422852179019.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX04SR+dMSWrMq
 YhyfwhghYmA75pZMHarXhDWY6ufWzGtZja0CTLvLTbBkrvxedrZS9pIoXhJWilE7UjAhEkLe90T
 mKmD3X3OYCtK13FulUDvkSRDyxtn1X+j3RlSg8Uq45o/Rtibrrd2mltvrgw632hoCq8pcQepf6S
 ETQrxQ78jbfsulhtY/vZFKYN1+1HfxYCr3HOYDsu8oviWDst7wIQBoXIs1G0mSyVnIukSLomH9P
 wp5P+FG/nB42MUjxoPns9OIKbBUC0RU3uswmfODRnUsuwe9++prZL3vYDYuXYiG4oKtywJeoQlc
 hwEZ4uBJvmZmSxambBzbmuzn+0WzEsKK1cKQJzPVU/kngQ3tzX2Kh+Y0e9HF1UBonEFmHeumiyR
 hTPVzgD7XcgFcwf/Ex8lmeinPILtNJyazoWwSl6KoM4Q26cY8rCMU//3GY+pd7mCmW4mpbVwRzb
 ky0VwJzVI8c8r3bC1CA==
X-Proofpoint-GUID: zyn4igDD1neT0aE0WvpIqQb1KDjVkjM5
X-Proofpoint-ORIG-GUID: zyn4igDD1neT0aE0WvpIqQb1KDjVkjM5
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e1915 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f4exIScRoNMJIANslhQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067


On Tue, 06 Jan 2026 03:01:10 +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> [...]

Applied, thanks!

[01/14] regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
        commit: a5fae429ec2ac72372bc874a0334a7fb9eadee83
[05/14] power: sequencing: qcom-wcn: add support for WCN39xx
        commit: 0eb85f468ef515fbd2538375ef3884f6dd376382

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

