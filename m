Return-Path: <linux-arm-msm+bounces-52350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BBA6DC6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 15:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D167D188A18B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A9A25F7B7;
	Mon, 24 Mar 2025 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NoOFdZGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CB225E81C;
	Mon, 24 Mar 2025 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824773; cv=none; b=s9Y5it4ohp7MQVR2m6TCs+ShsHz2PRsLNQpEr5B56xuzcRRgC7JAUpDrjbzFZclVSMxnhWSDvhV+zZ87AVdh0uwHGY1Bk8JLnKzeqblrBk+m/SrpQU1lroXQKzBKTCq25VbXx8Yl9zRistOuTo2yjGlCvibdM454wEAk15K0L3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824773; c=relaxed/simple;
	bh=pPpPGmbFhlnpcrD/sdzrDoBTzh8QL5fZzQQDJK4oxFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YBISBCTmKGnYLqwM+cd84IJHI8B8yoQ7CKWfyyO1m+2TBLJc7VTLan0WyUIanA0pT+nbn6ZKiRoebX3H+7rD10sg/wSGjw9XEljhEHdyq8pg/e9+I7P7p0ax84pqixcaYANwYKCw9JqNs4ugDrfjwNB8KsTnGlIHty4s90hCV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NoOFdZGM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742824770;
	bh=pPpPGmbFhlnpcrD/sdzrDoBTzh8QL5fZzQQDJK4oxFg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NoOFdZGMVYWoM9DEu8WggGAbsUWyXP8z1gBmOVYNDchafopGHD8cg4ne8gCQsrEOh
	 JuPHDleNcmv2mZtMw280dk7j8HJNk0a2bA09/3uu/G9Uan44pDZR/7pX1/ujgzT38+
	 Rdagsu4hGj3TsONQ0hWTCj58/NVcn/+o8gN6FioqAwbbI51EgB2ciGuYEPfxVjU9aG
	 4L9msFdmuoIAAHy336MF8sXfMWPhsl469v7mWyDIQtr9FU0VZYSEtdcGCqAPkFzK2G
	 R6rVAXwgu/vjlgh73bV7Cxrpz4kZcKKNchIGPzlVxsKRAX+Ytb8w2TnpKBz7jOsxaQ
	 3TNL44MXe1f6A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AAF417E0673;
	Mon, 24 Mar 2025 14:59:28 +0100 (CET)
Message-ID: <28135f96-ef99-4347-884d-20e870a3d64a@collabora.com>
Date: Mon, 24 Mar 2025 14:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, David Heidelberg <david@ixit.cz>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/03/25 13:52, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



