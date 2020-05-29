Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19811E72CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436499AbgE2CuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436467AbgE2Ct5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:49:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E35C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:49:57 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d3so448101pln.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hPip9sj+gT94IHX91SMv58k+bcYoNsqlEOg/dBUQ/BY=;
        b=pKc8no9EwMGl+SmmziguyIc8O2W2iMjna021zlfs9PD0U7z795t3f5ZCYmV5dwuGNy
         lh41h5fLmXXbMbeaQCOuEsEBnmZXXwnBOw0KbjkXCHqCoAvc7wpNcMO304+OFcfVEaCc
         9/3+FxOmMw0bksABX67lYX6HGpflgVgbHxaYIw1VZjh7BoVXTXVhfZdb3z5p67q8hY88
         OxSVlliRWGD9FtYXQOiK0KWX/L1MR3QcRVtIxsOWPLHH8nWmlCAefY2+JMwEFIueMk/+
         5WcbZe/9Nr1l0UdyKICRgLFH5iLHx6/OeFhs5ssf2f1xOLIl7UxB8r/bW2e0Sow+xQYN
         k0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hPip9sj+gT94IHX91SMv58k+bcYoNsqlEOg/dBUQ/BY=;
        b=ZUcRtVgtATUNPnYSv0h/ys/hpBHiKghmj2w9Su0J250dj+S/dnMWGl2bderUMdfZ2U
         UwhmAfhCYFycjSs1wbwaBGsKzXVmgu6p/BeFxv6HZzoLH4aZXqDrUyWZjifGVBoQXxvn
         rl5ldbLfmK2GEsFS2X4LWgKkfsPg6xGBSn6WptN126gUc9mZTZQCedRnGdv3y/FtpIAd
         G8i4hWoKCKx9Zr0tI53uLPeeIEYnFaC2Hxh40GLcObDDOP9uZF4uX5Wj9Bhg3dP2qB7y
         4ogUMBcQhK/Zvw5Xx1y/Ulq4l2B6XYIEdM6J5qVxy026Jo1M71nnRf0Vo/Kjdz+GOZ+R
         hxLw==
X-Gm-Message-State: AOAM530d1luSgpeZy48ECx4KNHBbdESVv2D+HNwtQdqp7X7/+O33Wmoj
        yyRgZCzaYOro7T30ylD4EeZUyl6Ssg8=
X-Google-Smtp-Source: ABdhPJz09a79Fui6XxV+b6zrEokUmrQ2Q/jUgp2UxhnPU19f2ePwbMGzsXNI11Mg/LSXdryCF0u5hA==
X-Received: by 2002:a17:902:848a:: with SMTP id c10mr6716560plo.124.1590720596694;
        Thu, 28 May 2020 19:49:56 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm5445646pga.86.2020.05.28.19.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:49:55 -0700 (PDT)
Date:   Thu, 28 May 2020 19:48:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: add apps_smmu node
Message-ID: <20200529024850.GU279327@builder.lan>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-3-jonathan@marek.ca>
 <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
 <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
 <2a35f3b85d8311fb4298aaea82236967@codeaurora.org>
 <c9c21e4c-fc89-5a74-fa78-203e5fb64e27@marek.ca>
 <72d771390af9a68759d3f81cb79e46a6@codeaurora.org>
 <33b34a58-46d2-80ec-1d79-8e02aa5ae026@marek.ca>
 <1adedb96a999a08809afe62416e80075@codeaurora.org>
 <8f9a5750-7909-4be7-6780-198d8c242af3@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f9a5750-7909-4be7-6780-198d8c242af3@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 04:53 PDT 2020, Jonathan Marek wrote:
[..]
> I guess the commit message is ambiguous, that's not what I meant. Is "Now
> that the kernel initializes the iommu, the bypass mappings set by the
> bootloader are cleared. Adding the iommus property is required so that new
> mappings are created for UFS." better?
> 

This looks better, but it's actually not a bypass mapping that we
inherit from the bootloader, it's the stream mapping pointing to a
disabled (~ARM_SMMU_SCTLR_M) context bank. So when we wipe the stream
mappings we will fault on the unmatched stream - which secure world
"handles" for us...

As such, I think you should replace "bypass" with "stream".

Regards,
Bjorn
