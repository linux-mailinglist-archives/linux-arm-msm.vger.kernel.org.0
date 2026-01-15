Return-Path: <linux-arm-msm+bounces-89174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90097D2390E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5E5A305A77F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FF635FF68;
	Thu, 15 Jan 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNuYOHq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQf9RtZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44A35B15F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469301; cv=none; b=fAUHkO27o05qJuBIR4svS5mNCHKv14MoRFj0d+d5qdXTPBiZXPWIj+lTVvvvhKeipgHKXtpzK8Dy0tfGJ2ZqOcncHhCICSkeF1FOrLpw14MX0KqjmFTnmeOHprnHfwPmR4tEb/51YcgfWrh6no+Et9V8h5B1Jfx64CXoHLdxWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469301; c=relaxed/simple;
	bh=lT56rcO/2wjclbI67SuJRUAAr4AVOFYX1OPiKxP0VqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nVJAAtcbB1Zc+XY1Xi5h36buDUZ6/FFzkN511I08BdjCQKMAdt93Nz6bp7jOkRKGqyI3gjKM6Mlf85FKRcSvxRX+HcOy9SuQxSH+v+8iBJJu4dhGJRcoTO7X65GxsLrMkpoJ81Oxa9UZNS+5k4f23QmPsUAG+1FOQnnR+JCQ8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNuYOHq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQf9RtZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g9d81554503
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
	iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=gNuYOHq9bGpDJAz+gDlrdBqizrr
	RjFNsg9vKfLdoNGUvmB7/bZWY8sihQcSIKiW3J1GMA1lBHRRLiiZXcbpURN7U0Pl
	VcC7nhD9PkNAjk1W7ApzMxeF7BCqdBA43ay2lGaJD5hmeSHkY6630KsHoKj9das9
	lxqJaqhovS6RxKzNvWypOGyENgW04kbnWmr0u90UhfAsMh14oVABl+jhIPOHbjsx
	M4hnQarsGvWr8VTG4HwGpobvnGk0wPApqo/+N7q9eiITysFcOFYq1me5p/juNDpL
	ieTlvS3ZC1W8DSnh5x6lGd2DGWk8R7AfrQvD6Xa51R2FqLzbiqZt+JtZ+Uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8us09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-888825e6423so11465656d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469298; x=1769074098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=GQf9RtZV0GAxk8L2Ext1Kv2Tdh43N0LiLSQFRdGICES5yrnj1G/p6UQyU87HQJLkbm
         N1ko+OInjxcp2jK9Cmp498EkxZ1A9tntt/Jt8AHLAaFpv7E3E1cX0zUVIDKv+fXhXWU5
         XjPjCwS+Yik4abbeEHEwSq4WSlzPHm25RbcYTU9itS7OYsEvLTOdPt0VItpK9szqNXVt
         QqGnutmyMZaoLcnOM5F4oYVB21F4GzNt9b5QDGicPoho5AzSSx9NTYsW52/vIT3fm3YW
         SAy9AhrBuBC1cBobpKCakab+n1oOTJ5Fv0hi8X/L8CtWw6C8pO/yUsJE5Sz6d2bPzPsQ
         ab1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469298; x=1769074098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=Sc/eUyvBA7gekrwhoKJKeBYvr9F/OlLFTg6gT9zKFuyNzHaxyCDxPFhk/ImWWUWjwi
         8lSpSz7Kp1GhxSgMnKi7SK6g5xPQMQCndq/Ff7x8+Wpg+8LeU+zIO4cKBQKp09GYQQKG
         wW8wJ852GZx5oKUIVpzWO80wAuhMuR9ZH90MHVJhA7Hkqh8FKM1vtqUElq+R2su+yRyI
         swxcyOXN2Cmq4Q6xkKjYqbgEns8KuGQwCmJ3O7+Z81qsUdZ3LbiqXq0h3R3boKuwgyBc
         vRyXcwG7YwHNYN3VNiPkTkT5pkxTc8pq5JNXYdX0GlcTY8kxKP2XL/WHvRSFtLOyggYY
         IcRQ==
X-Gm-Message-State: AOJu0YwZApHbxH7qoh5fTzDyjbGY68I5n7W9KWzmr47W7E2xcylMXJ1w
	+6kq6Kb3wTOChUUQHDxmaZ/lbD42dzp9YSN/GGKrlCScTUPnUpooyM4ja5nWgW3sh+IfhbgqqfR
	kgoB36r8ZLo86BrGoiMs8ngAup2iKy5YtClxr9gXDYE9lKvkpGk0hHgZSB2ik62B/wt1l
X-Gm-Gg: AY/fxX6gsIKZWfCWPiIAiABA7ZFLkWzUKsSK7XKl2iRkgaPkCdJq0DuzlH2i+stJc8h
	MAzQlm8sbhx6ZgotFXimbcK/C33ZINKA45uo1hpzoSnaCkADMm1S5UEA/vb+acj88I385GbTw5o
	t5sohH7FN91ry1LbFyqVibN+E8bKn6qLvVwa52o3catyCDlexQ+GCGuREM0kJn+Ncnb39cS2HPx
	tvdYxiCBD3/0S3St7GBkrVVKwvvi/hb8A+u132KSF/jNhkhhXlHwMBX7B2yG4HvHKqMN+6Q6QYT
	bTEY4KJv662zHWuPLxXtzB5J5bYfATpQcbIUba3oydRNimn7hY2tPpHBqYu+RJh0UbEy9XzBjkV
	r5L2AE+E3B4Oz8/Oy0kWUaT2Y8p1TjteM3wtlGoF9oaesEdrPIICkHaq92xo8sMHfDo0=
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id 6a1803df08f44-89275ae069fmr74177666d6.10.1768469298239;
        Thu, 15 Jan 2026 01:28:18 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id 6a1803df08f44-89275ae069fmr74177046d6.10.1768469297587;
        Thu, 15 Jan 2026 01:28:17 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:17 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v6 01/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Thu, 15 Jan 2026 17:27:38 +0800
Message-Id: <20260115092749.533-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jPcvbXOIrqRDIiou26V4riktiKt_Sun8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX4N6medRcnWAM
 I4rYygOIWJKgUnBDXmGMsR6k+659OpeYVr8RZskRoxJfX0hnB9MN2Ej6w2chKgiuNivWMS2P4kj
 GWN93ksOFl4FXXAEHPmmYvgFr5UXDzmsjda96Ig15I+WROzabklk+oJTeLKUxy0CexytYnYTyUC
 vShaEIYlLWygDXGuigciP2zH8OMaiotMhCnaY1Z4J58yn+H1sZMgQZ0P4O0IS18vBBBeNzESF9w
 t9f9NJaFbUix++B2IaC8s7zj4yBQPGmLSeoNguFd4BQhf4kcF1q3379oDW3ahjuRWAz6IlyM+EZ
 fnqSSUQqMapc1YFyzkRPalfUwpCbs99eTFmKDhO3E4aNnrbutFinvHf4JmKrVUEVQJTO7OjdIqL
 qOHBknv5OJBNdeUp3BDe0B0RUtMVetw5JOVg7wscim2tC3AM6eZ/ZMjwBP7jwflgM+0QVEc1W/Z
 EbcEfI2RkcbJ1zLJStA==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6968b332 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: jPcvbXOIrqRDIiou26V4riktiKt_Sun8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1


