Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE7CF379C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 19:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfKGSwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 13:52:54 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39729 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfKGSwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 13:52:54 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so3132043pfo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=C1Udvg9FMxOUFKtX1EFlPrYF5BAQ0Gfet99gcsH4OkQ=;
        b=RDPZUhW2GMjZQNBzTRog95xYEqHC62R7wRvDFPcNSjTizh86M+UZMspV5nR41HzlAd
         223mequfRm19yKEKUWwXh6h57DPhTChHueGRlIKa0HqVRf7jWS+M1s3ER2zzuf3FRZdX
         5H7SMfWCVsqRSRbgZAnAwW2fgNSCcOrlkOE0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=C1Udvg9FMxOUFKtX1EFlPrYF5BAQ0Gfet99gcsH4OkQ=;
        b=NWClm8MPW9eNhpddTl5BOM8CBNShF+TVfO+PFbSwJCUpP9osESM6lQZPqywExb4K+5
         LsP7MoOQckLLFA1gszcIuM+vXwOrbFSF2k7IA0Pa/pWiu6VmAgOWNKmmBe4fRPkeaIgw
         S9vP4hqoGlRzh/B8Ru9T66rgo4Enk9JQnS/vQ0jOuh2jTUr6dP23EUJNNZsd6g6h2Zmh
         4UxfBWWXPZmG4J3Y43FtLILaNo2A2GJTvzT5/SYwMnO1f6IZeUtOj0f5FmxjWHZkyd+/
         C+CrF2PploUjYIx3A5KJVGJnuNtJxKNEOG3TqLskmQ6A9Jpy10wgk50/NtQxb+booqyj
         SEgQ==
X-Gm-Message-State: APjAAAWbO/bjDBSryZWKv7abY/jUVMOdHPAhQED/ChigA18ASxK0aBRl
        DmeGfgFuvFfeNmYhBYoVtuxkyA==
X-Google-Smtp-Source: APXvYqyB1ZNXurx6OgmgxRyU2jt7yTNA6aM9Et3IiaHkfKyaOSY9/xmUAbjYahGijJqorxavaS49yQ==
X-Received: by 2002:a62:1ad6:: with SMTP id a205mr5975230pfa.64.1573152773805;
        Thu, 07 Nov 2019 10:52:53 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r15sm692550pfh.81.2019.11.07.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 10:52:53 -0800 (PST)
Message-ID: <5dc46805.1c69fb81.7b5fa.1eea@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-15-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-15-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 14/14] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 10:52:52 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:17)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>=20
> Add QUP SE instances configuration for sc7180.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

It has the weird qup numbering too, but I guess it's correct somehow.

