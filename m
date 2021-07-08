Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519CD3BF2CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 02:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhGHAZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 20:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhGHAZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 20:25:58 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882C7C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 17:23:17 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id b2so5686357oiy.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 17:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RbFoIrsFO5XIBA5/R77ovrZzmwL+AynSzkgJ2f7jhfU=;
        b=VtqVdY9lPfx6/Yhz6fJsozfP0L7QK8deW47mn5HtSUTeVi/BXaHkwcRUuSetNMFuv+
         x8Yhrjnke5Up7Wi7q3tBV3KbOYQAFsMdgx+87cNXyxc2Lu5XMxJMTGbDkxE03etTMIXo
         b6Imw0lJLHvtX3T/tUGCAOwUqIA+SEgiKShfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RbFoIrsFO5XIBA5/R77ovrZzmwL+AynSzkgJ2f7jhfU=;
        b=e5tYg80tsYYfJ9Bt29IcXCAEAXt+wfmhouAL358Of9Zibs50euc5WZH0bQ0f6/SOBr
         Ff/wKbQTVC0s+vOVaVTfvbysu5APQ2k01tUDjAuPOFAogAc9FsaivTsN6gGLa2D/89VD
         lmaH9Az1QJJUPXi1R1DPNrN22gjQcdfFUJ0uueMlO5KJ4lismJvH40AAMSPOvvo26HnA
         YOP4WM4FCHv9FxYnv3fM3RaTEq74xfQlJq4KlPUtpL7kIG+8dC7aIv1rtIwpwtZLbhBg
         E5cWCyoYJOohcipw/qJAoc+1fsUI9wfUrUT//PrB5JuF0bSmCh0X5o4rzyGX3gs0tR8e
         SFHA==
X-Gm-Message-State: AOAM532lKAdqv4lzJVOzt+hlRVwEmIgWnpiqgrnOJetzPpMJMwNMUlAR
        t4pEZKWIEiwdKcNM/yG0Mek/fCFY6Jmnc6PQE0hjJw==
X-Google-Smtp-Source: ABdhPJzg1rZ5ea1h4hn9be4lgRL9bCGi6K92pjjcqaaI2kcvco3q8d0Q3VHMcWfzh+rCZRL2WFO4Mh/aHBfbyPTXkOo=
X-Received: by 2002:aca:3012:: with SMTP id w18mr1495720oiw.125.1625703796995;
 Wed, 07 Jul 2021 17:23:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 00:23:16 +0000
MIME-Version: 1.0
In-Reply-To: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
References: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 00:23:16 +0000
Message-ID: <CAE-0n502u+7CNhA5_kMfc-CVvpSzdGOeputT6nxW8BvtyVBeRQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually
 enable the domain
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-02 19:54:49)
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performace state
> is needed further requests has to be made.
>
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
>
> But the corner is never initialized, so a typical request to simply
> enable the power domain would not actually turn on the hardware. Further
> more, when no more clients vote for a performance state (i.e. the
> aggregated vote is 0) the power domain would be turn off.

s/turn/turned/

>
> Fix both of these issues by always voting for a corner with non-zero
> value, when the power domain is enabled.
>
> The tracking of the lowest non-zero corner is performed to handle the
> corner case if there's ever a domain with a non-zero lowest corner, in
> which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
> would be allowed to use this lowest corner.
>
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
