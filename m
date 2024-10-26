Return-Path: <linux-arm-msm+bounces-36013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 935389B192B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576A42826C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719177346F;
	Sat, 26 Oct 2024 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwCpPHRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9C64A8F
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729956918; cv=none; b=g3R7yOf60iRmWdCy5TsVj3TcW9QuxfD9ibVQVBRWxZUJ0SOhDpNdL4vYErULtd54vuB6LcLMQij2QfJJp8FugPwEZtmCzMcbQOGGxGsIVv5HQy3jooUKE43w2Ep4SQYvLWMTsrQCc+rD4CfDPu6QbSn3Ra4WvBwDMV6gorjHNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729956918; c=relaxed/simple;
	bh=Llx+XPRJNrysBhF1LvN8whfiHHKOOZIgjA6bxQ7XJKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUpzEWX6T8YFQRScwgXBpx0DnCIl7mabGIGLRpZzhsdNmsjBAC15InZf2d+VOVBL4dBWZBvRT2qbUYzoNG1dl/QheF7QSmlUk5OpNBB8eTWrJIZNZINuLxLIIzIMrgIkAe3Cd+nGWcVZ+fB5hotLfvpa6w0rDVAGNaLLfB14Aj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwCpPHRx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f2b95775so3399588e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729956914; x=1730561714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rt/tYXWIIxsry9kkJRH0JYnpXHyALFWOiwFr/jSdDb0=;
        b=NwCpPHRxEeVZKoVB5Vu/AS9iDztr0i4hl5tbmEOIoBtPw8GuZL8evHWjHNrCSCYeQl
         D34knSwnNJkyHA5oQPPIEbJvCp4hBlaBdWAJBjM0Y/nuD+Z3jo/gPySfhLntPVeAGdRK
         k+UDad4pQ31RTtf3KAbCo2kzRN/pxyLrHnW/s9LQt4A2AfiXthWTaFYskJWWBStxGf2x
         CsMrc+872BQeLlkjxs8beRwPOtjQtkjtDQt9QDR7e+TWUwfwICnj3PkgjRDalsz7Wma0
         ZTUX8n+MPerfR6tdEsmkKSiLJJCPLBiD5LC+PYDzKaRkiZTAc2JRKisERqcpk0iW6hPX
         djqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729956914; x=1730561714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rt/tYXWIIxsry9kkJRH0JYnpXHyALFWOiwFr/jSdDb0=;
        b=McjI+/NgZEO4vn2JpQ+V7dGZlGS5CCa7tqWSBgihBNtVDPTNsJP+bPKgR9Tc74o3ds
         arSO/aOnNw6v03hBelj2LFzDFsUX16sFdJEYnSyn/YkjzJX7kviizfqstodxzXk2vdCb
         xFYjPF83wlkxX/blwaO66Wxx/rD1Lg3ikAHy88WFFH5WxzmwCSoiKVAW2CI7ZoWlGMUY
         DOvhZ3X2xZVXpbQSQown0Dti5+OuAKTsFCgnTV6aji9Cfw/NzeA1XbszYo/JfnWIfqgY
         eqEhNs3CKM4oXbsb+YBvgY5deae5Oblp2RfntPZsSTGYEzPqX79RL/mIXt7D+aL7umoc
         u2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKzCPWkJAViwdyxng4ABICCmFSoYXEqs4Z07LOmZIyVStAqzIeVDTn8DdfLkJeCMWbC/Z0n9eI9kWtnSIP@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiYHYOgkI9nniHf8VtjKPP82Ui++GBPlZzQ807bHAPhbrnISl
	rUMVNw1CtamRmjWQeVE2zFd0zwGKVzr50FFGe0hmuY9tb345rfDZuENBDwKQDXA=
X-Google-Smtp-Source: AGHT+IFG/neLAN94me4zADqziHHaojntKbMA0mWRCGaXwd03yz3ZtNdTkjXVSu3Tu/T9HlUdHdP88Q==
X-Received: by 2002:a05:6512:1108:b0:53b:1f59:dc59 with SMTP id 2adb3069b0e04-53b348bac0cmr2442766e87.6.1729956914370;
        Sat, 26 Oct 2024 08:35:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a700sm534883e87.10.2024.10.26.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:35:13 -0700 (PDT)
Date: Sat, 26 Oct 2024 18:35:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/3] interconnect: qcom: Add EPSS L3 support on SA8775P
Message-ID: <bhnh2xcptccepv2sdyowmre6tm26klnfk5gunmy4lvc76pcfr6@lt7myqju77d6>
References: <20241026123058.28258-1-quic_rlaggysh@quicinc.com>
 <20241026123058.28258-4-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026123058.28258-4-quic_rlaggysh@quicinc.com>

On Sat, Oct 26, 2024 at 12:30:58PM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> SA8775P SoCs.

Please describe the reason for your changes. In its current form the
patch doesn't provide enough details.

Moreover I don't think it's a correct solution. Using a single ID space
for an interconnects doesn't really scale. In the longer term we should
follow CCF approach and switch to using the icc_node pointers when they
are known.

> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/osm-l3.c | 86 ++++++++++++++++++++++--------
>  1 file changed, 64 insertions(+), 22 deletions(-)
> 

-- 
With best wishes
Dmitry

