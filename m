Return-Path: <linux-arm-msm+bounces-26936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C593AC5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 07:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89222B2113F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 05:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1E93D982;
	Wed, 24 Jul 2024 05:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXahiLzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826555695;
	Wed, 24 Jul 2024 05:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721800631; cv=none; b=nt17N4tXS+D5zUfoW/pUwsopcPcPNksaPcR1CmLy31Tut9z9bu4IxSmqEpSgl0lmgtHavK2xOfygUuPdPITkfKpx0BexfPK6GShow1lh5KwCZ/BZJnnNxU0QQS87ibAyLNUn1344WJhWn2sGj4/FY8jLs479X2s5b9vcLapiLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721800631; c=relaxed/simple;
	bh=8nc4UXjqleX9ROlHeHnZxGX47iD/172z8ulcpcEUONc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yx5hlJzbzbQRHbKn51NyyCtGwiaN34DbF7DbYTMk9N6+DVHJmlbw1WtCGGjYZHJvPeIB/DleMsGEAKUeQA2p+nwaEyZfAlZcZNfqgQXoPPjlwYFPSEhGqWRtYIqV8GtLADzurbHZ8RMmH8nwyFtt6caGCWO0dWPc+/CkUDJPh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXahiLzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83CFC32782;
	Wed, 24 Jul 2024 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721800631;
	bh=8nc4UXjqleX9ROlHeHnZxGX47iD/172z8ulcpcEUONc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WXahiLzJ1b327mBdX5YyxCWOROOl6fDozKOFRDil2+vZXESrIgmR4Du4V/STrOSUP
	 i4ALki+XnY6PJ7qCfN9h1aIt8CDBMy9c/vkJv++jqq2jJf3TU36aZo8yNsD6QhZkBe
	 EaHeUs0jwGtrr6Sa+jodHb0SVN7rcAVu3BoykQn8/YU1OOQQ9rwMko4WrYNrLQKyR+
	 y8sndoNjh4KI9P6mjKKg3tBegKTBpeVV8dVtgJAOE8Jr//AuYetdkunFn63Qx+Qhc7
	 7cWjjqsQWdEazwMQjq7HS/k546lUhMqulC4NssLEf8pGzRTjxPx+H62qfEMynbazxG
	 N9Y9DjzEZzuTg==
Message-ID: <d2d6f29d-22d6-4ae8-9172-a4af589e398c@kernel.org>
Date: Wed, 24 Jul 2024 14:57:08 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Convert {a,i}pq8064 SATA AHCI controller bindings
 to dtschema
To: Rayyan Ansari <rayyan.ansari@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, de Goede <hdegoede@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>
References: <20240717100600.19005-1-rayyan.ansari@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240717100600.19005-1-rayyan.ansari@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/24 7:03 PM, Rayyan Ansari wrote:
> Hi,
> The following patches convert the old text bindings to dtschema by using
> ahci-platform.yaml.
> 
> Note: patch 1/3 from v1 of this series has been sent as a separate patch
> for v2: https://lore.kernel.org/all/20240717094914.17931-2-rayyan.ansari@linaro.org/
> 
> v1: https://lore.kernel.org/all/20240716105245.49549-1-rayyan.ansari@linaro.org/
> 
> Thanks,
> Rayyan
> 
> Rayyan Ansari (2):
>   dt-bindings: ata: qcom,ipq806x-ahci: use dtschema
>   dt-bindings: ata: qcom,apq8064-ahci: add to dtschema
> 
>  .../bindings/ata/ahci-platform.yaml           | 33 ++++++++++++-
>  .../devicetree/bindings/ata/qcom-sata.txt     | 48 -------------------
>  2 files changed, 31 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/qcom-sata.txt

Applied to for-6.12. Thanks !

-- 
Damien Le Moal
Western Digital Research


