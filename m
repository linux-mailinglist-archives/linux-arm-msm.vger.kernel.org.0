Return-Path: <linux-arm-msm+bounces-79876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78668C24D81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BDEA4F1A20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DD3348885;
	Fri, 31 Oct 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O86p9YC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaTYxBqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29DB348472
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911316; cv=none; b=jETu4Xkpl0U9U0BTdRsPSgGQOTYlJhdugEzRaBLHwS6t/fn7mJeX+qRsYOf8LUPfp8i1R6nxddnzGBki7RYmxrszmD0banVbseID+7a+cJzRhFCwcsYCsZ8FzhLb1anIgQrPHAA+hrLNNEjXjjgflBRWsvpxu8y1LWtTHRETzCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911316; c=relaxed/simple;
	bh=Af1tMCfkDQ1lQfRQaKUsYRHlEVRdIg23yVqZC+J8rAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DB6FUaWdy+keQQq/+zG5f7leN0ptrTxB+FazFc8bEwK5oWjr/114aFXIqAkhIMFn/ub9KUIark5ky0sgrtT32Q94eFiN0cMCuFg3MbSQnROiPgShtiwTBl8kQyoCsyX7mFo0w4ZHvpO3Mcp0vCJfHNUxCsS84Vui4npF2PHHzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O86p9YC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaTYxBqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8dL8d898808
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4E/WBBGg3Ro
	41UM204RDH20wPcFyThixToHapyaAtXQ=; b=O86p9YC0yydZYc1gQ4KVQHVEx+B
	5iWNJgUTwstuR0RcAo03uXagPh218nIJGfTAXznbyBLqY27IB2GrEr33GvC0nVYM
	FZsrtXr5+ywg7GZE964OuijP/TkSy6OBda68QSccxNQKDphHyDpM6FHXFYRFfh4r
	GGOQRe35Sq1iRI10vDtKC0Zw/02sNRsCss8LeZl5L6bC5DyfJb8hGWTUif2qz4Kq
	qil9dS3/CZmP3sEdFG4TrToNblrJhpmfwCkTu2fpH5LKy9D3lnWmfiptKIOCfgtj
	WqbqzIXbE0dQUHwZtQSdj37tk/H8JB5hoZJP92AOgwKGhx2rb8kttwiZ6mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb21xj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8916e8d4aso96373391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911313; x=1762516113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=kaTYxBqhRnaMze9lcx8elsqgviNLqoJl0wVAsRNXV/y2J5oXErdgirozz0rqY3OoQv
         sSUfm3zSqTPuDf91xHUsjqR/gOehFQtmh1Qts0cseKmpyrBqPFi6FMmKxEPxd9Io5BnS
         Ja6IvqI0AIQfNoV7vlVTtzEd+fnSmZiflC0/tOWYnmJv84J0juZ/fvRhJREKp3RgtbsN
         hA6JEQJX1tfoAvEKoN60MxNtieDfis9VHWZQryjFsFoxDl7nCX/IwN5DizkdSltrIZ4D
         NHMuR6ATn4UkJ6vp/uzUU6rFD/PgQM/WtV0LQO+6aKk/KmH6glEwvqfBo6Wk8HfGiv+c
         jeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911313; x=1762516113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=KjmvqHg4GoaykTuzd4pJs72jOcEghrKSS5YOPHSO1RhUN5NqjhCIdTpp1DVrqMteiQ
         LCVoS4Dsmi8t4TLEQEmapqOSIQ8EixYVpeB/gcZJ0w7h3cYQAkxH7xG7lRQRtIxBl5ys
         EVRMoO7RPqf1J952xjDhGf8n8w9wZ8w/JkCi7S6VwwciUdMiAc8tLDYOzcNeLkFyBB6v
         9ehfun5hbuLtVMxxTzboh1LGx5bTEuoCdVuhIb+fSxNWplvR0FeXujOX7zEjjvzRvFAs
         l6uXhVhjZtQA6FviSyoTItjDehjttPf4kH39EIHl2xc39o9uFkV/6gUY2Avc0eONZKn1
         +i2A==
