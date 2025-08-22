Return-Path: <linux-arm-msm+bounces-70374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16AB315DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DADE93BA9F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD2E2FA0D3;
	Fri, 22 Aug 2025 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEAQ/hzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3472FC016
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859784; cv=none; b=bnf4ZmnJAAE2D4ippRHwBU0lIibiSTNwFvDNl0msBzsn/txTf5i8nxXnpNsaUKgzZrlDTgXVRd4fPEQUBC76TLXkJMzA2sHYROJu++dAG4VGVsR/RYeeOu8GR3l/qFvOzirYNCPycu5VhtbnZHK+64ksRxheKMrOqRHzZD6OvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859784; c=relaxed/simple;
	bh=/5tS1Na4bhQKzK4q//dUm4k/XvEXFSaGVZ5qLzvaXmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+Z74hzfuWys5FDsJMp0qoVP7HbHMM0Pcz61Di10cYk0kZ4kMjZip6d9vYpIC+DvmIaL3CXpU/xy/4jmKp5a7jfnWqQbVW58+06ut1YC946bWzjB3vrxewGa4l+3uvPNUOWqY6uXqO92pe1THlWwTw/nNg0r6Ey6w8KlkVua47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEAQ/hzc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Ud7C001340
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mTLagKpBc2r
	L9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=; b=DEAQ/hzc5IuuC1J0CWynQFpe+K6
	GfZwe/49TGEvWBu9NmyRhCVeiL1zHStnGwQ541DwTVKBAfYPQo1mkk5T7TA8H5a0
	JWeP5SgXQnoF84nJ1WuI9MiQg4m91hdthwqSAox8kC5Wo4ms7F8sQpM9/W/5kn9E
	t+2d+zCgJQnyP0FAJyqsS9AVGFqiMNmZEbj2b/ViSVl3qbXZOxWsk+PfTXVcqUlk
	DlyGOzExVIVJpp/i/ervIIuMJbB3vjeiDj3JAWGPmaXEYo+/Dh+1R2LKmEZaF4Rm
	wei7ShHDF1KWjpegQLkYYn5K+NPydZPF3b/ktqrYtSoiZ3uq3e21OmVDigQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298xx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9a65c327so4825416d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859780; x=1756464580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLagKpBc2rL9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=;
        b=C0GOgAzEFFF497vVqsePzQ6xkGyD6Yn7nbjTwL/5685FPZ1e8NYfewYm5akdr2xA+I
         AE1HBzbevVeCcX0NNjQ+bGvl3/xljfy7J0joQyirTTPVP9lnya2P1Cmw+ddf3FvwUXlR
         hBWpiOBC+T0sa/wJV12BPzONN/nzz8FSKTvoUu2Fjb6wL5BoFFCPuCxrQgCzk0bB5ZL0
         eTD7v/tyHyXWgC3duSAvxLuU68W0CDk74tXyNNiAQA0y9OL3dV6SFABhBQRwUMYAkcEf
         HGpEGP2ffDkFdD7GK+/4pkq+21226Dwxvpj8GOH44VZGUahuLLsumQ1iKjTlKYA+DZbr
         kMHg==
X-Forwarded-Encrypted: i=1; AJvYcCXAnr70HS1ZeZPCirCpAP0rrmDjgNLh03QYwHrkEmhTvH5/Z9TS3xCinpDbvk7JxJxmz6/fWv/7HAbekStL@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWfbBF/yAtjH+pvW07XzaFkZufSYfg4+NIk8qpQtYlOkNaQfz
	38apOu02Tf8UifhyiXk7niJWjOZH7CGSoP3a5zHN36c0AcuZQg4OkIXXBYyT9b4RwyHMx5Vc+WF
	cqHbyvFKcyLXHnQflxU8wq85PVKOjr7Y/YPsvtoHT9RB5u/ZYu4y6z12cpzLvfpJ5k2jj
X-Gm-Gg: ASbGncssjXRkLiF1saNm8ZS72cxKZyysGg5H5bhoMYvdCqrPUYFXEMKWId4qYQX/Gxj
	o4uZUKEtmC8Vnqhp1rd1WLo7WdFN8m9HatYxlRdk/dKvYa8umAbY7vWNn8T8+D/8TNkMwxKYrG6
	E1H6ZRNUsWZ29ytub8Eofu1MVzjH+EVsQqoxohzDUYifmBWUqqbKrQSMh1KGa56oVgRkvFkZRlS
	EWMvUvGIVwqiMJXM6kJgRRdIlH2g4mHGkcUPbTj1JWTNSGm7x9ryDy6DConHQt9CC+oGyU7MyMW
	d+T8OdpJ+qR4f0TU900ibmPi42GAoSuYUeqA+PtonAxLz9MX7vXZSQ==
X-Received: by 2002:ad4:5bc5:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-70d9738f13cmr22244216d6.33.1755859779924;
        Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq8uCn1ut3eJy6YOI6AW0csMB8mZIwD16SLQFg3+7MgJapILlN9oofWVuaked14v2/lFDKjw==
X-Received: by 2002:ad4:5bc5:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-70d9738f13cmr22244096d6.33.1755859779504;
        Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 8/8] ASoC: codecs: wcd937x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:27 +0100
Message-ID: <20250822104927.2621866-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sXJAK7bUMuXhqYRHwPDei-4aAnqJmgiZ
X-Proofpoint-ORIG-GUID: sXJAK7bUMuXhqYRHwPDei-4aAnqJmgiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0kHLflOIsl5m
 /6TGAFcFYKecF6PFQdCJ+schtQ/R5ad561MImtncIYZMFkyTKz4KxtfOcrCk6x/OGCCxNtfcAb1
 PNEAEO/H/HlgdrQiPIK93OK//DMt08X95msPqz1fSfo1or5srOkXSAJAwXrxZhhH8HigNvsOObn
 Ov89YhSxwqMFuKgiyFGeBPzjQM/Pj3XTgX1TQW+Hvq/2RCFsaC0ebbdim9Q3NKIMGknQKLHNxDr
 iuJwuX+n0b0OeiHA0bUfddikdIs8u5NucrM4A6B6tMGhbRH9b+pN1LTNQfYpl40qP/5MHXvjWfQ
 NQdqI1riBGMVXxnJDz7lVAbm96MmeU0nQKSXUCvs0JYrmzLAe7KLsKoW6/gqcOHb86yI20z+ZB4
 1kiO/K13HyLaMdHJjzVUdBX1lEU08w==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a84b45 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 5c8faff3976d..2064d707ab0a 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2790,7 +2790,7 @@ static int wcd937x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		return -EINVAL;
-- 
2.50.0


