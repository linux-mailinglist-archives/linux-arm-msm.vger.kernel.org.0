Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F323A215B54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 17:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729438AbgGFP6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 11:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729321AbgGFP6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 11:58:19 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B336C061755
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 08:58:19 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e8so18589302pgc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9RVtaJ0LNajH8tL25qGstAaY61Hw21/Gz13XlQLJwww=;
        b=PCh8WtzLeJQMoqoq3/Tnrt0CuSDAQ+DIzFonqrKtoRZjJfr/tEk3HFHYPM3L5tm25y
         weOqF5kOYlu+N1df0SXec2EjHElqO5xLSDH+fJUI63HbaqCYOq/vER3IGmw6JvwyglFR
         tJbWSgFgLoQrJhXMDcvjoIO3XCGagDxbLerDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9RVtaJ0LNajH8tL25qGstAaY61Hw21/Gz13XlQLJwww=;
        b=TyXM3Rxe0KTO2xYNWyQp6wDa+BsHZz9nH02RrwPbL56zz6dk0CFmkdwTPbOVUNRZWH
         rgrTw34U9tyKQvMJxFUGAFt6HQqDAeEa/HrBU4/RgM9h2s+C5BJEN1hrWfas2iQazbcr
         F0t8A4aUo55XFtQ73rdPotGp/HTijHNxSmi3aCkpVwA/Vl+qEdqteIPYC/Y4FiEmto7I
         udQ6+VU4NT54/Hhc5PQuAxXSPhpW/Cl4m7x3OOXLJAezPJ/e4vvQG3urDn+YnyqLnuIt
         jdJRqY9clIIXxpHJFgAiBgm0J49dE/d2lcF31HvLnYJcGCVpz9tY7Bkrq+uvhJDg7Xnz
         sFxw==
X-Gm-Message-State: AOAM533dJjgSygPmBtyaE3KQ0EzUABYzGS/oK4IampnSCHYyPMShQGtV
        zwtkRV6HB4B8OIfLVrgrAMskLA==
X-Google-Smtp-Source: ABdhPJwwxnF0fvOInGc/EtJiOlVFU1DmGn20sGPRjobjVNUcDMlD6m90eL/Rxz6px65Z3jOvRna5Ng==
X-Received: by 2002:aa7:8090:: with SMTP id v16mr5665995pff.199.1594051098637;
        Mon, 06 Jul 2020 08:58:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id cl17sm19008565pjb.50.2020.07.06.08.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 08:58:18 -0700 (PDT)
Date:   Mon, 6 Jul 2020 08:58:16 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add qspi opps and power-domains
Message-ID: <20200706155816.GF3191083@google.com>
References: <1593769293-6354-1-git-send-email-rnayak@codeaurora.org>
 <1593769293-6354-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593769293-6354-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 03:11:33PM +0530, Rajendra Nayak wrote:
> Add the power domain supporting performance state and the corresponding
> OPP tables for the qspi device on sc7180
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
