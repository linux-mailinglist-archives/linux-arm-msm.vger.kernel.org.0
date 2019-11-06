Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EEDF1B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfKFQi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:38:56 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35137 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbfKFQi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:38:56 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so846936plp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 08:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=qbHs0l3jtZmX9NzpjDPZv6pUiwEN5GpXtvvaXol4cao=;
        b=elm90kH1LW2qo/Ri9hjM8t4+MKU5s46O05+XvvaVzw6Tk6QsGeIhF5YV00+D5pyK55
         rbLM3xgsdw2T/zZmMyOzJRfp9OkfsyRCeVk4+3kkeqjKRYcr3fQz98dGkG2+q1utpaec
         EVpRIF6pFijJyXB+eZpeEwjHMJ6H4NH9ugcJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=qbHs0l3jtZmX9NzpjDPZv6pUiwEN5GpXtvvaXol4cao=;
        b=E0Dnc/UXYLr25ihF8tYU5E9iHXzdeTy7AODHlC+5kb1C3nnJWlOtAOj0Wa5nCcD7XY
         +TXrjHe8FTw8Opx5wBtwYX7l+TiPHcipXJsVD2/eQaWq0pUgVnH//e08n1yWMQ9lxOM9
         Q3F460xnyIBhN5sDpM8DnGV0dQrEXYhhjgrPThkADOMVajbkAZpTFOS8K1H7YgZDBBrP
         EikrK255pq3eFYrOWn9Tov2U55tMAhhwD5I08DQ0A0xJzto1//YC9G6yMNt2e+pRhEEN
         luLW71uOsQ2txjWVojMhpYeRRI0Hup90w4Jrd0JjuKL+N345nqzPOfLh1SUbcE/Yab8q
         OIsQ==
X-Gm-Message-State: APjAAAXK+gU033Gwhw02ILAQp926tuEZsdwq3dt5NzZu4AllrduyzhyT
        cZWNPkafxuJmTHb3gh2G2zX9Lw==
X-Google-Smtp-Source: APXvYqy2RaLyV21hruoJlfiV3tdaUV0LTkmePB8LMLIb7bdevYQZM5ZaXiHbw1o5htY4GWjJdRuScw==
X-Received: by 2002:a17:902:6b88:: with SMTP id p8mr244048plk.336.1573058335243;
        Wed, 06 Nov 2019 08:38:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c9sm35355894pfb.114.2019.11.06.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 08:38:54 -0800 (PST)
Message-ID: <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c4cee81775c6d82024ca05250290f603@codeaurora.org>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org> <5dc1cb4c.1c69fb81.af253.0b8a@mx.google.com> <c4cee81775c6d82024ca05250290f603@codeaurora.org>
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
From:   Stephen Boyd <swboyd@chromium.org>
To:     kgunda@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 08:38:53 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kgunda@codeaurora.org (2019-11-05 22:43:59)
> On 2019-11-06 00:49, Stephen Boyd wrote:
> > Quoting Kiran Gunda (2019-11-04 21:21:49)
> >> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
> >> found on SC7180 based platforms.
> >>=20
> >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> >> ---
> >>  - Changes from V1:
> >>    Sorted the macros and compatibles.
> >=20
> > I don't see anything sorted though.
> >=20
> Sorry .. I might have misunderstood your comment. Let me know if my=20
> understanding is correct.
>=20
> >>>> And compatible here.
> >>> And on macro name here.
>=20
> This means you want to sort all the existing compatible and macros in=20
> alpha numeric order ?

Sorry I also got confused on what the driver is doing. I replied on the
original patch with what is preferred.

