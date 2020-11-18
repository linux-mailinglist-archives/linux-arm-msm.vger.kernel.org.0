Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F372B7A54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 10:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgKRJ0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 04:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgKRJ0n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 04:26:43 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180A9C061A4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 01:26:43 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id q3so1208341edr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 01:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJZDTmGQCMRrHgGITDBSvnJ9kgXzD9M/FJ4rVuEjmck=;
        b=L/zm4azh+KpuVC1kELj+T04nSVtHuTCWbPnVfKg9mM97hpCSOrs28XHTYdr0o1D7d3
         o1FlxqO644ilGsd0vpHzjDSG+Sh+qgErbM3RYB499TtS1wI9bSTeDFy1GZK/P2aoWyyq
         SoS2WAZFNwOyRZBm3xuYJ3Z3lDeSwQgbxip89MM3g5q5kTyZqjtNvKngAqBbnMS7tqYd
         46oOwNxrXqp+R0fVd9hcy8ekap0HgIEeB+38jzawdpWcdlUlhX8gfcI4yJlpGLh1xvvU
         cChqFz6ZBACpycxFbyo7qXrKuq17b/CByaFJX2NKNhbgXQxFo/AVTXruCVa4fP7fUjz8
         yA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJZDTmGQCMRrHgGITDBSvnJ9kgXzD9M/FJ4rVuEjmck=;
        b=SczUW/VzKmAGwTgxdOZpdCIeNpCCefvA5Beqwjg49pFn6CohGBVvOGs5Q3KssArEET
         nMkcHrzR3O9oJLll93dGqIFL87q+OQVFoeRvbTe2d4uSJ3tv4Gx3zGHGgyHccOWAwVyB
         rriz+kw6TWKjC3sc8ID+tEbb7YdptrSsEsmcLCm7qcIdZoUlAqMwPvV5focTftoPBrfL
         5s58AxhAOBGzoQGealCIjo/qC1kMfqFkXj0lGj/EVyULdMS0WBRPXahtErFWYKDbaedk
         oQ3tdBY6oqe/iS+93meO1k6lQMatrJp9MI+cSyIUi6uEU+1R41kOEnXbPekPX0QJiUQJ
         Zb1w==
X-Gm-Message-State: AOAM533pY1WpH2kP/kuAYRUaUP315I2aqEeXOlhXydcE5pXArwmidkcW
        suWsVAzNMP4URqCFxzd65bHsT3B6csuVGUK7VlUKCA==
X-Google-Smtp-Source: ABdhPJwxLU/BF5kVXKEXzqyaTfPwvnucxLiPgj3g7d2ft6NwROtC2mysLW+buBXL/VQ4fRYDhktE03vGdsoWkwgNuMc=
X-Received: by 2002:a05:6402:8cc:: with SMTP id d12mr25215161edz.134.1605691601760;
 Wed, 18 Nov 2020 01:26:41 -0800 (PST)
MIME-Version: 1.0
References: <1605566782-38013-1-git-send-email-hemantk@codeaurora.org> <1605566782-38013-2-git-send-email-hemantk@codeaurora.org>
In-Reply-To: <1605566782-38013-2-git-send-email-hemantk@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 18 Nov 2020 10:32:45 +0100
Message-ID: <CAMZdPi-qxKgs==kXXuSY3Y-GTfcGb7WjQuzn3tXMt2NZNuzriA@mail.gmail.com>
Subject: Re: [PATCH v12 1/5] bus: mhi: core: Add helper API to return number
 of free TREs
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Network Development <netdev@vger.kernel.org>,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Nov 2020 at 23:46, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Introduce mhi_get_free_desc_count() API to return number
> of TREs available to queue buffer. MHI clients can use this
> API to know before hand if ring is full without calling queue
> API.
>
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

In case this series get new comments to address, I would suggest
merging that patch in mhi-next separately so that other drivers can
start benefiting this function (I would like to use it in mhi-net).

Regards,
Loic
