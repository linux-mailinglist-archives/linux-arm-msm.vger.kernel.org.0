Return-Path: <linux-arm-msm+bounces-80471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B3C36CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A7B18C1CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D643338910;
	Wed,  5 Nov 2025 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnQv5Fds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lm62RBcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3533DEC1
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361198; cv=none; b=eqiufFmnkHwTty35ed/n2d5F7TeaIVzZruWZSXUTW3H1aQcWD2nGUYCWELxgtdiwBZlvVy5zwEbpKY9sepTsarjyxz98L+ecBL1x55JFwUwghVRK7AMYbyQCdRIxtqiCLLXT1adTh4KWDcUvAj7hO1LK2U9BC7GlGxLAven/29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361198; c=relaxed/simple;
	bh=QygCnmXl5Esc5BPNyYe6tgH6/RC9PgKmXDBI3B/5l+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olGfHx9iaZs+W8Zfaqj9Qa60VoypvncbyXqnc70IOHrtW9KbH7g3pSxez0W+q7EcCCGCznxohvKc5zZz8rLyBh7oIqjqYRB7YKdNyrp33LWPBkYJpf0nkMzZrNbIlQ3/2R1E4rLeGKWnMrXKsUJVy9FQpkbOBIqVmlMcmbnK0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnQv5Fds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm62RBcl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5E8EZP876748
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 16:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=; b=jnQv5Fds5DZ66Zry
	IvEzoBTbpAmxm3Blk120fyRbtP0En3+vWCNKbpcPwQX1Fj+O96uxXgs+LB66h4lf
	6yHEDzMzedtzY0DTKt22ScHUDXr45zH6TeU9NxHGwbcPeZSBdw33j/5fz7BxiQwS
	WjfFtovv7k4shYJj2uiTEdpJi3PwLo40h+Npnl+XYeHLDn/+un/Na1CtWAy3+iIr
	OoBuXOQq2zS0fLg8arQlmt+u5NVsP10Tp3T1rVrkTxl4czG1MMnu90djVWXamARR
	//kE+VxVSM3+7n0/wi77orDia9+SYl4nePF4qLcd+QNUhSWEGsH4295dTv7TpT/L
	WMIPJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88318h0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 16:46:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28bd8b3fa67so416495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762361195; x=1762965995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
        b=Lm62RBclHQvKg0ihtZlga0nBwXtg3q2U/M/qQAwVDpqV30Z2gJF6HoCx7eLOhtukwe
         DYOL+KSZiGNTeuya2mcrf1zfkJsJeybetojnK95lV8yBtWZ/+aDjZo3n6Zm+ED4ArDhJ
         B/gT6OPrPwl25kLjTezB9Uxyr0IkKaYvf9PsAAb3GIVms9IybRjQz2ms+xnV9OczhxkK
         0p3rdmKSNFTERQIfm+wns7zGpoGJRmJ94b6ove9hlB8IW/h6dv2gVaIx/YrsdA+Umj1z
         3i++tj9Z0UVlMXoHuDY3sbZzK9hck9YjyNbPupfPxZ/Tr6JpMrJLcAUbDiPGJIPcSfyD
         dykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361195; x=1762965995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
        b=cVq0cxhqcZLqMutfP6j0YQ/bIKNTX1qxmvqEQgm3EUmMK1sFddwrQZBc24HN9MJ/ha
         G/FxFtzjs4NYHmWviKQrGQ6D3Y59WE01qLxg7UO+ztcBXP1sEWS0mcvBOm/Fj78P3y1Y
         97OsPYkUcBd+gzT9DiZR3nMkxfdlOslKncRbWJh2H3+A1PE0eEqEVZTX8vM2ctGEET19
         DuIacJL58JKnbtuJpzG87f9D6zzh3FnyKi6jypVfAms4GdUhZ0GjEQUeKmHkGEyK54HZ
         ETfdPcykNrYuhBdJz0/uUV4vgura2Rt7B/di+zIyknU0iRkXn8AOPw+HrVCnnCz7BB1N
         fETw==
