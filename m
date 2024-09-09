Return-Path: <linux-arm-msm+bounces-31282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D497163E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6E81C22938
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010801B5327;
	Mon,  9 Sep 2024 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6aYZNA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C201B4C5E;
	Mon,  9 Sep 2024 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725880027; cv=none; b=b6KlGu61hZpJ/d/kFT3BitIRUYpDVwlGMWn7TUewuFmBnzrKAFWk/2a44sFoWCHU1EgmERiGj+GRPnGq52uv+XmHJjxuo2ftSRDj8rAt2bTSlTIUn4AkjxbLwHKakKpea0LB4TiKih6B+yA/ZwW7qGb8ZcBUM+xwRZa3ZB0Sd04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725880027; c=relaxed/simple;
	bh=ndv0YNPw+KIUTY8eItsgQ8UR1XlpL6WXTn8ixzJqYts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EF9YvePFmKn+BbDIPks0R+8DWoehVjnIJAB/WZwKbLX3qkhF8rhlFGwqOQe1qgMWECsfJt0OjrHd/vraY4rgN+FDZ1aeikZFyN1RyzcN5ZZfgAnPm02n5ebHI1qeKC5Q3e0Eu48yRpHuczMiypJgCQMv6zJl8GdsUybefqnZZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6aYZNA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C0DC4CEC5;
	Mon,  9 Sep 2024 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880027;
	bh=ndv0YNPw+KIUTY8eItsgQ8UR1XlpL6WXTn8ixzJqYts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H6aYZNA8BA6PyZOPiFKU5fSE4/TttxZl2pRbYf2vOWWt8/JMU/HuBSubRvdvYwpRG
	 fgkBADRHyU8sEjM/GMjXU7aHmpthCMlW4oD9Guc8Dtbta3zrENexgjVF5YJiR+KWOy
	 hQx2edxzc0hoMOONrCUnYoOwUPv7tRjOMVPYR247P7BtZfzcBPW3ywNbZInvD/KVn9
	 1AZDJd2kyb/IDN//s3ECcjuBu5HMPjPPX8YstduKKN4dv13U927GS15R+8Dye7xilf
	 eU4ReZ4kowsb0W4erjYBN5i4o9egHyaUmKHwhjN4tGHHpoSuB8oXFRrmyArEI1c55G
	 Gg70xjUlRkWAw==
Message-ID: <54b51f2e-6478-4a9e-8e12-6dbd1979f492@kernel.org>
Date: Mon, 9 Sep 2024 13:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
 <20240905-dts-cleanup-v1-2-f4c5f7b2c8c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240905-dts-cleanup-v1-2-f4c5f7b2c8c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 5:46 PM, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

