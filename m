Return-Path: <linux-arm-msm+bounces-3557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61555807109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0722E1F2117D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0A239FFF;
	Wed,  6 Dec 2023 13:42:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707AAC7;
	Wed,  6 Dec 2023 05:42:47 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3b8958b32a2so4220841b6e.2;
        Wed, 06 Dec 2023 05:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870166; x=1702474966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLzpQ4fOC8RLmPkow4CQkCwl/Mdnw93sW11GlybnYgs=;
        b=ZH4AezgBVO9Cg+oP++6voEmQ5G67m7jKi7sUbRFbAf/BJABErhbodQYu0LOGidapUX
         wNP2/FdaP+/muzCAdhzMADkjOH006IbE+dGDpMp8y7gkFaygUc4Le1P4xx86beqY3hz3
         Q75pSVKPtsrxlKEjNn3bvd0aKe03yVUpOE5V7hfVtzfCctWNdU3l2+f64mTDdzcEeS0Z
         ESwrmqveYKrZUVOnCpXQk6TBAGobJuxHLHsxS/bHU708tUAn0/7DNliIymdGeULpmPRO
         duB0jTysqO2WoXdZY0+5BDKTs1zil8fqAgT/JzJdLLtQQ0fAnrjLMAluUakOHHhb7v3k
         Yniw==
X-Gm-Message-State: AOJu0YykRCxkFm5NdaH/KI10B9fGtXhzYQRg5+E21MkXpao05P5EUyd5
	bhouG0UO6OU9l1Bk6sPotQ==
X-Google-Smtp-Source: AGHT+IE7PnaaolCnZdgfvQMGg6RBkpYWak6PaCEiL9P2gMCYQYxnLE6AEQWyIP3OQXfLn3puL5Lwpw==
X-Received: by 2002:a05:6808:1410:b0:3b8:63aa:826f with SMTP id w16-20020a056808141000b003b863aa826fmr1470443oiv.25.1701870166732;
        Wed, 06 Dec 2023 05:42:46 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o27-20020a05680803db00b003b8388ffaffsm2544248oie.41.2023.12.06.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:42:46 -0800 (PST)
Received: (nullmailer pid 1999706 invoked by uid 1000);
	Wed, 06 Dec 2023 13:42:45 -0000
Date: Wed, 6 Dec 2023 07:42:45 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Allow
 #power-domain-cells
Message-ID: <170187016332.1999400.6374393677018050947.robh@kernel.org>
References: <20231129-topic-mpmbindingspd-v2-1-acbe909ceee1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-topic-mpmbindingspd-v2-1-acbe909ceee1@linaro.org>


On Wed, 29 Nov 2023 20:12:31 +0100, Konrad Dybcio wrote:
> MPM provides a single genpd. Allow #power-domain-cells = <0>.
> 
> Fixes: 54fc9851c0e0 ("dt-bindings: interrupt-controller: Add Qualcomm MPM support")
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes since v1:
> - Add this property to the example
> - Pick up tags
> 
> Link to v1: https://lore.kernel.org/linux-arm-msm/20230308011705.291337-1-konrad.dybcio@linaro.org/#t
> 
> Marc/Krzysztof, can we still pick this up for 6.7?
> It's been stale for quite a while..
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!


