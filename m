Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD0717EAC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 22:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgCIVHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 17:07:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33182 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgCIVHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 17:07:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id g15so4977260otr.0;
        Mon, 09 Mar 2020 14:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pMV++LytUtj3P6dSF++V99qkX7EhPLEm12vYJmHEnZw=;
        b=Uo4yIFxYYw33dOkHHrM7bRMj9kfE4EMOF9wQTnB/OmFncAWwdqqbxtIM9gfjvriziu
         rdp0FE4zc2K/O1TXvnks5+6rtn4+iFfj4XDPaqi2lcCMXUYvafRQQTBi299D/f4W8jx0
         vgiW/zAO5X9+jbUpbmKpcuOKB5PDcO0/nVMvi/nfs0qnAgYxtagxb9s7IteuPNzSqIq7
         Tg27VLL2Cugy6U4g8bPJNTuDjtLZJXur4y6GCEnmai/K08aRxvZqutn5xXEDcVf8y70M
         dIipa/LKpFQZfjBLqopLMKILvwl5YoIYgPjfCrOj7m2H85L8mmV3KolGxCQQ9wvC5D59
         WqJg==
X-Gm-Message-State: ANhLgQ0JIIoia4fIdhYQcIGs5feDUW5aoY0eqxIEtf3Pbvru2j7P0Ai+
        Gqfznyj/bSETknk1K8ffDA==
X-Google-Smtp-Source: ADFU+vshu1EjqoKlJxPqEOxyh0K4Uwd9Ih8PrChG30GxNXBknM6ohPNCu7bxWTCS66Oxoqm8ACMmRg==
X-Received: by 2002:a9d:77d7:: with SMTP id w23mr13695380otl.45.1583788073292;
        Mon, 09 Mar 2020 14:07:53 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l4sm2688904oti.65.2020.03.09.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 14:07:52 -0700 (PDT)
Received: (nullmailer pid 10666 invoked by uid 1000);
        Mon, 09 Mar 2020 21:07:51 -0000
Date:   Mon, 9 Mar 2020 16:07:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
Message-ID: <20200309210751.GA7716@bogus>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
 <20200227171425.GA4211@bogus>
 <b4e3fad9-414f-ce90-26b0-ba8498d21ade@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4e3fad9-414f-ce90-26b0-ba8498d21ade@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 04, 2020 at 10:54:56AM +0530, Sivaprakash Murugesan wrote:
> Hi Rob,
> 
> I ran make dt_binding_check and dtbs_check both on mainline(5.6-rc4) and
> linux-next both are successful.
> 
> The file qcom,gcc-ipq6018.h is merged in 5.6, not sure what is going wrong.
> 
> Could you please help?

Sorry, my fault there. The checks have to be warning free and that 
didn't happen til 5.6-rc5, so I was still based on 5.5.

Rob
