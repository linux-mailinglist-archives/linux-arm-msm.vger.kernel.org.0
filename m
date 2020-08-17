Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B61247830
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 22:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgHQUf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 16:35:59 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41590 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgHQUf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 16:35:59 -0400
Received: by mail-io1-f68.google.com with SMTP id g19so18979263ioh.8;
        Mon, 17 Aug 2020 13:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gggmf4/obf3xyX8N4OL6u2ludp+W78q9wdQyjaXQVTA=;
        b=Y96fXY1zuCIFSTju9SMXrdg8J6IZir3cIgbYw6fe/sTdafM3nwz7V0km5zwq2Sdlbm
         6Ia4khrgJe0hNpOACG0d3Oow1Xrugya90gvrhu6dEfVJuT51Oolyy/jB5fbIiFN5J06O
         RL4y6hLe1fejaLYCaorLyv1gkRjbh095EarowxtcRwes89SDA8hsf/f6pkHTHoqacRyJ
         UlgINcRbOLfx68osdgZ8ZUu2LSFLZpu/6hTyPLxeymt1Qr/+l6N9jBq4848zkUhe7sdB
         xvjmRY6FveMdvQBLAja6jy0CWkEDk9WiAvzME+cJYfiTL3rHiRoQ62iHfQSkaAF6UvmV
         rC9w==
X-Gm-Message-State: AOAM532aRI/Ffge4Q0xywanaHmdwDLZoE2mwu0HStMSp0ko92cAt9+3E
        vJzshrXaS16iZWIeYszn2w==
X-Google-Smtp-Source: ABdhPJzdeGjzY2eK3orrhQ6ZhXXYF4B8P4OnWpr2Kg2IjB7nPlnMYmtp7GDglYyFcTF2wKxx0RdFlQ==
X-Received: by 2002:a02:95ae:: with SMTP id b43mr15885225jai.19.1597696557970;
        Mon, 17 Aug 2020 13:35:57 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id o62sm10249657ilb.38.2020.08.17.13.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:35:57 -0700 (PDT)
Received: (nullmailer pid 1512415 invoked by uid 1000);
        Mon, 17 Aug 2020 20:35:54 -0000
Date:   Mon, 17 Aug 2020 14:35:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     lgirdwood@gmail.com, bgoswami@codeaurora.org, perex@perex.cz,
        agross@kernel.org, broonie@kernel.org, bjorn.andersson@linaro.org,
        plai@codeaurora.org, devicetree@vger.kernel.org, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v6 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200817203554.GA1512270@bogus>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
 <1597402388-14112-8-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597402388-14112-8-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Aug 2020 16:23:03 +0530, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

