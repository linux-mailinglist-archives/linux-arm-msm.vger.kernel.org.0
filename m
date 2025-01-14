Return-Path: <linux-arm-msm+bounces-44974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF0A101A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 09:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 435353A5071
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D05A24335F;
	Tue, 14 Jan 2025 08:03:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448920459B;
	Tue, 14 Jan 2025 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736841823; cv=none; b=kAu8nHgDhJflFrpqrlQMy4Y3dNCP4apuXBqel3CrXIREsOF3utf5uBwnRXunKtUgUF06PPVV22JwEJVMNwTmF4hJodLb9E6/tF+2iu2TZznjaLoS2cfRM1OormBjRfo5bYBPYq3sugfxGlEZ+sq4aDEeJgov0C4wI89RJ5UULz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736841823; c=relaxed/simple;
	bh=oh1JZjgs/dfH4VzwZLadbdk2O5emv7+NTl6Xq3nxLjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsiqNM8W8+brhXoDkNbuaVcCmZW9tkVc2ohkRUyLFRh3OROmn//zlhI9gk39avdvqBrxYew9Ae4mLnoMAHyzgPIs5MZnAx4uW1zrFkmkogOp/BnZQ81wnrx7SefMXAWNyYgwKBZvDdgkZixJ5MF4zhb///SJKDNhaQAVhB/iaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65D1C4CEDD;
	Tue, 14 Jan 2025 08:03:41 +0000 (UTC)
Date: Tue, 14 Jan 2025 09:03:39 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
Message-ID: <d3i5hmkft77xm5jxcpfapnjmodsbmpyeklvcxtrqfvk2fqnonx@ajoc7pguzr36>
References: <20250113-schema_qcs615-v3-1-d5bbf0ee8cb7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-schema_qcs615-v3-1-d5bbf0ee8cb7@quicinc.com>

On Mon, Jan 13, 2025 at 05:15:39PM +0800, Yijie Yang wrote:
> The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
> sm8150.
> The current fallback could lead to package loss, and the ethernet on

Packet? Package?

> qcs615-ride was not utilized by anyone. 

I don't get how this part of sentence is connected to previous part. I
see the "and" but what do you want to say here? Packages with qcs615
board were lost, therefore the ethernet was not used by anyone? Or
packets could be lost and this means ethernet cannot be used?

> Therefore, it needs to be revised,
> and there is no need to worry about the ABI impact.

Again, Oxford comma of joining entirely independent claues. Can you
filter this via someone / ChatGPT / Google grammar / Outlook grammar?

Best regards,
Krzysztof


