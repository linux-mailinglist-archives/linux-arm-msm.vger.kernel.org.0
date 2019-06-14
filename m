Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A376A46532
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 18:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfFNQ52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 12:57:28 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34175 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFNQ52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 12:57:28 -0400
Received: by mail-qt1-f193.google.com with SMTP id m29so3287566qtu.1;
        Fri, 14 Jun 2019 09:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kuAEv/PlG/wLUd5sE7CBGEhgBQkunbAzlunVIqZV/qs=;
        b=IhTXspyw4NA6GWCH0hQu+YoTfNm0PqsKuvlY4OrTBhlTPZSBjCxgkEvZCPNcF+a8Da
         VsAq92zV6hfPu26qYYTTmtpV8jo7KmgYUjSVFnyKMiy08ypirlOuK247ldsvu/VprX+W
         WdJ+/0XnfLmwElsdxw1jnuK5Cq/dA5z8hXdL8lwLgpcLguVXtOTUIvyZZjp1fuiPNeNR
         sDaDwdzwnQQ3ciDdwQnELNKvZlqm2KaWNSDFpQ3um8L8K2vgvp0Pm/ua1WerS9HiAxO3
         nWFogAsphkwH3tVDoE3rKU1wrj7mbc4AVa3t5h3+gCqwpEIE0bGiDw6hFBPBB3lu911S
         7K3Q==
X-Gm-Message-State: APjAAAU1+L97SrkKTlHziMLiZn5ju3zCn7AC4lgWehSPMVwMidch52Dj
        3ZLL/oHmdpFkIurH/0gZng==
X-Google-Smtp-Source: APXvYqxkCzR6nUY+HgvZWIHjhjgEC1kMxIXehNr9VUSu1DnVOQd08FOUe0jGEMuy2YJFBFjI6vNo/g==
X-Received: by 2002:a0c:8b54:: with SMTP id d20mr9239221qvc.1.1560531446638;
        Fri, 14 Jun 2019 09:57:26 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id f189sm1925498qkj.13.2019.06.14.09.57.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 09:57:26 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:57:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: apr: Don't use reg for domain id
Message-ID: <20190614165724.GA3083@bogus>
References: <20190523150153.13136-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523150153.13136-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 May 2019 08:01:53 -0700, Bjorn Andersson wrote:
> The reg property represents the address and size on the bus that a
> device lives, but for APR the parent is a rpmsg bus, which does not have
> numerical addresses. Simply defining #address/#size-cells to 1 and 0,
> respectively, to silence the compiler is not an appropriate solution.
> 
> Replace the use of "reg" with an APR specific property.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Fixed example to match change
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 6 +++---
>  drivers/soc/qcom/apr.c                                  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
