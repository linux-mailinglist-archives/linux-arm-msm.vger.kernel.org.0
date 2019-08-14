Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33E08DCDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 20:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfHNSUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 14:20:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36455 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbfHNSUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 14:20:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so3241368pfi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=HxkHOON+igyo/l713j6Etvtbv36U/8Bq7y65v4eKNms=;
        b=UD0SSUoO8aTwyb9kPslWacrUoG5X0bIpq/DyPQGMkaW6VWlMLdvZLMyLYTjjwEMWcT
         mVQU3xE9fr+O2jTiKymOUWUjKIpRGJ9cNzViUfggoZjc3PQRdFcmLvAf2ng6tkHw/rQy
         ZPDMkY+zMLZJzJsbJLqx9EEkJAL1IvjRw5c+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=HxkHOON+igyo/l713j6Etvtbv36U/8Bq7y65v4eKNms=;
        b=J3quyYJS/UXgpA3h33YnfIT3e26kGE+qYEdFTC6Cvj6jB0IEbQX1VLZehIvaxDff+Y
         ldhz7MeJyzsia6apxof7WleUrblcRuu2+ya1cTYbpfo5olDs1tkzSv4VKUuI5x2MQkD+
         BIN/Xm6hXsAuS5/lV5QeSCSUOcwEfDlutTJM+HZhdo8E64BmZ+3JtCPcAHA12KXdXMQP
         50+2a7AmFhd7iV0rBcTMTu8EpxwgHAxO6fNMxNqNG0VcWaikoSiUD5YClEyL0yCaFUny
         crxwvWwsrsddG+PRbeHkarlC9cDE+JTieomNE6U9RrClxL1LColuXFDYwWzTTam4OGfY
         m27Q==
X-Gm-Message-State: APjAAAUAEDCxE3PIAD+3ztyqUAFrm0aljUF70/3pYtAEaVfbV25i+4gl
        EfNf96ttJ3SvLUfqxU3SZSjCoQ==
X-Google-Smtp-Source: APXvYqx6ADpbwi8aZ4KfkLTt9F7fFo35N5KzeXKchu7afafC3jPh4V4FsEqc6P7zhXgJHoohP28bsw==
X-Received: by 2002:a62:5c01:: with SMTP id q1mr1301258pfb.53.1565806851548;
        Wed, 14 Aug 2019 11:20:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z68sm322509pgz.88.2019.08.14.11.20.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 11:20:51 -0700 (PDT)
Message-ID: <5d545103.1c69fb81.5a8c2.0fdb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813082442.25796-3-mkshah@codeaurora.org>
References: <20190813082442.25796-1-mkshah@codeaurora.org> <20190813082442.25796-3-mkshah@codeaurora.org>
Subject: Re: [PATCH 2/4] drivers: qcom: rpmh: remove rpmh_flush export
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, ulf.hansson@linaro.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 11:20:50 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2019-08-13 01:24:40)
> rpmh_flush() was exported with the idea that an external entity
> operation during CPU idle would know when to flush the sleep and wake
> TCS. Since, this is not the case when defining a power domain for the
> RSC. Remove the function export and instead allow the function to be
> called internally.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

