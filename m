Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E37347551D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhLOJY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbhLOJYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:24:55 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAC8C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 01:24:55 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 8so20183821pfo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4sUvgkrF0BMRks7H4ZZOL7siKWIQ0a4qAeRlXkRUWg8=;
        b=ppVCKVaxu4PPkl8pzbDFxgS4ir057qbVQo/7QrIxW6WBzrt8a67IRF3c2+koZYG3yP
         uS6xfn4MBRJZb/4W3PN2IHZI7ax6gML7BChYpKjzFitS86KEWc0d7LyuqmmeCymi4KuJ
         3+pUbNccnBbHkA43XcRABPRMzikyjlCpmfsGJDt9/wKA68ndSViKUxyRhigEZIG+8WjR
         lzsjs27bMjBbJV3yLlnsSJaSnrp/D3CoskM2xk7I74EhiNW3iNGlJLvXtNN8lg6FUS9Y
         jd45hsV46+4pKDi2ZU8731UgW4IBjFCMz+/Vvc78L2D5mDXxYx8i1oS4W9JW0NmFGpPh
         8GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4sUvgkrF0BMRks7H4ZZOL7siKWIQ0a4qAeRlXkRUWg8=;
        b=GxoObKarTQ236bk4YNmEc+4SbKV0S1v1Y4ISUZ/w6IBW/l5k2vd6SScWLeBprap5p1
         2EAvNy2+ks5oah5r5wHvrFdYIItkPpjyeMdzYljjqktmWSXHPmI2fYKxRAb9gHjUNkH6
         kuoxJIqMhs43f1k9fBeDr8tZFPzBlNPWq/pRZP9Dp0T2KgYiDnEJdpQlttzO1t3RBi9T
         in88kL6kw55AEIMokX8ysO6mxvQ5SjgB/uw4XsNB2eZllsmrT6z+0dfhH1BEApdwZoum
         Pf+e++ZMxAcK69vB4HHSUOpZz4RDaaw/SgpY7ewmTzEiYdZiBt/+g0StfeoOd3QXHNUW
         DLLQ==
X-Gm-Message-State: AOAM532codN1TUhsWB1NTdq9TPIROSodVUtAtwtSCe417k3fdcmYifsF
        icqwD1TOdSaZ7htsQYdjo3izUhHGVPIRX4xY2OQJBQ==
X-Google-Smtp-Source: ABdhPJxmY36Pokl0BNS+p4Oz9b7iNRfHVN6DaayYUHun5IaZ32qUoakG3f3BB7cdDn3jXI3Li2ml/FMPxVN9Sh8eKxI=
X-Received: by 2002:aa7:8b07:0:b0:4a4:d003:92a9 with SMTP id
 f7-20020aa78b07000000b004a4d00392a9mr7995483pfd.61.1639560294958; Wed, 15 Dec
 2021 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20211214134630.2214840-1-bryan.odonoghue@linaro.org> <20211214134630.2214840-4-bryan.odonoghue@linaro.org>
In-Reply-To: <20211214134630.2214840-4-bryan.odonoghue@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 15 Dec 2021 10:36:28 +0100
Message-ID: <CAMZdPi8yXGbqzXYnF3pWY4SJGKxQ17rXO6Gwgq6md4qmXVJT5A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] wcn36xx: Implement downstream compliant beacon filtering
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        benl@squareup.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Dec 2021 at 14:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Downstream facilitates the direct programming of beacon filter tables via
> SMD commands.
>
> The purpose of beacon filters is quote:
>
> /* When beacon filtering is enabled, firmware will
>  * analyze the selected beacons received during BMPS,
>  * and monitor any changes in the IEs as listed below.
>  * The format of the table is:
>  *    - EID
>  *    - Check for IE presence
>  *    - Byte offset
>  *    - Byte value
>  *    - Bit Mask
>  *    - Byte reference
>  */
>
> The default downstream firmware filter table looks something like this:
> tBeaconFilterIe gaBcnFilterTable[12] =
> {
>   { WLAN_EID_DS_PARAMS, 0u, { 0u, 0u, 0u, 0u } },
>   { WLAN_EID_ERP_INFO, 0u, { 0u, 0u, 248u, 0u } },
>   { WLAN_EID_EDCA_PARAM_SET, 0u, { 0u, 0u, 240u, 0u } },
>   { WLAN_EID_QOS_CAPA, 0u, { 0u, 0u, 240u, 0u } },
>   { WLAN_EID_CHANNEL_SWITCH, 1u, { 0u, 0u, 0u, 0u } },
>   { WLAN_EID_QUIET, 1u, { 0u, 0u, 0u, 0u } },
>   { WLAN_EID_HT_OPERATION, 0u, { 0u, 0u, 0u, 0u } },
>   { WLAN_EID_HT_OPERATION, 0u, { 1u, 0u, 248u, 0u } },
>   { WLAN_EID_HT_OPERATION, 0u, { 2u, 0u, 235u, 0u } },
>   { WLAN_EID_HT_OPERATION, 0u, { 5u, 0u, 253u, 0u } },
>   { WLAN_EID_PWR_CONSTRAINT, 0u, { 0u, 0u, 0u, 0u } },
>   { WLAN_EID_OPMODE_NOTIF, 0u, { 0u, 0u, 0u, 0u } }
> };
>
> Add in an equivalent filter set as present in the downstream Linux driver.
> For now omit the beacon filter "rem" command as downstream does not have an
> explicit call to that SMD command. The filter mask should only count when
> we are inside BMPS anyway.
>
> Replicating the downstream ability to program the filter table gives us
> scope to add and remove elements in future. For now though this patch
> makes the rote-copy of the downstream Linux beacon filter table, which we
> can tweak as desired from now on.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
