Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82176655C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 09:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbjG1HaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 03:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbjG1HaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 03:30:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105C4272A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:30:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31783d02093so1289010f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=C/1HiCTU+Mw+b3eoR6IdkYs/7otP+yYTwa6bk2vFBsbVXTxhoX/gVv2WD5gUWYMsLM
         MHivd0SfexVStnz/IFab5nvIk/ZsO5nk1cH/Tk97Tdova/9aKS5Jf7jWd3r9X8TjgJJL
         OpLxP+Z6TQb7XGQXvY5gGy11MROrouVDJDlj4HI6LuooGpQwgEaXN4KPa9l/7U9jVm98
         lBQSsbN99Qd2tzmuAlrvS9EixejNQ7iD9OJShmho1xx3xhzADntx5Nkpb0ibhmNIB+VD
         UFzXorGkVVGPc3HJBmUYPt1ME+0ZZlIftv/J2fhTe7fgxwlDDSxENQkru05grMLY7zyZ
         NSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=CDCKVXLMe6U+2+RmDdjB7Jv2u8wAQtCo2AL7ikBZ1BL3q/cIC0ckMPdwx0WY1jjVP1
         pEK1nQJ7fb3rbsQs1hDB10pf3DQK7onoXTTbZeopj40fKKP0MaZDdSRFAgWB+IE4KdAm
         M07gDknziFNXBbn0psQ2P8LeE2q1Tvs7L6uvsNg5n9MGkXtkAO0ZRQjbnYf02xinDRPT
         mKIH1S69h7mweBY99HGYgr1vaEAsDjkfWSFhDrG4bbrTrkr/4dBA20vnzcI1i1pWnhvx
         jPacXr1yJBDBEgZFjWJAlq5IZTGajOgkdb70CrEsD0SiEe6Ousqpwdl9zAMoB74AuIjY
         d6mA==
X-Gm-Message-State: ABy/qLZDSeD+OeB0hcXbxshMl4LW7zq+vOITxjjwimkrxz9VFpzzinN6
        xmgoAPgITsIbnyHfwbgoGygVwf7fbh/CDP48/BE=
X-Google-Smtp-Source: APBJJlG3GwSdYyJ9ZD6wjq+xys2sTJGzxdr8OpaSe18YZrBjk762oIdLMk314un2krsQe8jIPFim+w==
X-Received: by 2002:adf:db4a:0:b0:316:ef23:9276 with SMTP id f10-20020adfdb4a000000b00316ef239276mr1246966wrj.52.1690529421252;
        Fri, 28 Jul 2023 00:30:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003174f6dc947sm4086945wrn.32.2023.07.28.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 00:30:20 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Vincent Shih <vincent.sunplus@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sunxi@lists.linux.dev
In-Reply-To: <20230714174820.4061387-1-robh@kernel.org>
References: <20230714174820.4061387-1-robh@kernel.org>
Subject: Re: [PATCH] nvmem: Explicitly include correct DT includes
Message-Id: <169052941981.85384.18073685620993485850.b4-ty@linaro.org>
Date:   Fri, 28 Jul 2023 08:30:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 14 Jul 2023 11:48:19 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Explicitly include correct DT includes
      commit: 3e0558db94dbe5e5030a87bfd9a153d519d61b65

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

