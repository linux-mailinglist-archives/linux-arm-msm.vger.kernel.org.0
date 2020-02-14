Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332C215D147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 05:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBNE5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 23:57:30 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34126 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgBNE5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 23:57:30 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so3267586plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 20:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=n6O7ZelHX94glmhMjMGvdu56eA+DSlizoPxIXZLUVpsrCpmVn2xEDa13FbDci4mmIo
         O4TunmsnYP8BRWDvd43t/Rlm2N/Em8bUnefMdgm4geuy52pDrI6FGNvj1u5VXLIB8We0
         z4yLTL1SriLEkPDLq7igHvNi0ZZiapI7YYoC5TgxoAYRTA0oRPSYO+RKtrSvHvoxmGde
         j0YyHt32uqWIWm68GGAvKCsK/bsvT8UhZjgM3ZfZE+iJ+qjHid2rJh6SYaXARRS7vmj9
         bExIEZfPoQ1tVT/ADiwz7/VTj2ennHgpqLMXWmqDXT1jkPmxeM1rNNSX7ZrS/bDQZwcc
         Podg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=nEdTXPrfjJu6/KpmGi6lIVX6uDLuaH+Pgtm1pVN9WE13KADj3ve3y1r9ZZ4iin8P1E
         DZYJJuU5lHrWnw+MX64eCPCR96uuq456Sy5oUgVei1w0l6w1k0VlwQsWFFJU6BfUsPYK
         eQLlGaacSZJ6+aVCrpXDR3lOnwBry8GSMiqzhkL+7WKj3tNO5+ofekj1m4c/hPoD8anY
         DH/84t5Gq1R5zD6FlMqHr8OTzsgfxW5BmdmoZzqXoKmlHHRSVovp9z/1xxCgWnBMZVk5
         v42tBT0opPcN2iTzTKxufEpHT5syVar0FqgO4Bd9c6EUmQ4JBGzeV6HE8adQ1dfpo6BH
         92bw==
X-Gm-Message-State: APjAAAViwNtNfIGybNgnnhbh2E0MEevoPDlbwU6gJcXIfVWX2DpSXAtX
        MgjYY0vE312qbg63QqokLgtCYA==
X-Google-Smtp-Source: APXvYqx6c/Oq/DJ+FfuRU2+zRP3Vq4zxWIgDCs7lRWP4DFiGtsIUPqxp5yIiKXI3eP7QrubZEYnL/A==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr1520750plq.152.1581656248269;
        Thu, 13 Feb 2020 20:57:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g24sm5030467pfk.92.2020.02.13.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:57:27 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:57:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200214045725.GT3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-3-bjorn.andersson@linaro.org>
 <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Feb 18:35 PST 2020, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2020-02-10 16:50:53)
> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
[..]
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = reloc;
> > +       mutex_unlock(&reloc_mutex);
> 
> Ah ok, I see that mutex is protecting the pointer used for everything.
> Ignore the comment above. But also, why not have every remoteproc device
> point at some imem and then search through the imem for the name? Then
> we don't need this driver or a lock that synchronizes these things.
> Ideally we could dedicate a place in imem for each remoteproc and not
> even have to search it for the string to update. Is that possible? Then
> it becomes even simpler because the DT binding can point directly at the
> address to write. It's not like the various images are changing that
> much to the point where this location in imem is actually changing,
> right?
> 

I will check to see if these entries needs to be packed in the beginning
of the array, otherwise this sounds like a good idea to simplify things.

Regards,
Bjorn
