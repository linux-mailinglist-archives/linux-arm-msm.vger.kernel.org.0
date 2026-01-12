Return-Path: <linux-arm-msm+bounces-88557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D6D12773
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9A3A30386F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43092357703;
	Mon, 12 Jan 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km1upu8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C30356A1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219715; cv=none; b=tOqGES/kCNllJxC8TifI7v928Fh7AFRjrpmPwZbnUdykBljvXf8VwyUQCyHdI0Eeubi8it5vUs4fx1YqnehM5HjJaxRJ1ABmynqSlBFJBeKLLuOWh9N7TjaeEv+YB+dp6SokIfgKn2+9J+ghXQ1VOjV1DZV8hr095ndgVBzukVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219715; c=relaxed/simple;
	bh=oXDBiD54nDhDPSl9qGLWo6F/JzpP0JIj6oqpvLcbyyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fso9BVOaXYXXB3M1k/XdJAECYsNjoSIkzlrbiYdogL3HksndV37nrIQ3rJHBXwAF2lP56pXtMV/N6rmFqa4rk63reo5/u2A3BE9yjRkFxav4IzRAqHTgTEa0KEaDO4sslsVm/gY1K45Kn9UHWMNJh/cjNWyIeuV69lFKOLf2vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km1upu8c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so59034905e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 04:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768219712; x=1768824512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Frq2FNvpHlVXL9K9cW2q2Tna3UfQNHXR0J95x0vAQA8=;
        b=km1upu8cUJgurKkfaL7BA84qGSIt3XlcBD3CR5T1fH0Ld2bFDQqB4MYqhjPlx4grea
         rZFhvD/iVpWQSEIqTkE7PgNJEcPZaDJy0dcl0w/IvscUfsxNMsRMFjJori8pAIoDRPlI
         8HBbtjhn0bjEKwRYX0C003TGZtElng+ga8L83uLPyG/s3LdQnovE4tRcuzX8MIDIx8+3
         NsZ/IYISuZvFtsvSs2NVRJ12n3QmxWYvax/fqi3gIMXnx65PCJItdws7HfjJyWwXHTHo
         rwMpNpuvKz0SD2K3heu7krkeKNE9ZwdrUtquzaSXW0I0LulADIGORPWCFDFlyuO0wHNd
         zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219712; x=1768824512;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Frq2FNvpHlVXL9K9cW2q2Tna3UfQNHXR0J95x0vAQA8=;
        b=IPcUkiTj0hVtuhfF46Q8fZh8FeQiylPX47pJ8LyJHeQOrzVYFqcBo3i3zTNnYC0mli
         qVNAazhxvljpKMDLeY1l8aI3Iv+X+UalKXQtTRNjskyvQmAyWPZ/3u1iOj4mRiENcyQS
         DvSsFF3eYeluOq4EASBD6mLSAbHbZEoiaeN0BqtoN8kX041MknSURdIdzVE2TYvcE+xT
         BDz8hVx/gJTTYG8RH62gmtgvLwgc0inbEAB0Su4XuHWL2q9C1Ussc2dfZ/q45IISfCda
         0M+MSBzVBpgYnUYZ9000v6g/J8iql9DQ55fku995WoyAOTfixOVXQzXvLVC5ThBpSNbK
         8BHg==
X-Forwarded-Encrypted: i=1; AJvYcCUK7D63JzkdrOcDBQ2Hqw88K/AD/lQtlp/Hw4Ock8/E0vCrbIIbuCIzy1uQ0f2IzDneSlYMQ1/ziXpshWsD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1zflicoozF7yPiUFJzry7dorJt9PvfcJ56ra+AERnqnnFfed
	HIEr+OjpOUn4OwtKTnvgdkQyoMCPOGvCXb3gfKrx5PtjnfP1cjHzEOFk/bpF35POl0M=
X-Gm-Gg: AY/fxX4rY5PTEJ+s86df5douICh8lI6n33SS7IXbpLThrPgjbHV9S1vGdzh971Jk7v+
	T1DiLubsQyEZOtbKPWciQ3yP9VvPf0fIsR4w3A9Z2NIjcOVw1toeg/TQeYid6rBpWTLYGA8pzpd
	K/5LJwh6XYo1Xn3S779U6aXh99TSq5MP5W+qC99rglDeRu1VkveZlmhs/SzYdgKStER5zLOHTy/
	oKEjRi/HkOzg2ys4a1+Yc+wZ1A//MAfW5gxifDsgy+ajaTdLa9y7reR4hxniwQeFA6CdeWw+ni4
	pkYmD2J197E3G9mmSE/EagEADnpyngVLki2YUpCkeWoF0e//uDUS+tNxc2ASI84ifmyjshkLG2v
	RYuUz82ATM5iEk+stD6+gHlvlS9QQoTmF9XfNsgsteiYLCpEGe2xu7CEDpgQMw8iSkp0h5S+h31
	/z6Qi6wrLz2uF5qYHF0Ao4COwHwh8+kpeMA9iRAgpum7w6pa6jyetJ
X-Google-Smtp-Source: AGHT+IFdAoVE3LMMfr3WXuJgeaok1n+ZKYXo9Iz2QvBceUMpdDB+n1lzEDB7SDTGntMbA+ArREk/bQ==
X-Received: by 2002:a5d:64e7:0:b0:431:7a0:dbbe with SMTP id ffacd0b85a97d-432c374ffaamr21755981f8f.32.1768219712153;
        Mon, 12 Jan 2026 04:08:32 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm40635361f8f.24.2026.01.12.04.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:08:31 -0800 (PST)
Message-ID: <8d51760e-c9ed-44a5-873b-d96824d173ad@linaro.org>
Date: Mon, 12 Jan 2026 12:08:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
 <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 09:02, Hangxiang Ma wrote:
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },

The convention in this file so far is to add new entries at the end.

Since you need to v12 this, please do that too.

---
bod

