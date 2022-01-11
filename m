Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC33948BA28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 22:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345330AbiAKVyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 16:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245646AbiAKVyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 16:54:25 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767C7C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 13:54:25 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id pj2so1351559pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5f2yRwnca4po/TToI5ROjNbeo8iSZ748Ub/QrR0dHuc=;
        b=EcYu/L/5MbgCkc0L2lvz8kq++K/ZH0L6kyU96mHQoUta86MlYouS8n6Gtky3M+1Y1S
         wPhzlxv2PiVSZMVHyeV7aFt0UwW3dHGXMDdV419vMkzoTyRYfO4Yljqqg6AujFch4Drv
         fb107vvImyU7gNrGngWSnpx2pzPfC0aM9s424=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5f2yRwnca4po/TToI5ROjNbeo8iSZ748Ub/QrR0dHuc=;
        b=JXg93WOKiKQjQcklXn34vJt6ZrlgBjtw/RmnWII2aUW5X/xR7LKaX8Fhde4aWARwnC
         oRTwXdCna/30vvG8QqhJ2/DOjbuGNLNYebtD9UYNOqGbKM4laPgbt8Bg99ChMOCX55mf
         5cs25CncCm57x3+w/IU7/OFbSMx8c/PCZRs537PRmGzTH/9vvzGCDJtVOkzmVhmNWd6x
         7i4FtBoQxYHWzGa4dPG4tZU1heSen4JeEe311sgtfj8A1NSM4aKaaeVAKCs4zENTW+bi
         0TyXNAhtfCMbjg574VyswarZgaWaNorj94JsPdstYPLTeYzmm/TQ9tnuVIVt7X6n8Vor
         9Ahw==
X-Gm-Message-State: AOAM532Vv+geKN69+32JO401FwYtCqhnlrUnVBSvS25ycH7BDWXau3ql
        UPtlPVD9HKADHxmGANlb4c22sw==
X-Google-Smtp-Source: ABdhPJwIONtNTCuP+/Vo0J8+j1E+yBh8BAxbE5zlFWfqgTUvLrNDPMYJfbWwD35RGyvzDpCz9S3efA==
X-Received: by 2002:a63:1046:: with SMTP id 6mr5708874pgq.602.1641938065083;
        Tue, 11 Jan 2022 13:54:25 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f0a7:d33a:2234:5687])
        by smtp.gmail.com with UTF8SMTPSA id j16sm10322713pfu.216.2022.01.11.13.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 13:54:24 -0800 (PST)
Date:   Tue, 11 Jan 2022 13:54:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, jponduru@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: ipa: prevent concurrent replenish
Message-ID: <Yd38j7mR5vwqlSMZ@google.com>
References: <20220111192150.379274-1-elder@linaro.org>
 <20220111192150.379274-3-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220111192150.379274-3-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 11, 2022 at 01:21:50PM -0600, Alex Elder wrote:
> We have seen cases where an endpoint RX completion interrupt arrives
> while replenishing for the endpoint is underway.  This causes another
> instance of replenishing to begin as part of completing the receive
> transaction.  If this occurs it can lead to transaction corruption.
> 
> Use a new atomic variable to ensure only replenish instance for an
> endpoint executes at a time.
> 
> Fixes: 84f9bd12d46db ("soc: qcom: ipa: IPA endpoints")
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
