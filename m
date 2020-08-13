Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AD8243461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 09:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgHMHIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 03:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbgHMHIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 03:08:17 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE8FC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 00:08:17 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id m71so2355348pfd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 00:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oXHNkcnjdKbtST/Cm72EMU54y/enkmsrbD67DAs+07Q=;
        b=Fklxr+GNMBRv9AdOmZve+uLJ4LVS10Wd3Efz0ihbZTLMTOPOgReJJykQoZcjwpyjjS
         d4rRk8uWKwlA8L0irHe9fQ+OspRENYO6F/zcD9N/Mlxe4qKRj4EGAhNVUA8nl1b9969x
         tjZWGCjF6mJmHcYf5Y5y3Jb2zwct9S+zg1BSwNwGmOjkHim50IkRMlgAhdmJqNqCjlqO
         VME/tlWH6CN8XMVXFHBLEBlJGUVmRPf5nIVitK+qSrEW+YLa2AdGrWldO53L2xn6d3a6
         hx9/RDRBygqotoV08G4c9S8WQs00HkQy9YbiChcAzlnvXkACAF33vSzFNnJCojz62lJU
         ZqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oXHNkcnjdKbtST/Cm72EMU54y/enkmsrbD67DAs+07Q=;
        b=B/c7z5dPa7jWtTZOg1YkbplJlz0iQT3D7q1g86YpZLberABX4J+7foHHNNLBrBjl1w
         tsrWUJuMe+ED5vzzHCs+zkc8BUyk0Ch4gQCdQbi8apI5O9z34vEcauLRx2QU0uA1Jfhj
         xsLlFuDLTgHpU5stnzzV+K2nDelK+C9v0ST67ccmeaUFKReFp9oqniaWz6SCyvjNAy41
         h6dybCe8AFtF9ICOR0XHmcAtzgrmAdQbX3YSuNBSqlTd6V4P37ykiMVhvxVRouq1f3XK
         bTYG5l9BhsG4iV+HW2OG7PEugihxJrV9UfxvRuHdc2slSr5OsA6yi6gFwlEx3VOltQZF
         +u1A==
X-Gm-Message-State: AOAM5329L8jJ5Y+u6ZBgNyvQ3R+WNZz37hLSqrXxSCncG+MFet7Snme2
        nt8xYLpt4A6GCjqQq/K4V0UU+w==
X-Google-Smtp-Source: ABdhPJy5mTa6bjpMvZNEqyus64np+Q1hqEXWGxyB6FdFHAaKwxpJXm138hVyyVcESnvJqC/jue2U6g==
X-Received: by 2002:a62:2e45:: with SMTP id u66mr3107106pfu.121.1597302496590;
        Thu, 13 Aug 2020 00:08:16 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t10sm4260202pgp.15.2020.08.13.00.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 00:08:15 -0700 (PDT)
Date:   Thu, 13 Aug 2020 00:04:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     amit.pundir@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, john.stultz@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sumit.semwal@linaro.org
Subject: Re: your mail
Message-ID: <20200813070448.GA499758@builder.lan>
References: <CAMi1Hd3Dv_T7kgThLTk2QLtfS7LBvhJ5R=6C3seUYK0GvNV6eA@mail.gmail.com>
 <20200806223134.42748-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806223134.42748-1-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Aug 15:31 PDT 2020, Konrad Dybcio wrote:

> Subject: Re: [PATCH v4] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
> 
> >// This removed_region is needed to boot the device
> >               // TODO: Find out the user of this reserved memory
> >               removed_region: memory@88f00000 {
> 
> This region seems to belong to the Trust Zone. When Linux tries to access it, TZ bites and shuts the device down.
> 

This is in line with what the documentation indicates and then it would
be better to just bump &tz_mem to a size of 0x4900000.

Regards,
Bjorn
