Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D6D75A8A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjGTIHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjGTIHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:07:10 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A87E213C
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:07:09 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b74310566cso6801241fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689840427; x=1692432427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHV3SorPPRx5smjTKgidKSpB/zG9RGZsFPGQGoh8zP8=;
        b=eo/aPm7QmBLtn05NMv5zgB6q00je7hyfwr3G+KlaQcIfVVo0nhp/BtkUFXWWNsfxzE
         YjHlqcOAcqUPzuLvQBBFi9QFWhxy3eLFajG+d2qcpDf4r3RN7Shsxb3P46y8xYKIOb+x
         cOE3LQEQqHJ7Ookvz6lXNKy87oQQ3XA0tXMb11/tD8c1Y4xlzdNlTV8XkrNkDrkWTNvR
         wQx4D49nSSuVaRPRiZPt1lULxjIlu4ornYVXwh++JCGMIi0XQ6SIAlnnj/QK+kLh73fk
         s9csjK5oq6Gvn7yxpA7S+nXVdyngfWBPC37F+D5hZ3tMObEQ2Wkaa1lTcELx4Y+KRLfU
         tqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840427; x=1692432427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHV3SorPPRx5smjTKgidKSpB/zG9RGZsFPGQGoh8zP8=;
        b=P4i59wn2EhLzZxwmUlXCCxW/esMdHCvTjrJB6HG0K6rCIjlN8k5tPzYytCWVbFVOPa
         A4XZnhS9H5ZdUDagz5aOCe+fwdiS4DRMxhgkPW4pvaC8pzUY7ISeL+PAevHRPWjcnxsU
         VnlevOb13Y5t26NUPWnIk+I5Xlok2TO6lvRTB65nOfyZgcvEqziXjnALzkZIzvXTJY+C
         EQbRaIeJa+uOMM7pxfIgT9Ge5rf8CcUnwCLjj47K4jcYWVrj4ZwIn7tqIby1R0gl1Osk
         sWYiiTObCUGalNtE5IW3bP0FRhCrnjcU+Ll4oVPga1ln1LAqZGcTrdyWLgiAZOVc8WOA
         W7ig==
X-Gm-Message-State: ABy/qLb4JdYKZ6/lVzDc3pzVFQ4H7I3fhWjJ/cWdqwEw7hG4Rp6vr9dB
        ITqgxyoiAkOEupJwHNeKWwlFGw==
X-Google-Smtp-Source: APBJJlF5k6R9A67PfYpJchDVd7Ed7BYUOP9gf1HDCKJdQrDY3scfui+zBnHSn9KXAkF+LCqCCHgZ5A==
X-Received: by 2002:a2e:9d52:0:b0:2b9:4aa1:71e1 with SMTP id y18-20020a2e9d52000000b002b94aa171e1mr1456444ljj.50.1689840427634;
        Thu, 20 Jul 2023 01:07:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b003143c9beeaesm542198wrr.44.2023.07.20.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:07:07 -0700 (PDT)
Message-ID: <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
Date:   Thu, 20 Jul 2023 10:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2023 16:58, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> ---
> Changes in v2:
> * Added Heiko's A-b for rockchip
> * Added Matthias' R-b for mediatek

Please split patches per subsystem, so this could be applied. Or send it
through soc tree, but you chosen the middle way - neither per subsystem
nor via soc tree - so it went nowhere :(

Best regards,
Krzysztof

