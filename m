Return-Path: <linux-arm-msm+bounces-91087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJHBC2OmemnF8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:14:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3247AA261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BC2D302517A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3846322097;
	Thu, 29 Jan 2026 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbP7kU0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIXVtPYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4B7260A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645655; cv=none; b=GHf5X7RQe9ULqX9wspAd7nrR4Msk1c1R3guGI8RMeWMgtkegDM/WBp2LMeFWk1dm88RpOEuT7319t58fzkI0PZndGAPe4KPRMk72I7ItcAvSGUm8h9erU0gLeoiXz8QI8QP79YgxVfLhR9cpdXyU0feNlAq7yExV78yaRIlhK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645655; c=relaxed/simple;
	bh=ALJQccgwvxMyPy4jgq72eBHgDAc/So47UykbbYk912A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L4qDS4EzxB3zqm+qUWD1RW3rNcs9XQHvjtIykG8zMMEz0T7i5wMd/XufnZtbaZ32Y6fxCrIiTYyP0A3KnzBYZkDPgCeygOBf6iRTyq1CKlZTGU+lVXKUm6FrBzR//LYReVYlYskozg4v7Op6Upuai42N33LWLDWCMSbQ7PIXoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbP7kU0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIXVtPYC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SIGe3x3906935
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OfaylnNGhIk
	IHTKate/d8zrf3cT86hekrNWW7NaHpDc=; b=YbP7kU0zuSe6B+DhpFRyASXT2sZ
	ujd0+OGIhF6hKV2c83JpFgRtRLrUoMbJYl+W68lG3nrAiA0NrA/h6EEy/TaKaWvU
	963TkcOdyfOWhYL+aeetAvpr8WVvzGBCaVmnaHhDA9hyV4NT7Z4rkK26mPjT482j
	MbARou1+lN9n3SF6lWiExp4+qPnvwqwqZW3z5JnBRGVRlIEJhy3ktr2KgftPeiDX
	HnFyCh51SvA5qYPTCgY9/3J95lYT5eDC+x7iEgtM3oNzAzw04YqDPAL0PM/EISmR
	x8F5mhPGKCwkgi4VgMnpWjNeqETAuoGwFz3kROUDAoHZcTd61+qSlcD7lGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxht61f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a07fa318fdso3257445ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645651; x=1770250451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
        b=HIXVtPYCo1KKEyMu7wC7t19sJjeyRiV5t6KrXtIB8G7Jm09BVWoRRKSwTy5gbaZu2i
         mJ0qUMH7/5umFmRgAbaNrTPU0RufTodWHKQOtMwtOjYs2kgmAEAXmMZXXSQUVAIxMkev
         lI5PzTonFczlCLpmjBLci1qeS8dOtP4rYY4AI7783cfknnD8h+9uSWfAko1IJu4Wf2kT
         XBwkoJdvuWcoBkvRSRgJDFyMwR3MQYnKzu+g+0I2AT5+8wnOm9P+RP3ZFD4uRfxCkfuR
         U+eDCWATquBMVcgu61oAzzOZzHBdCbqnYuqAJnU2Zf+vlt8Qf4XWkwTBi7KbZiLOL/56
         QHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645651; x=1770250451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
        b=IOTEtyBrfsN/62cX5vACcsUX7r//x3Mxs5HiLfTfei1cssxPlSMd23HB269jNkBfnx
         QCiDYY/TBLj+7xhZSqH7IPaL35ZeN3O9uzV+P0hDOFKLBvzpMeqKslrMKMn9bTrr4FRb
         jEpSHdSrDeKuuyMsjXwjcfgybT+OA4p0Z8KrTlb/Bgfhx13MARJRkiH7SE8HWomrj4Yd
         ZPLbfCTytKArNpBJ54VPFW98Qd2sy2SDbmbyeQD7GodjV+SphONAYIp3FBJstrDnuHC/
         WJqHpqcoehnP1s+jQoRz1AFH8V6z3/1U9n6LlmRtCDdkVhgaT2cyNzCNMSL7RuHY9Zyr
         RFNA==
