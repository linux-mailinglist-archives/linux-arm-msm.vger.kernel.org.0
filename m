Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE5844F8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfFMWvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:51:17 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40045 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFMWvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:51:16 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so349092qtn.7;
        Thu, 13 Jun 2019 15:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cv40RcWOMVy1JZtFpd3gJTvQihsNZLPm+qc6d4re47Q=;
        b=M2lOgqiWtCviKLghJXWvHZ5liLTVVea03ffggYN8yipes+R5cf00bYA//BhTKxGOaY
         DPgl1CtZ5ydcUz0IaIOtusTfRraVM7VNBI8Q4yk2MOhUgy3CGIL5acCtCIDweMH1k3P4
         b/hU951sC0wrhYebApSRXrol575ioNJhRO0PDHdvi+n05jhpONxg3EWjW+kiUiIqPy2b
         SQVz5TJ50w0+CDvlJTrrT/Gh2gKw9lU2d64umNxDp/cA7LSYsaSOcdvTK5sOMeIIVIdW
         AGHPfkIDnhzOCOIT0h0jvybU0duCGypcC6iQCx3H0reddt4aQ/8oWEEpx57rQsuDbN/5
         4k6Q==
X-Gm-Message-State: APjAAAUTU+BtppkaA1Jbl+kg4a8faCbPMBPaEM001x2PAcyzCGqfRwH4
        rnJ2VvSnW8d1qp4/Ppa2EyaPBEE=
X-Google-Smtp-Source: APXvYqzyrbusjb6nMpbIGijvU32NhrU/T6DUb/Ee8K0MWe1C4b1O2CixCC2mnFnW35EKNJT+hN11+g==
X-Received: by 2002:a0c:aecd:: with SMTP id n13mr5670753qvd.182.1560466275579;
        Thu, 13 Jun 2019 15:51:15 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id p23sm402566qkm.55.2019.06.13.15.51.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:51:15 -0700 (PDT)
Date:   Thu, 13 Jun 2019 16:51:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC/PATCH 1/5] reserved_mem: Add a devm_memremap_reserved_mem()
 API
Message-ID: <20190613225114.GA16158@bogus>
References: <20190517164746.110786-1-swboyd@chromium.org>
 <20190517164746.110786-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-2-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 May 2019 09:47:42 -0700, Stephen Boyd wrote:
> We have a few drivers that need to get a reserved memory region, request
> the region, and map the reserved memory with memremap(). Add an API to
> do this all in one function call.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h |  6 +++++
>  2 files changed, 51 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
