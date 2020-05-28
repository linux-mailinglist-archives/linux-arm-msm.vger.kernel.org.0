Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95ABB1E68C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 19:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405620AbgE1Rkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 13:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405342AbgE1Rkt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 13:40:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9946CC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 10:40:49 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x10so11900437plr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g7RTdEHDP9ZxhdJtmUAz3+YuWy4V9Urh/wbShjIVBQw=;
        b=lOvtkAjJErBV9hxiZrbpl1VhnWTX21zU0sD6T9SdiHj050/LjXLjpELafzpPZK3D9G
         QuCot0wSxFGSFkGsOa5J9qfKOWZKxlzir26JfPOBj1v3JyoZF5NEYKzwA4C7cHN8QH4M
         BQRxfhElrl6IwXrffCSNLZZh5RwaU0R7MLmX+xSUENGlZktnmPkgTNXHbRp329VgNOUK
         qxKs1wq3Wv+PSIFFTAhvI2HHBGxzL2dRABB0gMdNgct8TK5FMMeaKj0/+3zlFP/KpwqJ
         ZdtZSuJTg6iSDXxhbHoeP5aYLjCYfTDAGX1NclG8PUjvpquNFyB3fPCN4001CX/YJLuK
         Yc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g7RTdEHDP9ZxhdJtmUAz3+YuWy4V9Urh/wbShjIVBQw=;
        b=EsX8h8ZkZUWUFSsvrJdstU6OUjEBoVwl7cleJyLkue5sQJJ3TEESnqr0k+WXnbMm9W
         QFpEBJkXhxRo+4e4nnPNwUwdNtrHqgnDbfygfXSJTHrvBMe+wC1JP+L2OK3v1mimLgZs
         X3y72fsR7kXyozaHNecJLEuewevdogSdGMrsUIaGx8uza151ni6vvn04+xpRX9y8+rV/
         Sov+pSmhBjIQqR+LW+LthyEu2ZhoAU9Ywq4+w3Wg9ymDZujXSkaaLhsntiUMO2h2K4vK
         w7UHCP65PxAVu9+E9EDxK/a/NlddTiOzAyizIwZ3CokgOP4lAcRvhh+orWyyCkP4VDYA
         6ffA==
X-Gm-Message-State: AOAM530aGXNL1Twx81YjrbrZZbdPLYh/Mgaza7LmhjezKYTVd9aRt+/X
        TjmhRIE75ijrZvPZrncfIUiR5A==
X-Google-Smtp-Source: ABdhPJynO8BCn5H2WUjwIh/uB1cHKEqZ4BrjVdrxDGghjcKxVp3bh3SmfbOuqLDJycCRWXayY+wclg==
X-Received: by 2002:a17:902:ba8e:: with SMTP id k14mr4558181pls.85.1590687649056;
        Thu, 28 May 2020 10:40:49 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id v3sm5465547pja.8.2020.05.28.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 10:40:48 -0700 (PDT)
Date:   Thu, 28 May 2020 11:40:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv3 0/2] Add support for replicators which loses context on
 clock removal
Message-ID: <20200528174046.GA26008@xps15>
References: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
 <20200525161553.GA31527@xps15>
 <20200528144803.GA36440@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528144803.GA36440@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 28, 2020 at 08:48:03AM -0600, Rob Herring wrote:
> On Mon, May 25, 2020 at 10:15:53AM -0600, Mathieu Poirier wrote:
> > Hi Sai,
> > 
> > On Sat, May 23, 2020 at 12:06:50AM +0530, Sai Prakash Ranjan wrote:
> > > This series is mainly to add support for replicators
> > > which lose context on removing AMBA clock like on SC7180
> > > SoC where replicator in AOSS domain loses context.
> > > 
> > 
> > I am good with this set but need a reviewed-by on the DT binding before I can
> > add it to my tree.  The same goes for your other set[1].
> 
> Then why is it already in linux-next?

I wanted the patches to get exposure to linux-next before sending them on to
Greg for inclusion in the next merge window.  Rest assured that I would not have
moved forward without your consent.

> 
> In any case,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thank you for that.

Mathieu
