Return-Path: <linux-arm-msm+bounces-64765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA4B03756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25B417725B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF11D1F3FC6;
	Mon, 14 Jul 2025 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRvj2oOb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184D1CD1F;
	Mon, 14 Jul 2025 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752475546; cv=none; b=C10lATh0OiMZUCjNu36A8iwXBAfe2Zg3fYPuWv3H+ZX8RysevLQqMbsfe9Zcx+CZ2+0/3MKmizPw6TpJVf6HcAgRei4aI7UztqiAjHUTl0XCxNo/sbQ5BnUJTk33qqOz/ZvYhIdJRb9Wt8S8OtevfUF1l4E3zLrp2+n3y4TMvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752475546; c=relaxed/simple;
	bh=Qy1hfqEo2dMgMv0YIqJ7mPsIFK2YG8agMEQFgBf9GCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj0TuueYaE97eqRP6BpoVqcgF6+63d8XxJo7+p33zZcTkK08MnLwFaeuwVHjM14/JUWXUw4gLWJ3Ir+6yHcwuJdBJCDPw2Ahg5Ma3qJpMJnyfK4PMsUPX48tGlJ90kfRFXOjYdZtDkTZs0jcTpnqaz25sC/bZnfEsnbHN2EZpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRvj2oOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E441C4CEED;
	Mon, 14 Jul 2025 06:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752475546;
	bh=Qy1hfqEo2dMgMv0YIqJ7mPsIFK2YG8agMEQFgBf9GCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRvj2oObA6+JGOF4oIOjLEOKy+uoSWaXh5DELylrWEk4SoiumxqOXvVtQX4eRZAO7
	 XTJSjWGErNxiF2JDcd1ZsrtprHphsXbd74GpHtv2jkmjiSBNXylRjG2LY2r6mv22Vc
	 oqamtRF8KJWqfmmut8fm37FF2hb+HQrGO83xiEz8EAxa726EzOXXBfYtDiSLk92UTR
	 OIvRIJDdJ52NaJIk0beldr+KdhC23hdp8ckuG0PIxQHcxAOOcfd4or6QBNya7Kkfov
	 5FWurEZP8iK1OJRFay50oll0n4j3GZ3NGA3VYfaLEMT35mAD7uPOuo+IvoQDTiWN6D
	 XAfw6xU1LZhNw==
Date: Mon, 14 Jul 2025 08:45:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
Message-ID: <20250714-impressive-spiked-chicken-9fe06e@krzk-bin>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
 <20250711094031.4171091-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094031.4171091-2-quic_jinlmao@quicinc.com>

On Fri, Jul 11, 2025 at 02:40:27AM -0700, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> new file mode 100644
> index 000000000000..601c865fe4d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
> +
> +description: |
> +  Qualcomm Messaging Interface (QMI) is an interface that clients can
> +  use to send, and receive, messages from a remote entity. The coresight
> +  QMI component is to configure QMI instance ids and service ids for different
> +  remote subsystem connections. Coresight QMI driver uses the ids to init

So driver... Driver stuff is not accepted in the bindings.

> +  the qmi connections. Other coresight drivers call the send qmi request
> +  function when connection is established.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,coresight-qmi

Don't send new versions while discussion is still going.

There is no need for this binding at all, it is not a coresight device.

> +
> +patternProperties:
> +  '^conns(-[0-9]+)?$':

Drop, why do you keep enforcing the node names? Look at other bindings.


Best regards,
Krzysztof


