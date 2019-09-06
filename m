Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31076AB1FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 07:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392322AbfIFFPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 01:15:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43626 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391482AbfIFFPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 01:15:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so3535444pfo.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=Rs6lYDg7rzHFfE3fqBqCgcoh261QPFbPy/MlhwtPv/U=;
        b=fPAXHDWJg386CI0xnSxIs7N4XyMud3Qu1upV8CwvN0t006GE8zZl1VTWKnkG3pjSut
         Rp8P0hmrX4NZmEdBnSbNQQl1HFNKKaBEXDAhpUCCzImWycsUm1CoKqsZb8z4sT9oz4Jd
         4Zbdn4yUOwedFUpjglAdI2RkGsgid8eRl2+i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=Rs6lYDg7rzHFfE3fqBqCgcoh261QPFbPy/MlhwtPv/U=;
        b=EaokdvJQ66Tl41UypxR99j3ZX/eSQO2Jc2SrhQ7jtLZ9/10kOGqDbzoE/VLESjB9q3
         DOAxpnN2rUJOo6z1EGqtXsNxtiHkRelE5q1RCjUI7t6WjwtQL4dQiAgVBaoofAG32Vl2
         YHyhIvpZuPMeDevqym83ANgApSxSJO2q5e54JJLLM2CSqUHspo0xyYEarvWsNw0Z3Nz+
         S7sUlUnGhrWeD5QlPYtQl8obqG7xzskvjt04TUQ8n569V2xj9ifoJ07CsESYahxGmGGK
         3lTgrejelm2UfJFxhbJeAsni8FAwccrkGW6E1Fd2yYC/thcCeDBJOCZKEV93VMS0gAGe
         nJMA==
X-Gm-Message-State: APjAAAXQY1oH8g/WTF3SGLGvZlQJsy08wULRJujLeRTg3Ex02XDGGCrt
        aqsiAiPOdzY/KnOGExnEaVHvLRAZ1C1ivA==
X-Google-Smtp-Source: APXvYqzKV0mW9EELTg/94+NbXxWwYL0t9q7G5Qaisah+2L76fd6xkGvV+lbfx9rsLHkj3RyagSU2cQ==
X-Received: by 2002:a65:6284:: with SMTP id f4mr6618359pgv.416.1567746940523;
        Thu, 05 Sep 2019 22:15:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m19sm7637011pff.108.2019.09.05.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 22:15:40 -0700 (PDT)
Message-ID: <5d71eb7c.1c69fb81.7bdfb.3205@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190906051017.26846-4-vkoul@kernel.org>
References: <20190906051017.26846-1-vkoul@kernel.org> <20190906051017.26846-4-vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 22:15:39 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-09-05 22:10:17)
> SM8150 UFS PHY is v4 of QMP phy. Add support for V4 QMP phy register
> defines and support for SM8150 QMP UFS PHY.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

