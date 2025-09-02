Return-Path: <linux-arm-msm+bounces-71499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6BB3F560
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200C448210E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE382E3373;
	Tue,  2 Sep 2025 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHOAGJ+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E62E2F0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794202; cv=none; b=hFC10oEPNQOLA62kUH1Za7katpFzDr9fFNG0P3fLHcgaZyMKM4Kuw2SWv/kDBuuupmvgly9KDcLW6c5vMxI/2eCoK00TOIp+bXGjlRUZw5zY9VOQV8NYgbffuMaE+GxOiwl3eoGJnnYsVurlC8NLVuO3fuqxNnh1fhK24BFGhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794202; c=relaxed/simple;
	bh=cM8cHbk2w2OZZmrz8yTgYSsbAJdpFmYssbRnSJz7abs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l7B4IsnP9PO/1LD/6I9TLD2CXh/mEdxUeQVjqC+qUvRL25G0KswJp9zfgODx8us64qC3rhT6y5foZrVWnSteeKFLKKN8Ne8LE5mycamxhUG6zO7+S8m7yjW4IwcJVpD8YoiK+QCwIIlysnBN1GTW/jsP1jeYaS1UVB+ofAimXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHOAGJ+L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RmVS012352
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 06:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5ty6U2xSO9fd8vI4ZNE2UCnYZYglW+cz1tw
	BcARdgyU=; b=mHOAGJ+L7STTd7ew6jwzMWFFK1WRI268+ko4OtvjWE6XiSqGQqy
	TYqF6rPlrx29ppH0p5FivNLORFKpL84C0OeioyFRELf3kfAB/L+Igz///gibEH6F
	LSNxOnpcZ7FEH5axlEiTky4iECmFOQqXxcE2/b7er91xdZOOCOh8fz4YUB7hfQsH
	mOJ+Hg88D0EWV1cgNHe5z+2rYxT8HlZDXCQqgZuffQnjrRRQ6PoJNpnqVFluIXpX
	GzILJqrbOv56P5ha6dLYvdFGBIhAObZlYkGzBX5qYGY0xhkl2IQXOXO38XFf5ElZ
	vxAlVK2tDwCTeHz0AWgVNuo3qczDlKqAKcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fempb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 06:23:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce13aso100185605ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 23:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794198; x=1757398998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ty6U2xSO9fd8vI4ZNE2UCnYZYglW+cz1twBcARdgyU=;
        b=kHHVK0dN29nnPR2xErvx8D5VhmvrniWVVBv3oOCNBZV6aeIHqLqzps8OpNLX19aFnI
         CMsvPRPNxxR7SnyQ55ELuboA+LgT3EmGASQAuxHfrHKT56LggDb7e2rQ6g6MtaCCIIJY
         q6lljCRC2OHBVYZGAqbXkx0SzuH1hPgcvvAGP9dOwiDVidguwUEXwBSiCpocpZfx7r/j
         UcNRnDm0hP1i4RuBrcTz/3bMwYVGqnuRBJQtkpYT/TOaL15EGRXZhsxDW0MkLzSOoq0C
         xF4MCbxZuTQ+OcUmjXE01WxcaStwKPaDpVQm+iOXaFkLAB21/oLYeUX498PpNFQ/o9tu
         Nwpw==
X-Forwarded-Encrypted: i=1; AJvYcCVAjCXdW6jtAjLVxE9vXjCDGxS4N8eCmq/xmtV2zAff7zIz12BMbBgmMQC4aqwMInnqZLyiC4d/ThgL8Zsl@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUyuzXAPaw1m47nYFZWt9avizLPVneMCdUO5q8ChQHH3oa0KU
	ejuiKxQUbhzQ2xNiCrkUZQv4Ozs3QaOcWfmIcI5XkOIa2rksVuqARa4JkjIfYo6ynSNDSW8J4I0
	MLLKcZwLwwp9KK0aXvZRBIH5UlN9TK0vDdH1Sz4vXhmFjfyLAVGs3/Dknusx5Jbo5EcB6
