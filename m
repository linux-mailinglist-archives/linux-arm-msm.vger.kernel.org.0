Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C606E23DCD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 18:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbgHFQ47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728959AbgHFQkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 12:40:42 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E13C0086BA;
        Thu,  6 Aug 2020 08:39:01 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id z17so25696467ill.6;
        Thu, 06 Aug 2020 08:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K/3We8AGMWDx9mNTiTs/sOpLR+yCgqCzpB93qqwd4xg=;
        b=YQmE464gOXatIJgW4wBruhfeDMsoedxtYKDSDdwlqSco27XKoB6YpoyxAiGHFyOH56
         9aBPYNIDDTpw4IQr2siOCpymcA0w750p7NIh9NgjtJt77Z0UGuSLRhh+QP8g8d1Gyzl7
         NwPSNOggrwD5viuGGjIEHaHCZuX0NghGYYyGd8WoX4y5LQeo+WQOt15+tPeOIzQgCpT4
         hlqo2C0S6mntSTmH+GectnV20/Pl2QTb3fb09UH3y/rNje1zE690h+jUJX9g2Gg2wqSp
         i+o/T9jHXWrLGUD/7+3Ikzudg7ybxxb4v5b2wLydfRSoxA4aunpab5PWT90KvTCgKGMk
         7uhA==
X-Gm-Message-State: AOAM532Yd90LjKvcGM0N3wB+NehosS+c/Skg+3qlFoPhkfUp0lapRHCj
        HcVYBbkiw0EK5pD7poIO0K/D/Rk=
X-Google-Smtp-Source: ABdhPJxIIJY14/wDGJG1LlEcpKWPQN9KGSXYigWRU+8ra5vZCkBoygTzV2YMWGy2Cnsuuto1f8jrlg==
X-Received: by 2002:a6b:c3cf:: with SMTP id t198mr10069332iof.164.1596724203177;
        Thu, 06 Aug 2020 07:30:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s6sm4071541ilq.73.2020.08.06.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:30:02 -0700 (PDT)
Received: (nullmailer pid 807481 invoked by uid 1000);
        Thu, 06 Aug 2020 14:29:59 -0000
Date:   Thu, 6 Aug 2020 08:29:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     lgirdwood@gmail.com, devicetree@vger.kernel.org,
        plai@codeaurora.org, bgoswami@codeaurora.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, tiwai@suse.com, agross@kernel.org,
        srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, perex@perex.cz
Subject: Re: [PATCH v5 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200806142959.GA807423@bogus>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
 <1596528453-11437-8-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596528453-11437-8-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 04 Aug 2020 13:37:28 +0530, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
