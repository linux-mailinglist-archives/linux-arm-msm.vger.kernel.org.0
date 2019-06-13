Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C8C449FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 19:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfFMR5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 13:57:00 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35216 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFMR5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 13:57:00 -0400
Received: by mail-qt1-f195.google.com with SMTP id d23so23600741qto.2;
        Thu, 13 Jun 2019 10:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yIbFZhqWp4VvUdb5YMW6F3G68rcscnXDxiUaVCPUjcY=;
        b=n4hGPBAa5qkZ5FQ4tBfvmxJuSlqdwXWBTZF5vjw0Lb8SzUR/Gn/cYyons9xeVCrExM
         sGXXuV1/oUha/PVqDfBnWAIDVceiRWT3dnuzA6PxUCRi19YWIUU7qS76AaI1wMiH0Xz4
         z8hXewqOjS2xzlOxW+0YtB7EWbL06aLAvi/ZhtPXWB6Cwfgb/2SzEyh3Qjy1kzvNLrpF
         eWNECzR7YFtEed89AjDiRKJYRYI9OcuFwST6P4aRJM4hUhGBHTEzdkeaZI+PfybWVJ56
         /H66xf9HGYYxlalMuF1F8KHrPWb/xChZC8enTGUqbbeW//ZeF2feSRUB9+pED//65M5I
         EfKA==
X-Gm-Message-State: APjAAAXWwVHIiZw3CYt6D76qb86+S/o7ixDt9NFQprzTyXHE2O+Z9N5N
        h3SMy/JHl3bWEwnmfpt4aA==
X-Google-Smtp-Source: APXvYqy8BdUexEXBNkk/aBNzoTj1hmYlo9Pn7u6ueypiXsiR+qsvuB8ysYW+UHV0ykEpRo3Wdy1qUQ==
X-Received: by 2002:a0c:fde3:: with SMTP id m3mr4638216qvu.205.1560448618362;
        Thu, 13 Jun 2019 10:56:58 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id n10sm131242qke.72.2019.06.13.10.56.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 10:56:57 -0700 (PDT)
Date:   Thu, 13 Jun 2019 11:56:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Message-ID: <20190613175655.GA13079@bogus>
References: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
 <1560366648-5886-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560366648-5886-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jun 2019 13:10:48 -0600, Jeffrey Hugo wrote:
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
