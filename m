Return-Path: <linux-arm-msm+bounces-2508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09F7FDBD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 16:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775771C208E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEE739844;
	Wed, 29 Nov 2023 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C646D67;
	Wed, 29 Nov 2023 07:46:21 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d7e51638e7so4099765a34.1;
        Wed, 29 Nov 2023 07:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272781; x=1701877581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8jMtEURiNzR4V3tdQ4vuSuj4P0isAcJrjE2/UNfHDQ=;
        b=N3WRoRiA5dJtgvXELqRkidrqbtOngJ7aGwrOkb/hR9fkoraQAuqr14UnVLcvJ7lSSR
         kyb/SkDS3pYz3fm/89pp/tyYRhLlVDJZY/+V9rTbDtwQD5pSsiaPyZ4GSeG1cBTM3+Zr
         A4cwwes7GwT0POujBStJtI8SNvqq6oOwFWN1ylCcCdEh/5vzyNrMnLPkHAMDWjgXuNWQ
         E/dlrdtBrKifJkOtUF8LIVg2NPXgZSk6AiPpopWFveekCJ/vN3ZrisZhlFZkcw8fLBYH
         GNntIH1LGQ+5Je3HfyKeFgHqxUvB0qhY6EJ9XgqjetlOmr5VIxtRjYdPRzHsQ9gpOG03
         a3AQ==
X-Gm-Message-State: AOJu0YzOJaqX6StRxR4T56E1EUmUV+SqiDknB9HpjKezk3wIZkCOMZ+N
	16q02kdNPyjICkXqARocCw==
X-Google-Smtp-Source: AGHT+IGE0FmftmamTD2bgVIC10iZESFjXyDwF9aWF/EtRfooeilxapLNar/m/IJCblrGuTRSzRLwcQ==
X-Received: by 2002:a05:6830:1bf2:b0:6bb:1629:ab44 with SMTP id k18-20020a0568301bf200b006bb1629ab44mr20743883otb.7.1701272780883;
        Wed, 29 Nov 2023 07:46:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k2-20020a9d7dc2000000b006d691456571sm2007686otn.64.2023.11.29.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:46:20 -0800 (PST)
Received: (nullmailer pid 2541343 invoked by uid 1000);
	Wed, 29 Nov 2023 15:46:17 -0000
Date: Wed, 29 Nov 2023 09:46:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650
 LPASS TX
Message-ID: <170127277741.2541304.17955532974724492715.robh@kernel.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
 <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>


On Wed, 29 Nov 2023 12:30:12 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) TX
> macro codec, which looks like compatible with earlier SM8550.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


