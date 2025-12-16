Return-Path: <linux-arm-msm+bounces-85361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A34CC3255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F31EC3005F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D10138E154;
	Tue, 16 Dec 2025 12:54:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFF385CBA;
	Tue, 16 Dec 2025 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889647; cv=none; b=r1MWd68PThe1CiaQ9wGfzuoVaEJgeoAutFQOUze0zJwAG6GlW6ImK3DkksAOdcHxDDwgHth1XkB8dXfWr6f8t4yGgl7kKcxWN1/7ADG8BJ0TTHMUNppzK12VU7w++cNMqw7f/2f3YliJoKGbeofyoZ9eBw/OpxkE10j05CJTbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889647; c=relaxed/simple;
	bh=+/k2t0tOJPsMXp4uybCalSiesMgQuNCnhRROIv6iYao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ABG3TdP2VC60bseVDx+ujI1qGcYxDkzc7U+acSEYn11SacC1OlD6PuA3flCN8PL9tkg7w5nBmQ19UzVLF/jO8MJXupI9XBw/1giW5CiK9KeUj21eSYPoCtjsWoVOqhbWzkDlr9FilEcpNFeB6jTbWfgTS2BmCHPMwN7bWfY0X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCF3C4CEF1;
	Tue, 16 Dec 2025 12:54:02 +0000 (UTC)
Message-ID: <504f3b67-c919-4645-99e5-d11380788cad@nxsw.ie>
Date: Tue, 16 Dec 2025 12:54:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <ZH9NSKNf4I5zdiPlR9VLvBgDLeWcOXjvWnG1f5xMReZgAM-I2T7VaQf69WJrtqb8yVv5m9HJKZjtWQi8UI15Vg==@protonmail.internalid>
 <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2025 12:00, David Heidelberg via B4 Relay wrote:
> There are

*These are

---
bod

