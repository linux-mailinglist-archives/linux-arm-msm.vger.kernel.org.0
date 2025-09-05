Return-Path: <linux-arm-msm+bounces-72317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DAB45BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C3C11898475
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26CC30217D;
	Fri,  5 Sep 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkhgop2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87752302168
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084741; cv=none; b=cWwnc1p+5OTBBXfJtb49+9PTWpqmPRao1yY3B5v2hCYbaT7HAjQ0Bk3QioyM8zC3ZnxWbXXYgTz2lLrviQLLPEi2ZIXgH2VjbXWENhHmhOIET1xAJ8lKa8XJa0tYTKW/TrfgCfZ5imAxAO2AczDCpA2g9iaDVrq1MKMzX+bFv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084741; c=relaxed/simple;
	bh=MoCMuDXvh+Nu9b2vpvZYjT7oWfQjMy2t9SXDsBDVWPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZCu33P+1D8+iLf7w7574N0RK95tfcASINCigM4B/3zxCBcnz/QaRuQvhgW1eTESHBO5DizRX8xc20J0J3as6fXnIHFpHKUf5EsFGQHSlQI2OJQLg9N29UfeiUrnpjrXnuWns6U6QUSRRxYtqDc8PpE/LQ1g1Mg1M3fy8hIKxaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkhgop2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856la99024267
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ja7IG9owaxs
	h1UgdgM/0Skauh8Aewx5qIfunpWQiINo=; b=mkhgop2SOMwXZsAhrA4ValusQS3
	b069AqqecinOTRO/4cniy0P6p0Klumic0LwYbF138VNr/g5OWfpMdz0cWVsXTK8x
	oFm+U7k4DUDbhxjk3Z/hp9uUgeyk4/gwVdDbWhmqTxOV36ngbiav62MOMGPbCp+S
	p3GpfuU06W0CBBmipQukZwvUI6YB1aDeQIcCCyET2J1ze24G8aQx8C3sxV5MesvI
	btc+kx6+VvuI85tgGLtE22oW9Ky4eWk5ozTqSQEnXaEvqGJ6DbImr/6XD9ia+b2U
	y4Xljfh+Mb6BPSeFaDpUZey9tWBcw84yj4p7x+QAvL366SIhislhk5uXFOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fubr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:05:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b52047b3f1dso1855952a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084737; x=1757689537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja7IG9owaxsh1UgdgM/0Skauh8Aewx5qIfunpWQiINo=;
        b=AhONzLJ/1Y08SM5UoCESBX1+Eh/Sax1xOdhfGMVA3j0sAEL5IE8iWdfKgRxcDf51j9
         PmWd17uzexqLzeQkgoc+CL+KsofBGKmvjOcA2/v2jySWMuz2HVoSR9SBjsz/AIxhHtrW
         P5QKfbBI41mcPXB3O4kFmQx0noDHs6OJAx/ixU8tzQuN4606FQvQ/dYf5ih0ZnNN84Nj
         lxsKrBrsAGgxd+U6nAj+i6bqJ4A+ePpdyvNzywbsGnDMAFQ9YJXg3jrVET69ULlmmsCc
         wS3pNnsxKpo2DGbvv39TY2/aXvcnpRvLoqCzEktCPdurTJIXwhk4oWvab4ZLbL7Vk3s1
         PVEA==
X-Forwarded-Encrypted: i=1; AJvYcCXZClV2QRcF0K4nQrtLfbIBVpKLU8eGoN6GdbQtaojl2zYdpi5nyJJeVXBvsRnu+g11zdc9ZhjbMKGnTGyk@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtwNMfPGw3cB9BlzsvwiG6X/TXGUwo2czIb0tKQhLzQN9A6cT
	sQbR9P88OKGstmy7YglIvrJbFNPY9Qh2EpCfksOmmgFa2xeWrynqEkgMsJlJ2ND3sCxCBoVQo+4
	zoeoagM6sSFCfrBZE7mykz5me/JJX7dN9pPPwgpAA2qMN3WfWHwXpaJIiu58hgcuh2BW3
X-Gm-Gg: ASbGncvnBSwyA8UXpUli1jj5atOpmKa5KFVy2xwuSL/rQ8CEwkYkf/36XVgeHn4kza0
	clkmTN+vqU5xwmmUDv8h6h6mJgGln7ZeRLGu5bb2VkN9Fprx+RYR33HACdYe8Y9FDUJTPeefMsw
	1e5WmsJSBIYVwPLgdfsBDW90HTTI6mNC58g95SlZP2IxwkBp7OSNMOH97lWIhzxrH9JwnMlN0N6
	QOY0Nb3jcF7vEfd2dGto1D2tIzJ5F7ImBHbytaH83f7Pfnlhd4r6vvSF/4/u3eZZjh61izjZ20L
	dqdoJvMJ2Z04j/KOZDRfNUCwPlMYZjhzFWtQyJ0LdmKalz8y+8Pwl04wtWkkFsyGJ+omU6TVo2P
	L
X-Received: by 2002:a17:90b:4d92:b0:327:e018:204a with SMTP id 98e67ed59e1d1-3281531d3e3mr30603496a91.0.1757084736583;
        Fri, 05 Sep 2025 08:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqIiEJYnj8QbW+Wv6u6rEqkieOl2LWNIL2cqibUoeZ/H246F4m2n7ChcRg2w3QOWU4GeqyAA==
X-Received: by 2002:a17:90b:4d92:b0:327:e018:204a with SMTP id 98e67ed59e1d1-3281531d3e3mr30603424a91.0.1757084735781;
        Fri, 05 Sep 2025 08:05:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:35 -0700 (PDT)
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
Subject: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Fri,  5 Sep 2025 20:34:44 +0530
Message-Id: <20250905150445.2596140-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX58LLwKGqUb/1
 nnXZ/wqGBI18o3hFmhC2pg9XcRA5bPMEaF8FPRC7V8nfOvdrlzROZQu5zJNkMKc1rqvAx3ODYhy
 Pcp2wGFLvPYOrTe+r+jFFe9bfSs1gRx7mv5jBq7rUQHOABUBTfrbF/iNg4dCLYdfSLM4ErIOO6X
 xbHEKl9TvxSMz9STwBED8gN2D2BtID1dLvFyll39i4ycUH5ZLrN806/EGUhXmo+LuczWHnETOGZ
 iP4jlPigZrnG0gUfddDQyhP07bHN6LhYh8WPiDliUNsNcm6XYl+PUtsfl0ir9/50abR8ezF/FS5
 HIlSwBMlXg4k4bC4UNbr4lsrH+cwp4ufesLr2WeOHNtaEC56MyC37lUOo8FkfnKNeOIvNgNUfxV
 df02RkTV
X-Proofpoint-ORIG-GUID: D5DHSHyaXcmo3-5DevP-w2DvG9Cs-zjW
X-Proofpoint-GUID: D5DHSHyaXcmo3-5DevP-w2DvG9Cs-zjW
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bafc41 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VUbThP3hI7wIHPtXhhgA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

The q6i2s_set_fmt() function was defined but never linked into the
I2S DAI operations, resulting DAI format settings is being ignored
during stream setup. This change fixes the issue by properly linking
the .set_fmt handler within the DAI ops.

Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: <stable@vger.kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 20974f10406b..528756f1332b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
-- 
2.34.1


