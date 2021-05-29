Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DD8394D48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 18:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhE2Q6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 12:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhE2Q6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 12:58:32 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0517DC06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 09:56:55 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x15so7617305oic.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TL0ghQ1jZ+N25vYlmYekoNjeMxLsqHrEHrhvpAS6snw=;
        b=KXZZCELtFwWl6XGoyfC+ZeTm3fiDpenSHNmZaztj6D3ViGsej2Th2qt2AVUTvVBp54
         Ct37WBHhyS2A8XAINn+BsWlHeU1JTRxO1IQRRi7Sh7Sqj2BBZK2Vb3Oy5xMAYWDUDnE9
         RHd0BIIU8MLAN61JPqjftwdXVxAqWeV1N1scc1LaIIhGJSH6hzEqYk2uI3dM1HiKH5TG
         7EAWd4ffSXvgOTC+DLd4+HTQmo8ckx/yYvmEPsRw3uGzDcNiH0R0B+eQWHkAVQOiASGg
         EWCwpWPjSOe09kw28OaoOqVECR0+Gtd6vcjIZeuPabuv0+0EI09p7jjO+erkgd3QiVcj
         9Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TL0ghQ1jZ+N25vYlmYekoNjeMxLsqHrEHrhvpAS6snw=;
        b=SK0mcU4WVDmELmw2QpLAcRNlDp122JbYVugIunY2tV0Upm+Wz9zPo8xRxJjD7EREWo
         R76ztTf47WBJLmnrYg8ayVwTJHyJVex+hJa1uMCfCQorXaUX8/5OObHpl5OlgTgSzVVU
         8PyO+HLZ3WT2TQ0gbg4qdX1xArcxaiNUUF9FfDUOd+hYwYn5mVkjXpv1SpcqXi7C+ghC
         YyMvgpqn8HAv8vwJB3ztqP4QYLQtisM4St1yhO7KSLaBOjMvytnH/Wgx+4s5/Ek2IMS3
         9sFytXkSj3mdmQ6iuectB3gs3jqQisslliPmzw4qqJBVmUi0hdPW7HIR6cVm21RqNQPQ
         HJuQ==
X-Gm-Message-State: AOAM531+15JiJ2WswCkkRLVARDQCc/v1KfIizabxaFenNh58IaH/HtXF
        95rAD6r/0mBbtWhyDOSEQcUqVA==
X-Google-Smtp-Source: ABdhPJyX+xJFTpUIinSrUq1BYHRBRG2ZRVqFbvDfDmIiDhDVJfbLXZRH2vFsQny3hDGFYrdYpZfNfg==
X-Received: by 2002:aca:ebc9:: with SMTP id j192mr2811773oih.112.1622307415024;
        Sat, 29 May 2021 09:56:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e26sm1740963oig.9.2021.05.29.09.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:56:54 -0700 (PDT)
Date:   Sat, 29 May 2021 11:56:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
Message-ID: <YLJyVEOhd+r2p+Qm@builder.lan>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga>
 <87wns5g0c6.fsf@kernel.org>
 <YK00sn1fvCrtVQaJ@builder.lan>
 <874kenb2p7.fsf@kernel.org>
 <87v9739ibk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9739ibk.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 28 May 07:03 CDT 2021, Felipe Balbi wrote:

> Felipe Balbi <balbi@kernel.org> writes:
> 
> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >
> >> On Tue 11 May 03:07 CDT 2021, Felipe Balbi wrote:
> >>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >>> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> >> [..]
> >>> >> +&remoteproc_adsp {
> >>> >> +	status = "okay";
> >>> >> +	firmware-name = "qcom/sm8150/adsp.mdt";
> >>> >
> >>> > For platforms where we have a Dragonboard or similar we push the
> >>> > test-signed firmware to qcom/<platform>/. I presume that the Duo
> >>> > wouldn't run on the test-signed firmware.
> >>> >
> >>> > So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
> >>> > the start.
> >>> 
> >>> ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?
> >>> 
> >>
> >> Sounds good to me.
> >>
> >> I do prefer using the non-split firmware package though (i.e. .mbn), if
> >> you don't have it you can repack the .mdt + .bNN files using
> >>
> >> https://github.com/andersson/pil-squasher
> >
> > Cool, I'll check if we have the non-split version and rename the FW
> > files.
> 
> doesn't seem like pil-squasher works with our slpi image. Gives me a
> 0-byte image :-)
> 

If your files are available somewhere I'd be happy to take a look, if
not patches are definitely welcome :)

> I would rather not touch the binaries if I can avoid it, though. Is this
> a strong requirement to use mbn rather than mdt?
> 

I've had numerous problems with things such as people upgrading N-1
files and having issues with the signature check just indicating that
"something" is wrong. Squashing the files avoid these kind of problems.

But it's not a requirement!

Regards,
Bjorn
