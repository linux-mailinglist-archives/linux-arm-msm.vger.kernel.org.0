Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B9115D023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 03:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgBNCoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 21:44:13 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43666 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgBNCoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 21:44:13 -0500
Received: by mail-pg1-f196.google.com with SMTP id u12so3816624pgb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 18:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=niNApjCO06O7a+lFbqctq/E/HFCOZGM44slzM8VnlEo=;
        b=IPZYguxYwiX88hRwH7QTLPVac3hJ/RngX14B4KoZqW6OiO/2xsVmTwj+HhOFyfg7nh
         TT0vT38gm9VGUvEz2ocWIbn+qo8hKz8aOteojzMKPNJwdp3Ifg8ap0Hv7Ilq+x9zZLw8
         7xsWgM62nwwp1kelkqj+SxQtFQoO+K1f4zu1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=niNApjCO06O7a+lFbqctq/E/HFCOZGM44slzM8VnlEo=;
        b=IzJBvugzcMzETxzvlMEcYNZAqwBDLGtIfg8BZTNOG2l6SCrt1efUngwOYsC0qhj6yS
         30kUYts7yyrTWx/LMbgps4ccbn8G3OfzIEylziAY8MXjN8xADcCsXzBKJ//UykkqL37x
         4mMYQmLa9xPUCUjQozKqJoSOq8K9XfNfXFYdOnygSyIqVbjYjYQrtS/lZUtQwBDBAaNj
         nAUXdQRStCLEjYV7vefIOEoxGIJcsT4fahjr7qxHww/ELYKea9bn/d89SDTuHHxGW20B
         6DrHpmD8xuLuKp8cZE7ad8yLm1QN3zo1Ch4VRbCbqANpkRTb7fMM5kRNOgphhXDSGCrP
         c+rg==
X-Gm-Message-State: APjAAAUnFKRxc+n1YO3Kxt7E1cmFDAeWC7trC86rHTmwQEDdpMQdjvPj
        3fS/UXDBPC9AXGNTts/jvgUD+g==
X-Google-Smtp-Source: APXvYqwzYj+wvXbHesIqdU5LMCnildAw4yCq+8revIbEfOsWKVii3zdqeKtfxcBEcLKIdQKk+eTHGA==
X-Received: by 2002:a63:74b:: with SMTP id 72mr1052514pgh.162.1581648252362;
        Thu, 13 Feb 2020 18:44:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c10sm4575360pgj.49.2020.02.13.18.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:44:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org> <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/2] iommu: arm-smmu-impl: Convert to a generic reset implementation
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>
Date:   Thu, 13 Feb 2020 18:44:10 -0800
Message-ID: <158164825099.184098.18396989716299086067@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-01-22 03:48:01)
> Currently the QCOM specific smmu reset implementation is very
> specific to SDM845 SoC and has a wait-for-safe logic which
> may not be required for other SoCs. So move the SDM845 specific
> logic to its specific reset function. Also add SC7180 SMMU
> compatible for calling into QCOM specific implementation.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
