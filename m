Return-Path: <linux-arm-msm+bounces-48685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E8AA3D9FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 13:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D036F860688
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E2F1F584E;
	Thu, 20 Feb 2025 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mjHugCQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227F1F4639;
	Thu, 20 Feb 2025 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054220; cv=none; b=lszarAYUN5TYuOLZzv67tjJveHrA6AK5+XU/Jv17QhRDkuSK+oKVbQs4brrJMtxrRyAH4aeWQvWfS1TadZOPFEa7S+2RKnH5Lf9CxO8mcHzdthHfCPg59deny9L98FU+gxbHSCN8awwDriF7OA/FKjuIMVtXmuA6xpS60S4lEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054220; c=relaxed/simple;
	bh=wgpCUab/k0RMov6LLF8tRFXDTl8f/3HuLJRmCdf6fxY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WAc4xjE2vuBgKt5EDSpNztFFgckVZR7F9EP7bliQMxH7VZojI+FassCTvJhl0A90NCibIGckIw+VOhw+oGGYsW/2qfZEk9kAHMRQ9gco3tstnOCGQESKP9Y0VonMqI81kVyrL1ISJzcNTo79OAvRY9SI6eonGyf2DPS1Cj1ILSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mjHugCQo; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740054212; x=1740659012; i=markus.elfring@web.de;
	bh=wgpCUab/k0RMov6LLF8tRFXDTl8f/3HuLJRmCdf6fxY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mjHugCQocHoO9ONJCQKo4XAJG2KQHIrKumODKPFw7Lbxwief033lRIpP5okP6x8b
	 xNYwMYBr9Fg1jGmvcb7j4pofgh3EebihuYIE+ZhZQlMFv3dvZCIduZYWDBnIJTnen
	 D2N51Foy8heiUd86xP+cagu6VCIn2A6mo4pVgqru7bEBL3/sNj5lyGPmOc4G5h0L/
	 4h3o8xAneO4HX+L8Ux1ZL3m6cpeGEw1Q7LmqQL0L8DQ3BlGXQCd2bNyBBoyJAeubm
	 A3smTSfYaugM7uMIHsOU2RrVx/EpHagi7RbvL79ZEqKDxSv3XBIGvg4anc+7L2Yed
	 L+g7fVsoLn36u+CaPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.25]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzTPQ-1tPHLo0zWS-018Ahe; Thu, 20
 Feb 2025 13:23:32 +0100
Message-ID: <41ea82d5-5254-4a24-86cb-60e9e74d7420@web.de>
Date: Thu, 20 Feb 2025 13:23:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20250219090751.124267-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Corret white-space style
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250219090751.124267-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YfPlJLs2x078246birqJ3kaZZmVD//+vF40edEtjC94RTGKVdn7
 Y1xD3Um/VMuGIcg8nE3Uxn+EzsVjaiDxauFnTR+hhv4HUl6R1SnLvrZBSRvgfe5q3fdjKK1
 hLIg3lVkdVVQZRqUQYQbOn7WORWrKNpMvDPd+3h9jIvmlCVs52ZjkL2OFCWben1j+ne1Ipz
 lApDS/jyZr9QmW1e+T9dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+W+5KHCjiOA=;SM0sFr2BQL6BZyWe+AIuS5iHdH0
 RP9KIweCtSQcsGMhuF2XlWR/E8QD49m9+jS6QQnQxQdKMUrzkbQZ1fSnls5vkqPqqWq0s/Luh
 Rl8Du3nOh5rz+NajGFpOeI1KhKVdHTl5oTlAUS2+CRfzCE/PJlyj7wFsM6Pz0BVHrpsyXN9nj
 2QCdKwrdz5jWu/evIYRzCM+I5k/PmP29P0HQR/VCdYMI30ieFiCaQwojdlz/oREKUCurNc6Rt
 fUrC9k9t3rbwVgaR48l5b3XmCDmE5MZPmZPpqngaZiUwrMQkT2ValmF2nwPA8sMZNTU56swBa
 Ik9IJBhANpoj7tzEzZRCul5MIYNPTvycgR8ZCPvRcBW27X2+qbex5Tc5iFUrBKCklYW9vMKZp
 M7XAgxjkjLTekHZK3hIUEhOrCUkj1eBgfUaFJS90G5bGQroAZXQQHed8ufUZap+u3jzQ00jQl
 GtJl/qMn7cCd4P1Po8SRiptcR7wbv+4yVJL4MyH7rmuX+LvIehy5c1QAuCHol8HpXIzGbeXFS
 1f5AluR851EH5Pfee3UiymxvrjUW9Bhx8lNB5TpYtmWvPY5pEzxjZhuZdvCF7rrNeMGSc2pgP
 ESPyPDMiAeN2w8gf49ZCsA232MkdWpVwe7cJyUS+ZOpHKHHIk62Vp947ZvNXeSQpLP3eEFo5x
 4JqW38ycza/0vpnaPGRcgdmjVhK/Uy/vN/UMh32GAoG62u2QQTSJdJE81TPMgdvJzj8t6Ww4t
 lemecs7wmtCFL6ETkvBbnrUb/hBktk3Oh3uoh1MoLvHdlA0g/5CUgAx5lcE8NpjhB8k55+OtM
 jwl4dbPidMy4gb9BU7829d66O/fMcIXtk9LwgYK1kfSaUjrQCJndlM0zQ+dt1QuWY/q1atmPI
 Qo1dprvC/71E2VIJogIhsgnwWo1KG0EhMvbXIDsL75zAACQczohBNpr13wIgUaLrm4wwrBND+
 VGmnFO3wYIithBdsZ+EODq5DXp2vCENm3yAwCG3nDsFyfZ3OblCA+LmEhX6dtytDpzRmZDS2R
 56SBJQHj7ULplltk6j98wFJhcZg3Dgr7NID/ldgzIrK+Uy7RramQVMSb9tWcU+oJA02Zadh4p
 jUGw1D0hWzlxwe/OyiO+uTOyptgxYAobCH3dBFYVQK9IUU+dtWrajDt1NiIu/ySN0fGpx8gkm
 UA8izzd2CaplR4xtSDMH1mT5Cb8Avj2rrVbKCfRKeDyWYywO5rD+TksrrPbXaC5Ft0vJti9hf
 g6SWN5elDY+vXz0VNcApB5ZDyQWKCdH32CUUa+F/KXm0dGY6D4u3GUe4XsUgsyIxtL5j/dKUo
 JYsPN07yteaE06lWJGssu0tDgZicyj1bKwCtaeK3EibZS4CeZgY/nGyBoLoBet5Zv3RXM2o+3
 ZGlKknyEugPUG2+5dTY6ztANWbTq7SDg+LvVxuSdcdDE8X+A5ISHKTpEJra2ArO7HpylteuIN
 q7A2yOXLdMejlU7q2KkVdAfn6F64=

Please avoid a typo in the summary phrase.

Regards,
Markus

