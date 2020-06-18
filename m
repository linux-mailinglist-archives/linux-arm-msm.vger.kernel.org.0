Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABD81FFDED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 00:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbgFRWYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 18:24:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgFRWX7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 18:23:59 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02A9E20732;
        Thu, 18 Jun 2020 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592519039;
        bh=suc9pm53OLkf5+tDTVTkktvXVOKJj7lJ6p6vf0fAzPU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YoqsdiIMkAkW5I7KL3asxk7dZW8YFot/9qO7uTYjFzZYlNMbb11jjIgzofi+vfWSN
         QCx0PuMoe8ViFXtMUz04+1oUI/FDzn8h+pd4DmLqh3inuLt+lAscX5c2Uzz64ieJPr
         iELIJNlCKYeczmr4JEPtg6Hoq04HkahOuC/b010Q=
Received: by mail-oi1-f181.google.com with SMTP id 25so6580396oiy.13;
        Thu, 18 Jun 2020 15:23:58 -0700 (PDT)
X-Gm-Message-State: AOAM531skErlZ5b0asHZpQCIcxg4oztRK8kWvoMIkcLu2Px+DrS7OeZD
        236rAXW37F9Q09CGsM4gTTc6+GjLszNJ5E0RTA==
X-Google-Smtp-Source: ABdhPJw1K2OvzxLmNVbzVFc6bTX+uL3GtdpnvRebeJA5Th13K0T4h+C+0pOQ+rfRUWnRUcvWCYUGc3DRbledxdgoUFs=
X-Received: by 2002:aca:d454:: with SMTP id l81mr939987oig.152.1592519038311;
 Thu, 18 Jun 2020 15:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200617180209.5636-1-wcheng@codeaurora.org> <20200617180209.5636-3-wcheng@codeaurora.org>
 <CAL_Jsq+fhXWGJvYxUDygd6hKs3dc8GKxKCz_Q+_C1AjK0J0N+w@mail.gmail.com> <fb448691-2bda-ada6-799f-ee389e647710@codeaurora.org>
In-Reply-To: <fb448691-2bda-ada6-799f-ee389e647710@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 18 Jun 2020 16:23:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGWY_bBUzr6r0czxH32vvDnsR6=MzS=zH4tJ-5PEobZw@mail.gmail.com>
Message-ID: <CAL_JsqLGWY_bBUzr6r0czxH32vvDnsR6=MzS=zH4tJ-5PEobZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Jun Li <lijun.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 18, 2020 at 2:09 PM Wesley Cheng <wcheng@codeaurora.org> wrote:
>
>
> On 6/18/2020 11:33 AM, Rob Herring wrote:
> > On Wed, Jun 17, 2020 at 12:02 PM Wesley Cheng <wcheng@codeaurora.org> wrote:
> >
> > You are duplicating everything in usb-connector.yaml. You should have
> > a $ref to it.
> >
>
> Hi Rob,
>
> Sure, I will add a reference to that doc.
>
> >
> > This is wrong. The connector binding says port 0 is the connection the
> > USB HS controller.
> >
> > What's a type C mux node? Is there a binding for that? There's an
> > ongoing discussion with the CrOS folks on how to describe Alt mode
> > mux/switches.
>
> I reviewed the connector binding previously, and couldn't seem to come
> up with a model which fit a design where the type C controller (ie the
> entity which does the CC orientation and role detection) does not have
> the SS lane mux included.  The SS lane mux is the HW which handles the
> selection of the SS lanes to utilize based on cable orientation.

The intent was the controller would be the parent node of the connector.

How the SS lane mux is represented is what needs to be figured out. I
don't know what that looks like, but it needs to be something that
works for multiple designs. Ideally, that's an extension of the
existing 'usb-c-connector' binding, but if there's good reasons to
redesign it that can happen.

Rob
