Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C199E8696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 12:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbfJ2LSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 07:18:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37544 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387698AbfJ2LSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 07:18:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id e12so10319238edr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=J1TIX7KBOhkEDUvUlXCGfzo0ftBx/02dSVP1EsfH5Yg=;
        b=dRF2HbKHVHZixPbPX+wgFMrl+ava9svy0g4H+AkjUAcPK0/X9wQNgWR7E4xc9rGnJJ
         Q8w1LWl7IpS143XNVa/X9gi74DroRujwtmaXM3cFuH5xJpUZCw1qvZsSKD7tAQjMToSd
         CrRqpsnKgB5FGnz+0yeyPaKDMjuXJaiEKX/aR01gm3uVzlZC1/KLX3TXuFM48rvPwYXb
         QO9rf1WaTR7vBt/wtpuAge1A+VnktpxZ+YwZRiOY89NLKIcam0zRgxniYjThF0njXyuT
         6FkIPf7LBst1dRg9OY75eSlSy0Cg05guoNJNXlnu6GCVvzD1xWZ6gztSL6b0W6e68lN5
         vPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J1TIX7KBOhkEDUvUlXCGfzo0ftBx/02dSVP1EsfH5Yg=;
        b=Irbn34QdP4mh43g3n4iwyt+EkHKbR4Nk1TIhoRDsFU4i8I2KsMn5OZ8RNCPKguBokx
         NFARm0D8baCAFbpmaOkB+MXXRBkzXrHjJ34VTUrFb58pEfL2u01IiVelNXzwZ+WDS6O8
         3hCIq9Gz4kJCqaXFkoyYR0L9rBt9Y5nDT+agkXOTIL+LcObT6aB7xvK96hyreC2N4XdK
         NJNP/tI8QuASVRnh4V+s9vyiK7mU7RlIGP8en8KE9VcCio+l6MBEQ7u8sFOm43D8qVwV
         9xLiaP4Gdi9Ukp2Q5JQiTxPKT0SZoUTruiVZK18BT/Bi+bXY3revfEbQEXYM87R+/yPl
         KUcQ==
X-Gm-Message-State: APjAAAWEXgMm65NFp7M+mxwIhjlVxc+gz39g9OXnQsF18KjjbiyaNhtB
        ogyi4ICAHc9lnjcu3ojDF6alOA==
X-Google-Smtp-Source: APXvYqxd0UnsWHkLoXCSeSyxR75r+FTK/wmY+wYx0WxrkEu7pYPLkgW0m0xq0i3miyTwErZqOzkjWw==
X-Received: by 2002:a50:9930:: with SMTP id k45mr25056228edb.134.1572347917211;
        Tue, 29 Oct 2019 04:18:37 -0700 (PDT)
Received: from [192.168.27.135] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id g9sm420189edv.86.2019.10.29.04.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 04:18:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] ARM: qcom: add defconfig items and dts nodes
To:     Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191024103140.10077-1-masneyb@onstation.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49006809-0dde-ba24-4e91-0b210fe45599@linaro.org>
Date:   Tue, 29 Oct 2019 13:18:35 +0200
MIME-Version: 1.0
In-Reply-To: <20191024103140.10077-1-masneyb@onstation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24.10.19 г. 13:31 ч., Brian Masney wrote:
> Here's a small patch series that adds some additional functionality
> to qcom_defconfig and to qcom-msm8974.dtsi: interconnect, ocmem,
> and HDMI bridge (defconfig only).
> 
> Some high-level changes since v1:
> - Updated interconnect support. See patch #4 in this series for details.
> - Dropped ocmem defconfig since that got merged.
> 
> Brian Masney (4):
>   ARM: qcom_defconfig: add msm8974 interconnect support
>   ARM: qcom_defconfig: add anx78xx HDMI bridge support
>   ARM: dts: qcom: msm8974: add ocmem node
>   ARM: dts: qcom: msm8974: add interconnect nodes
> 
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 77 +++++++++++++++++++++++++++++
>  arch/arm/configs/qcom_defconfig     |  4 ++
>  2 files changed, 81 insertions(+)

For the series:
Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>
