Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E39A44B52D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhKIWPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhKIWPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:15:07 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6CBC061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 14:12:20 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so896752otl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
        b=dUVV+iZ7gYosXBMozkc7vKB1RNOH5oYuxH+4ETASHmsxotjE4SMaeLcPuNuZo3YgLS
         VKqrYcvpOjHVanfYHo2JDTh9TG9fBjUwC/5YUeev8lYij4oN6Dvhmr9g993TWSjfRQXA
         y/Ob41ctB8Ez3blzsLaMRml0A4mz13rP97ljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
        b=Sd3l2yPEgHXABAQGY8/PyE5mamQjujGDCOUX61KtQdn8LlXetdPE+a1MoFdopB/SQt
         llVlWkgYff4uvQgiGjlGaHM3mqPeteyYZzHcxdKFNLRXketMS/tkctNIJDLejaORgNQ7
         FkxALa6RqtdlPKqmBzUcx7fwhdpgJkq5+SOA1zi8h78q58Csrxd7Tf88dx43CsbSEV44
         MD6g/uKQs5MurmiWc1UZcdD1d5Q10Kubvw8RF7oK7F7UD65b3ulNjx+dw2sL8eat0+jZ
         AhK2svPoC8gzzB+FiZnz5z8ivEuaVsnMLLwGJ0oaddq2b+Do0gYeAkbM1VsqzbYss/QC
         pZ4Q==
X-Gm-Message-State: AOAM533Qe15ko29lDwegjsR/jabXLsAWyDdDSptGyMccQae2MqwpYcDc
        Ue6gY6sgCMqppVitKxaJvVk2whj4b8zRY6eIzmHt/A==
X-Google-Smtp-Source: ABdhPJzCxZIvzxfRWv/IW1ZG0J6NJo3QJ4ZuZGIuMdYHfvlxdSbDBBsE6NHiPmYbpRrVGi/S+/NGsMIcLCSrzc29ITI=
X-Received: by 2002:a9d:2f42:: with SMTP id h60mr8342701otb.159.1636495940269;
 Tue, 09 Nov 2021 14:12:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:12:19 +0000
MIME-Version: 1.0
In-Reply-To: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 9 Nov 2021 22:12:19 +0000
Message-ID: <CAE-0n50a5LWpi1JoY=BpwPokpuzYC2c3RXv86Ob_azmdCOkgyw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: use compatible lists to find mdp node
To:     Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_kalyant@quicinc.com, robdclark@gmail.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-11-09 01:47:28)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Use compatible lists instead of duplicate string
>     check (Stephen Boyd)
>
> Changes in v3:
>   - Use match tables to find the mdp node (Stephen Boyd)
> ---

With the export symbol dropped

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
