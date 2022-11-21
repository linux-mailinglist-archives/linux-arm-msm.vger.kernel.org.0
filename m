Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BFE6329B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 17:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKUQhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 11:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiKUQgn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 11:36:43 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1BDC7239
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:36:37 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id bp12so5880825ilb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cp2GUaJ4Q+axhxXC6f2KvKPg06VkSSSruHyJ/Tswgd0=;
        b=CK+teSe8L6CR9pYTU6D/tJpcZa1FXXOXPrRcYCLyEdQr0jhYE1AlxU8IUbtfZON5IP
         jJdiaaYDssxtAdo18KG8wC2QzpNZS8LIHP9DwQ/xg1UDkEUn6Kh4qihynbX6tXY3KcBi
         UWA7VDSgg1Y9s2n7P3flwLNuh0PhDWPVm/HuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp2GUaJ4Q+axhxXC6f2KvKPg06VkSSSruHyJ/Tswgd0=;
        b=6hEbsOKaY9MyJNv71cL0xdHa6mRQtbQoQ2uMV+ASy6p6hAGlIcsEtjsYYYj4ebozEN
         TvUH9cAthBRsuMXZPUspLEcYcwO/Q6cca7hB/SnGOLpCCvdi+rnbhDnua9eDWbr1Cs7e
         eOeRZJRoU3jtqWTFF1oVY8eToWtxBOUGfF/eQXQgPZNVav54cZt1h3ov/L9KMrsDR0DM
         T3cHnB74f1H+PJywyJU6LSTqF++PU03PBtYvmZCDvca5/SxGEHUYuOYTsu0+ENmp91TH
         D7Rps8ADwzlgacoGgdgJdAxY/hc5+dKbb3s06tJ8a6CJ693JG9IQfDL3CjOoxqkbwVXI
         PxEA==
X-Gm-Message-State: ANoB5pn6UH5zafNv2Ze9vwA4Ne5PVZOLgbAlemUmpjnws4sAh6p+Hc3t
        P5945cdGFQ2JxJZkg8+OfZOhbKNqIF8hNg==
X-Google-Smtp-Source: AA0mqf4FMjBrQHyDsYVl/MrxmyHkHgvXCKjaxSVSllVw7TdnFWn/bEbZtu13JPJTQBiYzVj6VXTORw==
X-Received: by 2002:a92:d089:0:b0:302:52b7:a5cb with SMTP id h9-20020a92d089000000b0030252b7a5cbmr649867ilh.241.1669048596896;
        Mon, 21 Nov 2022 08:36:36 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id b24-20020a5d8918000000b0069e1bcbddaesm4445716ion.16.2022.11.21.08.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:36:36 -0800 (PST)
Date:   Mon, 21 Nov 2022 16:36:35 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document the sc7280 CRD
 Pro boards
Message-ID: <Y3upE5FfSW+jgQXT@google.com>
References: <20221121043437.21925-1-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121043437.21925-1-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 21, 2022 at 10:04:36AM +0530, Rajendra Nayak wrote:
> Add compatibles for the Pro SKU of the sc7280 CRD boards
> which come with a Pro variant of the qcard.
> The Pro qcard variant has smps9 from pm8350c ganged up with
> smps7 and smps8.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
