Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB7B273F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 12:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgIVKRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 06:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgIVKRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 06:17:35 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A43C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 03:17:35 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o8so15104267otl.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C4wv3gq4jH4kXiqr9HoaHT5g3RKprwq2Zsckomw6Mug=;
        b=xAunoLiwJSD85u4GcMCZTb0HaWVBYP1IeHYBuva/rKcEz3d3wWA/5kTAsufc1NslLJ
         o7v06wwMgFZU9BgjZwgixvTaDaw9cX9CyfyGqAMEYtKoPek2D/naJuGpywMav20paRna
         fXavgDKykj++zR90Bp6tRmje1Iv/FELpQnO1VX5w+ePKHG/Qi6UDt7hUoVDgiOXpNlWo
         DAdiDPtHMRRefQQCEfG3iUyJBYzQ9+tDT2CwXKj8sSAVujd+T420gzKE/JaLa6z6Clf4
         tMl4MEImzwiBK9+P9oR+lZtfn8OH8oqsRAjTMqJ64nU1O26++/5dVg8BP2M7dHnevOXF
         Xcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C4wv3gq4jH4kXiqr9HoaHT5g3RKprwq2Zsckomw6Mug=;
        b=dmmXsdWCJMPkpKBEK1rrRl6FRNRjmZb4EnahATYRxSjWFcxNQBFRCvSAVQoVxDU+9k
         wEYaT1aeyoMNL+AdRN5J9vBaWNATHqu4IdBRtjfEHJg0HXUV2mWo3sg0S647xeljA0J1
         hDgMTU7u6/W70TkCT3HFCmeJl68JDAU9QMjW50+QZu8i0PmyOt/gKjdpJ1+34CyYgZe8
         3qwhpLUP9SzZXOS9FwC7X8689SnNC/GWEAEHYgI/z6vYqVD1n8Mmjb6kRy2qbqaAGh/c
         nhtnawapmELRUysvWx3WlzOKLFkGPAJm8qc64ZUC/h3O4zaplbG7AixDLRooON8Djq9y
         spVQ==
X-Gm-Message-State: AOAM532YNY/3YtBcYAMOkVK55MYhxWSG1kjuRls9s+8W6GlrneiQNRJe
        Jky8+4DYAnQFAt5xzOgIQrsYATecPyGCQKIMMZLs3w==
X-Google-Smtp-Source: ABdhPJxbwFx7g1eBM13nl+6wdUDexN4d6NL/JJklai3ilHkBZyhnBiqx8SgS8+AYox+Ug4Xo6oK5X3hqXwdsPr3reDM=
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr2347123otj.66.1600769854529;
 Tue, 22 Sep 2020 03:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200920141653.357493-1-robert.marko@sartura.hr> <20200921.144841.1356454980970038338.davem@davemloft.net>
In-Reply-To: <20200921.144841.1356454980970038338.davem@davemloft.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 22 Sep 2020 12:17:23 +0200
Message-ID: <CA+HBbNFdPkkL-gtAsTFww7bWjLADbXQuEfaTa-YGT6cbzN3btw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] net: mdio-ipq4019: add Clause 45 support
To:     David Miller <davem@davemloft.net>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 11:48 PM David Miller <davem@davemloft.net> wrote:
>
> From: Robert Marko <robert.marko@sartura.hr>
> Date: Sun, 20 Sep 2020 16:16:51 +0200
>
> > This patch series adds support for Clause 45 to the driver.
> >
> > While at it also change some defines to upper case to match rest of the driver.
> >
> > Changes since v1:
> > * Drop clock patches, these need further investigation and
> > no user for non default configuration has been found
>
> Please respin, in the net-next tree the MDIO drivers have been moved
> into their own directory.

Done,
I completely missed the commit moving them to MDIO subdirectory.

Regards
Robert
