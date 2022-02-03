Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4D84A8FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354856AbiBCVYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiBCVYu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:24:50 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76536C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:24:50 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id k23-20020a4abd97000000b002ebc94445a0so2688070oop.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Dcg8bUvTHGFhS2m6mZBYw7q85gmv0e+i5VmVddmuGXQ=;
        b=YrqAID+Y9lZvvr5OeGBqm/qJjSGRHUOL3+JAC2odfFYyrzpsE+lOqDp1rdQegnRZYd
         LCHXebsD1SO4eNTuECqZOzeysnRKGb/XXb1INgNZqKAHb24/Q7ltLkFZhPKpPuAkOeFr
         Ow2a7rJsUlPnO1SY2UGPVFL8kdhcS/qRhd9Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Dcg8bUvTHGFhS2m6mZBYw7q85gmv0e+i5VmVddmuGXQ=;
        b=TUWol9/dsKdOMJVNeOleEf0eZQBuseTAXCrWOlAkx+JnOusS2/SaEBfy6PEl0+SclF
         2lFnF+nzkpUeGB3pt/B2eKoOmkwq6V/jysu6GD3WlRBsANwMYsEDSBdkpm743Fefhx5v
         ckPojZw9ttFBs3XE41UefVyMiQWG47AIOaxjEsI8gfvEu/p+ak9+zpvQ613QQLYPantL
         0j7ruztk/XiUNlAuRet1RThzurbk/Ssa+AMu3u8M/G+lk/M48ZsjbYHVr2pFA80Ikb6O
         X+EUo4516LXDijpLUlUsIi33NxviTbwEXQM71yN+ZHFgsTAniziaVNDo76EFfVhY/rRb
         0JcA==
X-Gm-Message-State: AOAM530tqYGRHKVLoGKwu0bWL+5kgepMwGBaxAUsgkCtQD03iNm/q8DF
        LJsIN8spm8o1zlX0lO59menyjBjguv7aGQRPEYRRSQ==
X-Google-Smtp-Source: ABdhPJyavB8osc2bVXqJup6rzEuSqmm6oZo87dNfxxZG6zo45LiWXi6Dg94QCB+5Zb7fpqjcFEDM+Fo0pllH9+05oHg=
X-Received: by 2002:a4a:e742:: with SMTP id n2mr17807942oov.1.1643923489835;
 Thu, 03 Feb 2022 13:24:49 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:24:49 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.3.I6ae594129a8ad3d18af9f5ebffd895b4f6353a0a@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.3.I6ae594129a8ad3d18af9f5ebffd895b4f6353a0a@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:24:49 +0000
Message-ID: <CAE-0n53ud9zhQVy-Ppa9zOQg39n=+s-JPPegb3=eKrnTcG938Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] arm64: dts: qcom: sc7280: Properly sort sdc
 pinctrl lines
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-02-02 13:23:37)
> The sdc1 / sdc2 pinctrl lines were randomly stuffed in the middle of
> the qup pinctrl lines. Sort them properly. This is a no-op
> change. Just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
