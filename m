Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62914E8D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390554AbfJ2Qum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:50:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46089 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfJ2Qum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:50:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id b25so9967655pfi.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=1EcVhtgmI0wFYEgWlYfQnU4+/BM9ln0YQj1/qNn/9r8=;
        b=PNrtOie1EYtyDxfR1GgH1g/+4BjjbSeoTj7w6ok05O/9iLbYcCMl4x+Ikl0ciFmGWk
         FaHhnx8/qn1KfpX4wLCK2HWFLsJuWNZxqgoVINug1Ov1UgXgCGAX1yNNsTPAd+88zTyq
         yOb1VIHhfTVl79VXR8mcZPjz0+ZrJ5Yh1z1iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=1EcVhtgmI0wFYEgWlYfQnU4+/BM9ln0YQj1/qNn/9r8=;
        b=eipYO9/xsDDcRmNTTRsZRdd1y/Qz5tCTGvmGdI8RcIcoMk8xFbtSctdW5zxFox4zxK
         OHIgTjWh1/mYuKsmJe7/jUIXMGmkGNhkl4XNuyt01AhdOIgLfxXVu+IDKLX9tzEQP/ud
         C2jKABUpquvysd3yIGaKzv3tPNvc8LS5js/QfugMPnOS781rrNHa5a2EyRGr6m3gKPrt
         DAaRuct5/hYKakgwieqPHliJGsz4tojuFh+nVCUOxAJnKpLMiUrS9a3gpFPp6WcZagbE
         UbOFjGG8LnqlkdWmAZYo+NS6YrFGoNLSwEEuhrIE821gJyBjilLPaR5kPVeq5+lt3J2Q
         x9YQ==
X-Gm-Message-State: APjAAAVWfFRSQvDiyAypJ+jqzOfER4dDIKKksT+nYwGz1FUlCc8XbKrJ
        axRPnvZClEfE/FwvwCxshmJGUQ==
X-Google-Smtp-Source: APXvYqzuJp5yJFfn3l5GHPNYKExU7ekP3dRen8od3Km9IrisWb1nMSBoOt0RzryHGcRAF2KPFrFjIA==
X-Received: by 2002:aa7:838f:: with SMTP id u15mr28280727pfm.74.1572367841595;
        Tue, 29 Oct 2019 09:50:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l23sm329226pjy.12.2019.10.29.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:50:40 -0700 (PDT)
Message-ID: <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191023090219.15603-12-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-12-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt controller
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:50:40 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-10-23 02:02:19)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add pdc interrupt controller for sc7180
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v3:
> Used the qcom,sdm845-pdc compatible for pdc node

Everything else isn't doing the weird old compatible thing. Why not just
add the new compatible and update the driver? I guess I'll have to go
read the history.

