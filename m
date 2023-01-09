Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446FA663599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237936AbjAIXo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237780AbjAIXoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1839E3FC89
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so15632855lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
        b=MQzN3h12iMrKRadC8OJ8xKFWWFDqhZ/VJPnhx0N+qFKFMuJTFkY+2buIGksW5nhlVc
         BaLPtbSVm5vjNuvnq9VSum+ZU1LmJqsgdRfXyACEsmc+qpCSq0x6DJh6NeA40u4oiasn
         K+oFiSO2TjyRJ5pv1ulJeT12NBUAFu+0fUF6XQ3hHZrFXRT6T9/BLS11UxJVy77Xwc33
         euIymblv8olgl74LAY/zxpyQag3XrkJ4jNkh/1u17PIhraMzvImFGsTMMyODenYyn8NY
         0DLe99eSp9PSGya/qKknZoVRIhT1gOd2s7IwxWjwrPfUJId7k2aO6nMRr3OaDqCfuFnC
         1NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
        b=Bv7uQzjJefoIs2bBL5g4gOHpZ/RHztW1vuFtichKy2T3kG8tS/aQRIklVeDmjZ/GIG
         QsycEnBY385MYWjTQtdd6aD6dqbE8DZwHMqD0lyPZ58PYfyv4Qh3Cf3uISYXI+oPiM+y
         n7e/95u1naf4J3+LHlMJh1LytvduaEzxADxjR21+qgN8bhzkelaBHybBqkuSUX7DjJ9z
         G2sKaQxHIsONiGO2xx2ml18usfG5Aoc+FxyoHwiQPdD9oAUziej5kWNM5VqhhoI4jk6f
         jnuPAa2uoARkv1oTbfmIqnN7t0qaB6rndXFS7n81bL/toOmolsfHHoimpSI8NWWOYKGJ
         PpUQ==
X-Gm-Message-State: AFqh2kosoqHfzfiuHV3RX8e3nr8XL3z1Ge5W1OgncEBSiUEtgNpPRYYf
        7V8KCceZMv/23N1FYSTk3fV3MAYK9GDKC0wB
X-Google-Smtp-Source: AMrXdXsoKpIWafS1JOF+h5zLFP43e0o0/Y8wmmadCp+bqzM9xbLffF2r6pd2BmKCKjH/6gjBJd2Zag==
X-Received: by 2002:a05:6512:3a91:b0:4b5:799b:6c8b with SMTP id q17-20020a0565123a9100b004b5799b6c8bmr19998411lfu.56.1673307845475;
        Mon, 09 Jan 2023 15:44:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
Date:   Tue, 10 Jan 2023 01:43:49 +0200
Message-Id: <167330408784.609993.15717302243167908042.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221107103739.8993-1-konrad.dybcio@linaro.org>
References: <20221107103739.8993-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 07 Nov 2022 11:37:36 +0100, Konrad Dybcio wrote:
> SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a685d27f2201

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
