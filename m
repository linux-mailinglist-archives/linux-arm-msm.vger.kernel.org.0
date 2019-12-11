Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE8B11B962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 17:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfLKQ6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 11:58:31 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41834 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbfLKQ6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 11:58:31 -0500
Received: by mail-pl1-f196.google.com with SMTP id bd4so1643549plb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=nO1/D6YzLDQJru2EbIZiTMpHKIQ1x4Kj5OM8Yf3k2jA=;
        b=X76wqWSKPn8j7rqfA4HXB8cSCWi8CSmRC2ja0st603SooTirVgKPZJ5HCqmZe8CDSV
         mU2wKAJi6RWyXkcs/9dh2qYRY7CK4dak4+yAAJavfhkyihZrz2CuccNTmvgdskUIeHGD
         Vkol4s7L21nmcjHhaqOc8TUCS6R1jbOAg9czI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=nO1/D6YzLDQJru2EbIZiTMpHKIQ1x4Kj5OM8Yf3k2jA=;
        b=Ed5kl6WYSrbkQsJmzAIsbdfN+3hIEvK5jszLdZ3PP+jhONIIRWJ1Gnozt/7URFQtJA
         9V4AOetg8ESEpbV/GuMDz0z1jSYxuLh4SiMEb+XowqwI3kGX+O8+DQpEveHEKo0iBWbB
         zlCt5wFnGkY8VhzkhEHhkYfDqg28XFmWHbkFLuBualaFgBoQ8JViXT63RzIGBt6GdAM7
         QktwZNA3S5PWpGk2yhlfQ+oF2ti7S7V33YPxId6F0ShjuvygM48q5xt59+kIrWRZ6u0M
         81/sYk5hgTUzixLPV9j2/pxK7kHb5NjlxwEWW1g31crqirIJcbZGk1VSsEMjzEMOVrMR
         Zslg==
X-Gm-Message-State: APjAAAU9CPoI9s3N5yQm5uRSF8GRHiwK07++fzbZEP2SeZ08MHvRQ5ta
        CEarYK7W1vUEqpUFCyKziKCbwQ==
X-Google-Smtp-Source: APXvYqzJgsV3DYCq9QJ4kxgM5GvK71kUpfoKmzn7rSTO7KmV71ONqmrQjqh3AE2WNpSbFEXBobEjig==
X-Received: by 2002:a17:902:a615:: with SMTP id u21mr4467398plq.44.1576083510879;
        Wed, 11 Dec 2019 08:58:30 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u5sm3612263pfm.115.2019.12.11.08.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 08:58:30 -0800 (PST)
Message-ID: <5df12036.1c69fb81.bdb18.8c4f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016ef3cdac32-1353f7d8-b973-4881-86ec-589d50849765-000000@us-west-2.amazonses.com>
References: <0101016ef3cdac32-1353f7d8-b973-4881-86ec-589d50849765-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Remove additional spi chip select muxes
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 11 Dec 2019 08:58:29 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-12-10 23:12:52)
> remove the additional CS muxes that were added by default for
> spi so every board using sc7180 does not have to override it.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

