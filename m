Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D54F2C7C82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 02:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgK3Bln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 20:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgK3Bln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 20:41:43 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAC1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 17:41:03 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id d17so16289240ejy.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 17:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YNYyQoH11Uy49BqvFcvhTDHG+XYaaGyowBqhzVBSUAY=;
        b=WwNrl0Ybr20BSwcEyIynEsdNTjjydkiaOOK+8xaxlNamiVtWQDFg4dSjd7crFvEsFa
         0hUWJGsxkcsFjLP18+Kcky7cgJGqLjlr/e1HCFaCSXVnMX3gNDW8vDsvNNbpM8YXCB6P
         eKBamIGx4Oi7tF70nS13vGryycE4zosApoI4ZLqtutxVBbGt+1t4q5zfjkQrJWlTF86Q
         e7PbXx5U6mpoMEl1gbMbd0o7wo8juA3U4/yO1goCXLEyaEan2jY+uYjt0tEaMwMSRuwo
         S8NGrNH+N/A5k8yAKdnmicNWjDMCtR4/HbVPVQzcNmniBbtYNs9AagYYNd9f+F9Pgk1l
         wQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YNYyQoH11Uy49BqvFcvhTDHG+XYaaGyowBqhzVBSUAY=;
        b=Cn2mkP4BtoAm3ucw7JhCE8rzDw/zonOkJZRrHZdaAnfVpKq9OGWBaR01bhZFLGMqgQ
         bAjp6M9MOQz1JRVn8QbJXoqhds4sfanwYa1/8IS7uXQfoHJ4eA84Ac+YX0pwFvXxfJsG
         3wjWIazo7JIbfRuEoudXNce5bzrkgMKlfE2UUEXUbDpLxt7rlo1M+JWRzxju4W6Py4cK
         oY6os1OzWOf9PNfhM7qdgQ+XNHcEHzoLNG9aEfNbeRJ1UXNTQ9TT9ZB5lPAWxX7vqqqs
         GGTmXtaDBSd7J55xpkbIIGbbhZLz3Bs74qYExFpdATYlwoOqjCMKst1mp+lCUROrb9zD
         K11g==
X-Gm-Message-State: AOAM530TJsXSEyMOQgmhN9ET+ObKOt3r8n9Sf8okKwB8eSsjiyZDAPTp
        dG6s5moaUVhjhwsuJKwqO0K2mC5jqjoEW1jEVgstSQ==
X-Google-Smtp-Source: ABdhPJyI8iq9Qcoh9z+BgQGsOaQVWGtfyNzvOoKL5oqxj8FOxSgc4pj2PZ1+KU9i112A2dmNHWlk9d0rgvij/Qc7bQE=
X-Received: by 2002:a17:907:3f93:: with SMTP id hr19mr18726449ejc.235.1606700461879;
 Sun, 29 Nov 2020 17:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20200930081645.3434-1-jun.nie@linaro.org> <43318c75-cfe2-d219-2ea4-7a130ea5883b@linaro.org>
In-Reply-To: <43318c75-cfe2-d219-2ea4-7a130ea5883b@linaro.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Mon, 30 Nov 2020 09:40:50 +0800
Message-ID: <CABymUCOjh0BEwaZsFO6YzbMskeNnhPCDLAOhzU8Civ_3JM0yrw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Consolidate RPM interconnect and support to MSM8939
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Georgi Djakov <georgi.djakov@linaro.org> =E4=BA=8E2020=E5=B9=B411=E6=9C=882=
6=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:20=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On 9/30/20 11:16, Jun Nie wrote:
> > This patch set split shared RPM based interconnect operation code and a=
dd
> > support to MSM8939 interconnect.
> >
>
> Hi Jun,
>
> Are you planning to refresh this patchset?

Yes. Just come back from a long vocation. Thanks for reminder!

Jun

>
> Thanks,
> Georgi
