Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55874349422
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 15:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhCYOd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 10:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhCYOcz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 10:32:55 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3220C06175F;
        Thu, 25 Mar 2021 07:32:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bt4so1112347pjb.5;
        Thu, 25 Mar 2021 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iu6akMggrk3ZrAZb1WHGakoQg8dYDOL7KwYgoXD8LKo=;
        b=Eq3eckxCzX63Xj8wsmhtYZPgshqe6ldPE7VXJSPCbIzd/86jZL77W6Y7Wym2MHBhks
         MvCzM/eROhGsEKpUYZIV0thiUkqnaBEy/AWgzdQHbqf9swW2QDjrzkMWLlJoFKMsMrgo
         ScNl3B5wP94Al5oCgb0bGNe+e+i5uk4cXbtXq3FmVGWYOGg5U9s2nrROl6ZS/QVOOs81
         8smHnFvodbzoqLNqa5ptdAGzaIKEAZ4FP+RFdI81jyPKJL/t5kuuqlg+47HxDXP3E3nM
         cZ1EGQFdpB4C0ldYgyLoPdc+G66XTeolaW7FLoFudxttyoG9k1XzSEI1YtoEOKj9L9aA
         0KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iu6akMggrk3ZrAZb1WHGakoQg8dYDOL7KwYgoXD8LKo=;
        b=K2bXI8ZIf47JXvXHUy+Rz0kn8nvOwoPIi+igc6IRueoz1CiJzyJKvTF81U8oNCpav2
         ay2Kbv30opybAbSmVq4j5+UuOMVfJRLRmH032l0rKsOSOodsR1v0kkGgthfjlSnl30Fa
         ADye5hCuHlPLmdrd5TDdAPdmh9bpuLjlDE1plezLrM8jwMQ8t6FDOwkfzEr5RCVjzEHQ
         78+x5KD5FzUPz+qyusJGpnK1j7lF4h17ZEq23EGPJZb4A2fIdD4Yc1FEeZOGU4ChjmHZ
         CLRq2ru2sC4l26RpJV9w1zfmbQWyxR07y8ZJtzdOeceugtQcNnhBwLV5DTZqxSxLQxbs
         IC1g==
X-Gm-Message-State: AOAM5319pHHqzyFNdQdXRlC84HffXCsYotRKIvdpLlKLGey8F1yaTqYC
        r+z2Kz8gNt0kbA+DmW1g9iEHEH4nr8DpRFPhPoAqUQS0
X-Google-Smtp-Source: ABdhPJwvBTtoH2he9ApBpc1P2liiGLxNtdlbUqSJXqpU+JgyXAlzDZhIsECbsSFS0L+w60TTuxLAK+ci3HZNO7DVFvc=
X-Received: by 2002:a17:90a:bd09:: with SMTP id y9mr8969707pjr.179.1616682774540;
 Thu, 25 Mar 2021 07:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210312051203.3555751-1-vkoul@kernel.org> <YEukrpG06PBdgGAF@builder.lan>
 <YFwo2FrCMYJ4AhCs@vkoul-mobl.Dlink>
In-Reply-To: <YFwo2FrCMYJ4AhCs@vkoul-mobl.Dlink>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Thu, 25 Mar 2021 09:32:43 -0500
Message-ID: <CABb+yY39yq9=JCYJR8EnMqzYX5wpAWX5nd2Yu0uoCXDcA8jDbg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Add compatible for SM8350 IPCC
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 1:08 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 12-03-21, 11:28, Bjorn Andersson wrote:
> > On Thu 11 Mar 23:12 CST 2021, Vinod Koul wrote:
> >
> > Adding Jassi as recipient. Please let Vinod know if you want him to
> > resend this patch to you. (I send a patch for MAINTAINERS yesterday)
>
> Jassi, should I resend or you can pick from lore?
>
I will pick.

thanks
