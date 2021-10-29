Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD8843F40A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 02:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhJ2Aok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 20:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbhJ2Aoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 20:44:39 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E76C061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:42:12 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id d10so9023164ybe.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pb+iwuiJ8p/4MIMVnIOyQbjDhcWFiizWoltni+EWZmI=;
        b=ZBJrpw6UbIRQuOY2Y8gUJZIlZtVkMHenS1p7jpUc9LBXjUjDnGV94wYKC6w2m5GuW0
         /lacn6LcB1nXlSd+HZobc4M+T+Zh0OUjj9nJxBJKHEhf/2etIlDq4kcXGKWpCuRjpndf
         QkgRA8ooZlRgCudzMPNhHBsTtirhjwZDOtlyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb+iwuiJ8p/4MIMVnIOyQbjDhcWFiizWoltni+EWZmI=;
        b=360/lI+kN3aRvk3DU23kyXwIG8pn+gbnp+mtw0GFSotPYMdrhd9PNd86M6ASMpHyLu
         hT61Xmjgtbf3KqVHsjwV0lHv5Z7fTaMKRVs3Rm9OyWA2fMQB+Q9PNIRSpzdZnkiWkAo8
         Xj4n/FfQg15t8mTHXgL5yMkVP8epdeAGvxtdj6x8gXuM67jdtPCoRDjEaMftWYgCo+fI
         xdf8oSiR0oLb9QKlTio5JCyveKkQmbIHKPty8dRgeMmhdhYwK379+ugSZEMUCWPks3MU
         TjZypPOulH9xkldvgw9vIFUk+y584urzChlE09jCQRO3f/tgkKrVMBO/1vXWNEaVdYu1
         EtZw==
X-Gm-Message-State: AOAM531/VFbSX4CeZc5nDFun6BKSqYa2OhUd7BLFB1DvCNMYmPwZm1WT
        gYjBHf/o2OvUWSbx4+itwXIA9PQKuOaiKDmTxaShJw==
X-Google-Smtp-Source: ABdhPJwOuNGQu8+3XrKEjWdE1HBVStgkNtYlbLjd708bFv3LC9VpaMwoGHcvAUiEjfxZRiz81b6ggRubWZkXPsS3e4M=
X-Received: by 2002:a25:a567:: with SMTP id h94mr8504221ybi.532.1635468131444;
 Thu, 28 Oct 2021 17:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
 <20211028151022.2.Ib9070172c8173d8e44c10352f68f2f507a151782@changeid> <CAD=FV=UK0KABr5NchZgrjSFa+7G7Ez_JPcgCVnsN0K1q++O-AA@mail.gmail.com>
In-Reply-To: <CAD=FV=UK0KABr5NchZgrjSFa+7G7Ez_JPcgCVnsN0K1q++O-AA@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Thu, 28 Oct 2021 17:42:00 -0700
Message-ID: <CA+cxXhmV6dvk-980_kNSrAijX6Qbdn9gd7eshRQeWbgbJD7Lcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Support Homestar rev4
To:     Doug Anderson <dianders@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Thu, Oct 28, 2021 at 3:55 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Oct 28, 2021 at 3:11 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Support Homestar rev4 board where Parade ps8640 is added as the
> > second source edp bridge.
>
> Similar suggestion about mentioning why the include of "sc7180.dtsi"
> moved around, but otherwise looks good.

Thanks! I updated the commit message in v2.

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
