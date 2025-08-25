Return-Path: <linux-arm-msm+bounces-70603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C91B33C4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53203B5A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC442DC32B;
	Mon, 25 Aug 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyE9hXPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DE713AA2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116783; cv=none; b=DCrPPrhKTsm3MrWPFAYPHXDWn7wiDnfEZ4yOSKPUfSWO7glA8LPP/k4blPfGKpM5p5Uc1K3shq+GfRBn0tvkOhHBQGtl5P9gnOuXYxW5EAZbTO/75IUB/boe6zV3LlDQ2vsD9UpTeWUw1wdEhGA+0eqhu/Llz6szA1jEoC87mvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116783; c=relaxed/simple;
	bh=wv/ZVC0xhYK+uN9b1nZrElPQ9dihsNWNmCovyBsdd1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJZES5wAYO55dF85fRBbc+5fkFC1XDMHuTOX/BKqYRFZiNxAzG+/AHUqQC/5ZWZ0BtmUA5/L0rqYBX7oLIMyuRSANNaQK5mn/4CZZbUHFtAGmpfN8BldSCf7YxuT3ph+Bvh2UDUui1snb0DZJXuJ3cv9IT5kGjuL2b8Qtx5dRoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyE9hXPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8SXZF019595
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=moxinys5s3N9BtVwh8XnRm+TEdKWfPUaqsg
	2wBZXC6A=; b=lyE9hXPDjc4qHB3aMZwvc4HZ8x7qYKETV2V9MUdWE/Z3U3VfsEr
	MYmc4j0uusTWqNCCGyc8jq/Xr6y1g/13w9tiJ2sIU//fGAdVh90YO6jmfbinmBlG
	tGzWApQo2u4c04Xt8r5wPAwrQzJu7XFpDFabnVQ1yge9wforC7PhCKknzCljUb58
	Qur2bjJUQhZDPp6cpuFFgK5qn4UEcH8SY96Ye/b9DEy7SWpJOzby61Sa5oSrfonO
	f+MVuN/EkSH+wmQmlHuHIp0UKW2W+6cBA6kWOFfOBRGYfWngWUz/kSyv5nnMGUoo
	4ysqlTbxUJleTukdsj+S7RB/q5ajFKwbAWw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615cnp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:12:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f562165so130525966d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116777; x=1756721577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moxinys5s3N9BtVwh8XnRm+TEdKWfPUaqsg2wBZXC6A=;
        b=rTEZ1nkmoJhncia890RUi/sfAWsiTvPgtc1jUywVyEdUpXF33ySK15kw24cpZKv6oU
         bfe5fcxXKSJBlxZcXarinZhXUFXDyt+V+wPz1mbS9hPpGwABwVGwMWAgcwZ6sHwReVt2
         T/PgwBvfHCLk8GizOvAUEuEAG959Gli3zL3l3uhL06l10FTt+fHTkeQUx2k9IIdBVVY8
         g5/Pi+Ma3EmTrAEggNrB/bWcClLcKC31pdlDmLuraEznICwOuat9V+m0c2iiFE35vXsV
         o79wCeIe5/XfgZ6M2iQgc0NX1GZPfvZuyklTQn4fIKYOLQawUOD3HHjnfQ9tvqqMSkXB
         yffg==
X-Forwarded-Encrypted: i=1; AJvYcCX0EM6ZxR9yvzv2YRaX3REqrAUpRh5vzm9pNN2uQtKXIe26KdsErtWyLEMCWCME5U+wsGlnqBmqew/LdLyP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4U/NKnomcGejDyLB6y3ls+GxB7l598xB5W+oZU+Jyk/11vkgC
	/u8y870UvNN1Te3u3qj3VAEW/r0uV/ASu4jEoU4RDiVm5OhlOkPLLr++2af16aSb/fDaSqOPp3T
	Rn/GU635Y9ZawZHjWz54QJDzerYSIaQ9MXeJtvh6I3G5aRKuVlgu0C78/FXUk7H4ZkNDz
X-Gm-Gg: ASbGncs4BrxOwRFwAjXY9gyCvX+2aNMQ+yK/EhMRbDpHrWK12dJggK2OL9N+WQBEfp7
	INltlLA2YqinB6+h5QfwmKPFNvFIoeMtNANJjLD4kHoOCHQ0ANzGObZTs2tz6r5acABhBcO2aEF
	jqdWptX325AcOldTxPGk0VMzkEmmGWqnHwcF91lxYZ4NPQh651JENfGtx6rIScDuQW4vCUGpx2B
	pk5rE/9O6T/ZCqIBQv5KO9ZVK7FzpnLnoWcBD0znPFVHLYufREBGEi3auI9GSREg0s61QW69lh6
	2EqLDRj+3HCI8DI8+BM6WG1iwrf/P5BIPQi3n62p4kiqusOuVAHcqA==
X-Received: by 2002:a05:6214:4687:b0:70d:7e5a:2284 with SMTP id 6a1803df08f44-70d99bcbf8fmr120045046d6.5.1756116777339;
        Mon, 25 Aug 2025 03:12:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqBcBMlB2LMK2Ok/clzAec5tF74m7gHksFUm2BryOa8nhn1/DbX2Xv3WeEJ9ZiCW9dNVd7yg==
X-Received: by 2002:a05:6214:4687:b0:70d:7e5a:2284 with SMTP id 6a1803df08f44-70d99bcbf8fmr120044796d6.5.1756116776808;
        Mon, 25 Aug 2025 03:12:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: audioreach: fix sparse warnings
Date: Mon, 25 Aug 2025 11:12:44 +0100
Message-ID: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX/UWCk6qkatI1
 GVAGbNz1W0Qcq/4s0L4kpxkK2Zkk2hAE5NrbUPNzqevUgJsapsOMv2rOeUGgduiryLm29i+3jcw
 HqAZVzfChRS9Odi7oJOnIfc/9eEqAwXRYdea6/RJYYLSDiYkGRrS+lNPb/UXxvQiNfbAlDUIvo1
 wo3fj8K8cxD42t6iTiZZ53kOzx3N15sApcLz6IGcuWJw5xqbGI4gARKphX7RZA+AEQEaY1XKQec
 Bt2y03wpb7ysNkmAXKLEt7kT93FrJrC5mTFCCtJ9+2NVb0Azgp3SW+yHSjM+MY82IOn+wrkDEwV
 HVCAG3X4u+/QVP6fJqrgp3imvz4cRwACIsq/ZLsI5vtcsBHQD3FKg3/tOVBRi5qqVtBgFs4V9+P
 YGrqc6ym
X-Proofpoint-GUID: sxbZxJa-GL_QU1ws9UFrwO9KrxdbWyiN
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac372a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=bgWwhrO3JQob-SLVGtYA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: sxbZxJa-GL_QU1ws9UFrwO9KrxdbWyiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Recent static calibration support patches have excersised new code path
exposing some missing checks and also accessing some variables which are 
of LE type that are accessed directly without converting it to CPU type.

Thanks to Dan Carpenter and kernel test robot for reporting this.

--srini

Srinivas Kandagatla (3):
  ASoC: qcom: audioreach: fix potential null pointer dereference
  ASoC: qcom: topology: convert to cpu endainess type before accessing
  ASoC: qcom: audioreach: convert to cpu endainess type before accessing

 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/topology.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.50.0


