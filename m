Return-Path: <linux-arm-msm+bounces-2146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474E7FA77E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 18:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AADEDB20B20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F5934CDE;
	Mon, 27 Nov 2023 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CE93256;
	Mon, 27 Nov 2023 09:06:16 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-589d4033e84so2373507eaf.1;
        Mon, 27 Nov 2023 09:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104775; x=1701709575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWvJMjZ6wf7DZDfLqz8m8/1Tw1FelhGhcvu4suyu0c8=;
        b=jdx1ut2snO5iTLddkc1kWI8cXB2ZEJ0cXmxBIIJIhFv/P4v6CmBz49k6DmePTNTN/N
         k0NCTZe/+YL0wkdU2ZXZnBMWAenEX+bJHlWA/zRipyue1b+I0va3JI7/AYP4fYUVDOgs
         JzPKiyzoLlYQ1NtCzHBf8PfTiCK+AkqIOd2eVGHh93x67fEm/4CJbINrVhNspBF070Gj
         ZJ/yINJ9xauWyJkeE6gXFcX5aVvhOjY/dCZoKmr5IwgMJv4MIt5A6GVKvPYQTRBQ/JKr
         IuB/nIZ4Qhg4WqRM7+ydXtFDBztQnDkEWKsK4Yp10f7jfAyCxHXKiZ5QjtzsrWN0mK7J
         eG3w==
X-Gm-Message-State: AOJu0YzRZxXimhpu8Y0RukKOihYu+0XWqIcWBDNm7LqMjLdkDHY//sqV
	dIa1cS2QcZzx6Bj4oQI3n4ri5ttatw==
X-Google-Smtp-Source: AGHT+IGomlZxiLfZXj8tSZA4lc0/MxCM/APuXjlf1dCwBFKdZvDLqTjOQLkhFGr26D+VaTkL4m/9Sg==
X-Received: by 2002:a05:6820:220b:b0:58a:128:8ff0 with SMTP id cj11-20020a056820220b00b0058a01288ff0mr13465794oob.5.1701104775517;
        Mon, 27 Nov 2023 09:06:15 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r21-20020a4aea95000000b00581fc1af0a7sm1552890ooh.28.2023.11.27.09.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:06:14 -0800 (PST)
Received: (nullmailer pid 1458096 invoked by uid 1000);
	Mon, 27 Nov 2023 17:06:13 -0000
Date: Mon, 27 Nov 2023 11:06:13 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] dt-bindings: qcom,pdc: document the SM8650 Power Domain
 Controller
Message-ID: <170110476457.1456623.11118726147199543641.robh@kernel.org>
References: <20231025-topic-sm8650-upstream-bindings-pdc-v1-1-42f62cc9858c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025-topic-sm8650-upstream-bindings-pdc-v1-1-42f62cc9858c@linaro.org>


On Wed, 25 Oct 2023 09:27:36 +0200, Neil Armstrong wrote:
> Document the Power Domain Controller on the SM8650 Platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


