Return-Path: <linux-arm-msm+bounces-58373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B43ABB69F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4755175A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 07:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AC02690F6;
	Mon, 19 May 2025 07:58:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD01C700D;
	Mon, 19 May 2025 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641501; cv=none; b=eTOs4nYjr8rpFnzdfa5Kq5T4dZ2icpwsP3Dsg2kmghyrr58OXzEXhjD9ypVA5QQXlexxR+gUouUl23WaXmytPP9kh5X4FvqWpoKVkITKfAwnXNYgYQYmnaeAqbnAe6+MdtGJ3HEZHPri8Zfhbqbiq5BbC1csT7fJkiIx6Rh8RKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641501; c=relaxed/simple;
	bh=k3uRIi+NLpJ8L/7EC7biQGu+wIBKDStDWXY/3PIMjEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQQzIFFmL1VmfAsYPLtUO6pkw6eXfwAw5Z1XfHgj+Xgo6dcFMeq8JFL5HD+XjaSIpg1Al/Bqc4gs1Pik34GrgVO3B+aoGUbd2RfnWpcAWDdG+VGMNxp4tylq2wzB7tplT0aTAwjKtfuHfbOz3arrVc6Z8JnSfPSczxAKt+vY2As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAD3OSyN5Cpo+2NoAQ--.9967S2;
	Mon, 19 May 2025 15:58:06 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()
Date: Mon, 19 May 2025 15:57:39 +0800
Message-ID: <20250519075739.1458-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3OSyN5Cpo+2NoAQ--.9967S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF15KF4UWFWfKF18Xw47Jwb_yoWkXrX_Kw
	1Fg3s5XFWj9FW7Ary8G3yayFZ7uFWxZw4qywn2qr47Jr15Aas5CFW2yFs3ur1fury09Fy5
	Crn8Z3yfKr1xZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUfrcfUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREHA2gqs4i0oQABsx

The function sdm845_slim_snd_hw_params() calls the functuion
snd_soc_dai_set_channel_map() but does not check its return
value. A proper implementation can be found in msm_snd_hw_params().

Add error handling for snd_soc_dai_set_channel_map(). If the
function fails and it is not a unsupported error, return the
error code immediately.

Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
Cc: stable@vger.kernel.org # v5.6
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/qcom/sdm845.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index a479d7e5b7fb..314ff68506d9 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -91,6 +91,10 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 		else
 			ret = snd_soc_dai_set_channel_map(cpu_dai, tx_ch_cnt,
 							  tx_ch, 0, NULL);
+		if (ret != 0 && ret != -ENOTSUPP) {
+			dev_err(rtd->dev, "failed to set cpu chan map, err:%d\n", ret);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.42.0.windows.2


