Return-Path: <linux-arm-msm+bounces-79885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B3C24F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0BBA1A61804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDF234B18E;
	Fri, 31 Oct 2025 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEd7prre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG8c45lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481534A780
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912469; cv=none; b=R3yOoWh2BxiLnKdVyGnj92a/rYvQP39yx7NkBkfn+jB2FZ+mVenw2MVTctfiHi1Z+B7reVP1S1Gx21ook4K44MZlpe7YMnqO9vY0MPZtcb8Ahz+KsaaIgq4gGm37LwUCTHYMb92mOAlZOs1Ye75VHCnqrfDo5aGFAJsYtxq1cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912469; c=relaxed/simple;
	bh=6qhZ2V7jPWMlO09vJWcPidbXDMoiF5TkOHsCoJUNPBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFP/yCYitSAuG97z2DKcC7/GrCs053vqdgcTZP2JY/gkHCVD9KNfZoP4oBOVWF3qxVbjpSx0z/qM7nVDonQD4oadYjwNLDRJNwPOfnXP7LuCAVl0yl1sN34tZQe8ZDklJxdHKzd70bOzAsTuqBtttbLl5pEDdJFw3wt1UenTX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEd7prre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG8c45lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9Qhra1417342
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3qsn+XRU24
	M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=; b=FEd7prrestWyoKETHQBoerJc837
	SIWTZf41NK7n0JLuilnqqyhde9T2dgRnxQN11rk/GHucwnAvWxXkokIy2T9FlX//
	ttevhlR0MyBS5px6ojw8Gz7l+S/Gee/aNpep9DqDuFZFyCIHF630x1Y4sjnOFgjL
	vtsXq+Pe1wHgBr9CB+pMgtrvA3pwxgjP0Vh7IDfofmP6L5pct2XyT2d/SqPlJQHf
	CZdT3bvnyQXpdsPx8xgQ5U1FNHGaY/JCN7s+arDl7Ay28bRlvmr9GlJ7A1vBdeyS
	PDipplnPvKIFlCWCERinjqq1z/I1vHJYE9VJAS7YNMuGMUdU3oZpFMFd50g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hnbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf77618a5so62397451cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912465; x=1762517265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3qsn+XRU24M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=;
        b=LG8c45lqnz8qX0p52rX703EjrBUqIFhlcn0IiU/kxbPO6lvL+bRkzHQx2QG08r5yfj
         rDglBx158GTpCjPStHwJ8wo740iZtI2PW1I7K+1fkfHYT2xLw7fl1Gpzz7dHHWGxBo5Y
         siMovyKowc7jjy6X8PHrVm30RfqI7YlBZpNziTyoelh07Y4GTjg+rMwes8mKv1ORVB8B
         npYQLLU35fV8uuzumOkiZOg3nVn9mD8J6s2o0Mil77qSNZ+Sz1EshJAVBgffZVTI+SZb
         X7VmLOjdg7BuU58BrpMzWFK6r14HLprj9qfqAu3gVdD2gIpkETYrHxl4ziDqyKJfIc42
         40aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912465; x=1762517265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3qsn+XRU24M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=;
        b=PVpsI/iGxTt36w0ZENLv477e5QXFm3oDUXsQMM7MEKM1U3O9Noi3kEqVkmex7ZTWG7
         z5kYUNgm1Z7FI34AMSrwI6BWhDEo5MjLxZKYkr7Y6j7+hhvKpPqbHTjFpKFMugjE5DRq
         JYgiPdG0MJrGTYvtcqqL6MEL63Kqd+Oiy9ES3P7gg8s1VdL6EW8xkd+gC8SLXr8tExmt
         KeCA1FwjbV75YWk1HASE09jzvSpSgW4LqcPiYJlWi2TO51OmvpuzqJtMqaOp+M8KW00R
         qZKdI+RbPuBPDWwncV02L7tk4RSGm1DH8d8PqVpNs7deETUaDfKKH2rKWX5X/LdYQPbC
         bBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQA9j23QrZ4MOpKnAWF6xeQJ5SDpDssMoZGb9/sz1omt4xkPTzrnK4T1tozzTrX16Ny1XVrdRMi7VWJvaC@vger.kernel.org
