Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27F84B0208
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 02:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiBJBY5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 20:24:57 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiBJBY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 20:24:56 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD01720F68
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 17:24:54 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id u13so4437703oie.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 17:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=x2k5/p2+1EreJcvphg39ZeoqokALorRFjM7MtNKPEW8=;
        b=fLnwc+dZF5T7HAKKi4KAZvW+YcEzG6KqggXlylHCzvgPRpHFw4TMhuXKeSzGG151L+
         C0xOcGsNr4rJkVaFUgnFnCsNZEOzEOLzW65GoVSP4WCWs/rtWSM+xcc7IGI0RjnRGQFH
         DECB2VQvrMJKzGQ6zSTf2E0tUXzXnxTEQgNyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=x2k5/p2+1EreJcvphg39ZeoqokALorRFjM7MtNKPEW8=;
        b=hAtM+WpkupEgKac64EHmduJSa9hx1ywd0l598siJ/W6vLiQxDGquoLTrPRSxOo6z9T
         KBh+5fIgThLjYKnAcMShfTshAvtxCqw5F/yWDnvEweEwKkSHNi6f9Qmx+YkWIvjQHxnF
         ennaDfHfev7duOdC1JA9xWjvB9qKNkNjrUFZW6BZXUn4DlDTXUq/D2kuJFU2aFlDogdA
         7k54taDHefRFT0U7kCX1CKYLLWlW+hEmeL7OlStFwSPuth61iRDcx9ihyTwRp27vKJhw
         HhvIy2wK9YDl3wETDj1GWT/6oKhR1RKrG2dZSuYhvR9XzJuYDh+2ELqerZ3DUnDzyIL5
         PJQQ==
X-Gm-Message-State: AOAM530IBJJUO8JYPAPbBVvpls8v0xevTMbzp9MgUhFj3h8oikuGdHIw
        EZ8MIBP7w2eO83bn1aRILJihH707D3HeWIITuEOHbV8cxZ0=
X-Google-Smtp-Source: ABdhPJwLYBmMx5NDKo9m7NEKru/pKEgLewZGXLcS52Fihf8YUAInfps3SIKFvwGtmzu/zeGA/Q/klzGVKCkvVQjfOf4=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr60866oib.40.1644455804491;
 Wed, 09 Feb 2022 17:16:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 17:16:44 -0800
MIME-Version: 1.0
In-Reply-To: <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com> <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 9 Feb 2022 17:16:43 -0800
Message-ID: <CAE-0n50FK4FSr6Xau9-UBYk9-0kVrETkCPr8TaDrPGS7BN6pMQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, devicetree@vger.kernel.org, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        krzysztof.kozlowski@canonical.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        robh+dt@kernel.org, sam@ravnborg.org, seanpaul@chromium.org,
        thierry.reding@gmail.com
Cc:     quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        quic_khsieh@quicinc.com, quic_mkrishn@quicinc.com,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-02-09 00:55:31)
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Can you share the edid-decode for this panel here under the cut "---"?
It would help to see the timings and make sure everything matches.
