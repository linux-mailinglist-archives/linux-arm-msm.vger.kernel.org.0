Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46C5387D5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345891AbhERQ25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350607AbhERQ24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:28:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71716C06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 09:27:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b9-20020a17090a9909b029015cf9effaeaso1834103pjp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f1d/gi6dWIkxeOVPavTj9FbVcjVV1QNQTHRoa065Axw=;
        b=ltK2Iy7UdPjTLSC30wGMvTDqSuz9Tgdw5TPVjMsfHwcsICjhevbCzkqvnNmYfn4OGw
         ME3LAkIlii0f3cb+FMfATTKVje3qgqtyyLv7HbeqRlZsaUkGCLFATvjez4IZ96DDla5m
         PxBhkAB9GQL67fnkmX2ZLFmzmtcJyR6PF0uag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f1d/gi6dWIkxeOVPavTj9FbVcjVV1QNQTHRoa065Axw=;
        b=VYJIE/3V3H/N7AS+jsbpcfPwQPiZDW0RzF+wbGdgeyiCSXep3mIdM1rosD1cNFUycC
         75Nj252rc5Zk63TuVl45jIneqJxn+RhcOwUJfs6oE+GoO7CnNG1UElezUTyZswnuVE58
         2HGfHIOXKkf2rouwFu7KY4qqvlxqG+2nN1GP9FN+D+X1HjBoP5zh7+xQx/zOAOGCvv3R
         EzmrYQyAJ63d8uamq+LRZ5xDXGlE36AK5zH2eZdBkPpcFu+8NzyQy6b5sYqYFa8Jv0IU
         Ij1uJVY9b/Xh/I3sF8okvTpGPY4upgNj9cCeUmJ9BQPAV4SIp25GkxTiaWq9ANOdidba
         OlxA==
X-Gm-Message-State: AOAM530hD9JF9C+G7ENG+yS8wY1Ru8u0kZpFI7pJLKV2Z6KusOguAesW
        M3cXybOCk5zcoh0IKNWfudEcwrQzJAxltQ==
X-Google-Smtp-Source: ABdhPJzWDMbUyShJOIx/gvCaFmMVofj6AaRHabNDQzzxjDYAOK3p+QoSxAXMzeVSyXoUi8wW/IS3YA==
X-Received: by 2002:a17:902:44:b029:ee:9107:4242 with SMTP id 62-20020a1709020044b02900ee91074242mr5541000pla.18.1621355254874;
        Tue, 18 May 2021 09:27:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5b64:c814:4f8b:838e])
        by smtp.gmail.com with UTF8SMTPSA id l67sm13529552pgl.18.2021.05.18.09.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 09:27:34 -0700 (PDT)
Date:   Tue, 18 May 2021 09:27:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 2/8] arm64: dts: qcom: sc7280: Add
 thermal-zones node
Message-ID: <YKPq84r7soE0yjMA@google.com>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-3-git-send-email-skakit@codeaurora.org>
 <YKOog43JZghth3Np@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YKOog43JZghth3Np@vkoul-mobl.Dlink>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 18, 2021 at 05:14:03PM +0530, Vinod Koul wrote:
> On 18-05-21, 11:50, satya priya wrote:
> > Add thermal-zones node for SC7280 SoC.
> > 
> > Signed-off-by: satya priya <skakit@codeaurora.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Changes in RESEND V4:
> >  - No Changes.
> > 
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 2cc4785..2a7d488 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -1125,4 +1125,7 @@
> >  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> >  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> >  	};
> > +
> > +	thermal_zones: thermal-zones {
> > +	};
> 
> Empty node..? what am i missing here...

The 'thermal-zones' node with the SoC thermal zones is usually created
in the <soc>.dtsi, however it doesn't exist yet. The 'Add DT bindings
and device tree nodes for TSENS in SC7280' series
(https://patchwork.kernel.org/project/linux-arm-msm/list/?series=478225)
is creating it, but the series hasn't landed yet.

The node is needed by other patches in this series that add non-SoC
thermal zones. Hence either an empty node needs to be added (for now)
or this series should 'officially' depend on the TSENS series mentioned
above.
