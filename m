Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101197D892B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjJZTtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjJZTtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:49:11 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3F5129
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:49:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso19303671fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698349748; x=1698954548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQo5Ygp/VQo91WmeIUySmja/g+dCMkIYU04Du3vd0v8=;
        b=wid60CB5Bpvbkmhp1MIXxm8Qu3zrHvM4TQINW9zKATbsYzSVEVBtLONQjCOoJF6fE5
         YkxUfQxq9au7lVO/fLnbBukaqvtde912/TvqKRTfEv89C3RWeDEKBefOQ6BalfDj+XV+
         rM5cX8Sd31a96C88N0WyPRSv20aTgok5jilPTXc7+F+I5lh4K3weRRMEi3OfrYML+ddL
         2c9Ve3PhaUgA9w8Phg+r4O6nKHY4bBV6V/81HlS1CfMhSrgWHARBRea6MGwEVQCQQ65e
         OvDqsPki+dyotsTovQeZmiTkvz5G2he8xrL3KnFmC5MKVQT3PVLdbG5ikmq5OoXLTIVh
         yz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698349748; x=1698954548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQo5Ygp/VQo91WmeIUySmja/g+dCMkIYU04Du3vd0v8=;
        b=M5LPFzs9k4WmMwhM5cl/ru0hYfnezQVFXCWY4wHVTSmNMWV6wXtUv0IjkWHIo52FGE
         N9txVihCGz+/N5ntHgXhtIBuiAFsfAoE7iHVNLEKsKQYPhHPoLeVEnuGl/nbPtPZC6Ww
         YQmfNt9nbwYGHBoGU6ciSD+4opX4PGBsIjFm4YYP4/3JF5AHffxXHlCjj54EfCRBWvz9
         RZPWOZck8+gBBTRvJ1uoBFmdOz2O9/exLf2PJMCDBz+gD0Xo+tx4LH4XsGb7Horke5j2
         HqajvVBe6iq9XUKvJHrYJulOOM36rQbIFOwCIi7aon0jojraH3isMRLleR2Gxs70Vz8p
         qw8w==
X-Gm-Message-State: AOJu0YzRKQenpaiJeZhoihUaD0dcZxLiIZIUwBiPWcYtQw6XKD5QlnJa
        XA+Nw/7Bpkbi9NcJa+NDLVFcvQ==
X-Google-Smtp-Source: AGHT+IGgTfzLPhO1//xaSTpCa7fs+zQz0fBWXc3bke1iz6X06ZDQRa5OfdLN69OUvgixhEZ8/69lYA==
X-Received: by 2002:a2e:a228:0:b0:2c5:462:3048 with SMTP id i8-20020a2ea228000000b002c504623048mr498548ljm.1.1698349747935;
        Thu, 26 Oct 2023 12:49:07 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g17-20020a2ea4b1000000b002bcdbfe36a1sm3014040ljm.84.2023.10.26.12.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:49:07 -0700 (PDT)
Message-ID: <858f06a4-fe18-477d-8366-6100bfb24702@linaro.org>
Date:   Thu, 26 Oct 2023 21:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] drm/msm/hdmi: correct indentation of HDMI bridge
 functions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
