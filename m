Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA494A7B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 23:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239223AbiBBWpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 17:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237375AbiBBWpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 17:45:53 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E17FC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 14:45:53 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id u11so514629plh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H7zbzRyY9Da/STc4vt48OkAmzI/OTmAZO0rZ642KCMk=;
        b=BbHdOQN/AoSNG8i91JOVSdCdQGh7BexAGYWzaHZKLIeA5qvJHHQiBA/woN30MmXKi8
         qTfmgay7z2E3On34KkTeYrtn9nH7KiEDwp/FglL69mluebgPqmRclzYqgnYqnC4tBCI6
         qQEM5tfVcFDbUN3iEy9R4viHy5s0xPmofKk5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H7zbzRyY9Da/STc4vt48OkAmzI/OTmAZO0rZ642KCMk=;
        b=ctuBTsjYy4eGvRsM3wBNiNIEOHYB7YkZVIhOUq0Svn3jjob/r5f8FXzTitixYpA8Vn
         jqoz25/NS2cy7Mh9rclG4K/fKmFm4sRuc2NtZXKSXqZa2KNEayhlFp4Kv2Z4R7T6R3pM
         LOvYg/bsCnPPWC5u+PGDCcrrKVTGgLcDce31BbpkTLL9xoo6NDrfRbPrT+vLPI/3PRwY
         VI5jzwj+7v4VYQdQMRpXl8zoWLylONq8090wLOC15/8cqX+kraCa3+NbQVWfR92aifKE
         YBpWoYo9HBPeJN8Pi7lWuMdO29th7Q/ZZqsso+xfM0LZaCrhxAy/HhW75RItGbu3YEaR
         zJhA==
X-Gm-Message-State: AOAM5329L/MNw7/QOeHoDHg/r6hQHRxaroCGqi9q8a9RNDcTTzgPgoZm
        QJrW7rED82I/Y2mHYCl9tQ6QBg==
X-Google-Smtp-Source: ABdhPJxWkM+CtlP3GH9ZlUHtGQjXTAlxv5Z4iGsCejHngxl/I/zbl+t7pma9OD1I8e76r0KSBH1MJw==
X-Received: by 2002:a17:90a:f0ce:: with SMTP id fa14mr10513942pjb.212.1643841952977;
        Wed, 02 Feb 2022 14:45:52 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c0cb:3065:aa0:d6c9])
        by smtp.gmail.com with UTF8SMTPSA id c11sm27304571pfv.76.2022.02.02.14.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 14:45:52 -0800 (PST)
Date:   Wed, 2 Feb 2022 14:45:51 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        pmaliset@codeaurora.org, quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/14] arm64: dts: qcom: sc7280: Fix sort order of
 dp_hot_plug_det / pcie1_clkreq_n
Message-ID: <YfsJn7M9b44TvNjV@google.com>
References: <20220202212348.1391534-1-dianders@chromium.org>
 <20220202132301.v3.6.I874c6f2a62b7922a33e10d390a8983219a76250b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202132301.v3.6.I874c6f2a62b7922a33e10d390a8983219a76250b@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 02, 2022 at 01:23:40PM -0800, Douglas Anderson wrote:
> The two nodes were mis-sorted. Reorder. This is a no-op change.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
