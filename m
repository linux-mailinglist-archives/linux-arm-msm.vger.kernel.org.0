Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55BC34E29C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhC3Hze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhC3HzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:55:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A77C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:55:24 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so7239802pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbvBjbJlgSBferfsc3fLK9nLFbUPcwisVgWM/8EwoFQ=;
        b=scYaCXldbH24Yaj8rf20hooRzaL9q9mYQBox7S1Fzbhj8hDrOaVV4fzaMHOtOEXAaX
         95RlALWtcFv6kRHOuVWpX5Dhjkd3W9JdIk0G8w7wmNK2Iqo2CV2x0EoeTMDg++hy/Tme
         Hfaa20LTNCQGObNP0zpY95l7LxdNrnx8FW0dMLXBk/JjVZepwXUQKF06Yj+/85g0KbwG
         Jej5kGa8F9C+wcgn6wgPmO6wh4fDbjJqWPEwpV9XVwdPbygsvnawGiuyMshaNaZP+231
         ia2JDfx/oQKyG7rUuXFYCvzWihYT1mhnlG57DNVfmUemSP6a9dZ/9d8QpEOePeze7ET5
         lo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbvBjbJlgSBferfsc3fLK9nLFbUPcwisVgWM/8EwoFQ=;
        b=Z41+TzQ4OfTvX/A0vy6MQG3qsFrQLIRD6AkZb/A7l0ecSVlNJoGlR1kgzlnH4AaSVm
         0ffqIZECvvY9dHMJW/blEryZLr0k94cdwKNE+1//s275Q1JwdVi9vTMPAFenGA+OrShC
         XvIto0wiWq+eNv/IDn+NiQK9e4sCsBO+TpkTn3DSTrlEzcXLuAxPNnCgXvCzBUiYfNK4
         3fc0yL4374bTN1GwPMIeAJqHd2zLtVyPpvJ2bDcEyQsDUAWUavKUqtWIfrQU30vvsqQW
         /ebKAbKnGr/vevJhOuLX+BnU33MvYuHUThem4/VHyPOqRIzz2Rhcihv5sBhZwBbBWh/i
         pZww==
X-Gm-Message-State: AOAM533DeJokWWIbwFLJiiVWOABc0b1k7aDH8Soo6Uc7I61GAlFgANW2
        JQiL2GuLVgYUI6aNyR+pMiSR0qD464mNCnGON80u4Q==
X-Google-Smtp-Source: ABdhPJwLEQ7tJ14eRS/yUEDEjYj48E8XhgZEj490onsnM44cWvBVkBRDKO0uYSr2bopLWyuPamm7GuYkbBqnmEuFoAk=
X-Received: by 2002:a17:90b:4008:: with SMTP id ie8mr3146042pjb.231.1617090924013;
 Tue, 30 Mar 2021 00:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-7-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-7-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:03:32 +0200
Message-ID: <CAMZdPi_SWn9a_KvfpNnKCLcq2gb+A7KmUth7zVTgWs+H-Okv=w@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] bus: mhi: core: Wait for MHI READY state in most scenarios
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
> When moving from SYS_ERROR transition to a different execution
> environment, MHI host relies on the BHI register read to spawn
> the next image download or wait for READY -> M0 states. The
> device can at times move the execution environment to mission
> mode when a pass through is expected, which can result in a
> stall. Initiate a wait for MHI READY and write M0 such that the
> device can proceed with state change event updates for any new
> execution environment being entered. This allows us to remove
> conditionals in handling firmware load for PBL modes and keeps
> the execution environment out of the picture as it can change at
> any time.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
