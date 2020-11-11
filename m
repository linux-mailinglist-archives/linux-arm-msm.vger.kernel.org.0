Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D162AE7AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 05:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgKKE4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 23:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgKKE4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 23:56:30 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69408C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:56:30 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id m17so810264oie.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cRAt4batTICDyiJ/8EINRniP/Smx50wMzUnQPTpJLC4=;
        b=uBI8CuLzxljYP3u+E78DkW3m3Rfy6G2IhHNK/5HfWTn5eePeEUQoBcbrb/e078wTW2
         6EhoCAzvv7vFr3n/UFqL9dIICXh8IwjE6dOAhzeyHQ68Y0lQHEIq49BU1QL+Z01xXGb0
         PkhcFdkS+ysJYAWoKi1BLDq8ctgdAGizX6tKYZN0doev6pPWfGEUMEqzhS6Wno4EemL3
         WGTF/wk1s9/qAHf3+Qnz0Fyg37I64BRCyRWtMp6juIYEg0Y30to+wWRkVfYJ8hYvSIah
         WqyZKj1VHMW+QaBRHTZSYhhZRS6kIodIDDs/PIby2Fv1P393mKmwGe1ushuTb/bKGPTy
         omFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cRAt4batTICDyiJ/8EINRniP/Smx50wMzUnQPTpJLC4=;
        b=bpZp2r0prHs+glxZJBZiZgBhKMDPRUB4sn9Cbq5JVAH3QQXnknYoJakV0YjRKn1Ed2
         LPi2cDYWAqePW9Dftap0FmBthKKfHUtLKBqryfL7QElvvSEe1US9NUfL8egG3k60rnjP
         ErXc72Tnjpr8KsgCKfypd7T7fqEToW5xGWvVIEaBaFtAFs4Sy8BVGAXWR/ApXUS4EWHK
         wyrWF2+PANbFLzbHCFb5VbfGAXR9qUpMm1WYmQvTLk21HvKb/Albpzj3cV1xJOr8SMrX
         oQ4+Y7iyJhWZXj+/JZVcmdQTIipfjPqSKP+HxTtzySuXT7RMfKfmEMTmQTi/K3nwlOrJ
         0Pmg==
X-Gm-Message-State: AOAM5310vLAT2WoCcwFq1od5PST7co0g8yaXnUXYmggKRZoBWTb4RcO1
        lhiklO70w9Yv5MkKgkR13YzIVQ==
X-Google-Smtp-Source: ABdhPJzWDF0IOu9gSQFJfDqj3LfmtrAjDRSYMXzJ5+OE3Zhn38zbdsFXQi+R41CdnEX4GzqTp4n3sA==
X-Received: by 2002:aca:c6cb:: with SMTP id w194mr1045129oif.27.1605070589680;
        Tue, 10 Nov 2020 20:56:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y15sm277264otq.79.2020.11.10.20.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:56:28 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:56:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/11] arm64: dts: qcom: Add support for Microsoft Lumia
 950 XL (Cityman)
Message-ID: <20201111045627.GF173948@builder.lan>
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-12-konradybcio@gmail.com>
 <CAMS8qEV3kFgCZ34GsOSoy19YceF9q=01JazQHknvxnVJg4thcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEV3kFgCZ34GsOSoy19YceF9q=01JazQHknvxnVJg4thcA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 05 Oct 10:14 CDT 2020, Konrad Dybcio wrote:

> >+dtb-$(CONFIG_ARCH_QCOM)        += msm8994-msft-lumia-cityman.dts
> 
> I made a typo and instead of .dtb I wrote .dts here. Could that be
> fixed when applying so that I don't have to spam you guys with 11 more
> mails?
> 

Thanks for letting me know, I fixed this up and applied the series for
5.11.

Regards,
Bjorn
