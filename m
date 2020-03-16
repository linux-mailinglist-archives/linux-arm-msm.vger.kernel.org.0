Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CE11870C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731884AbgCPRAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:00:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36055 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731785AbgCPRAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:00:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id z72so240788pgz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
        b=K7kVjtB+7y4URjn4G1hvdMzn78WcrIP9Oz7RSUfwUDvU/XnO2byPqav/Is3jiUWUkB
         W86Xg8p06VavshPMBHqPziU3vXTiy7N48VTAL2j/s2lTWb9lq92j1IU/quTDDTv6S2fu
         DEgpMw1cMNqIxgev0hk/hR3tQhU9JDTDTTbyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
        b=boj4qk6F5gAbd99bEJiv4cQynTtmn10AZzpvR2FyQSLMO1MZpaYy7/ozdta21hWfoI
         Fmj/N7SnyOYaO0KlkcXdPKcu4ylqM7JKu6tsSnY+0+TvF602bb6m72IvLoZrNYOOdzlJ
         BQOXfgnOTUkUPK1LhnoZVcDjcyeU8TxeW8spuGF/zreGQ2I00Wy2gLsKCDwxcmXysDRb
         VhbbJkUcfrSOEWyZt05jkkRV4nEGbmbJ5OXSOQJPIXFIi6f+qSbfsC/A5vtQhoWvYhvL
         QFpX1WTaMtkSC8f8K+UgDS1EoTBUt9VIWHQRb1wsg5zH/noPR5yx59xAGjZQpxB3uJz3
         tqAA==
X-Gm-Message-State: ANhLgQ1MHalGNjliBSjUt0hy0TRCoBxr6bg7qQfDPsaXZeCZsy8P11DO
        FsJ/rT5n8UT5izx4l8Mz+UyG7g==
X-Google-Smtp-Source: ADFU+vv9s0qOxourNNI2GtsjQWv3rsuzY2mQKW8R2dZ8kWjwvGLWsHZAnNuynD6l0oAx3VizaNsAAA==
X-Received: by 2002:a65:678e:: with SMTP id e14mr669453pgr.299.1584378022722;
        Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u126sm407308pfu.182.2020.03.16.10.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Date:   Mon, 16 Mar 2020 10:00:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v7 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200316170020.GO144492@google.com>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 16, 2020 at 09:46:47AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
