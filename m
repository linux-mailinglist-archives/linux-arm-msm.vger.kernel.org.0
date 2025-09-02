Return-Path: <linux-arm-msm+bounces-71629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C019FB40610
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8717E18885EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978E42D29C7;
	Tue,  2 Sep 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCMtip+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887B2DAFCA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821662; cv=none; b=IH2AO4iDy+hHvZWwtpsRhuZpNAXjx3tOsFYC13zuMLgGG14FjTP9LXorNXiJw9tfd4ISzaK6gc8H2SnRasl19H0nt0khYRqLUuXq8/MUjB3HM5JxD4bXHa+ZtDbaOz4xU4cP+zh9Pwa3ctx+WamMRun/pT51zkiVGNZRxUqKvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821662; c=relaxed/simple;
	bh=Erpj/ouDd89cAEWDr0McVn7qsX1VY6xCR02OGCP1IRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijfh8+BNsG/jXjbSRnue4VcpEw94ssYwwhelycIRbIR1UU3iHL5dTfWVOiVbbLkRVb4jh21dYzEYWm9uW0TEVtxikEZnOeYycrQTIFRm1A3CgxJ94dzvqrvNH6jz0z4sO5xbO5vyp6mMv3YNLpaLN/Rx8Clz/AR1kkPrjUfRudk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCMtip+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AocHp020472
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WzGhnqCbKpL
	vbZMIa75k5x8iAR9+F9/qdnVgwvY1TNM=; b=mCMtip+kQ1QOc9QDMwKOg/Mtb+0
	R2Hy7zIJe7WivVsJZjpXagIpRupYao2OxC8Lf3VHq8bPw0GtJ3J7iIxvBCuYOu4E
	Km/SHhDf5Osuk2v+5diQJ75Ms1jNBPV+zIfjp5Y7bGwqlv6Dfl2pSPvuEMVyzCqj
	EPPk/+GIvSFmdGaQIUdCwnxRqZIGqadEREg8LWVly3SfS0BPjXBS7c5nYZ6QQnRC
	FYYr+dyaMTsiXvvhdgfacuh+WSq+RPQ8no64QbHSkku4tswbmc4SBwHnkoqLvfm8
	mIXa5BHlLNnixgkI7FDkGCH2aQGPjziGUwZe+nUD4MLvcehaHoQy3P1W1kA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s03t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:00:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-8960926bd92so258403241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821658; x=1757426458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzGhnqCbKpLvbZMIa75k5x8iAR9+F9/qdnVgwvY1TNM=;
        b=Tmto1owHlyIY9OWw14Nnb+0Zcavqy68qycDrZlx2IhQunIxf7mxtqtcI4k59EwGqa+
         LtIbFfmGxUrC1ZcIdf2girz+/YLlc62XdImX9Z7OawEzZMCe3UZLYauBfSNPoao/EVN3
         e4zgBar3npPTFvkUEGCd/26PVYSTtmfB9Y3VC0ia+Q0D9iJ7xSna7P31bzBpAN5FcQLe
         zqP86fAsvwYqCMWzB6VmDGSgQO97+Doc9fsT6E9U4JRvVo3jdS+uN/mZl7cS54i2LctT
         DDZEYhvjjXJf6ijRUSgwBrX/uvv5QJJLXZJg6a/9Kk8yHpcCAVSyu3rqGwNLbR2mauk/
         D/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX6/nckCXK+6iBOmslVZFTxbltA6n7FHBs51RR/B6BmqvAYZY70EQP/lYMcRWwzLIgztqUoeAPcssxYePoG@vger.kernel.org
X-Gm-Message-State: AOJu0YxInAzGUVYzwh/6F9+R3mjHyoSd+bCntMtMzugPLScErG8dPedX
	GWozsqqJ5pAd2lP9jJDuh9nQsczOTNZ86zK1jZIPYeyV+vnlYibHJt9CoyXCmKRsnX+Y9C9T0//
	DfOw1J+qtiHpwYdKamBe7k0G1BIurvXIiFEeXNDspcl2/m6PRXgl4iPj/pSnC/gxEreC1
X-Gm-Gg: ASbGncv1CSbPrtwf0bQTqHZavKGMDSFDTsBwyMJLcaefhHESJkOgmNUNHeAOt1ccWgR
	e+ROD049RdLWpqvqBq15WJuhPBozUOe9rwluoeE4hoOc+CpnBEnQFZjQ12iTXEVkqicaxL+3Ca4
	wJvPm0NXmAuiy/hKJcYSD8At3j/8nccGzHcs3FD2O/hAqpDodHUROukIrZTMakInnaSzTlZz3XF
	/dsmdaWYp1SMv+vM6v2NiZKT+Jjf3EWzLGvFAjoQ5F0ZPbjYoRprvfOqEKoR+/ZCrcvUBd5RFHk
	nshwrc9L9SPAP6tc40DpZlAQsCdRigHP/iOooIRMk6Rvq3O/dfA5NA==
X-Received: by 2002:a05:6102:8017:b0:522:194f:fcd7 with SMTP id ada2fe7eead31-52b1a06be68mr3884652137.15.1756821657172;
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/U4dPnlcOQB4TWwCsU2ajC9mEnPbFZd6rjcAkR2eVla8SO3be+Dd93cVapqglSYKgRBmE0w==
X-Received: by 2002:a05:6102:8017:b0:522:194f:fcd7 with SMTP id ada2fe7eead31-52b1a06be68mr3884529137.15.1756821656042;
        Tue, 02 Sep 2025 07:00:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/6] ASoC: qcom: x1e80100: set card driver name from match data
Date: Tue,  2 Sep 2025 15:00:39 +0100
Message-ID: <20250902140044.54508-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8a3p2xKPLcaO
 gJ/p/lgn7RP77TO/Zv/aDT3IHYkPj6NJT3zSHN4/mqspMFXkyGf2Bp+lqwTwJ+AR8PAbWzFyHQ+
 PuJI/is8HQwmlagdDBxJPyvNqYpI7sbgVFoUT6uGNXYaB6Fn5QuoZcjKYXflYJlDSYK+/z+wZht
 0Of43jvnP+9gkosAoobZeligiJg1q+8K/TN2SLncdi+TQpf0eYmvVgqD27O7wX/SFzl/yUseSy6
 vO8M3vrw8l44Oom+ubiqXrOl+GZgDJ37pnw5G9AzcYB6D4W435nN/e8p+JEcQVTFWQdjuKcDJGr
 qn6OLZEv0U+xmqACcRA8oFl03AsIBHmdTFE4bKCPpB+y7w1TRVuKKXdMsPKbxHYGOaPj/VnDl/l
 7usFKMoJ
X-Proofpoint-GUID: ScK8SySvmkg_XY60oQy_UHXX9ETwFn4D
X-Proofpoint-ORIG-GUID: ScK8SySvmkg_XY60oQy_UHXX9ETwFn4D
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6f89b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8PtRD21WSkYcRLTV-pYA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 8eb57fc12f0d..322010d54af6 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -210,14 +210,14 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = "x1e80100";
+	card->driver_name = of_device_get_match_data(dev);
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_x1e80100_dt_match[] = {
-	{ .compatible = "qcom,x1e80100-sndcard", },
+	{ .compatible = "qcom,x1e80100-sndcard", .data = "x1e80100" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
-- 
2.50.0


