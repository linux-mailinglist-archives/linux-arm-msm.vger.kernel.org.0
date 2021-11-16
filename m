Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130B4453632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 16:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238524AbhKPPp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 10:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbhKPPpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 10:45:19 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834E0C06120E
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 07:42:19 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r8so38352107wra.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MaOSO/5HtReWKBBksqBOQJDhfTRE2n/pBGJORKYgmI8=;
        b=dpMihBVSiTIhJ8gwEIK/0RaxfyXs2DtvxfMOWHwvsfqgQpUny0lQtED0wIphEPCb6v
         AEzTzY5KUWh+ZBUlwhm1MKOSsfEKvWzAZN6hA0iVz1ZkNSHET0GNQ7X4qOZ4ru7PoXmg
         a/08/a6OGQp4ufg1hfyxfYLxOjuSPoP4Iv2indtDuuY25uHOzB4zY/j/Htu2gPPN48F8
         +FDsCnukvP5bxxuyqV5df/R9Dld2m5MFGmv/6quqjj8jagtwmzBL49QLLLkaiJPMV3TB
         utBJFccrrLjAw31i2P+rtb2jHXojpAt5V88ehKxTw8pEyulGHnLBAJQgM7JuB/O0nT8J
         yzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MaOSO/5HtReWKBBksqBOQJDhfTRE2n/pBGJORKYgmI8=;
        b=j+7rDwA4J2bw/xKLcsvDcfRKQa7iLE551KTNxQxd6DE6JdNW5V43WVkT8r4+g4zZiZ
         8huCVY5fc5I55fP9mumUu6AZCU1aFxFEJwUgN87GF8mL8RcIpnRC5sxkFsU2jqEsVPs7
         YIJGP0PrlMMTAeZmO8CKsyEqL6btrYWSUY0O+bFdIfuo0KThmBOB3StEVDFlZmztMQZz
         CXC05G02qqCgVbiLiP+Z1fnYeGsmRno9ryTQzWQzR0B9FvAQCXPTisiNivNffRlQOsVF
         Y91QemrOUKrzUqTiSHOOnVJKz+3AuyZpdT3ChwIZKNYnmcqCPz3hExpxPt70LwGYQJ2P
         eouw==
X-Gm-Message-State: AOAM532X0w6LlNQm7nbt66CXI6eP3JhloXSoC23kKXwHzDhR3vGSTWRB
        UitQPQ8wU4Jn/pBt6VDw+85Mxg==
X-Google-Smtp-Source: ABdhPJwGazAeHXqWI2KmcXg8HN2YudpmutPJQ1rdklClDDMa6uJ9nc+mW3BEpIrYrJ5e6pEnv6kpCA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr10447721wrv.73.1637077337983;
        Tue, 16 Nov 2021 07:42:17 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id q4sm17892469wrs.56.2021.11.16.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:42:17 -0800 (PST)
Date:   Tue, 16 Nov 2021 15:42:15 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling
 of enabled-strings
Message-ID: <YZPRV2jD1EBYGdHL@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Nov 2021, Daniel Thompson wrote:

> Hi Lee
> 
> On Mon, Nov 15, 2021 at 09:34:50PM +0100, Marijn Suijten wrote:
> > This patchset fixes WLED's handling of enabled-strings: besides some
> > cleanup it is now actually possible to specify a non-contiguous array of
> > enabled strings (not necessarily starting at zero) and the values from
> > DT are now validated to prevent possible unexpected out-of-bounds
> > register and array element accesses.
> > Off-by-one mistakes in the maximum number of strings, also causing
> > out-of-bounds access, have been addressed as well.
> 
> They have arrived piecemeal (during v1, v2 and v3) but all patches on
> the set should now have my R-b: attached to them.

I can see that.  Nothing for you to worry about.

I'll apply these when I conduct my next sweep, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
