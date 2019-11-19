Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEC3102EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 23:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfKSWN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 17:13:58 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40697 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfKSWN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 17:13:56 -0500
Received: by mail-pl1-f193.google.com with SMTP id e3so12695751plt.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=ASznCwZJ9ByLV4yzgLO4lJUGY/U/ukbE4wowdWRBq4E=;
        b=Tm/ClsWEZ+XTrHRg12YXmBZbEQduJlGoiWcusKF0D+L31Pf83YcmXs1HDdXuH9vJGq
         YFm24DEbLSuGeqs2xiFuIKVD0V+q64JkWodIP6IN8yricnaEdi5aBgJzRuxmbcyaUQFo
         Xm95Y3iBb1vovUjRjxwLRGWhFsCdg2VCN1vyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=ASznCwZJ9ByLV4yzgLO4lJUGY/U/ukbE4wowdWRBq4E=;
        b=GbMVg7UcTDeu9QN5CjsDP3qlmHF5CTXXt3iqsJTzRk8dp+vUNlGG7VvUHcWpgqRj/a
         k2jSC0X8hTHlS1Jd3AzGKQ6ouRUiPfrAUmQ/vZAMzYPHjWkADmg+kHI8skomxeyIZj4l
         AqA4fIdN30TcCN5fZgVveG3j/ogHcqDH9CvfQsf2OVF2Z8h7vWFkf2U/G1V9YGEArByE
         uJIQoiQF2gJQYU+eVG3onuCsJkujKlMBLKY1oLCeKSe7GPt0B3oD3iijTrQesZXQvLWu
         JhPmte+iS9bU6V9Y3V/PFe8kP3d2WQB623FMIAH/GE71AEBiL5mM/0ZjpaZGidbqUE5c
         +Biw==
X-Gm-Message-State: APjAAAXbSGThWRsS/2NdUB9aEGWTmS7wjzlZNYykXS6+FG3jF9O+Civ+
        6EfHtCF8xYNnE3I3HXqFCs7BMg==
X-Google-Smtp-Source: APXvYqzjtiAMF6Bis8voqOYzvqiuCuY9dRznuUPn80UHLIO0EIWVeK/Q9L79gsJSx7d4c8hbrNX+Fg==
X-Received: by 2002:a17:902:8497:: with SMTP id c23mr34136707plo.209.1574201633891;
        Tue, 19 Nov 2019 14:13:53 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b24sm24260272pgk.93.2019.11.19.14.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 14:13:53 -0800 (PST)
Message-ID: <5dd46921.1c69fb81.aef4b.686e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-16-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-16-git-send-email-eberman@codeaurora.org>
Subject: Re: [PATCH v2 15/18] firmware: qcom_scm-32: Add device argument to atomic calls
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 14:13:52 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:51)
> Add this unused parameter to reduce merge friction between SMCCC and
> legacy based conventions.

in an upcoming patch.

>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 17 +++++++++--------
>  drivers/firmware/qcom_scm-64.c |  5 +++--
>  drivers/firmware/qcom_scm.c    |  5 +++--
>  drivers/firmware/qcom_scm.h    |  5 +++--
>  4 files changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index eca18e1..c1c0831 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -269,7 +269,7 @@ static int qcom_scm_call(struct device *dev, struct q=
com_scm_desc *desc)
>   * This shall only be used with commands that are guaranteed to be
>   * uninterruptable, atomic and SMP safe.
>   */
> -static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
> +static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc=
 *desc)

If the argument is unused, how about call it 'struct device *unused' so
we can ignore it?

>  {
>         int context_id;
>         struct arm_smccc_args smc =3D {0};
