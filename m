Return-Path: <linux-arm-msm+bounces-74663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DBDB9BB8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 21:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 608317A5BC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799DD26E146;
	Wed, 24 Sep 2025 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAyAPJd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F626D4C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742449; cv=none; b=nzaCx5ojwiqznZwJ2RWkAXJF5Bc/zOjqp2DdHrDN20h1/P+OacEBt4NU1iybWZEFlPeqSDnuvy6oA7/+yFfd+yckXUdcjjIMzx0bDZ5qAbs/CvIYxC9Rhush9FgMTpHO0hZRtGcKH/N9eNSkJbviDnkXQOswBGJiENzj5MJ/5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742449; c=relaxed/simple;
	bh=xfl3uxDOzjZCkGChsJFqKv75YMjMYfOWhpiQ/rlytpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NfrZeHRyo5Q7KEKkMvw5mEtIoM7swcD+K41WdUD/JLyEsB5XxfPwW7nglE59QNQ9ZVNGTXhG4bZkZ4PptvgKEFknGFtd21GhHMqG0GFDXwBFuPXByW0F6HkIq7fICUfbIrQpnJiqpkhe6amjEFK6YMSQqrck3MOx06QI66x8Hbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAyAPJd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD1BtI002114
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6kyEEdDA7/yMJdt973yjQu
	IpFG0VMOH8xFXM5wrtcS0=; b=PAyAPJd3f+PcSF2lo4S01+lUukq+wa3idsG0st
	l/FmB219Zpc97VRDuXpj3KWzwjvaX7S4vL3wBhS3sQAP+aveZPWMJqPPJGgBK6AQ
	37LGUEbtiOSsgYRNH8sHJzuEGdtejLp7tOsXdyzFx/2tkG1r20EiV6QFWJZeSR6m
	L9hO+HgVRO6zfNckuB3HZUVcH0aafjdoa4949l6P8ppt5RHiYvkfvPDay3+r7qYl
	sLbRBy+NFmZ+9MNM82vtN++SrQqthqmFDV3NkR/ffQJTmvVkHsHoz+jv1LXqnC7V
	v7UrImogDCSna8u3aNOc5qxuliroLBetwQ4b2+w99jevLZaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98nj84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:34:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5ecf597acso4471851cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742446; x=1759347246;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kyEEdDA7/yMJdt973yjQuIpFG0VMOH8xFXM5wrtcS0=;
        b=YdZ2J0wJTJC2UiYcws9nbBnh6uyJz7jLBKQvFIudrMjqZTKReoQ3D9CHcgdPh7MQ6Y
         BvAGVe0fReNrtEp1IYFv/mdb09mCzBgQmr6SPPe6SeTJtm+THSc21fyOGdqpPD3ZhuDF
         tlUI+C6J2StJVoVQi3pFd65jEIL5+Sz5t0E6iPtLtO2JI4nV2V7FN1OKVZLFR71xoZwh
         HvNEbn5M1WJYb7f//wDfn70XqSohhlap++PMyw37oTdMRLQb2D7cuxMEQjElFI32hwZ1
         U6/1JzrCkyQJgn+HkS+xRBp0mSr+57E6AvgZrsUrxlt6Nxv2RQHlwQ9/BS8YSyQYNcfC
         bZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCXL3xf+gzSKhEQ8npKTJaBtyNAF2X1k3P/irrmVDWgxWHQV7fO6YnC+pUn5v9cKpUQpLnV3XmNG0bm/ooS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37eYsz29nvWomhhtKq4mHyju2XAOrZ6TxHypxx8CerHgh/gAr
	9cIP3EH8uiKUFNGjxvszfmKJskgu3N0N1Esq7qa2ZeJDVldVehGqtgB8rGE1jtZAJEO0AyueSIw
	r633q+im9OU9CxQKrQfxU5ADB1k8Xho4YHx0c04IZnLy2rBUhYPQFC0seJdi0TrV5vujg
X-Gm-Gg: ASbGnctqTfgTCVu2PpuTrKeuDqn6FsTE1pSp2FtfSe48NI45yRvGKUi4WANZ9qU2K3P
	7kMZngGsJizw/6YhKimkjsSbZTwg5pXwWonmATWColkOSDbP3hTSu+/wPTH62mtn8Saf5pqn8vN
	laLYoYDm1zU9BiUJWzuLB7BWW9P0kkf+Z5MwZqd8KZerqtIvS5SGt/8Sd4jyW2s9JrB9PNNcVer
	jUCotdOVe2yPezGXaR6EqBs4BHbPHFNV4go2YdAlGSkJOveJINuyuwAxFkiJofaFNkBHRe5HmLS
	qJxOETejV0FTQwt0VdFHAQatSE2qDaKC0RQwTnBBPj17/IYmLAEKnlRRgtcVZPQstcs3O8I3Rnj
	RDu/qgOFnAQuCywcVBqDuL4DZ5Dz8lDJ89te5FIzWOC3Kg1DqVsUI
