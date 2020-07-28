Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BF523034C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 08:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgG1GwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 02:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgG1GwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 02:52:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B3DC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:52:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k27so11335381pgm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/GS/4OHUC58pzoucFVteRuIhHVuqFuzv5eBDbKwTaes=;
        b=rt+ymG5Cbhfum5rPhzbu2bNlLrOp2IYPr1KhUaVGa/JAf4KFUIgZoNlrcr9ss8BvzG
         QwIQxBO7tsuKVEqXL4c3rX0VtADAkGcNlf5nIDGY+cRQkp5Umvsg0jlr+YVA9ucRX6Zl
         9rJOvRnTFaw1+62YFnp0j3qDHqPZPgSoMJ7M4KlvRpvhcyfuvo3Vq92tm5pT/qK1robW
         pD5CudnsUUBNCVG93MqMptvbYcGnCP0okPFROypwhzqtHhn4yfVf9hm5YpELNmTwdeat
         TvTd7hKZrmrB02cq/aCptA4N4sj/mUUFU8wzNpS3783wXNxRwLv80AIS8P4T22iDYZuk
         fAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/GS/4OHUC58pzoucFVteRuIhHVuqFuzv5eBDbKwTaes=;
        b=dgUMH6d20b1jMTvDa3t2coGmHuPwzBoff6sGaukRzOOfWPPDa1QN+jhMNojv1oW0Dt
         iUV0gm9QywPH67FWIGOm3SrIcMh+SYeFbM7UGt0S8EDzweSxbW3p3fM8BJZCSzH7j7Ik
         ozPvsMlnTBkXXBI5mkaSIgyRyPA11QAqd1IvImJeK4P1vt6VIde/+oe5qRSbeEZsq84v
         WwRYA91IY5BAoH4KMJ+kMSyuRc4K+Dl+odJ7PUFkfX3s1LTl7BY5yTSrMzY7by8sPS1L
         hq3je0uhXrEXv7eYYtj+rTsILo5v9q8eGlSmfhRF07VCiZLrmflX4D7HW+JxWEYdkc3t
         gVzA==
X-Gm-Message-State: AOAM531qWrIxo1EhNpA+Nhq5C/AW7SCSNFAUelqG+3jNzk2AVJcuSOr1
        owyx4IFn9K6IrU7DbuSTA+ZSUw==
X-Google-Smtp-Source: ABdhPJxfbaZBUKL4RCI1GSa5MCOEQqQ61UEUjQME4GaIZXbAZyAHFPAaz4UlbjqcmBNjh+s0Ky1hDQ==
X-Received: by 2002:a63:fd44:: with SMTP id m4mr22809692pgj.160.1595919123788;
        Mon, 27 Jul 2020 23:52:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t73sm16963494pfc.78.2020.07.27.23.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:52:03 -0700 (PDT)
Date:   Mon, 27 Jul 2020 23:48:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/13] msm8992 DTS updates, peripheral enablement
Message-ID: <20200728064831.GD202429@builder.lan>
References: <20200625182118.131476-1-konradybcio@gmail.com>
 <CAMS8qEVKssmOTZTQqgo3y6yUp7KztapQLtek+Q6FewqVaSGYyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEVKssmOTZTQqgo3y6yUp7KztapQLtek+Q6FewqVaSGYyA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 27 Jul 11:20 PDT 2020, Konrad Dybcio wrote:

> Bumping this up, in case it just got overlooked.
> 

It was just overlooked, thanks for the bump!

I think it looks good, will pick up the patches, and the previous series
that it depends on.

Thanks,
Bjorn
