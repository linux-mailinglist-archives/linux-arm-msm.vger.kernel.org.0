Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED7B9F2AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 20:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbfH0SvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 14:51:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39925 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730423AbfH0SvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 14:51:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id 16so68716oiq.6;
        Tue, 27 Aug 2019 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AF/vPj882HI7YsynVJ+eUKtXTDth7gEC3eMKqWT4ttU=;
        b=X+xahYshHV/ansaf4x+dDez9PqKNAatS8zbmZofNYhbM3w68AN0nnKOzJ0qbJ/UOqN
         p/VEgBZxKYH0FR007bX4FEhN6AwVBL+JtGiA/bRWDLFsP1yEPTrn0OVsAw6Ts57KqefX
         HyVMrlxpxi5RE/23JYd2RCrSTUlFUfC2kryeEFo0bikpDqzLf81LwUfFThXfXsQFFvcX
         LOlVjcBqKDCNZtFpdNCt1HuyqmJY3PYERVXkpZxCGaL9UZtQGNescp/OFogi1IeXhYfC
         MolV0uGjAaoI+wXBcr99LNZR5v+nClJFOzPuKbDjy1ugx3XAnx4oSwxUdiejdvRkt+H+
         oUvA==
X-Gm-Message-State: APjAAAXZhwa8l+z3wTPSGSRYqLE89WH1TarsNn0Mshn1yRS2yERF4U1k
        wnW7MOkPnapkXDgTcPkNfw==
X-Google-Smtp-Source: APXvYqynGxcwWIqR2yCtDIquBPLt29G37dmdQJBwClIM6/HTbta6GJm5kdG06YLi3Q1jlob8CgoyDA==
X-Received: by 2002:aca:cc81:: with SMTP id c123mr150734oig.30.1566931872553;
        Tue, 27 Aug 2019 11:51:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p11sm63392oto.4.2019.08.27.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 11:51:12 -0700 (PDT)
Date:   Tue, 27 Aug 2019 13:51:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: Document SM8150 rpmh-clock
 compatible
Message-ID: <20190827185111.GA18812@bogus>
References: <20190826173120.2971-1-vkoul@kernel.org>
 <20190826173120.2971-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826173120.2971-4-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Aug 2019 23:01:19 +0530, Vinod Koul wrote:
> Document the SM8150 rpmh-clock compatible for rpmh clock controller
> found on SM8150 platforms.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
