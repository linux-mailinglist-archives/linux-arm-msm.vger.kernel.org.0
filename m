Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C257649C249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 04:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbiAZDsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 22:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbiAZDsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 22:48:17 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3ECC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:48:17 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id w15-20020a4a9d0f000000b002c5cfa80e84so7316304ooj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/CzI7fFqk9ezqzku/D4S1Z4SQBDlduEbt7GyUHCyi/0=;
        b=qqjPBxz8nPA/nHcBgparnJk+wSi0qEJmYKPNpaJxb6S8lm/PBXCeWOzefRI2zb+hE3
         pJ3Vm/xw7Z1zVAbYGLfMBv9T8gWbVOyzlVc70KvAek+ugpwpqjxV9Tecaw/+WP1/oSlV
         PqZKADBuv+e8rbuN5JekrNWmOUL2QtWObW2QdYzTe0d4uDzCG3l9eusuuaoF3SJxACfF
         WrbxcZfGTz4rssMjsLWQvpgqASqSpoT2VI9VmQHxCKGiMheGjah7neCLyc7lHA8Inj8s
         +FkYkd5vBJ2tjTI6MhhkWqvStD2KDIBaqor+2Wl1cB2PXPzPVAeqFcKnYuzLs6BUPCJ6
         +uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/CzI7fFqk9ezqzku/D4S1Z4SQBDlduEbt7GyUHCyi/0=;
        b=1uFqgvfOorsx6kUFT6MRYCyhBofayeMnHi7nkJnf6/LVsEt+RpHAFTejZd0KLeVoDV
         SHaZffha/q9e+41MnZ9Xoz/SJJrhMKICprARJcEgNfu+6Z6Vk+dmBCOeRcjAgJrhlZEY
         rxuKydbh2sOMLB+aq9PjQj1H+DVX3TtGhrwIVFLHiJlgv3K+bxkOU2TcnG3PDeuh/h04
         CG/GVZwa76wUsnGrVkfCQj4agnitpjTttQh1OKmkPdz6c4SvZYZXHJ8C7E587Kifpjhe
         8l7m4ovIciGQMKF1YkuRqrate8Q7olocUiJvz9M0WdrK8zNIPt8tBLqptomTDx/fgcUY
         zvhg==
X-Gm-Message-State: AOAM5316yqG+mMghWdBLLEQKPPR8XmFo+u5/Anp99FzDiLCAw9nsVScA
        872F8ORbrn1zN17L4qzXB1Zd9g==
X-Google-Smtp-Source: ABdhPJwqV6TZsYVpfJrk5fcrgE7qU2PrOCNdoVRSES32V2SReNo2Lkn75JI5XKD/GtUs+Sggwj9CvA==
X-Received: by 2002:a4a:ac0a:: with SMTP id p10mr14621672oon.96.1643168896843;
        Tue, 25 Jan 2022 19:48:16 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id d7sm1080152otf.66.2022.01.25.19.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 19:48:16 -0800 (PST)
Date:   Tue, 25 Jan 2022 21:48:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: msm8998: reserve potentially
 inaccessible clocks With the gcc driver now being more complete and
 describing clocks which might not always be write-accessible to the OS,
 conservatively specify all such clocks as protected in the SoC dts. The
 board dts - or even user-supplied dts - can override this property to
 reflect the actual configuration.
Message-ID: <YfDEfkAHSgB4xER3@builder.lan>
References: <20220124121853.23600-1-michael.srba@seznam.cz>
 <20220124121853.23600-5-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124121853.23600-5-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 Jan 06:18 CST 2022, michael.srba@seznam.cz wrote:

> From: Michael Srba <michael.srba@seznam.cz>
> 

Something is off with your $subject, perhaps the entire commit message
was treated as the subject?

> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: add this patch
>  - v3: fix missing Signed-off-by
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index f273bc1ff629..cff83af8c12e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -863,6 +863,12 @@ gcc: clock-controller@100000 {
>  
>  			clock-names = "xo", "sleep_clk";
>  			clocks = <&xo>, <&sleep_clk>;
> +
> +			// be conservative by default, the board dts
> +			// can overwrite this list

By next week we've forgotten why these clocks are listed here and then
it's not really going to help to know that it's a conservative list.

Please spell out why these clocks are listed here, and please use /* */

Thanks,
Bjorn

> +			protected-clocks = <AGGRE2_SNOC_NORTH_AXI>,
> +					   <SSC_XO>,
> +					   <SSC_CNOC_AHBS_CLK>;
>  		};
>  
>  		rpm_msg_ram: sram@778000 {
> -- 
> 2.34.1
> 
