Return-Path: <linux-arm-msm+bounces-103871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGx4Dkj35mnr2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:04:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73A4362E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AB5302BBA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924A526ED4F;
	Tue, 21 Apr 2026 04:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9AvZyWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfg/ZJLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7A28002B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744181; cv=none; b=S3B2hd76A76/l9kcaHwBe5aUTaTNGl6Z6lizmfMh6o7IGWlW/e+xxY2BlnmLTp6hxC7KfwuS163XRfrdumFsXPad02b5a4o1AjkXXD8Q10Y/qksDoSuncCCvb+7wLZJrJA1MFBocXqtfWQG5Yf/m50zeJPKoDOlCZS2TK/L7BbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744181; c=relaxed/simple;
	bh=vcsQuhnDkL9+Iv3Dw8GBBDjaqeyoGscxrjNNos/NwjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD1ImgRNj9dCE0l1z18szqVb+HMlFenbK0psq5tnS2sz44WpSRRAcPxjni1UGthnGSnElr2nqfECnp4k6R84Zc3NtvfpA2V3spc9i1HmhSssErQ1Z8ATmZ5KP0M0QIdrj5RhEWTA8Y6BSp6vaG8NWl3rgbwfWBw6uzg9wPUYw0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9AvZyWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfg/ZJLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L0qeuW2281695
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3x0JB5BcAC
	cHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=; b=N9AvZyWYedSv63qf8dZfaM4W+Ul
	aD4SPOBMBvJl2VOzdPjd5UbAd2Elo5spATpWK/jijdDLiw8e4G7LAI3xlZRSt6nK
	jK7THx53r0VszrMxd0G51LI9gpKJDjCoya4D6Z7YnISjswEqyWYdlVqfWOmAtG5x
	A/fl2B6ygG6SKtcZ9MNSNrbGoj0gSp76sahFq5Zrtx1fbFYWcWgQWhlBTDYl8Plm
	Xnl8zNR8v7tmkxqjc3qPHj+906NPopZ/c9DPRAmEd64wbPd+1VL3bZyXRpviBx2V
	Md4k47cY9NlKDdED1mrzpdvfT9Ez6RLzC6owvDZAnqP+NrxFzwbFAPljrYg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59bmw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so3544211eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 21:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744178; x=1777348978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3x0JB5BcACcHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=;
        b=gfg/ZJLavNiqI/C9k7/vcc994gTKdFiwYKoiw5oP25eTbjqi3SZoxLMwHviPFGb1n/
         TxOiIpk5F5zMmggbtkBLs3umlCzVRoXfvTzYIK2IGfHVshcWUvHp6PdyfyAb6mq3Dw2R
         5N7mnOizMTO0Nb6KoQx7quV0GJ2BDzJtIThNmBVeLUKW5UANNxE8f7jCgCXy1fPn/w5h
         e3FEFrCCIURNS+xbgQUaZT7yzV+/gKTcBGqY0tN1+oUf5aUhaw2avYBmkoB4+SbeJvY2
         FjVkcOZWUyp12PICOgpQtqD+yqY78yTt+dANcnPHG2JyFDlr0iG5g1KfGgOKpGlPTzjn
         GGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744178; x=1777348978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3x0JB5BcACcHw+7lDDPFrwz8h5C7XMe9uVAJ+oaXRo=;
        b=pkBfGQstYAjRcbAgOL9kYUK13gwlQvOuGuL1UZxzknHkWHGB4KZgJIa4vZ+FU96wDO
         57J2BFkd5w8Ry6jhLWMY8Zz/+6oBkqIaGRsxp5nHkC6fEo6/uy+hYsV7RRAK9SadwAyw
         AaMcZoO+Che/e0fd4CDJOUeOADl9zUFMynSOpbx1JnEd8Ev8yVFGwjUBZFB9+w9Y/CZ0
         OLoQ8UvAcUofBEYmAx81GshFhPQbS8lLfkYoETp7a7ZGs1L3w2yll1ceyoP2Yq6EgczP
         93TLwYwnu6d7e6wMOwQX5xL01MTFaMwyUaAbRflR/etCAiW5C/x1gG33omdb0jWJIQ5G
         0DAA==
