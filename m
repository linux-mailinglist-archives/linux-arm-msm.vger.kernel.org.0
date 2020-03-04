Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D3117997F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 21:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgCDUJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 15:09:19 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51102 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgCDUJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 15:09:19 -0500
Received: by mail-pj1-f68.google.com with SMTP id nm6so1386069pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 12:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fVWrQMKbqoplD/Oaam0FvwkWhjl3efFR5VHZCGG6srw=;
        b=iebuqWBLS90Q0BVU+DK0De6ptXlRQjnPB0svrq3P4UJTfK4QZfGKt/A9ZBZUrGY1lb
         YQuMO0IXaZp+RAfhXCcP/GWxAifDASDigA+F3izTmsah9uD0rgMiweHlxIpST3v2CqUg
         nB78HVlmRV+sPQT3v3fcu/Li3EOUh8jYKO0b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fVWrQMKbqoplD/Oaam0FvwkWhjl3efFR5VHZCGG6srw=;
        b=i6+B/Fz4Hg5t8AQ51XywgqzFlDY42YlZd8oa2lwfMu8zehuxxQE0lbQSIi3YQLLBsg
         inDLaCfv/SUGXc1qGWTOeJ5t/+66x+82TTuxsm7Ak7C91BBjhlO0D9W08+2TIV4G5CR7
         kd0Ve/w9/WkUYBqNHEvI32gVPs0iU7+dgMuQJ5eeeN3+10NrgAV8vG6QvH3TlVO+TKeP
         iy68PR8K3AWhhwOUicdMvHnX06L41dZt463fAyZwxmMhsi9ObFpADUfQd+HCrXv2zjhu
         9H+6SHVT8ykBqAsUlL6Ah5gvVVQzyT6VzP7XMWpC9Uu5T6iezLG/TEVvWZvV+EXL5pBO
         3Ibg==
X-Gm-Message-State: ANhLgQ224ULcAmnxDwKoVt+2MGeh5I4TmfxgXcgCWAJ9ZZaHFyKQHGGv
        JTZ7ge2akK3LG/qcWpsX9ktgRQ==
X-Google-Smtp-Source: ADFU+vtd3GdGpgyioHfDLBVA7YkNLG9EwP9nP8h+HafEWaxUAHmypsiAgcV7a3VG78CgJbbV0nFZIQ==
X-Received: by 2002:a17:90a:b381:: with SMTP id e1mr4675544pjr.38.1583352558596;
        Wed, 04 Mar 2020 12:09:18 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w7sm12798393pfj.167.2020.03.04.12.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 12:09:17 -0800 (PST)
Date:   Wed, 4 Mar 2020 12:09:16 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4] tty: serial: qcom_geni_serial: Fix GPIO swapping with
 workaround
Message-ID: <20200304200916.GS24720@google.com>
References: <20200304112203.408-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200304112203.408-1-rojay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 04, 2020 at 04:52:03PM +0530, Roja Rani Yarubandi wrote:
> Add capability to support RX-TX, CTS-RTS pins swap in HW.
> 
> Configure UART_IO_MACRO_CTRL register accordingly if RX-TX pair
> or CTS-RTS pair or both pairs swapped.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Please make sure to collect tags from previous versions (unless there are
major changes), like Stephens 'Reviewed-by' or my 'Tested-by'.

Tested-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
