Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B088FE53B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 19:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfKOSsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 13:48:24 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38567 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfKOSsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 13:48:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id q18so1556791pls.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=X4twp3pctC7VCYEezfWUSk2DKafsbFD6g/B7PxJ7beE=;
        b=isV1GwSykbdCIUh1Sq2o8vQA3iKaQVXo2ALyRNUWZ8d6X0VzM46cePA97/qONQhJ00
         RFJ8tV421WaulCuo3jygFdZGKUKdOYYkry8Skc2I706xbc0HLFhIDEepgOxGqQdmgQS0
         3vfOyfjJdFFH/sFlt9zScWDVH7vA6ecKloMps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=X4twp3pctC7VCYEezfWUSk2DKafsbFD6g/B7PxJ7beE=;
        b=KWnD0uQmz1/Q81Zbxo7nyCTH77Ig15+MI7aDLkDffTP+YSwpNrr3Z5QWQB+N7eNcvQ
         E+JglyoHbHHyyPZqOoNEntATc/8nYGwJbjKT8xhsmqjejOjn4T3Hb8yLEgE/2tmACZZD
         5+1UIULIw7faw7Vg4RbpOd2zbhoLB0XFOTJ+o4tLMUo5FoYv+O9N0/A5BKckMgjMofXn
         lVqGIgySgOXVNp6vd3brzyjGFmE4/3LkV0nrgKgQnmXfG+/4RqPDOdfzqpl8Fct4q8K8
         /mhfs7avncj4joZJ5zxpU+WV9kvLmJkhoUXiTMgDoTYYWeolyXOv8bQ6+hJsnampG500
         QW+A==
X-Gm-Message-State: APjAAAWGxjngiiZI5B5ytU2+0TR/CykSouxI0GBQZDo45Zwo6seuAx6B
        Cxy67eJ6XahviKseiLcMolPzeQ==
X-Google-Smtp-Source: APXvYqzCEHYKTJk35+KbDAqTeknJ92k5jjiweJcm0Q36J9YfJLytr/wLW+RFHHfKHabR4PfHBGRO9g==
X-Received: by 2002:a17:902:8ec6:: with SMTP id x6mr16554556plo.151.1573843701878;
        Fri, 15 Nov 2019 10:48:21 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a26sm11247215pff.155.2019.11.15.10.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:48:21 -0800 (PST)
Message-ID: <5dcef2f5.1c69fb81.ccbc2.1a7e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-2-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-2-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 01/12] irqdomain: add bus token DOMAIN_BUS_WAKEUP
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 10:48:20 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:10)
> A single controller can handle normal interrupts and wake-up interrupts
> independently, with a different numbering space. It is thus crucial to
> allow the driver for such a controller discriminate between the two.
>=20
> A simple way to do so is to tag the wake-up irqdomain with a "bus token"
> that indicates the wake-up domain. This slightly abuses the notion of
> bus, but also radically simplifies the design of such a driver. Between
> two evils, we choose the least damaging.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

