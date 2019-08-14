Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D57408DC87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbfHNR7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:59:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38297 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfHNR7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:59:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so2898011pga.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=kF2rSGg7TWdsph3+jKGWM5Z90AAtcPpo25Mf5csWFrU=;
        b=Zc/RhUNaKUH6TKfhRZWBo6OBqnN6wsyVNMAXjBgiNUtQxZoaGMZ+qifnZYFCHOtQNq
         93B6SETP1TqUWc7SCQ5mY3c3gtiWJs3r/RoBFb0OerUawl9ihfJgTVV4pxnTZyN7Uy7w
         41upxhquofjg2gVE6AG70o1y8XyTA+QyHCgLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=kF2rSGg7TWdsph3+jKGWM5Z90AAtcPpo25Mf5csWFrU=;
        b=Mz3GkoNy/cfd6Or4ubKU48KXbOMH/UtWN7mDusJ6wE30+SZbrtW4K1eUkL+xVFLdW+
         dg0FQwJIH6bOLNpdgQVbNfJtbzD0280LJ42XQtpvhU1CVhm1K9zNm/knLY/VxT7s80xo
         MhTXEtD4uodzgXIfT70VAcHkVKXG0sDdE+5VS7Lxx2ThiZOttScBhJHIlUA3GFtOPZCk
         enepvltUNl3+ygOmfXJeVKkfFIInt/N7F0aClLi6BWchtH1RwlXgi0x2tjx0p1i/Rkbd
         vyDYVGHudpn3laDzE+iz976uCnQ1Tf3hl71DI8PClkx82Lsm4aHIaG2/3Eob2epFCK8a
         9o2w==
X-Gm-Message-State: APjAAAU3hdCZQ3bY7q175Or8jT/2oJt/uuVfdlTF/GT30G2bj46Ve6FW
        /jSQl/606LIgWwxgTn6fRgSfiw==
X-Google-Smtp-Source: APXvYqzlhFg/syHBm6u3NkrWSTkdwA/nnqbqnwh5uAmEwTa/NV7gwIbeSWeDmlMEvcDq5rUej/oTTg==
X-Received: by 2002:a17:90a:7d09:: with SMTP id g9mr903391pjl.38.1565805584194;
        Wed, 14 Aug 2019 10:59:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f72sm486217pjg.10.2019.08.14.10.59.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 10:59:43 -0700 (PDT)
Message-ID: <5d544c0f.1c69fb81.a78d3.1381@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813082442.25796-2-mkshah@codeaurora.org>
References: <20190813082442.25796-1-mkshah@codeaurora.org> <20190813082442.25796-2-mkshah@codeaurora.org>
Subject: Re: [PATCH 1/4] drivers: qcom: rpmh: fix macro to accept NULL argument
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, ulf.hansson@linaro.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:59:42 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2019-08-13 01:24:39)
> Device argument matches with dev variable declared in RPMH message.
> Compiler reports error when the argument is NULL since the argument
> matches the name of the property. Rename dev argument to device to
> fix this.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Maybe this should have a Fixes tag? And the subject could be something
like "avoid shadowing local variables in macro"?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


