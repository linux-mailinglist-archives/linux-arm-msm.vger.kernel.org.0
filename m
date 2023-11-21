Return-Path: <linux-arm-msm+bounces-1330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A67F2AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 190A1B21915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F9047795;
	Tue, 21 Nov 2023 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9aSLNdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E6BC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 02:46:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so15832185e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 02:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700563571; x=1701168371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
        b=Q9aSLNdw6yAfSioECxmYigf43Sqf8Qf3gce0gwoIcA/Yk29mEoHTP5K89hbYxqdOYu
         9VPW42ZBNB8nmGuO1ZiuhGvvihXI5zXrNqcre6UZQJ7cAwmZTPLOHEuSOItWSHgN8N7r
         OKq8I7nEqIo4xXSx3uC6iT9WZNrbVnXAiFKf9NFyRgBkTQG3nvikyMAA7+E5Azczc3R0
         FwpMogbCuGDiC9pna/ktT36F4U46dSQnkP9A3dhxwXbkfDT7yN8TrdJjrz2KLVKvMVXz
         wW4/QMywFPvX9ZTmATEi7JdSAZktYBIysTLr75FZ/V4mIPWYlesov/udsHkvJsrCwMf6
         8KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700563571; x=1701168371;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
        b=cEmL6ao6zv06vGkwztTRXqqrPevu+OtGsn1C8PgXGpdYJYrTpz8fHLPkbi8qFb1KWJ
         N4+K2W7riyouX6ei3rQ5LyBr9FXSdhDvwAfqWuH3z15eYQq0XMy+fAMllMt9FUCrloQJ
         +5nF/HNgw+KFZ1aLrHQBcmwBoKL6/jokgQ0u6uCK+ciAEIlK9gR/BpzB88Oy7SgyhwlV
         bY5fBugVY/rp4ZNdc33aBXmjgHfiaTkHZfBdTjY4j2E2Yxto2S93JuvA5sOSkKGtqm+N
         7f7blT0CkZ4imVK5YaAY183a7OJLJGICRSjv4B6caGDbBS4T5mPEU2PYNxfbYOMTXvU0
         a2+Q==
X-Gm-Message-State: AOJu0YwWVfJNM6tG4lykFUY9s3F/PHq9FHdCtQTt3CR31KPSth0yZwDG
	oeAvXp42Tgp/VwpyN9124HClDg==
X-Google-Smtp-Source: AGHT+IEeZ8W+Q8V/otGe4qIWbM9OBl6X7yXc7iTRxrT4SgTPAzPVtLB58IlgIl50TaKNv0wMDaLYNA==
X-Received: by 2002:a05:6000:18ae:b0:332:c789:4bed with SMTP id b14-20020a05600018ae00b00332c7894bedmr1937246wri.23.1700563571319;
        Tue, 21 Nov 2023 02:46:11 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id q15-20020adff94f000000b0033169676e83sm14261662wrr.13.2023.11.21.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 02:46:10 -0800 (PST)
Message-ID: <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
Date: Tue, 21 Nov 2023 10:46:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to
 DRM_AUX_HPD_BRIDGE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +

What is the effect if we never attach any bridged devices ?

We make an aux device that just hangs around and eventually get cleaned 
up on release ? That's the way I read this code anyway.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

