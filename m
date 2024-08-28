Return-Path: <linux-arm-msm+bounces-29758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7E96254E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 12:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0569B282CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 10:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A973E16BE3A;
	Wed, 28 Aug 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTthIixx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C72616BE35;
	Wed, 28 Aug 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724842556; cv=none; b=uaO+z+BM5YwD/5zQWFFQ9JxelZau8ka2SkdldN8+LQP3ZMYQAy0LKZHMz1b9EUxrYjhpv3WO31Og7ZerM/bUtelPdlmzIjuBtle6Z2jwMrMXk/QSYQVL3WSSV3+UaJH83xAAna2qldYzAuTnFrIKiu+AXq/1m2V3CLpT8co1n1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724842556; c=relaxed/simple;
	bh=D3CeHNEWLynYkI+J3LwKNwi1Ref7cqRk4BTH0+gARcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WD/thPEMKDErRUySmmlgwQlI4CTt/r83iFlOzJ+sC1ZFD9rQJrSzhLNL5OxZTXA21bmTnzO2yGsplsmW0y7oEux+aYrzKpyHuM2hlq4xCcxIjyPQVNjNyC0/f6yWcqTFIZ580qs7C104geBlhHrfKY49nA++Wg0o+xTpWHa/B7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTthIixx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45372C4AF63;
	Wed, 28 Aug 2024 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724842556;
	bh=D3CeHNEWLynYkI+J3LwKNwi1Ref7cqRk4BTH0+gARcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jTthIixxYvZz8HGXMq4c7yTSqSETNEU4eD2q5MlcrnXASHrIt6XpMTO7VMZRSkvgQ
	 +G4/QMZWk52rHSsV2XlQDWEIERhFedklVBrQgHpzapjA/XuQXqFGd0kRSEvE/rd8G8
	 CWTZ1jNkxZ/XwDeTlKah9KKqNKVhGiBXrJNYKbz9VmkdDyKl6//Jj7Q357ZRmQspN6
	 qsIgwuBgpc8ft3A/8xRvjMAcVPJklvYNaLiXKYSwAqkkJmHQ89JCRMmJz6znW7kTku
	 FGcpF/HydwZEdQVZNp6sOm1LiwoUyUte3TmqzSvitPREmXI6bMu4zLd//NzkOGFwHQ
	 HHw9+wMDz4ufA==
Message-ID: <5f7735ac-e03c-4399-bdca-3e9550b23e14@kernel.org>
Date: Wed, 28 Aug 2024 12:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] arm64: dts: qcom: change labels to lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 9:17 AM, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> I am splitting the patchset per few patches doing the same, because
> otherwise diffs would be too big and would bounce from Patchwork/mailing
> list.
> 
> Best regards,
> Krzysztof
> 
> ---

I can confirm the changes are a NOP, however:

g diff $(git last).. | grep "^+.*&[A-Z]" | wc -l
232

e.g.

+		domain-idle-states = <&BIG_cpu_sleep_0>;

Konrad

