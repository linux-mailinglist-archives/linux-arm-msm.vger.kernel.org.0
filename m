Return-Path: <linux-arm-msm+bounces-94740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOI+EkdLpGmQcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:20:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4501D030A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EE913012BF6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 14:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59D3330B0B;
	Sun,  1 Mar 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmJQVf8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NI5XJ7wg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F9F1DF25F
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772374841; cv=none; b=gFs2qUSawGow7Ei7OGaloA00WToRsaiRKr+uyskG6rHlRai7XJZSnms25aGpeP79Yq90BmXfYjAt8wC73X+k4tuAPy3QDn3xoEYYwNUKsQkVb+DWPiOl1g9SoxAzxwjfga3Oc7LsiXGLqdvmh22FVozU0lnPb6fLk58U1n/K/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772374841; c=relaxed/simple;
	bh=m8yO8Aj7LBafKhDVBiQ2q7TFUyh1Un4CoiLobm9d3n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hphy7I1wqcv5N8na/YaombWgGW5LBu8FWid55Ao9cqhhG3yEfE7MLj688Iy1pUu7BuK2y1VmzNo3HQvfoaGvI956lV9vjmJNVHShtNOmMXvuHKRye5Y4GeoQnloY7gqxglU1mw7mzUb4SX/D3q4Za2n3XczKhU6FjVR/LTvDIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmJQVf8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NI5XJ7wg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6218kNoX1955725
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 14:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvy
	p1f6x99A=; b=lmJQVf8t3epInMvs0JwXODEc0PJ7Q9rgPuPsyz1lyqy519sGsHc
	F37n1f47WgI8RVOyT9eldXxvykIyrZK2t6nbJlTESrOXkqdrFOLT4nJWLDqgEcwK
	pVvPPdeZ/zknvO07JDDxgNpCo4HSyyV9MVgdbKfaiR8DpDnqVSNt5JCwuzPrjodk
	e2w/jeL3X/ZYLOTZE32ZF6/4xq44X7ygxvh9DO++ulaacpHw1AG1EZPywHei1aQK
	gvvPbT53EcBZx7S9ODJrn/IDQj3O67izFvM5+8y7zVst10JyEoFsh9zPpPpm8pP0
	4nmKwfXqIJ7wIEPaAVAya3gjT0bmFFsDOEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfytqy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 14:20:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so3403879585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 06:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772374838; x=1772979638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvyp1f6x99A=;
        b=NI5XJ7wgagup5GtTgoTirvCEzmPWEsbSC1cxxOnBQJELYAarZYNyOswtv8NbHbNIo+
         bYXTqRV4c0CYidCZHNBGTuTi7kTDfqSirCqs1cDn2iOkkQY1H8/7q9KL3k1tsNGlqPvB
         1z2IzFir5h9AH87AGXe6SrRms9FL/Drv7STFfyS62TZuVm3jajiWDf//QSR5O/u2p8mV
         +IZc7nXJhbdUcyI+Hz+/qbKUDlwMKn/QzeBaCboK7++a0Ritbkd7ph0qvUgc4ib+ifxv
         oVuite9HxGMVPRIYmv/RXDibT7SHk5TV/1ieTQv84QfWbL9uA6pW1L32euNKnsFMgj6N
         kpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374838; x=1772979638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvyp1f6x99A=;
        b=q69ZXriK9CxErWt7DzQNT4o/sQapLg/H0lehdPC/T3PbawxovLQzFOdIIaVG+R2T7h
         0W7Gj7vnrbhTFinjvjg7Cd2ayPjS+kESgIYt/W1Eolu+1UYR/ssuIZkxslBGHb8Xttf9
         GNC8+nScBWZx+c2jGuYs2m5F26ao/5JMzccKv39ATtE9WA62XgUHNIEJhdHBRb2NHfyB
         vNtD5+QwnxrCdqYRnZqsBMcLB7sDoQsyjFoyf+3kQoIYNdLYQYYeD2V30T+AvqmMqu+7
         pSTZoKLKPK+3wiMMm/A/CdUE9qQuuLYai2zCpmvSrZbkBnR+C81jtLT4gSJ/W0tlTm+x
         gH9w==
X-Forwarded-Encrypted: i=1; AJvYcCWdndeZx7GqzX6+yFw5o7f/ibmInudwLT+KkMEB5+Rc5aX19sH8FZ1vZsnDNmCuTHoM6oHKmFpVg2+V+Tnq@vger.kernel.org
X-Gm-Message-State: AOJu0YxMClHnSvy8PQmujfbHHJS8A5kF5KPspLU8eLKYKIz5WKB84CZ+
	lykhnNzOqm82IQt98V88QmHT7ClT21QJRCdG7ILJXnyOpop7/Q+eRuRICnAuFFdtjLYO/bdt1T2
	dqTVGypFWAeBjmWNTjtXiCVJPhf/kFndt3PP5NLnSNst9CYPuArJRIobcprbNpUKV4ACV
