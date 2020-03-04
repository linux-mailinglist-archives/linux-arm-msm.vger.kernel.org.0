Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8DE317959C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 17:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgCDQrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 11:47:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41573 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbgCDQrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 11:47:15 -0500
Received: by mail-pf1-f193.google.com with SMTP id z65so731591pfz.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 08:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=570LeX+h0QI/CfDWXttZgUJ8HCBiGXke7deYDlYUr4Y=;
        b=IN7purPgQ8N64rGTHVjT4ja2mH4kYQM27CjHKxyZkxZiRf0brOCjyUY862YeXhv9Xv
         CeFbSlnkumXNoKAEtA+NRez0L26WHQnbhuFJXs5OWKWch1komOl+pp0LPkhDaS90VcEQ
         vz3px3xKVCInINF88z4OBfS0U1+UcswXskS20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=570LeX+h0QI/CfDWXttZgUJ8HCBiGXke7deYDlYUr4Y=;
        b=jDDfJ4+Ez6cM9tDtWwyNYJSAFe23mcMqk3pOhjsu9nMWlXq6FJhBtyVJjM8yMFcR68
         ES3q70InjXjeGBtpVB8j20efmc+F57BGbu0wdKj51NlL+8exO5gtP1NkqwukYQsJWnYq
         3KtttSKtcYPsKVoi8RNi78eoERkhlWAXCPEMtostaxJSfqvllmm0h0V9JTRDWZX3nNyT
         Ur6aN479NFpILSPYN/cAIpT4lygAV6YGSA6UDrDuFW0c4CWdtttzUnJiI6iOJAE0qrZx
         JWG6Aaf3r3bUgFatgTGnOV8+UOzjpFyCvIqdC/wHk9bu4eZzRtpeumO9ZGLxYzzZBRbd
         xmsw==
X-Gm-Message-State: ANhLgQ3Lx0wbyIxOkoRSznCXqTG1Bhs3/hsU6Xy5vgkpP71qkoYMclqk
        hQKaWjrsUTIIICj0EasP8V0JHA==
X-Google-Smtp-Source: ADFU+vsbsy4KwjftRfu3c64Y4ez2ZG6ys4FKlLIkAg1gF0reXC73oRO0et0606w6YB7a5GpAJygtOQ==
X-Received: by 2002:a63:1e4f:: with SMTP id p15mr3439813pgm.28.1583340432484;
        Wed, 04 Mar 2020 08:47:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i6sm3218494pjt.3.2020.03.04.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:47:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200304112203.408-1-rojay@codeaurora.org>
References: <20200304112203.408-1-rojay@codeaurora.org>
Subject: Re: [PATCH V4] tty: serial: qcom_geni_serial: Fix GPIO swapping with workaround
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
To:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        gregkh@linuxfoundation.org
Date:   Wed, 04 Mar 2020 08:47:11 -0800
Message-ID: <158334043115.7173.15372150537228946372@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-03-04 03:22:03)
> Add capability to support RX-TX, CTS-RTS pins swap in HW.
>=20
> Configure UART_IO_MACRO_CTRL register accordingly if RX-TX pair
> or CTS-RTS pair or both pairs swapped.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
