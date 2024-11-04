Return-Path: <linux-arm-msm+bounces-36912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6939BB29E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0371C2178C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E168E1F76DB;
	Mon,  4 Nov 2024 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDKKxYOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067F1F80AA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717752; cv=none; b=cTI6RpNDYa/OjV9nY1rzOFXWduUq0KnWFwT6k3LZFBheh8tci0N7gFeu7ExinX5LKIul5PpWr7MitOEPdlrwINIlLUNghzWOXE002Xo9bKUj5vGyeyhDIlZl/IyhIE74WjsJFex81sde5HQxsJgChQi2fsFzgb34ZhKKBDB6Ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717752; c=relaxed/simple;
	bh=c8wGjkPlYVNRPfGqZMa6pSmboLrkZFgSexB+/+qfnkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lh+Gp1QFmETD5mjq/h2A+KAxOUwPTnDEYPBV81L51xIDGn7+DrNzOK7a3djXLkb7Q4DjCLCOXAnqvdL7ajANxZfi+BJ2kCXmfUIDvpB7CcuLtAnpjmyXKYtyaFTb5+5mqCzRB0RTYF+arRG0xfCs0IQpV1fDQtJ2cBKW86qfb4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDKKxYOT; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fc968b3545so36634801fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717749; x=1731322549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=waBTGTBlHfd2MNV2pSDkGRfLXdLzKoYk2Pq0OYzBkOU=;
        b=iDKKxYOTav3FlKlyvCIY9PRTCGFxKIM8oKRD4scy+A4gwAo3AwXDGcf6AQV2+kKSTO
         O6c787h44MtAcNmgIjxibirN+4iT07SYswIJXN08I6F3XhY2owDrgAiUSTAInFhlmCec
         Eobu8WCPM+jBTx+R2tIM3D9M9HzJYCO/j/a1aKx9rgFPQDm5lc56499g99bRq9W2Hi/x
         cxnSijgQ/fncTOUoDIKFKJV0eHyUBz+8Jn6fB8z+xQr9czjluCpvc46HzW3WHGVKJR31
         zp4G0LeloJpgy3rE9DzgKTCyic78TDu5l/SK45flm4pxaYs9yQGhWZFI9xPh5Zet2332
         VOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717749; x=1731322549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waBTGTBlHfd2MNV2pSDkGRfLXdLzKoYk2Pq0OYzBkOU=;
        b=l1pu2XGRin1dJR7gdT0U0hPa832SXpGLGnnC5ZaGIVmuoBC4DtYOKpEC4UZtTGXA7c
         9efRmnhWBoy35z2yLvDiADzLbSQ0lnQGK9o29J9DPFzMInvtGtqJlo4lDV9xrb0JZWyn
         phcEA8Ds4fpiqRMhtLEdlmTLOboeWUN7zC2tYYQdpzX+rt2GYEdF1pEqC+TfYdIdIr+r
         b4gmqyoQD7Qr/w0tPCLpiHQ3cLmvP+OTAp98oM9QI+C8CX3q6UhBsddI5//8RpGlyfOA
         VJ/VEN5AFcuF0TbZvmYNSghnailt5QL9jdBhOlVi6xrn2q3eKhW/7EUvIMzoMt4Oa3ZH
         ZYtA==
X-Forwarded-Encrypted: i=1; AJvYcCVZUbJ4XDxZVZVLJTWGFVCm5k6LzmS2NBEpLBf7WrPRQJkdKC7HYpE2n3NI0oS8ZuCVN/crFngy1yAFOz1T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OaCNS7V6eBKB2ILP+7jF7Rs5XLhN4ga595/GZu7mJFSAPmyl
	ELbUBhfxqHDWu0S3sixXE+UwWT8CRzAzDgTQ+oJDNJxkT54jpSTR+z9dYGYDlEE=
X-Google-Smtp-Source: AGHT+IFIdshEtjyMvc0qsRzAdG4WZnPMu9TjKvznb5pP5VfP0Yu1NA7g4L56eiwhpWFlir9ooEF7gg==
X-Received: by 2002:a2e:4c12:0:b0:2f6:6074:db71 with SMTP id 38308e7fff4ca-2fdec5f831amr53140821fa.17.1730717748783;
        Mon, 04 Nov 2024 02:55:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6404sm15870731fa.84.2024.11.04.02.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:55:47 -0800 (PST)
Date: Mon, 4 Nov 2024 12:55:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: rmtfs: allow building the module with
 COMPILE_TEST=y
Message-ID: <eac2ese3gmzkdxhmgoj7qfs35izrgb3oze5es5kr6wn64t5guy@bpbolwqttdui>
References: <20241014130303.123394-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014130303.123394-1-brgl@bgdev.pl>

On Mon, Oct 14, 2024 at 03:03:02PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

