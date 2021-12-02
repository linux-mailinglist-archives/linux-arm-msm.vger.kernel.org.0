Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C999465C93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 04:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355115AbhLBDRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 22:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344910AbhLBDRg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 22:17:36 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36072C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 19:14:14 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so16672138otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 19:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7zMm+ptgEod5hAh48HomYw91wMu1T2UC4rpVEv2rrNk=;
        b=Fw9jEitGYHZ9MdVeYlI7Aw/5NfBFSuzytOiWxt+oI9kBlt0VQ9Kgm2n3b4uPoaQSu+
         Gw0m4dgPYleREY1uZzEV+BXdeS8bCLkQEi8xXlwE910aZUygXAkModXGNRwX6uUM4IAn
         27K3Y8syLoF+GEFlrooZ1AtMgL3UwKZp/547A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7zMm+ptgEod5hAh48HomYw91wMu1T2UC4rpVEv2rrNk=;
        b=AbZFfe6rhhuZxDa4lqKQXGIi4ytrr5VIMO79LyHK40wDQ8ZAiDCUM4dUcF36bc4epl
         tj9Fo9o6Zth8k8AsJPe6N0cyR5zUhCeDhC2w0Teilpt6tPTpSLzzlIPFeDuEuOwx3YY5
         DmSC1ELZJKE4L4CUFTyxKbkzzr+pAKG8b+DF77PQyyUXW5GQ2cPZRXdD/vWJ38Mlhgt6
         nHA65VP0wiDRbSVXqVPOiBCbTxlimDsdEINxWmPjUae5KPES4EQtLLMTEUFQz3ymX5Fr
         ou/f8GCi+aOuCn4vY5DAIjNsedzxOdgLT2n8BryQR5Bd7iLr9VujY5x/mgKMsPTqf2P/
         ptWQ==
X-Gm-Message-State: AOAM532vfFgU45uNwoa81q9hIFe2PjdAQId4AcIXKzCJdtaaKG9W/o51
        ASB08fGdGOF0mzmE17K2R+cjuOvFMAw9eSTUSMMh1A==
X-Google-Smtp-Source: ABdhPJz+Dcs8ynFTWKf1YXOMxFfgLJHA+m/s0+m0sTbhrQdtaOenwne657YJ62yojRD9wISiFcrDjFCP9Dr2Ki7lZWU=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr9488353otj.77.1638414853549;
 Wed, 01 Dec 2021 19:14:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Dec 2021 19:14:13 -0800
MIME-Version: 1.0
In-Reply-To: <1638339338-6731-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1638339338-6731-1-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 1 Dec 2021 19:14:13 -0800
Message-ID: <CAE-0n535-3-dwaJBpfoRhyq_7GiheX3N+CDJM8f84=KAGAmj5g@mail.gmail.com>
Subject: Re: [PATCH v3] Skip phy initialization for DWC3 USB Controllers
To:     Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-11-30 22:15:37)
> Set XHCI_SKIP_PHY_INIT quirk to avoid phy initialization twice.
> Runtime suspend of phy drivers was failing from DWC3 driver as
> runtime usage value is 2 because the phy is initialized from
> DWC3 core and HCD core.
> DWC3 manages phy in their core drivers.
> Set this quirk to avoid phy initialization in HCD core.

Don't think we need a cover letter for a single patch.

>
> v3:
> Dropped the dt property and binding.
> Checking for dwc3 compatible in xhci to set the quirk XHCI_SKIP_PHY_INIT.
>
> v2:
> Updated the commit descriptions.
> Changed subject prefix from dwc to dwc3.
> Increased props array size.
