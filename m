Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE8DDFF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 20:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfJTSUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 14:20:41 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:34814 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfJTSUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 14:20:41 -0400
Received: by mail-pf1-f169.google.com with SMTP id b128so6902168pfa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=Vtq1cPbHIup3PI1Pklqt+T3Wejcx/hjFTg1OvfYHiqc=;
        b=l7u/BpbSbNqw5fVEJyHYDtg4FMxHVm+Bc7/mpfTyfURwUnheRWErIGThqwGUAH6Q30
         AHNKI7HTOo/RKSzMgXIXSYChyFKiqC1tOcWfdHTlqsiRAnBdhwcyBVagsDl8Xj+xn7zO
         +Y37at/WVr2v3llqflDEwhQyfG+O/RYdKckCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=Vtq1cPbHIup3PI1Pklqt+T3Wejcx/hjFTg1OvfYHiqc=;
        b=NjeeFFJNlkif8YxoysbT1vQ7Y6YDZRi2KeXUnJVP9RzzKeKhqCig4I7HyC9hC7Aymt
         ifBiXcWBOgPBfX2a/VzlyzPlsstMYShzBO+y/jF5+HAvc9MmwWoRUd1U19CJLuHRz5VZ
         P0lepwV8zeWarercabFA+5gJNE/b+Sip6wRQ8dcnoEpOjrFr7zD27Vj1sSdZpai2KUwn
         PElgXMgfnVvkuwuCAwnLu+KDJ5pn9acu2Sc7KiqMhv94N+rw/3Fi25ItSK1fhmyVYrdP
         nb7B4uyTMuGO6loTAO/nWba+Ang9yvWvYbQjdQBkHke042wxyCrkzujHDIKZ9lwBD/Xh
         F4Ww==
X-Gm-Message-State: APjAAAWoZQrH8O6hydjDrZgX6bYLTdIUZVSSQIzFiADPaIBDtFqoi49x
        WnfEW3TRDqfB8fWz3p7L98j/eQ==
X-Google-Smtp-Source: APXvYqygRiNNt9TOyeQgTpYIcVsl3b06KRb38CZLx2jIA84O5k/K6VZjZKpIgvc8kokWWIPQgivzTg==
X-Received: by 2002:a62:ac02:: with SMTP id v2mr17810962pfe.200.1571595640853;
        Sun, 20 Oct 2019 11:20:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i190sm13648751pgc.93.2019.10.20.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 11:20:39 -0700 (PDT)
Message-ID: <5daca577.1c69fb81.1e7d3.20d3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <de1bc7fe1edef4b43a2043fcfb20ec536285d344.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <de1bc7fe1edef4b43a2043fcfb20ec536285d344.1571484439.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 3/3] dt-bindings: msm: Add LLCC for SC7180
User-Agent: alot/0.8.1
Date:   Sun, 20 Oct 2019 11:20:39 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-19 04:37:13)
> Add LLCC compatible for SC7180 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

