Return-Path: <linux-arm-msm+bounces-116745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TfIJfeLS2oLVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA770FA15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Tez11U9N;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116745-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116745-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 275653601BF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6152A302140;
	Mon,  6 Jul 2026 10:21:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F636F91D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:21:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333298; cv=none; b=eNN76nnuAO8VaNhXtnhJiQ96WkTZowWr6fJARG43F4E1OeX3DVy18UsUPD2UZugvMgKSFhUn9Oxj0SyRQDbrfh85JIR8sf9IiAMh5PMBUSZxGU9EP+ZQ56/3u7TGF2ldxIvt82oyRLYqpkqSDD9OaL+okufQV1bZa+63LowswBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333298; c=relaxed/simple;
	bh=6S2SgvezqyhABsae8XaEo3jxLGIxyVwk8lMJAuwNXbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UABP68X9gjyFGU9hcmjKlk+uu0hAck9p7Hndn5EovdC4OzKmg2DB8IU2o7+UZY7t2RDTXv8iobHgRQxspybsUq2Ei3v45IUOP60kBgCex05hjkqwsWXPxSV+11T+yjuR09E1/p/kjVdYcioOzNdAQ8bJdHZXCMALvTBzkRNavyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tez11U9N; arc=none smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c126fe7d0f3so362345666b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783333295; x=1783938095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UD0HPClBBvfFssPeNFF6X+teF7h23w+B5z9TKSsVY8=;
        b=Tez11U9NL8HXVswVPhA0+GXvfmqYQquQxZx/SN6yhub7TZE9oXfJ5z8kyKlvF+fLZf
         m/u6s8oYaZT2FC9QhV47GD62KirlnXY7GiMeYwTY/UKBQ5x7gC+3n8v35nyw1y5FV+nL
         sY5ejvxNL4vi+5Qv9rTMQ5wTE8TtOyCLJ1NrBqJDV+8r6QYGcm5UEiCNxoERFwk0JTs0
         1swFoFPZyrYbdiV2lXFTIS3cOik9z80vilbq/Ch8IBgQB6mrFfy3NmQfxY8PZ+0jwAde
         NmLF4mUvsv39qgqtp4YKeSqaASN/nhRwY3c/bpo48dYmas7GCkdqnav699NqSb+Af87Z
         xkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333295; x=1783938095;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UD0HPClBBvfFssPeNFF6X+teF7h23w+B5z9TKSsVY8=;
        b=cXi5hWZbKgT9Wm46d3X9+HnbXiIMV1SZB6i4hBjP77ySacL/pjpPxXjZvuXOwFh2RN
         PPzp3mHY9+fowitqBLKhl/TtOxACtoeBy7fXt3Qjw77zI65TOVZBQ2xPXp029bC3yinU
         JSUofodLhE7sU/4+iFh10f/3CTzKQpW0FMyZNJWYPSnt1sVI13PAoaUIR86hJOYoOz9k
         TinQ/sW1vYnUXgNymTJ0Z95wd1fCL2sK9HVFGCCmdbQjqi+IvteP7ct1e/SgNNJI3pqw
         5B0RXYrpm+2CRKwfNFjhQ9K0sQqURwphs1C7LVXWNwQRbFG2Ze2U39BuZXf6LU1vfrBd
         j1HA==
X-Forwarded-Encrypted: i=1; AHgh+RrvtvWo4ueKxaqmwebXivlgHkZ3cr0hUBXVPlFEBzUKa5uc32nRyP6pP2QKIeUn0LVFkCh1WyiwI8DUihIT@vger.kernel.org
X-Gm-Message-State: AOJu0YyscWsYbS12h2NCcd2YEKyltAQRYISdXPMugWUXqEOV3pwaAD4f
	B78H69P29SggbZH1EYqDrjlTDUbwfkUCDPiEef4jMdtxRHjjCDuGYLgUFSbC1REy2sA=
X-Gm-Gg: AfdE7clVSgg5duKRTXlx7yJMyLw9iYWsNIpX9bhcpdM3JHxFlm6McdLnH/IG6haZgpO
	oiqugRABF9eQ4+en3aecRJDDd8nNpleUv5CW7sFyIp/H7GvUJYIZpMNgt2R5zPXdLs1bgCo2o3w
	wwZFzgumzp8CkG6dTB1EcKO6SmDKlLVT9ndbznQ06yp9kWtpz9RGp8QLDnRXXM5bl7xu+cDkB2u
	xPJAXSj4cVYyv+Tq1vtl7q1RCf2VOkYyGCc/7kfAR1enbbJeDvyHksmtRNUFQ5L1P6ezKJNR0Mj
	XGWqGJkNyygFmCLcZJmVNJ7JmqCl2bRZGD4Gfe1cLr5RHPuZ7ZyjHiaYj55nYBp85Q3Me/D4QRx
	o5wSwJYdsfao3gtcXHI++6QTK8ONhXZvCgNBZ9IcSuMN6UBZBrksEIeWqjuR46U88SrkuDaubT9
	wHjdzvfzMyAT0jSTgDBj0WKr/PTQ==
X-Received: by 2002:a17:907:9349:b0:c12:951a:48f1 with SMTP id a640c23a62f3a-c12e694c9bemr307424166b.22.1783333295018;
        Mon, 06 Jul 2026 03:21:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60f5ed2sm711731566b.28.2026.07.06.03.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:21:34 -0700 (PDT)
Message-ID: <f5665b0c-bf9c-4937-a0fa-2b245e8093f4@linaro.org>
Date: Mon, 6 Jul 2026 11:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116745-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0BA770FA15

On 06/07/2026 08:11, Atanas Filipov wrote:
> +------------+-----------------------------+-------------------+
> | Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
> |            | Execution | avrFPS | maxFPS | Execution |  FPS  |
> +------------+-----------+--------+--------+-----------+-------+
> |   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
> |  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
> | 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
> | 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
> | 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
> | 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
> | 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
> +------------+-----------+--------+--------+-----------+-------+

Nice thank you this will really help me verify/test your work.

---
bod

