Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D06738183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjFUKzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 06:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbjFUKy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 06:54:26 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC091BD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:53:46 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3110a5f2832so5446295f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687344825; x=1689936825;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOMxS6RwW/d7vuc376qdNyNpcZALKC5US0Joy/lb4Sk=;
        b=BIB0WuymJSIzGVgKi94ef2avt9bYjmZ98fSCc1ddHA5zQqD9VuDJWr4SQ1LumrM6Fn
         Rr+1eSa9Bd8Bds4PC+TrJ2eGLr7h37YR+0KsRINIanWhYToMYhtIsgryDt/aE9xc4JPu
         HIqkzWcbckNbxWbAci1fmuxI96ADTnu1bBslc5/GlD3a4YZfo+h4BfUgDJSTaDFEYt3u
         g1S3LnvrmwwpPfXp5V+LxSBdlraqxdU7zE+lWqBmqkq82sbWxD1v+0Q84WrMQhzwNh0c
         2CDrTkRFWlpM2HJqh1Z5Dz4cJSnxBDPWXaTTrD+agdWsrAJuoOobvmwiqjGmvI9FgOeL
         JD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344825; x=1689936825;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOMxS6RwW/d7vuc376qdNyNpcZALKC5US0Joy/lb4Sk=;
        b=LycPFmR4v+TDXqX4DO7vxhAdAb0Q8bwJqIS3sc4LPghQ5a1gsl7LpPERNxz13LWn6l
         8YwO5CDI/Nh+n41FF9Rw/Be1Rng7+QQGQT/Ot/QA1OLq4+NtLddk+ChDPmJsQBPqXA1c
         WnfblaaEpDSzyflkPCVb2WKhsQqdC2YWVl2LUCE2nhO74pIWs/bO5h5L7Sp5HAm2bQae
         goYh4OFHiM0MRrRo2d1+1kdFa2cc6RaMMPwBITZo9KdnjRkafkHkoxWzO2k94PNgBPyv
         +Gf4VeHChKSELym89NXKWzCDJ9E2z0WnS5LIwXRx2H3B8Vgxsi/G7lGapaQFK3CtESJm
         je5Q==
X-Gm-Message-State: AC+VfDxyvUmg6zBD6ycklGmpqcCvKDdgdOG3IlXiXRBqm4qWA9WzLl51
        WxSpKxrzPMi56I/QWCwfwiBzCg==
X-Google-Smtp-Source: ACHHUZ5nP+fsVKuJeYKtwV5Koaj5ir+sdR2QXsugFWiOQJ+vHmJ5+Wjz9jHku3W9EJi3H3b/5lg0+A==
X-Received: by 2002:a05:6000:196f:b0:30f:bdad:19db with SMTP id da15-20020a056000196f00b0030fbdad19dbmr19604346wrb.10.1687344825393;
        Wed, 21 Jun 2023 03:53:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p1-20020adfcc81000000b0030ada01ca78sm4179124wrj.10.2023.06.21.03.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 03:53:44 -0700 (PDT)
Message-ID: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
Date:   Wed, 21 Jun 2023 11:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Brian Masney <bmasney@redhat.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PULL] Add Audio topology firmware for Qualcomm SC8280XP X13s
 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 045b2136a61968e7984caeae857a326150bfe851:

   amdgpu: update DMCUB to v0.0.172.0 for various AMDGPU ASICs 
(2023-06-20 11:50:21 -0400)

are available in the Git repository at:

 
git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw

for you to fetch changes up to 85d1739e5aafcfada7a1e847c258217bd7408a5c:

   qcom: Add Audio firmware for SC8280XP X13s (2023-06-21 11:11:34 +0100)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       qcom: Add Audio firmware for SC8280XP X13s

  LICENCE.linaro                              |  30 
++++++++++++++++++++++++++++++
  WHENCE                                      |   8 ++++++++
  qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin | Bin 0 -> 24296 bytes
  3 files changed, 38 insertions(+)
  create mode 100644 LICENCE.linaro
  create mode 100644 qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin
