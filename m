Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB364A569E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbiBAFXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbiBAFVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:21:17 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01625C0617BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:54 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id e21-20020a9d0195000000b005a3cd7c1e09so8466103ote.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VH6eRIDJmqG2htwwiBUHRfmcJQu8tUpo8/dCc/nwArk=;
        b=kJUJ6VHnXtJV/RJpGsUk+F1SkDNk9iTKHsr+dOEnK36IdlHwkQthEZCj5cKM/Bf4tc
         ue2vwlajFn9s7tq7oHsDmxXpH30kRR2AK6Yh9F3LmfKSKoG3n4z3L+kb6zKoEme2K3Lr
         xB65jg97AIQ/Nbdmmm5JohzIxMK0AefdQLk95YGlZSEK9ZHeiMUTwFXA5GX2l7yDWTp5
         yeD0tt+2TwD0g1WwkIbV+KMvQ+52+xJcGQ3oCNPUerzabaGerRTFtYmS0TlzGUe/z3aZ
         P1mD0MoXqacHaagUdPuzhvX+xYdY0ODzbVi9yNaHLOnu7gGCGsQVkEP5f/kQL9lZ8I7I
         C4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VH6eRIDJmqG2htwwiBUHRfmcJQu8tUpo8/dCc/nwArk=;
        b=ixLPcxY/HtrwN3pwfwLSf8785eTuMXh333eglDErrFlFlofCngv4yjWfy3FxxpDGTe
         s62St605qvAmkJjVssvyMyQYqrBm9gZAUPg2gB4D4Zu/W6oIm8LOMb62y7i6gxTeisHF
         K/0LqApK1zt3oVf9AcxlRhivpFFJmbRzh9TPoyCgE01NLV5kNw0jL3lkEkXN3xTDXGsI
         5lPvPUkIvJgpj8QR/35IaPoPf8khkejSVKAeRf7W0ZyPCsEkF+kQC+ZV02KN5yTTn0sO
         Tv3ahYjjXWS2W2xNTgUbZx1/4qJSLPyuWEXPTmWSEdZ9os2TwoadTmVpDFhljVh2jgWT
         tEfQ==
X-Gm-Message-State: AOAM533MhomSM9A6nmdg2vobASYn6e3qVoaG+DWICmcz3JHBCoFJvLR4
        BkohBeBAm5OE8MYMv0DTeaj+2A==
X-Google-Smtp-Source: ABdhPJxpumdz/TGGbsKh0LUkddSYmoOoaF//4se/351vNBEw/uRYw7QfSeWq3NtS8UFZgeFj5Yb8zQ==
X-Received: by 2002:a9d:6c13:: with SMTP id f19mr13639055otq.87.1643692853355;
        Mon, 31 Jan 2022 21:20:53 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: apq8016-sbc: Fix dtbs_check warnings for &sound
Date:   Mon, 31 Jan 2022 23:20:03 -0600
Message-Id: <164369277343.3095904.4136664238626153212.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211214135124.2380-1-stephan@gerhold.net>
References: <20211214135124.2380-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Dec 2021 14:51:24 +0100, Stephan Gerhold wrote:
> qcom,apq8016-sbc-sndcard is now covered by the qcom,sm8250.yaml schema
> which has slightly different recommendations for the naming of
> properties and nodes. The old naming is still functional but
> deprecated. Update the &sound node in apq8016-sbc to fix the following
> dtbs_check warnings:
> 
>   apq8016-sbc.dt.yaml: sound@7702000: 'model' is a required property
>     From schema: sound/qcom,sm8250.yaml
>   apq8016-sbc.dt.yaml: sound@7702000: 'external-dai-link@0', ...
>     do not match any of the regexes: '.*-dai-link$', ...
>     From schema: sound/qcom,sm8250.yaml
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: apq8016-sbc: Fix dtbs_check warnings for &sound
      commit: ff15ae73eeee62d8eb7554ecc21f2908f32f33a9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
