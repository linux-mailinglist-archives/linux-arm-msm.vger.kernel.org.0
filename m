Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293431FA3ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 01:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgFOXML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 19:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgFOXMK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 19:12:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0DDC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 16:12:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s88so604222pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=brcjvLKF1tqBCWFby3z+8MOldV/7mW3P5ikqS7XALSA=;
        b=a/H1lS9d3FYn9UhSPXJsrr9Ixza6PpJjH8tSHUvh/CVDtcrK+HwLEfl5AcfQGKk7Yt
         DgkSjxwNcl1kly5pAN0wEFgD8B08fUExsWnorPyLFmvpIBj+R/zkm9nzMFoDzMIv7hC6
         We3UEU2NIbpxqEVOI2R78klemetd7V15D0qk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=brcjvLKF1tqBCWFby3z+8MOldV/7mW3P5ikqS7XALSA=;
        b=LECM4NG7Qn67I+lV+LMB1e++X70KAHpyLXwCeBxVNwdAT9ryG7Pkf7Eq1vxTkHpH2a
         5cvRsvAnwT6mkICbHFIYfElszF1mPEiTC2zYqPln2NmUex80wNloqmyfSkJMl+v8jnH9
         NGsAK64iPb6QHclHukUodnVXAC9D+wXTwzrSiPAejx9eZoOL6vBxUoHBpoYhsd/sCumi
         v1rH/5ZrsXFItEUXqAwt5v94aA+AWCkF2djS6GSGYwwS8vsMQv8HbzV2MWIAhR2dIjhM
         qPO6TyrvMoyIrR2E6XcM9AmD4E5WFcOwx3cOhTlmqrHjNnH8BNsgMW74BBvrSYVzugky
         YOuQ==
X-Gm-Message-State: AOAM5315CdOoymduJlpu+vJL5+1U1frU7EsSd1D1zUBDUlSJT0OXV32J
        OqReKgAYXk/7epZs+V+4LULg6g==
X-Google-Smtp-Source: ABdhPJyyci+2oQlVyjby51mYZoyBYZiTzI2eRXhAYx5ofJPrOzIloyTJpVXRIiOsGGjwxvfH9O22kg==
X-Received: by 2002:a17:90b:3004:: with SMTP id hg4mr266813pjb.208.1592262729649;
        Mon, 15 Jun 2020 16:12:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h3sm513401pje.28.2020.06.15.16.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 16:12:08 -0700 (PDT)
Date:   Mon, 15 Jun 2020 16:12:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, sibis@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V4 1/2] mmc: sdhci-msm: Add interconnect bandwidth
 scaling support
Message-ID: <20200615231207.GX4525@google.com>
References: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org>
 <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 09, 2020 at 02:07:25PM +0530, Pradeep P V K wrote:
> Interconnect bandwidth scaling support is now added as a
> part of OPP. So, make sure interconnect driver is ready
> before handling interconnect scaling.
> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Do you plan to send also patches that add the necessary DT entries?
I'm particularly interested in SC7180.
