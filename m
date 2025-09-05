Return-Path: <linux-arm-msm+bounces-72304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DCFB45A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859743BA9CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CD9371EBD;
	Fri,  5 Sep 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyeF2zC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49D5371EB6
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082439; cv=none; b=pqKYS9vQ4FRvWyY0vHhyCKn2m7SrM/qj1pB0vLGgYPZCdhqW/eV/ufOTpIajpzhx2NE8EI9rc2L8EhcOjDf04kN5qAtnBLVx7UHSSUjUeeiW223Hf4UC8a/7XXFg8UoFAQuLW6cTkrIFnh+SLM/Ui6Ezdu90UMcWyat1O20EALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082439; c=relaxed/simple;
	bh=myI5Xx16MOgCceElM32h+zW1zkonLymQ3Lqwqo8LTFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CNN6C2AiUV/oQ2y+EdLeCfAvRsekPc14/0l2z4Hf9nTcJH97OxbiY4N94dWxELUdUeJuHpDRT5ewFA82+eGqsLL2/QtUX9fzFRu8Hv3DclwFNpxUhVr4Cyng3lZYeJ1R2/17zrTKZtZVN10ZYuHV2Jwf5e45YFtsoKAmphRIsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyeF2zC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857LfdB024601
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 14:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L2WVW1/64yq
	gVsyI6aD8hpTDnv6hYS9Gzwx/89WlPKE=; b=UyeF2zC8nNjEmZnV/toUDvdjPg6
	9eYYuSrrMTyNNVNieLf9TJOic7aAVkhAjTVz4P4LFO8V4aflG3Wtii/plCmdh1TI
	Q25fIH7AESltZYpgwDMfr67TlJp01S/UhDCr6VEIaw72YSTirEAhpPtH9hqZp0Tm
	fXxDqE9TCP/ud4ubd19hQlkuX1/vvncKX143pBPw4Da9Pfp3DmcNYQGtE3pD4HNW
	vy1YGGrvihH+Naj5t8gRK6peG3FSC8zBjpYeJnefrjOY60bLG+UnEjWmqVHkssQQ
	CY1kYwv7SHPx+JA9Fl10BoQRQMKHZqQajw09HnF0lTPNZcGz4ZTOQNd0j4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fu8d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 14:27:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e60221fso3723999b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 07:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082436; x=1757687236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2WVW1/64yqgVsyI6aD8hpTDnv6hYS9Gzwx/89WlPKE=;
        b=KgusePsJnLoHuq/3dJsggD6Lhpms9Zs09Qn9YxX1XtGlUYFguTWD0OsOky/Lsodgz2
         eI6Tt9VCcvSvlBW28SgmMW6R915Jd17eS0hXEW8W7iabGXWbwKefb3q4Powi7uiBQ2uR
         tQtXFlWgpoj5y98mNtIwO1ZLn6v4cMFjUu66a5t0LghYleN7gGYGAy4J6rxmU8LTAfNX
         H334bcyO3oA1OX6zHcaJki+TOK3kqYexme8mXPZ10Wd02L0zmRHVsY4KSPXsQhil5kUW
         s16s3Ueq3BmGatnKl1e/SaZ5KoCK7EOgOd3LzJPnyOHwzl3G8S6AVly7DVoV5CvxNGQz
         uG8g==
X-Gm-Message-State: AOJu0YwtGON/ftXMC//TWA7XhldbZ64/y5mIXGhcI1i+1fCrDQVOOEzf
	43jI8+jz1M9EOwkYOt0LxMN/94eSSqvCGCe2Pj6qXujNnuc9anZItN8am3w0cBf4I8UPWvu4maR
	PIheD1V/wzJaOoD9eFhNzmK/lIUMBc8q1g0cvkO+pmhkkdxm9HA8LF3gJXixod2vyZ1Ye
X-Gm-Gg: ASbGncvHX0TcvF6U/ye14sC8ruk0QmNriIALaTVx1xY4V9V8O11WQbTvgWk3+tQEILV
	mXCjwA+ma5BPJr50jthAUXmOITQEquKUZfp9+vCgGWvzkxcNro1EH2dJcqTEfvsoT5Mjc9gTgWH
	L8tw1BOzU21bBJYNcrnzjk68kqubWSkqgQhpL4GWl2ERW9WxVixekhZddS0MxHWY26Ru8Gvhbgn
	GZSpMSJByVmhlnIZulh/aMvIzrev9Tcj5rMde+LngIxgX6s1UTIatGWBuehoVgTHOTsJ6ZOgCbz
	NjAPWFnHFD8/qe/SaOgY39sgwS1yN9V8/dEJxonn6CuH3CfKp71rwLylSQBsBmlI1px/LX5h4SG
	A
X-Received: by 2002:a05:6a00:2e03:b0:772:5513:ba3b with SMTP id d2e1a72fcca58-7725513c157mr20774230b3a.5.1757082436367;
        Fri, 05 Sep 2025 07:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfXixP7tN6G9naFvmzc3C3KGXsyYCbKuPuFfp318P7SI1O8ATQxvm8o4EhuVbF0mF4hnJCOQ==
X-Received: by 2002:a05:6a00:2e03:b0:772:5513:ba3b with SMTP id d2e1a72fcca58-7725513c157mr20774188b3a.5.1757082435875;
        Fri, 05 Sep 2025 07:27:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a601sm21930824b3a.3.2025.09.05.07.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:27:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add support for QCS8300
Date: Fri,  5 Sep 2025 19:56:47 +0530
Message-Id: <20250905142647.2566951-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX55RzOCKB1Y/h
 Z3oWz3NTN8MXIrv9EnXiLFiRrbejKEM8xzZTU1vS9xd8GJb/ML1H+z76XZ8FpZId+iQV/eL4xgT
 QkzMQagsr02fA7wQ+HOsV8Lg5rYrXUpuY34tQ4pZLVlAb/PvalPGsQiquezjC+iTY2h57p4XflB
 6/LYlTRG2zTmvX3nFiNle8VD89d7plW/geLRoOxuZHQoPAKbYUUbIZo0KuwlVn39V2RjeApiyuS
 slkcgXMWmFopwtJ0i3RQ0gulhG8DdZqirrKUEGklrjm4W7gMRIjZXBM4DGu+Pyss0wrJICoXcxA
 13u8aJhK5xXbBQq5NmRLH7yDK4la9jaiAwj0kEZKuzTnrZ1a2BzpASHtYsyi2Z2XI0wu3qWY6ER
 vBiOJWpE
X-Proofpoint-ORIG-GUID: PtmV4gAeY2PyHXtuTAPA1nuTyqPPCJLD
X-Proofpoint-GUID: PtmV4gAeY2PyHXtuTAPA1nuTyqPPCJLD
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68baf345 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qL_pmY0_dPgXwRjMV5wA:9 a=zgiPjhLxNE0A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add compatible for sound card on Qualcomm QCS8300 boards.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..c6aa62b1f66f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -187,6 +187,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
+	{.compatible = "qcom,qcs8300-sndcard", "qcs8300"},
 	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
 	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-- 
2.34.1


