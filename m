Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E1A4A9E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 20:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfFRSdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 14:33:21 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47398 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbfFRSdV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 14:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=C2fpSVPGJzPVwTzmH0qlyt9DQ91m4qmAVn0xCQzB2fc=; b=qft/z5p0A3Yr
        B7HKHLZ4QxZTXkEFS05lfFVUEkTGe0NUO4cB4VRQwn7tjqzLhEhzCfKhFJkhy9J21KhdoBdJm9nf/
        sMDTgzaJEAv7JkoSrg/idfvWUmhzA1H/TANCVKe28F03iIh87xT5oV3ZH0CVIa2T3HvJh786yNbml
        DnhHA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdIut-0005KG-Nw; Tue, 18 Jun 2019 18:33:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 391D0440046; Tue, 18 Jun 2019 19:33:11 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: qcom: common: Mark links as nonatomic" to the asoc tree
In-Reply-To: <20190618052909.32586-1-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190618183311.391D0440046@finisterre.sirena.org.uk>
Date:   Tue, 18 Jun 2019 19:33:11 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   ASoC: qcom: common: Mark links as nonatomic

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c054b41690a44e6534eb2a1beda1b655f3994c5b Mon Sep 17 00:00:00 2001
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Mon, 17 Jun 2019 22:29:09 -0700
Subject: [PATCH] ASoC: qcom: common: Mark links as nonatomic

The interface used to communicate with the DSP can sleep, so mark the
links as nonatomic. This prevents various sleep while atomic errors when
bringing up the audio interface.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5661025e8cec..a612d860ad26 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -97,6 +97,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
+		link->nonatomic = 1;
 		link->dpcm_playback = 1;
 		link->dpcm_capture = 1;
 		link->stream_name = link->name;
-- 
2.20.1

