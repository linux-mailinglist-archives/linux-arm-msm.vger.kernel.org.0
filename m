Return-Path: <linux-arm-msm+bounces-33284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9F99213C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC48A281BC0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AB8189BBA;
	Sun,  6 Oct 2024 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvJSS9nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9621482E2
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247237; cv=none; b=PB0Uy94rh8bS1CHZBdL/GNVsIyfsd3sIe2fPcsjPq+D+ZHfzKhCEdPC2wU8r5mRN1wHQnnJkcaTbZiaEYtAKxTpvLmiepsZCbY0jO4ToMmMam5S+gNeSv6aotLgNgRR8lfOVKtclgYiUCw9z9eLEZoZzWiomQCck3YI7l9GpdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247237; c=relaxed/simple;
	bh=cxOlSWd/pMPWbXwReS/2MiMfoBkulsEZnMbKBU/u82Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1HOl3bN52IZUYVXwG2Q74d+J8TiDg9l3m//7ZYdPK3Wpq/KgTZXks3O9IK7qAEfWGxEQh+fD0TSnGOgLqvDPq1HZVJWlc70OSiMhj2v2oHaxXIBqdMww1BFJ59rDXfHHP19rtLAfv7Us3Q7qr6CqXDKffnmdlKpOBMAAaMweYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvJSS9nk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539908f238fso4028452e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247234; x=1728852034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCcSKpIJUe3fTkwhqSrgq/Evqsh66fYibnGWceFXfJg=;
        b=UvJSS9nkHnNmO6hqrnxTTAJtrK3Kl0KDRONDVVTgOscf9xXqk0jakxjX1S/ioTvuOM
         aqbM0Cot42zJQKEQx42380J2eun5CHhqdWeZnKSKCocPl4APtizhyj+U+JvVvowyV+GD
         h+Kc1SdLO02WqGYmL+CCN9BAP8Mp3RUwewDL6jLWN7YR8/phfaV4FjwPlc8mN0ugyv8W
         d0LpcplyLTvldQ/Lmc/QqNMnk6P7aM+h3weV9tcmzBmMMYVKKQJ0CDu2pWWhN3U2Z24x
         S4GgyXVN5Takh4n05m1igFZOrQ1jBylFIuZrRtRVgvMcPc0cEW0bP6ga0MVywV2MtYIZ
         3vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247234; x=1728852034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCcSKpIJUe3fTkwhqSrgq/Evqsh66fYibnGWceFXfJg=;
        b=FGwqDH2kv+22foTz5AR5CnlVyYOROkcwxsG/bm7/3jMNG2xGWft8oWz/MiFFqBXw5o
         Ys5cDJezfSAmVgmvhgom30rz6j5cQ8F3gtnozzDcaYne6MtKuFYpKAal82WyXGlJvSgD
         0KNOjsA3Pcqnquq7XGR5EBU/O+YCf6lf5QQhAF9zl0fjGRM+51vX99q+gAnVqdo/BrDo
         KJvbVf2kkdhuU70VnklOTQe8l4lO2+rxg8Re31KPztsEbITzy5OkW3lG/+BP7dPB/WO3
         aVaTMDfb6OoRETGzUo0pVuH7cO65gp8OXcymv22WUJGtQojHEVKYtbavTg0ddyCes191
         wIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCULE/2sgCW15pcC/JNQpgQtmI25WRmaK/Ei1SIxxU/Gsr7LKB27wnYjhybCYW01VEGtDW2O8XO/IkAgjkma@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiG8AgJ+S0RSart+i3U/Suit7XXkUMLdtzW1s23bfROwroEmQ
	M3dQmSwC5f6MqSPuYZl5uq13qgP7oyycr9ri2rV98wXRmUOe7NOdzyrzc/pbVbk=
X-Google-Smtp-Source: AGHT+IG8+kDD0E+S6aGBtT3ny/KHoHxXGLgb2vxwOg52Amd380qwmfcHnszuMs5rLO7D/6TrycwfpQ==
X-Received: by 2002:a05:6512:6c6:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-539ab6d9bdfmr4233900e87.0.1728247234296;
        Sun, 06 Oct 2024 13:40:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23e0bsm621231e87.243.2024.10.06.13.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:40:33 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:40:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com, quic_krichai@quicinc.com, 
	quic_skananth@quicinc.com, mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>, 
	Fabio Porcedda <fabio.porcedda@gmail.com>, Mank Wang <mank.wang@netprisma.us>, 
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <ya22me5qxy4vhqcfwu6hfctxthog3vpj5dxee45vmdctat7hrv@swoquk2audro>
References: <20241001113738.152467-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001113738.152467-1-quic_vpernami@quicinc.com>

On Tue, Oct 01, 2024 at 05:07:35PM GMT, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> This Qualcomm QDU100 device is inline accelerator card
> which is an extension to QRU100 5G RAN platform.
> which is designed to simplify 5G deployments by offering
> a turnkey solution for ease of deployment with O-RAN
> fronthaul and 5G NR layer 1 High (L1 High) processing,
> and to accelerate operator and infrastructure vendor
> adoption of virtualized RAN platforms.

Please replace marketing text with a sensible description.

> 
> https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf

There is a tag for this, it's even called 'Link:'

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 49 ++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

-- 
With best wishes
Dmitry

