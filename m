Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC830740EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 12:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjF1K2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 06:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjF1K0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 06:26:40 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0D91BCB
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 03:26:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fba545d743so20067155e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687947997; x=1690539997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKNfjF3wW/Nm/nNPQwIEGWNf3zo0Uzcpr6AjJzCAwQs=;
        b=ewY1PWWZFTqt3d2EoUX7BYeBLURb1ND+wfkfANY8NH8ewiDiDYKhlwdmgQGxnQHkI8
         ujbIh67rsT39B+IL/3a8hsS/BEj2wi3cUm+tFOp4wJS0FnaJkXGH2PifG6QUVyjxANxh
         vIkdZ0LrYWYjLSMtpTnjDRNMO/yuWxKK6T7KEZrYZIxsDgX55CJ+BtTx2tlvUvxd5AJx
         ebygNj3edwU9/m9vW6Aof0Z7kz8PgpIbtNi5dvx0nvfx6BvZ0Tlsf9yTOmmqtUjAR1IT
         uw9np5GnyIYAIKzB8AcSIotnpy4LoKUgR4oER6EgFCgrN9/mxdvL7FAeiJhmWdp9C/aM
         06ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687947997; x=1690539997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKNfjF3wW/Nm/nNPQwIEGWNf3zo0Uzcpr6AjJzCAwQs=;
        b=FFbTLzQ7yZDQPagSDwcfTVhxnr5F89CFNFfbfWU7TpEMNdXUOSkWX2F/serqu78PGA
         BAH4ZglDypj3pXU9SFbSlYS0olFOo7u4qg/Uvo8v5QmB7R5vPROSSPppu5o7KiBRURz9
         ++L/uQL+4Tdrc+PBG8JdId7eWX1NRs5hVPEa1/HD+6+gQ5JxMIn3FQJMIwAA02wAm3LD
         vhLwRWildtRuZSb6681x4JthQifuWz8Jp4/LMWDoWwm1lYPhzHkvrjiiqCEBU24Atpwk
         tUz/csDpo3QLpurULxRFQtvGNDBqqPblgsvwImn4Ih+fQ3eGm6puhLtODYHrgRwGDdEC
         NXiA==
X-Gm-Message-State: AC+VfDxuPgfTYSF2hIhRmQo3UCYsA2aFTtyrPzZxOqYcAaBazfHcv4e/
        gkEYQXqJn8T4i+rS0pWJ2en28w==
X-Google-Smtp-Source: ACHHUZ6k6c/Qr75tGaXs6nIJMRkFErVcop4miNK7mJz2p1ioVu4szwQeFKE/lyY1CYAz4y9CySApsA==
X-Received: by 2002:a7b:cd98:0:b0:3f9:b4d8:8e84 with SMTP id y24-20020a7bcd98000000b003f9b4d88e84mr22176859wmj.21.1687947997137;
        Wed, 28 Jun 2023 03:26:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d53ca000000b003140555c0ddsm2467780wrw.56.2023.06.28.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:26:36 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        broonie@kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
        lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] ASoC: qcom: get tplg firmware-name from device tree
Date:   Wed, 28 Jun 2023 11:26:18 +0100
Message-Id: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the existing setup the firmware file is looked up in a fixed location
based on soundcard name, however this is not really scalable and not inline
with where linux-firmware stores board specific firmwares.

This patchset adds a new binding to q6apm to allow board specific Device Tree
to pass firmware-name, this also makes it inline with how other firmwares are
specified in qcom boards.


Srinivas Kandagatla (3):
  ASoC: dt-bindings: q6apm: add firmware-name bindings
  ASoC: qcom: q6apm: add support for reading firmware name from DT
  arm64: dts: qcom: sc8280xp-x13s: Add audio topology firmware path

 .../devicetree/bindings/sound/qcom,q6apm.yaml      |  5 +++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  5 +++++
 sound/soc/qcom/qdsp6/topology.c                    | 14 ++++++--------
 3 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.21.0

