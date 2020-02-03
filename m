Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9E6150E45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 18:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgBCRAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 12:00:16 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44495 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbgBCRAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 12:00:15 -0500
Received: by mail-pg1-f196.google.com with SMTP id g3so2425892pgs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=+bbS1LurHkbiJrVa8DwGY53PnP/qS0ULTiVuSYs5A3E=;
        b=QjnvLUY4Q4hhfq3l2iwv+1X78eBmhau5DSyA/OBUYOQTo7bb7ep2XKYKghIh3ErkDd
         IZFNWonhBADCHxXVXrF5wA4/tjMGNQMg+h06spG6a6CTAKE8J4qvXYpFAP4mY6hPQbnm
         wMnNfqk/rz0xpnssK+2Td5w2GVQGzRoArLMDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=+bbS1LurHkbiJrVa8DwGY53PnP/qS0ULTiVuSYs5A3E=;
        b=Lm6EH8JrnNvVRGRXUMdxfXPbKwavvhw8QwlSvfZqCFKyIu9wqQLwa+ScuYANS5ZqfO
         HNEBxz4Y0oFzAn/IrNwSde9Rvs6Hr1EGulVkWUx+QT2pW+Um8yLLwe2XxnvenoD4VHoZ
         BABvxJ0dVzLOzGTOH8jAdZ2grK3rxPamLsKbMmuLVeFBvkmTwmtospCYbltBG2MUWNn4
         thHetkqsNbD/KLy3aK4ddvBi0ONP1VjZVFEQbYqvHnyX7v98gkbFhRv574IE8Swl4ejB
         vBCpEGdh5PlWAaN+1jkmJaGl24poReEZgMm0zH1I7PNjJAIfQu0vq7o63sFq5dkfKG2+
         C2eQ==
X-Gm-Message-State: APjAAAVShTyydaYAxzpHJBiEgydKYyKr1HdLqrNiEaq5XdYcmLeH1DLm
        1ZSGuZMRbws2AFQMK5gyP40t7w==
X-Google-Smtp-Source: APXvYqxfeVAORXMLObE3gAN7OxJt/+U7e9kSIe1Jr0RUJ3rinUWbypd7Od3IggLAS+/64DWu/MihZg==
X-Received: by 2002:a63:7907:: with SMTP id u7mr21605031pgc.138.1580749213150;
        Mon, 03 Feb 2020 09:00:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v9sm21759786pja.26.2020.02.03.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:00:12 -0800 (PST)
Message-ID: <5e38519c.1c69fb81.d469f.9b0c@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3726ea2e21cffd2f9667aaa0430003b2407ed74f.1580632081.git.saiprakash.ranjan@codeaurora.org>
References: <3726ea2e21cffd2f9667aaa0430003b2407ed74f.1580632081.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] dt-bindings: watchdog: Add optional interrupts property
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 09:00:11 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-02-02 21:31:15)
> Add optional interrupts property for specifying pre-timeout (bark)
> interrupt on QCOM SoCs.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Maybe there could be a description that says it's the "pre-timeout
(bark)" but I'm not too worried about it.

