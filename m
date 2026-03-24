Return-Path: <linux-arm-msm+bounces-99456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLXOE07XwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B72FF693
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19DAE308BD43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBB519343E;
	Tue, 24 Mar 2026 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvCZIZhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E52EFUtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0C1624DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311064; cv=none; b=mS22J2J/r0xB7PPWS4vlnVEgkBskayL/rkd+vdhxjZWyPAL9kczcB52cw+4dAIeOAG2FVa5KlhSgm8QA7tO3qtyYumz5VkRIlljBQCi0ZkfZQQLOe44gE9PFPTGI3UlqaA5WLmL+AjjTb9qo8r5xHzWRmwL7tS+bYfXBHoNikJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311064; c=relaxed/simple;
	bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJ4Yh2i2jiUKn/5IPC9FER1bmQ836bVSgKlSheXgXEABC5cC6s6Lmp0S2lh5nLkDqyN4rsHsYjvWcWwot5Ucff8UCOEEeM9mBcOBk34rXHmr1ai953WxdI63htH686i4XiJFVVsq8E8FAuqYCfieFwJqUt9TSESoCk860GMWoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvCZIZhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E52EFUtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqugC618699
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=; b=LvCZIZhggnhmaqOm
	3vol9ed7M89SX2dADkVSkgrrXQnZz88d4fXjwaQbZxuihlxWw0WYM6SuiALIkiI7
	lvKBLCY3eg3Q6Q9q8nya84TBdwuYas/FHXKJBji2VuxekDduKaUFoETzYTwSgctc
	i88h2bgLW9Dl1e4GKCdlXCfxdiTB72aiJ8jzV7U6qDqAocRXW9sGtKWVrjHolqbp
	vK/k2Z/wkBHrOOvgtYnVtnU1Ht9r7+gWB7hap2c+/BBqlmihVcCfNL8cS0Wz+as8
	NpY9It7R8KJ0p6KhUEy3uXgUcvSOG8wG7EYk9c4VIF3X3g2tfMG6XG/Dqtns0HU4
	zKPcjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgk7tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so351962171cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311061; x=1774915861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=E52EFUtqZjSp2A3rmTEp46oHV2ZMYobCPQEaTpG4gHURIM9RjCqpBz77hmhTFEv2UY
         /QnBT76YVU5ZkI5L+vEFzZ54gAnrw01SbGos4BkZZiNUg8Z1P55ppOC81fpTlclUowil
         Efy4jtHPt+me99bKe+TKTT6fQIZWrrnzUdNHKsJeRAiF+b6FExIp4KcdBuPsAdL3Imnj
         ITQq+//WUqrO0rHcHiOBAgOIgu4w76Jae6slO767diQ5sUZRnu/TX+wLbbLj70sDVvOj
         Cofr8c1gk0XA7Wd2mVHYXUxP3UZjtfN4ui7GtOY/CbPj9KSkZhOgbxncIRAoMvypsdJn
         D+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311061; x=1774915861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=lGlgynvSaSne/b0MG/c/tLh+VyqChsnwsMQ7G3ocrFKQWPYM2bgmdDDK4bxMOWXWoH
         LS6HvHUtOx3m91jvs7sjLM2BwinESRUTzfl0DLe+d0Iih9xvhFX08T7iUX+eePWT1J6W
         0EpqROr+4PkhPLFkAnLNpepD17B4Z891nKhm873T2MeuvsfBwEFRmXIZRkB83hahHXRB
         Y8FEBGIsKmKqY3jnBYekB9224G9b8EAhzeLxLTdizYr4tJr/hgVJz3q5naXbrGOj9jRH
         TJn93mnTgGulHX1L+lrlMZ4KbHVumT4pHeaGZGLmjBynjTEPOIpq5TzMy0bPVayYHAB0
         ioHw==
X-Gm-Message-State: AOJu0YxtgfefqWlGuFtFL/Uk67EDR8oPyyGkU1+dSXvILPx3V25lyKWQ
	UjbwmySzqyvbxGHqspQ/DdbLN5B+YB8rJy6e6+J+DFlHbz8l4xFXPmFqulHVTlMmpuu1YQyY+ZI
	I3XzuL/5JRiNk+0WBdzENbKkvgWJjlNwZNoMM1p8gQo9MUgSieR3esgt6yqUrom5cmqZsTrrWcd
	17
