Return-Path: <linux-arm-msm+bounces-23449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE191138E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33ED71F23736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D33F6BB39;
	Thu, 20 Jun 2024 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bC7Jnas5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333BE60BBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916136; cv=none; b=MeY1n/x6qtnlr67mX27qN9jlSd79uGcrZ7f1nKFRZO7NKbxY95TmyFPJCJ5VxRiZXVWFrUtEFQu3nidZZis4DXtmr20rzN/cfGgn9x4rFi7XxuVANWYwddlyTxwCPXsynqpSa+ad/K90wwQkRJ4W4Wev0il3vhwDSpnhhqMIeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916136; c=relaxed/simple;
	bh=rZTYzdCvbBVM72bJ3BfGpq2tUtYH+usxtmwVz5R+FIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpYQFY39ScCTKdwkRsOYEbpWU+jyURkyC01efE2o6dj1Fu96rHApZ1ow3Xt5TWDfJ/QPz/hgcTR0esTwQR2x+A9jR9q96yAHNafuXEkfNygAd7X68nzgu5IK4g7Lu1V4U05bk7E9v7E8/MW3Y96XsCPi289coVb4SlTV8Pzk4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bC7Jnas5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec1e5505abso19391681fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916131; x=1719520931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K5OP7x7yq5Q0DYuXqAaTFJPJUMdV4vBwX3KqhQElbE=;
        b=bC7Jnas5Qo+CvGeVWWd+dNA/ZCzrR7DK1VbveLiWnzIx2cHaUXdGSaYTsUIFUzqJiR
         9E753WZ3E0WxaiCIEQWNwrDv7uIKqPp4mZo+xTnTjX58j8PuszEwzZEMs6uVsFuNoLUt
         FuPMlFt54f58RJ5x0nd/i+1Le5suy8PwgO1j2qzPnuLioWGVpKFa43iIp5zG5/a3AJoz
         Xx7USY2knvgAWsPw3FmBpBtzsjuY7ZM7PVgC9USw4s3ZEN909mChwcjgQ3wR8C0iQsEf
         zmVbTyCnrG1B8HMOuU1PjnuvOEdlZ/2wFu4mBdIr8RS/C2HfEZSIrGXTovpK9mBgaXan
         LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916131; x=1719520931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K5OP7x7yq5Q0DYuXqAaTFJPJUMdV4vBwX3KqhQElbE=;
        b=SnddIv69eLJD/xHWuNBlVV8RxnOc5WiczjgqJb9wxRcgfMI6SoZ4AXUXNy6bw2DeIN
         9pru27suIwbEoUD22tKogknzFxAghWXyX4G+iNMkdGn6DSGpDZZnQS3BbfpPtYKdmfRO
         9yr+S6QOMdiXaB39ESgqxH+1n63VBH5LRSDFCJtDlPEd3/D5nibC1P5LAPyg9pCusHz3
         pNqnnBaheqeJIQs3HQd5ypbsMUSVA9k601ptjt0P8Wx5NEADPwu8Osk2L+SpnS1deMAL
         unjebgHIyNKELoGIxfELO9HGNUzXlpE8gSiPVgNUkFkjDMwB2EawEx3B0rHNEnirEzqg
         t8/w==
X-Forwarded-Encrypted: i=1; AJvYcCVXN6ZSE/ndhshh7NuovnliPRtmwO0MN+KxJueC+CxeGTY28FF3NziYnzeOtlKFkwZEfCU7vzxjmartol+Uk5h54JQKi7+tsMiFbehyvg==
X-Gm-Message-State: AOJu0Yz72TbmScDgdnwQAkDKSbf/cONlj/gJZ+UIfd6VcxKqMjdzdgXj
	gZ0ovDCP2ZWykFR9dO5E41HNm4VzWduZvovDXyHVEaJBY0EN51YD9bqEwnIq7Aw=
X-Google-Smtp-Source: AGHT+IHa++EtjUUyDrE9RDcUSFkXO7DWuSSI9krY6EtnVLoSOEWveJuA9bY90htEUz1EKaY81P3z4w==
X-Received: by 2002:a2e:998c:0:b0:2eb:d9d9:6ea5 with SMTP id 38308e7fff4ca-2ec3cff4a6dmr17759271fa.26.1718916131531;
        Thu, 20 Jun 2024 13:42:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d600c1bsm167431fa.8.2024.06.20.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:42:11 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:42:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8976: Use mboxes in smsm node
Message-ID: <5zxq7j2a2juahsy3svlog6zvjkycejmlj7zqesgtllxiw4iw5s@2zwrllvtnidi>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-5-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-5-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:31PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

