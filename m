Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C132799A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgIZN0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZN0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:26:04 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C56C0613D3;
        Sat, 26 Sep 2020 06:26:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so2329144ejf.6;
        Sat, 26 Sep 2020 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=iNhrMGwGIWBbDoGZGWoSEJfMWmB5YQHEQuMJPe9lY56AtawV0yVvNaB3VRnfE2TupY
         KunhOHiRNTh90u/KVKk6ul6iQvZfZ78r63r4H1AzO0DJ48PUJmbYC9nA/jXWl6pT5oyn
         TE/EHbccwvmS0KlQx5MCU45i7sZOkmbJG/cTiSrRgb/ucw05asr1XbmPLpCbhj7UNzUp
         LkoW2b9kpP9kONvxLptIeyI3jcxHgjHXEhvXQJne2Q1TRLMxGsCI3IbuapfvBIEEnqA9
         p8q+zvyqdIROOtn08seCzeDZOOIHLCkeQ5rfcCev5u5S4zcDtDMH7ho67Q9L8C2ZR/pT
         C9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=J5iJ5GBhcjs4EM+npceBbp5mSyyu9nlAPWM2JgqX4p5Ve/7oYpwLxJ7e6tbOVcuPQm
         RuLAdj1FOD3YFxmEevF8FAbWxCb84vapY9wDGiurjd/QRviEHEEUH72wAJTnYh4CwxGA
         UNz/6HHt0lRxmx60kzOq2DsW8vDaxYy0CSDDm6yevU/rfUWsTbrofTvuWodl4oWG40MD
         1unHHVJXGw4EQ8+3h1OZWqdLDljEwLHp4Zf1OjCP2XFR+zBjaPDo6/S2VoyFelSe//Nj
         Yhs1ZApGdW5NkC+PC9GUAgXxeMlhUa2AU338A8LiDDiQoWOQJ53BMjemBPE5u+KJW+7y
         adCQ==
X-Gm-Message-State: AOAM530ck/ySk0eizlXygcVPrm5c69Zu+EDxDLPZ6CB7TFMlSvmBJMKb
        4A58tpU7LlilshQCNUhLlPz05O5aAk2c0hVDpavxtpoq95I=
X-Google-Smtp-Source: ABdhPJzyoXEjclq6NHbSpX2nockj/wBilv0Yiz3hJvuQtIBj1KJwoJ5yPZilY+Q6Eu7fiJY9nqWKnSVxcIZi0mMoxE8=
X-Received: by 2002:a17:906:6d17:: with SMTP id m23mr2462364ejr.418.1601126763103;
 Sat, 26 Sep 2020 06:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926131157.14633-1-kholk11@gmail.com>
In-Reply-To: <20200926131157.14633-1-kholk11@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sat, 26 Sep 2020 15:25:52 +0200
Message-ID: <CADQ2G_ET0DQv54i3SBWGzTSv0yz3EKwWSdq6eZvVF035K3DghQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
To:     kholk11@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, kishon@ti.com,
        Rob Herring <robh+dt@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested on Xperia 10
Tested-by: Martin Botka <martin.botka1@gmail.com>
