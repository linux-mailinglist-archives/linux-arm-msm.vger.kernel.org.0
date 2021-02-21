Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C541F320CBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Feb 2021 19:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhBUSk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 13:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhBUSkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 13:40:46 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45647C0617A7
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 10:39:35 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id c8so51748239ljd.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NhYOZbgBpd4mjAxZCaWZK1LAzWuXyFM8/hnnTWXx6so=;
        b=WcE3YfpuwsaIbUWi+3p8vcZMWVlvLG227eL4urxfnk+0rSx5+Mrftg1MiOpgzYY/xO
         yVNA92s1myyzTf5DE/UetWToGByOlpbmWjxyEuF2L9h6NiTO0po/EZRBtENCYvamLDok
         shZJZoPIrYBX8fRG4N9dxLVhj4/ULftnMzFP3QAHLxDcn2tzhAHKD1DnhBF1UJdPfaZy
         KAkA2Q9PdwApPyLYr6z2SZuVi5sRumkkfdX/5Xfezt6MfbBEIYwoYfxfXML0amY0zh4G
         c35VmcX/LZjtdCEP8f+Pq0caFbfBlEqG0rb1AYlGk8AR/uqOkTsavlkWJ7fAUN2YJZt1
         yYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NhYOZbgBpd4mjAxZCaWZK1LAzWuXyFM8/hnnTWXx6so=;
        b=WgxMMXqiVlH4E3y8ojjkGkGnrhNOuswrnLBsjYoHgGSwad9hJpmBHiVjnGL3tVTtl9
         i5RBSsP5e1wvyfbP2s6XnZRzl5cb9sUfvkb0Jgta9OpnkhrbwjufSBDeXxBxwd4jwgWx
         Emz9YYi+SBWbtHXr4xQZU3lak7sDRqS/bkb7UdsOQIUEMCAnbelJZAad8IQXEEjoN1nJ
         IPY0bYFCe17KFrlhdHMgJKw3C4Cc2RhGISnqf0vxXbBQdqk8MN7aX4iOmKVKiJcmz1Bv
         eBnhymadJK8d22a7tx6/rSi5U3N3PRFV7NBK4VC5roljezKI86O2bRFnyB6ZtexLy/un
         uYUg==
X-Gm-Message-State: AOAM5330FmapSl4OobqD6oMReUj9EA3GBL5EZFlUzk87fmBJZ1FIorTm
        dbUZSXYaaqTZucgYVbQkg7Vipg==
X-Google-Smtp-Source: ABdhPJyuvHfzWnYWyJihn2ndFwj/qnblDirw0I0KTUo8pRXKmboqktGnHYLVV42qAQ9YNDaJlfxDEA==
X-Received: by 2002:ac2:5f6c:: with SMTP id c12mr9185267lfc.316.1613932773820;
        Sun, 21 Feb 2021 10:39:33 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id y17sm971708lfh.221.2021.02.21.10.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 10:39:33 -0800 (PST)
Subject: Re: [PATCH v5 21/22] arm64: dts: sdm845-db845c: Configure regulators
 for camss node
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-22-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <b033d21a-72bb-6965-2d62-6e7d67113f06@linaro.org>
Date:   Sun, 21 Feb 2021 21:39:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-22-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robert,

Thank you for your patch!

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 17.02.2021 14:21, Robert Foss wrote:
> Add regulator to camss device tree node.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index a943b3f353ce..5842ab65789c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1106,6 +1106,10 @@ &cci {
>   	status = "okay";
>   };
>   
> +&camss {
> +	vdda-supply = <&vreg_l1a_0p875>;
> +};
> +
>   &cci_i2c0 {
>   	camera@10 {
>   		compatible = "ovti,ov8856";
> 
