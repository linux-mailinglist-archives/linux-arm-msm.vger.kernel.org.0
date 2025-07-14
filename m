Return-Path: <linux-arm-msm+bounces-64766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1AB0375D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBA017736E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4044222B8BE;
	Mon, 14 Jul 2025 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le8BHDbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1020922B8A1;
	Mon, 14 Jul 2025 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752475664; cv=none; b=JqJ6AaBWaPows12yoZNh2xel4mmfF1E1DlAF29/8f6IWICi90UTw7EDzyu8ZxqghIEv/idoyJuuOlqzZLBNlNT2LFxfHVlNwzRRGxUmuSX7yXfiY+TP0lMSWCtrmSk1tlixw6imUtTk8brTs3qtLLjD6WiKNQ/lSTGbA1DEgLCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752475664; c=relaxed/simple;
	bh=Hmw/tp+sBdq2ziMP6TR3hCzb9wJ+2WfBgsvg4Va7Ya8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwiOD+bEKq/pv3ifEa3Gb4S8QvZyekSr+dTOmmXnBO3ADtUt6rDgcWfkN9ffWpUowcdAULbG0EHmedE6scLwlTn1TFNQHuorKWrT6DdxtSZXCo/Iskm2omgXNPq9SPflwbK0+7/Sp1TWpL1MuTpuAj7Ftc3VOVKGTkmJAGX3pKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le8BHDbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B2CC4CEF6;
	Mon, 14 Jul 2025 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752475663;
	bh=Hmw/tp+sBdq2ziMP6TR3hCzb9wJ+2WfBgsvg4Va7Ya8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=le8BHDbiG2aNfWCfPAs1SYVdSi/No69Ukea+4UI/CVmXsBPV1fsrOfDgFf31EBQAg
	 Cz4RygdxBaiiY08F20J/SHhs0KO2/O+8xOgZg6FiJAaqq38UMlpJy/cwRiggXyAZ86
	 /c/eBIvXDYoJh2461Ei/gL7tqMjeUg43L9aKbCkSqoxNKcD2XV0Hhly4QRTCEZPbC6
	 Da7H5nIW1rzLZ/VXZneJ5pRr1S7m2PNwTSL3ADjJUsOKxu8I+QdO/IH6WIccO9bgM2
	 Q3K1d7wpSK/bn/ydmEEqb38XV9hOP+68qVyaF8tlZW/7nNPZatOMEi0Z+FFi2jSzJn
	 JVnVKf06MyJ2A==
Date: Mon, 14 Jul 2025 08:47:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <20250714-true-pistachio-peacock-53da1b@krzk-bin>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
 <20250711094031.4171091-4-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094031.4171091-4-quic_jinlmao@quicinc.com>

On Fri, Jul 11, 2025 at 02:40:29AM -0700, Mao Jinlong wrote:
> Remote etm binding change was merged to fix the dt warning. Driver
> changes were not merged at that time. qcom,qmi-instance-id is
> required for remote etm driver to find the remote subsystem connection.

Again, driver... 


> It is the instance id used by qmi to communicate with remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..bd78f6bc2fdf 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,12 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,qmi-instance-id:

Don't come with another, 20th property for your remote proc
architecture. Use existing properties.

This pattern in qcom is extremely confusing - similar thing for remote
proc called 20 different ways, just because in downstream you have 20
different drivers.

NAK

Come with unified schema for existing and future properties like that.
Assuming this is NOT FOR DRIVER in the first place.

Best regards,
Krzysztof


