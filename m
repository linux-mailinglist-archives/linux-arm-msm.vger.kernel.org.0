Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C490B71AD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 16:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388321AbfGWOvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 10:51:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33872 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732532AbfGWOvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 10:51:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so20728758plt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=wAI/J73/SuEViXJgIx3ykUez6skqEEMGxVLWdHqure4=;
        b=mcwiGo0OGGnJmwu5VoILB9JjAAEwKiRmKy5Mmd7RXzj9gztUWFbEKtOc6GS2tAtuQB
         o/1laoHwe7qm1trcOSkzADOtUNucB8RKLWKbNZQ8ELkEsyHrBkWU3ZHmQiuX1T4rSsuk
         K8xYICMVYZY7/oyotpkOnAkngAxmFjO0cpMCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=wAI/J73/SuEViXJgIx3ykUez6skqEEMGxVLWdHqure4=;
        b=TyX6zcT+7dSbQDlADca9ExFo2Z8DBdzpjLhDPlIq1KfTrvRFHnuWs3OATmJ4FzbZ9G
         zSSM+vMGLLVyerCY9s7ehtjfXG7tetQcdLIkQxlHsVwCG7NCQ4bLzc84Kmvf2beYX7Am
         6LzvssdOAtsHO+DYGcjNanAIlL5dF7y6IUfriLqi5fb7wptkZV9UNcSJTMAbGw6yChn2
         ChnyQKN6b++txEWLOmrpXPD+lDmkFI6u3Jp3jTQh2ZsA9XKUpOR9dDNbkcb3tfV0Lzbt
         WqmSlaTnGC9kx7Rnb2CqNgeJJ7aBb14dXNAXYikIQjfJv9qsc7YXvSnoy9MEvQRSchpW
         7l/g==
X-Gm-Message-State: APjAAAXG6dwFqltu0R4oy3XPXLGT96A5GSUUkfnX2VlApLwnZ8Au+zD5
        14q02WgIBX1TpfcE52gLnXueAg==
X-Google-Smtp-Source: APXvYqxhQml7Fo7GvVBVokUNUbCU97SfpUUqIjvBFdu2bgd8A5/MQr4G8gO8K0I8YLE1r+Mz9DuBBA==
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr79624502plp.262.1563893463330;
        Tue, 23 Jul 2019 07:51:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b37sm71455423pjc.15.2019.07.23.07.51.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 07:51:02 -0700 (PDT)
Message-ID: <5d371ed6.1c69fb81.1ea1c.47f1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722123422.4571-6-vkoul@kernel.org>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-6-vkoul@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from unit name
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 23 Jul 2019 07:51:02 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:22)
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>=20
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name=
 should not have leading "0x"
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

