Return-Path: <linux-arm-msm+bounces-35656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5BC9ADD57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 024431F23C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E91C19DFAC;
	Thu, 24 Oct 2024 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpZQNcLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB28189BAD;
	Thu, 24 Oct 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753963; cv=none; b=LRCC6EAiSyBLA+6rDbODT+Cuxc/8PTn7uJJn5NejyoWhNMQul5VjSy9YlzCzbjdjXGzxf6L9ExjIAKEdMDGjUFVRCCLY2wpH7atU5XTgDEyETG/yIDHsyVtva8bX6Pkod1ACzxsZKoKyh4BDpWDNGU5xPt8HQ4se33qq/pncDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753963; c=relaxed/simple;
	bh=ivHa9mrhegtxO3Q7geXr2Oyyb9aQ9mAh7cMUAd0X9aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxYDlzcf7RQOhUzJNYi7VDShXJMuzTLdP8nL2TBU9+dN8zsHNwpr/O/n8a/f/ghgYQTMbuAUe4txaKmcrgi8NZ0V0FCUz3mrHoe3W6TmZEsUeTAJfqvzhkhYy9qokwdy0us+wcjn4WmxjnGnB88uh2oamU7yQXWE33s3sVNul1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpZQNcLS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AFCC4CEC7;
	Thu, 24 Oct 2024 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729753962;
	bh=ivHa9mrhegtxO3Q7geXr2Oyyb9aQ9mAh7cMUAd0X9aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpZQNcLSEE5cjifNukT7Vu7Fb6Ll7qVRDqojODlObL6Akfm2A3+KYVEcGbcKcot/C
	 f0xFrQi9+q1IIDNkgZDFYYqsUwvhnLXeMW2YbSxxUMRNfh+8RANVT/xbdQgb9UX8t5
	 4SLMU4fOLNiYH1XmjC/7Ufpz2eFt3JXNKmGAcU5oQ0PMcnEOMES9iWMfEjvKQa0CVW
	 2kQZy1sPwQEGDIQjLEXc9ZTqt8NltOqb39KFFUwsKCD6R4lVQvb9hy8qAgSGlOFq6J
	 c4IMCap3ohH2TLcF4fPl1g3ScS8Do+m7BE4yaqhICZQClo0qzLiwYhvWtX1RmOgXZ7
	 XSW0B1s608Y3Q==
Date: Thu, 24 Oct 2024 09:12:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
Message-ID: <raa3otr6kmiq72qjb5rnqt5cluqw627jkfbvkxqi2vbjpbwpsb@v64xvghgxx75>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-2-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024065306.14647-2-quic_taozha@quicinc.com>

On Thu, Oct 24, 2024 at 02:53:03PM +0800, Tao Zhang wrote:
> The is some "magic" hard coded filtering in the replicators,
> which only passes through trace from a particular "source". Add
> a new property "filter-src" to label a phandle to the coresight
> trace source device matching the hard coded filtering for the port.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


