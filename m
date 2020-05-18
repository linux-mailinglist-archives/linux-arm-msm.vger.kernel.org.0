Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFA51D8B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 01:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgERXZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 19:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgERXZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 19:25:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A251C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 16:25:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z15so475615pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QVj3nKP5hVtsFAiZ/rRDQZNLBRTHzKzhnx5Wf/64tWM=;
        b=BJL0tpthaxkWDwWPe/c0HBJCwfPLNka5lv5YeMvjFA2PknXthQh5APJ6GxH9NeB6FQ
         uysBb/W9wQrmTFs7iAqn5/N1fFPgOTtaNH2tPS0497QTeJXiadpdGoaJzESLIlxJ0Lzc
         7hdhcG+yaNw8b5NBlNfxl4X+72GvVQHMTEiCymuzCgDSiYqkDVCFo32rUG89oFVI7glj
         h9pJuxHVgGFu4aYIGOwe27/uRybA6cyxuATU07vQ0PbgfxszkYfbwoEkW7FKRraGYRZT
         FRoIUJiXIvS/3FLrUv2SDVCbyjtrY/yImGeWFs6Rz6d+YCH0a1wuBBbojDtjV4Zs0lFb
         7BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QVj3nKP5hVtsFAiZ/rRDQZNLBRTHzKzhnx5Wf/64tWM=;
        b=ShEJrtHAPrV4UxvTFiJyFH+HvjDcMxZ/9miowBdue+T3HE2pRoWjDKDlqBpxjTokk2
         yBhJnc1LdZofBwC7mv27ICJmXskQQh5vlNxT8fcznXTOSic0fyzVRENUDMDISfCTouGZ
         3F/Y8nT1R6P252BpWImLngbEV/DDHiTJC43LflfKV8gerpfr0aXKB2agDcY1kDe4nmf/
         kfiB9ms3bzxb9s8REyeaveS50VpI2Kqg2jlrMSg61QLTj8TRbmLxNDP6MceQrSmNpCgl
         kJgzTAUYMcgUr2FYKX5oafoOktN7NBwQ7KtBEyiM3PbLfuLW9CqyTNNO1e+Mlfr099IX
         YIyg==
X-Gm-Message-State: AOAM531d6yJQgg5r1hIBw0FXJzecQ9gLQxl0UZ7tULGdsG9Bi8osf9nf
        BOqhnic5c8TjEdyiH9SlCHQ2v2Tl+vo=
X-Google-Smtp-Source: ABdhPJyPioMHQTi0LewvbyOFTMF+xVG03puGiL/AuNe3V8kLdR52K9tEwVHad/53xErvf7okGmWGbQ==
X-Received: by 2002:a17:90a:bd93:: with SMTP id z19mr1942252pjr.109.1589844324967;
        Mon, 18 May 2020 16:25:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id co16sm478114pjb.55.2020.05.18.16.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:25:24 -0700 (PDT)
Date:   Mon, 18 May 2020 16:24:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     agross@kernel.org, evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: enable IPA
Message-ID: <20200518232402.GM2165@builder.lan>
References: <20200518214834.9630-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518214834.9630-1-elder@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 14:48 PDT 2020, Alex Elder wrote:

> Enable IPA on the SDM845 MTP.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 1372fe8601f5..2f942daeb9d1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -448,6 +448,11 @@
>  	clock-frequency = <400000>;
>  };
>  
> +&ipa {
> +	status = "okay";
> +	modem-init;

modem-init tells the IPA driver that the modem will load the ipa_fws
firmware, but the MTP is assumed to run "LA" firmware where it's the
Linux-side's job to do this.

Regards,
Bjorn

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> -- 
> 2.20.1
> 
