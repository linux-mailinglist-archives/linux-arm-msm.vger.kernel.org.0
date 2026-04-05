Return-Path: <linux-arm-msm+bounces-101866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP1/L8Nz0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152A39EB7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B30C300A764
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E7B2FE075;
	Sun,  5 Apr 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlIZf8Rg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8pncCaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280163009EE
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399668; cv=none; b=GTCwC7SalMtWDnnVALGLzxVwHg3YGglUIlzCVS4iMugHKi01A1ZFkwruesFF/xQ9uv2/QhY4d5Ru+VXF1RSm4zEHvZ051Dxa59CP8k8YIyxoDShbtWL2BUDlYbsPyOghcunUfzRLS2lktCgCQTx0b7Q1Iwx9M2RJUliEa3vQHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399668; c=relaxed/simple;
	bh=EOkEtNOT+8aXcaxks3bgxHBrXFY/OidYwxMibsB6Zws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyDYj0MpErimY9yOGGQzt2OTW8/0XwGyrAQLFma5tGUOmdm3+abhJy+4qa5aW8MYvnjRMlGsfNGPPPyCzYd1p1ZbdvOX2mF8bwUPh5vmGkL7mzuC927t4WJz4QR/ml/UbFZhiP0ooVDX6DAqqi8MzzwNB+RZk0erLgKj+J7kxrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlIZf8Rg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8pncCaS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6352W31K2257193
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=; b=BlIZf8RgfOFPdHsl
	KtSIZceFaKmMm8lD3qeOP3O+zOMBDOx/avCrtf2MYamKAUyMa9fwWc6LijNKgIrD
	iv7eHJUphPCQ8WpO0C/2OeN8l6kD4f1IuVY7/vIbY4KbXDS0hR36hqS8Mrz7CLDi
	mzootK6AqDNi6KkaWs1JEkYEb8aABHTq84IKpwypVT/bSWfnW3qAwweYJ8ApZBkR
	lbfcJmwXbPdZSq5OwiCO5W7cL+d7WzHvBiE8Vi2u+sF993aR/Hu1njO8X7KuQ/ZC
	b+dWUN5H2iQhnndJoKGElLM5hOhBS2K5/4IHPtTnAh/oTnQet+A0Ls2wvSyg7jR+
	pG1FuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsjjm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso29026051cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399660; x=1776004460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=;
        b=d8pncCaSNaXaiC5z/Y8B6Vrrbc8T3OClaeWIp2GQBnDg6VU4oBDSAuFCkozGFgi3/h
         tJ1FiBkqLFec0+5GKmKLKBinwjgNVbRdjObK4aY0s4Wwby/y/Ca7ZtFW69RLrgMg6fML
         tVYHYYl1GffosIcEjCWUU2D/jf6bFJMmswt/U+vSSkuELHUqrSUIWIZcDoxv6kYSKDMu
         1p7L/t5Yy4ljt8bq3dvdv5wRomtDuOzO5XUHE3unYoVXd8iUNDcloswTHvaifzaIQ1zj
         diz44VNVblD8Pa4mUoMY6J6MStF3Qb7RJYzIRogLMeYngAxWEfR9tEMQMsE+fXBrhnwM
         mWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399660; x=1776004460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=;
        b=fZBpTbwb7l0yHpDQieod2YHboCRiAfOqwZWFD0ZhVylBdOltNj8ynfCcWfQBS6Hd/v
         WSoxpXQP85dRCq/jHUja/W3ArWsoG9NNNK9hy//pOTbN+ucSJgOxr2+3zSe9qVDPyK2x
         QaPavoGDHZ1c1Rt8V9mWRRc2sYUL0shNrSRZRk4A4uRWz5/8BvqXwwLDheGM+/jkhkYd
         YerxmJ6s4SayKaJsjOi46QW6PLGU3NvYv82DWngbDo4QBDvYqonKMASmQWFaoEk5O2oW
         2zaXR2al2Bi0ID4lpwSz+K6k/hDLaHygO6VCkjC5Be3iXMXkzAeAB+hHCGSFYmqcOsEP
         4jyw==
X-Gm-Message-State: AOJu0Yz698s5z19f/qpee/YG5yuoqfNNKcIEA5z5952osWZCSDtQnAcg
	PuEFRar55P2FCqZmbhinyYaIAN+wgdtt+b+998CiVVj0bLVvYQTiFZ4emrQofhMYxw7K6m1ex5M
	wKvhfkLXu3qX+GdxHLokRPKHjdjlL54P6/JHkN3PrwKDgubyd4TwP5fE4o1kpyWNExXHu
X-Gm-Gg: AeBDievh9XHx0Q1wLq6WAiaLQkpkXtdVLApG9EgmZub81e/r2vXjXWWQl09+jQNCItZ
	dHAhmfebcs0Pi9xZh4aqhsUBAdhBEGlCilOlHuKMSMswKVsATSqKBlQw4sPBJ6QAFl2pd19n2Nz
	OwfzH6MGMi4XxfM6ar2fXZCWPqSGL5XAWS36P6a624+6nVOsbaXBlL9m3gFLaYQ62Twty9o3D0x
	oH/AqVVdQN35dd5sk+KKURmMhIHOTkZBrMNBm9jJWzD7GYlrONWu2D4RJjBB/AVl9uTSgVNcVvS
	0m6njArFnbLUNe1MxQu7rqb1Gh3prpEtMUtL0bF4zweWzIGcEvoTx/e4f+j97KwWVOtljxXvmdS
	tcdrpDyLYipSK21myjVT9mhTjsv/KzKdISp3250jdVuI/
