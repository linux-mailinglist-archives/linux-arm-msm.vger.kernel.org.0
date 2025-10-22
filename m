Return-Path: <linux-arm-msm+bounces-78340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E2BFCADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28ED6E3FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3402F1FD5;
	Wed, 22 Oct 2025 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9rMDpvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436526ED33
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143644; cv=none; b=XXKuCEVAf8jjbxabg8wLP3EZ3KDmxdx6xV/lEcc/Y19jkQycGJSfVx4SFo+sCwZ5NuJ821LbVK2yvoZPaRL+sItYdaEk9qb19WHj3UyeYxhfm+cNgkEMWW/JffFBzeICFfBKrFLo0Kx5VpX1sd8Lw54Q7YOnlxBTZEFe4fvFF6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143644; c=relaxed/simple;
	bh=ByQ0z78twGWg1KYZ7j4NhE4+tO/gGgH6slyRYU8eq4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kssxqhAzCaDVnY0xSFGXsxLyPRAWGSu+uHURkjw7pbVIsb6MJTtxmWOeX0Yu2bjFh8+3uaX6l0FTTpYef18/DwgWoWHkV1PqorWWCZnpZiGrpMqnd0PCExVJH0+so5pmmcWRcqkZq2BCMq8loB7q0MFh6j/wYDgqxDvwHJS1BNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9rMDpvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA05Fp020558
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L6UQFgQJReJOjnGLiJBPDnY9bAoXvAFd3Xw
	aP6LDOwQ=; b=R9rMDpvG1rM5GVjXKfCP5elBKVktl1EP6fWnW/BUXeZWnqbkp26
	0LktdWp7qDWs95y4YvgV7hFIoieneFBc5KuhgfDkhmlEW1hOxfO6pXyZx2TvEwXq
	2CGtoiq8hklaB46VnYtkBqYY3kiSZdmIfSyYAxi5g8xCYbcioAAiEjTvD38tl2Su
	y+cgyJoyAqaJRUYW6x8Zwn7XSiK/5DIxrts63R07XuAA8PN70ZI2m9uJnrbeOLQr
	GDIs35jV77EqMFEICBp2rsupJke34Pg+QnHjX2TQFaYbBVIwuXPDuB/wmaQ7hSjh
	nS48JQG7FcJQ2Daxkd4gg0MgCsd4b8JYLag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3444yrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8916e8d4aso55804651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143641; x=1761748441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6UQFgQJReJOjnGLiJBPDnY9bAoXvAFd3XwaP6LDOwQ=;
        b=CE/ITNGwAxIm3JB2fmnh+NvEA5VC9NnkYh+xkeWTe1LQhp5nxLzJpXKac7j9ovBsDU
         dELtySYqJX3fJ3GXoiiyKR4LEvtQcJuQfR4mCjlKTNRgCot4q5Vo5OiRuoC241O7a7aC
         utIVmrlQ1fPGsYEoh0RS3YtyO5fM3yI64XXvfK6r3m/x5uQhWPSUKMr6n22sQyEadfS4
         zwBcemM7je1eKDd6TzufIbS1vu7x2y0Nz90F9yOkIJ9fSPM7geb6GBn/vjZnm8QDQTe+
         WkuX1vmqq7+AqCVClyTbGWrgK7rben9hLaNE3QjZ12iXDCqosq6w7Gw+EX/suxHX1TJS
         ysHg==
X-Forwarded-Encrypted: i=1; AJvYcCXqueTpRWydPhb280CmuHNpLjT/GJb84giVfa/9WrKVgwE+WilyJoCgH+OQ41ccwWQjojpLJeCXZI9DQ6Su@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ3Guzetz1sAO0Rhr+iT5/tEDpySnlldeyxFVnNKtCLHf0YJY
	PUc1ol95P3S2gbK4hyLVAAsGid3I8phD+Kn45kj5EhTqxGywiIQe/w2hv03wlChdXQ+gBdut50h
	ebii8AIm0+07IyDB8uyZ0lRA2B584wyvm5dMGY+LWzhgcPvQR9sbLcnzPNFE3WQSqb9dc
