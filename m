Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDF919A5F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 09:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgDAHK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 03:10:28 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38136 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731725AbgDAHK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 03:10:28 -0400
Received: by mail-pg1-f196.google.com with SMTP id x7so11682020pgh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q3YpiEN9c0q7gtTc0xgNqKBZ8J1CYe0h5Njvo6qLBqc=;
        b=cPYiWF/6kIM7c7xd0hz8A3KchAwfdZf/WBjYHWlm/sRzmaapKKkhvB+xM+o9ExkBwu
         uI+vYZU+DEYJA+34/MvfpCsiHGXfetTpnUhEWprqfuBG6LkAHbm54C4O8FnDf43h0M1k
         3al6T2FOJA+agQa3CKSPh/T+VrSktO5sni+COXnkfh8oAlcxH3EYD7awYMjmiLX0KR7B
         NahVO1n9PiR928wCk+0u1GW2/qXX102bzWpS64sACXk3Am6+dgJd1YiU6CkX+2VzABYn
         D/nK2Wo0ASQJtn6jIZadn8VM7MefKiUkJEWk+jVDIxm1V84vY+t3I6FS5gKv4uTmKKra
         h2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q3YpiEN9c0q7gtTc0xgNqKBZ8J1CYe0h5Njvo6qLBqc=;
        b=FZPj0895IjM4j6pczZ/h0cU/Queg/T8p3MWLpngTPJoihAds2xw9QS3uC7yE3PtQGY
         aFS5AXsD6VXbIQ0YZYUVzTN6aMMZYdQLqO0HickJFplxaSpaSyt1t4kgtAJfFWQ8h//O
         5IL25SbhSXMjedk+VB5+h9UTbOWfVJI7xqD4wyk/FiQf1gaJmQa29FU9U+jtk8cyXo8y
         OfbSL3aUhyEqbgSu2N9gm7HZiACls7mFO4tm9uioicNnXWosIVWqL1vhhu3z8j+coKhX
         7C2PynoYhP8/6XKJkmcnV/AWNvSe6/2gJNh2Mv4Cfk62GQJ0oUT8+vpjmQuGDRvBzu0J
         O3sQ==
X-Gm-Message-State: ANhLgQ3PyM53flFTCM0w7GlXyvd8Z7DNtr7Grw3jaVZ1Bq+biDbT6SYW
        OxQuE4XCBc9nnJ3Ya9lh+rCPfg==
X-Google-Smtp-Source: ADFU+vv0GaG87lZWdspiXpoeNM3S1HoJf278awHnmC0uQGmwJkgdIPHnBFsC5+Ddmr7OhhkCGjWpeQ==
X-Received: by 2002:aa7:9ec7:: with SMTP id r7mr22171606pfq.191.1585725026717;
        Wed, 01 Apr 2020 00:10:26 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm870769pfx.184.2020.04.01.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 00:10:25 -0700 (PDT)
Date:   Wed, 1 Apr 2020 00:10:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh@linuxfoundation.org, davem@davemloft.net,
        smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] net: qrtr: Add MHI transport layer
Message-ID: <20200401071023.GD663905@yoga>
References: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
 <20200401064435.12676-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401064435.12676-3-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 31 Mar 23:44 PDT 2020, Manivannan Sadhasivam wrote:
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
[..]
> +static void qcom_mhi_qrtr_ul_callback(struct mhi_device *mhi_dev,
> +				      struct mhi_result *mhi_res)
> +{
> +	struct sk_buff *skb = (struct sk_buff *)mhi_res->buf_addr;
> +
> +	consume_skb(skb);
> +	if (skb->sk)
> +		sock_put(skb->sk);

Don't you need to do this in opposite order, to avoid a use after free?

Regards,
Bjorn
