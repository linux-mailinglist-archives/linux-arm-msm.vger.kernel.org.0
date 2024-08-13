Return-Path: <linux-arm-msm+bounces-28408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE9950B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 19:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1712860D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 17:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9473C1A2C16;
	Tue, 13 Aug 2024 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMpadfOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3C37E;
	Tue, 13 Aug 2024 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723570863; cv=none; b=oNjCU6Rqb2vhW66QZBBEkGrRKLB6iPpyO7PCUMQPTahXYmB8FoCjxrKT3U+brQGwOx0r6Z8bp0vaX6GqRQk4BLwdthBPFlFdQnapHIP/BHMI+REG60Lcmw7p0c3uAUGB0lLKpVnXeWSudlMteClI3CPpR5cxtuPFbVCSRUEj2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723570863; c=relaxed/simple;
	bh=n+ck5ZGYVQvKs0fi/T4dhxX1TDgYijYpCDGAlciLV0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejnNkvxYYEZa4jFXZYHBH6ZBYjX6YSEqSAxCFpYt6ZJU9HpgTT9nkFn6cQ4STkc/aHTJXbjOfmXqnscO+OvCNY1pKZV2LABmZX/3zP83lS87bzNBwYenGMW4fxYC9f/F7T+rQb6l+XxXa69BOHFu0PV5OO8IJQFiGTnKPMukLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMpadfOq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858BCC32782;
	Tue, 13 Aug 2024 17:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723570861;
	bh=n+ck5ZGYVQvKs0fi/T4dhxX1TDgYijYpCDGAlciLV0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMpadfOqY2IpIZVxjZc6ICeVL/dyATcsnf+7fcnMtf+oL/LcRLThac/iMwzS991zE
	 u07bRVhB5AC/fmFRe68SywXPSiPIDF0fliE6k5LcpWDqkcpTIETm9v06ylOsslmVlf
	 oUbSYMFE2I8LkqqLYQAxD4AI3P86tXNSA11RJxQlzNP385A0vHOYPkQKxn28N0HI5v
	 Bwe3D4dJ5SCav/Fc09CXRTguQYC64Osz8jtMPEMgFa0gy7TijQprwN54XoKszamxzm
	 7WnRZx7cWaYYrMuhp27j0W9TGB3gum6qidx1Hp20SuEiCndaGPRHT25rZrPgtzhydl
	 6wPMD6Kiq3hkg==
Date: Tue, 13 Aug 2024 11:41:00 -0600
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
Message-ID: <20240813174100.GA1400130-robh@kernel.org>
References: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
 <20240807071054.12742-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807071054.12742-2-quic_jinlmao@quicinc.com>

On Wed, Aug 07, 2024 at 12:10:50AM -0700, Mao Jinlong wrote:
> qcom,inst-id is the instance id used by qmi API to communicate with
> remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..a65121505c68 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,13 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,inst-id:

qcom,qmi-id perhaps?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This id is used by qmi API to communicate with remote processor for
> +      enabling and disabling remote etm. Each processor has its unique instance
> +      id.

