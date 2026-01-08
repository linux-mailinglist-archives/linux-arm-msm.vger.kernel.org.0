Return-Path: <linux-arm-msm+bounces-88092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117AAD049E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3908732A02D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EAB4BB0BB;
	Thu,  8 Jan 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNn4dUi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D14C098D;
	Thu,  8 Jan 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879518; cv=none; b=nw7AS28lYJ2MuZp6SmPdvJeaIF9VK3R6bP0lYlKnJfbOzQfUc1ZSddMrQ0mMehFQl9lFuJbQ2ttsrANXsl5xB86mw/s1BF1/oRYpQHSHzHO0ypaajVlwYIEqCDZsHfWWqfOkyFsP7ccapByQYZtJlY8tDBNvWbnvwD/x8+VDto4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879518; c=relaxed/simple;
	bh=GUGVPH21w+eNZ2BLrVL1KJgBU7n2ZeArl0L2PdZakXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnvsB2/KEiLskoi+WNT26YkhxUCSM6APzlMX10cFE5sCmmodb57rm7ue7sOWShKP9eJT28RpRzxaO9Tm8tAyAXqbIQZFY6gHtW79N1Ic3hVS/ZmZJ6mF3pHpT8ZD8/c9MzeY89mA4Uxs1A8j0reYtnHycFIBqNleERkBbJ2ulb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNn4dUi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2911C16AAE;
	Thu,  8 Jan 2026 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767879518;
	bh=GUGVPH21w+eNZ2BLrVL1KJgBU7n2ZeArl0L2PdZakXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sNn4dUi2g/bQz4xH3oMs/mPAPI4ymc6MLyNaWgOaJ8nY22Vb/CSDQiXZEJXAhlLNz
	 D3Ownwsaj/nGQQCMKXz7DdupNe06jxfjU14Mzi/sw+Xzf4Y1pvkS213Vbu46mUUMTa
	 QgKc2AWmvpGpE7M6B9yfxpPBnwk9sKOeG4CO89wl1eJUdYUIQJpre2RGUnVt8XpaOG
	 4IY6fIJUQ/mdrYyPfA5my24X07fZs4FojWr9F18A762MmLKRPou4RdWctMlBwiBAQJ
	 +RaNgWEK04Wr+US+CoNiY/OeuMMaLWTTw40thnp4pDkS05q6/RKRQ8k5rWecjETMM7
	 Iy3KBomY6msNQ==
Message-ID: <d90f592f-6bf7-4b04-98c6-608383652797@kernel.org>
Date: Thu, 8 Jan 2026 14:38:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: switch to interrupt-cells
 4 to add PPI partitions
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
 <20260108092542.1371-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260108092542.1371-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/8/26 10:25 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
> partition map phandle as the 4th cell value for GIC_PPI interrupts.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


