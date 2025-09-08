Return-Path: <linux-arm-msm+bounces-72469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6851BB483A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C211189B11A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0456235050;
	Mon,  8 Sep 2025 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUG2nH/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555822309BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309843; cv=none; b=Xr0kXP/ibcTsMChJl5AbN1BWpQl5GYP77o/0yJt37BFDIK05SiLQBukQTqAs78GfSHkaP6zPBdENLGi6XTleRlJdMAZLDr3X6F9nOzTd/1UyLtUDOKttsLdXq+jrUM/pZxBhX2mxYdCVPJtd4CKT33OEZHR3J6Z2KiZvfNFDfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309843; c=relaxed/simple;
	bh=3CtwootO+el+RrOJXyCia5V9rqAmA+AuWVwZzlzSH4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmXDwq2btE+zIXHNBDXoxBnrC03LzS0P0+msMpBpYKUz7W4oZewoGmdAjOIrJzrnTXsqhRYy837aqCFlfQ24X+U5ZTdKvlPJIgkniNW5EdPdMD8Hml6LORtsazWoMZN/eLlL444pSUdu/bD0K6I68DHnnY9oHQNkw5pLbH9/S/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUG2nH/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587M4kRE014127
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDwAG0QNYm3
	TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=; b=cUG2nH/CXmCrTEOy2M53lSEGEyJ
	6s6rH9V9rLnvZPXzaX2u/aI/pBXwiCE70E0lb4x81vnwMGqxsmMW1x7e8Nkc2qWR
	ZQAxgyeiA2YxOQKK4gTG1fNAEmt6z8m89LYgyBhsRSXARozIq1Xeqc8r3WfLLqqK
	kGugwoiocLi/g5jPuTuwLsgCsaUiMEisldMAr4zll32wE0MOXjF3tftHpZtHPCXt
	I+5ETvHX4rlqOwjPIq62M3W5HIpvWTDrYIMF3aM3xT2ti1obnOXZbJgs1j6t8cQF
	9hBITDIPMt7lR+xIwK85ALi7eFu+1mbWG5z2gSLnRKlyfc/JcW7crNDG/dA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3dse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:37:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77264a9408cso8519083b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309841; x=1757914641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDwAG0QNYm3TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=;
        b=xE6+Pc6l+Gk40UNeOo3H9KImmhjzWoQMUgHDrvDodc3Jg/UfI2GMXdNf0ABA5r7k7M
         Tc0FC+dv9oOsFjjvm95ZNci8vaHaq3eL6S6hNpf0C9+vj4CWWNWl+veIMYO/ztDI9JY5
         JNcnn4hJwZsm8F5CxUM7af2KLDgBxUq3zpL/1itbtIeZKHzUkf2KfVM6BRaJyhHiVCA5
         EL7d9QBaRN7UQ/170pEIzgAfK8UUpDy7iTF/fOLQ4YTvahcujgazCJaVaODZui7KdI4z
         N7d3cGPSJjAMzXG/NBBi9GoavM5dN2+HbRR9ja+sm226RYgyvmWKWuS1G9W3ogSTpgBn
         4Kvw==
X-Forwarded-Encrypted: i=1; AJvYcCWHQC0E6uuSnwHd19cy8SBOzNrexcEXhh03vyM3zOJut1zkAen4dQjD8AFeNJSKRP/HVu8p7SfSBAqCEWWp@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9AxmXAL0IjuuHeNjaXIavQVtfx9ltW9l3O2nQLMqQleYbWK5
	xDuApecf+SMDKW3q7rmfbLKd+GjxIf+zmMzVt0Eo16sFGxVdgXNrtmj9ArrtaKD9oUEoJWwegWX
	ymhGRXbE/Z3hTASqn0+fdSbBAzBfjMdM1LUQX7LqdtcvHj7pwIL6nc53q6+EXZL2syC7w
X-Gm-Gg: ASbGncvjB6Tm/CKgYa5uqrJ5vml4Og1eAna4LxAd5LXYURa39aQk5hAOYsuyIAce8jj
	kJrLhm7gtIYTuhZp+LLbtnW3SaQVlwv2MfQH509B2hm3DK6wSaw+H0PhKkwNLkaWNyZhy64m+UZ
	LobSNgllUYTJ9DRRnZLHbQ98dCESEvgDi2S3mFL2r059QY4CSET/APBur+O43wZAK28zFb2BXkm
	hvyW0sR75lPgU9T3saP3PYFoLr2CPLtUxX77+5e4YbC1OzZ3eM5AwUxZtg3B5g1nRC0YesAY3pC
	UvF6xv5t3KPOxcDb9D4PQVA4yPGlh5FHMnzPfzHB/t5CWGdKcLFVuUFjr3AXCFup+n8whacSnPJ
	w
X-Received: by 2002:aa7:8882:0:b0:771:e179:343a with SMTP id d2e1a72fcca58-7742dea0275mr10773507b3a.17.1757309840827;
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtn70IgXvQ4aGWZkJAzdfomHZs4vLGdZ2n6w4YrYjD5Z31iweF4zdq2ah09rQn9ZRQmSTSlA==
X-Received: by 2002:aa7:8882:0:b0:771:e179:343a with SMTP id d2e1a72fcca58-7742dea0275mr10773474b3a.17.1757309840408;
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Mon,  8 Sep 2025 11:06:29 +0530
Message-Id: <20250908053631.70978-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CBxbFVC4s4Gpv9RO-hu6VP0yjOBbnGF8
X-Proofpoint-GUID: CBxbFVC4s4Gpv9RO-hu6VP0yjOBbnGF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1vL1FFBoyLF1
 ybtfVV3YNQxrhOrvNF3oOtATG22F99pe86OuBzlFlu3cAH3Bsmv8i6owuZqu+l2tiSbrDXqrQwv
 ppeaDPC4Xq2Uwnf3lfA5Dp+whG1tdwJp4Y9FOy4WYVFeyC6gsKRgfys6dmHUYLozVLx7QfqI6U3
 9NYM60X7S61/FSHx0OFNmlq9KrwtSfWQFeGd5vDVBGvOPlgqZWmNPP+xP++sBcu8L8SUbtNsq/i
 0H9t/9qWoAwTksDa4NEehVgyQjcQ5N00FR+YiSmjXEKAKSvuQ8U7Oh6Bw51lyBKnXzPDocZtfUh
 isFzZwNjtjL38RRoQ0lQaqOYj1wnjLRK+2iYbdTaXBEtPSmCe6fIZKVxSsugjllThaR0Zv/wV7J
 PzgaPx6b
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be6b91 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bbfd51db8797..be21d5f6af8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1


