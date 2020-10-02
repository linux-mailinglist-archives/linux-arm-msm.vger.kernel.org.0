Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09371281DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 23:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgJBVqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 17:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgJBVqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 17:46:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32B8C0613E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 14:46:01 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o25so1701860pgm.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 14:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FCCI7a1Hx5plWli+fqb0y60ghvpUMhQaFbafJt11w5A=;
        b=Q0bSA1YsffZPuTfUlxWGGVnq7Y/DWX6Rzio6KfwSmNQ3xIrP3HcSPxdOYPBbB43dr9
         GvV6ssM7LaR6kMqlD0lDdQWvXcSyyEkPslbJWrYqKa9AuMwaCb68dfOnlwiy+bBTnTHs
         ntBGrL07KTYOBibCMlXSJy1WkGjZFrg7x0hTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FCCI7a1Hx5plWli+fqb0y60ghvpUMhQaFbafJt11w5A=;
        b=oQpKxQ7kSdMMPFh/HqKHOXtdfLSO0vhUbBLIWmRaAtAFFXWhiQPPOWktIqd0PXU1fv
         rfxP8l8lrlWaR9P0W6D1y54uGXBoNt03zSbi7U0hYb2q0CoMDvu+Yo8Vbds582LxfkD7
         HudGGd/J+LPoFb0HKlJeFn9tX0avqxZItkxj+3LN+YpHtQK7PpJdO4HDWmJ4HamtwdF5
         oYhjGInu+P95/BwjrgOkGYeq+cKpC6V657PRIFVW+U/eZ230hs5OtaJs1RjIfx1GB65l
         FLgSNugPIXMPeeSimZPwG+blywr9JG6T6n8JeTGhez0017pcW/cvMCQQnAGytxK4Yr9K
         xqhA==
X-Gm-Message-State: AOAM533FsbMKVMxUekSnNTxTw3Vnbr92vfW+IIUnXnRdRKd0ZWZdKReS
        5l3R8RYOjpfmUIbUjArFwx9I8g==
X-Google-Smtp-Source: ABdhPJyE6MdNJzMEQZG+mxpSNhpnLH2ZKlF2kT2OnVXVTMI7yIsURIph1nliHrA3Oi4P0udXBGQMyw==
X-Received: by 2002:a05:6a00:1506:b029:142:2501:3971 with SMTP id q6-20020a056a001506b029014225013971mr4727209pfu.54.1601675161346;
        Fri, 02 Oct 2020 14:46:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w19sm3037317pfn.174.2020.10.02.14.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 14:46:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b638e342aae1f6866cad33ff408f2894@codeaurora.org>
References: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org> <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com> <b638e342aae1f6866cad33ff408f2894@codeaurora.org>
Subject: Re: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
To:     kgunda@codeaurora.org
Date:   Fri, 02 Oct 2020 14:45:58 -0700
Message-ID: <160167515893.310579.11853207494346374403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kgunda@codeaurora.org (2020-02-06 21:57:49)
> On 2020-02-07 00:36, Stephen Boyd wrote:
> > Quoting Kiran Gunda (2020-02-06 05:55:26)
> >> Convert the bindings from .txt to .yaml format.
> >>=20
> >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> >> ---
> >=20
> > Did something change? Is there a cover letter?
> >=20
> Other than converting the bindings to .yaml not much changed from the=20
> previous post.
> I will log the per patch changes in next post.

What happened to this series? It never got resent.
