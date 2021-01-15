Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B952F713E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730612AbhAODy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730970AbhAODyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:54:55 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26D0C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:54:14 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q205so8239900oig.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KilXjYXgOknxPMpyJrFa/IXBlfSwILUA268Eh87hM2k=;
        b=WY+GmoR5C4tCejAMKcYNEFtJsEPci4lS0os/Pow8I7WHHaodrxltpjg+M2ySQM65IQ
         M7VpFGKCO1Xe28pZJ07Ete7AF17vcyrm3Ok+UPmnojhT6uaVVtsW7fbjJ1xB3PLpxaeV
         8wtXq7T+tLM8GHD3LgzrRS5iiiKRVx76e7TWke2ex33YsoUdFsin2olon3DhKKMyj3ml
         BOSNepbAxIilUNQdMgP6vyqWl0IwZjCSlq7vU9EkbMDoB9xU2qUgmrhzICFcjBK1JBsi
         Gu5TFetNatiWUuIPYgHaHPr87UKI7QSNZH/e38/1WvahXSrYW6C8jktzmsRVN2JM5qbT
         9+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KilXjYXgOknxPMpyJrFa/IXBlfSwILUA268Eh87hM2k=;
        b=tgB8r6WUblLwX0W6X1bg0ZLDvzb4AQjKcF5ReL1kLh+WDissvaqheCL44YgVhs00NO
         8JkMCIUo6IbjZx0RDVUKWpi7yACeTPEMKY7AsRHcERhx6ewj3+zYRDSA3h30/D0H3qQs
         t5iymcBswsEGd1juUsLWVZOqr2fv9GN3pN11QXoX0vlpiMTKc/luqKlUfHnYfO0eQlC9
         Uu/E6arUMK02eAlUGbBAPjbPb7ogSSjVc4IP1n7kNBfs2uBjLr8/btTNuVsO59KZRGxP
         E9DwKMEiqRlBmTKNHZlggy/biUgsY9NjNNXlg++B9Y2M+80DD8QG76U2UCMlIzk0zp73
         OWVA==
X-Gm-Message-State: AOAM531MVT7WZ/k5wiI1iCbgdDCVi01WSyaRQh2BJ9YOKqYjti80v7B3
        aJ2sJPvyRzCy4NZPzPI53n6l2A==
X-Google-Smtp-Source: ABdhPJyCqlLx7gt3hFbyb3n/njPbfgC8H6Bn8X8UIe7UFehW4jaB7yn5kkxwPfNsyR42pmXmt1TN/w==
X-Received: by 2002:a05:6808:16:: with SMTP id u22mr4504901oic.1.1610682854286;
        Thu, 14 Jan 2021 19:54:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 73sm1546888otv.26.2021.01.14.19.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:54:13 -0800 (PST)
Date:   Thu, 14 Jan 2021 21:54:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: sdm845: add oneplus6/6t devices
Message-ID: <YAER4xpcq0Rn9UgD@builder.lan>
References: <20210114185227.25265-1-caleb@connolly.tech>
 <20210114185227.25265-2-caleb@connolly.tech>
 <17d49d19-7672-520c-12d3-c6ed8c12ae47@somainline.org>
 <4db0807e-c33e-5913-1818-1fc055e35acb@connolly.tech>
 <1b023774-d091-e7fd-8eaf-dedeff5feac2@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b023774-d091-e7fd-8eaf-dedeff5feac2@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Jan 14:33 CST 2021, Konrad Dybcio wrote:

> 
> > The device definitely doesn't support USB3, although downstream does 
> > leave the USB3 phy enabled the hardware doesn't support it. So it made 
> > sense to disable it here.
> 
> 
> Sure.
> 
> 
> > OnePlus' bootloader doesn't seem to care about these values so I left 
> > them out for simplicity.
> 
> Sounds strange, but it's not the first time vendors surprise us.
> 

This particular requirement seems to be rather random. Some board loads
a single dtb without these properties, others require them even for the
single, appended, case.

Regards,
Bjorn
