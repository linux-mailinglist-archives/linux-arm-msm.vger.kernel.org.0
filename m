Return-Path: <linux-arm-msm+bounces-34309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4799C74B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0DD28466D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836391684A0;
	Mon, 14 Oct 2024 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xunehkps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FEB170A2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902351; cv=none; b=ochE8xmhXYLy1/r8igPGTbWhb9WginqsUbgx1IbpxH0jF0zQ7FWLPk9sbpTA90HrJJbEZmb5+EK5R9SB4JiGptDH+jxH8xOdoYuHAGAbflVcoXSuputhAeQJLaJj46o5Z8pqI/5WaErD61EXMrgk4GkEX6L7fr/B2+u8kBpB+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902351; c=relaxed/simple;
	bh=dZYjZ+bVrlWGAJh4DV+BwGQ/UfKe9oXeTRbUkBqlzf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO/X9AEUzAHOU+QqCmCDTAbORrdPOnp2xulkzih/N+RK3KTSQZBKFTo1jNwCtYNVOVkMBBweJe4xPVvgymV+agm8tSs9CdkPDhiVRW9EadczUIlwpgF84X659YgVVpeGlAnjV7TXDUdyboUGROVGoRYTjr75Yo6G0Lb6JIzZFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xunehkps; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f6e1f756so860399e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902348; x=1729507148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqCp4qGBX5oFyFv+zO8e5RGEYnbcL0JbcN2DWr2upwE=;
        b=Xunehkpssszx3PVbWsW9RcdxYKW6YkbaVEeZEhrQWoFc41+534H8hnyQSBlOOTdmpz
         HJ9IltFGIem70vrNnViJr08FJJWUkgqFQhLJ65g79cYHEEGiXa3DqTm7C503fuU8J6mJ
         3QS/FgDklLvD3dyZ55pSoxmU4dZpicivVDYv2miD/wF+c/vh2szZZUE8J5nPk5VLPAIf
         peWc/IwYjea53PgU+D3ek4jkYpLJHlWYMRI4t7uONaFHg/+TM6w4qq8ho7U7lBzPjIfR
         +fj2uFzVtMHmN8aLqFLeFqp/jpmcgEhleBc+QEN7uE/0a4l7GBgeHK+hhIwyi41n8b+/
         Ybfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902348; x=1729507148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqCp4qGBX5oFyFv+zO8e5RGEYnbcL0JbcN2DWr2upwE=;
        b=mB5R9rjaVjXl5ENBww+VKuNZJX3LcVQkWa69sZXyxi9TWB+GtjNpKH7iRczAN1i44U
         JnntKe+6OPhR7nJUVctlfn9oj7DPMrNnHZKwWOSPyXG31iaj+18YYjEl+u4hAQbBTRLe
         DklNqNa1hb5sf8IciPe3ZeFLEK9n+iVSZ5b8IfGfaHmusp4YSgbfd7wu+g7KlVXGceCF
         0rcVZwrd5ZWMYj4Isd3iERyg9cgDHMW2V85BVHNJXgXS9/eyYLH1KwmDD0wgGZt4geAZ
         nemsjjTn3eKx9kGBQT3DHuvrh2ayBc/aX+L8nlBgK8xI/7ntrq2YBzqw9PrIQV9QeJHs
         YyJw==
X-Forwarded-Encrypted: i=1; AJvYcCVCuoqjnJbryIgMPwX0iLxaBCvsA8tAdwRia9FzWndNUe7gFcKCkTjCjknxgsTEmJPfluw0Wc/fxvmtQPlJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw13Vr3vwoS0S9XTmZE4OSQdDw2GeWMonuuoeEDEcFzq9Y5w0gX
	0UuN99xQlQ3XOIwUe0VoXGiDTk2gkRkSuH5XR2fMueOdSSCFjLEm2kUixgbP7UA=
X-Google-Smtp-Source: AGHT+IFDzqOTWZVGOE1OSO/AvDglkmuw6rvQNiVwv68/2V0X6ueVxT1O89yennW01pxd+iTb2629fw==
X-Received: by 2002:a05:6512:39cb:b0:539:f26f:d280 with SMTP id 2adb3069b0e04-539f26fd512mr1724013e87.5.1728902347787;
        Mon, 14 Oct 2024 03:39:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e8c67e14sm825633e87.188.2024.10.14.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:39:06 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:39:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: display/msm: dsi-controller-main:
 Document QCS615
Message-ID: <gzumywikv2otvw2e6z3iffcu4z4jiptcn44scy6rzjivx6fr4y@busi5zidmpdt>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-6-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-6-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:32PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>
> 
> Document general compatibility of the DSI controller on QCS615.
> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..4142c753d1c4c4797e3a3f5317c02f8c863cdd12 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -39,6 +39,7 @@ properties:
>                - qcom,sm8450-dsi-ctrl
>                - qcom,sm8550-dsi-ctrl
>                - qcom,sm8650-dsi-ctrl
> +              - qcom,qcs615-dsi-ctrl

Do you notice why the line you have added is not in the correct place?
Please look around next time before just adding a string.

>            - const: qcom,mdss-dsi-ctrl
>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