X-Gm-Gg: ASbGncvCraZNDAIuSkpZKaD9fIYlV4fdO+GJVPg2aT8a7xjdOEPzqfx5tHCIK4nws6X
	dtkc0S8lA1oI+p6/1y1nBJBVGs9Skgcp8Qw2Z6Vgaa7uCpLwO0FM+6Z2fQK5+OdHH/SO89uTuX9
	HjVhpiKAK+OQmf0QXu7w9G8EpQiZjhnDmwbvXsnWjfSAYfPPvhmsmEDz459vacT8XNKGPf3ioT5
	EwJ6SjS79cZxvvsN1oLasPMriIJq8qAgFstbWHt4lZ+L2hdswTfxr34qpDFODqlfycW6u0JexHM
	VrWtbjwSvgYNuPl07PnuVXsiuUCOQ7xXSuzZ2b+o3+qkTYkk1nf40GA6JVwo2pOsMh44fcS3BOc
	Q
X-Received: by 2002:a17:903:1ac6:b0:240:83af:e2e0 with SMTP id d9443c01a7336-24944ae7beemr128467095ad.47.1756794198502;
        Mon, 01 Sep 2025 23:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFflNm60kP5vvYAR/1um79Y/dSnIfm6IPaMoEH9Ts6y42H+X93PKZ2oPk6BBwsDEUByGv+wtQ==
X-Received: by 2002:a17:903:1ac6:b0:240:83af:e2e0 with SMTP id d9443c01a7336-24944ae7beemr128466795ad.47.1756794198004;
        Mon, 01 Sep 2025 23:23:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329b641fdc0sm1894231a91.7.2025.09.01.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:23:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map mixer control
Date: Tue,  2 Sep 2025 11:53:00 +0530
Message-Id: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3Pv93vPBKGw1
 jkf96dF9hZpYBz0sXPA99Ct32DMc38hremON5SvemIusz4DLFQ1H0F4YF8ji+/l0IYM3fZJ3RZS
 OSoDm6nKDS20hSkJ1wRqjFntT8JlvdpbkZX/UZGQw1jOndtcQmSK9ihc38INS0reU6CXwEl8566
 xFpHSfFUNjeSk4B/bLtm4XZLks+f93iBcKH6qqKFLGVuCiBPD9k36kR5N0COiwYhpfa8cFzPkK+
 hS/4HdA3zHEKh+dCjXRPX9GNCx4sG9CyTOUgc4gkfF/adFmytr8lV+/6eBbodSxtAVCjTh7S3ES
 hZ2n2+tOYGWPD11ZBhVjLG1sBHCDQnmuFvye0MEQVoi5GGvS9OV4LpGpjBSmd3hG0Koc9NRSOCN
 8ugOTVXB
X-Proofpoint-ORIG-GUID: M3bi1EDSgMdFj64B9LY3zYi9qt5Uy_dW
X-Proofpoint-GUID: M3bi1EDSgMdFj64B9LY3zYi9qt5Uy_dW
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b68d57 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zFJH257Hk5x_bgKGl4gA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Introduce the channel map mixer control support for LPASS macro
codec Digital Audio Interfaces (DAIs). The channel map mixer controls
are required by APPS to configure usecase-specific audio routing and
channel mapping.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Updated patch with improved commit description..
- Link to v1: https://lore.kernel.org/linux-sound/20240930053111.3986838-1-quic_mohs@quicinc.com/
---
 sound/soc/codecs/lpass-macro-common.c | 55 +++++++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h |  2 +
 sound/soc/codecs/lpass-rx-macro.c     | 12 ++++++
 sound/soc/codecs/lpass-tx-macro.c     |  9 +++++
 sound/soc/codecs/lpass-va-macro.c     |  9 +++++
 sound/soc/codecs/lpass-wsa-macro.c    | 12 ++++++
 6 files changed, 99 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..777af4885245 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -8,12 +8,67 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
 
 #include "lpass-macro-common.h"
 
 static DEFINE_MUTEX(lpass_codec_mutex);
 static enum lpass_codec_version lpass_codec_version;
 
