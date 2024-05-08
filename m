Return-Path: <linux-arm-msm+bounces-19473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B08BF729
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 09:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32295B21465
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB882E41C;
	Wed,  8 May 2024 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="u8KZiHzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AB1DFC7;
	Wed,  8 May 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715153870; cv=none; b=QIRI/wDB5JN7XWBGA/e4zRPhAF6LO0LPBB5FFioDTRNub5h9sRXiSv/EMXzdN+77Zy8e+RvYG271gO680D2Dz9UL19XMUetddgM0qbuni8BuNK3GXtIY54gyprXKmFLN3y8oXCJn2iFPUT/Vpliy7vKy0txq8NKkSu0z8sa0+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715153870; c=relaxed/simple;
	bh=kjymmrxtJnbENdbBxRaFYN4T1ytF+h/wvUQvibBNOmM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MA6Ly62jS7+5LVEGicbXRE+JwRj/25b/NCf1qPJAuzdPRfvxI4J8vgKOVPPnWCPOGYGs/9B2stMsvDn24dJOL4kXCbl9bTW1bta0EMFAyDoqXPjLtkz17qFTbqWn/+EBxUv7r2rNdP5o4aGM3C76U5xB5qJVPgRLUbMLlm5PJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=u8KZiHzU; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715153855; x=1715758655; i=markus.elfring@web.de;
	bh=kjymmrxtJnbENdbBxRaFYN4T1ytF+h/wvUQvibBNOmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=u8KZiHzUrO1bkzjdExhf6DJk5ewDvyDgxLFXItWbsQbjXP7h8xN/v/PadObmkfeR
	 OeFpmGhJPKe9TY4rzS6JQakC2oQR7bXSs/Rq4KH2ytDXfAS2ExUVnpVqs2KCy+90I
	 +WiSWSrMUNQGs5WYw0HRS4ZnsF7MpUG7YZs9W8TOHkmqusbwyQEgIGJI7ffNZtH6Y
	 g9wwqDEXjTzo/OKnO+A7WjLMbo0Ogxw5KSFjgUSOkEdhgrw7fi2Mj0SkGpkKzxEme
	 DSRcPBTdrPLXyZiyE0D5lFNRR4CRUxvaf3WJ2fby28OYfltvRKyhdLIQwUGbhsdN8
	 k+NnUH8vnk4iLX7Ong==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMpCS-1sNNjn0SSC-00IvXH; Wed, 08
 May 2024 09:37:35 +0200
Message-ID: <f136ac86-5005-404f-b834-e1b0a41c5758@web.de>
Date: Wed, 8 May 2024 09:37:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Caleb Connolly <caleb.connolly@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20240508-otter-bringup-v1-1-c807d3d931f6@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240508-otter-bringup-v1-1-c807d3d931f6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2OXHLDwn/2ONXEUS2H0kBYcGb8/agWCTFmshIKaPd5XwfPltFhG
 0XxlGGZkww1r/vWw/X1CNWhFKgAve9qX86eshB4qzSMWHXza/g3uv3u9DLDB+7LEEub3Ler
 6TFi4G0gRV29+vEHz+ddOAL86DXki36LcHfO5lZCRksiuec1GxHP5EAfj+oZKpbSX1lUPqf
 ZEMxUXBc2W3lRdNpYIRBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bwAxRZ44HAg=;h1h8H6NbuOr3//A5qfN0HkAzmCf
 01W1Flr62numc4uvTGUgLp3RTNbNVPCOJe5tnbYaXsk+NWm1vj1RJfrA4k+p0rWcq78DmWMRl
 iKwE1lin7kC8Kvuf9ZR/bTxl3fNdsFx5D9pDooJVwstitQ5iT2tO5QxSRd0oFao3NQ5JfPviz
 COytUl+ZrTCL4sDBVcnivB/UwxHOchUCEnyHnEcrQA0L50CZgvgU6iB182hzl3ORyVzltwY+D
 nYWze0uJVNaDlLHZ2lISFi3c/fMRzq7TrgG7nMj0aO/K7m7g3dOSL/Y5x3hOQpDImc5JyEYTC
 CDhMx3VD1kU68n2jWUXtDm2hnwRNsp2AQdT1xPE+N+eGQR4xUFaUURWpv8DgEtgFxvnUzyMfa
 A7iU7Wa9g/7W8LjV2M/5AO4QRRF4+X4q+bwGYSZs80FQCgdaUjHiw6WJYWMASovI4HMEaGAIB
 x0/xBD90sOHN/oG9u/jLg5FrV6N4YdpaYRehl8V3BjCr1041b7HRQOBv0tqgZo+ngV+N+7Y/B
 ZaJVeqU5Nah8TEL10fB/4i5s6RK02sme7AFrdCfMO6KAL4JaWnA1ewD116sdZfsHQgP5+OZDc
 mOEm+OHVyl90/cjujZ8sgm9uVUyQvv1gGu/ZnCcg+UzrGYKuvrqDGTqIpB7okRsGo86KXcW9R
 G6E7KEUx5AO2c/mrPTtT/R6OhvpHvVM1DHhFgMFSHKqVLEMC1cml8l8Vind2jB6iu6ZkkBFzk
 /mniR+qOD9H3USlJpjC06kjcgrTv7A1fpp4FunKfxAggMW3a/t1DhAJFqyCzZK1CNYbCP+VHa
 7kv/yKeRecb1pL9htIYpIhGyOuF6cqC/AH3dg6ivNZsws=

> The SHIFTphone 8 (codename otter) is a smartphone based on the QCM6490
> SoC.

* I suggest to move the last word into the first text line.

* Please add an imperative wording for a better change description.

Regards,
Markus

