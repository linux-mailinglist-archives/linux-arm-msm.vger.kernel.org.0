Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB86043F33A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhJ1W5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhJ1W5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:57:50 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A5DC061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:55:23 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id w10so8609159ilc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YIO8z6g5pnThmN6nY1IAWvuZN7+8+z/gyR0WIdP+6Nw=;
        b=hmXjgoKYJzjjMMBsX9LnJxl/pAFVPf56QIHmBYftUTr7StooYQW7HSDt+rjq9ozQzr
         70MTu3sgwn/pm/25Y62tLpZQqgbVWMArRKLBzlMXfYeuEBjp26SRu6Qv24ngPs/hn49F
         JYTj3L2leuBCEPLbPSB7xfi4CTSY3fnmRMwUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YIO8z6g5pnThmN6nY1IAWvuZN7+8+z/gyR0WIdP+6Nw=;
        b=cuD5kTExh0fb7Hi7MYpFhL1J+DDROWUDcFbm9IzERGeaAwUSjU1AvQGlHD7Qp6iHjK
         KcJS2LRaGUcN4ltAyY0MCZ7mtz+5sR44hijOrtCZrZ6FGLEcfcDHkW5SAu0DuMeIDNu2
         6hZyvHn3s/wsdhq4vLeg7PJqyNohqJlS9csL4cXoLV3Ne5ILWO33f+1jKZThSc2Zt0ju
         fSeAbNH+7XoKqjhGSHGODg5bIoXRckVe1dSndVFy6R3Zn1rXzFIdSxegCKJz6s48SJPd
         tIzsbXH5QSV/41ja67PmnDJ6XjOy9mRmWNrmHRCaEu1gx+STZnXkZBMSuS/VvBYKV/Op
         Vd1w==
X-Gm-Message-State: AOAM533l4pmTHCSVyea0i5EycdlOzEx0LT20dY0/t047u8chJ/eQV5GD
        l9kiQa3CEYInRtVN+R6JOq5z+1/3n3DFEw==
X-Google-Smtp-Source: ABdhPJw4ENdl1a2X5Wx/y/ZIzD53jgd6mY4fQeq8dbqRbhgpZH5gkTwivYLKBfKDe2oWgfOjG+IebA==
X-Received: by 2002:a05:6e02:148b:: with SMTP id n11mr5066092ilk.230.1635461722507;
        Thu, 28 Oct 2021 15:55:22 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id i1sm2339857iov.10.2021.10.28.15.55.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 15:55:21 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id l7so8652232iln.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:55:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c21:: with SMTP id m1mr4940355ilh.165.1635461721219;
 Thu, 28 Oct 2021 15:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
 <20211028151022.2.Ib9070172c8173d8e44c10352f68f2f507a151782@changeid>
In-Reply-To: <20211028151022.2.Ib9070172c8173d8e44c10352f68f2f507a151782@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Oct 2021 15:55:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK0KABr5NchZgrjSFa+7G7Ez_JPcgCVnsN0K1q++O-AA@mail.gmail.com>
Message-ID: <CAD=FV=UK0KABr5NchZgrjSFa+7G7Ez_JPcgCVnsN0K1q++O-AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Support Homestar rev4
To:     Philip Chen <philipchen@chromium.org>
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

Hi,

On Thu, Oct 28, 2021 at 3:11 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Support Homestar rev4 board where Parade ps8640 is added as the
> second source edp bridge.

Similar suggestion about mentioning why the include of "sc7180.dtsi"
moved around, but otherwise looks good.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
