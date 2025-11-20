Return-Path: <linux-arm-msm+bounces-82652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C71DEC7355B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 090652A4C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9C830F544;
	Thu, 20 Nov 2025 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK4IkGTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF64CB5B;
	Thu, 20 Nov 2025 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632702; cv=none; b=nWq/9jNYrfBju9oTm+sDAmx/UfkTG8pvSiMhAbw09fIJ2mVY26/nQzg3khLrpQnJSj9Wyijrw5z0q4XyMzahYtDYgZSkD2BWrxM2hIKYku+vtIftMZ718eiX+1TCzK+u4T0IdZs+yjY9oJSh7zDbwX5mI5YC6WL3DgR5o/uy5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632702; c=relaxed/simple;
	bh=y6HkLH47awsuvVzNzIyy7LGVLozoN2XHlDXS6NGxa/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pItwe5HrCMaFijo0oU7QzzGNermIkzjid1F1zDFI7f20X3XvqBP96EVajPz/CptE2ZmniirK7Xxn9WPzO76j/F/R1GYdtI4S1oKF5UlgoUil2mgdlbw5/GL3PIat9m39c3TyR+016r7jCjvTmsKxnuX6SOWSaFZ6VZkOkj021wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK4IkGTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F23CC4CEF1;
	Thu, 20 Nov 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763632702;
	bh=y6HkLH47awsuvVzNzIyy7LGVLozoN2XHlDXS6NGxa/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WK4IkGTG5XQ8eKEjcdeeu3brsEhfkDfZcsuieav9VThNP9lz9Cb+iXCdP/CPbHT4E
	 2EIiQQ67KzEC8AioiDWfq8qleC/3KYnc7NbIB2TEPhi4n1fjwG5PuUwiZIl+iH6+EE
	 Ml+SEeFukHi3d2UUPTStwMwoGfwAHcjtOZgwShbDKjE/QNgccNhDj43V7n/QYml56P
	 14vqsvn+0rw2qFDsXbt6jAr4d/XDN1K4KEYgG2DgH/awQdkE6/XPrhYjpzPDnayg8G
	 D5IN10ekqzmIkkISLh4bP0kT9Ql8ufD5f+kwxlyCObOp5drBCiz9LBZklTIrbRAGoI
	 ZMMUHZgdZtQKA==
Message-ID: <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Date: Thu, 20 Nov 2025 09:58:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <10Ud2nacNpGLxEZdFk2VE6I40JkFU8f1S0lGFZayvkwiPgffhyV-gY3p_-AnMAAMckWDMVO__50mkrCB6NnyVg==@protonmail.internalid>
 <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2025 15:18, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: then intention is to land this in 6.20, which might let us to
> start dropping those platforms from the Venus driver in 6.21+.
In principal this seems fine. I think we should have a metrics as 
opposed to vibes based criteria for the drop though i.e. an analysis of 
encoder/decoder features supported and test comparators to show either 
nop or benefit from the switch.

---
bod

