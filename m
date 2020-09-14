Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7976826940C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 19:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgINRtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 13:49:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41364 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgINRsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 13:48:18 -0400
Received: by mail-io1-f66.google.com with SMTP id z13so1011770iom.8;
        Mon, 14 Sep 2020 10:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PqPt1xAT32RIxLIZosJI+JQoUjrXFn0vUMes1djvxjg=;
        b=nFmde7xwBPW7t9vCilmbdZAxgRjxU5oDHxFXBLvDDS60QYpoq16ayYNkWgg9CTCVBG
         RMI8cm8s1fwiM6ZYjybpLZoZlVwlm51ogVEvoXQhDdWWy1pdWdYCTjIgwLZg5C1bKetH
         tNdk+ylA3idpVMnFK9bW7bvMwe7m7ibHte9zEwL+nz0aep7vL6htMl8TbPPkEpQDFOB9
         UK72XVuMreNq+VMb1AjI2Pj2UMPlVTYUdEPFKYX/ztwNHDaaloqFtpQFz453wMYpoi1J
         148yzLWItY9bdEVwPC0hNSOEMHuBjhMf6qjNUnWS5bbTo9vGZC5UZF1hN0pYbe5a1Dzb
         NwVA==
X-Gm-Message-State: AOAM531eVikvz3sWl6Ivc5viy6yGc4CfmyC2lSli7n6D9wrr+nAC+col
        VyA0ztn51YL/4QIKO/7OhQ==
X-Google-Smtp-Source: ABdhPJzMqG/uDJkJEjtFvej4Mc/bN+DjyUJgglEvHKfxvSE3kgBG2dw0CE0nO8CSpV+qZuBKSv5uXA==
X-Received: by 2002:a05:6602:2e87:: with SMTP id m7mr11860757iow.106.1600105697758;
        Mon, 14 Sep 2020 10:48:17 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k1sm7254435ilq.59.2020.09.14.10.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 10:48:17 -0700 (PDT)
Received: (nullmailer pid 4126584 invoked by uid 1000);
        Mon, 14 Sep 2020 17:48:12 -0000
Date:   Mon, 14 Sep 2020 11:48:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-kernel@vger.kernel.org, dgreid@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
        Patrick Lai <plai@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Taniya Das <tdas@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200914174812.GA4125843@bogus>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914080619.4178587-3-cychiang@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

