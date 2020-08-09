Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546B923FFE8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Aug 2020 21:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgHITzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Aug 2020 15:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgHITzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Aug 2020 15:55:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FCAC061756;
        Sun,  9 Aug 2020 12:55:35 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v9so7391323ljk.6;
        Sun, 09 Aug 2020 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gEex+sxqDKUVPlri56W6GJ2mSxGnivkW+gKH+hakLOQ=;
        b=HVj0/PQ/3OaMWrCoamAvziPNkznvcRrRng7jJaKfouGJ+fj8l4IdZmMKlgCVKAhg6k
         2k0QP0SGtM0J+Ju8SxQt/OrmAc49RRrrjmjDlwzq1pBK2H8PnC/fuff6nYliQifl3lca
         KDG3BWcSEF3QjnJGnHPfGbOb4dBs/e5FK8Uhbs1jokgiaSCHQiKzH9LR5bve08N4AMD8
         HvsgNFESfguyXkbervtBdyrD7wOgh0NponO5mihsBkohjAoGWOVkrzgY+SyW8ZBgYRvr
         e2XYU/fgjpDOoF4hd6a464pcVLGsDs4619zFK5pnAQodHNq5xZA4KrJOl5NA60YrFaKg
         ZosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gEex+sxqDKUVPlri56W6GJ2mSxGnivkW+gKH+hakLOQ=;
        b=epCE/WcY5N6GN/mG/3Z/qtHmXXKoDVT19Xeaazchr8irDg5hi5zVlGc0fxi1LJDcDy
         CiyJ8yYveK8pAbuUHtTYqdz2hz1+FH+ymmINJ+YSfMS8BZzfzFSg1YaKs7/hom7ltKLR
         lzIrVk++a+qiYxM0p+jUCujsZJqTqZ+2Uf3QRfc1BkwCh/7OPt8W7UhuGag/Act5kOXq
         twKGsCa3qv0mTahjQ494bYEgTdvvcXOaqwm1Ua3PBVL+xyLJiBZwvdcNtk/U2pSlQKBu
         DLEERwmbKPqxRM8csS9RDWQFbS9apJ5bXWH1++U4HfHGqwjsVbjeTfNrs/POJoOk03pt
         M8vg==
X-Gm-Message-State: AOAM531ohVdTwIgL/CJNLl7ilT4ctPKWKX9obYF99miLOy563b+y3LCn
        XQBJcjQy2A8IDlMF/APAGSUJEsOhxuk=
X-Google-Smtp-Source: ABdhPJwDZkj1p7MsiBCLaRLyV7loewdezRxQeqbc7Ppnj9H8iwVf0EgGpDw2ny0QUDQTWNaa4Zp6mw==
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr10568109ljj.376.1597002933351;
        Sun, 09 Aug 2020 12:55:33 -0700 (PDT)
Received: from [192.168.1.100] (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.gmail.com with ESMTPSA id h17sm8191818ljj.118.2020.08.09.12.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 12:55:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: qcom: pm660: Fix missing pound sign in
 interrupt-cells
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200725082417.8507-1-priv.luk@gmail.com>
From:   LuK1337 <priv.luk@gmail.com>
Message-ID: <ce0da794-14fa-2e50-4b90-003d46668c8e@gmail.com>
Date:   Sun, 9 Aug 2020 21:55:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200725082417.8507-1-priv.luk@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bumping this thread, would be nice if someone could handle this simple fix.

On 7/25/20 10:24 AM, LuK1337 wrote:
> From: Łukasz Patron <priv.luk@gmail.com>
> 
> Also add a space after '=' while at it.
> 
> Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index ea0e9558d0f2..2e6a6f6c3b66 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -44,7 +44,7 @@ pm660_gpios: gpios@c000 {
>   			gpio-ranges = <&pm660_gpios 0 0 13>;
>   			#gpio-cells = <2>;
>   			interrupt-controller;
> -			interrupt-cells =<2>;
> +			#interrupt-cells = <2>;
>   		};
>   	};
>   };
> 
