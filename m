Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B04A631E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 19:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241672AbiBASCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 13:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241653AbiBASCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 13:02:41 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD524C06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 10:02:40 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id h12so17815455pjq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7tCuLpr8/2LBd/9CIpx4oGmqp37+2g63+QcCiU/FCcw=;
        b=WRl/nbwxyaq3khTLqkQsbbrLAhitrAJ2FYxxMArSCY2yDpkbMexbTkPQ/RuZnaYkNi
         ZnBhgIuT6IIHsyKJmz6cPqPsJRwux/Azf8/l4yOhwuFiLcToLfsWkWjcrbZqfuDNhxTK
         vCh0Iq5VxbmUxjgw3QAtq94h2KC0Fdq8wF0RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7tCuLpr8/2LBd/9CIpx4oGmqp37+2g63+QcCiU/FCcw=;
        b=U91u9IVQfQuvj9p5tLtqXr64kueBXbn9fsqTnE7RO0T8T2o9BtRkK5zWWC7PJ3J3Kj
         gqS67krtJNGZGkUMpAV+FD7c42AGBujo+SlG9wxiyQAUr7Jh0AXdirhEE7h3kr+KXfd2
         +eaGJeTHSvjrQ9nrT+eIA86RaQOuKBkVdQaHfjZNb7g1/7nkrnRsaPeDDtc3UFVT24rL
         TzF3nMgXJdQea4rEiE5hs3VEZo/Sbpb6lil6UuWVAVkbY0a+51k8yHOHj05uOo+Gftz/
         JVx1XJ7vtLx2ST/FiBSCd3tnSymo7WB99zCLkjRjlB3fhVdLbpEgZzsw1TrWDVihudXB
         q+SA==
X-Gm-Message-State: AOAM530xpJdy2+qfBsJQgV8DZvyhYPkF70xRfPpDuixOT909P7JXFZiO
        ZXIDCtVeEPrIUhTAbFm5OLULJw==
X-Google-Smtp-Source: ABdhPJzkP0PD5MmdFUYKdgkq732oNkEdLisECygqJK28T1AYcbgd81rLTJ3aIVEd+HlxmG9dQz1XkA==
X-Received: by 2002:a17:902:e803:: with SMTP id u3mr27005923plg.151.1643738560350;
        Tue, 01 Feb 2022 10:02:40 -0800 (PST)
Received: from localhost ([2620:15c:202:201:aca9:b3a5:6f80:8fb5])
        by smtp.gmail.com with UTF8SMTPSA id h5sm23127901pfi.111.2022.02.01.10.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 10:02:40 -0800 (PST)
Date:   Tue, 1 Feb 2022 10:02:38 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        swboyd@chromium.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7280: Properly sort sdc pinctrl
 lines
Message-ID: <Yfl1vnHvmoLt6ATK@google.com>
References: <20220201001042.3724523-1-dianders@chromium.org>
 <20220131161034.3.I6ae594129a8ad3d18af9f5ebffd895b4f6353a0a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131161034.3.I6ae594129a8ad3d18af9f5ebffd895b4f6353a0a@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 31, 2022 at 04:10:40PM -0800, Douglas Anderson wrote:
> The sdc1 / sdc2 pinctrl lines were randomly stuffed in the middle of
> the qup pinctrl lines. Sort them properly. This is a no-op
> change. Just code movement.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
