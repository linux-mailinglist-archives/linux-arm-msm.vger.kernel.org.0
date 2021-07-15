Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB33CA455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhGORaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 13:30:18 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:40643 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGORaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 13:30:17 -0400
Received: by mail-io1-f46.google.com with SMTP id l5so7391627iok.7;
        Thu, 15 Jul 2021 10:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DohR+1i8O/Ca9VBCwrtBoD9xd67cOkMh3anA0GO0rf4=;
        b=tC/npXTmrN2pGZOkO4nl25jwdH7D5Vf0rFwg5DuO82tspat3/zYVmJYdHIr2I5TnYl
         fLV6ltsvcFCRbuwlYpz1Q98zIgchLZzK8rQSjVTgPN51ODH1e5LLrD2PiP6yzFF9bUfG
         BCPd3DjOtumquuAT+UP9GOvMHkuE52ODKV8Ot5b8+m/Suk2vGQvikkY75fBy1IaDITM7
         3hM2KfxUfHS7YiGKFX/qv+Oz93+GhswqP7CihT6TBPW0NjPdJwS2bh3e0bIzaYHVCd8E
         YHf6TBHdvpsECpSNIZxIPCOrlnsghyUyZZ6EC9+uRHZaZAvDBpPAr9Z3hToD5NpWt9/z
         au5g==
X-Gm-Message-State: AOAM531QzRsGMEK3YafL/KanDK+o5mQh6Y511Gvo/bK/XUE+2QuzUMWN
        kNuHH04UGutR4XfpqGyN0g==
X-Google-Smtp-Source: ABdhPJxpacVeR1g0h3tK5DpkkdcGYkmcfxQhiQGPGBMSNVCRM/zVFgZ5cUX0sm4Ft4KA2M1Tr599wQ==
X-Received: by 2002:a05:6638:41a7:: with SMTP id az39mr5058581jab.52.1626370044144;
        Thu, 15 Jul 2021 10:27:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r1sm2803809ilt.37.2021.07.15.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:27:23 -0700 (PDT)
Received: (nullmailer pid 1284108 invoked by uid 1000);
        Thu, 15 Jul 2021 17:27:20 -0000
Date:   Thu, 15 Jul 2021 11:27:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Update license for GCC
 SC7280
Message-ID: <20210715172720.GA1284055@robh.at.kernel.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
 <1626189143-12957-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626189143-12957-2-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Jul 2021 20:42:17 +0530, Taniya Das wrote:
> Update BSD license for GCC clock ids.
> 
> Fixes: 87a3d523b38c ("dt-bindings: clock: Add SC7280 GCC clock binding")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc7280.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
