Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A6531E7A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 09:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhBRIuJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 03:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhBRIta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 03:49:30 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBCFC06178B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 00:48:50 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id k22so873054pll.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5V1dhMz49FBbfbFJI2tpYTF5MVo+s3zgUy0K5VPiR4o=;
        b=SMYKL3rdCwOCRSemhKAk0Bi3POUbxr8tuzIIcTwf4oF+HkrTWpgFFTZqK25UpiiGZg
         7IAtw6NJR4wVDtdc/WRWmyGkNqkLm2CvO585jawp5SAfmzDrYDGZpWklrcNjBvHjPlD3
         qbyFQqFkXmFQUqW7mJq1AEo7Jo6loSl7ygP2PQdGqR5VFXeuvhWrS88QRjukJnDcuLFt
         bKE0Fpr5n6fG6GX16PY98WH+crByHTNIgSvOtOJrT3Uuwb/GAvnxJpt9P04dr+wUCond
         8o+UCRVEs0lAkN/MFPygRx1oWBPdB0jGRad8iCfjVU+KJ+XPykPEPj/Q8ijCE/mzKoZz
         86Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5V1dhMz49FBbfbFJI2tpYTF5MVo+s3zgUy0K5VPiR4o=;
        b=O1a9cowsHxY0MV/sboMBvYcmxy+MGw02NO/x+MNkqZNXEHiXPVYqXD/A5WbnVgC3q0
         JEefQRkQ9+6PQwGAx/lBYPFZUUeD6+kRLhWcXxYoyTGtEOLGQ5V3EKe/nSuEdgUbz0Xe
         oYR+a05AkF+ybSWCSVuH2vIrxPiKkz77fyFVe75zPwjTVb/5YBobYBaIWra/sBYM88Mg
         EZ1pYbDEz7C56BuSmK/VaA+tx5sej/nEYxbZ3yaRYF1h72a6pBLZjpReCgfXbh6oS5Ba
         S7508EsgZDuy268W8cOtX1sCW4k9VnOwTWgLACtYx0rrBot0lcD5h0wjbjRN2nHjyb0f
         u7gg==
X-Gm-Message-State: AOAM530Ll4JW+66B7xZNsNOljxEcZbmZaTO1f92r0ebfxDrO63Rhrrs3
        dJ4iCgk3q8Gi3GZKipP9JToUjQ==
X-Google-Smtp-Source: ABdhPJwQzMQEQHeUP0SWs/zHqqmTL2W9ZrTk6OG29IwBDBRBEVQcu/fZ4fXs++FfQLe1eghBKfTGTA==
X-Received: by 2002:a17:902:7b89:b029:e1:1b46:bcec with SMTP id w9-20020a1709027b89b02900e11b46bcecmr3321594pll.5.1613638129948;
        Thu, 18 Feb 2021 00:48:49 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id u20sm4960335pjy.36.2021.02.18.00.48.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 00:48:49 -0800 (PST)
Date:   Thu, 18 Feb 2021 14:18:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     rjw@rjwysocki.net, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: exclude boost frequencies from valid count if
 not enabled
Message-ID: <20210218084847.743rttqwlmwyx6pz@vireshk-i7>
References: <20210217000013.4063289-1-thara.gopinath@linaro.org>
 <20210217055029.a25wjsyoosxageti@vireshk-i7>
 <4c9d9d44-5fa5-3ae1-e9bb-45cf6521b764@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c9d9d44-5fa5-3ae1-e9bb-45cf6521b764@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-21, 10:32, Thara Gopinath wrote:
> First of all, I am still unable to find this setting in the sysfs space.

The driver needs to call cpufreq_enable_boost_support() for that.

> Irrespective the ideal behavior here will be to change the cpufreq cooling
> dev max state when this happens.

Hmm.. recreating it every time boost frequency is enabled is like
inviting trouble and it will be tricky. Maybe it can be done, I don't
know.:)

-- 
viresh
