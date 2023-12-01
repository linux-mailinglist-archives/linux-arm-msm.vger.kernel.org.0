Return-Path: <linux-arm-msm+bounces-2857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F080075A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B563281740
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7571DA46;
	Fri,  1 Dec 2023 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHlJlG1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6611CF91;
	Fri,  1 Dec 2023 09:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4C5C433C8;
	Fri,  1 Dec 2023 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701423815;
	bh=25pjr03NymDAPlM072b5W0m3OKHkhVTbuQtF6H2DbYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHlJlG1AuVQ5t+QkSYRXKfcsL4V0rPltvaY3mVNTv0OrI1OiK18w5oXvegqDzZSFd
	 tCARYAiO/cn7Hjt9F8lvupwmpV5oDvNszdesbw6Rp16Blh7B4Y3Xjoh+1qJxfAZFxf
	 ME+wREKAjSQG8kMYX6v9wyvETNhaqIVbgl31dc5XQbdd/ETpRfN4GUfAG2oi0eS/dx
	 //6NIsLBza4yL6G9bvvrHYeIwlGSqPbYXecgpExB/tHYHekAgTIiadnZydTh4d1E4+
	 FFyl5ydAzlMxlNw9FWsa5MJp7kt4FRZ6yJSX7uiY1rHXHT8mlWCFGPj/Ovwg9koWQc
	 /ghBENR7OjUWw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r904B-0003K4-0M;
	Fri, 01 Dec 2023 10:44:11 +0100
Date: Fri, 1 Dec 2023 10:44:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add QMP handle
Message-ID: <ZWmq619zryYHV_kK@hovoldconsulting.com>
References: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
 <20231130-topic-ddr_sleep_stats-v1-1-5981c2e764b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130-topic-ddr_sleep_stats-v1-1-5981c2e764b6@linaro.org>

On Thu, Nov 30, 2023 at 03:58:21PM +0100, Konrad Dybcio wrote:
> The stats can be expanded by poking the Always-On Subsystem through QMP.
> Allow passing a QMP handle for configurations that support it.

I know Qualcomm likes their opaque acronyms, but how about mentioning
what QMP stands for here and in the binding below?

Especially since we also have QMP PHYs (Qualcomm Multi PHY?), which I
doubt this is related to.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> index 96a7f1822022..686a7ef2f48a 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> @@ -31,10 +31,24 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM

Johan

