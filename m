Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41A8D6710A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjARCGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjARCGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:37 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D7D457C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:34 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so22323009ejb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
        b=iYjiINA+JJ3kTzl1Gteh2w+mbXYZ9cG0fXexodYl+c+HMeAU3ijvCw2l/9A6UII/+W
         zk/r1pm7o/XrXklag/NO61lvSN+4jx5Vrk5yezpWjXvO7SWMRQfS8lM6BocW8giJG4sD
         JfPwWiVAtgoWl8NDfz4a+injNOjlx7/FRmOZUCJ4wJKLZQEAdUMs3n0OYMBPJ7PdcM/h
         NFQOIdvPFVszk9XlGUGxuK9Z4avY+cstBvIGRKohtA9lVmLIhnOyu45FJ5AssCqcxNDx
         FNYTjpSWV5OnvSgUnk56GRe4BQNmpyjtlyndTYZF1QER+2ljc3YFdpbq6dH4Wm88OdQ2
         dRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
        b=I7ZgXlBr1SNlka2yDzCKjei/WY2Ssw2tmfNulBI+K85WbuxrtsPrsCBSTpvHllexND
         23aBN0kT39/QkGCGQBgJHwRw2GtsBAYiWsuQ8dXUf5opXBU+nNbLK6jy8p9Oq7yFogKo
         63HBPbF8sdnENkewYrpj35m5XcTMfbt544OmyHXa4HYtkoNq7Dml5ljP6ID5cRgQYZh2
         ojjZqjxaowiHPQsKRks7nc2dy2UusGYkKwiw6cg1Md25xwTXbSlSlW5mfznDtq+li3aK
         QCLNlwfcYw6+fu9aT5ciJdajatsdQjOLgwpn/SSV8X/sFkOmsD+Yx790+OH/zc8gHSUM
         IuEA==
X-Gm-Message-State: AFqh2krqig1QjqIaSzreV2ldBIKRFYVHp8xOiu2K28IjxqK1t5unjI54
        sTTy5cL7p6ZUTwiZ06eHdS1ZsA==
X-Google-Smtp-Source: AMrXdXuMQsMdEybEvR86mCX/ybN1G/aZe55D3EdZwtkengkxeDuDvAfBx5UmZHdzFoQbX3i4PvV+WA==
X-Received: by 2002:a17:907:9b06:b0:872:f259:a7ea with SMTP id kn6-20020a1709079b0600b00872f259a7eamr4989597ejc.53.1674007592812;
        Tue, 17 Jan 2023 18:06:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dianders@chromium.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, marijn.suijten@somainline.org,
        vkoul@kernel.org, marex@denx.de, vladimir.lypak@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: Drop the redundant fail label
Date:   Wed, 18 Jan 2023 04:06:14 +0200
Message-Id: <167400670539.1683873.12609021672778272128.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
References: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 11 Jan 2023 09:10:06 +0800, Jiasheng Jiang wrote:
> Drop the redundant fail label and change the "goto fail" into "return ret"
> since they are the same.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Drop the redundant fail label
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc57f09acc34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
