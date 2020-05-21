Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E366B1DC6A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 07:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgEUFbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 01:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgEUFbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 01:31:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68911C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 22:31:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n15so2807644pfd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JRDVqTKJQn9dGE105GZgiJ5dIsRRSP/IE0bUFoyPwmE=;
        b=minxTFlfVaz+SQH5XAqsAX1gwrfQV0SdY3KPyk3AA1TjZ6nBs+FvNcAzctmxiE0EK2
         06mrdQCQqsZPfkXdRQ8qP89raYNqyLpMT0vLB2iEXPJh6ny/my0yqBVLVh81LmVBw0lU
         juUnhG5y0owA8r48hnlnnTt3ZqlD7q4bFS+lU3W3lFEgICPEjgj4cwO66HwP+xdXeVN2
         X7WWLeYS2lqfnRSD4BAVnC3+PB/fJa1mqZc11hsv0yoI9HuTPFourSlVaB6IAE50tnlN
         1XpVIz8wJIujOVOHASrdXjIr5/EjdPlE1EFau6jk6QodfuDmLTOmpilWzvcLH+J7375Z
         Cu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JRDVqTKJQn9dGE105GZgiJ5dIsRRSP/IE0bUFoyPwmE=;
        b=EDQnoktp9PbVOtHvUaBqhjLpPzDBkhVECfeKkhQqCqwKk3sNQErebolPKApZ4TQHps
         sdZUED+MomOujZmRtnoH088fsITu5Xcu6zf3ehVRMLtvJGVyc66bE43wcRw4Ag0oL8JR
         CSiPRcBC5ETewbZfTkKb9tJHXbF0yjkNXfIU+Onb71qIC0mAg8Dxi3XCw7+FI6QfQyfz
         YDX8y+Ae9liM7pyyOc4iq5ENHDKQq7HKJ0s65YLOoNDacqjury7IUWr6841WD0tHgV94
         7FDJGQy0nucV/Eh7XNUXpkemKTKU/4ob9r5WbTN4ZhSS9JdMdGgbStqhraJi3olyr81l
         BBqA==
X-Gm-Message-State: AOAM533iXm3lPslXLf1EmKdYBycbalv65feMpumkzPoofWp0dk0ZKOa9
        hQ0MUZ2/tJyIwleocfxAssjH3Q==
X-Google-Smtp-Source: ABdhPJynp4GTJ87m3nlVCg3ltv9cM+qafeErszv1aY5MJp0I7TBIe7mHWz7XYuDvahHx8iXuUDBCYQ==
X-Received: by 2002:a62:2544:: with SMTP id l65mr7776595pfl.288.1590039078602;
        Wed, 20 May 2020 22:31:18 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e16sm3007001pgg.8.2020.05.20.22.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 22:31:17 -0700 (PDT)
Date:   Wed, 20 May 2020 22:31:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix parent for gpll0_out_even
Message-ID: <20200521053115.GF11847@yoga>
References: <20200521052728.2141377-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521052728.2141377-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 May 22:27 PDT 2020, Vinod Koul wrote:

> Documentation says that gpll0 is parent of gpll0_out_even, somehow
> driver coded that as bi_tcxo, so fix it
> 
> Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver for SM8150")
> Reported-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gcc-sm8150.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 2bc08e7125bf..72524cf11048 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -76,8 +76,7 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gpll0_out_even",
>  		.parent_data = &(const struct clk_parent_data){
> -			.fw_name = "bi_tcxo",
> -			.name = "bi_tcxo",
> +			.hw = &gpll0.clkr.hw,
>  		},
>  		.num_parents = 1,
>  		.ops = &clk_trion_pll_postdiv_ops,
> -- 
> 2.25.4
> 
