Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A94640E8F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 20:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346276AbhIPSBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 14:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350755AbhIPSA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 14:00:27 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6879C03D74C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so7267545pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
        b=YOO6pC2z+QRaJL2FP1+cetlhoPONSQZg7eY2yLDK8roGPWbc9sigaVpjLo8GpopAEt
         6dpX5ls6QlvN8297Oc21azN16SHcgPDMJcitwRcy5ANGXg3bnVq3Rlc7QGoiwCwDQOsi
         JNRPNZabX30oyA2uOTy4d0YnMNkpTLESRpv498IMBHqFIS9ZtJLpLwMudRhZqv9+4ZyD
         W0F7vw7P+YsluTgr+ojS0mc5DXmGSLwQKhwpk7PYW4vV3cTbrCrXJqPWDxuqZYo6NQuv
         ZvsPwmplyQK4fMp5EMraC3ntygo3wZs+GpSUOYXxvIn4Nr1DmeIDAlH9qcIQ80FO7PCN
         l4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
        b=LVhlTF1xZ3UQ1tkoSMXTcFNLRZycl2jxO5eOZWvn5PdPWFO4HdRPJGD9n/KIvDAncR
         PWevsrCEC+KtXxx0e/1NsP2jlpUrE4RM+jQBX5HTP/qqZC5+DncZv0S6nYoQ244cT2xq
         HN5UvWBn0KgHWOP5XR1v3h2sWt9aIUiQ1j5zc3GRIkrhi6XSJ969K0t+Wjn3LVvS4+tH
         u/5vJRtJ/WUMLVypGVvDsdO87lmQgKF/sg+J3VRfI1HynQDBCRVGglcxE5zXELdHQFcE
         Aev0IlD7Rw8EGzZTYyvQ487qR3unAPAkDKqqpMmllhHeGcscR+8406pO/q0Y3YDc96FJ
         Bb3w==
X-Gm-Message-State: AOAM531ITxOrLEXVn73wyxzenBqIcPuIGimezCZ2sCm/xL+fJxkIchNA
        99Sx6BeRK0S/wl/648tLgfGu
X-Google-Smtp-Source: ABdhPJwLv1/q2iNeC58++mRrmPhb6MJdsEz0qlcZ2ADeRpdVKbb2FXjiUMui5WtQU9sga1edO/Q9Vg==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id h11mr7127110pjz.124.1631810134300;
        Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
Received: from thinkpad ([117.193.213.12])
        by smtp.gmail.com with ESMTPSA id m28sm3751263pgl.9.2021.09.16.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:35:33 -0700 (PDT)
Date:   Thu, 16 Sep 2021 22:05:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210916163529.GA9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 16, 2021 at 01:18:22PM +0200, Loic Poulain wrote:
> Le jeu. 16 sept. 2021 à 13:12, Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> a écrit :
> 

[...]

> > If things seems to work fine without that patch, then it implies that
> > setting M0
> > state works during resume. I think we should just revert that patch.
> >
> > Loic, did that patch fix any issue for you or it was a cosmetic fix only?
> 
> 
> It fixes sdx modem resuming issue, without that we don’t know modem needs
> to be reinitialized.
> 

Okay. Then in that case, the recovery mechanism has to be added to the ath11k
MHI controller.

If that's too much of work for Kalle, then I'll look into it. But I might get
time only after Plumbers.

Thanks,
Mani
