Return-Path: <linux-arm-msm+bounces-34185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0C99B191
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 09:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022EE2832E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 07:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932D213DBB6;
	Sat, 12 Oct 2024 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdFhtjPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650FF2581
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728718419; cv=none; b=qJZfPWc1AR9OL9fgIJUX4GloMpk810zdJ8NJcUfiOMa/mNs6AZW0NeCNS4H0V5XGeI5ZIuIuRKajGyJfEEkFIhLKNoF786/NteLZEnPKn/oEwpX6hiWeJaJDwRuSwMpei2UKAVJI8jbxJvE7TjExOgPCl79el10pZGFqW2ktGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728718419; c=relaxed/simple;
	bh=XpkD6PjpGuMLKRRIelZOF4WU1zEBhCUk3dVVAmMMKN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6/Lp2zTRIPQDM+5Spop6IR5V5c4giWc5FBwIyz/Nj2rSGgrFGuv9dbFq9bqRDDAsJ+7LbCRbngecQhHFuUHuCJOEHp+M0t7vJv+HCUO1g0TThLNrF6iofz7HU9hMFMeuV09BoZ+xAQ5nH7YBQcmqREmGfwoGC1aY+LnVMLZRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdFhtjPC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so26318821fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728718414; x=1729323214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HxH5wdzzYhATwK4YbdIT0t+B3UnxhMUOLH9SZSIajk=;
        b=CdFhtjPCbfGBw6G0IN8HA72ttLh3xu3eXD78VaffOjYpcJSKtWiwKwKJvFRhGx5Keh
         yJyoon0mmWO8xXQcVF08ThhAVA1qYdqJp0INDOjJfHES2l6vokETSbT4OE0pbCvvKawR
         7tmJNTEOJrZf1wm2eGLjkbcz8oFYDX90UDGWFbgqKbpTz5PWI4EHovpWehtWJDmIL84S
         uwcWzEThwE57CcG3x2VHWL3IwrCYEPgjT1CXWGTFjTyx0qgTbryCXIMn7Nrq0y20/qee
         Z1xKSMLOYuX/0QdillkvLdRJJhxL0cxnC4st9EWs+mNEdosqmoKxRzLtXp2uUDx0qiwE
         1nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728718414; x=1729323214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HxH5wdzzYhATwK4YbdIT0t+B3UnxhMUOLH9SZSIajk=;
        b=spTH0t+a2v81c+B5aAVe+urYGhd2nPx73ECzs3kdKrR5AV9GDqlOY4fByo4huJ5YSh
         FrRBQUsvpx8DvjcXPyaLQ9YNvlNeLpgrv7ae8e0au8Wb29hIenjQyNlDOkgfwQnOT0Ru
         1+XXpSEZekonwf0W/1QGhWVsXabtG12Vt1/qQWgRR+T9StFyURpfhC3g9sN+aLemtVU+
         gQiXl2LZH+vdjKDo9dyQrtK75wCVTdjDyzPw0GaV2BSBDwDIshWoch0QEQbcvrXZf9eW
         DRYaHQZmjW3DZD8aE/xaDRs7O74jUOMbtYHPK6dlIUxVy6b/mN00Sysc4Gp/izRtE9nf
         /C+A==
X-Gm-Message-State: AOJu0YwXWoGWwqzwYO6mtaLKCf4rPPsCFIf44UE85K4VGOnHrSWhgc/r
	Yi5XPTFE0VSnCHOyg0lojGmU6L5EEs+cc1WFM52AOdtI9JAaAFqLjXOiI7a1RQI=
X-Google-Smtp-Source: AGHT+IHy04luOQ5N31Y8h7T44ACeH2SV/eM1h6QEEfVLa/G/QNFeE1H9wyjUiEaXrCKjKx7jotKsmA==
X-Received: by 2002:a2e:b889:0:b0:2f7:51e3:fe2f with SMTP id 38308e7fff4ca-2fb3270b0aemr21112811fa.13.1728718414445;
        Sat, 12 Oct 2024 00:33:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb24590c17sm7156081fa.39.2024.10.12.00.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 00:33:32 -0700 (PDT)
Date: Sat, 12 Oct 2024 10:33:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: enable otg on usb
 ports
Message-ID: <vln325xaz2sgshikl4lytdqjlra56khz5q4jp3vzmk3xojrdu4@w3thwqwpgqqh>
References: <20241011231624.30628-1-jonathan@marek.ca>
 <20241011231624.30628-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011231624.30628-2-jonathan@marek.ca>

On Fri, Oct 11, 2024 at 07:16:22PM -0400, Jonathan Marek wrote:
> The 3 USB ports on x1e80100-crd are OTG-capable, remove the dr_mode
> override to enable OTG.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ------------
>  1 file changed, 12 deletions(-)

I can not verify this on the CRD, but at least it matches the
data-role="dual".

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

