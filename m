Return-Path: <linux-arm-msm+bounces-46209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF3A1D2CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203813A870F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05281D540;
	Mon, 27 Jan 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqJ2KFRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3881FCF53
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968335; cv=none; b=V/K7zURUu8I+PSMBRnluhHYsMyTYiYT5LK9nlrA5Pe6s3jdaKbZckKBC721e5YTcN4MbyUA2p/3E4P/nWZg9RFwxVuCPaXFYFx8DSJ2b5UXNapcfeLkSR/2wzaBXfAcInJh5jQ4zRwJn4tGbUxKLOD/BWUsrMOZCryHnmER3DVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968335; c=relaxed/simple;
	bh=hPQNPdpnKb122Yk3wg35bhI+hlgYUc4H8HXP+rzOa3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfndNfU6P70xDMOT8qsgJHrP43l8SXt5tO/VheRkMzac5G/k7qR25nBEaUnlGJLTlwPyEjwuNY4wXJj5pHOl1oEO0aqgfMcpR9PXNxNok4wd92jUq1DLdHF3Nx++U7ORUAEwqCnjDhtqWZ+QKarF7I8w4QJS0XKYNi31uvJnNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqJ2KFRN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc10fe4e62so7598810a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737968332; x=1738573132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/+29q3aJYg5FUNszWdiS/6NR4U2E1gTZv4qESBbDms=;
        b=HqJ2KFRN75V7MpnJuC1MX0Ud4jnTYqVFF89PnQvgCVSUHfL1RAoUZxuvQJlLZiFUfV
         FV4XXXUZDG9h48RkEmSW2z5cFLXXJrSLteDlPV/YRV3/Wv8ARXDvkqUW67dmpjwKpF1C
         q01pa22BAu8HMofO5KZEHzNC+wU/t77IvzvS1gz94ez5/dy9JkY4bIJv22PiS570lgem
         Qgm/4PLy22uzcCKw2LLbx7H8FHCZWk39/+rg/jr4d0tmT1g8V2ox+I2Dwdck6b42sQAl
         L0GOIL9nHsS2U5tX+gMWdwp728dn6OhonBHD4nfYrduwG5Xmfzp2p4DeBajb1s8sPffL
         uH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968332; x=1738573132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/+29q3aJYg5FUNszWdiS/6NR4U2E1gTZv4qESBbDms=;
        b=IBo2Egwt3ABmgfQjrCA3E6w2VRn3XkUk989x0uxDOd+bug7uhxzf4535eq/3Lao9pW
         G3EAOEy2Lu4akAjwpZBqQRuYLyEPmu7sWB3CdUEYQbZFJdGdtkQr89PZE2oNUjZi9F+b
         BjfmJknFp5MnH+639/6WPpxjHcWGIfwO+zspXEEe8CojAQyADzrwFQpyXaYqSDwar4D2
         c9OsxfCQjm4dr5eBO4T5RZCWJejeqyK2csDVdjCE6XKbvY7+7kYwv50Qjl6NLscCm+BP
         vUS1l/S/Mp6YoQz1Mi83Awk8orohC/9P/EUbEXWm4qeoWnRbS95QLofc44e34RqKGsBu
         MYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYiDxgXtiZS1/N2CilE6wF19qwTXTqVB50czGthtBKEGgHQUzQLBOOh4wYdP7JR2kkHWao3MZ/NFFFZism@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3rZ/Ri8HZOsKKG7lgJf/1iGl9cmkqsj5mKzYPRszBPeaO+Wt
	hNMx+LLbM5NuddjnEG9Ivnur1+3tmvmiHtdc3kGSM2OoQqd/B8r73GM+0e7qjIw=
X-Gm-Gg: ASbGncteLIfmmP8Rlyfw+adxP97GPt2mUXyz5xMiIBD/0xGXjuG9HsXYlt3v7i4KAK6
	xjkDaPfW0QwFKGam2M4DQg0uycefXlIVCwQZ+p2aOkPhWIeAWsIOmrU2WWK0bksjhSoTm1OzC7C
	fBN+0a/YOKOD1Yq3nlKLF2FrKNvsBCfgN47H/y7QCZSnnvCltU/eMgpL+14+w+Z3ZxN9NxkHaof
	Zf1ZDULvwo9q4Lp7i2FbJo85AXSPsDi0G9dQChptml/vfG68k9N9mmXtpP8zBsFFkqnDNeeqDZ+
	PJho9ztybbnkwzbq
X-Google-Smtp-Source: AGHT+IEuY2+SspxfDMaHf+BfUXNT4eZbrVPS2J6c7JmOp0oj4TXluMQD5/Otb9+8NR1ym+8zELGlbQ==
X-Received: by 2002:a05:6402:26c7:b0:5dc:101f:f1ca with SMTP id 4fb4d7f45d1cf-5dc101ffe83mr14343034a12.14.1737968331888;
        Mon, 27 Jan 2025 00:58:51 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d8e2dsm5017648a12.75.2025.01.27.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:58:51 -0800 (PST)
Date: Mon, 27 Jan 2025 09:58:45 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Message-ID: <Z5dKxZ-fri8RaTPo@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:22PM +0100, Luca Weiss wrote:
> For example MSM8974 has mx voltage rail exposed as regulator and only cx
> voltage rail is exposed as power domain. This power domain (cx) is
> attached internally in power domain and cannot be attached in this driver.
> 
> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
>   - Move MSM8974 mx-supply from "fallback_proxy_supply" to
>     "proxy_supply" to match updated DT schema
>   - Add fixes tag
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe50740a68b85a04011293c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  	if (!pd_names)
>  		return 0;
>  
> +	/* Handle single power domain */
> +	if (dev->pm_domain) {
> +		devs[0] = dev;
> +		pm_runtime_enable(dev);
> +		return 1;
> +	}
> +
>  	while (pd_names[num_pds])
>  		num_pds++;

Hmm, I think you should put the above if condition below this loop and
verify that num_pds == 1. Otherwise this would hide the error condition
if the platform needs multple PDs, but someone only specifies one of
them in the DT. i.e.

	if (num_pds == 1 && dev->pm_domain) {
		// ...
	}

>  
> @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>  			    size_t pd_count)
>  {
> +	struct device *dev = qproc->dev;
>  	int i;
>  
> +	/* Handle single power domain */
> +	if (dev->pm_domain && pd_count) {

Maybe if (pd_count == 1 && dev->pm_domain) for consistency with the
above then.

> +		pm_runtime_disable(dev);

I'm guessing it does, but just to make sure: Have you verified that the
power domain is indeed voted for off after this call to
pm_runtime_disable()? Start the remoteproc and when it's booted inspect
/sys/kernel/debug/pm_genpd/pm_genpd_summary to see if the PD/remoteproc
dev is suspended.

Thanks,
Stephan

