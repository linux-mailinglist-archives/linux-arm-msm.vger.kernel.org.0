Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF2F121A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 20:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfLPTgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 14:36:05 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:32931 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfLPTgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 14:36:04 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so3449881pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 11:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=5tZt6zZ1S+fVatR78M8B2+XrluLkJCGawdF/aH5D3dQ=;
        b=oN62Nud0FYaBL8CqZaYUiBC5XOS4rWL5oonbdEYsU8eQ+ZGcuCgjcE9v4/7Qz0wu59
         wKgD8Wj+JKQfNUNviBHq9U6I8ZMFtpRMg/u9mPXTfWFLYN/6fR41kqy447Im38AbbCI2
         s4ZPUmBDonYOo0h2c23bsZ2PB3sxgsl/+ulwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=5tZt6zZ1S+fVatR78M8B2+XrluLkJCGawdF/aH5D3dQ=;
        b=G/BLixOZTo8VMkWcCYYqFk3jl2/07U8J65igiZiZMbFyLWmFz/iIrX8w/ppXGWyaN1
         8hdnf9cnteRlQ5RBR7yVcWaYTMTG+tS47XfESW1Bgz+Lag1AlT4c3GYK+708c2TanYzb
         ZFHsciPXIT7P6RgGq89nA8QiLTphnCywhXuCGjaCV/OAqSOOJiHjTfMbizeTUL6Xi9kE
         ueJ3nuwPbnD430EBOe7FwZtVjQ+hAGd8Hno96DZVaW0zZtBsjsdoIiC7cHbE3CGm8boa
         uV0v3v499v7OXP7qHQPku3G6gVfG1FJRLzEqWwtPXdEIQQOPpUT5iQLZMMvHl/9IIIVt
         g5IA==
X-Gm-Message-State: APjAAAXDj5OO/gc/muPEQ6I+Md/TX/VmO3CXZoNzaXQnvU7SylH25Hmg
        ZNYRXrc1PAVY4oqSQX0PUwt8vQ==
X-Google-Smtp-Source: APXvYqzgLVp5SCoceOc5nLMs72Cez/6LNuWcnU638uhaNvnqczKBacjWrTm0MGwLpqBCR+EHdcKNvQ==
X-Received: by 2002:a17:902:8ec2:: with SMTP id x2mr17690413plo.290.1576524964286;
        Mon, 16 Dec 2019 11:36:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id ce22sm275996pjb.17.2019.12.16.11.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 11:36:03 -0800 (PST)
Message-ID: <5df7dca3.1c69fb81.e53a7.1650@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191216115531.17573-3-sibis@codeaurora.org>
References: <20191216115531.17573-1-sibis@codeaurora.org> <20191216115531.17573-3-sibis@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add rpmh power-domain node
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 11:36:02 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-12-16 03:55:31)
> Add the DT node for the rpmhpd power controller on SC7180 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

