Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AE23E1F97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 01:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242542AbhHEXxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 19:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhHEXxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 19:53:19 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF52BC061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 16:53:04 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ca5so12858510pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 16:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b6B4yylH0pZo2s3yCwD8/epdQAet1I9bJwztDXFQrFg=;
        b=EkxEnxWxjcNOUgziU33TxR7dJWiipE71/DgPphqVwTZfDqNnaSKXN6k+PfY1Muel/6
         D56ObZilBjzS+muoIiQnqlOihEMe08ifGyBM8IEAjIz0MK8z4xM5xWst1dDdDa7UZRze
         GZ4B2hXx4a5BY7LjVpW/JNgEI94qJQMbDjYCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b6B4yylH0pZo2s3yCwD8/epdQAet1I9bJwztDXFQrFg=;
        b=kyu+k+20LuyitUibuly5CcCN2Vl9QmT0GrptBGBZD1M8DKUhSB0Hl8EhISulEyuaWb
         udOpIhJl8TnZ1lCCvewjqRcVR22AoL02bD+jkQrJIf7rSKxwqELlNP+46LCvysB5sQVP
         j4g1xU/fQBFSIrg6xKwX1aHusB34hyokVw5/RlCAOkYXluklQO6Wv6JtjmWS5+fKKr5G
         CBBFFtkWXoi+qLBlwc0iOImSOZ9EuOiDtLV09IRYgy+p5elkMz1VahV5u2er8soad4ye
         D9vuMEADXOOstp+GezB6kbuf2f8MW2oKkhytu+XT3IbYmkq3yOcqAJiGskn48mpda7R/
         c2Qg==
X-Gm-Message-State: AOAM531a8AUBLNworVWzmJlkvKCDOQfCnOCoUn+hyNRKDd2JcP0WtY/L
        7Kt/L3i8SzbOWbD80b200Mc0Rg==
X-Google-Smtp-Source: ABdhPJzC3AP4RmpOVnU6TGWl4e+PkN/DMXxJ0dPod756DXl9jykZNXlZMm2Xyactn225RYm5xjGFOg==
X-Received: by 2002:a17:90a:716:: with SMTP id l22mr7365089pjl.128.1628207584401;
        Thu, 05 Aug 2021 16:53:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8944:bd:9484:29e])
        by smtp.gmail.com with UTF8SMTPSA id p17sm7691767pfh.33.2021.08.05.16.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 16:53:04 -0700 (PDT)
Date:   Thu, 5 Aug 2021 16:53:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: enable IPA for sc7280-idp
Message-ID: <YQx53rkYL/1Km5xa@google.com>
References: <20210804210214.1891755-1-elder@linaro.org>
 <20210804210214.1891755-3-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210804210214.1891755-3-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 04:02:12PM -0500, Alex Elder wrote:
> Enable IPA for the SC7280 IDP, with the modem performing early
> initialization.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
