Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894FD740F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 13:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjF1LA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 07:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjF1LA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 07:00:26 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A616510EC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 04:00:23 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fa99f6a482so33634075e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687950022; x=1690542022;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulQFhef1Kx2adBzeAqktsDyeJX9bz1Y+UkfQ7ijM/Ag=;
        b=BoP0vafJwKzZcasx5SKCJw34caNCIeOpL5jdLknwLn7E4x0VWgpS6vKXUlrHvjsif2
         coeuyM30tuaMkCQxfM90fxJ/XhYKh4rBqXrjNrcDYPRe9E90SNmKHsbz8oNpIHvZpTyP
         5T2yfJpjHIU/KGF1tviS//HiU6sLj2JeQYyFwdycNNHJnyyO3ijEckwCLUm99ec1jxRI
         RoQqAZqmbH1CvDm0aG0tJuR42F0H250cYsFjfqLEn8sPX0tKNzWf43GGpUBkqMTD2ZJR
         ETQmSawJei6Z2XfwVGB1VO8ZwfP+JibnqmlTwlbwshBgrjBxlqn3voXEWx31cES4Rp9t
         4TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687950022; x=1690542022;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ulQFhef1Kx2adBzeAqktsDyeJX9bz1Y+UkfQ7ijM/Ag=;
        b=KoVsrUMpL9yRz7Vt5YtI9gtl/xnAQOzFlicsppX5LcWKbmg05h+K51GALxeXhJLy9x
         j0u899qplcId7or1Vkp74B+TV5ywGewS6fQJGGwWOsbeDS01/lqaY2fbxsogAF3ILSnk
         4uR+f0tJC6DeVaieerAalNoZ7mF4daSQZ/viuYEYcKsSviW1emPBz7g37E006REHcLT9
         Dx9BptWhxG2v63zIE5m+S22/szlQFJCNQvzNZw2Xeh6SkDYRqwthv5rhzMV1ItfZGXAm
         z2c9nySu8vH6idRdiK8i8xJUGmeYMbCuGql/n9sHw16750zED9QzpmVHtcr/x71Jd0IN
         2iTQ==
X-Gm-Message-State: AC+VfDx7cI08WF7RUcMFhOM48z9R91GJTlzUz0hMVpeTz6dcvyv0LeVz
        wJOjvLoN2o2i+kymTVswbmZI4w==
X-Google-Smtp-Source: ACHHUZ5zvTRF+s6HV6oYBlU9nNHd550kzS3uEH7WrQ3meppPmFsimAxioPm8/AxGco/5BQpWpU1Jkg==
X-Received: by 2002:a1c:7c04:0:b0:3fb:ac7b:4930 with SMTP id x4-20020a1c7c04000000b003fbac7b4930mr2125286wmc.3.1687950022162;
        Wed, 28 Jun 2023 04:00:22 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p4-20020a7bcc84000000b003f9c8c6bf53sm13454380wma.13.2023.06.28.04.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 04:00:21 -0700 (PDT)
Message-ID: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
Date:   Wed, 28 Jun 2023 12:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL, v2] Add Audio topology firmware for Qualcomm SC8280XP X13s
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

The following changes since commit ee91452dac5abfc4c5b9827cf55e701d8c0ca678:

   Makefile, copy-firmware: support xz/zstd compressed firmware 
(2023-06-25 12:18:57 -0400)

are available in the Git repository at:

 
git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw

for you to fetch changes up to f9a35b3f0779844aa686b76506344db70a72820d:

   qcom: Add Audio firmware for SC8280XP X13s (2023-06-28 11:52:02 +0100)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       qcom: Add Audio firmware for SC8280XP X13s

  LICENCE.linaro                                |  30 
++++++++++++++++++++++++++++++
  WHENCE                                        |   8 ++++++++
  qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin | Bin 0 -> 24296 bytes
  3 files changed, 38 insertions(+)
  create mode 100644 LICENCE.linaro
  create mode 100644 qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
