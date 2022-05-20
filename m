Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C057B52F3A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 21:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353156AbiETTHY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 15:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345410AbiETTHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 15:07:23 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5ABA195BD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:07:21 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-f18e6ff0f6so11305388fac.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nihMNKg/Cee52sDZgIzDCYQdEGAz2qYL7OpwXO++SRk=;
        b=Xzzdw+qOUg6OXEC6WX8aZ1fXI2d76UtEKEll96yvfxKwyLcQKj/n4uMJDsdxKR8Kh3
         CLc9+NimGVuwpkzvs6o/El+Bo8J37wsXEpvP/XZxH5R59MsSoB+OL8ratu/uc9jTkxrQ
         MwJ5uD2OsRF/hjJ4TmXsFrBtfEkLd4GcmRSJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nihMNKg/Cee52sDZgIzDCYQdEGAz2qYL7OpwXO++SRk=;
        b=tiLmdoYjqlGA38Oq8F7jtW0yhHoax1EJOyiU/xFMU+CyEY5MSEBOZf8Ve09sLLD6hS
         cnutXtuKG1Qq7kJYoJcnfL2TD5gAer3cB2uvRXQ9+fFPItcGd8OWTcSbd7ShvabxFmIb
         koUjnI5RdggW9Ym20sphMecKy9RYNJZDDEKb1nVxa7jX8o/DXTYL+yRboH54CJi++i1N
         A6ZQZTCOpNw4xH816IX2PyyilSsn3NyXHoPAcU1el607uLro5dF/K7D0lGHJXxXv35Mp
         t3FzQv3bb/2AfORAPXK4UjQOqqvjdENEIhEuuHuf3QXNg5Y06Ht/tri5fBAM6YCgV9ng
         /yAw==
X-Gm-Message-State: AOAM53045qPmdELRtAK+cXp3rGLlyrq/a+gV7rHsuAw+hrkah4i7VTHX
        LlY1uvw8K81TWLSs2/PftOshgWXcLtfmBLFAG3zWtQ==
X-Google-Smtp-Source: ABdhPJxIC9bDA4i/ZggEJB0rWG96ePG3EUgyO1b8ubjEfLF0xE6tjuSnzDqSm6ZyeHYmPQkHU+YybI/U0OJccJHUwV8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr6170490oap.193.1653073641117; Fri, 20
 May 2022 12:07:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 12:07:20 -0700
MIME-Version: 1.0
In-Reply-To: <031ebead-4b0d-8493-d8f8-96f2ff9d938a@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com> <YoaqDcB6wkd4zOWR@ripper>
 <031ebead-4b0d-8493-d8f8-96f2ff9d938a@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 12:07:20 -0700
Message-ID: <CAE-0n53hDDoetQW0Bz7noq4peuNCyrGsXaJdjFj=4sMkGeZFgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2022-05-20 11:08:52)
> Hey Bjorn,
> Thanks for taking time to review the series.
>
> On 5/20/22 2:05 AM, Bjorn Andersson wrote:
> > On Thu 19 May 09:47 PDT 2022, Sibi Sankar wrote:
> >
> >> Add interconnects that are required to be proxy voted upon during modem
> >> bootup on SC7280 SoCs.
> >
> > This looks reasonable, but how come the vote is only for DDR frequency?
> > What about the buses between modem and ddr?
>
> The proxy votes that are put in aren't for perf related reasons, the
> modem was getting llcc timeouts while trying to read contents from
> memory. The hw team recommended the proxy votes as the fix.

Presumably the bootloader sets up some initial modem and ddr bus
bandwidth requests? Or the modem bootloader stage (MSA?) handles that
part?
