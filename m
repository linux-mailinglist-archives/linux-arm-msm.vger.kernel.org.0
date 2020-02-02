Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2737114FB72
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2020 05:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgBBEls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Feb 2020 23:41:48 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:36305 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgBBEls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Feb 2020 23:41:48 -0500
Received: by mail-pf1-f170.google.com with SMTP id 185so5683638pfv.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2020 20:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=jX0fufKYZvyZ8epx+GgARD/j3hIwfF8CK7/JT+nLQUg=;
        b=F+wcw4jJSFXFdzlfMyI59VpB8DLk10MQ4kH6+dKKDRP0qzO0vGHwxvsD/1ag0wWA3s
         XQi4UvScdhWg04rKZEp3M/puGRnXV2e4K15vJdtGwNF6WCQspP6iVdw45fgkdZ8aP4QJ
         OxPcEXVMkPU1BjSCBDmOO6gvymb2SrhzQilJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=jX0fufKYZvyZ8epx+GgARD/j3hIwfF8CK7/JT+nLQUg=;
        b=VrUVjBwK+EBODUsVMINq9FRhXvxXjQRogFiLKUkPBGXRXKDBv5QmhXSez4UAt9SdRN
         zLGuo7YUQwluiOOa6P3mVNkTpZozi+n667IuB+usjckBwiN/O/Q1i8PzGwKoSKe5ofsH
         o4wpCYkvuXww4+Lu+eYq1xkwbQqZSqNQppMA+ZKJ/CFEyjIjdsVw3irTB7v4grodVfcH
         EZ7k6Djzi/MyHLmYBYllYkrDxLvJdmoOW2aJg+DiZCdAPbjLmdzDZtZEIIleCVB5ji/n
         vVnwKNS+uLcs6Bhdt+tdpJqaydv8jgGi4+//nXppX2HJK8sLeL6+X3hsIDKQsu7wE9xS
         Rs7A==
X-Gm-Message-State: APjAAAWSQVuvTso6EF2txjzq0ATVAcl3SV4NP8VJDToIH2gY65TB4k9p
        awDBVQ/QLlp0gSo+XGTsDaukVw==
X-Google-Smtp-Source: APXvYqztpJZGE14XPIWxWqPTuQSH8BXdLKg6SY8K4m68pmf4NKVNkv30SL8rm4M4AMOz/D4RUnCJWQ==
X-Received: by 2002:a63:f312:: with SMTP id l18mr10829165pgh.178.1580618507301;
        Sat, 01 Feb 2020 20:41:47 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b18sm4977615pfd.63.2020.02.01.20.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 20:41:46 -0800 (PST)
Message-ID: <5e36530a.1c69fb81.680db.f620@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org> <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv2 2/2] dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845, SM8150
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Sat, 01 Feb 2020 20:41:45 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-02-01 07:29:49)
> Add missing compatible for watchdog timer on QCS404,
> SC7180, SDM845 and SM8150 SoCs.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

