Return-Path: <linux-arm-msm+bounces-78012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1988ABF17A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A48C74F67FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE6F31283D;
	Mon, 20 Oct 2025 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Sf+jBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382F31770B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965940; cv=none; b=YkCBjCV8FWu3FmpfcL8a3S5hMgWrkz1M5xDOwgjVCZgDY0viDLNnUDg5KdW3kFuTFpdXxeGlggaL4cmq8nnzNDu9OSeJnOTuJfrNXS/XOcpixLZy3bjvMIR68bw13lCNyhINHKhcdfeQiAUhp2nEOtgNbQkeQ6Zk1pIjuW5ZmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965940; c=relaxed/simple;
	bh=2huT2+iKEw8tW47rMwo1a4P8i0CzNs73jkjQrrzOQro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otwMi2CnaDJpnlprU0pTDnhJLFPdQG1zG9haY8c0PAPW7kUsYDyMytT1ofoXI8blAFg3rTzV4IqBUrLvaypQkwlu/Fki3+AUWB9FT+1/h5a+KmfK5++yPCRB80GHzOhtXyoQjannIz6jN2rNqCCWPwvCOH+gi++L09OlUSj8ehM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3Sf+jBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBv6CI015332
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kE6h5t6yjbVzf8RgIauFFD6tv5vVHA/XW4w
	UEUKgjiM=; b=C3Sf+jBaQTW0W8BOFWc4iq7hp/Hc5lr3AiIxJE9LdF29MF9n4K2
	eBP2Ag2FPfpta8u0OVsxisBSZQyY1EDz2KHHgVXH3tCmZdPOh9JQkbvgz5quQkfp
	XfZcVkf4EzzacwuCHuEtnXu7R2pdeyJ9b6YLk3sbq2rzlD4GccH302rkL/S4qwPx
	hJihuXgl2GRKs/pCWhik81+rJc6+NotukxF8UH6p42b4H3k9sjdIhA30GQUzj/VR
	eo2VcQm8cm7DcwcF/RWJhHRft+rUqHM7Oiu7LYfsW4ffhT9F1VhAk60xhAJT7h5l
	EUKNXKZcsWRAiQlyX32Bv6Rz/QKDMyvTs5A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343vu2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:12:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c6f88fda2so107799546d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965937; x=1761570737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE6h5t6yjbVzf8RgIauFFD6tv5vVHA/XW4wUEUKgjiM=;
        b=buPq0Av+D5vUqdhqdJzSSrykyaBgO94uIpPNJeYYI5VRB93gKMzClmtcYwwqAMbTtU
         wNraPRL3BMMqSkW1ZT+PVnitfBxUMaKxfaSpyD5fBP+9zV4v+cUwUDZIN2Wtcc73HIP2
         4f/K7+rtQNLDWDWtl9aP8OGMVbi41Ca5P06d6JSj6IvPsh0QPkegawUvnPxwblSnyf22
         vEGwcuYPgZirt5FqBp7qdISfYYlXD+YKtol3jZjFHXY3Y9oFWGK0UIx/Y9y5XikycxUH
         Q+HHG3pnSMrwgil6SltszYgmSWzYND0ECSen7l0rDlUvRVo3ST52Nq8fQI2tWVvxKFAw
         5tjw==
X-Forwarded-Encrypted: i=1; AJvYcCW2SZac10DfxCUqH5g6DWf+Lck/75mesaT7/2tflhWSgn5+cd3+tcJlJaZ5wwKdl4/ntNqH8C8YvEACAS65@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwiklx6/DH5cZFFsdtN9Jd+7+4EWSRqUmF6kkdBP/8a3Ktuv8R
	1EdYHjuk+d6qZD7HRpLc6rhSqLe6TDZ5UxEcKlLDkBdQnR3aaEqK3vP7JoJ91AEw5AASIWKUPie
	JSsJ8H2bXOo6J/nv/OC670MNGe93vvMtXz5CLwWjkA1IttYgsG3faFzENQhelSH7fN2HF
