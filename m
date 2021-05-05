Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C54373DE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 16:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhEEOrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 10:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbhEEOrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 10:47:11 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3F3C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 07:46:14 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id p12so1926672pgj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R3G9d6KOWzFUMXwhCG8q7hRyP7veP3KVpL+M9wYJbzo=;
        b=c4wvDnRm+0PADdN/g8sRlbYeAI01jJiOp1ppnQsFnTtAoVcxvHMRzVuQoOXVIVhKlg
         JlGpfPPm/lnb/GqYZg0D/dn3IYX+jLYkO/dm8Jfsnwwd1G5VmFMGa41gnW3pPm98FtQm
         UiacgkrTdhaMBhE/fUwEIOet2ueOwZTVqSoT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R3G9d6KOWzFUMXwhCG8q7hRyP7veP3KVpL+M9wYJbzo=;
        b=HKt8lnh+tI73hMJVogxuyUsOZp+OFJB4jukq4MFzWN19fZfTpwed9oxIx9PznSisdR
         KElmy9s9IF0eJ4fTlHUxSyh+t9o/l1zsnRRQBQSm3zFZB1Inv4TvSqAf7HSxj6LzUqxV
         r2Ng3sXaL3vQaQLDa4LAMPB7PyYqe4puuqMONaSiw0+PtNjS7rilAjoLotxgLt0+QdLz
         1AXy9CGe64KS/2OZu54akgVPhIx1nQjpOzIKXypOdVaH2jKsyYsSrVujpHh5/EK3786G
         ancGc61swlNRQO5+cT/xaf+mR3g/nxuEG9f4t+/YXFOaFkjHtyqhpc5Ri8/U5cQdClKz
         3f0Q==
X-Gm-Message-State: AOAM531jcqSYuS30EXlmoKeu87GbFDggwgbGfWq48p7buoKDwL/Cb1QF
        sV9iJkYj59Moj2bPi6dtFYvj7g==
X-Google-Smtp-Source: ABdhPJzlkjo9Y9GoLDeR2gcRvMHn0sFqCyFftBjSk5qnwGnWJ9iqXeky2WsRfLuYXq8GFYxq02k7tA==
X-Received: by 2002:aa7:9108:0:b029:251:7caf:cec with SMTP id 8-20020aa791080000b02902517caf0cecmr28828386pfh.13.1620225974050;
        Wed, 05 May 2021 07:46:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8770:f856:b2ff:e5e4])
        by smtp.gmail.com with UTF8SMTPSA id z23sm7026954pgj.56.2021.05.05.07.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 07:46:13 -0700 (PDT)
Date:   Wed, 5 May 2021 07:46:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 7/8] arm64: dts: qcom: sc7280: Add channel nodes for
 sc7280-idp
Message-ID: <YJKvtLMPCg56DO1E@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-8-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620197726-23802-8-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 12:25:25PM +0530, satya priya wrote:

> Subject: arm64: dts: qcom: sc7280: Add channel nodes for sc7280-idp

nit: just 'channel nodes' is a bit vague. In case you respin maybe
change it to something like 'Add ADC channel nodes for PMIC
temperatures to sc7280-idp'

In any case it doesn't seem worth to respin just for this.

>
> Add channel nodes for the on die temperatures of PMICS
> pmk8350, pm8350, pmr735a and pmr735b.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