X-Gm-Gg: ASbGncuDLU+tBJJwkoyonvYqqp64wersGrd2QUpkR9oQl1JgO4RsyRcTpzpbuPvamWZ
	qXY+5GW9r+Hxn/l4H628TWS9STHDXVHmNwoh+or0/2ClERJ541cwtsMRbhCNimQiCcISS4PRbhh
	COq4+bDMIEPHLRvfzG2iFuApesgMSsF0Ght8Ey85Zk6R5aY946wtn7ynQ19dCOkDpJ3CUd88xWZ
	AyCBohO0tOUBqdmWurx4UqzCLpHWeKtGyXeqU6Gfoj2IltOwSpVNj1IXfmu6H8ldh+KKqRmXd/I
	SMCZgfRaAnhdGCLNkE/DcfhGsylvD3jQd6vPI09PEtReTrmeoKexP1MiY0luub5Jf5bRaLBugrO
	c3Rp0UqJ7CN/h
X-Received: by 2002:a05:622a:1998:b0:4e7:3a2c:6d57 with SMTP id d75a77b69052e-4e89d2633cdmr244271961cf.20.1761143640971;
        Wed, 22 Oct 2025 07:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfti4ovqyhNMFPiWFChOJkzXieKbreTpBscjhGXxDDniD4I6sBt1IuD68qD+kCZiFTOmf+pQ==
X-Received: by 2002:a05:622a:1998:b0:4e7:3a2c:6d57 with SMTP id d75a77b69052e-4e89d2633cdmr244271401cf.20.1761143640450;
        Wed, 22 Oct 2025 07:34:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:33:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/4] ASoC: qcom: sdw: fix memory leak
Date: Wed, 22 Oct 2025 15:33:45 +0100
Message-ID: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qp78T3glOhHxtPzkL1OvNllXnbeRyl96
X-Proofpoint-ORIG-GUID: qp78T3glOhHxtPzkL1OvNllXnbeRyl96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX1Flt6DcNpo0j
 zPr3kyxvrUkRUtrlusuifhfPF8ESduc+zvBpjdoT+3WDO3OYflIih2D/0QrFc6rZLgZ5y3Yyx/L
 kstgyeaZyxkrBkM5LmKknq4tZSjK0YVHylf8GhSbkcr7p1QqIJd37cRtRNjT6KU5xmJvbDJeomF
 NzeyELVY1cdHxNsIEwcpzeo5vooUngYjNmTxKPAWdECyPOCq8WQsXG/4+EHTrw+DwnBrqWWO/AL
 kdOwFqvoW9vphL+2ygoB/OpXCv7CGZAwxyUphQcBQlGyekNihZrHRGEGDr+BdSMs6bsHNlfkrz/
 OiR/pS05siKoZs8Uq64I4F04+Mq3NGiLmhID55nJ5S3G4G3AiYvIl0nz4Th4ylGkAH4W+Af2BMr
 sfGUzQhm7T2ZM2RYIe4GPtnDgZZ+ow==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f8eb5a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
    1. we never set snd_soc_dai_set_stream for non soundwire dai, which
       means there is no way that we can free this, resulting in memory leak
    2. startup and shutdown callbacks can be called without
       hw_params callback called. This combination results in memory leak
    because machine driver sruntime array pointer is only set in hw_params
    callback.
    
All the machine drivers have these memory leaks, so cleanup the mess and
make them use common helpers from sdw.c

This patch series fix the issue, and while we are at it, it also remove
some redundant code from machine drivers.

Thanks,
Srini

Changes since v2:
	- adding missing return statement in qcom_snd_is_sdw_dai(),
	  reported by Steev

Changes since v1:
	- added missing dais for sdm845
	- moved all the machine drivers (sdm845 and sc7280) to use
	  common helpers to avoid memory leaks.

Srinivas Kandagatla (4):
  ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
  ASoC: qcom: sdw: remove redundant code
  ASoC: qcom: sdm845: make use of common helpers
  ASoC: qcom: sc7280: make use of common helpers

 sound/soc/qcom/sc7280.c   |  67 +-------------------
 sound/soc/qcom/sc8280xp.c |  33 +---------
 sound/soc/qcom/sdm845.c   |  53 +---------------
 sound/soc/qcom/sdw.c      | 128 ++++++++++++++++++++++----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +---------
 sound/soc/qcom/x1e80100.c |  33 +---------
 7 files changed, 93 insertions(+), 261 deletions(-)

-- 
2.51.0


