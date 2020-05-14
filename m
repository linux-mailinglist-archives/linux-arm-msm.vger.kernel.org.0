Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB21F1D2503
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 04:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgENCDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 22:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbgENCDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 22:03:37 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103EAC061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 19:03:36 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u22so554127plq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+Hy6KD9Nm/Qwl13ykTv+/eNrz6cvZq6NKKJKymwmJU0=;
        b=V9LrfOjlTeekn/bLRW4LWH6a9yCcqFigmv2EMGXqmrH58Xy7+l3jx1JvBJqrkAWg0E
         NAylfXmzwU9Beq3qXEvjLvQasP+9pBMzMQ5ONlY/fOREfUOo3MaCZoENlQDe1F5snUN4
         DqDqq3XyObV+DVObDb4dzY5LKba6GnL/J6gyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+Hy6KD9Nm/Qwl13ykTv+/eNrz6cvZq6NKKJKymwmJU0=;
        b=Qbdn3hFaI0WtUKaEUrpNSzzKyXA4ccJRTe0M8BnvVIulTJ63vbVZ6nhbZuCqvgkaXT
         bXmVPBPUSQGVgeIbKAwL21C9zvl+HdPsk9lnZ+UsE6fPiVonePBrmNmRNV1Pfkcn180i
         CkM2Up/z3CMnyirwpx0yAYrexumURt/SSWu8IW2lDmW5tFt/Ndyfd0nu8H2TyhFSZAQ7
         fkj6feiXZJrlkBHmjY+CGtWZONLyZvSsc/T70xxeLSAF1wlF38t5rH2O8nN/xweSHCdd
         dIceNkCpmeVlG9wZ1ABfSiCUN4L8BwASyJbeDAWKRWKeSZ6E16DiBWTaFkq8wCH1Ahfb
         VtqA==
X-Gm-Message-State: AOAM531oHG//GNHQ2tcOPQ+Jf/DVLRvA06vzhMpA5HbKwkP7t5b/sNU9
        GrIeSoRVCkcdmmjRebLaVheGjej/Z2E=
X-Google-Smtp-Source: ABdhPJyDZxeGFxcpqljfUPCzcdVkPYpzexD1KXBEYWxGrAW0le/qPFxdtT/oXasMhDAH41fgSaT3Iw==
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr1904826plo.306.1589421814061;
        Wed, 13 May 2020 19:03:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d35sm813740pgd.29.2020.05.13.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 19:03:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH V6 0/3] Convert QUP bindings to YAML and add ICC, pin swap doc
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Date:   Wed, 13 May 2020 19:03:32 -0700
Message-ID: <158942181222.215346.11981864062704009851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2020-05-07 08:00:44)
> Changes in V6:
>  - As per Rob's suggestion moved pin swap documentation from QUP to
>    serial.yaml file[PATCH V6 3/3].
>=20
> Changes in V4:
>  - Add interconnect binding patch.
>  - Add UART pin swap binding patch.
>=20
> Akash Asthana (3):
>   dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
>   dt-bindings: geni-se: Add interconnect binding for GENI QUP
>   dt-bindings: serial: Add binding for UART pin swap
>=20

Who do you intend to pick up these patches? Rob or Greg? I suppose if
it's all in bindings then maybe Rob can pick them up.
