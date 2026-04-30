Return-Path: <linux-arm-msm+bounces-105297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IauGIwC82lswgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:19:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D130749E88E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2149301484F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085FA3A0B11;
	Thu, 30 Apr 2026 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbBogj45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951B39FCA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533577; cv=none; b=hc+WaAQsGNrZ68CibQGUvuqIro1Vf6Tegtn5wiMDmePnex4sKEaEhmxJm5sXIzv1EBsRb3FJmULw2slaoUGMhcpy8HcRISk8kk7jJTrdbNHaERSTFSqnO7o0Bq6X7e+rEwjxE66Mh1TfJBFUBOmMFzwJkpSoJD864bymprpRRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533577; c=relaxed/simple;
	bh=2CZHL0AmzK16VlClqBj66ljG2LuPL+2WV5YuZohxbno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNwHy47xoYYP/9eifGIE1gRREsystLGYXC0kP2WmS40F5Gh3SeHjzg3i43vKyADdkiiOjDexXGsr197Hcp+5KOyDVxZ1L3px3mElDrT1a67IDk3Vsf0t22HvSB7zvylfAXDnvavyUyXiSmwnJkaGzIltEsgww+t+RBxe8sBLEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbBogj45; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso4628115e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533575; x=1778138375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=VbBogj453qbAxhL3j262p3Ds35RfYL9PfJhhmwRZc5+FjfB+kmPmji9XsdPYn5Nr7g
         zyOfl5oUvGYM3t3pJNRyNetj2r9o5cnE60UOOvYgZa7BxCT9uDCawQ9EPJYPQNteQPb7
         ERT28QCdDSs0SLPuNDGvGgVxbFM998vnd4GjAdwrk4t6QpVptUrklv/8+dnJU86El9b1
         E3I1zp+fWTz9ulAZbOufVUrt9oL1mcCS+xq89HnQujvVP0tsXXeSc8BaOIvDXwnz9tGb
         m3+YDs/81gA//dMhhBcwHNXTfscajFXDXKAE/BmExsN6h31HHjdHOQFFA7g7z04ef9ST
         Y3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533575; x=1778138375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=VSijBPEyplsAt0Jpu1kq8YVgpkpzB+Gd06/UmtkK3I1e2qJE6zQG2NzXIN47BDBUsQ
         o2O9kVw/Hdz4G227efjuJAT+AAQJBaZGtwwUhc6KC7quR2bH286odJDiw9uEchHNB2YO
         p1D11GRsKOrVzBTG87jcrqPnaVSgMicNv2hs9tpCa0jXpQN3swKMow8CUgQwa81/ya7H
         O7+7FmXCaxkEoEwrDHqXCpdbSCtKxkAaXocal70FJBahK4ePLUlNYw/ZLHURBeFry4GR
         foM0RzayAPEP3Ga7PtMVIGV85LGDBMOukBxqX5S5p0POkRcbpz8FQVdEFSRTb79XoEEL
         rFtQ==
X-Forwarded-Encrypted: i=1; AFNElJ80XKNTjEmX28JoHo3Lkdsqt5QieFNkVa1JTwK1W4/jvfJnUtEaNX0zyH9wypUfHLYmWqBZlnAdkM7XrirX@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWVNWYPgiXNHDeXM1aMWTAZrKZdDjGaO2acUr+taNq79rz2qz
	MjehEYpijRmdYcknBiPu9vgUqYs9m0dOehsBjFgcNmfjMyGoa5m+XAc0Jx9bVWYlsXk=
X-Gm-Gg: AeBDievIM/KxMIBDcXOIlNdlYmLHacyDrUyKC6sjPqI89qKd4lG6HrTbovhCJiPKJ5R
	QKxGSz2uXzkmY+z6GBoWZy94jq26C5lrvgpuvAag47vdKuGqh2abBdpUq+yiiEdfFk28B+GASrh
	U9dWqee1QPm0QyQkYmAkQcTSFPdbIEQh9eDP5KzZ/dgBIcSzh8NrSFGCOKgX4lzTZLaMT2q9AfD
	qn/C1JblzMk9pFXX3hcYWQ/yQGrpc8MmRCJejIPMMqga+Pcl6Gz/Z/bulsB2e8pKzjqZxk/k6YZ
	HYmjok15Ausf9KJOGqfrljIWB+RXsB/HMW4tpa7u1VQ00pwfNjk0p8zZU7tsYAXYNJXflH6WbWz
	o2+R/tmh3rFWW5VyiHbLMgC86Hf6lAwU9+c1mfUFHQiaGgk3KfepvVCaTrBK9EgAHOxE31LioHp
	6Z+epXQVxkxAlaV3nBcl3+bYDmYdxT9C8fDztvGlwa1fqpo9qbJ8DTmiTX/bM=
X-Received: by 2002:a05:600c:81ca:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a8445eabamr29121285e9.26.1777533574947;
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b65sm74225145e9.3.2026.04.30.00.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Message-ID: <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Date: Thu, 30 Apr 2026 08:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D130749E88E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-105297-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> +/* 1200.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8060e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00008408,
> +	.user_ctl_hi_val = 0x00000002,
> +};

Could we start defining these bits intead of stuffing magic numbers ?

I can't imagine a PLL setting is commercially sensitive and even if it is..

There's a difference between someone in the community doing a port of a 
downstream configuration where the bits aren't documented and a vendor 
doing upstreaming where it the vendor has control.

What does 0x0a8060e0 actually mean and - yes its more work but, why 
can't we define those bits and bit-fields ?

---
bod

