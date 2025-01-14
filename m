Return-Path: <linux-arm-msm+bounces-44973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA649A10194
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6A01888563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 07:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB37524333A;
	Tue, 14 Jan 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoSLtcyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE591361;
	Tue, 14 Jan 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736841427; cv=none; b=dJ1ihoSXTp12thcW/Hk18MLlBVO9VmVCRSTi37HhyNotMdvjAJP4rNaBYJOMlLggD8N3TZWFXz4w/jH0WCO7EptMJs1zLkV5/GynlgPQYvfu3Vg1sjQZA2Q1BwvqHhvrx1z6WqFu0XrUyNlpUyYXZzsnGsap7SrdPe/nXfGA9BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736841427; c=relaxed/simple;
	bh=ZloWZNduwAPjDvbGadMXp2gP8vQf1XX1e+wOh0WKm7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6sg3Kj/Sp3l/06cIYUu5Jaui6+pNKztLobAraLqDoz2Xidug1XtdNfLbcdxSgX7qpg82xIdzcguJwgA8ydbPZGKnOOAhsAxZPmqRMt2VtIEn2H63rxregHzx8y7d+UxrQPLvXop6kD1A2+C0AV5fWE+txaxjgk3B4vumSOyt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoSLtcyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F08EC4CEDD;
	Tue, 14 Jan 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736841427;
	bh=ZloWZNduwAPjDvbGadMXp2gP8vQf1XX1e+wOh0WKm7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoSLtcyoyKBgQ0ahEo0MIpQJ5CIHFw61HjTFG2rLHJKe/RQ8eqfVGEEbT9uBFIQ1Y
	 f1UuX4Bzdl4DPrVun1gYmxjAwRxBWMiBeT+/6EU8QlZZx8r3iolZazKFa92DeE1guA
	 XWw5iy9Ixx9Pv2Rhn1LmOjLDlZquKEnx6CZsVC/TPTQZuyZ+D0r/7PAj84UaWciOjH
	 0TihPtxkTLaTjhSLbKkV3m4B7UUknwEo9o1a8rURDRXsSfA4z+pdWtCrzSp5kOXjMJ
	 wK+C/MaUZpVPOUEQwo5ekuY2uVCMbkUyTVg0iUMCsf/POPIhoWog6Ug1v3RNUa7V1v
	 Qt6jRxWMgcsOA==
Date: Tue, 14 Jan 2025 08:57:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>

On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dpu
> +          - const: qcom,sa8775p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dp
> +          - const: qcom,sm8650-dp

Parts of qcs8300 display are compatible with sa8775p, other parts with
sm8650. That's odd or even not correct. Assuming it is actually correct,
it deserves explanation in commit msg.

Best regards,
Krzysztof


