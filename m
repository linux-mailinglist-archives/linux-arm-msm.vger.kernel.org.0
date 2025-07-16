Return-Path: <linux-arm-msm+bounces-65308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C18B07CA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 20:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3A195064BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 18:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F654299AB4;
	Wed, 16 Jul 2025 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="eserchQz";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="asMhtWI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3D1DDC23;
	Wed, 16 Jul 2025 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752689942; cv=none; b=c91ONCem17kE/RG9BfsIjVtWOWEBKhNcXi6pziCbnawOiBXRaDzHSZSzOewBJc8alpH0aUubL26tReErwBNAEtDEWCAkcVi7pkOABymI17qYumCViKO+BE97a9AtJ+7JR1rEjv8k+eMWpLEQ/5wl6Nv4zgs3hTrsxyC7o1bqCso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752689942; c=relaxed/simple;
	bh=Fz2YTH9lguwIzD7wP6qCcWZp4Z3W0VFrpNEU8IdpPVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=NYqNR1C45f+LfeGQVKS4leBSPhgIU8quM2WPajTTPVlnVoeY4kwi8m5B82nd7DAhNrhyKKc7hxQ8oHXRQXzKGpRea3Vc/5B2JivMkHhZxkrIgj/BrAfnxlipO41573JNs4D44aGhJ5ot8pG1o0a5ijOKw1BFRaHHsnAtqnByQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=eserchQz; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=asMhtWI2; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1752689926; bh=akb2e1BcWMRnA4E9gW6eE/o
	yO9kqQbDNp2hAYCGnK8U=; b=eserchQz9TvfUJ9g/QJv42faQkyAXMCJRp89a24NhszsaJqewi
	hbrsX+YhcTSG1AlRNX+DN/Z7ejfzQZKqqqMVV3tb182+Uw+VlkZ0S6HBHVUs+hswpoB46606l9a
	84K79Pt/R9SF18WInFC/VdjN9o1QRZNS8Qv6fDUbgTeAUIRCWhd3LWXYHYRygDFr79tPNwTJnM/
	Z2Py4xsB+C6v3zyb4zN8wJa1q1SkzgQgUc7f/FJymV8SXnJQcbqr24kzFtDlz9pwtec/EQel0hH
	1xh5DWzQrwDXyeIjiieS9UzcRvI9hdZdG7wIA+fNkIq5DQDYvNXhfqTawonIe5MRu2Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1752689926; bh=akb2e1BcWMRnA4E9gW6eE/o
	yO9kqQbDNp2hAYCGnK8U=; b=asMhtWI2Rjx5zE9/P89F4TjFUawp8EGF+h0GHcsnZB1hOU2DbP
	tnT4qBN2D7Qx3g+nHFcUcKmpwiQZJTT06fBw==;
Message-ID: <ffc3b329-6d46-41f3-9780-05369d29f9c3@adomerle.pw>
Date: Wed, 16 Jul 2025 22:18:45 +0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arseniy Velikanov <me@adomerle.pw>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused
 bq27z561
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.2025 20:00, Konrad Dybcio wrote:
> Since it's actually onboard, it would be fair to assume it's there
> for a reason.. Does it also report nonsense when running a
> downstream build?
Well, as I said before (looks like i sent reply wrongly), it's disabled
in the vendor's kernel config:
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/pipa-t-oss/arch/arm64/configs/vendor/pipa_user_defconfig#L413

Also, pmic fuel gauge, which works with the WIP driver in our
close-to-mainline fork reports mixed information for a dual-cell
battery, instead of each cell individually, and I think
this is a more right way.

-- 
Kind regards,
Arseniy.