X-Forwarded-Encrypted: i=1; AJvYcCUKO5VJpG5tQDzE2ZcgsY4s3jBAyGc1JSYZbIlsa9NarQPaltkCeUbksZEXmHnILaTvcp6VfISwJzOspBNY@vger.kernel.org
X-Gm-Message-State: AOJu0Yybmkr0GDRRKncTvdyiI1b3Fun7fwuoJXHV5xJ7jmenhgGFcuSQ
	jA9o5Eh5WUO4caAOQmZ7fzc5X1Rdd0a//etItX3LjkwsS31QyKS6/dTg0QTzdtL9FNGlJOefEGL
	GvSzscKr/gIjJ2PDx3mWMZ3yaRo7ojzAoDsGYDuJyM25L4CLvVqjtfqMLBeU2tgNm1MTZ
X-Gm-Gg: ASbGncuITrNCoQKuNglBBhJ1Vkjwe0hVakYYO1qO9OJxBR/Eln/aH4XvLh1xqQW0Sln
	ia6jR+gJhxeab0tnGAUclqKw0iwCEGVBwNpXfrhMtZ784TlEEJHjy81huh1ZqA/zwlDZJDn1ccQ
	LzH2yAkkb+AlXG3N810ND9/5qSi8Mmd7eDXPWpeIDRxYJwwpKxQR53G9J06P5XBezRgzJ00oZHg
	/DP0q19szruYsS6fq3y1a9XfkRo1gCqEJYS8x6mzeSSXob0TtjmvF4QABDHKTVTrVaF0qB81daB
	JXkUwCWWziTU8izc4mFHSUeVJUfWpVo2AqcqkiAHLcKS9Lr1EDAJfqyr3L4VlDqFjv+Hogb9j40
	jBHkGGLtRbBus2+RD5PM+oKA=
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2962ad10486mr59682375ad.11.1762361195361;
        Wed, 05 Nov 2025 08:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYVpEn9p7yDIsAYp1aZP87Bdl/2uK5TgZtdjIwNg03NFpwQ20p/nGpKGX/x/FLTLX8/vHeGw==
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2962ad10486mr59681825ad.11.1762361194676;
        Wed, 05 Nov 2025 08:46:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:46:33 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:48 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-4-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=804;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QygCnmXl5Esc5BPNyYe6tgH6/RC9PgKmXDBI3B/5l+4=;
 b=kkr/m55E2zuEnA2RDfM9Hl+ewlE6yBtGv8M1mz14zrUkkvyLGc1oQRrfOQuIGcFm462YtTEbc
 +q/796q/1FHCFP/yO+/k9iCY1uPTdpFDahQ0z7BN/arcIQwhtr7ayCa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Xvj8biTiCLE0FK0YE71KorPGXT96aaMo
X-Proofpoint-GUID: Xvj8biTiCLE0FK0YE71KorPGXT96aaMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX2A1qEys97d0Z
 VB8G1r0e995YbWseeelOtOR6wJIuqmVSHSlya2tfAM9+OTViZCa89JJOdqPVZy7zv3ruM2RyDcZ
 U+EkHIlcSu4H+vNbtSvUg2TAAwzL9S0dG16uxiM1dwq9utVXra3ECR6BMWronwTC8raWkivsWKn
 hN0aGZ00ZbrvTl3AGqDQSR/aybwd95xGSUa7+TyfZQkWLHMYsllsFhA5g9E6u39hNob8+SVPNmz
 kNpmG/E/U3FX3af1AYoIyyKt4P/4L5fB0RWm4ivx3ebnj95UivIWyy0da2k5eAHXsuEAjQspjTW
 MdH/8ZC9U1Rhn9VlcTnEYqpPscci2V2yBFoNZ0K6EMxfnRaEwDuvzMHvUEKSkVRjkVdK8nG4PR/
 OTdn54M2UKAR1U/19egv1iuR5BS92A==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690b7f6c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2f080f501140fd1c68b72d797fd00..28bf152f5fa8e8d7779904986da1a5c2f06a5909 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -454,6 +454,14 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c18 {
 	status = "okay";
 

-- 
2.51.0


