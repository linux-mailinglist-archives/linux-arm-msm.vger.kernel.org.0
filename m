Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06BE4A5665
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiBAFU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234070AbiBAFUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:38 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8093EC0613E8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:35 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id r128-20020a4a4e86000000b002edb589161bso3875207ooa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q24W6CEQ1tNzky1Gmov73Psa8COhkR37xMurQcqHjZ4=;
        b=EmsOV9SXQydD4yYtWOPflEg+MiW5iREIgiBGR6m3qIdlaOW/x330S4fPZsWQDunNHu
         kiA+Rx+W6SJVRf8lK2xrW/SQiw322guG/nU+MCzOXIgB+Hk5ljE43emqdSdOtlhzn/qw
         mS+1LTc3ZfxZOM347WOQ6Jhj75xThZp+TUVGQDpadlUlnokl5Erweu+NzoJAP/2YIOEN
         RDYEin/qxeoRHy5LjksGYwTFc8VIVObCAc7Mi/MTvXcK2Bafv2wTy0sBq3RukJHexnaV
         +ngRyv8rBV33tjoDMzroaSC0QR5M3YkIcs3TI7h5mawXxOP+wJRfBFU6GpJ/Qm0WPwfV
         Jfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q24W6CEQ1tNzky1Gmov73Psa8COhkR37xMurQcqHjZ4=;
        b=FXNivvc+NvMyBgLLNdH0wuPQrBUk8vjHa3St5SwlfPY/yUI6VsqwtTUr6R+/GUtDWQ
         7thyYmX2qgIzlXUy32GAM9SJhuFQGrQsWcaKDHkb4cD2C1SoRZvUwBZIAK5z4wZrqTVv
         nbTpeTmtIZjY1HVYpmdBgX0w4G6IMBgK3erRCiUZTWSJAAAzBXXdu2d60yM6i6d469Xi
         or5V523w/9kIagIlm2dWFJk5qTJNUtfPloD7dyGONBIAFDRJxqHroxVWPzyP+ZbnIuJX
         6LE4NgTJCwK8B9Qc+d4+QZ1z4sxesGXHbrrQpzcIW85NSfnH06RUJziWK4RIr3DyL4ns
         KVRg==
X-Gm-Message-State: AOAM5325DeqXs7HadpIqkzLaMfgpJxyTtjEt560Fe6T0iY4q0QMU0f72
        rY2PjpoToxtgY72T8b/+45pQyj0uwBoIBg==
X-Google-Smtp-Source: ABdhPJxaf56yCDcxNRwOv3Bj6Yq/vOW5NHRCMVgV8AQhrXUrT8hnPKTPeLYU/cc51HZPBUCMvCCl4A==
X-Received: by 2002:a05:6820:16b:: with SMTP id k11mr11842194ood.7.1643692834899;
        Mon, 31 Jan 2022 21:20:34 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: rename eth node to ethernet
Date:   Mon, 31 Jan 2022 23:19:43 -0600
Message-Id: <164369277344.3095904.10512751977671950567.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108171535.55536-1-david@ixit.cz>
References: <20220108171535.55536-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jan 2022 18:15:35 +0100, David Heidelberg wrote:
> Comply with dt-schema requirements.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: rename eth node to ethernet
      commit: c9a186338f3f7dff48df3da0e900f4be0a7c11e6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