X-Forwarded-Encrypted: i=1; AJvYcCXf2EpORU2OwdxuBDiofGAYgjJMF0MHsp67QyHjsbsc/dsXd/wakGiCQP3ZEktDpUW2Df4wpJmBgaWsm9a3@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXCEKNXlUeO1CJX1JH11s96KnD/xeSyjJOSGm0hpnxX3gocfM
	uyVLPRp6FMM+1I04+2WHxZRgxjmsR8WqV/lGiGZHntfEy2rQcPX36K63K/8YjMRilKyifRCCKhr
	5Z8wjF5PfXzXKqStbWjPj2a7p7WvwZiZCgQZe2592ee8IBK441pVeNict27M4t6SgiyOY
X-Gm-Gg: ASbGncvyD9aTJc+CBzctcGjpQpnCMuzyEHz0YEQOiX9BVdcfLqO+iRqIzf7tHZlCzLR
	hJh9lII3KsTYGG49cV/xvlxQ4pxr/RU2oOgPovm4L2Wf9HPQfI6/1kIJnHw7J7GzeYLxktgmzIW
	s7uEwPZoGq++kiMtzhUzb4UMoUJArU+NO7oZzent/JzWOemjOLvf1ldumw6YWrTFhUUEjZmeW2g
	inNWpRLpyl0uZcR8y7USjken09EsWclE9rKVYDmmSHJ4nxCBea/ZvgD5OZmO8r/h8y1D6Fubk6F
	Adnb/Y6b0MT9yaXHC5H26+3I6k6vf6IRnD1yXgdMIHbvVCWqxDoobax+lLx1RUwsUvfi0vveIsv
	UNIETn6IWoe32
X-Received: by 2002:a05:622a:1495:b0:4e8:9140:f3c8 with SMTP id d75a77b69052e-4ed30f8905fmr36356971cf.53.1761911312609;
        Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDChzCSezmrewUSkYzqXWcdMnKFB4ONqHBKyhQ6cV/ocS06pTYFwWKhXF7J4KIgeDRzOT0CA==
X-Received: by 2002:a05:622a:1495:b0:4e8:9140:f3c8 with SMTP id d75a77b69052e-4ed30f8905fmr36356451cf.53.1761911312068;
        Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] ASoC: codecs: lpass-va-macro: add SM6115 compatible
Date: Fri, 31 Oct 2025 11:47:51 +0000
Message-ID: <20251031114752.572270-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904a212 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sAbSznBxNPymwqveVGQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfXwSaHWT6O5K1r
 LBhIjRcVxHKuOQro3l8Gc9ux8ONoqEtyEgmEWSq+RMEwSPx/L1Pw+kWd5eb6QmwI4KAyA5tTqi+
 AtQYtTFCoi2Be0oXZEW7DF0LGi+cOb8XR/opadfZ/n57HpqrwH75EY+0f0XXm7VBXy960aiOWO1
 xcBe7k+tcDQWg5ik8mdisF3XZyFX21xsr1gGBKmhyoCRcze3T8CvjnNALiKdeEtNTJAswIqN0tL
 Sy1qtDWLi5cE4p6uIOBosy8/Lsb95fKX2+Or9w/F4MusQ4f1kQhD4hPjpbNt26D9bLk/OWbt+x9
 p1bduHP/QYurjl3l+4hhLwH6G5d1tNcnNJPWa5KH3pR/kF9oTYrPEi5US0PVQ+0mFQM7yWOG2YP
 7JDrisjO8EXzL3wbjJFVNFrr33P7BQ==
X-Proofpoint-GUID: 0iMDYrad2v0oEoInPwRHh_EG9QqojM3Z
X-Proofpoint-ORIG-GUID: 0iMDYrad2v0oEoInPwRHh_EG9QqojM3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

SM6115 does not have "macro" clock, so its bindings differ with existing
SoC support in va-macro. So add dedicated compatible in both driver and
dt-bindings to be able to address that difference.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index fbe5ebeeaa80..902abc9843fa 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1759,6 +1759,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
-- 
2.51.0


