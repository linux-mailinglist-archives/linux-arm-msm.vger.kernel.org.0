Return-Path: <linux-arm-msm+bounces-29197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B415D959A5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFDE1F2320A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14871CB154;
	Wed, 21 Aug 2024 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDrrVv0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016391CB14F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724238709; cv=none; b=ZHZPAOWQwpYda96+DUDvpV8vj/jKnjmscNoEXUIwI9fHrWIjPQHlBs/cMTj7k3N6iUbjZ9HzfhSF9wuxpu8jzWJFIcfWRCeISmeq2SBEjoAkkg2kszfHpDQl3rUJIcXXKrTTqYk8N55/ApWDRoybVsnbhJyNdIrxqxQfiY19UJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724238709; c=relaxed/simple;
	bh=/1nI3ICWn0fLkVjl3gTUoRm1AzqpA9c/IlhVi1HGFZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdxnFC5XY59C/JZ4CtXCmbuJQRz9tznnMX1RmujvPTrEbHQLt7Fd9ohozQR9Qi39SsSMpD66MUXclWuxFUrk47M9AbzNAT9p+7IDDNi+tpwy83opZz6sn0PYdfd+SjGJZkQ0T43OvBRu5cQgeMEn8tTxZbv2cO820exLnwCdXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDrrVv0/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f922ad1eso318041fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724238706; x=1724843506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hm2FD4vfYuxmI3ajSYE+P7n9/7DArob3L4cbL1chEQY=;
        b=GDrrVv0/2NMtvrooakA6Lcuuao3mvGswL41p3f/9RW8f2shZ3iBfLIwYel+PjIy/pN
         ZBNw7ddE+KdpmNJuq6blLhtBturQu8cqlm8Rr8TEiXlqBDhliYBGKq+p33nQvMJII+L6
         ZsOAMpeZ6tTUSOVKuIQ3uSmqWQ/lpp+6CnqErzMlG1W1PTCjHF7XVJnxiKBqCLfTGIG4
         huZUJHWGmDPi07EJheApuTiWkEdzGafEk4seMYXeEw2UgvWwAblgT43LKf2dlMLUn/bz
         LqrOSY16j0gKPPJ4ua3AUa3t3RHWp1YGxxSEt+zPgEQkRac7bpNk4l1637VJ+vYBTEki
         PBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724238706; x=1724843506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hm2FD4vfYuxmI3ajSYE+P7n9/7DArob3L4cbL1chEQY=;
        b=YdbhnPhSIPaXCPjmhTpCh9jqGdJAdh/xXNJ+RgssVlFPRoIO7H30Q8YIDMcNWP+hwH
         +3tTDV3kYMAyTU1YSW/47aLmetOx+PzWljSRBWJ1geeVnC+jOuubw3YWt0j9B11DW9zj
         +voiq87fSBgDzDtR7iMRS/QKL5KKU4ZI/tjzVwvisBrV+Jb88UfxSg0FxyHCatS+tq+a
         4fsW56T3cqCmRU2wAVD+IyaZjWgjLYT1XgHkmi2kOxMSUbz6jv7Jvybar/Oh8+u53Zju
         XvgrjOfVHcFCgDO8mAp6OSD7RA54k/U/4OOd8o2r/UTunBFc50IE41lVkyqx3jqkRAkX
         gUgA==
X-Gm-Message-State: AOJu0Yya+onHSfzljx4sjMkE6l/ltEPAts1+2dKWmhASwsor3HlDTYbO
	Pu0qQ1ejAno1xxATQGFEdj0VKKZb0c6nUmPHZRaH/WWj7zJ4l6D8I8tgkyeYtxM=
X-Google-Smtp-Source: AGHT+IH/o5QRMw95z/iir/28qSSiOEgLO2pHucvJWk+9LvpI2tg3gyxdDd5JEietZG++Ru5y1vWU9g==
X-Received: by 2002:a05:651c:221b:b0:2ef:29fc:f950 with SMTP id 38308e7fff4ca-2f3f8b547famr8516971fa.6.1724238705750;
        Wed, 21 Aug 2024 04:11:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3fbfd0f1bsm879741fa.25.2024.08.21.04.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 04:11:45 -0700 (PDT)
Message-ID: <c501b813-e78a-4fb0-aa7b-a2fbbb90f10d@linaro.org>
Date: Wed, 21 Aug 2024 14:11:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/24 17:41, Depeng Shao wrote:
> Add support for VFE found on SM8550 (Titan 780). This implementation is
> based on the titan 480 implementation. It supports the normal and lite
> VFE.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---

<snip>

> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;

Once I said that the comment with a typo can be removed from these two
functions, however the functions can be removed, since they are trivial,
use camss_reg_update(vfe->camss, vfe->id, port_id, ...) directly in the code.

> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +


--
Best wishes,
Vladimir

