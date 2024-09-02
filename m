Return-Path: <linux-arm-msm+bounces-30416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E4968B00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A87B21EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92AA1AB6C2;
	Mon,  2 Sep 2024 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSnQlPnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1291A3053;
	Mon,  2 Sep 2024 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290860; cv=none; b=ayHQ6z/auAOJDmqGpblUDT0RfMdhcdKd66vwOkvJNk+DNhnynMXuJo6MRVJNBX4MiZyI8huvNjDXXA+sNYyQ10re0iPAU/sfEntLOx4jCOcqkZ/QQGYYdQW/HK/IkRAxJxToXk3RIn6r5PGQtrlYbaROQm4SWpowM2Rk8fTrEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290860; c=relaxed/simple;
	bh=99aNM2h57RcQAhdS8xa1IUa2iuaL/BnSjqqzdDL6WzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4++oao1K7zXYTcEoYhT1/k1W+6PT9/cy8OBHjcW8VpR8dqJNzIyj3ltTShhonL6ZpyydGvfopW61DhIxPoFjSVt5PbeY6gx201kKMOrMVGtcEcyQGdon9f6/F+xcO42bOTdCDUOTVAIsuZVEX9ZAOT8rwAjV4oFkq/vBPchXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSnQlPnJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF82C4CEC2;
	Mon,  2 Sep 2024 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290860;
	bh=99aNM2h57RcQAhdS8xa1IUa2iuaL/BnSjqqzdDL6WzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KSnQlPnJ6PmI1dURgo+Q7OhIJ8CAsEBfgKALWvmwsA2FasA+KAw4PhAjyPsKzZtBh
	 5rmGRRYAQVgf0rDw87N5XPe5jjxcV/3NDZQawLyGT51//EbFoV01onDTSw3Mn8QDvx
	 xwiNHAekOrCaJt6U8NndbMwlYOj/YDx0ZljgKJo5ltK8ejro0mZgGCvARSuwtSV4g2
	 VZ9n3UvAXs7SijyiJ5WCEyEqKGbkVZXOZ/Mm0SmDcuBi33m1zBODb1a0N/hh4XhOge
	 o2w/REI3gTAzo4Inxk54oAfycB/b6Xw/iOhcXkM1Xurwz1eTVsHOpUZuj1PIsvY0vC
	 io8ahzXJ0dmQQ==
Message-ID: <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
Date: Mon, 2 Sep 2024 17:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for
 x1e80100
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, Yushan Li <quic_yushli@quicinc.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 9:27 AM, Jie Gan wrote:
> Add coresight components for x1e80100. This change includes CTI,
> dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
> 
> Change in V1:
> Check the dtb with dtbs_check W=1, and fix the warnings for
> the change.
> 

Applying this series and enabling CORESIGHT=m (along with all the options
in menuconfig) breaks booting on my X1E Surface Laptop 7

Konrad

