Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2C1B96A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 07:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgD0Fke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 01:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726231AbgD0Fke (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 01:40:34 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B645C061A41
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2020 22:40:34 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t7so641809plr.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2020 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=22T1fi9hCZYd16gPcEsO2HumG8BRGMGET2lEOhIEL10=;
        b=AyJkv03rxnWCaBzdAH5twsD9kYcFCs4wXARJ3xX27DJhspQD783axyG9yWI6oKX8Hn
         WqLMKCdno8670wi5hqobVmFSvs6h2h3Ap5h1Vunq/Ithw0kzdNq5RBAd8JOH8mYIBhwZ
         4EhT/0kj503nGbUXkckWvsPA2YMfOHM5JWriTedy0ZDTz173mxKGmgtDCOkH+7edLyjp
         X8YLtKgWTXq5gFQZJdzT0hecoSpiinhbJQ4M8j+acwHRGT6ACdAz6oUUNwu76E9aEMAY
         D2ZWTJEXX13ZkfHscUEYLxwsJp3rBfJKJo74m2+ePncqCkcm5KZXyUcPZcD/7p4MR0FR
         7bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=22T1fi9hCZYd16gPcEsO2HumG8BRGMGET2lEOhIEL10=;
        b=Ife/FmTTMncNMHOnDp0bDjtb4/j6wBHYKuxcLyHyuf9DXr5vJbhwGCNu20e3f4Qkvr
         UL7GJvrPMj3qkg4UiDrmW4J8u9NnEMY/xSj2i2isjiOww7W7iuzAt/Vfgj67ybtAoR8+
         ydeagGjZ9gAwMMLxf74N6F7W1hsgN7VOJSnA2pj+kjusjUXleoGqkxgX6166DtAM9VjL
         Dqy84vAk2h9vkF4aqZumNB4s1pI7q4/kL6ViSX7GS4QJKwpirsSwYJDjOHAcMGokjNJK
         n3ZZhKz9rT0FxOTwTGKw0d6trtg2NzSzkFLJV2rXI2a3q5xWPWIwf9dF3Nw1UpHRzrtN
         1apA==
X-Gm-Message-State: AGi0PubN5584DCcitWINNeRvstL6h3KlqjZJcfVGJ3YF3BYchbNTILjH
        3zVrueyELw/7ntTvY130feNr
X-Google-Smtp-Source: APiQypLU+w8iopyaIUxj6f7frOXFqJA7R7fUgSTRUGPKn1R4131TNHAPvUBHF5UzJVeSaVns4RLjSw==
X-Received: by 2002:a17:90a:ae12:: with SMTP id t18mr15259427pjq.26.1587966033683;
        Sun, 26 Apr 2020 22:40:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:996:8534:8d2a:cf91:2e3d:2746])
        by smtp.gmail.com with ESMTPSA id o21sm9959514pjr.37.2020.04.26.22.40.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Apr 2020 22:40:33 -0700 (PDT)
Date:   Mon, 27 Apr 2020 11:10:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Chris Lew <clew@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>
Subject: Re: [PATCH v2 2/3] net: qrtr: Add MHI transport layer
Message-ID: <20200427054023.GA3311@Mani-XPS-13-9360>
References: <85591553-f1f2-a7c9-9c5a-58f74ebeaf38@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85591553-f1f2-a7c9-9c5a-58f74ebeaf38@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Apr 26, 2020 at 03:45:41PM +0200, Markus Elfring wrote:
> > Hence, this commit adds MHI transport layer support to QRTR for
> > transferring the QMI messages over IPC Router.
> 
> I suggest to reconsider software development consequences around
> another implementation detail.
> 
> 
> …
> > +static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
> > +{
> …
> > +	rc = mhi_queue_skb(qdev->mhi_dev, DMA_TO_DEVICE, skb, skb->len,
> > +			   MHI_EOT);
> > +	if (rc) {
> > +		kfree_skb(skb);
> > +		return rc;
> > +	}
> …
> > +}
> 
> I propose again to add a jump target so that a bit of exception handling code
> can be better reused at the end of this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=b2768df24ec400dd4f7fa79542f797e904812053#n450
> 

Matter of taste! goto's are really useful if there are multiple exit paths
available. But in this case there is only one and I don't think we may add
anymore in future. So I'll keep it as it is.

Thanks,
Mani

> +	if (rc)
> +		goto free_skb;
> …
> +	return rc;
> +
> +free_skb:
> +	kfree_skb(skb);
> +	return rc;
> +}
> 
> 
> Regards,
> Markus
