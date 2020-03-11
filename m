Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6896182583
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbgCKXDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:03:04 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:41970 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgCKXDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:03:04 -0400
Received: by mail-vk1-f193.google.com with SMTP id q8so1043505vka.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmAU44+2WU5M+59/aGW/KF6T8HFXFFftVV4HYKoIqRE=;
        b=Yvv0M1bgxd0+ERo0T6RSS7KQwRTXvbLHmgh2GQU5LakeLf2u1+Tai8IP0P527bIzhV
         O552i21SYvZxu2Cv6WF/RqUWq91rqHvEaVLNoSMziNgZgVrQj4uj35thKw0eQswsd+xo
         EAcEcgawzWEd8hFZMNxCcxU03p2CMf1MDCEy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmAU44+2WU5M+59/aGW/KF6T8HFXFFftVV4HYKoIqRE=;
        b=DHXQ2lNxi8sHwWFXIix9IvRUgiHilHtI4tWvpa2z6t8yc24V4f85uEL/8kHgflBe5L
         18T144hpil6MMk0gYuUiidC8BenBIUBiAmyqb5AVC1u3emmgyULwQs1O5+0Na8bicAV2
         ybyQQRSc4UlOmmxB+f8yl270fOf0qdhmIa2vd/dM35Dh0AZ8JIMqWw/SPPjM93OZK0Ko
         EMY8mRvGbDx/wBG7WdqX+Itu/8QWdyNq4BlaV5iBd10Vtguy9vumrycwIgdUq2t+0hR5
         sIx4SrSgf3pxhkfyzM6LT6PW3cDZ49B7vmeojGOQx3sMWxmtJE8YIvjyzTFogqtysaQr
         gknw==
X-Gm-Message-State: ANhLgQ2TkRcv+XqDoKJ/5kyQ1NROJWVXc8B82FMUc21HGVoMkg9z+Fte
        dDfCt5JDcnVkOZ1zNehnQcNf5WX2pKI=
X-Google-Smtp-Source: ADFU+vs7zjSUs6nZs331MapysdheNNVadpiCnX/9sOfcIBWREer2g+q/upCQodoHWdwLr1N8Wq2Oiw==
X-Received: by 2002:ac5:c4fc:: with SMTP id b28mr3633237vkl.101.1583967782258;
        Wed, 11 Mar 2020 16:03:02 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id z197sm5239463vkd.49.2020.03.11.16.03.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 16:03:01 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id z125so2482005vsb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:03:00 -0700 (PDT)
X-Received: by 2002:a67:e98e:: with SMTP id b14mr3639376vso.106.1583967780416;
 Wed, 11 Mar 2020 16:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org> <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Mar 2020 16:02:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJz4P_XC4S=dGb+0EyKm3dMOT69VFQPvKA6S5-LEGQwg@mail.gmail.com>
Message-ID: <CAD=FV=VJz4P_XC4S=dGb+0EyKm3dMOT69VFQPvKA6S5-LEGQwg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] drivers: qcom: Update rpmh clients to use start
 and end transactions
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -263,7 +263,9 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_AMC, cmds, commit_idx);
>
>         if (!commit_idx[0])
> -               goto out;
> +               goto end;
> +
> +       rpmh_start_transaction(voter-dev);
>
>         ret = rpmh_invalidate(voter->dev);
>         if (ret) {
> @@ -312,12 +314,15 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_SLEEP, cmds, commit_idx);
>
>         ret = rpmh_write_batch(voter->dev, RPMH_SLEEP_STATE, cmds, commit_idx);
> -       if (ret) {
> +       if (ret)
>                 pr_err("Error sending SLEEP RPMH requests (%d)\n", ret);
> -               goto out;
> -       }
>
>  out:
> +       ret = rpmh_end_transaction(voter-dev);

One last note is that your code doesn't actually compile for me since
you need "voter->dev" here (and in the start case), not "voter-dev".

-Doug
