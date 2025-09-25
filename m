Return-Path: <linux-arm-msm+bounces-75104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539DB9F55E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7520A1BC3D5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6045A1DF261;
	Thu, 25 Sep 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uB2kh8Me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3021DDA14;
	Thu, 25 Sep 2025 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804442; cv=none; b=ZoEmQH2pNYVoB8xy218HdafvRLVuJo2qRDP4aX+sFD/uM6ktQ5PDv7dlic3ebKHgyVkJcPr+aQl7v2t7ND1VGcxYNmVyLWrMjddAc8gNZcPGHbXtUz6q2zTdpJc8c6pQvi+SEdF/FRw99Rj9nAuDr9PRWn72wPnTVHvgI/xxNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804442; c=relaxed/simple;
	bh=0va9/EyMjKMurKnEoNlMlsGNtwpMnvTh5eZELuACqr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAhmBfyS9aLSIBc/Jmn8qvyF4on7Gd6b7EUis19/uVYOb3BX9ZUwgI7QRpHjsiwKczOx7Isv4aJlBpzDW8N47hn4bDCC513/wM2uit6ioFvFFL5qoh+Nft1ZA4oQT2TyRCHAVhS1JRCg/mc8lf+j83b8vRdZqx8BpRTv+hGNB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uB2kh8Me; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E82C4CEF0;
	Thu, 25 Sep 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758804441;
	bh=0va9/EyMjKMurKnEoNlMlsGNtwpMnvTh5eZELuACqr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uB2kh8MekoL4HrWbZoaCpxvMyS1CQqAccAKQLSC7vRrWXOMJHeDiNACXwxOwivuTW
	 k3PdEOhRVEhcJddTgo0imo10Qrbgx92Ya+Qwv+W5FVLML7ADPkvFA02EylFVCuWB5n
	 mTPYIbssgGiVYtsmdxhUXe7BjENkH+JfAh6lwk5hGAU0P7m3KPH7D5phcZ/WLfKVuw
	 DwTQ8+Qrvnbt6p15pI3dJygeAvm8Ec8NqUrCIMyIVDS8umoAbGf33wrqBXZeLvYD2+
	 auia77sI9GhXZzMfG9BA1xVLeyxjNLUKnpE8jFXFSXczpx5uMpOhtaRcOitj40Yu29
	 64XJzoeE/aNWw==
Message-ID: <9d1bc76e-9070-459b-bb83-92aed2fc8e0c@kernel.org>
Date: Thu, 25 Sep 2025 13:47:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <P5tG63fZnyrHYqzybjhoOpgXBlJQHT92Z3VjYNKDSMpfjuZsHZ1_QlpibvJLNKH5mvMsoZeFGDqCKJJb6gpvcg==@protonmail.internalid>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 09:44, Taniya Das wrote:
>> This is not a revert.
>>
>> Where does the compat string go ?
>>
> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

