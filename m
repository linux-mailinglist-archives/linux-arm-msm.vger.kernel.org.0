Return-Path: <linux-arm-msm+bounces-45051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA226A113FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 23:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02F38188B1BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 22:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275762135DA;
	Tue, 14 Jan 2025 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1g3TAM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA622135B8;
	Tue, 14 Jan 2025 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736893296; cv=none; b=ADABXZzW//6nvnWfhAiJ3zMZQVakSP/aKbtV4qJnWqc55cVMV1YGPY9m8JYO8KuUx+QO8m1nebE0jb7WqzSzQgM9cWlI6lv2fuKhbXio9PPTBrJLbc5EcfZ2Hkk89qks6GcYYZWa5h6aEOYnLba53da93GhCvciDlaUG7TSaCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736893296; c=relaxed/simple;
	bh=PuUmuNai6cjQ737aOdSCDL04yveI96OOlq+nlDDv00I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGlEwxSzn8W85VAK03TlRxBYMvUiIBlzD7URySNniihdEZIhv/Yd8nU23HB8QUQQjV41qmE461cCxkc1fiZ2w603sui+60b8QJOFTfae5Aes2hSPUN9rr4EG9Rl2RQF7io7RzHpd5g7bgY8uFmQ16TTckvIlvslETVwxgtKIcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1g3TAM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D168C4CEE1;
	Tue, 14 Jan 2025 22:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736893295;
	bh=PuUmuNai6cjQ737aOdSCDL04yveI96OOlq+nlDDv00I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1g3TAM68Y9R8pbzkyH3Mz7w3/s2714ukgDb5zxuX7oLGiJZkOntTMbOtPfwLU9j4
	 rFZI9krTtiwz/9TNViyUYU2XQXNabstdVhN6OPQke1kPt6gojvEzvfBaLpXDU8Mn+Z
	 9l8rFrHLs0FxfdR8vzjw1Ikcl81TQN9An2J06rGNvru/G5jO9p+drDvSU+eABB84D/
	 IohtV+7NZEGp9WEClOEC8noZ6JBfqVgBbWIpYN0jiyRkqxvoUjjnAL/bIr18nUej12
	 UUqlqaXyMzXmgmWosBu5UZha+p36zw/7vEWk+Ss155tKmgQ9jRax4S3KsaLtIP0/3b
	 Vww61bPl+wLIg==
Date: Tue, 14 Jan 2025 16:21:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-crypto@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: crypto: qcom,prng: Document SM8750 RNG
Message-ID: <173689314919.1747667.12076698593104019076.robh@kernel.org>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-3-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_crypto_master-v1-3-d8e265729848@quicinc.com>


On Mon, 13 Jan 2025 13:16:23 -0800, Melody Olvera wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> Document SM8750 compatible for the True Random Number Generator.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


