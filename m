Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B552B087F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 16:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgKLPgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 10:36:42 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44972 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbgKLPgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 10:36:40 -0500
Received: by mail-ot1-f67.google.com with SMTP id f16so5936497otl.11;
        Thu, 12 Nov 2020 07:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p9+hRtNlsfx2yF16OpisDfS8jNzJ5O4v4uBVZuIduPk=;
        b=uhw4sSDBVYpdM7voA9DuKhJ/7P6sq0nU68iViPklPpzRrTnGC1JZwUyx+XroLJX46m
         LWFhR+vwqjWe6Lfetklree3BTsi7g6OwVTGEn+pE6NOSRD3J4+KvLF8tYi4+Wv1yC4BP
         91ATLjewgLc2VJeMc7woDNPHXJvIE3bKE6AtBpMA3KfbE/CZm9dVZuWp1f80pwDpqIGZ
         FBMGJGhTHOKpx2qASYjP62KwBRbM2Wqln6itNducK+9rf1LILwaeI+KBNSLDz/1uNUX/
         eBHEiL1No1nCN0+dmAx0n9qqUHoRlWf+5Ig1Ro91ReFcSAtMnce3d15wrXX/jxZL0CPR
         kQPQ==
X-Gm-Message-State: AOAM530OlBPayhVm+I9eTMd8BpvMEMoKf+OW29hPTEUYJmo9MZyGw/e9
        qEWnsqCBUmtObCfXJ4dNow==
X-Google-Smtp-Source: ABdhPJwkhtfFF05VG+OK+BA0SxYnNU69zP7sOu9txuTpeGVO/qtQGcr7VPJws5/GzmtrmeFeTZaOPg==
X-Received: by 2002:a9d:1ec2:: with SMTP id n60mr22629900otn.63.1605195399851;
        Thu, 12 Nov 2020 07:36:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v144sm1161536oia.21.2020.11.12.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 07:36:39 -0800 (PST)
Received: (nullmailer pid 3641422 invoked by uid 1000);
        Thu, 12 Nov 2020 15:36:37 -0000
Date:   Thu, 12 Nov 2020 09:36:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, tzungbi@chromium.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, dgreid@chromium.org,
        cychiang@chromium.org, Rohit kumar <rohitkr@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>, devicetree@vger.kernel.org,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        judyhsiao@chromium.org, Andy Gross <agross@kernel.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        zhouguohui@huaqin.corp-partner.google.com, dianders@chromium.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/2] ASoC: google: dt-bindings: add new compatible for
 sc7180-coachz
Message-ID: <20201112153637.GA3641134@bogus>
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
 <20201112014328.695232-2-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112014328.695232-2-xuyuqing@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 09:43:27 +0800, xuyuqing wrote:
> Add devicetree bindings for coachz in documentation file
> 
> Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

