Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E40A9AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 08:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfIEGxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 02:53:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40672 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfIEGxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 02:53:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so853121pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=X6bK3rfbzFX8967fDBi6v6AmnIt9qDTHKSROdx1Ey68=;
        b=TMOXcAZIxeJNHBrueuJKwf8rRmgsDchSIH08Y8UYbPEz8/ML1fe//YAgKorZGuVkQt
         +qg5tcl4ej3ySxjgGRvHzBszSWI3B8fTOPg6An0WVOwYX1yLkB5tXFC1ASCSCrsLfNvB
         BCGbTcmoeOcIO7DH/TWi+MXOPrCLE1R49vndg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=X6bK3rfbzFX8967fDBi6v6AmnIt9qDTHKSROdx1Ey68=;
        b=QKIBfPGdotMXeqInkUX91LM+O1LgmyKrkKzjfSJtcNjvddGWOvKkc+77aCEaCJTr1K
         xpCKpZeBU3nqAv4ZpmhHskyqN+ljnN6B+c4LKOwGXoeHvy8oSC0ZLqeTj42ggJmVK+ZD
         sw+CZFl/MxvHhiiryPrJd7Km8v2x8JKH6rmdVUEOnuhPTkJ87DVEPxZxiZTKG0Lk3eLQ
         PODRlI50oZBlHLi/U2Mu5aDTggPc94+L7q1kFOmSOHLsbQnfLG783cg/8RjwPozdQnxx
         dqR+42xcdfvXVX9H1nItyAPKTk74ZcYYD6u2pDd3+ZhkWmZpVOigyhy74/lukdrEkbm4
         NJkw==
X-Gm-Message-State: APjAAAWMu/oTCqWOHBFNKqpkJIhiCBfjip9SoDda8MeyzNhuf55Coufv
        7RCsQUGKRS5QlF8rnD/bZIys0m1QqWzr3Q==
X-Google-Smtp-Source: APXvYqzTMrxxPrIHi7PSBcBRZ/WFPRHu9P1fN0ROt0DOaHqZK/np3NsB3NYUIyyL3/gMBfrIsrD/wA==
X-Received: by 2002:a62:1d8a:: with SMTP id d132mr1938054pfd.187.1567666416741;
        Wed, 04 Sep 2019 23:53:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c15sm1254784pfi.172.2019.09.04.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 23:53:36 -0700 (PDT)
Message-ID: <5d70b0f0.1c69fb81.f862a.40e4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190718130238.11324-3-vivek.gautam@codeaurora.org>
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org> <20190718130238.11324-3-vivek.gautam@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: qcom: Rename llcc-slice to llcc-qcom
To:     Vivek Gautam <vivek.gautam@codeaurora.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 23:53:35 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vivek Gautam (2019-07-18 06:02:37)
> The cleaning up was done without changing the driver file name
> to ensure a cleaner bisect. Change the file name now to facilitate
> making the driver generic in subsequent patch.
>=20
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  drivers/soc/qcom/Makefile                      | 2 +-
>  drivers/soc/qcom/{llcc-slice.c =3D> llcc-qcom.c} | 0

qcom/llcc-qcom.c seems sort of redundant. Would have been nice to have
it named llcc.c but I guess the ship has sailed. <sad face>

