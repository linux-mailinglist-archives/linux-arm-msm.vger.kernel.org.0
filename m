Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0383F4D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 17:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhHWPVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 11:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhHWPVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 11:21:23 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6064AC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:20:40 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so28753350otg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/10eRL1Sn5Q/kiR0lZw/WfodeHufHGcym//9jpWnt7w=;
        b=IOpYRG+MY07J9tvduvwWQjK6ciueu0aiQHNpGbTXZAionjonsrpTcsRTR9f2yQO+8n
         gE32lxBCkN36ROv/dd1zIlll/DK5/2ITgNOQhNKyO4RMrC6UDUB4JSlqFPDpTDGQMDFv
         6l81LlJyXFsE7+FfVRc7gqSfNJY1DQMCGx0AY0ao9wrAvUg9cp8/63Vqiwv9tZLkaLM1
         nO+5BuamWe9wY0hdRdlu7epZwleC102Dzxxs6wb2YVzl5wY23tDIEdykcCftaCAWdeu6
         rQ5AJY8gL0IRSRizcRa9/mz3xh/WrhaKuOm+2K6D+2EWjEPQyi8JhHLOfpm6DSCqa9qp
         WdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/10eRL1Sn5Q/kiR0lZw/WfodeHufHGcym//9jpWnt7w=;
        b=J3psFROa8mwOBgzCkktaxuSwB0as/f+fuL6N49lbWZwlVcbZ8vKsz0j+wG7TZA62K+
         0vuohe23wWQED0Upe39x5coZQkg9CXy+TeD5Vq977iLu3HspJXMXWsbbs7Us/StAUKGt
         RmoyhnQxMpsOMW3evWkickDeEHrDGUPwF7aB5kPRMbHD40E/HYLmVHo23nd8piPMptq2
         Y485pEpJwYzFiwOdJImGneqsa1innW1LH1NV7MGByUJwmtbt33d5yG93ZPxU10AnKVs7
         91kNBoYaW0ugDucvgU+5ZElBk8+1stQLW++Q3v9DwJstQQns0fKRuU5VyytnEQVQAHZz
         bedw==
X-Gm-Message-State: AOAM531530DtXg/ARn+o2kUiVy54H03cZimctmTt0sAK2vb33QOB2WKs
        tNb1cXz7fmbVq7T221EZxRsuBKlrh7lupg==
X-Google-Smtp-Source: ABdhPJx7gegT7h10qCb7hfq5MrNH+w3ak10ThqbkgcsHOtsoUm5ZDCSNPTbAVaVDuiXd44aHBTu8vg==
X-Received: by 2002:a05:6808:2ca:: with SMTP id a10mr12381296oid.44.1629732039575;
        Mon, 23 Aug 2021 08:20:39 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g10sm3424852oof.37.2021.08.23.08.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:20:39 -0700 (PDT)
Date:   Mon, 23 Aug 2021 08:21:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM6350 pinctrl driver
Message-ID: <YSO9FeM371J8PKsO@ripper>
References: <20210820203751.232645-1-konrad.dybcio@somainline.org>
 <20210820203751.232645-3-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203751.232645-3-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Aug 13:37 PDT 2021, Konrad Dybcio wrote:

> This adds pincontrol driver for tlmm block found in SM6350 SoC
> 
> This patch is based on downstream copyleft code.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
