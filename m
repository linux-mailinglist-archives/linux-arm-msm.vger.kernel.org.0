Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA8A1D31EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgENN4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 09:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726088AbgENN4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 09:56:23 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FD1C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 06:56:23 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id i13so24582191oie.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QaeCjNYyNaLWwCKtPQuE5dOCmpyD933kyEEJ8XGmdc=;
        b=W89jninmD4jOMGWH9hNe8p2EZhmo5dVOszViIBZWspw84gJP1EyDd+q+vUO5zEoICL
         byga9phhsYgE8NWn2fi86exAJ4VhIXMM+72mYsp2tuVToKiKmhunIM2sUhoGk/F+x+77
         DYN/ujPfV6em1l32FGCMfOKp44sYzrI6HIwLJJh5Q7G19RwiWFcWgzMN51ooCqPNz0+J
         iexVE1WnyER0TrCIFyYScYUPUWsXbN78TTQiidPPbjneD7wJfL2rnRXHzgvRwe7nCvas
         7/q250rThqM8ZM0o/P6pFxVXvl3GGfdosyuRlHGUkLkOqdroZIvBKjC0UzURDUdsRcAq
         srbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QaeCjNYyNaLWwCKtPQuE5dOCmpyD933kyEEJ8XGmdc=;
        b=mLL992ht4PD4AzC6hhB7xubdKpktFctt8YojP6TEJRvtSJe2k07aDbPMS2K6U+brzY
         2yZ/cvWwLUF17bqxe/usQh+5P3s3oYg2Kppl762ASjI2FagoimxuqMFYFD91/A2h2cUo
         mBDAMMrHWREpmFsGvPCIPISEVM4f33b5OjtCFfOllibZpoyZ8Lk9TMR5SUaef0HnFg9s
         duxkJLizlHzm86yW7OD57WCEjwwT1ZeJ7W/6hrLYY3hQzG6+e1AnpPaIUkHRqw4GArKW
         tHOjDfzhoVQhmJDnGCUBjh1VAxMUzWLtFwA+2qcX4zV+GDPnDqF4tjFT02YbnsWkkpjG
         FaUA==
X-Gm-Message-State: AGi0PuZsmFo9qf5q+BvnqDgR75CZukMqHLTgocPeoTYZkbknEVRGTAKn
        dxzzbKMZVqr5IX+ahUChbzu4vbzTFsRKc6GU4woNPg==
X-Google-Smtp-Source: APiQypLwISt71xgIY2WR9s+KHLTS/yR4PmkFamPn/Ls5oRdriazJm8RLebvh62tDs2EjkF/bm5ERMgFesmc1OkzyN2E=
X-Received: by 2002:aca:f146:: with SMTP id p67mr32413451oih.56.1589464582979;
 Thu, 14 May 2020 06:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200406060049.227029-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200406060049.227029-1-bjorn.andersson@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 14 May 2020 15:56:11 +0200
Message-ID: <CAG3jFythh_34wujTUKpuS1DbEsihNS0C5oPYXKgBgaSVhiakyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: c630: Specify UFS device reset
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Apr 2020 at 08:03, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On some device the reset line for the UFS memory needs to be tickled in
> order for UFS to initialize properly, add this to the ufs_mem_hc node.
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