X-Gm-Message-State: AOJu0YxwO44oqn2oRsTC6MSv58NcGq/HdoojZTUyWv9yxYnMC8EMVusc
	hdACTBk7sY6/Nqpaj1q/I8WlI/LaGxN9F6WdOuhPwCRfqm9XzKHHNR8xGhQkDZYLNPxPBHQOINu
	5DKAFNdVgppFqpzqjDTgRwce6USaeaOlY+1SgMXmBaag7iH0/QrVWxxc863l78/Rpj6Mx
X-Gm-Gg: ASbGncsrs273CLRICui24ZuGamYSCXih3/zruQmpvs8lSxSOPhB5h3HDpDeJhqsQR3D
	qpdJlIuz12ToKWdO2K0T3uRfWVk1xNhJqh+GQNDk68tF719E5IBsBK96S8pOTmDuGKTFhq8TDTi
	xVoVyuIFp0tuFFjN88XgMlrqRlGqBhs5GoKRRxG8sFWh7caW/x9TsVfKDBcb7GJ2kolCX4RNXes
	3ZKsqyleQ7R1bv4bcLOLaqdFqn/ZdrGmwaBrRHTlunjguaJ+3QXo0xS1HtFIOHloHh3x+hP2uIw
	3IpxqYnxQBtsjrsUZt0S8gIEv8immnOUtiLLAMrhcPHrQIQGyTbFCJGqcB+6OEmtxfy7IV0KF03
	GjaDq77xootNS
X-Received: by 2002:a05:622a:180b:b0:4e7:216e:1fcd with SMTP id d75a77b69052e-4ed30fb9efbmr34589861cf.54.1761912465228;
        Fri, 31 Oct 2025 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJClcu9eyN2QYo/qOUiQu7qbIyULvLlv12XdHaf3aRKwPnIwV9Hf8bBaGrhHr/S2hRkb5EXg==
X-Received: by 2002:a05:622a:180b:b0:4e7:216e:1fcd with SMTP id d75a77b69052e-4ed30fb9efbmr34589321cf.54.1761912464767;
        Fri, 31 Oct 2025 05:07:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/6] ASoC: codecs: lpass-rx-macro: add SM6115 compatible
Date: Fri, 31 Oct 2025 12:07:03 +0000
Message-ID: <20251031120703.590201-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX3bsHqidPH2KN
 BoFAJwb+zWIErf2ICw+hVk5eH6aVimsGNbLdKp9wbQPYH9aasmdVKaZtv+ifRRj0a8uVQaH4LDz
 RlMZBoODXzKNgJXvj4iedPF3+0KISNZGECuc6y2fiuh90/w4w3oaWGtMPyEal1gEJYCTZS9Ven9
 JGFAZTo6Pf5hR+hd+nGjDHT7aUhgWvBvnkoSizANaxG4mADBD7QxezxBXLHGVPx4PQR+Q48Fruz
 NqT3R2SDrixi5OexzdTPTKSl7NrYQ6N+tAGfFyFRJN3k1liXOAXy7R4PUP2yKD36MMK5eVV3UR/
 Lob1oyA/Yy6KrqG6htiCRYd0XSQxut2eJ8L/FNWej+tqNurTEBTT6EDZvS+G3ijupK6xRtfEhB+
 SNGDKPh/s07Bcsel2F/F5gZbeaH9XA==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904a691 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MaTAXlxkpdZwQv4a-28A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3lrB-BI3qvA0aSvm7k1pbBXJKdtrkBxv
X-Proofpoint-ORIG-GUID: 3lrB-BI3qvA0aSvm7k1pbBXJKdtrkBxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

SM6115 does not have "macro" clock, so its bindings differ with existing
SoC support in rx-macro. So add dedicated compatible in both driver and
dt-bindings to be able to address that difference.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9053c93bd44c..f889fd17f166 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3951,6 +3951,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-- 
2.51.0


