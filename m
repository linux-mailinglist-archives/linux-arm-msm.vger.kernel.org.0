Return-Path: <linux-arm-msm+bounces-85199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AABCBCF98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02983300ACE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F123315D50;
	Mon, 15 Dec 2025 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjWJaUnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDEgod7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E613242D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787999; cv=none; b=qlyVFOsG1MMcyJ31vcbHmZA4edt9LP4m78UDk61sqM8oWVj39ag2SVIF4LXDDp9nEWE4UiFJq6VbX6gzcZt6u2BjtjeGweY1xf5MDFOd8GNAbQ+XRjydXPLqyBV14h8lOTkVm4w+Q20+CoXiiVEz9BtBoRq0KbfGFfzv3EJs8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787999; c=relaxed/simple;
	bh=lT56rcO/2wjclbI67SuJRUAAr4AVOFYX1OPiKxP0VqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n+hOv4c2RN0w1eA0MPREL9MgHQVuH+DHjTYvE6v5FnqKumghAjXDE9LVodidiX4URvPYqPE7iHtcWWHa+0C2fzFfiXLApZK646OImGE2ET7tx8zU5wQ4TeXIRn6wAxvGw08qG31/6ug5OJFU+8s+IPCk98ZR1mqwfRE15Q4xkpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjWJaUnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDEgod7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMiaqS3295882
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
	iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=OjWJaUnSMoVHGmjEYa7k5SmdQNw
	GvXUPQBa1AhpGUJsO+WETgWYbb3W6Hd4/PDRnDiScIA4M02HAjWbz8sLFmCSexCH
	SBZG9MRWqWlH4v2JryvxiPcVB2quUXacP1CxCB/Ky40KCgYwMuP8mN1OHezYRgg+
	kHAc0ZJuInPOM+UpPAmXuVnF//LZF7S+yTAkREgUZyn1+LU1Fqitn6ZbgGre/pb1
	K3bF0FmlD+6ULIk3pCq2Nkbio7ACbjqfI9aaQ3UlfcuTY+6x5Yeyd7wGZ2mPESKj
	x7fcAR2jgJfreVCB2iPivPtwgFXcl2zpMoJP2ZvxKVSeNC0xfUa4Sl4fZBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11dsbsn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0193a239so33714351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765787996; x=1766392796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=hDEgod7pX0rZ8xTst5gxXGabSs7Xg5wB693o5FwW9BKZLKka4ez83YT9ZUnd6i6Bdf
         tIOn/i+c/JFV2Zl81JMjQ+i1itiRu3S+HeEb1ZNGLLUdOJb88plSxElchIarSmUDFtCJ
         VWr7LTJmH4G8nV8EXs46tlwtRcKbCrD1s+uZqOSRwmm8LRvrGugPFCf74KZf3kQ6WCD1
         UtVFGvHG+AImD8+4FfW1wVbx9Sl9DzPhkhcT5+XXfEMyYUGfEjbA2/Hq9MVeUYjKZ2GH
         +nURnbz/T48ys0QVG4JiOruxruuMnfCV9sAB8yW5w9NxlU2LjrE9ioMyQqx65S5ZXuAi
         cz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765787996; x=1766392796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=Wir/zCQWJctrxl7MzRhyfHjBZ37d7wWU0dVWVcckSW8K5U+Lp9C5eMuI6m6jBowuEs
         pjvNu66g0CA3xb5voLWxyGcpnXN/kv4JUBOpHqRW+HWGetp3XyzjA2g4+dNn/mOz0nsQ
         My9rkYDBcvsfZvDuGQ6k7mV6CpugZzcQBxnFaDJv1DpCQaY9kWyNzGpvrTkPkiwi2tBY
         T6zpuIWu2Chw9mVkFGvsFL0A/OkIGpQvnBQzRc4WbhjIm2zwSGdM2In15R1zoZ3gEuQ9
         CE8r8CogmwK5VyWZMrd6+UuqKkD7uLq/ACVIJuFaB53FcQhBY2uZ1rhddhGbA5xKASbr
         rlVg==
X-Gm-Message-State: AOJu0Yz7mEBzZsIGDtkC3iqahDpGDDQmwg9TSNasI3g2BO0qZpzGc1N5
	byYn4vdvo0ZqbxD6VAUjao3JcoQlOl8qXbm+MO6QXO42hjeVOoNTn/1MlHUL8LrH5oZigOLieet
	FO+jtW1TxRxSJS/OCbbG98YqC8xn6+X8UzuMsToxkOSFtEhpgczIr6sPLJ1Dte5koUVmO
X-Gm-Gg: AY/fxX7BYUbhf0nH20hvPtUoW5QK21pgx58+/B6J/39Gw2Y20hY+iP945yMBRy+nCN2
	QZVcuen001VHYAdTi5CAWKItrVJmRhHW7gyiHB3KccR9zbmCANppUe4StQd0c+nVcaxRAmaQpFU
	db3p6Bg4jK9I/pmZy8BfuSYsa9d3ulewWBWov3RnayURxMEy006vjC0Qq2edrC0m9yOr7BPulpQ
	Oy9ic6m9rz6L1ZaxM8ni8/dB52A1mmnAbw9CBqg06TwS6MDOD6TxGIE7R/UPUnCftDl33YQ2Qe9
	WPYamYhR8XJs9JlxCvy0qzmolYuWYmNWncTkKSVv4DiYvv1WMf69qyZqsGsZaxkhkgnXZ2hx4QN
	aOR/aHgQBLT9D6cZW3P+LiTqqIw4rb/65xEI3l/Qtjfse10WSTpG1dn9iuYTiN4Xq/8Y=
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4f1d04ac58cmr145353831cf.13.1765787996230;
        Mon, 15 Dec 2025 00:39:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoFWVPMAV6JlXUuSiLN649BtOiFD1OzCUudJcet20PnZk/76ESO1U7JtloETSwBkU1CL9nCw==
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4f1d04ac58cmr145353601cf.13.1765787995655;
        Mon, 15 Dec 2025 00:39:55 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:39:55 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 01/11] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:44 +0800
Message-Id: <20251215083854.577-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wRoMSo1DgFAtkmyH7pD276yPmb6CIWD1
X-Proofpoint-ORIG-GUID: wRoMSo1DgFAtkmyH7pD276yPmb6CIWD1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX2ALtc9tFjSBQ
 AQ0N86RkSbR5GBr3TQ+s57LeVNiJb6UkJhg+cM7Ajx7cMaY3RMiEAm1QjIgPHLZuM55l7S+Xto8
 MKgzkqEUNGSsOPYtLNAuEBW8Y1OA4GtZ3Rn2Ec3BuQWEawS8Du0LFBa3yQOZRDGsjk4r/WyXZ0J
 2C0X50bcOMlBhMCPfb4979UwthA/ydAMW79bWOmrdeX3aGIeeyIPPcc/1gZRKy/dPpayuMi1r4K
 ZhKjiue3EKmrY1umwp1qEZEnCyhAMjjsKfpiW5fZSwAufoCYhe1OdkBjSRVg/7j3e5t3INklSi0
 Y8HOhHdNGJtTpmqjcPlbAqemhVHcSXNLF6trt6jAtLqJc/LTZh1x2AXgefeX0YbuO5E+dS7EF7/
 PgwTOEwxJoE/h+KXkDuSKhOySY01GQ==
X-Authority-Analysis: v=2.4 cv=cfLfb3DM c=1 sm=1 tr=0 ts=693fc95c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071

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


