Return-Path: <linux-arm-msm+bounces-86965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C77CE9AF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1548730198C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9882E764D;
	Tue, 30 Dec 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpEsUYm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1wahgBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1092EA169
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098073; cv=none; b=XDZeKemhEi7GvRQTwbMUEq3brIgk1+p71cZ9i+s9TcdCyK6pyZm6zXt1QtVTSzv39DVgCqMeWnUlF1UAaeic3nwBskMu7+ofcqK245p0LNR64H1OH+YAsHBESeHTbjCG+XDlxXR2INAEyQeJ4nDMa9CVyHXYvVhf5A5vs9dcCcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098073; c=relaxed/simple;
	bh=JtBAApNY0JeyhPIQIegtD9qcHVqaABy0l3e+bF7RSVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4HOnThqRqOnbY9lFnXsCwm/3X+Vl393WoLBVehJZSXBuVE3DSkNaFG7irj0jalexFyycT+n5V5SNWHPdH3krCx6Vpcz7cLvyZcKvY5XcbiBiR5zW0hS6DN56LuRw6Mt6ZPvxNs1bzNpy+6NNwmHnGeE9mcaFlMaQPPNnLqJ8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpEsUYm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1wahgBs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hs5d2547838
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=; b=dpEsUYm0oR1J1bmf
	zXsXUpkVO9/8ZB8FHrGcZK3S5HDAaHGlYFuNx3DJkI2v4fbAjVJO2L2eSxl0dfKP
	RfVHiRBqP/Y7wUoACzLB0XvB+9V2v61zkGayQ2yPeff+Yr4EdhanrWxySGVyyzq9
	2O98wOM1UNTYbBRkwDFahZH9xpybeWOVih8yBQ0Kzexgj22R43KGZCdtriZYpBg3
	BDaPiBuEnxmCttR1wu04dTsIHS45Ere7Zz/frmNLZW48PFmWIgRRgROOGpj8jyAe
	gJnejGK7YRAdYET69ohDCjzjX8o7K5WADU8PdC5uh/4dEbV5oT1vYDNpaKNV+4qe
	C2/CpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc73994sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f4822f77so273915215ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767098069; x=1767702869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
        b=E1wahgBstaAxpNu55uiFBM+Ga2DlLMO2MJX57CfMi8iP3+TyUztjNFXDpya6/szFb2
         TTOb6/euqWRRlh+DLf5jjTOzyP9Xtr09nxhNbYVXMyx20K5VGmqObVGOBz9+VHq1V+r7
         x3oFs4PZnICx5Urs/5b1LBsGZZbTAAT1vvYP965F+mTBdhBL95l+SeptnNTZhVwjahGC
         kMn1LwT/jGglu9TOeUnnzrwKgm2P/rU1lNjxqdkNi/VCMDPtXlAJf0psyUvp5eWdOnUt
         uiie3295SCpseRLz07/dca1CpPscHf2jQxsr0kEFfSJ2qS3OZ0rdNl8QuACx0/J9/xx9
         GtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098069; x=1767702869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
        b=k3lYJvCbDVdkc+4KMyiazZOg0weJHNq/w87Sbd9Jf5eJA8ztJmHMxCa2wl84BaSSIN
         zd9rzaUfL3TntDHLZIUYjnfZR6JIb8p8r9L5SGzLoncbtKWnq2IMzP4f9yiA/qZQHWnm
         yxTsZvZBio+BXf8THINfcypbYFkea9wSvt1i6wDvZ1GkTYVu3GsyBtb12F5EEgHV33yF
         dGjytUNkW6enDH6hRhBo16C6KDXMz7h1LIyLTUXuBDsUv+9y3Ie2wni1crABTSXFcnwp
         PodTdhj0igQJMGRzwNVe8e1uouVJPgSH+NT96DXuJR3EezIMiHqy6cDjverq/MG74Ht9
         47Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVHCYx7Hcyo11Aoec6LemhnY8OA9BoRzoMAXOSWbCKQRtKTthW/DdSAuIhqm5bSXU9DXsiX0df2WANnu59Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTZq89BeH2/iOip6tXeLiulflCCJde9Z+pcIrNAAqSep3PbeI
	+xvaI89imvGY9JQbqYeUsKB9liy5gwaamNbQw1Y13ib4vQOvgam9Lqa4wB72ozgq34nxQjUPITe
	MUjmugBFiAAyG4EeZ0ZMbJJo3zLwp6bG/t5VVF9tERmA0khNjSFivEmbLYdSHLpyQzLxZ
