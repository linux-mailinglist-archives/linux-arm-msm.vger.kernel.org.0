Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1131F3E89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 16:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgFIOpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 10:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730512AbgFIOpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 10:45:38 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0BFC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 07:45:37 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t25so18969677oij.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9qjLlhlbq20TF9w4Fo/M8ySKfJ7eojkDP5aGVWyOb9E=;
        b=z+8b5Aw4ReeJD8+ObpGHGXPUhGsTR0gr5SV7FLXc+P6XyTivIvbKYbXn2iGa4306Xy
         xFY5A1sUjgYUM2qSuzyb6/WrbfEeLEIjrD3WFyGO56S6WTB0CYRWbUfgIPqzPtlV1Dz+
         6K0+QjFjDhw/1pCCXZpNi42Y7G8cTigM9qpKj2Yp2zkqnbsEN9RGtlB5EP/3KK20AnSb
         XjZwLcohX2VShXTqRdmqw2AG1mzi1Cfk64FCIP+NRSIspVtr4HWH1ecomZCgqvr8Mu03
         k2P6oYmAHZ7LwqTUF4Rrow3mFI6CffGN4KUzwiq5pmXZQtKlJllUtaSWEkFBspsb3PD2
         XYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9qjLlhlbq20TF9w4Fo/M8ySKfJ7eojkDP5aGVWyOb9E=;
        b=huLQ8GY6vYg/k4oORKIPuM3EYiS+zPGnyX/CfQNBRSw56Y1ZO1bdQ0TgcFLiLDC3GK
         99ieJKRjraV0HqDGO17FBojpX9SqTJw1FTLDwGrYWpE6jlVc6N9LwWz/KiGWYXt3xvg3
         ybxxs6PN4eH7F1TcfFXp2aYSrSKFWxiO5IRuHWJzHsqZxQnCfWaDPMDZG6MK1omE+qJL
         S83Vxp512as1guZT+zaPEVAHHbvl9OQ4W5lNnDxq854q8y8dnndLtoV7kt60SWyfQiWj
         jSNOqD9DfPsHrMmhR4qTbAAPDLGxh5sIJB0mVQ0lFqvmn7xee2s59U/vS9cVJAhoNj9S
         gNHg==
X-Gm-Message-State: AOAM530Hxc6vPXd9couWrpKXHhsBGt8ySs46BeakFp5F264mGpL4nkq/
        WEH9VUDMtbJaDZXQhEDh3geZepzmjPXaPryJ1RcX+w==
X-Google-Smtp-Source: ABdhPJzQvo0oNgTTh3O9V6qB7+EiOf+sDca48St6UCVl/1HYUyiYmK4ibHrd6RbILNWCIvob0QRF+qZoblwM9pe02js=
X-Received: by 2002:aca:a8c3:: with SMTP id r186mr3699932oie.173.1591713936880;
 Tue, 09 Jun 2020 07:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr> <20200504073914.GQ1375924@vkoul-mobl>
 <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
In-Reply-To: <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 9 Jun 2020 16:45:25 +0200
Message-ID: <CA+HBbNFsZ-v_2cMhDNGnQXTFaqsjGzB+1rAS3=_CLQhd0N4OKQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI,
Vinod can you maybe pick this?

It would be great to have nodes in 5.8 along the driver

Thank
Robert

On Fri, May 29, 2020 at 11:36 AM Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Mon, May 4, 2020 at 9:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 03-05-20, 22:18, Robert Marko wrote:
> > > From: John Crispin <john@phrozen.org>
> > >
> > > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> >
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> >
> > Bjorn, I have picked the phy and dt binding, feel free to apply this one
> >
> > Thanks
> > --
> > ~Vinod
>
> Any chance of this landing into 5.7?
> Driver and bindings have been merged, but I don't see DT nodes queued.
>
> Regards,
> Robert
