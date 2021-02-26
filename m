Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F19325B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 01:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhBZAl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 19:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhBZAlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 19:41:22 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF7FC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:40:42 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id l2so5123562pgb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wEaML8KCNtCq/PXIO9BiOe8CWVBSVfAXNbUXFDtW/30=;
        b=oaXIKI/fXvSGZ+kamObpOTTUrtLmxmAlOXARJyixgzRU1cnmxUAY4NQ2GJbrCC64Tk
         hPemgawRJ3fqXV/YOGPlRBXP7lJa29kUZPpCjvKS8oNyaZd/Ocd89etX5l3MZbztT0vN
         KN6RSlkLB2SKZQjKUpU7f1kqvZTOZsrR6DNJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEaML8KCNtCq/PXIO9BiOe8CWVBSVfAXNbUXFDtW/30=;
        b=CYztf1lH+R1GIkJRq+yOQpLV2UTkaD4xFZ8uuIOKxlEjMuPI6ew2+lFgD8e7iXQ1+K
         aAq5VHgyK3GrRXiAbuMWOPlR+Yju2/oIL4R6WROly5eOdfiE+hxrZTXscwy20lerakui
         W2F0KVWu1KRLR6N9D8RFYk3uxQGKqk4aTKwqlv39IGrWErOJcY5bffTGeOvWblqyWeKv
         72pX2oiznpWr/CqsACPOiNK8D5+MItrvFLoAeyMFItb08K3991WF+7gjZ2Q6mcWYHcky
         2z1j1ftWjMrDO8GCtSz25/nCzr3yB7ddLuSCoqxGSJ/7vHZ0OH1Yaezxl1lnLGg8oXCu
         4oxg==
X-Gm-Message-State: AOAM533Oh4pv1ll0q57M517Zk1pa2xfSiPiQ+LQgf7tqnDTYjF8CT0vO
        tYDv8dCFJG2CBi/rnVu+8CCEXA==
X-Google-Smtp-Source: ABdhPJwHFQmhApbH06Zhg6qz15u/YV+AQlBAktrkCfYVcsgMrwi9OU8ab/1zlRBl2i961yAiGoFUWQ==
X-Received: by 2002:a63:1561:: with SMTP id 33mr524733pgv.13.1614300041539;
        Thu, 25 Feb 2021 16:40:41 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id p26sm7680597pfn.127.2021.02.25.16.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 16:40:40 -0800 (PST)
Date:   Thu, 25 Feb 2021 16:40:39 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] arm64: dts: qcom: Add sc7180-lazor-limozeen skus
Message-ID: <YDhDhwXZ5P1/sxzR@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:13:08PM -0800, Douglas Anderson wrote:
> This is a SKU variant of lazor.  Add it.  This squashes the downstream
> patches to support this hardware.
> 
> NOTES:
> - The non-touch SKU actually has "innolux,n116bca" but that driver is
>   still pending in simple-panel.  The bindings have been Acked though.
>   Things work well enough with the "innolux,n116bge" timings for now,
>   though.
> - The wonky special dts just for "-rev4" arguably doesn't need to go
>   upstream since they weren't widely distributed, but since a few
>   people have them we might as well.  If it ever causes problems we
>   can delete it.
> 
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