X-Gm-Gg: AY/fxX46fycNk74KyiB37/mzaag+1R0ei9Fq23vncmZjaJ97cD6AluNr9511xc9e+Xu
	gpkzAOIrBAOvJWr16fxWhEhIIP3eDNX6bp1N70jiIDcO1NSfJA3LaKJOADhRtp5pZ9XzTAlxwE0
	arOt33f6dk5IL/60Ry2m7KnoHVdemiqHR9/xfdEC3SH3NxymnrCc5sUcm4sHOgKUVSNAxqvWB3e
	NE2raDx2A3aSJGQoPN7f5oOvBnQVdQseJQqcXkxGEuw/5HyRpnedVrW4o2GLsBjSk+fw4tGF/sW
	bWRGDrAeNWdC55goJLpwXSwLze+KflznFRRV8X+gpjN6r/8TTMs5HASkJodf7VXDcqBBwNL0q/e
	d14SFUsytZ6rBGTnoVQ26y7QwxqBCD43IHg==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr347420375ad.19.1767098069475;
        Tue, 30 Dec 2025 04:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOj+Jt7FWW/tx6wdupg4tsy4BPTQK2YMy5OILP4nJWqDLIJNYeaaBFj8U9AoZfQNJ1CYnfzg==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr347420015ad.19.1767098068884;
        Tue, 30 Dec 2025 04:34:28 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:34:28 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:28 +0530
Subject: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=823;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JtBAApNY0JeyhPIQIegtD9qcHVqaABy0l3e+bF7RSVU=;
 b=coZRt5MPySgLfD644OsvQcRrvI/RAD6aN9OJ8pn7yvtm2GmqPTvY734oMDaaw1BsYl3rteTjF
 HiMwmWv/QRqBmtC/Qnn3PLJ9dU5st1Al6NxXmXvVM9yGHzbD49H0JBq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: wMzPKmjgQsYkvOaqfuOGLWdt4KpNueJJ
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=6953c6d6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX6wp/gpZmZ9+w
 rrydB/QtazqU03rKfV4ls9Mxt1oFl8VyZYH091jnnYYHIxF4j1miziJE9Zwxu7VEtxdf4lgbgEx
 2X+qGGDGVMSgJNAwLwRcD3li0NyHhq6QOA85grOfte9gjg/nXASKivH6UM7tgsKQJxwgNHLS4xV
 6C4nJ1fti4W/vCsZ4OOM9td5cHG6kE/YH7eQzMoDaAwpjuf5kHg9XFuSzfK6bk/PgBMWPgzKGHm
 A9uETw63h4fget2Dfsbly9ShmBi9SAgxtUmBzROJbrj8x7wV4FiocGl2bvyl9oXx5uH4Vd4sZE4
 RfztwVziTs1sorYWd379qSx7r38GmXdoPMSkCr4Wj9IbeSJaiFpGCN3h/SsbEeZgbPZgJEoYsy2
 cgG6jFmA0w5d1zWMoP7GbrEvneCIds9tOYQVSiuN9hMG1rfLW62XxOPJt65u/oqJ0Uqsld5w22k
 N1g5gYSiUli/V7CZIIg==
X-Proofpoint-ORIG-GUID: wMzPKmjgQsYkvOaqfuOGLWdt4KpNueJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce2..8fb7d1fc6d56 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