X-Received: by 2002:a05:622a:1aaa:b0:4b5:d739:627b with SMTP id d75a77b69052e-4da4cd45775mr15807551cf.76.1758742445794;
        Wed, 24 Sep 2025 12:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4fb8o4wRnsBHeduGJFDhap3zn+3L+mr0uLlLrQBQk9n38VpgMCuzXlsaG6Aw9BO3BYu12Mg==
X-Received: by 2002:a05:622a:1aaa:b0:4b5:d739:627b with SMTP id d75a77b69052e-4da4cd45775mr15806951cf.76.1758742445116;
        Wed, 24 Sep 2025 12:34:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e4a6033d9sm2895884e87.119.2025.09.24.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:34:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:34:02 +0300
Subject: [PATCH v2] ASoC: qcom: sc8280xp: use sa8775p/ subdir for QCS9100 /
 QCS9075
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-lemans-evk-topo-v2-1-7d44909a5758@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKlH1GgC/3WNwQ6CMBBEf4Xs2SVtxUo5+R+GA4FVGmmLXWw0h
 H+3cncOk7xJZmYFpmiJoSlWiJQs2+AzqEMB/dj5O6EdMoMS6iSMrHEi13lGSg9cwhxwyDofe2W
 EqiC35kg3+94Xr23m0fIS4mc/SPKX/t9KEiUaXQstBGk1VJfAXD5f3dQH58ps0G7b9gUuMFLet
 QAAAA==
X-Change-ID: 20250918-lemans-evk-topo-dddd73c29024
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xfl3uxDOzjZCkGChsJFqKv75YMjMYfOWhpiQ/rlytpo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1EerNqyWNqAmjB/B6iM57TGa98B3K5RO/f5OQ
 aE69AMHWRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNRHqwAKCRCLPIo+Aiko
 1V3QCACvZy2VhV6SrgN8cejwqPVDT6FcUGvZfLuhaS2FrWqm9ZaPPAn/plS9tyWvFlayyxFwgP+
 T5CrdYGV7YOX0QdPF9lauQCYfMO+FzD33Twm9WZwCt21wqD7bwrM5xDkJPwOI70M1fdVuaJLxyO
 xkvxawW4mcaYk7OaMojGOVfew4YR4jjd8bG0TE7L48F6s2iA8AwOYaOdQRxLlC2Jae2JBJpkFF7
 wLHQjLGlN6O6Xs2QkVKN6jMSmW60pqs94uVV6/cnsVD2MkEcMesfEOlg01ebeHBLGyr6b2sQNvT
 e15lbiXT8U8kXWva1AIRD88umW4y8Cg1jAzjCPztli5RofaV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: baUS4qVXXFz-NJ1B9BH1jZFeoqQvbyxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX0GxMFFJfq/dc
 P7cEWLPyIpfwb4QxGDFoVl2qAZ0ndltLR7ZWhsC56Bo9Wx0bDai2BlU1QusBYiLsH0a9K4xAayh
 PfA75FKCYSLiQjaTmB+ufN5h9YgWKG3MvM1XiRkhPlyZRvGXgchMl9auvWehfxTzdlX1POfWf38
 8RbP/OHLpJ8KlXYA6eRpDWFka+/K5AEa3L0VqOblPsPPUNo5dSkcRZuLkCjwJqA0evURGamcSHA
 jfz1sL3o+bmEM/c2+KkEKbL8Nduh5rLeub5z5YXbdAAFKhIkCx0HpF9QZ29XFuAgbBYHJkx4vhk
 msoZAWbLUlW9nZFPsnr2+FRQIpx+iK/AqBnh3BXCiGnSK8KtiZDAPQ8sXfWuyc667OihhkGFqT6
 7/KWyFks
X-Proofpoint-ORIG-GUID: baUS4qVXXFz-NJ1B9BH1jZFeoqQvbyxS
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d447ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KGRU7LGiJR5Q1pf3Q6AA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
historical reasons located in the qcom/sa8775p/ subdir inside
linux-firmware. The only exceptions to this rule are audio topology
files. While it's not too late, change the subdir to point to the
sa8775p/ subdir, so that all firmware for that platform is present at
the same location.

Fixes: 5b5bf5922f4c ("ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebased on linux-next (Mark)
- Fixed commit subject (Mark)
- Link to v1: https://lore.kernel.org/r/20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com
---
 sound/soc/qcom/sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 3cf71cb1766ed7e3d6caf6a74876f6102ddcbc41..78e327bc2f07767b1032f09af7f45b947e7eb67a 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -194,8 +194,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
-	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
+	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
+	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},

---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250918-lemans-evk-topo-dddd73c29024

Best regards,
-- 
With best wishes
Dmitry


