Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE8F11D837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 21:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbfLLU60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 15:58:26 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41106 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbfLLU60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 15:58:26 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so56529plb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 12:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FGjQzF0iKScXXFdM9JyIEL8mVJUWt3ih5NTxXqTlgWE=;
        b=iVNKJCwr+xuHXTJtsLemsYjlS79bMKUifmCLbob6M3lvrmBC0K910BTYSyXsTSHW/B
         DO1gmpZMZFYVmXapGtfEwWetW2lkuTUkqPYXnr47RhMrCgYuv2VRuBZj6R/J+CW8EhPv
         /PZcnOW5zZoa4aCVtCzIj3X9nhks2xL8EmKyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FGjQzF0iKScXXFdM9JyIEL8mVJUWt3ih5NTxXqTlgWE=;
        b=h7eC/5BX7q+3kiqax5XL5ysWK2yIVMrNJ2zEed0k99WQ6STr+NLD7xG2s/kga1psr7
         Uycpj9oKwCfeskd7IDD82zzI+mQj0Cu542lrl5OoJquK3PKz9hBO/BN2XTWE6+yJ/68p
         1piV9AFElsfGZfdMLBlx6g1LatJ2WYM1LXhgSPaZnIXfOF8GA5X3U9mnzMpN44fmbBCR
         OXKTA2glQ9iVz3FiuLdSWCy45/TosiF9ItJ5lsTCr/wyWu9Vv364yFn3++C7YHxBuh/U
         jnF2cfNI7zxOleS8WgsjYP/uuSdmOhQRkH2J5UEx3tmQMI/1oerrJw0s1ir5FW9+aEZh
         2f8Q==
X-Gm-Message-State: APjAAAU6stb/nRWrjarTp35msjjjSfRcTROG60R86bnCanv+XlAOfsOr
        27yOawkvag/KBQUREbzseqO6wg==
X-Google-Smtp-Source: APXvYqw8d7KvyNToM0AiNFq3Pm1ocL+6ODQlQfYD5UvuACYtqwlHLA2yWKnFX3iNF+jHnoJEdX24qw==
X-Received: by 2002:a17:902:9a91:: with SMTP id w17mr11383362plp.96.1576184305763;
        Thu, 12 Dec 2019 12:58:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k9sm6929652pje.26.2019.12.12.12.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 12:58:25 -0800 (PST)
Date:   Thu, 12 Dec 2019 12:58:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix order of nodes
Message-ID: <20191212205823.GT228856@google.com>
References: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
 <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 12, 2019 at 12:45:46PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Thu, Dec 12, 2019 at 11:55 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > +               pdc: interrupt-controller@b220000 {
> > +                       compatible = "qcom,sc7180-pdc", "qcom,pdc";
> > +                       reg = <0 0xb220000 0 0x30000>;
> 
> nit: when applying, maybe Bjorn / Andy could change 0xb220000 to
> 0x0b220000 to match the convention elsewhere in this file.  That's not
> a new problem introduced in your patch, but it seems like it could be
> part of the same patch and it feels like a waste to re-send just for
> that.  ;-)

haha, I also stumbled across this and doubted whether to change it in this
patch ;-)

Sure, I can send a v2 that includes it.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
