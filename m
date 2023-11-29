Return-Path: <linux-arm-msm+bounces-2507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893DD7FDBCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 16:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B2F2826AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1399038FBE;
	Wed, 29 Nov 2023 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0CDD48;
	Wed, 29 Nov 2023 07:46:03 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d80245b6easo3689753a34.0;
        Wed, 29 Nov 2023 07:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272763; x=1701877563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX6FM92SzLMJeCUeRB2dg8tFHhzxvahPIFNJy6PUioE=;
        b=ch8F+w/Eb5ETm3KFyl0zNg4CI0blrdrygF2ODPI8DbjaPS1yCRXWhmK4XKWwZv9k4z
         9GRtaISsMHMQDbfUKVFdce/eKzMGqakptav5pbcitUwI1cIzIQUVCSHWOs7ll5esaVS7
         gJQa+VPKt/HI3eEC2U8C79cNrGu19lD+9mGl7YHi8QffUa3ITB8foviLPrLtql80c6IC
         SLakwTT0A/HyUuEyhcpMRfpSRs4aHvdpYgoI4X1nOAo84fiN6GiFMVPUPx3YT9LXfJKf
         DHHBBqiHO6Hkb0223iy9a3baMWBm4hQgNFLMi8V7jtI/fq19dxQi8oNNjrVIKzSlV8Fn
         e5qw==
X-Gm-Message-State: AOJu0YwQyXGbwx5rXWvjEXrKJL0mopNcIEnrLHtzIRDRbhyypI1Iiomr
	OXTthpaQV4rpP/Tz8elwcqfSSR+B/Q==
X-Google-Smtp-Source: AGHT+IFe/c2yEjmho9fO5Ng0eyX8TfjC8a7UEywCU9SJ9uswigu1VI/ra5Lv1itLA8JDaUdHSpMlJg==
X-Received: by 2002:a05:6830:1450:b0:6d8:53a5:7033 with SMTP id w16-20020a056830145000b006d853a57033mr1459616otp.0.1701272763215;
        Wed, 29 Nov 2023 07:46:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l14-20020a0568302b0e00b006ce33ba6474sm2019660otv.4.2023.11.29.07.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:46:02 -0800 (PST)
Received: (nullmailer pid 2540896 invoked by uid 1000);
	Wed, 29 Nov 2023 15:46:01 -0000
Date: Wed, 29 Nov 2023 09:46:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross <agross@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650
 LPASS RX
Message-ID: <170127276101.2540836.14444552479968015113.robh@kernel.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>


On Wed, 29 Nov 2023 12:30:11 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
> macro codec, which looks like compatible with earlier SM8550.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