X-Received: by 2002:ac8:578c:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50d6ab31ba5mr124019371cf.41.1775399660389;
        Sun, 05 Apr 2026 07:34:20 -0700 (PDT)
X-Received: by 2002:ac8:578c:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50d6ab31ba5mr124019031cf.41.1775399659990;
        Sun, 05 Apr 2026 07:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:01 +0200
Subject: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Correct
 DPU and DP ranges in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EOkEtNOT+8aXcaxks3bgxHBrXFY/OidYwxMibsB6Zws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLbM2AewbgW90eMtXRPYcZk00euiw0da6sNM
 mVWufQLjLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2wAKCRDBN2bmhouD
 1+CgD/4pzOmY205An+ABBRTwsCBfJKqPrdxefVHALEWnCfKmZkhKJcThpQ6jSXzXTg7dh9f5xnD
 Ta4jGfx8N55HbLg6mBMMGC59noBcvqHi3cf+Cq4Z3+evIHfyUkGVw/JnuXCM1DUwpaoFr73Yv4C
 eROoW+pgjNC6jkGqSSzziamysKbT+z4RZcoXLc64tP8F/kGx6W1IV4eVC/DJ9DuMrD+++eCes5r
 m40ecwVTJRKIWYrns0TM08fsjKxZvej99CQWCT4Bqb3owNekF7ZSpqsFtg4fh9OZZGCurXqo874
 a97kDj6gcSkLfm6B7HdwWYol2Od31jdS2oMWt+HKSwbJl/KhXoUAoSOnDQOqHkB7M1q9aF3rdne
 66GqGR8FNbhCvanucssLTXSHM7Sqi8nPpnUy2PmG/8zj8M3kuHGbOqGl9h+Y7SHrnw0nHdGlc8s
 dQEKaZfh7p5FRo2faXNzVetot4cfgNarv3+1agGqnvGwOl+N2VFD4Qq6VPUZxKQQMrAgVtLKAWK
 HsoiV3JooAd9NGFA6hS85k9eA+p7GlmRmA23HmEevj6b2KDKotlOMx9ds0Tt0DkJDzuK+NYeX7W
 mySY98pU5SWL7JZMdGciP/x9CwJj9S0s8wRUom2WWrjny6RFjPNNgcjV8E77qt7ucBXY4Frvgs5
 ax0Jeh+JWKZp2hA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d272ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2E8fMljBJZ0eQ63lGZAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KPHzS9KeKTENW5s574BNv090rdg7VNkG
X-Proofpoint-GUID: KPHzS9KeKTENW5s574BNv090rdg7VNkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX/U/FMFW5mGp3
 Q7QRzWPqfnfkaoJ10sz2qycyT2EvFgZlqvyOl9n/Fv5AyInrs3pr3H91wAXYmffEHJSz/oF45IL
 EeU1qWtnGB718q5DLX9ZQU01+VAojba5VHC3ikXq5av8+wCj6mSprH4sjPNHlw2x2OBStyQb6eE
 JaiuIc1ZRUmSDO1wpeIBKnYDXTE35A4+YNxskOegKALiTaTcne8AAaHtqGxrgx7xrmdbG6vC3cv
 gma0TNOegoNUZZbT5vQEZv9IoTNLrQf2M+uYuzahZwYJ3n3imnLbbfvRpRDlz6PHp58liuB/l6H
 XONSUeFL9WlU2JXWqIzPvVamySjDigQnkCLOOhDHbRks1643o0UkcGjMaJU3CGOUZG7SMIp3HOm
 JBR381Yud9fAKSUf6a30nRHWKJD/A12lwXCiaVA3RVkyGTT3EZ6vZhQinvA72j6guSsZyApTrRs
 C4iFGsVtY8VcwJjUkfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101866-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ae95000:email,ae01000:email,qualcomm.com:dkim,qualcomm.com:email,ae97000:email,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2152A39EB7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long.  DisplayPort block has few too short
ranges and misses four more address spaces.  Similarly first part of DSI
space should be 0x300 long.

No practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index 47938d13d1ca..bd4ba91a171f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -119,7 +119,7 @@ examples:
         mdss_mdp: display-controller@ae01000 {
             compatible = "qcom,eliza-dpu";
             reg = <0x0ae01000 0x93000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp",
                         "vbif";
 
@@ -304,7 +304,7 @@ examples:
         mdss_dsi0_phy: phy@ae95000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae95000 0x200>,
-                  <0x0ae95200 0x280>,
+                  <0x0ae95200 0x300>,
                   <0x0ae95500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -388,7 +388,7 @@ examples:
         mdss_dsi1_phy: phy@ae97000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae97000 0x200>,
-                  <0x0ae97200 0x280>,
+                  <0x0ae97200 0x300>,
                   <0x0ae97500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -407,11 +407,15 @@ examples:
 
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
-            reg = <0xaf54000 0x104>,
-                  <0xaf54200 0xc0>,
-                  <0xaf55000 0x770>,
-                  <0xaf56000 0x9c>,
-                  <0xaf57000 0x9c>;
+            reg = <0x0af54000 0x200>,
+                  <0x0af54200 0x200>,
+                  <0x0af55000 0xc00>,
+                  <0x0af56000 0x400>,
+                  <0x0af57000 0x400>,
+                  <0x0af58000 0x400>,
+                  <0x0af59000 0x400>,
+                  <0x0af5a000 0x600>,
+                  <0x0af5b000 0x600>;
 
             interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


