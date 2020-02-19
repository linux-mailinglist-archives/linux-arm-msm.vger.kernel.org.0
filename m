Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2ED1652C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 23:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBSWyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 17:54:52 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55646 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbgBSWyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 17:54:51 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so4599pjz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 14:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gAAaumqYIWK1r6Wc40UnUA72PdD5YfOwATHdty8pLNM=;
        b=U9ssDP3iopMhkc0fGFmgcEWKMR9NdKLFDjPfwOkpPj0ihd1gTFbc5C5gYcL8RW7Hbf
         cOp+Mst4AdL8f/RZ0MMMbOtddAbK0VaZORxXpV0KWQuuCzuXeZNj0ELdVJrKzaZxpIyl
         OXvwQNltns5cUUXX0UtkBexfx+pbD8Jquo9uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gAAaumqYIWK1r6Wc40UnUA72PdD5YfOwATHdty8pLNM=;
        b=Zsd/4UbBj9VJ2wEXYKLSsLqjfvHSixfroNtQjdP/A/dJ7fSciOpsjIjT1kuT0aBLFp
         1T5+GbCk9VyGr6tT2cI5C3HQHNHO8gq8U85VR1GbmaxxBos79dHq+1oqis5AqiLUks0M
         iGOoT0HmBQI+SrRB/c5Nhz+MfhJ1rQrrSbkJh/biCATLKA/Gorf0Iw62Ne19ZvraGaHB
         seKjSUdRCmxpdpSFairpwUnm11MDovepIzQNcdfFgK9GGFJLL+cDzBkuNEcuvrXkkmKT
         5o5u9QpF9Zm3MrlCbXkO2SBWCdRZfNBFZNurD07D+FYR66HxPakhBPW/MLffAkS/wyaw
         zc/Q==
X-Gm-Message-State: APjAAAW4R5vEz7Da6HUeN3aNTmd6fThzlM1SCv/4gqVzRI7HhLdW1IQz
        STtTS6smBJF911jp8vDVEes5rQ==
X-Google-Smtp-Source: APXvYqzSKpdk8pkApBBqNrjyPAGxS77LNhITRpxYsSt0GkVb7Mrna64ELgb03Juesjnyn8Gj6rVD3Q==
X-Received: by 2002:a17:902:7b94:: with SMTP id w20mr28153885pll.257.1582152891216;
        Wed, 19 Feb 2020 14:54:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r11sm778107pgi.9.2020.02.19.14.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:54:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <57f5fd302213d30b53d9d6b3624758180e8df48b.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org> <57f5fd302213d30b53d9d6b3624758180e8df48b.1582048155.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH v5 2/8] drivers: thermal: tsens: Pass around struct tsens_sensor as a constant
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org
Date:   Wed, 19 Feb 2020 14:54:50 -0800
Message-ID: <158215289002.184098.18143863253451092907@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2020-02-18 10:12:06)
> All the sensor data is initialised at init time. Lock it down by passing
> it to functions as a constant.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
