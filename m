Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4AB27999F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIZNXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:23:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC6CC0613CE;
        Sat, 26 Sep 2020 06:23:34 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z23so2264370ejr.13;
        Sat, 26 Sep 2020 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TDwJ/Ookqm6d4qTBt7qPNEM9fVbSO1bXMkKW1KWsMQE=;
        b=lgz10t6A+P3FD3fi4z1ran7y/1bvCvswJY0zUdOvHUyyFx27w573PjPCOP0XWdWGiI
         KnVv7xMMSyEjH3DoG6CyE45DX6U9F16YPTu24oxnP32vY90qNwFBN2GSER0/BMtJRf2U
         t6VVd3IlP5aXMyfF+SYrJDWza0r0wOpFc75zKtJ0xzPfAtzhsZph49DCg9kl9lHTpJSv
         IBC97tSCfE/o7bHRPAL1zYpkTpgpLlX2vZ7GVBD4kapY3VjC2roAZV7hqKR9r8/d7d0i
         BYgDrIRtLvoTuhxUXmN523UDtIfsXZ3rwvGb7rx2L8cYo6ZbkyuK8VYnE9JH5+4uQNHp
         pUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TDwJ/Ookqm6d4qTBt7qPNEM9fVbSO1bXMkKW1KWsMQE=;
        b=KrTLToXGMMRRqi648f3FZGqF+Q/0241mQI5dMqHCARfx4Tlf5TYZjmXheYUUWe5mHY
         tSdbdORLFIkqVWM/Y2aBLgWbBD0/ZFoVDc765ecTLbgF5W9R1/cBtVo9UY65J/q16GTc
         nt+TIxOyJrdTpH+A9u36t9IMnbqyLLyRMDXAqSHscPTMIrTQGR9Yj6jPjMSVkpkrJme2
         rD9inFcBGZsfsbWEPbL/m6+BL6oSuR3zr1djuP31CuEcV4Yj8+92yM2KM1WuTVZ+BozR
         4gvYOHoxlrpnED0nBMlgZThAfXsusr0leDwhI+EGT9f4/zr2XihWQtT+lXQ2xz4gcAAU
         Lcyg==
X-Gm-Message-State: AOAM532XEXNfK3x91gXzP5A+woySDVwqegj0eCxXi9icZDTzdJpuW+8t
        rFr6Owi1KdBVyvJUSJZ29Y+DOQV+UdFTgWSNIe4aTfBw
X-Google-Smtp-Source: ABdhPJw6Kpoagxbxm9cYUIdvpGy4tbKOA0BemF7CwigllilPuJoFY5vVJGj/IJ/CB4hTckKfxgZagYkmhlXZF6nw0UU=
X-Received: by 2002:a17:906:2618:: with SMTP id h24mr7197221ejc.198.1601126613187;
 Sat, 26 Sep 2020 06:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-1-kholk11@gmail.com> <20200926130306.13843-2-kholk11@gmail.com>
In-Reply-To: <20200926130306.13843-2-kholk11@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sat, 26 Sep 2020 15:23:21 +0200
Message-ID: <CADQ2G_GrOhQ8_ow5VwpCcW=m8kDZ6PxRaGT7q+dCvRx87-J=kQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     kholk11@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Martin Botka <martin.botka1@gmail.com>
