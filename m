Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D3924A52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 19:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgHSRsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 13:48:13 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35630 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHSRsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 13:48:10 -0400
Received: by mail-ed1-f68.google.com with SMTP id m20so18822787eds.2;
        Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zX9jwCX/Eaov1Rw6oFqsIG12piAHTYmOUPZHGAVnJAM=;
        b=K4Qaob3pt4AeRlN2YNKstr686T33OyAo7wDY9LlLeWRiVEbYNB7srl3MLkaLCpBZdq
         kFyfQWe5T2oKKl1svHOm4FYXmzlq+ke172bkVwH5tMPG+0mPz9IHqGN3Fo0xxcCFns5p
         WNFJRFDOAI+fqdSQaM/FBSPs79sN2dw38/6k6C4bjw7pDblYVybGPfPXtmW23Dmaq7wC
         6123QEOAQjlgx52D18V3/FLr/z3Ksmdl0W4L40986vw0wb+N/hncaYIEFgafQaeZa1mH
         VGmo2iEf8bk9DhcUMhe85fexEk/vGNAsFDT/ZUtPYdN461Dpa2EG/6T0GCqhPxnYg7UX
         aONA==
X-Gm-Message-State: AOAM532Wvew9dANV4CZh+YQcpA6O/toettmmp/Nkd2yP6hid0aWDVV8c
        9afmEtNZXMmf1mjG8kYzB7Y=
X-Google-Smtp-Source: ABdhPJy7a8YQ6srCJ1yH086NTSH3EFod8CrU7Hoeaw8blgh1KR6D2HT1o1RXpPDLZA9IO0ZezxtWUg==
X-Received: by 2002:aa7:d8d7:: with SMTP id k23mr26744142eds.54.1597859289105;
        Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id i9sm19116548ejb.48.2020.08.19.10.48.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 10:48:08 -0700 (PDT)
Date:   Wed, 19 Aug 2020 19:48:05 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
Message-ID: <20200819174805.GA394@kozik-lap>
References: <20200729074415.28393-1-krzk@kernel.org>
 <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 09:53:59AM +0200, Matthias Brugger wrote:
> 
> 
> On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
> > Fix W=1 compile warnings (invalid kerneldoc):
> > 
> >      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
> >      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Queued for v5.9-next/soc

Hi,

It looks like this missed the merge window. Do you plan to keep it for
v5.10?

Best regards,
Krzysztof
