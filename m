Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A477D1805FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 19:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCJSLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 14:11:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39807 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgCJSLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 14:11:41 -0400
Received: by mail-pg1-f196.google.com with SMTP id s2so6663195pgv.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=pN3qTpKjWmrG74+zt0MCb4nvU9mEwdxCDTu02IXOOa4=;
        b=GCb/UeYvad1VcBxP5Le7hPBRpo0tV94ewwp+L7bfi16zLWdvY79SaKTJeXfC+TLr/G
         6+IrD5CuLoIQrNsAfuW/T3WHsvHWPVEIuTIkXzpQO9jAnDCtKi8RhdbeFGStr02B4zcM
         4d2syzMFkbd/GJcAUqGJmOUuuK+trg1JVAr+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=pN3qTpKjWmrG74+zt0MCb4nvU9mEwdxCDTu02IXOOa4=;
        b=mPUWK5mPa44TMSsWkHl9NtK+XE0X5Xs1I4EEamdCTOmxxTFMqiYf/e1BHBZy1BZX2Z
         wtyCQ4mGtJp08Ha68TCqtTTkjLJOZALhPvPna+dZVAWY7fEhfzp8Rq5Qfm0jCtYZGi89
         +hYBe/BFptjTjEOVptQLsJhP2/uj5ZE4VzjZwBvJliiOLtABm2nbuf8PD3ye5WqxyP6Q
         2zxAJgUAjmptgzZ+29f0ABGnsSm6wIT+DuYZW0IT4MGwAmpYxLJhA6CYFz4VHjooodpi
         4X+1WeqaZW+bJpLJbr1Abe3Sesmv2R6D1PGYia1JPEI82akz1Ftsge8aevb94ah3BVT6
         1eKg==
X-Gm-Message-State: ANhLgQ0eeuIuy1+mhAQ9pdzJaRCQVYxDRYcF272SjHzCkRy4TYGiZz4I
        /Gl9Hy7qB3DdIKtItCqa5DrhAOxxxxQ=
X-Google-Smtp-Source: ADFU+vtPfd6sEmJbJPrHFLC6tR/0kN+w0z/+5OCEPiBHtC1WspD9R1DrHYTO6ADKDhsgGxgi0AJK8A==
X-Received: by 2002:a63:6d4e:: with SMTP id i75mr10022175pgc.443.1583863900171;
        Tue, 10 Mar 2020 11:11:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d9sm2967203pjw.24.2020.03.10.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:11:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-6-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-6-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:11:38 -0700
Message-ID: <158386389888.149997.14127685932598676242@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:38)
> Add a simple-mfd representing IMEM on SDM845 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
