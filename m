Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA4F13D046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 23:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbgAOWoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 17:44:10 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40886 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbgAOWoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 17:44:09 -0500
Received: by mail-ua1-f65.google.com with SMTP id z24so6936185uam.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 14:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbsE7yB3eGOjL7w6M5aCw+NaQ3bQ1Ie1J3/rIfgrCSM=;
        b=EXJ9JpxfQFkpbNO5ovU9r+uWdsKb6mmP3FVs0MzgAX1M0W5ezFJiXtx8rkazXI2s1M
         +fUMgeM4ULCcj/ldqsgpEm3+8rYCC0mLe1fn9fAoRPYgkZL+X4xaIE0elUZk9iBF++/y
         oNXg8Luw40ipFqpEBdGl33Y8JFZRautwdT438=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbsE7yB3eGOjL7w6M5aCw+NaQ3bQ1Ie1J3/rIfgrCSM=;
        b=QR0f28uN7QCaZZMRqb7Rd/6eBbugP6jtFNZRKeFyswdMT42E1IqHrjWRDRJb5LWi0M
         9rovI+7ggYY5o4NlDskw0b97RQyHTSaMiwsgvr6am4u+BsDupsKH9AmPWO/roZs2U+WP
         aogVWR1gGknKmqaPWxm8R18QHx6bG1LTj9QhYGEV2gsMGfxeJmNGFz7IgJ+zOcULdNco
         l3NinqfEBBHTU9dSSiVnWkkgTQu5TgDnvtZRYRNDmaC7xU715TTX+ByBIqqKE5mXlVGN
         0lwa1KOu8IYv17vkjzZG9Iyh+M5LIsOUZGj5FT5Em+jjuIli5x/dpBhqA3Rh6yGeD4wa
         eeyQ==
X-Gm-Message-State: APjAAAVvN3j7AvTLGfMma2wRIQESZWenxSA9QXqpcmdg9sqOX+sSGO5Y
        B29mXx2n13BCBiPhxDUiJXFXsyene/4=
X-Google-Smtp-Source: APXvYqzkjOAWFHIvUd5yfqG0zLijf6OzUWsc9hgHeFA4NDIzWHUnKyrVtBuct8Tt8EIUX0JTffljmg==
X-Received: by 2002:ab0:2797:: with SMTP id t23mr16459238uap.84.1579128248068;
        Wed, 15 Jan 2020 14:44:08 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id f22sm5140949vso.8.2020.01.15.14.44.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:44:07 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id c14so6925826uaq.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 14:44:06 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr17735083uak.22.1579128246442;
 Wed, 15 Jan 2020 14:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Jan 2020 14:43:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Voec=RNabf7eqMDd68J7KCgVpNwvUxaz6SVwGMnrCppQ@mail.gmail.com>
Message-ID: <CAD=FV=Voec=RNabf7eqMDd68J7KCgVpNwvUxaz6SVwGMnrCppQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add iommus property to QUP0 and QUP1
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 2:18 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Define iommus property for QUP0 and QUP1 with the proper SID
> and mask. Below SMMU global faults are seen without this during
> boot and when using i2c touchscreen.
>
> QUP0:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x00000043, GFSYNR2 0x00000000
>
> QUP1:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000004c3, GFSYNR2 0x00000000
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
