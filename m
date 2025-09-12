Return-Path: <linux-arm-msm+bounces-73263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A6B54605
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3980A1632F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2184625CC74;
	Fri, 12 Sep 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxb6bHH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8128FD;
	Fri, 12 Sep 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667240; cv=none; b=eVhH4DBh+j/Vvi9T9BoI/Lob1dgxXV5SVuevDsEbjn2E1VNF6hYJpQy5v3mjagfycpk0JojNTcBEu9v/tJZ7KsxNJkcKeKpb9N7dfXFu4ATVXodZxZd++OM4qc4pvCnRrIVBWO9vZzbw293MRbuBuIR8p+0/64Mkdig3VvxX1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667240; c=relaxed/simple;
	bh=1xnH1HCOVekvdTi6weI1GPY+iBGGQOUPvvD6hHKLibI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7t68570/UZaNcRMUFw/sj35t72Kvg/ZeZHG9pqegjNQnzowNeNFgRvXzRUzOisw05V/k2eyObeUtj4CplPNJOBCqMKRh2OaJhoItwPzghqNAUAegFCQGofjT0CsqlgcLQw0/PxRX3d31NDwLuhDvtuzAmeLRtaMf/0Jtx+nmc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sxb6bHH9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96890C4CEF1;
	Fri, 12 Sep 2025 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757667239;
	bh=1xnH1HCOVekvdTi6weI1GPY+iBGGQOUPvvD6hHKLibI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sxb6bHH9UxqiBnvL+6SeLM4ubHQz2fuf/WZzQKqSIdkAwp+5ynEzQXmME5EH64E4a
	 yPtO6+unzN3xykEvJfFdzbOBGffsYK+vBjyZU0wtffUOFQCKmiO+jRZghdLszBZ10j
	 5bN6EapOjyz8iZVqKNSYvdjwTE/ty9ExAAosHR0WBn6C7vQ1cKbL6sXNwes4qgdWWZ
	 7JWO/ilhQZFSPJe0tAOroZL714pJAva3ZmUCV10rNHOMUk2r9uk9p6pUN4XkXY9wBG
	 gK4HU5dbg1RxyUzMhmWeP2NOYcRlLRmPj/IaO+5w8mi27onOHBnvoFwH0y1DtlVXu5
	 f2tTKiOC9/3Yg==
Message-ID: <0b703f90-fd42-41c4-86ec-bbeb71553127@kernel.org>
Date: Fri, 12 Sep 2025 10:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <1ae48740-1788-4304-be86-455251a02ce3@kernel.org>
 <A671BED7100C2766+849829a3-7da0-4d9d-817e-f8ce78daa56b@radxa.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <A671BED7100C2766+849829a3-7da0-4d9d-817e-f8ce78daa56b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 10:25, Xilin Wu wrote:
> On 2025/9/12 16:12:54, Krzysztof Kozlowski wrote:
>> On 12/09/2025 10:03, Xilin Wu wrote:
>>> base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
>>> change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66
>>> prerequisite-message-id: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
>>> prerequisite-patch-id: 257564b609217fda19c9f3424fcd9f6e2ce3ef3c
>>> prerequisite-patch-id: a8f21781f3bff140260100b74041752000c06000
>>> prerequisite-patch-id: b46127e2433ede17cc5e1a012f58041c6ef97b13
>>> prerequisite-patch-id: e8978c5a30373c3ff312b2c8720f586c389f18f8
>>> prerequisite-message-id: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
>>> prerequisite-patch-id: c7a057030b78afbbb231280de3765294c006c6f8
>>> prerequisite-patch-id: 56011305aa35e4c64fc7d63950764807cb81cc4d
>>> prerequisite-patch-id: c3d3b313ac6abe4ec10fd820b6a9bbc63fdbdb82
>>> prerequisite-patch-id: 63ee94d0ccd40f60a98b0004d627ad2e7b440d25
>>> prerequisite-patch-id: 392e8f1902571e5035d5af72e40dc474b5f1b274
>>> prerequisite-patch-id: e38fba722bdabc02ba09d2dc51df7010dbe28168
>>> prerequisite-patch-id: a3ca5dba8def5769ffb4b95df2963da60a736f96
>>> prerequisite-patch-id: 4c0fe8d677d73aaf1b5b842e072246d84729d1c4
>> So the RFC is because it cannot be yet merged? Please always add such
>> note in the cover letter.
>>
>> Also, are you sure these are real dependencies? Like REALLY real
>> dependencies?
> 
> Well, I think these are indeed dependencies. The dtb does build without 
> them, but dtbs_check will fail. The board will also malfunction or 


That's not a dependency.

> simple crash on boot without the DT and driver changes.

Neither is this.


> 
> 


Best regards,
Krzysztof

