Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53259A9AF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 08:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731211AbfIEG4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 02:56:20 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:34341 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730678AbfIEG4U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 02:56:20 -0400
Received: by mail-pl1-f182.google.com with SMTP id d3so844418plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=kD97/EVwUs7hGEhtRI5cM+0lTbQL7Vks32M4YRn4nes=;
        b=f2rMlOI6tTwlUpDkj66CovnKcTx6AuUUeHc9hOI4VWUSXRKLIxz27UOd5KOENqMiQ7
         dybXYDbJwAIufmq7n1UxvQm/WEPpxLLjaALsxCUkxrnO5W7hamAYRggydmoIH7VoWr3J
         VB93qsszzkcRQ3gnS/rpS3YzCzK8JnFEqgGEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=kD97/EVwUs7hGEhtRI5cM+0lTbQL7Vks32M4YRn4nes=;
        b=ueefhbRKfzDLntHiag0qkjM4dXhcMYEpcBQgPU+tilgAuwbWFn7Eeeq8PKbL1xIZ/3
         2eYunomS9j8PebGAVoEfyUDO9WJs5HIefZnyNpFfzU3D2dEpd3I4rFs+5A/mwX/Y9uuE
         vV2qkSOU3LIjmE+33Cuo6xpjdcziShC4ejQRfov7R6X2WR3M0BvusJg01upDSkEWQGuc
         27f4ohkA/94el0f7/9+AfU0RUA8I8Xm9yvUsithRUWZdUB27NyOY8GcQaWiOGWUU6rC7
         sjwGrTH8PtMqrg64PDPSJWorvnb7yZPpyzDEs0q+kSR9F+a8MTKp8/oYaN/qgQEQVFbm
         x7CQ==
X-Gm-Message-State: APjAAAWwovZRb1NfdO1x9I26kD+Whli+grCn65gQNEvWgkAmMezHmyZE
        JfZ0crLJmVzOSX5zMZPfyElA0g==
X-Google-Smtp-Source: APXvYqzKn1EYDsMpOUWI7sFFZU4cXOjhZbtxWRrgczbEbqf4U+wCl33fGmcpyZGHJD9ZjijclNyYsw==
X-Received: by 2002:a17:902:820a:: with SMTP id x10mr1817462pln.216.1567666579544;
        Wed, 04 Sep 2019 23:56:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n9sm1030819pjq.30.2019.09.04.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 23:56:19 -0700 (PDT)
Message-ID: <5d70b193.1c69fb81.f9ce7.3447@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190905064253.GU26880@dell>
References: <20190903135052.13827-1-lee.jones@linaro.org> <20190904031922.GC574@tuxbook-pro> <20190904084554.GF26880@dell> <20190904182732.GE574@tuxbook-pro> <5d704c9f.1c69fb81.a1686.0eb3@mx.google.com> <20190905064253.GU26880@dell>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
To:     Lee Jones <lee.jones@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 23:56:17 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2019-09-04 23:42:53)
> > > But if this is the one whack left to get the thing to boot then I thi=
nk
> > > we should merge it.
> >=20
> > Agreed.
>=20
> Thanks Stephen.
>=20
> Unless you guys scream loudly, I'm going to convert these to Acks.
>=20
> If you scream softly, I can convert the to Reviewed-bys.
>=20

<in a soft scream>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

