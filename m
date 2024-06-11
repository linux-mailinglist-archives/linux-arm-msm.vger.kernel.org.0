Return-Path: <linux-arm-msm+bounces-22301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E8903B3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B00E3B22D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA09817BB23;
	Tue, 11 Jun 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZGBVHT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8C1791FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106993; cv=none; b=Ss04ILHHAyb5ycXZOrLbANN8I2+/qfSAtsbSROGzZvkVdxj8wmV5CytYaiUuvNv/S5k92yqEhu9araxQaQGiigRcmY0FohsL3GI7Zrdxg9gExSakS7I6W3j1dk9NX689v5aZGBKGjyJsm1sHVvooWApGyFjlcCWRO0uZkpchYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106993; c=relaxed/simple;
	bh=W1uTW0uou/2g/48D5Fc/QCRPCK1v20x3VE4SAKIKhHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv0MuHSGW3j+wr0myP+XLW/oX3Fy3sDCEhSk7yuoh3uJ6gbOInLgqEcxJ2ykvm6E0VBCDNOYRqwJ3tigLtwkTIQta4jZACaMeaEDm6H42jBxu6mwrEjtTrb2nco6Qf8TbP3zVGjx260pWk5fqz3BmVaNgjeQsiCmEqRnDZhtgaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZGBVHT0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebeefb9b56so11683391fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718106990; x=1718711790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCtSkX41R6sJ1nBhx8bB86pNgXlKqe3D1DzJJjI5VBA=;
        b=LZGBVHT0CXX+Ipz0pCZP08A9F+InzuwioupJovvC4jQJwqaVpi5dnveZrewIDyLpVp
         umGs6t3TxjFv6/s9GSJcSrQ6U7XpduECh50+Cu76KAcDXTXFdMLJk0WAEWumaIY/ErmZ
         tlTz6z6cf9LegOoGj1kyOl3iYV1TYsxCYeTInvIMgUyNbltezG3IPs940imupRtvY/WX
         ilE/fhT+fYyhxAQEWHBnmVCBWRb+k6Zr2fc1A9TA/5D0JNCBJMZdmf+TE6qoIRXE05F5
         4nBF2LJnKDMyQ2oX11dXimbsvjgJ83ZcxXB3YvFuH/o6/sq+HiELoLSMymdPz5I2cs4w
         guAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106990; x=1718711790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCtSkX41R6sJ1nBhx8bB86pNgXlKqe3D1DzJJjI5VBA=;
        b=oeR8y1T4lZiGp+6atM2XKtwxcKaZXotqqX/2DnzjVHEcEMflxZvK8EI40tjvm/Xrno
         0yITAAwzCmXpBVm81vVWYBtYSdV2jQPhoxIj9wCsHvCu+WMHSD0W1F2kEnAtmF4sm6ye
         dc7cQdXRgDPazISVOKucSa5GVrDpII4cM7Dakun7pWii1Qo6WuuXoLO0kXDrAq7Ghvb2
         6XukyCXMSZ9k7+ssXYcCJQtANornZp0cxhkGxtC/9TVms4lwNFRcTZgF7/S5BZkdNgx8
         k8VjKj53yl6DjdlO64v/pQMEKQ3QXz5HxYcCiaaN2qIs/Rtf6WiybxzWKI34cy0wI5AW
         8H6g==
X-Forwarded-Encrypted: i=1; AJvYcCVf0lJ8SHhHkn4Tqspm1O1405ReyFhmuWxyr4qNbAzO+hCNE4ky4iw7NpJzumTRQoTVcneNHgOMGzk6c/tbh4ND/7X81/A/JH+pdHvs8g==
X-Gm-Message-State: AOJu0Yx4egQlT46Mx6lTJd2ChmwKr4Y+mzxoDGpwm48Qza0XfY4aRCmV
	ePelbnqVn32OVmUJyTyZ7oK1MjdmdU0jCMq5n4F9B03koMYN+n7Un2hS/BbhgAE=
X-Google-Smtp-Source: AGHT+IFNtdJSAv2AvYvNCQCWgYsYSG5yVjWDjp3ColP0ww+Rnj66j7tn3npEM2iuvVYpscst9Hb2sQ==
X-Received: by 2002:a2e:b615:0:b0:2eb:d77a:850c with SMTP id 38308e7fff4ca-2ebd77a88b7mr69409961fa.4.1718106989081;
        Tue, 11 Jun 2024 04:56:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebd4c83217sm15268501fa.109.2024.06.11.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:56:28 -0700 (PDT)
Date: Tue, 11 Jun 2024 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v5 4/7] misc: fastrpc: Avoid updating PD type for
 capability request
Message-ID: <lmygcblukqlrobkdnwadgatwf2ldum6tfbcxjr2ooi4thbv4bo@qjxv4fo7tluu>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
 <20240611103442.27198-5-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611103442.27198-5-quic_ekangupt@quicinc.com>

On Tue, Jun 11, 2024 at 04:04:37PM +0530, Ekansh Gupta wrote:
> When user is requesting for DSP capability, the process pd type is
> getting updated to USER_PD which is incorrect as DSP will assume the
> process which is making the request is a user PD and this will never
> get updated back to the original value. The actual PD type should not
> be updated for capability request and it should be serviced by the
> respective PD on DSP side. Don't change process's PD type for DSP
> capability request.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

