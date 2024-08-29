Return-Path: <linux-arm-msm+bounces-30148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 027229653B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 01:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9846DB217A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 23:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2C118EFCE;
	Thu, 29 Aug 2024 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHCJwhB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BA18991C;
	Thu, 29 Aug 2024 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724975869; cv=none; b=LRsuxYACab705BhJdyWj5/VolmFl0nikLxpIbD43h96QktQ6s3KPiwM1aRr5Cb7I677oF4jHkS37j4fTODWlZnvVQnUfrXEqtDMi3MfHhQFoZUclkdA5nlyUiDvq9FB6EqpnUfhbmufcQbD+Vs7Hc2WI7epjMYLah0TlCMw6ONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724975869; c=relaxed/simple;
	bh=yf6NvJioefC5IqgmCek243W9lrOM3rQkdEB3xHLYpHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnyEetHtQDjpqfKfnRv0VhQ9vRaTeTHrwwMZ4N89IQ9YOdYEVEEo6sgFkaSdQaYOkJH653ujvuiIfbfMJLpAzvKvfxIWPBXyamf5GSqKo0r5/UB6S2DgCiF3JnJNhZEEFT1r+awIpaQvvG/34HtsPs9jnUTxhz2p3qW9tNsprMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHCJwhB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13425C4CEC1;
	Thu, 29 Aug 2024 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724975868;
	bh=yf6NvJioefC5IqgmCek243W9lrOM3rQkdEB3xHLYpHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QHCJwhB4N2Gm7L4hoAQutfvdHp7TzwyChUYfO6YJ9pGcxJy/Wm9wuI56CZPTEw/bG
	 2APCGS0HyxpXFnuI53Pfa5NsD84D1+NtW9ghtct/m5GgtuDAObtD3RAR+Uqmobjc3r
	 OwwT86LPyneHJcDceg9Rn43oMgOc8jsyKkNJReMAVdOIwRPssj+eIdJPJ0wwj8d6X8
	 mDfIcQHxVXkFP7l9Z6k2YTsIZ3/WV4zjpVFiJo0S/dKdS/redx4SyH7SFdh7lLJRoK
	 lLvhrczmSrTxMcbP05nYeb8/jwlyUOkCIxpzL2PaccxNCXpll6IKnwVo9pNF03kTiP
	 kmc5V+SYYKEYA==
Message-ID: <26980e88-ffe5-4355-b0ab-7945a3eb51b6@kernel.org>
Date: Fri, 30 Aug 2024 01:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix PHY for DP2
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240829-x1e80100-dts-dp2-use-qmpphy-ss2-v1-1-9ba3dca61ccc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240829-x1e80100-dts-dp2-use-qmpphy-ss2-v1-1-9ba3dca61ccc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 2:03 PM, Abel Vesa wrote:
> The actual PHY used by MDSS DP2 is the USB SS2 QMP one. So switch to it
> instead. This is needed to get external DP support on boards like CRD
> where the 3rd Type-C USB port (right-hand side) is connected to DP2.
> 
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

