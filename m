Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9483F3648
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbfKGRxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:53:39 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42341 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389629AbfKGRxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:53:39 -0500
Received: by mail-pl1-f194.google.com with SMTP id j12so1987168plt.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=0atOPD8MTEMaediJdWbaCxGcPPr5BBNLK/+zoqMN/a0=;
        b=Ptd1ZEtcLLPyidqEOZdEfKkqBqf/Wkh+Rt0Y/4ca6Cy3/tVXGJke1Bdww8VWSObKRE
         GOwQdTYNpVyAbmKk+yqdvaBKL7BQRtX6eGJfcKs36s2Yf14Fdt0wUV9K+UgiFvvoc/7o
         kLhZTKSM3ogAr+kSDjCD1L8ygh14xvufw4Cyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=0atOPD8MTEMaediJdWbaCxGcPPr5BBNLK/+zoqMN/a0=;
        b=mAQO7XnnNOE3zdyA18kMKG765r6H5tBA4oWIIop1WCxgRw09LHKpfqSAgMIvH6YvuL
         vxA+pPRQVByPYoCcX05t8XWFq2N7SjOCWmPe+4Sb4dDFErL3sGpfz0QEwfH2zn6Rkn8i
         PByGxijd9CaT+ImjWltF1y6MGwudhmzZp/OP+hbDzSf8gfM5RKwGo1UieO947IylWMVp
         2VEJ0tsbwS82XS96Ykk9ikvewkCUkRkP5s2vdEpQdf+i+7o15G0GwIDBPUQh7smr2zzj
         ci7hr7CVLMqy2nD4nCb3gu4ehUoKlz057+VeH/99mjjPugtcgbsJP6pTcaMQjrY7g+GA
         WLaQ==
X-Gm-Message-State: APjAAAVQv6oa3S4PkvPjAWGyi5qai+lRadMPPsIl7kld2VRU6NmU/Vay
        4uoHoEczxY1Sa4Ioy+LlyjgMwg==
X-Google-Smtp-Source: APXvYqz037BoF1XoSKyDn8Z9BdUfd/7F3E4zYn2tn2U4IcFxjzleZUeKGjpL8sfVUA6Fry3Ud++xKg==
X-Received: by 2002:a17:90a:348c:: with SMTP id p12mr6700892pjb.105.1573149218553;
        Thu, 07 Nov 2019 09:53:38 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 82sm3737569pfa.115.2019.11.07.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:53:38 -0800 (PST)
Message-ID: <5dc45a22.1c69fb81.bfe45.9863@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-7-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-7-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 06/14] arm64: dts: qcom: sc7180: Add rpmh-rsc node
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:53:37 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:09)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add device bindings for the application processor's rsc. The rsc
> contains the TCS that are used for communicating with the hardened
> resource accelerators on Qualcomm Technologies, Inc. (QTI) SoCs.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

