Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E304002AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 17:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349617AbhICPzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 11:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235851AbhICPzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 11:55:44 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AF7C061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 08:54:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c5so2655702plz.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U4kliMNGhJFOsEdYoNwrkSdVUYbz4NgF4NPhRav/EXw=;
        b=bdEG4K8ixEgK1OM+Q/+F5PX0hVRoezBC3oob6w6l8EnfgLUIlPc5N9Igynz0a25AFr
         3vqm6WeRHf8kd/0enpnfIr8rO5R8MZzQsu2sA2cQ89dLVi+mbrOfviw8ONIqhdzJmiCp
         hKysn0ERoTRoIkRaw81o+THJ87FPHRaSOstQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U4kliMNGhJFOsEdYoNwrkSdVUYbz4NgF4NPhRav/EXw=;
        b=Unc/YMYkvDaE1ekFimS4XRDpwdZfkbSoSqmxf4auPlbHtnqmwIUJd+PibF4Bp7UgCn
         Kk0Adsh4+NCO1O1YUUX0IICOUpTI2MxpDtzUF0AeqHLonfHDflnoEJU2oQyl4AfoG/RY
         Vf9po0lGLqy7pEZxH49NNPrV687X7R2jCkkO2aLEeu9dkANxhUcmHUYbGjRckqTwAeLT
         VqrpEf5d4y2ATQnEd0cGtbHptfee2kRfGZE+5/bldLeD/DLAAoyxYfWxrCsGSuyMhJv+
         Q7Oq9N0+87V8f/wN9B+4m8fVh4r+QrwNoidfKLRlsSoUBhBHkKqNzwE+xA6sqBBa/i6M
         DWPw==
X-Gm-Message-State: AOAM531TlkbXBrQ1MzPPvYoXqaspGGvVohvqoaT72RrdCnu5W5uOcAtL
        /WwqG7U7gMJ3I1u+47A7E9Xaig==
X-Google-Smtp-Source: ABdhPJyPr6i/Zkg0dPFe1JQRcxNj+ROmsyNV0Z3XU3S80TTeKlOUNRXzcf1ovVdE9WltdKqMHdfwNw==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id c17-20020a170902b691b029012d02b6d116mr3511279pls.71.1630684483622;
        Fri, 03 Sep 2021 08:54:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:80b3:9f00:3170:fd8b])
        by smtp.gmail.com with UTF8SMTPSA id u24sm6183944pfm.81.2021.09.03.08.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 08:54:43 -0700 (PDT)
Date:   Fri, 3 Sep 2021 08:54:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V7 1/7] arm64: dts: sc7280: Add QSPI node
Message-ID: <YTJFQUd/+X0L2Uud@google.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-2-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630643340-10373-2-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 03, 2021 at 09:58:54AM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Add QSPI DT node and qspi_opp_table for SC7280 SoC.
> 
> Move qspi_opp_table to / because SPI nodes assume
> any child node is a spi device and so we can't put the
> table underneath the spi controller.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---

It would be really helpful for reviewers to have a change log,
especially for the larger patches of the series. You had one
for some versions and then dropped it :(

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

