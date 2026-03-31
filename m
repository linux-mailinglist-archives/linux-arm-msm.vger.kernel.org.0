Return-Path: <linux-arm-msm+bounces-100938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE1YODhby2lJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:27:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F6364183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EFCD306C45E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C643164BA;
	Tue, 31 Mar 2026 05:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BL5yWUg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVpeXFd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79D285C9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934691; cv=none; b=EOCkdiwUrHKs+7S4pxzTNmvN+yCfwgU2qzNxHcsCt/4FZkXSRXgk5q9Lgo+VMEEpXyUSVIgeFsVASL3kMG5SMoIzSXtORf5/jBUAL1i9KdpPWZyswLMNulfQPwk/NtFznbW79V3gaj/hypu5R+9ibwORz7s/2YfjKP/jxvcyPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934691; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iygS4ZQdAjNLLeblaQJqyOyxJ+ds5jRq+zSD/+5PgUcWB/fvuBXRQdoMsQ1UVt7/2ho13NhIiS1TDix6QPtr9+/q1dYG/L/pzmaYqGYKyZdp/k28+hU8V0J2K558GgapyFn+3OOOJxfaFxG6DjfJA0akeOYIAAdQolQaMQs+kZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL5yWUg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVpeXFd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UL41eS1841221
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=BL5yWUg2QiOy1RwS
	pa74dz76NlVHOqWz/jKeNQVAGne7nZqCWNJbzbAWZWGlqcG2DfzQwJgqFQommool
	zOg3DPyixnTbja5avRiRTARWH9vlHl8JnTo3G2wjLMR/g/qQ/9LbZsM5PQ5NC3Eo
	Xi8/3F0Unpej6I2vQkvmFxzIlC3mJYPvgmS58Yxpdavse9u30QenJOiluIYgT9jL
	QBvK8SFGmR5tgzWkrm54Uu0AwWOmcLoMp22gRe1nQ07JYjsgq7HhH7VRwNB26kht
	6sO2RNahCh7mpzo3lvGjmR3WEgubAZudfZuCTyjtT/YGvJxYa4WaROE+qn4ie0Qm
	spm3WA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rshcnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73781252edso10245524a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934688; x=1775539488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=fVpeXFd0+ZWos1viFN6X36Y+HRVJ5oRBytIdCqMFaODmm2qlcgOzZEbwPBRinx80mN
         9QXzp38y4n0w8yAgdQkrQn1zZ2lsetR9melBu8yaGCJK32DHL0NwcXfQQ61ABFoedh5X
         SALtEbiR0cGs8FZ/EIEoc3DSl4Q2M2h0fmpOqEhHudZCsfFH/51KSH2p/MmeU8ipxHUX
         5dwI8FvykQUo2s9EiH0ySnry6oMi/25a4dQW9mKR4vllH2BhDJWQxMQsDU/8cg3Xbymg
         2u6nfms3b3zMV4DgnMxH5CJbaLVCqRF+52lEB/SC3Dy//8fGHcjgbT2B9c6/MIv83cGB
         xPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934688; x=1775539488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=Sc9lelDS/BncPGashpxJEipX4o2nMIM3qMqrzVPKm8hrLgHOYtQzVtY2XxTpe9Y1kP
         X9MBMqaWhVqXuUfmgbwQF0A/A/b4YF1s5r1UhfK27nU5tVKiKX9KE5jPUCaUl/S8EMoS
         aVQJo/ovmfrIezm/G8pQQFHVCQTHiHpth5MZNOPT5ldBUkUWS6osekKH7tmoRgPtPSpR
         SZbpsfmClbdzKeQcR9/v3L4QSm6SRAwZLbFIg3bsyFnfxfAUdVf9A4jKLZ0b55UFezRT
         ARLIVvqpTVraUBlA5gqZBU3TK1y95IslUPIiMlymcH7Z7UPc/vXK2Mo0bb46ggJ60xyl
         sqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYvRwPVCVW3vp6z0JqwK7Y+NAESa5whZC4Voj6UxabNjiBBNjxukxjN6/uAlB2PMZ+l+VzH7Fvz8/qtu1l@vger.kernel.org
X-Gm-Message-State: AOJu0YyytiM5Uo0af1YEKrfZBcwMSwPejCwSS3ofqh4sOZQ5Zsrs7+fi
	b0GeTSnOisyI/sc0j/Ti8b8Avum5PCEFHIaZsttSL/Xkr4v6j4ZaLq7TipLDImVzbDRQaYNF3QF
	QLv7cs5a0kqE4CIrb1Rzj/EITJIffKEDq9gPBIbZPXBjn+BURy1pBgRRu8J+4PV1UizOrFgUiyd
	jP
X-Gm-Gg: ATEYQzy+s7BaEkfa5/qfznn/kI6S4HyJo3LW+wwiJl+edTf+0VmmhsFvH2g7e0fqv66
	dKjIKexwcJeAzaQmo2/Vbwxa4+Ln/fwM3R33fCSDD8SKCo3RBHmQyf21jxXKneKsYDj9zay6LNV
	sL8gcTzwb3gVN5bT/YznnE/LinuEbSPNeE5J8vb+j2LwRinIEZLCNrwoV3mw0Sp9UUBwqZtdNjD
	Ia2IyPlir/zwXEjzT+4WryiH5HlPFbFszmcfIrHcyzetst+8nx55YMPkHkYzmFsEQ2G2ygnXK8l
	EbMllzsvwyoLWS0ddEdXMwuiDLVhwbAmPjSz3mYvLgt7q1L7lEEYC26AASLX04ZGhTijjrBG3nu
	MRYAiVgB5Ke56WYDwc+ECmpHFZ7O1JA2CuyBmxwwbM4YYPa08k9Yb
X-Received: by 2002:a05:6a00:6e47:b0:82c:a59c:5ec4 with SMTP id d2e1a72fcca58-82ca59c5f21mr8144430b3a.3.1774934688350;
        Mon, 30 Mar 2026 22:24:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:6e47:b0:82c:a59c:5ec4 with SMTP id d2e1a72fcca58-82ca59c5f21mr8144412b3a.3.1774934687769;
        Mon, 30 Mar 2026 22:24:47 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:11 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-2-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PCarOJgqL9X6hYaaLV3ZV7WAsqw9-rmM
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb5aa1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: PCarOJgqL9X6hYaaLV3ZV7WAsqw9-rmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfXxm3n6a2rBJ8i
 cAvF3F5DFeaR/vya5GUD0bLkPPB6+sGkhog8MNbDdWZpBWZw7af1TJzXXohtRE7qwYrpfN/CkXx
 SK9Rswr8pMPvvc9Y57J1SLOBS29ws0ZxFDA4YMGeln+QPm8myWy5PmsDeBrJx1npCaNWGdaLMKs
 tAc/bRTVAiNDEVY2NOGYKHQ1ZKWyAUMnBp56cN/AF9tbJ+4AWqLkWdgEIDFGMB/O2pzBw/G+dD5
 xBw/1iYWS6P2M3c2PLOantGVH/l08qpVjxjDUcfKb5LNrXg7T65tJq4egEB0brwwz5HgZc8emZK
 K3xL45+BVYIMOBMVas9UZjOpNeiXk0Hb0KknTUN9VelU3IhkopS8vC2J9K0JNh/8icSh455L3en
 aEZNPg9mLpGoKL/egMNVUroQo0y2W8DsPmnw44rfDLZTB74al52XqZD4o1i3wTBjYu9vwPELuZW
 Ykynbx8pbVyEL8BJonQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100938-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 876F6364183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1


