Return-Path: <linux-arm-msm+bounces-80475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C931C3705A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF6F31896F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 17:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE73B31353C;
	Wed,  5 Nov 2025 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv1Ko+wN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kErZmzpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED92E92DA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362709; cv=none; b=TlLvslIquiDU4dJuESB0SKimI18lfnkfmYAZoXj9Pv0sgzJa9Z+gK4qRfjtCv8V8+eWgQDCLy0t3DALX+fhgvsCOD0/E6KzKyvu1ZCnm2y5mPkY/l545KRFLu+PSGdCDG+CMsKc6Xsf7JJ/ws6KWZa7fXGTGMh0udeFLM19Biaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362709; c=relaxed/simple;
	bh=1HrAKtyYUdrVyuuovWuMNnd56RDUBrlDUBzWZKbtq7k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=be8X7TbAJkvIiLFFIXWOwl8o5wRaNA9A8I6Jqld+hOj7HLvigpW7xrdYlpxGVgqzm8NLJTjbtqlFVREjRyM22mjgdVTVLag4cD1HPywJvrIHLOJzHyW4CoKLUnfpKiSX6rfCiw5uKHgaWxUM7ySg/V3BMMlHP/fpx8d7N5VHiio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dv1Ko+wN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kErZmzpx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5DU74a4012465
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 17:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EELpuX0zlx92nLlvi+qer6
	ygD1MEAP7erC3Z3YTSLQ4=; b=Dv1Ko+wNu/r2h+/Up7YJyN6X/5vt9KsW0EY5L8
	yQ9U8Iv8Roh2OWHHGPEhm8pLrxmFQPLARgQAgi4SDRgvqEtdr/HGIBTX9fHSTZ+/
	DvR6PfLR7+BomEkm1E7Ffcin3vh7HoFcWGVZoOXvRy8yvna23ctAjLzEFkNvMEtK
	/KiZlYFHtWVabqvkSUQfRtIxuXlWPFbl7zSxJIMEwTrkt116rEABt/IMumpTTbNO
	hfJ9ReL5YaJr9v04clrcrs4sQyATrIQJFiIVOtJhlyCxaGHu1M3tzDlKA5Iud1tc
	zuIgbLWFAsSVzByN7VrDTaKhHD5Xllvt0D05jrUSYae1dulw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwt0yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:11:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5533921eb2so15688a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762362705; x=1762967505; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EELpuX0zlx92nLlvi+qer6ygD1MEAP7erC3Z3YTSLQ4=;
        b=kErZmzpx26QDFEtQuh+gk2qMcCwC6x1BASDrrtAfXP/noCHg/SvBvVZs1ML8th1xOc
         ef9ptCgCmj+UhbQnnC9qvyWcYzccE9JyWCvj67oJ83/iLKnyzeiEPp+eKb/a3A+HdZqn
         j7JlvcYRP8f7dzmD87dj3qAzcHfzuDcd7QyD7wZmHSK/XHOHePrg83ZuC9u5GfQfIrwk
         kg9baALrbid9mTuSHGh0TtgZQYnM9BsTTDChYMblpM+1qWtLTfPbSlEdyNoPDuZC+FyY
         iMmC5FlL7kldu3Md/rXMzlIyMokqF/rLG0GKMnm16Pv0XsG1m3SaF4YPffrUbFbOgMSo
         K/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762362705; x=1762967505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EELpuX0zlx92nLlvi+qer6ygD1MEAP7erC3Z3YTSLQ4=;
        b=kGgjUhwxmpbnh4D4tUb6d01Mshx78+FGXdVGSJRfQoeBzBlwrSoSiIC+8VfMMiI4ZD
         1stY9NbU6fjPYgOpiPErEz3mxQzU5PrKyKlrSvDNj6HX0f/CkW0wWe2C7SecO6PqizXc
         iKF2j6dBvS/XA0O1yGObfKGCi93+f3fu55MMWrwpZbiqgFgm6VIU36f2x+jPF2gwzZGX
         P0PX+9N+J9oAgQ+WoeYRh9W3nRClFI1BQeXy++OYYinHMnuYZ6hA6LEkWKwwapvc/Ngv
         KFZVKr+sJPrtso+RTbPZ1Ig70gq/jVaYSNUw/BZZTsX6ZUZwrzQ5lo9tWgavXQWHriGD
         DDsg==
X-Forwarded-Encrypted: i=1; AJvYcCVK2OQ64P6oA3t4cBnluD5KZ4a2cOiw8NLHNwwh+1/6kAnz/2+GbQtmDbAJ59YKeZ9R0HvNt2Gl37cSCDKW@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiHxfP7NGlM43Xoxgo+/c2FNne+lU3b6HpFbz9O44vJJSDVg+
	qe4TeO1u1vVMrfecB53QZ+UBu37Ft8Jj3BUMPEmRRUKPohJPQzG5aYLvviGDiae0DVWBSLY8Dg2
	PSrhCEb3r9C+7ihhAcS7rhGVn4b9H5EvaGzrtrGv24cqrao25mWAaGCSw4VEWzKgGFmAJ
