Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF6B210070
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 01:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgF3XcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 19:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgF3XcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 19:32:06 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEAEC03E97A
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:32:05 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so9912474pgg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HvnJ5CTY5PKNwx2rApGXMmajme3wNdK5xDZTMK/j40g=;
        b=TEdNEp5deAlbLv+GtHt1PP8akdHtWI6rWWgfVsi4M6zH05mUytdDSQhdPrSSeF4pWz
         gSf9+GHSZq7X+N9QEOyYNdCrJjNwJp+wwZ5pQPIKFxqRf+Bi/nd9abDHyZtIQqxFbxRg
         NaoEe/E9nt+c/poE7PyKzspuuL15XowqC7CDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HvnJ5CTY5PKNwx2rApGXMmajme3wNdK5xDZTMK/j40g=;
        b=YcUTtfal5erbDCo/p5ZwI28HvusUM+j0RyINibA4GhDloHprp5zFwG9SgkVOFYYZCN
         TiKVU4LNoLkfdqs1P8Z8GjDNt9S3ttkUwUmE5w3gAmdQJwLpYZuWCX8jCuOo8zic9PYK
         V+e8YD2DpEQJZ5ilA0EOENoLUnx86EaiUqeBr55yv62FUxvuNk3lqUJQ8Eq1fGxtMeiL
         oK9cAGlBo3wZXnrM+Q6fAIWVKQC4kOHPp2ihH7ReTEnAV6ozVQmfrvTZE035ptVSTrqL
         VaBtOPa4vxG3WjVu6t5iVMuYI+p3N8WusDvnYXX48vN7VrvOiA3cO6T6uPlJ0uVXSBmS
         +vAg==
X-Gm-Message-State: AOAM532Ndno8v9Koak/j6ub0BBo8yfQ5WvV2g8el3v+4xSFfBdC80kKS
        tJNU8w1grmEglhG5nNrFZcmnzQ==
X-Google-Smtp-Source: ABdhPJzCrE1MU9tgfa+Vyr1llfYnQUE2NKc/S7yR8Vp5B1qGBAY8LkHusztUgu3jHMd9dCv4FVzQUA==
X-Received: by 2002:a63:f316:: with SMTP id l22mr16538006pgh.291.1593559924524;
        Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c207sm3720503pfb.159.2020.06.30.16.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:32:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: sdm845: Add OPP table for all qup devices
Message-ID: <20200630233202.GI39073@google.com>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
 <1593506712-24557-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593506712-24557-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 02:15:09PM +0530, Rajendra Nayak wrote:
> qup has a requirement to vote on the performance state of the CX domain
> in sdm845 devices. Add OPP tables for these and also add power-domains
> property for all qup instances for uart and spi.
> i2c does not support scaling and uses a fixed clock.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
