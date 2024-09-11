Return-Path: <linux-arm-msm+bounces-31497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154A9750AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148361F233FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C09186E24;
	Wed, 11 Sep 2024 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uidciKPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1D185B47;
	Wed, 11 Sep 2024 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053850; cv=none; b=c1eU4LF9whbZrJHJAAqQQ9vnx6oyXNjsR56kOBjb+58PhEaAmLqCKVKwZ59gl3DTbpOTJp6uK+xhTdpTIb+Z5B8vImYo2VFBUBxoUogADhzR1CFxwsurc1Ga5N2d0T9hIeTODQjLv8hbtSapMLo5EY7gU+b5UwSy1a0ELZstGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053850; c=relaxed/simple;
	bh=hETZYrZMAcU1W8aWQ6w34cUawxYCAap2PBFy6x00HUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXYHecDdRsAcEnUUK9w5t4HNpdGYBh6HPETJk81n+xxCf0KxADOg8E5QyUqlVNGMUMVVAO4xg/6/4gdScLxpnLmMAIF0ObP/0k/5oSmZzVS9RWgsctNWlINzYamle9Y2byUyBGa9XXjVuClTyr+BGr5I+elRIdQCfzsU8gsDPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uidciKPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AC0C4CEC5;
	Wed, 11 Sep 2024 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726053850;
	bh=hETZYrZMAcU1W8aWQ6w34cUawxYCAap2PBFy6x00HUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uidciKPxbXjXn3gvVgBIknRVHUu2wdGjGVn0FPHdb8GHqItk/TUEXAbB0sTQLUtHs
	 8Q7uil08XzkyyaDvfOBJVhfcOId0VxH8SqaL2mUnoJvCj5YhRAxZOmTOELmPjSLfLW
	 AE9ceKt0PN6BLtN4hS3yVwWO1up9XF9RmaLoLvBJ1Q0i+vEKtp3l3FfdFeRiA4DJRV
	 UrtOpSFbp9grug6r5hoLSn4UFzWHAK1b5/S3/i11kJBGy3/p9oHXR1oIEP5eG1DcfD
	 AlWOdoNPgrZru4XsVeNiQwQvMPTDRwwCXy/WMsXlWqCJyw/zyjN8kdQsJX+Ut6R0Vk
	 sQSgooZV5k8Yw==
Message-ID: <707f8df3-096f-45e6-a37f-9d9d4ca259e1@kernel.org>
Date: Wed, 11 Sep 2024 13:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: Document qcs9100-ride and
 qcs9100-ride Rev3
To: Tengfei Fan <quic_tengfan@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
 <20240911-add_qcs9100_support-v2-3-e43a71ceb017@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240911-add_qcs9100_support-v2-3-e43a71ceb017@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 1:10 PM, Tengfei Fan wrote:
> Document qcs9100-ride and qcs9100-ride Rev3 is based on QCS9100 SoC.
> 
> QCS9100 is a IoT version of SA8775p, hence use the latter's compatible
> string as fallback.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