X-Gm-Gg: ASbGncsBNWP5QmvFPxts3vrVg+E4FrGh0b7R0U8r2Qxo3Qs/z0SIEikKtqvPuO8lFxA
	+qv/lFAJFUXdR695qJHeO6HOOpjNM3K1aKm6cjSX1/M9W1HqD/nZw2DPgjVil4UgLa53o1Z/5Zb
	w2LUzqEVYn7HY2roZrf3F3PnQVVPp/Fo+NCmk8B/oRyQzbKf6NOQgltnBX7Xf6aIKiBbSayLIWz
	23gVZ/Yk9ePJIJbK2MYl2DKbs3wtHXE8B/6Yy5rkTvWhWMVAVdoHP8Dt+71xZdxsmhFhl1jw1hB
	mrdK7Js8CgKvZGGLAJfK6ygVyACzq518/g6DNK3zbllAAodclA1w+i//+rgon/4FuiGW1CO8uTE
	efoaPqx6aH4MSS2sgTTgdRwU=
X-Received: by 2002:a17:902:e801:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2962ad88b6dmr59633745ad.31.1762362705264;
        Wed, 05 Nov 2025 09:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHZzR0uofWuHqxMnU/OQ/FAyWhZK+U2W6I26BEyXNRfy6sU6QXraSVv3FBQHO5puHi3rdUUQ==
X-Received: by 2002:a17:902:e801:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2962ad88b6dmr59633005ad.31.1762362704563;
        Wed, 05 Nov 2025 09:11:44 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:11:44 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v8 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 05 Nov 2025 22:41:31 +0530
Message-Id: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOFC2kC/3XS247CIBAG4FcxXC+GGY71yvfY7AUUUJK1raVt3
 BjffanGQ2K9/MnMN0DmTHLoU8hkszqTPkwpp7YpwXytSL23zS7Q5EsmyFCwCjS1SnG660aax65
 r+4E6EFrWBo1iipS2rg8xna7k90/J+5SHtv+7TphgPr1j5h2bgDKKMgbLI/dK+O1xTHVq6nXdH
 sjMTfgggCEuEFgIbrzlBrlQlX4n+AvB2QLBC+F8BF/VQTGEd0LcCcnM4i1EISrtUTmHIETYtjm
 vj6P9LcTh6cinU7FqwZHF0QqiZdZo5eIHR704sPQkVRzpLUiD2qGoPjj64QAwueDo4oCro45QS
 lAuOJfbFvSh/FpOw20ViLM50LkoDZtVE04DvU8pHZd/FbJ5KokCAAA=
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=4032;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1HrAKtyYUdrVyuuovWuMNnd56RDUBrlDUBzWZKbtq7k=;
 b=HY5muJ0uQs3Vy3ZHUcicSlvThRDhabGeb+pkLkSX55GMDNijjq3RYON3kzGlE0NvVB+7SqOeZ
 48khBmEubAzC9k4acvrKq0zdc773cV1i1d0Q9YXAR93kCZR7RIJ+HVx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX0KPqy/3uBwPZ
 XDiObyiYuZtdhnQIvFzr4sIWB4y8pZZnnpuyUGA2Ju2J8suy/6YqTs96sphLMCRxPKIrExNPqDR
 vlnsbxTnApGrN5UfrIbhR16gd+yi0Fjg5psv0PCT9I7+ie/D9P3/rnW31hR52hj2jgCjKVwORYc
 Hdgi9rhxNvvoFogCivHZo36pas4k4/Old5PfjaCnHGLxKdRQn6ZMzp5MZsvyI9JGIgv/zpv/wpT
 b+xZe2B5C7dB0oiaPjQsyN6cU7TDg8myQVXNnpI2q1vV+bZDPqcME0HSSVS0YLs9qthT8ojui+v
 VAvG6HWLGyMD6e6QS2YFu160i0vLDTeBdGNY4WF6hEhIj+IaosBgh8atbkIq9QYc0t8DImESz8c
 y1s1/Q7vUPUTlOKh/4tpXjlwgZe5Nw==
X-Proofpoint-ORIG-GUID: peCCKR__YuzJAoFf5xHkQvyF2vKM4-mI
X-Proofpoint-GUID: peCCKR__YuzJAoFf5xHkQvyF2vKM4-mI
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b8552 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=uS2UVPQWM95stPRVMV8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050134

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2.

Apologies for the back to back rev bump. I am hoping to get this picked
up for v6.19.

All patches are for Bjorn to pick up.

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v8:
- Corrected patch#1 subject (Dmitry)
- Dropped the patch for qfrom binding doc as it is already picked up.
- EDITME: use bulletpoints and terse descriptions.
- Link to v7: https://lore.kernel.org/r/20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com

Changes in v7:
- Rebased on next-20251105
- Dropped drm-msm speedbin patch which is already picked up
- Picked up trailers
- Link to v6: https://lore.kernel.org/r/20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com

Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   8 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 174 ++++++++++++++++++++++-
 3 files changed, 184 insertions(+), 6 deletions(-)
---
base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