X-Gm-Gg: ATEYQzzq263C2V71dR86smTRT9j5jIfudyTv88UqWmi/A6t6PEYvsIeuBp1B8cmZ4Pn
	7zjbjTvf7qTg+4bD+BsVBu0Hq/Y3KKY32X/mxvr9OBFPdG6ZsGh+QP1lrWymwNE3Sp3Qb2WvZhd
	0iQy5oCt9bjnUxEOK9SAwaG7i4nvCoB4b/CVwHG4N5k4+PmiVH5Ysm9M2s8NCgujK5TMbu0fwxD
	nkKxiLSaSJuyWCp9x53msUy1Qcu1SB+kv46LdR/vQQW1EAc6JWpR6eneMd2xwNTVizVL4USwhZm
	A2XGWgy8NDn55EMg9Z+378FhSPQskO1GjIrelbyG7HaneW9gRb/Y+kO7ONs60j/NYxafmOV7d0i
	cAuiFZW9epPxUpq1aLc6JSZHOkLrImmdNdQZI
X-Received: by 2002:a05:620a:7087:b0:8cb:3fca:2f9 with SMTP id af79cd13be357-8cbbf3523c9mr1555905385a.4.1772374837792;
        Sun, 01 Mar 2026 06:20:37 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8cb:3fca:2f9 with SMTP id af79cd13be357-8cbbf3523c9mr1555903085a.4.1772374837345;
        Sun, 01 Mar 2026 06:20:37 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ad3daf89sm16417724f8f.20.2026.03.01.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:20:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: display/msm/gpu: Drop redundant reg-names in one if:then:
Date: Sun,  1 Mar 2026 15:20:34 +0100
Message-ID: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m8yO8Aj7LBafKhDVBiQ2q7TFUyh1Un4CoiLobm9d3n8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEsxe1CbyAMOXZrQueutCa3ELwRwqM/i8/pMn
 hL1XB5zZk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRLMQAKCRDBN2bmhouD
 10jqEACYer60vYtlX1ItfPGhn/WLPqlVtkm2lZtKLNCvW2kYzgzu7/h1CdIOXbtBtRmduySJly7
 jrbBb7UvEcfk1Bbyzx4GfKOGNU684jBGJclNMX4Hdl6KJ6vb3/AW2S46SjE5yfzheasziBzekep
 IVLSZNv/tou/WZzqhgHXKwYBIDcyvkmIT+RRI0cr9fA4XgoNICDaTBKCXqe5KBV1ir0ur7qX9zf
 tYmDhHNNspu1yFL2SKQTKoqQIcP05Kp6atkscj1vY2orM1XUqIPuLZlqHtB5xvzQpoTUafsd87l
 G4GLJjAOL/ra1assLZTa7eH0Y8KuCJNCHBN/Z9WMuj2kCppuA3FtpHWZBpd86SAV8fu4SZlcUir
 t5JDViWrPmz2P1KUiMnZ9gd4XnHK5Bs5q1xljuxW1LN2mymZ9TNgPfLEYJxyCSZCvyANHfd7cUY
 NI5yCwP5Mc+bq9KRz5NhT9aSZwGOBUcUTAtxhpOdnrHBm345ul4+7mgoat49uQaFgf15slT6mIp
 6lybF02CiSBQzau9PTo83dlIyul6xJSfa1dbcozXurMmzv4CztWLwn1KHKvHr9NOatlfeT4VcEv
 5SeClO10ZGkNJV0YbUXr/kFcPQlu9grr9eL4ZVsI7DYHQluenwsjGw4UxXWNfdWIF1Gkn0LJ1jt eO8J0VA1M8NfH1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMCBTYWx0ZWRfX/6DrExqtEv9g
 kxEMOD0KyjiIW4syyJPZRYQf/AkU4ZPIVa4200J64u/2BEKKtAJ8/rXP10WSR3WsNoLmGY4alo/
 ve9opPIiOsxy5OIHpML6NpY+mfNYOYPJrRgAQ54RvSQoZj5BI1tofxA8s7axv3GkyutGGe78vE/
 Lfdw2MC67l/fYrEXpi9Xhtb22TX2NGAsMriXdS3m/mEqCcGAMcdH+VbaHmAzbnogaAEuANqbKtk
 mTduV2/9dgiYVzS5D9Qra7VK+2o2+3wml58HkSx+F7B340fvPpj28MxF3WjdnN7DSJ9QHnrnZPK
 RQOKKeJ6JIZjHil9jUvna90j4xJi/6mD9fe0Ysp8dxgh+UvEtFVQ5br6g0KHoqrNeBmj8Nz2O6t
 Rj1+2IhK57g7yBFpzQhAJzVvJsfM2FE3H+XYEFeQrBs0Vko/oAi0/Jbhe1XI+2Q8K2//X4plmNS
 QxOMvE94bbziEWyU4dQ==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a44b36 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MCV8vPsGP35s7PfGzH4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3h8_XFVMrlnnKYMEeJ22pWHd48tXARP0
X-Proofpoint-ORIG-GUID: 3h8_XFVMrlnnKYMEeJ22pWHd48tXARP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94740-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA4501D030A
X-Rspamd-Action: no action

Top-level reg-names defines already proper order for "reg-names" with
minItems: 1, so no need to repeat it again in one of "if:then:" cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rebase
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index ec84b64d4c00..04b2328903ca 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -440,13 +440,6 @@ allOf:
         clocks: false
         clock-names: false
 
-        reg-names:
-          minItems: 1
-          items:
-            - const: kgsl_3d0_reg_memory
-            - const: cx_mem
-            - const: cx_dbgc
-
 examples:
   - |
 
-- 
2.51.0


