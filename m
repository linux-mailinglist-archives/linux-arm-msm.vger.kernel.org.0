Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8F11CFF32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 22:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgELU0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 16:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729215AbgELU0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 16:26:49 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBF0C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:26:47 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id r14so6933460pfg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=H1+2swSK0ijtdladJlvxa7bbEzZPqsR62nbBx9yOv3g=;
        b=JE/V+wE1UITbWdIxoFhww9gWKZXunG95YOlUyT/vk3cKWXiI7WS4hSgNdGFYXXeWq4
         qbOqyh6cY6JFc4Ex7PSmIGIeMoXilx3K1YD1zTSnxGNYkBKxlRfntW38VgCWgbQcsm+k
         b/iBEbYxUFXZLSqtef+YbXCHzwcFceN52RCCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=H1+2swSK0ijtdladJlvxa7bbEzZPqsR62nbBx9yOv3g=;
        b=AGnbvnnftx+VYr+MwPh5QoenkzIUXx/VyneHaYmMOXc7WoFe2ZpxzU4okGgvAkMLxk
         CD4mFFBRZnb899LBslklaQdryTjjz4JIS5Uanbz+OHPCg813iYsJMUVM2DvJLeoloyx9
         xEEwR01ZnqEoyI3xnfYrRJg4c/FkmkVhMgys4r9ve8+G+Km3IRA5/SjLKkJyaEgsIQtm
         JghKwWuVfu++3uNd3tw1EZ55JTqnXpl/DUt+DbZwDPPTloLgzAVaLhrCbqJeg8YSMtwJ
         4Bdg6EinP4iGO43dhYEZvkaNb0heMNeGZFhDsLgstF+CmXG/Q47FurpwaEjMBMoMxClz
         wM7g==
X-Gm-Message-State: AGi0PuYQJUNWQTZwXIw9vSWDbTYnpKAeQbjC/3ioGQsNq6blDpninnK/
        /nPTzmvF0QHOt516t8x7CmTMqA==
X-Google-Smtp-Source: APiQypLe8sd80AjBjKfNOmw9eKS5QoYDfT462qPcJ4ychbs6jqUvUTNFyPQJKYLB8FBDLFHSBXQeyQ==
X-Received: by 2002:a63:4f0f:: with SMTP id d15mr20990453pgb.339.1589315207257;
        Tue, 12 May 2020 13:26:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w69sm12692970pff.168.2020.05.12.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:26:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200422090443.12529-1-harigovi@codeaurora.org>
References: <20200422090443.12529-1-harigovi@codeaurora.org>
Subject: Re: [v1] drm/bridge: ensure bridge suspend happens during PM sleep
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org,
        dianders@chromium.org
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Tue, 12 May 2020 13:26:45 -0700
Message-ID: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The subject is not specific enough. I'd expect it to be something like:

drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep

Quoting Harigovindan P (2020-04-22 02:04:43)
> ti-sn65dsi86 bridge is enumerated as a runtime device.
>=20
> Adding sleep ops to force runtime_suspend when PM suspend is
> requested on the device.
>=20
> This change needs to be taken along with the series:
> https://patchwork.kernel.org/patch/11494309/

Why? It doesn't seem like it should be required to go along with a qcom
specific driver patch.

>=20
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---

Besides the subject:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