X-Forwarded-Encrypted: i=1; AJvYcCV+oJFB1EASspIObElSqAnRP2FhwVrdWiS0qjZX60kzCxImtF7f3MtHpkEN9KXTFt13VYv/ZiLwCby3jND4@vger.kernel.org
X-Gm-Message-State: AOJu0YxUXEQzUHqE1UWUPpSL0LsIwLJyr30XwQ3cFl7+S7YWwBDoQmvo
	aM7KBtbtz8vYZz+2Iv9PNBg6BSis6wvpxsAwIybQKMlIYlTo5AG60x0qontNvPVVB7TnI/ZtzuF
	JHUC31htVjW9UWMoYrQBD6NIiegFi84RoUSS8e8VtZpZGPzuA6hGLpCiuwiTGCqDMMTI2Aeb+6A
	T1
X-Gm-Gg: AZuq6aLvg9i94WXBQBK0w1o3pIdIgXG0ZxnuwTqx272H8GwUS8QE2kC6hTNsRUNVzLs
	54UDF04BethZae6cKuIDvvsi83g+RWAvFlac6EUUEpQ+CRpoW3X4gWz1Pzc1vvYlNYgeAw7toya
	zNFCxGoToyJikSaMFsGB9OXcxiyg+VbpiT+/5NFtRGABfcg0LP7tuLTXNcWuh9mBSP4Rb1Fr8R9
	3st58WCIKqJGG2Ghhjd7I5nXTmeu1w62/XcvJmLVNVGAbdAaegzCnHwr2hRXy1+0Le0fPPmonG6
	+LnGTLepJgutrO7xSGhhPIu+rZYEYj94LLZgyzzEjvGCQP2eHPwRJJRvrd97aTq54/PJU376men
	zVP2kXYSnp8w4DuW9zvZeWrsz246zXZStGSulDRNuOK1J+uBb4JhLu+ey63LjJhHsEhwF/Zz5Xg
	aqeBGLTin4wnHER0rBmd6+7ebE
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr58323185ad.1.1769645651358;
        Wed, 28 Jan 2026 16:14:11 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr58323005ad.1.1769645650899;
        Wed, 28 Jan 2026 16:14:10 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:10 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Thu, 29 Jan 2026 05:43:54 +0530
Message-Id: <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -1vRRUA_HJNeZwAUIzGZ12PZNcMIHitQ
X-Proofpoint-GUID: -1vRRUA_HJNeZwAUIzGZ12PZNcMIHitQ
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697aa654 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I8BSNejkaQ8d0caDSfYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX5L4up/DS1Fq3
 xfJRb48sxjcbrqev+uHEtDzjTsGpoPyxDP+K3SG3Iz/FPzOqIMpfdQxXPpILjzRuVUDPZM/n7gw
 T9IvcuIld7jcw/wa6IGkDXGTn/5fAG/UX6cFTWtZJFtD3wl7m8b09Vhjr9Z4pixdxZCCVw4arXs
 I7HPvTkOdV3dW9kDBbjSA0Kc9GoCKwyTleVP5T0m4cHpRnlE/eObH9XQQ7ThwnDTlPr5V2cRoX7
 pmSQnrSmeCfs46Y66lYmGEV2WjZlX1+EbSyPAEnmgxGRXaOapwW7i76QFuyTHnKdQRRg6iTjPMs
 e5pe1shlEy1aco6uOtj/BTWHkeWgiTiz+0Op35cuxp7Wn+OyVGC/+GtXnjEatz9XGu8MV8uJHba
 vKiSyb9xjBD+HfMKAyEbicp4pCcdxZk+TS3jeBUBYNyo7qYwKBkLcDoPoJ5FLxsKgB3G1xughEh
 paf1yJJ9LtxXv4PEPiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3247AA261
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur ADSP PAS which is fully
compatible with Qualcomm Kaanapali ADSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..fb6e0b4f54e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1


