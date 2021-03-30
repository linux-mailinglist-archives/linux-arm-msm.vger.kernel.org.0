Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD24A34E290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhC3Hwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhC3Hwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:52:46 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66247C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:52:46 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t140so3791791pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBhD5KbdnsFiSt2+MMh+Ftqi0BEhgXYxaIvnUCWCmD4=;
        b=PCBacanLVKCrazqke39n4aoYhnvmGFaoq5RW/bFCH9SUL4kWDzRwfSdgeMEc07O07I
         6jGxJKf15L2lOxcRR5+Iy3+9osErSC04xgj/r02WE7bm4ENx4lFutA8/G7dBCnZt++lD
         jySxil/KOhl0UpUweNEF+3K2nc6p/NFOoUDh/V5eXCQAiHpVHA3KxT1yhKEIo7rNxbpe
         aHKnmgisQ1NFlTwGEQXb9sGlkdBBMtE5pLMGoCZT1ZNRdK41HCqwcQZd0A1X6YTOYrvA
         tJeIiJV/KkBd9d5wkGq7BXiw8KV8ZtGIBrue3Ddn1ZIhXbOx/nuIHIjtyA8gzxKyqahc
         R23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBhD5KbdnsFiSt2+MMh+Ftqi0BEhgXYxaIvnUCWCmD4=;
        b=ssmZPINL7fRx3y/G4EBFCmk5vTOct4fQoklJBz5GLZmgfpCoKIk+LTv2mC5zueFKtQ
         AOHID6H01jRQslse2xRIB25+cbPesfafithk8vjPjwTzOxw+bg1O2Tdoaeaka8iaYJFy
         5bqfU0Z7tPpBfEvPP1GzNy5/A4mth5gdwKnrU+9bFeSbUI+b+s1UAyDHKl8vLMCfyUZO
         ZVya7vpFlcpkXd/FTkZMYUoPGCo1FXOSwd3tckIaGeHDYOd1Cf7TzzmOFcfrWgBrPuXf
         1DW+KYsa0uqA5Os8vRlGLgO/D+fBRBbqUaxEh717+fDbwcb6YR/yWlx7E/JdJKp1WeGJ
         jAPQ==
X-Gm-Message-State: AOAM530F2aOYesW0S1k0dMrXeTAwWNPzE0EOrFn1DtFfBLR4HQlWKEm5
        /3Gtg2XeeGj+hrIdf0YJVCxDXsEMvy6l1wjJjZmRPApTCPFU59FF
X-Google-Smtp-Source: ABdhPJwqWL4BJmS3PF4jKnecqitr7ajsqqIzNZFQwzff0lTjoexwCN74pHvGWC9DkrzJnrg1q37cfwS6N7tcJwz61qw=
X-Received: by 2002:a62:1b01:0:b029:1f2:561e:e588 with SMTP id
 b1-20020a621b010000b02901f2561ee588mr28460964pfb.55.1617090765887; Tue, 30
 Mar 2021 00:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-2-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-2-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:00:54 +0200
Message-ID: <CAMZdPi8Qghm1-GohMq8_d5r3j_+_KLerZ=NM9PAKmB9ksmBEWg@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] bus: mhi: core: Rely on accurate method to
 determine EDL mode
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        abickett@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Mar 2021 at 03:28, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Relying on the current execution environment to determine if EDL
> image was downloaded should not be done as the execution
> environment can change at this point in error cases and we may
> misread it. Instead, MHI can rely on the local 'fw_name' variable
> as a safer alternative.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
