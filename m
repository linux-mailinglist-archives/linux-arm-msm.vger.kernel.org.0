Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC454765B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhLOW2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhLOW1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:55 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBC2C06175C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r26so33680136oiw.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
        b=NeDhHnDzQKmHQdukLfPb57fcY9sRvEeshRGWjl6VbHYN/VNd2WIdiGucN3VyQHfHyi
         ODX0tPBTzdHUhS/K/UFskuk3zbVPplOGuu1x/3hM6Od2OgzHrir6KktuGRDLF4LOX+Vz
         smHiXw5l4g/gYIGX3S+KGZWonIZx7TDqmoQI+DekZRsEy3SrNmlSXlyCCG5uZAu0Yfzf
         LJrhT5CgejLIjStw/okC2VQgzpIsD4mkhq6Jnn8j/tcQRpqfLEkVXuhlhZMr5QdglWyz
         S7wASV77km5m+lI0oQ4m2DMor4fr4TyP/uoOVeJECDFrpy5pBzEl3XpiE4O2sXMtjjSt
         YvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
        b=Buk+JM1EaP3ukiOTEE3Ysfms5WmV7/7d7YhIZNn/xWtgm+7vdJsljAg/dtAt1HYzV9
         euWK/I+f7L8xM/Wq2jjAuKzXC2Y1ZsOcNoKWPnaHnaXOYbMNEjNS5IWWf9GroFnztf5N
         3VEwp89UfMTaxNxOcTw+PL4WdOkYTRYMWB98gJitIDDnP+aFTSoNb1n3TrUf2tWgZZhf
         S7AgWIWdfgq5kloEGiNDm8fo1hEEVeGo0SFJpMS+6CCF/04fn6xrp31PxxgSzJrjYf01
         6MfZZEshlPKjfRa5lXmwyUrzfOU9zu+yzZIoWALZxpnKQ+PYKCL7QTFK7p0ptuFU6jik
         v8eQ==
X-Gm-Message-State: AOAM531LgiK0lwi0hJpHyrqIeQ2HeI+pnEoZoTq2gMPl5YPBLzrxElP8
        vqJxszYtVEMwTORMunpVDlqih0Y0bUWNig==
X-Google-Smtp-Source: ABdhPJyiZGSg7nl3iPZNacNkzzIriIsA8K+pbTW1R7BSm60R5ayfzMXsdIZwV+OW92zh2rfswPUntA==
X-Received: by 2002:aca:1202:: with SMTP id 2mr1806801ois.63.1639607274378;
        Wed, 15 Dec 2021 14:27:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        de Goede <hdegoede@redhat.com>, linux-phy@lists.infradead.org,
        linux-fbdev@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Amit Kucheria <amitk@kernel.org>, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: (subset) [PATCH 00/10] dt-binding patches for sm6350
Date:   Wed, 15 Dec 2021 16:27:26 -0600
Message-Id: <163960723734.3062250.16152122166909189415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Dec 2021 09:26:01 +0100, Luca Weiss wrote:
> This series adds compatibles to the dt-bindings documentation where it
> was missed before.
> 
> Finally, the last patch solves some further dtbs_check errors by
> modifying the sm6350.dtsi to match the binding docs more closely.
> 
> Please note, that the first patch from Konrad is a resend that wasn't
> picked up when sent to the lists in August 2021.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sm6350: Fix validation errors
        commit: f56498fc6a9364a35dd74af791bd1251467e9cc1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