+static int lpass_macro_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dai *dai = info->private_data;
+	u32 *chmap_data = NULL;
+	u32 rx_ch_cnt = 0;
+	u32 tx_ch_cnt = 0;
+	u32 rx_ch, tx_ch;
+
+	chmap_data = kzalloc(sizeof(u32) * 2, GFP_KERNEL);
+	if (!chmap_data)
+		return -ENOMEM;
+
+	snd_soc_dai_get_channel_map(dai, &tx_ch_cnt, &tx_ch, &rx_ch_cnt, &rx_ch);
+	if (rx_ch_cnt) {
+		chmap_data[0] = rx_ch_cnt;
+		chmap_data[1] = rx_ch;
+	} else if (tx_ch_cnt) {
+		chmap_data[0] = tx_ch_cnt;
+		chmap_data[1] = tx_ch;
+	}
+	memcpy(ucontrol->value.bytes.data, chmap_data, sizeof(u32) * 2);
+
+	kfree(chmap_data);
+	return 0;
+}
+
+int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_soc_dai *dai, int dir)
+{
+	struct snd_pcm_chmap *info;
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,
+				      2 * sizeof(u32), 0, &info);
+	if (ret < 0) {
+		kfree(info);
+		return ret;
+	}
+
+	/* override handlers */
+	info->private_data = dai;
+	info->kctl->get = lpass_macro_chmap_ctl_get;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_add_chmap_ctls);
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index fb4b96cb2b23..23ed6836addf 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -40,6 +40,8 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev);
 void lpass_macro_pds_exit(struct lpass_macro *pds);
 void lpass_macro_set_codec_version(enum lpass_codec_version version);
 enum lpass_codec_version lpass_macro_get_codec_version(void);
+int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_soc_dai *dai, int dir);
 
 static inline void lpass_macro_pds_exit_action(void *pds)
 {
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 238dbdb46c18..db08be2600ea 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1953,10 +1953,22 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int rx_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_PLAYBACK;
+
+	if (dai->id == RX_MACRO_AIF_ECHO)
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops rx_macro_dai_ops = {
 	.hw_params = rx_macro_hw_params,
 	.get_channel_map = rx_macro_get_channel_map,
 	.mute_stream = rx_macro_digital_mute,
+	.pcm_new = rx_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver rx_macro_dai[] = {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1da34cb3505f..934b814b7a01 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1210,10 +1210,19 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int tx_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops tx_macro_dai_ops = {
 	.hw_params = tx_macro_hw_params,
 	.get_channel_map = tx_macro_get_channel_map,
 	.mute_stream = tx_macro_digital_mute,
+	.pcm_new = tx_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver tx_macro_dai[] = {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a49551f3fb29..69224c7805bf 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -938,10 +938,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int va_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops va_macro_dai_ops = {
 	.hw_params = va_macro_hw_params,
 	.get_channel_map = va_macro_get_channel_map,
 	.mute_stream = va_macro_digital_mute,
+	.pcm_new = va_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver va_macro_dais[] = {
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index da6adb3de21d..62ed1173fd1c 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1354,9 +1354,21 @@ static int wsa_macro_get_channel_map(const struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int wsa_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_PLAYBACK;
+
+	if (dai->id == WSA_MACRO_AIF_VI || dai->id == WSA_MACRO_AIF_ECHO)
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops wsa_macro_dai_ops = {
 	.hw_params = wsa_macro_hw_params,
 	.get_channel_map = wsa_macro_get_channel_map,
+	.pcm_new = wsa_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver wsa_macro_dai[] = {
-- 
2.34.1