X-Gm-Gg: ASbGncsrv5L/pU2D6zl8QyJY+hY5hUCdVHUU3ooeV2LoivwBpah8LQ+KaS1kJQY5Bbo
	Br2GtPnxWNDhLid91g9z/DhEuveh3dSzpx4LelNFcyXHONxjFkYbAfARwwYNlrThNNqZUT13prR
	XiC6sXjt53f2wMwZwFaBVlKxWXYdv2p8rIGWaF9NIWchqY37TLwz0qSu9gBF/Oh77X10Vw5PD7q
	eji20AkQa3gAWmGvjIPE0XZUFTxYWTcFFvk3AqsRhtiVPIcEHqWq5snhcPf5Jd8cn+lkYN1xuR+
	Rbeb0FyvtCYqr47/J9RAgiQKqiseQCcVPCy64BQ86WIRNJoYU9iBfaZut85AD2Ue5r3ZzG+xe5l
	Ot98UoX1knnTq
X-Received: by 2002:ac8:5f93:0:b0:4e4:9d63:4a9d with SMTP id d75a77b69052e-4e890fdf96bmr207135601cf.28.1760965937181;
        Mon, 20 Oct 2025 06:12:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsPnvRqWl9GSvk2rCHU8mAvynF5S+0f8ghhjGvT3zvjL0DQkU5H3U0yypMThGrIIFNl+39aA==
X-Received: by 2002:ac8:5f93:0:b0:4e4:9d63:4a9d with SMTP id d75a77b69052e-4e890fdf96bmr207132331cf.28.1760965932957;
        Mon, 20 Oct 2025 06:12:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm118165505e9.2.2025.10.20.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:12:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: qcom: sdw: fix memory leak
Date: Mon, 20 Oct 2025 14:12:06 +0100
Message-ID: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OG900SRLOZmxM8PWqB3978LNvJgBxyCl
X-Proofpoint-ORIG-GUID: OG900SRLOZmxM8PWqB3978LNvJgBxyCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6fgCHlpdmm5y
 oajV0kc15WVgH9dlNI68VeiyASXjcKHB4sITb6qL9o7NmVTHLVTYO07h+qiYXOMDv1sRg4FrGK5
 kNoDSMX95ESgV1+ss/eBrzLEGnMN+J5mtBl5okGyliGDX1E5sJorqZH0HE3VpEA5wRN897O7hQZ
 40Kuf99NzAG+OJi2owyJ22xUmf2FpvlVc8RmeX2ABVHCT14MYECoSxtZq+/ktSm8HhePhOAqbXz
 CNThuwBXWzoS0VRLmpVDRKMYI2yUwPRQnIe05Rs8chYJ5zp8tPMPi4Q8nByTSQkvUXM+JGBKEnI
 X6g1FmixXni+A2Vk44d5xMUh+3Vjiwshfp9TEevFjsxCWUq/NIrutQG7mIDl10lhbqYWtFnqjnu
 2YRXIzk/g0vSQc+SyDnV5h9jhZop7Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f63532 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

While testing for memoryleaks on T14s, it was found that the
struct sdw_stream_runtime was leaking very frequently.

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
    1. we never set snd_soc_dai_set_stream for non soundwire dai, which
       means there is no way that we can free this, resulting in memory leak
    2. startup and shutdown callbacks can be called without
       hw_params callback called. This combination results in memory leak
    because machine driver sruntime array pointer is only set in hw_params
    callback.
    

This patch series fix the issue, and while we are at it, it also remove
some redundant code from machine drivers.

Thanks,
Srini

Srinivas Kandagatla (2):
  ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
  ASoC: qcom: sdw: remove redundant code

 sound/soc/qcom/sc7280.c   |   2 +-
 sound/soc/qcom/sc8280xp.c |  33 +----------
 sound/soc/qcom/sdw.c      | 116 +++++++++++++++++++++-----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +----------
 sound/soc/qcom/x1e80100.c |  33 +----------
 6 files changed, 76 insertions(+), 148 deletions(-)

-- 
2.51.0


