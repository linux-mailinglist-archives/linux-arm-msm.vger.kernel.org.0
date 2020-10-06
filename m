Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA85C28439B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 03:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgJFBDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 21:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgJFBDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 21:03:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203C1C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 18:02:59 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h4so241925pjk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 18:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2G+Z8kllqJJL/AhUSNRBOJcpZax3qo/ZffJzMmYjOPo=;
        b=SdchyiJCffQnIglAgrwknu1C+/bdldYoSfpzfGIjMwQ7BDoxfBQTUT6u9OIrlqFNdF
         w4q229PFjOsN1Vt0YQ2KsPRUWUABnTGYj/OSTpmaO/Fp51TKGGEePL1PI3ZA7TD0n4PU
         a2ixaf5sixVnwsqHfTEXRXyQ+VlMtjN880xOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2G+Z8kllqJJL/AhUSNRBOJcpZax3qo/ZffJzMmYjOPo=;
        b=T6jSs7CinjdCqPQImhm563dd0X7QUW/CEJHPCuQXPG9Mm0SqxsAjR4OTf/fRiqgy1X
         5oSJou1CKNtosjB3irIA0M4/STLUL2zXl18Jaj1t2HY04Rli7cNwK7Hlv4O0WuEakoWl
         ScEACsjCyqrXScDHsJnRsTzVVzAX9YTYQ4F89FdURY34YPH9pxXIoJCTuBMGQE8Ysar0
         kvLBBdSX+E9+Wv3sI/ISZeJANaEbDDuu1UEvm8sRfNb8mTEM0qqR6ACVSm+RKNdPj4uj
         5mJpuNfDtQSX2IkDUIIAlq+3OMOAW4hy/akUjufh9WbAWnrpX4IclQFO7mV9oobuA+Oj
         7IFA==
X-Gm-Message-State: AOAM532PxggUJfWKgXACKoAd84/5AtlzgavIvxXbV+GsGckIK/aRJrjl
        uFXDiFoal14idPdvnAzoAc8Txw==
X-Google-Smtp-Source: ABdhPJx7GUL+QG937au5fUtPMeL6ZwaV5/ro2uW8eUz7YPbB025dAOIMZXGHkTZUnNzx7ugidKf15A==
X-Received: by 2002:a17:90a:ae15:: with SMTP id t21mr1990280pjq.91.1601946178663;
        Mon, 05 Oct 2020 18:02:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o90sm817468pjo.36.2020.10.05.18.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 18:02:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7dacfcb3d8cb7e99e348f00ee15f917a@codeaurora.org>
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com> <cdd56444b0d7faf9358370f821a10846@codeaurora.org> <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org> <7dacfcb3d8cb7e99e348f00ee15f917a@codeaurora.org>
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Date:   Mon, 05 Oct 2020 18:02:56 -0700
Message-ID: <160194617664.310579.9927356526425343212@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-10-02 05:45:03)
> On 2020-10-02 16:57, Stanimir Varbanov wrote:
> > On 10/2/20 11:06 AM, Sai Prakash Ranjan wrote:
> >> On 2020-09-04 02:44, Robin Murphy wrote:
> >>> Since commit 9495b7e92f71 ("driver core: platform: Initialize=20
> >>> dma_parms
> >>> for platform devices"), struct platform_device already provides a
> >>> dma_parms structure, so we can save allocating another one.
> >>=20
> >=20
> > Do you have the mentioned above commit when you see this warning ?
>=20
> +Stephen reported this, this was recently backported to 5.4 kernel
> where playing youtube with dma api debug enabled would throw this
> warning and I am almost 100% certain this is the commit which caused
> the warning to appear again.
>=20

We don't have commit 9495b7e92f71 though so I guess we need that one
if we take this patch.