X-Gm-Gg: ATEYQzyM3jhToQiXmz2cKTZA33xwEjBLRZu325Vn5rPtJGmIAyyjXEQ10UYvV03ORnd
	Ip8v1MIDDpq/z/CptPxEVo2k6f+pMpvawKN9LMruDIzHceZh0HsjF6OC49QMOrghacj3m45haxl
	gIAtnbGwsX35fCCsy5ktlUQJ0eCc1K9bKGSUUn7HtPpd3JiRv30CGUXguXeoM4LRuL8X2eYu2iI
	gbbNHLI4v9aWWZzZIWapb3AIC3zvW1oWTS+cI0ShOENbhCogpei8UxAUO2BK26KhTvf3ZdtrTjA
	JKEQZnarBc4H9i94si+ObkatS8cnC1xvAXX7FonUfGzr1xjzSIBT4MABjFTS9JWBCfYNx1ySnvq
	GSdTQvQqqKyhJQ7Jg7b1f+ZKgR4M4yAH0T1GuuOhycA3HRoSJuQnC8qRrN31OhoOMvAJw2nSSYB
	ZdEzJcuOy1aY/4C8fvje64PRUubpS5MiNvRsM=
X-Received: by 2002:a05:622a:1450:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b3753b6a3mr213724871cf.39.1774311061099;
        Mon, 23 Mar 2026 17:11:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1450:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b3753b6a3mr213724641cf.39.1774311060686;
        Mon, 23 Mar 2026 17:11:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:38 +0200
Subject: [PATCH v2 2/9] dt-bindings: interconnect: qcom,msm8974: use
 qcom,rpm-common
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-2-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaGm6tKbN/QjmKWueJ3FdR4wKXZ15RBvv8Tf
 7pGjkdBhI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhgAKCRCLPIo+Aiko
 1Rm6B/45NBZzSff6ONSMtyDvDUOEj+cTeJXB48EL/w+crDAX6/nsVQCovh0//B8Qv+7OM9hXf6i
 lwSacIrnxswnpOJeY5s7c1Ato50PCQiJhmbs0gu/rLLrwMHXCA65BndO8Ta08PLTaUlQFRa4wvp
 if34r4qhJWfrK+ABKB8R9FLY2LLMIjFF/3IzdmDhlPyPeBCM9oHpJ4320PPMJ8BAJIq1Z9DLxdI
 w1eVL3GyUBV+1VCJPnKuG8pBhQvpCxJLejVojKFYl96eURN8ooLe4+rJ3C/NOEZ+jzKICCVXifI
 QaEClwX6W2WieVUeItA2OiARZ6uAse4opLAWiinLASDrb5de
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kZ44L9PGdw5qLGnlozEchB8rJR9K3l8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX8g7AphGv7+pP
 61pL5mJK6leRzbJY9B21bs53Cmk1koTRA/qjwi2fZmo1HLXtCDnEq691J2JDdxDcGL66LDIaqul
 N4/RcFcZh6W53TOdOj5vfaDrWq3e+BjBlDs/zYQ76X/gVvGgVq7sJB91Nssu5cQK7q7vcwlxT/+
 SILuQih/5gNJF9vN00XW8cLyRAVmgp2m/B4+x+mLMGhQyriWWkiVPslJrDuiFiPrY8pm1qXjCY2
 VIDNpQ0KjspR9ZWfXzi2SRKPowVE7JyQDFpgU6PzToKDj6k3ED1TlKp8JRcF4rbynh9U0XFT2WF
 w3vVHCxGs1Q+lJafB8Rdom+NtWKx0Gmh5N2Vm5dmP44p+7pAdnKaikxUx3seF/UN4x0bwDYWKYx
 cEAspnFFXNiOe7kcpDk8q86YYJsX+DXO8Jwpaozl21uBnz/y1LyooPrIp3uvL1g4j5clR2pYLWl
 RJytEjH0htPzMThX/Ew==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1d696 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wtXhX3L6yvnwcyBavz0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kZ44L9PGdw5qLGnlozEchB8rJR9K3l8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99456-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB5B72FF693
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use qcom,rpm-common schema to declare interconnects property instead
describing it again. In future this will allow the platform to switch to
the two-cell interconnects, adding the tag to the specification.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 89a694501d8c..b35f6dd11c71 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -26,9 +26,6 @@ properties:
       - qcom,msm8974-pnoc
       - qcom,msm8974-snoc
 
-  '#interconnect-cells':
-    const: 1
-
   clock-names:
     items:
       - const: bus
@@ -40,11 +37,11 @@ properties:
 required:
   - compatible
   - reg
-  - '#interconnect-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: qcom,rpm-common.yaml#
   - if:
       properties:
         compatible:

-- 
2.47.3


