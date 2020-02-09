Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05F2156B26
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 16:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBIPsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 10:48:32 -0500
Received: from mail.serbinski.com ([162.218.126.2]:32884 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgBIPsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 10:48:30 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 861D7D00700;
        Sun,  9 Feb 2020 15:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lcSDXKU_nL2R; Sun,  9 Feb 2020 10:48:23 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id D36A2D00716;
        Sun,  9 Feb 2020 10:48:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com D36A2D00716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581263289;
        bh=+zB4LnN9LLpPdhU7E7/M9daLcjy7QRsA3nLhYSVC610=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lnVf5zihzXXmqGAdeUCWgq53i5PiqyLPm1d4RtuXtQ2fYNZ0W9+yuDbaaVxcns6nO
         H6f/mlBFE6sn5DoBh25bAHN/BPZrlzhq7aHNnw9M85EXayD/sUNVxysoAffz9o+GGc
         dp+uvPpBThdF5kEtzk33qDa30Skas0vaaxANHxdI=
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Adam Serbinski <adam@serbinski.com>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] ASoC: qdsp6: db820c: Add support for external and bluetooth audio
Date:   Sun,  9 Feb 2020 10:47:40 -0500
Message-Id: <20200209154748.3015-1-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from V1:

	Rename patch:
		from: dts: msm8996/db820c: enable primary pcm and quaternary i2s
		to: dts: qcom: db820c: Enable primary PCM and quaternary I2S

CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Adam Serbinski (8):
  ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
  ASoC: qdsp6: q6afe: add support to pcm ports
  ASoC: qdsp6: q6afe-dai: add support to pcm port dais
  ASoC: qdsp6: q6routing: add pcm port routing
  ASoC: qcom: apq8096: add support for primary and quaternary I2S/PCM
  ASoC: qcom/common: Use snd-soc-dummy-dai when codec is not specified
  arm64: dts: qcom: db820c: Enable primary PCM and quaternary I2S
  ASoC: qcom: apq8096: add kcontrols to set PCM rate

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 113 +++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi   | 162 ++++++++++++
 include/dt-bindings/sound/qcom,q6afe.h       |   8 +
 sound/soc/qcom/apq8096.c                     | 172 +++++++++++--
 sound/soc/qcom/common.c                      |  22 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c             | 198 ++++++++++++++-
 sound/soc/qcom/qdsp6/q6afe.c                 | 246 +++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.h                 |   9 +-
 sound/soc/qcom/qdsp6/q6routing.c             |  44 ++++
 9 files changed, 953 insertions(+), 21 deletions(-)

-- 
2.21.1

