Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9CA75F7E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 15:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjGXNLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGXNLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 09:11:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED1C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:11:18 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3163eb69487so3423309f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690204277; x=1690809077;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbwH1/ABXkTg5NUI5G212PSH3D3qcZ3RoSStC6xBIv8=;
        b=g+obt0KYVdEdqE4QlIp72UsU+UakkimL9L/cRzo5VMQL2NFxuENoyRMQCQlt+MkG6y
         dZo0hVLZjaum2CJm+R9mmEhiWvWFr0Ua/qwPurvr1Re8dMW9Bs6lC6ABzer99UD4yq8S
         ZEjBO8ws0bbb5ChbuZYKUGgzlmjdbBpuSm4bwgZcrS+dDriZk5qLXIJTtYEcYq/LI5QN
         DCOcgNi29CTP1foDEh5vy+dPMkNOPIAk9ToZ+xv2LYTyv5bVzxESKRQ1FbPU9/pzFQA5
         J0XZe5TEs+0KA4FpyXRCHfQjc5Q0txKbHaBhZZ1mWXvj7LyHoTmt3a1mbD0TFatW9D1x
         5uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690204277; x=1690809077;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbwH1/ABXkTg5NUI5G212PSH3D3qcZ3RoSStC6xBIv8=;
        b=IcBH/f6tm4/uD4kyiErecBVCv3jkQ9VWrvrt2qMlgpGTFVAHxOBaZF0LvgzJxfWHxz
         Qld9upSfiGhlCira5hrgvujojHX8BYzA9XzPmQAEBCVmVtmCm94Xue7w9MtJm/MaN1NK
         sXnc07mT3JeeJa0WE4FW/LOOdtxpXYyCPSs5W2mrudJmWTQQS70S+6+DeSZDPaDq0cLy
         l/uw1RAtncuqHsC7coWWegqqXwcukJmpLteFR2/1TqS6rqwYAzMMO7t7GeEyw4lI1Ub+
         mwB94jKdlNsfZqjO6jaOwxK9hMLSu9m0+uQStvyHHw8vPE1atJkn90t2klnv/Q0O/tnB
         kz2w==
X-Gm-Message-State: ABy/qLadqJKyYstm1kfk93ti1iorTBsnum+Un9rCJTzZA5AycrvxLeMV
        6aKVV/MeC0UFO+rqYcs+MhDkAp40OQCwQ0ZRD/Q=
X-Google-Smtp-Source: APBJJlE+Xln7bGTf4zIGX6szzQCBHrtgA9aVjSoLk8p65vvC0bjMkyz706O/cGIvnjDlVtBn5UYzRA==
X-Received: by 2002:a5d:5341:0:b0:314:423c:95a3 with SMTP id t1-20020a5d5341000000b00314423c95a3mr11271962wrv.9.1690204277255;
        Mon, 24 Jul 2023 06:11:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id r11-20020a056000014b00b0031437299fafsm12932719wrx.34.2023.07.24.06.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:11:16 -0700 (PDT)
Message-ID: <cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org>
Date:   Mon, 24 Jul 2023 14:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     "andersson@kernel.org >> Bjorn Andersson" <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        "linux-arm-msm@vger.kernel.org >> linux-arm-msm" 
        <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL] Add soft link for Audio topology firmware for SC8280XP
 X13s platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit c7824580d310809b55f95626b4b46954911be820:

   Merge branch 'v2.0.21961' of 
https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)

are available in the Git repository at:

 
https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw-fixes

for you to fetch changes up to a8b2a94c58f5cd9dc93b56dbdce83c867ea1e916:

   linux-firmware: add link to sc8280xp audioreach firmware (2023-07-24 
14:05:12 +0100)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       linux-firmware: add link to sc8280xp audioreach firmware

  WHENCE | 1 +
  1 file changed, 1 insertion(+)