X-Forwarded-Encrypted: i=1; AFNElJ8G6wy9kIOObSnwc9Q9VkLTGKx0KV8RHhpdndgliOCGYl1nWn8OwgTmnxZ5gLrT/hiwauACib6Dc6/IZxiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHhdt2wT3pXjTKfFWNQurUmUxNmT7izwCtMihSc+DQ7mmStIK
	rHExrdB5Uerz4GQEkl0nlPxPCSSe5vNI+vhBd5RgTjhaRHyuCihpVa6Jfb2q66cA96Klv+w7qL4
	Y/knWcV2ElqB9ogSUh3fSmJx+4xUi61jQ1LZ1AkHwFqZ+RNFsjcMwyAi9C8OAWa0a/los
X-Gm-Gg: AeBDiesZey5vOSJnfZSguQFT82VzilDPvPsog51MfwzamHwxeY9ZhQV0Q+Tf8Zj/Jwb
	ALXEophRjVaVHqO0BdiBUyTOM0SgRbXd1tj2wo0KDAwJdUKduuCBlWUXRgIZZ8+n8vXVQtyhmYl
	BPOy/qDuivcxotgluFyW9diB499ycjMQCAFlQcJMET1kIlblhu05OY9c8MJK+4BPr3mv5TFcjhD
	ptL9bUJKvN0aUiReu1hslGLHGFu1P28NVcVPzv0BMAwBM+VSTzSWvX4hxD7sbCDEHl6Nn865Man
	qcR/VcU0nbl6Q9ea084X8wh/FDV8yR/51NFLogGAAaUN4B7kbTSZuVeMajthF7HyapQQW/lmnU2
	yL9SsB4K0Qopt5N7rEAsDZU/oEP7kSzbPo2oGjYkpnD1I+FbpqsWl4i7ISJlMHUFce19GOR0O1+
	s03IzAVV6DgT0JmOAx
X-Received: by 2002:a05:701a:c941:b0:12c:87f2:90af with SMTP id a92af1059eb24-12c87f2925dmr2601759c88.12.1776744177607;
        Mon, 20 Apr 2026 21:02:57 -0700 (PDT)
X-Received: by 2002:a05:701a:c941:b0:12c:87f2:90af with SMTP id a92af1059eb24-12c87f2925dmr2601741c88.12.1776744176998;
        Mon, 20 Apr 2026 21:02:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:02:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:30 +0800
Message-ID: <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V0noSuiK8-_4aPFwqE2e3LmGeA2RaQSJ
X-Proofpoint-GUID: V0noSuiK8-_4aPFwqE2e3LmGeA2RaQSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfX6oZVJrtT91S8
 PJs/3nT12yuDpRD/ycNnqZQUinT7z1kTDO885nGu+vuX68nUzUAm5InTPBzJ1R+lqXEtNBEYcQE
 DT3bA+CfMvcnrWGmjQfM867L2+KKgKuWt9BnkRAVcWfIf+wflDXb7oOh7IOYOyOti8q2sK9SWtE
 dh51Z1y4OR/Itx7K0cnP4zEiM1Gvoa47krBzaDJwzacIQMUpe8NxS0thoexLXTSNg8bqdUaM+hA
 0HzP61H/clVCtmiwD7lUjaOMxA0H6/Qpi+UJXieX+dgptNvlr8PI0GQXJe+d0IeUISNkBYFrM6i
 3sjNvn7RyhS2iEHqf6lyIqlvca3y6IhZ+GP9sRH389zLJHQV2U1MPczfqq6Fa6gFHMOzFNDxhCo
 I86xHRTl4QTxshzmYkJolV6jtavWmoPGzcYaPT8Gp1tEiD7bzGxcOHgcOW93zBSUTU4NlH2ryMG
 OhWj3Oge5vKKtDJq8Sw==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e6f6f2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qdfhL6B64FGM_Lu2SakA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103871-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B73A4362E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where
the platform resources such as clocks, regulators, interconnects, etc.
are managed by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..be4657417192 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_IPQ5200			765
-- 
2.43.0


