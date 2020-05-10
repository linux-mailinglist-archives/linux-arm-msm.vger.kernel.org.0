Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D996C1CCB8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2020 16:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgEJOae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 May 2020 10:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728888AbgEJOae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 May 2020 10:30:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A440C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2020 07:30:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k7so1497794pjs.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2020 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VB6QB0k6yF1xCUNO7qdS9eL2WdSOXXOnR9sFnZiLOd4=;
        b=R+MsY9WCtRMMxoxZF4KOot1ecgDsOPB1vYqBzsx/sSAFnQsx9ArlIiv1oWrbe6IYzM
         Zk2VyZUIcN0aB7+7F+8JD/UHUpzpXTubVIrv/E6LkNO2Guiz9jcOztegpRyY0GE9Pcvu
         tCW74BbqPjb/gEN6ITnZvVZDxPyiMjQpEKZieR+v/hGQJ5Sj3AQG05OZwCtLAz7iWZnF
         YGG7EPQZ685umqmg2iQn37HlDAlMZfaujGc/l6o+gOSBjXcFfJTtIsAat0fm8UZpDH9H
         lxZMu7JeudSu6i/Sa4g+vY0TUnSRefgt8matT62fUh8rEHNhj6DVXiBA3VM8gkamkaSq
         z4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VB6QB0k6yF1xCUNO7qdS9eL2WdSOXXOnR9sFnZiLOd4=;
        b=oRRPTG2dLQYMwqWz7r+39ZjIGSoBmm4oHNjrPJr2FXjKMEgalEvRoGtTx5zp4yKqOF
         f9BGkh2jktEZilAFPg2UMAo+oKFu+2UpQ9GBMMHVVhTeMWLIMTCcdNxvZmKnGKHEtx0J
         m+eEQagZY4PFagZ31PcKa+5hilb1NHtx0e6oR44xdbmUkg1yKslVq9ZFLErsxwC3W+22
         H3TL+GT54D9Zc/2vKJokgpBom+hnNKwaScfnytaCjlAZP8u0oaKyddAwb1kgv38De/Ar
         hcYT0F7yMFiuvyT5FMkOJIEVYnFfB+lGQjPLyODepWzBx44LYCEmbUoWi7Ne7yeY7ukl
         sYjA==
X-Gm-Message-State: AGi0PuYMELbmWQflsV7MBqA16KrLGMN00yd44313f5CG93MtOyf6yhBu
        5iN6dbrCVpKhZ84vTqpSPypTgQ==
X-Google-Smtp-Source: APiQypLVS+XTU5o7852M9jAyZ4wpgBqMnBWgIepU1EgoKyX04/8LK6qI8+34szonUh28DVcCpNNSNw==
X-Received: by 2002:a17:902:bc86:: with SMTP id bb6mr10879547plb.243.1589121033101;
        Sun, 10 May 2020 07:30:33 -0700 (PDT)
Received: from dragon ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g40sm7631138pje.38.2020.05.10.07.30.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 May 2020 07:30:32 -0700 (PDT)
Date:   Sun, 10 May 2020 22:30:21 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Message-ID: <20200510143020.GA16939@dragon>
References: <20200509130825.28248-1-shawn.guo@linaro.org>
 <e8150781-6000-dedc-ca10-6cee232c4364@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8150781-6000-dedc-ca10-6cee232c4364@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stanimir,

On Sat, May 09, 2020 at 04:21:20PM +0300, Stanimir Varbanov wrote:
...
> > @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> >  		return PTR_ERR(qcom_iommu->bus_clk);
> >  	}
> >  
> > +	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
> 
> IMO, devm_clk_get_optional() would be better.

Yes, indeed.  The function will make it clear that the clock is
an optional one.  I will make the change in v2.

Thanks for the comment!

Shawn
