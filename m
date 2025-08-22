Return-Path: <linux-arm-msm+bounces-70367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D20B315C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09BC79E1579
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E275E2F8BF4;
	Fri, 22 Aug 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoQLVjHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CC2F5484
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859774; cv=none; b=PJr19L3s530CLnHKEmIVEm0HqnQaFL4s6NZBjvJ/4z/jDPK4xJiYeJLUe/SZKIHLFcbUa/D6BM5R1kJudGOrZn5/7D4FjUdQGWFpEYxgho2K8a1YTd0cu2qPLOOxvNkhwGoCuUh1+4QDhHsAP1Nfjqv+QMEFLPMuILYv5Chk8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859774; c=relaxed/simple;
	bh=93GrgaiWaZtCKjuG5PPu0kwmkEEb4zw1zaJIOqGGrto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiJ7tCY2LXnxq5ErbRyhab02crWcqZJSNg3Bu0+kxp89LdXgINdT0PX+So9LE+fQ47Mo0g5Y+LS80iNMMbTZUdeJvemkjao4bYRtNpc3FavHFRqi7+e3BhXHT5D6hLNMDynBGo9PrdEvmQA6wN7ExZFzXJfgafYaAeaMCK0OFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoQLVjHq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UTAD018096
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QvpftBrG1J9
	rWY0MKQPnpSUD1XG+6hxhXllVH2PX48o=; b=MoQLVjHqPjkyopWKBLC3dq1QiUB
	bjU++ATNVu/1tzImZ5zGWI889QWaBH9BdDTyrOT/PYzUfqCL4PWycN5unJzbZFEm
	H5VUGZV+hkdCfnmWxLD3rOawdXiyhMS5dXRfGHxwZXAr8Gl/StMD+FcBBoMXtgvS
	ug6+3MyNgBVx5puAA3hCTOeFXIEY61NfVWHcZPfqxuSqKvHIMHtt3wTMNGvSuBXb
	gZpyAue4ePnbXGZoxqFmfotWH371E+HQG4JgAkRMu22VXNP34FuSOMUTh4tAyoiF
	CuGnl4UIB0UWgGwhh3JIrGl0btQcI8x1QyfaM5Xl+kF5f+ETC5NxErA1Ouw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0ssy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bf1f37so42926761cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859771; x=1756464571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvpftBrG1J9rWY0MKQPnpSUD1XG+6hxhXllVH2PX48o=;
        b=Z3szgVjiTucd3dw20458v+uD1MgRkbrXVJHD0iopSzHWbfs024RiuWbKX+06TlAEhf
         gAbLKeqocRJ33+CfqCkkZigDyWGgocHNHQ7xL1RzSpEMiJIIQZscgO2vTEHr8OfOKhU+
         zSZwqaPuSFTtgxqWff5rn0TMsuBdcKrLRd8eKsXksYzDoJ++ENiAKXFdKbZPaGNUSq93
         e45j42F0VuvK0D+p9YuxbMOUBrHihEu5aDGib3IvOrS45KIdKRnvKwRn83/Hi0rkZ9s3
         AMTOArbqpXEdrvIL1u31f52t8agsGZBqYT90R3+uAjmzTSIwhzJnjWKp6Ub1F8B/+orC
         mfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQiftPkO12iHtqpb1Q0d//L7v54PpA3lv+CP9aqU54EoqP8+1f4H6ahx7S9uRIZryE+OGba9LelzcrT0wP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7O1h7Y57ok8OIbai4+NIKA41QbtyIjYpMvENaRNdjDraxQ2j5
	zao2r2wPuxsocmhhoMgndf/KddebWUGc5in84sYzN+xE6WcMgWQF93tUrkRSuGEHbRrY07oWTsj
	EjYOfj5Xq98Xr0zeqpXC4FMrjbzydzk0zvYk4uByOHDnM6JuZouq4+1G6bWnQniqGMMBf
X-Gm-Gg: ASbGnctJY7mlzjTBaeTij0oYNGxz3Oq3MyZfjF4Oh6Of0DldbBFS3o7iVahGlMdP6Lh
	WxKlsA/nAE34BDL5f72EyOVtxg0PC4LAMIodYTKZP3UiMpGXYX4T0Hx/CHxIoAdhNzFk4zMUGsV
	1Alx8Fn9UDrza/wgK6H60Z/JJpPFQLin/S0rMxbk/4MF3A+lmsnBsaEwchHkeiC1LtGYfrF8ekB
	8oxo+XLt5lyluvNU1pbCrrAmfMO6QGeRR76OCJqR2t0OYc0CL/4IwstZlo5cgfExChhau1hviDe
	M2ei9Y0G6paR7n4s3wAmjh0x4fufuQ334t+hoiQmuitVYJypVGr0HQ==
X-Received: by 2002:ac8:5947:0:b0:4b0:7f2c:b27d with SMTP id d75a77b69052e-4b2aaa2b808mr22572071cf.22.1755859771412;
        Fri, 22 Aug 2025 03:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES7Jy1nhGpx6D+85CwxK+Qgiqo2P4/BsEinxs93B/f9dsv/inAUbbS1wWDEuY9P9oa8wJ9Pg==
X-Received: by 2002:ac8:5947:0:b0:4b0:7f2c:b27d with SMTP id d75a77b69052e-4b2aaa2b808mr22571871cf.22.1755859770819;
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 1/8] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Fri, 22 Aug 2025 11:49:20 +0100
Message-ID: <20250822104927.2621866-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwfIqeFQBFH1+
 Y8NduH5DnaDDXx/zwrdRrApKtLX8soWIr9JAT9i73zfdp22EWB04d9lsWhx5ktsYJx6wqCk13tZ
 34v5xTQ68cp/TriDj2pFGRPz0EdG4ms/kIhczGA5+nLJpeKqNpDqhMEHPVceH7ooP2/Mp8D/vLh
 ZEuycVz2vxJ8/bGdvObKBOggwoY1iHtSzaJRm6dfH38Uv4E5PkxsBPZlGwKNcxYlNMeOy8zBlrB
 6JvdBgLii3VBhljlWVWPSkREq4n05W2ae3xOxVbN1U0YqBNfqls+qHKRRthCNIM29YtjeL3yqAS
 vxeA7ofHpqyEHEoLw6s0Qe5h5olHJNrMEJwSbs0lLD1IJggcD/1jQlnME0JAsLQuO5z6xnN/Saw
 IO7Rb2w12laBUp4XKkbRdJGW3zK7KQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a84b3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: orP0qmhLfgU2YK3M_Qwo_26sxqFIeaSZ
X-Proofpoint-GUID: orP0qmhLfgU2YK3M_Qwo_26sxqFIeaSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

For some reason we endup with setting soundwire port for
HPHL_COMP and HPHR_COMP as zero, this can potentially result
in a memory corruption due to accessing and setting -1 th element of
port_map array.

Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index ccd542033967..b78f37c582ca 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
 		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
 
-	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
-	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
 
 	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
-- 
2.50.0


