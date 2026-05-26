Return-Path: <linux-arm-msm+bounces-109757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPsxMM5lFWqQUwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810F5D32B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE9E30964B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31223D3D0C;
	Tue, 26 May 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF6Nei2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqn82sCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353A3D34AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786625; cv=none; b=lMqgUCTuO5TQZWPkEtXKGyMyrTEJQxAjMeEebzkQP8Zif4C/femC6ZFMxAwr8DRF4h0u32IcmZ89jVF+vH3768pavxtf6cOszoJwhs1eeaBlGuBUsXIdTT+OrYSak7UVMkuIyeJkXofVdl9YtXQsVAOJ+aCmI+zCNXbxx4dsAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786625; c=relaxed/simple;
	bh=pU8zTR/qVRAWQJbSPMb7T+BR9B6f8N0WanaJydtgIOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfSMjllABXpV3iBVwnUNp0wSt36PxzyWTi/EEd8TS98Hn+F+r9mz0EpZhSnUCpQQIz8d2HEU7EXUa1XbYhIt05bhBxWU1ucDTTCQTI7q7nirtVnpf5T/9wRNdcr97Js61w2HyupzByKdYHEk7MzTcs84vX1Wnew+Nnu28pjkJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF6Nei2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xqn82sCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5Pqaq079206
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9MpKqNNzUQn
	MR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=; b=UF6Nei2kcAR4RP7j8c8v7cCNTJ9
	DktAj2gBXt1Tpu3U+G6NQyzf2O3sQLftKBt1hS5d2O9VmccBAnwHpH9h+ouc6TFE
	ydCuk+1YJBD2rGQZPWW2kmGo3l7NQlH9MMQKH6L5ZI86sw4aPDfEc/D/Giueh2ee
	RpKllUKa7CHA+iHGierwa1OAm/4rABoYRTdbOqr9k8r77BELFcqyRxyDJcKT3ULd
	SRqmp04MxE+6muCQoimTI0H4Onb2UWon4VIwEEJjHLk5JLGqHNybY09F1UId95iy
	YrGAQ1DYJTCkd9InLI36IgYlbQJYxAJuQ+dqQCW/QNYKByI2rWamsZ6K0ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmabxax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc977e6aedso109568005ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786621; x=1780391421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MpKqNNzUQnMR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=;
        b=Xqn82sCjEeHmK00/X1g0nFwIwbUKiBF2D6Pta+tm2GfCQ+i2kk4hNh1WSRJmZLf8Au
         p7wdKse674l6TRXDt/IMV5G/BIUztlNt4fskTTN4PoZ5ZLONoMo6ZhzsSPsNLgFRXUdV
         gEHtJwUUUip6CzeNXqcwlh9jqqNzzgqpzyWnSAw31W5YdNgfaCa6Gzg45jfBSUYt7y7j
         l+6RctEJmZfqhyVZk6EFGAxKoTvJ7Ro9UNUwCslXjVJATFvbWZt8iWzccEXB6gH06b+6
         tKd/6P//AGNNo1LEi2SF4pq0Z/MdF7x5Ib3Imc8dPFN/SMjh/s8BdG5w2FFkAcupXKwk
         3ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786621; x=1780391421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MpKqNNzUQnMR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=;
        b=T/gS/igRkFhoh5TvbwhCFMK92a3chxoA6dS35PNmSz1LLFVoV8niQsC4Suts1/0Yp9
         8WC9JEEP8Kbr2Fhk94Pb4+Hh6U+tsfkTTXWFbr2kNuq/sEqnDHgZw2KWSoTy2OG39aOi
         eTaT9c6I+9lH2DQLtIaA5bU2d2YJpHFftKr95WV0r7NLRZFHQvDDwDxRIpp+fU2fH/Os
         eN8COYC8C4kjSb7vYkBHK2MobBj+r57hK+CUjUpp9R2jX/3loV2rICAk8PsrbCF2TwX5
         0nuRgYgp0ZrPZUQfa7+oRUPKl2GbPMuqA3twOSPA1YX5C3qt+IktvkGRyq9Vi6CsGQFT
         ynPA==
X-Gm-Message-State: AOJu0YwqlJDAyuH1aIw+/JMpNKOd0AAa7Qu6XDIhEtlD7hKwlgvNYeIG
	jF7KVLFYNg9VYRjmW5/+I5Qdp6i64jvCXrL/jntnAB3Z0rrgZ7dWXyKcmMoSe7E8+PlWoXst5F5
	FBBcdv/k4IH37bVg0ynpkQnwAFmUNlmx0YczgaAnRH7KrOpwp3kn4o7U2fqtLXx6i79dG
X-Gm-Gg: Acq92OF6BPVSyjIyMlxTmOmpr4ZyLvPaox7sAR8pm68JO8+mopWkJP3qe47c7mE4Cpu
	OQsoBKVegku0ARfC3wzFcFepzwYWYvG2bmOYJEjJgeQStL6w6ZAXHeti+c6iFbsNHs7sr8aEt5a
	fFV8tVHhZGxJU7Pg/RwcHm2gBC4PuClIYCQQ+R26UQrOAdRAYGMuWDhDIFh+L912pAHOCQGfVth
	rwv/4zjqiMVWVU/9xcRuG3BMx1TyW37VU3uayHeioUaO5ycAfwwW04YxgOuFZb0YxKDFVWpBrfi
	qCPV5lyhWvcisPFQ3YszfOI4gk4jyXK6lZaQtVSFUKsyN+7dMhR1A9c9FjPMSMGDBl6nQ4DUEq2
	3hRtwzTfFUXRkWquEGj4kCBZMRmpgpWuxh0a+bwF2ZrYxyZ7j5ZhOFAx57/krjTwn
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr186884305ad.34.1779786620089;
        Tue, 26 May 2026 02:10:20 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr186883735ad.34.1779786619631;
        Tue, 26 May 2026 02:10:19 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:19 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Tue, 26 May 2026 14:39:54 +0530
Message-Id: <20260526090956.2340262-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a15637d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: blBOIHBvMvyMbHkmTl6q-Xx1ISJ6qvC2
X-Proofpoint-GUID: blBOIHBvMvyMbHkmTl6q-Xx1ISJ6qvC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfXyxmKg7C6VyPY
 ADLylt8ecicMS3Q6eFBX7M6GxFcMCzRbnVKlyriSUUVHYh0TLgbbVygjX0BLPnjb9KHQJ2tvaUB
 owmnAjF4LBrKX611GaucOH1d1d31dL3JymlDj1v93p/Nazdb4BJ83FcRW8ihU9gHgGo4xn4ne1g
 jfwvWgBrZCM/r3QyJobuLJqcscWKu2cuOCaBKkXACBKD+Hb9wevxUCBYA+8y/mVfcQkNfjYW+7/
 dMWMH7+k0frsw9ej2kX31nOr2OCk4qacNnrGMHQYUI8nVdUp28I4LAdMsJAL9s0aqoGACwldaNV
 FS5gPXOcNn0V1uaiX6nS42+0A9NgxdF67vxIu6Mzor4cRHCpkDwBCWLLgiAimpt/8OulVrkpN8E
 9e2Odm9+3Vy/FdUxgAR07aqtSirE0qJaw3KZnFxH8pObEPfNcbKx4voyV0ySgXVl6G5H5EAFp1r
 c+j8Qban0khLOGxIIOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260079
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109757-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1810F5D32B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b75015f3ea70 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1


