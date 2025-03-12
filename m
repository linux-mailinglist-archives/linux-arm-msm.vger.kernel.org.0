Return-Path: <linux-arm-msm+bounces-51137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF936A5DBD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7B53AFB4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FDF23F399;
	Wed, 12 Mar 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVH6zzSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB423E35E;
	Wed, 12 Mar 2025 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779903; cv=none; b=ihvjISfRjzEMTJLfOXFLxrXggfLu/XW5eHMPpqMqyLtTyTHhIrZKVeUux+VIqQET3YPdmMSoRddVCKpk5snxkqPR3AYO7CaO1YzoXtwuoC5WjUErfaKQH7grxJ/4WORSN11qzLYA8dg5qonAtip0RAlYOPNcNSl+Kf6oAr4X214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779903; c=relaxed/simple;
	bh=HZn6RlsOswkW3adjrj5XUZr0KS0DHc4suL0U/KWEGIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dakkj4VgZwEH7sI9GHJGAx0n70yLjXXmyQjUoMYeNuE8YjiDJODsTsCohyUKtp2exyE3g9LwQbMERcBP7onUgw3rozpYflR/ThwZTvhS3afR6uM7RSR+tVY/4+4PdE7wQuxpyuvuhud/4qfeWOfKrcRuZrS37o41CMhXOorfJzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVH6zzSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80962C4CEE3;
	Wed, 12 Mar 2025 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741779902;
	bh=HZn6RlsOswkW3adjrj5XUZr0KS0DHc4suL0U/KWEGIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVH6zzSBQV0fLi3kMCD38aHo2hizX92nAlToTw5pulOgOLzOhmz6r3r+aRlRjomDR
	 kDg0euFdnsr3JXZk6KE6i5cjFxMiOKmngf7YWmpJf2bHFSdsPrySFo2PvMkiTgIi6U
	 dXBZOQK14P8JDWwrYFN1m7WMMBhxq/HCaa0BswvzFZ25JS8kFcTekLvOVdKokumRjj
	 OrqzZSNti+0SbDgVe+CxEFUW9SLFPOjVAzIDKCgX4vtHUpOyMlG8seqc3SSp64BNvv
	 OGVDmK3kI8qVNIl0bKalnEv/LwT86+4wk7WkGVo7eKnaBQwMXQDwoioYQitRlkH1rU
	 g98jGwo+tH2lA==
Date: Wed, 12 Mar 2025 12:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 02/10] dt-bindings: msm: dsi-controller-main: document
 the SA8775P DSI CTRL
Message-ID: <20250312-fine-vermilion-grebe-bdd5c9@krzk-bin>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-3-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-3-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:37PM +0530, Ayushi Makhija wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index ffbd1dc9470e..3621e3f12b65 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,msm8996-dsi-ctrl
>                - qcom,msm8998-dsi-ctrl
>                - qcom,qcm2290-dsi-ctrl
> +              - qcom,sa8775p-dsi-ctrl

That's incomplete, where is the rest of updates in the file? Not
needed?

Best regards,
Krzysztof


