Return-Path: <linux-arm-msm+bounces-71685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70102B40F92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FF21694C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 21:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4858335AAB1;
	Tue,  2 Sep 2025 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoJlG6Jb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B51258EF0;
	Tue,  2 Sep 2025 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756849365; cv=none; b=Pj1rpCaSUdySxa2z4mbeMX9CyL9X1KSdn5OVC8rsGXDAGrAzOOPkQZ97SrhisC8e75kKTPEvchHgHPkya6mxmlz06XsSeE6gDixX6Rp69tDNjmCwMDgy2XEbvYhttxYkXNOr6J28mgk5eAZzUEZ89r/Kb5qIoH8OJ6xXzVkhTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756849365; c=relaxed/simple;
	bh=RjK40O1erbbu/Aaqtcd7wtn/XHEa2oLzQ1L+Jw/nrP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkVjNL07X3kto/cGBzSuWDAc2ljFA4sXjYB6WLhQ7CM9DYIDPEFXLNJlzrG4N+isY0B+1/fEW/ldfzT6yo2FuJzLLE0/UUaZMv7sFbzat6+ozgmvi3jkMljhtcjVSLhmxE4yr4hVsNT32CGdnc8Ps7FQlY8H7U0PDSR8P7G05xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoJlG6Jb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7949DC4CEED;
	Tue,  2 Sep 2025 21:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756849364;
	bh=RjK40O1erbbu/Aaqtcd7wtn/XHEa2oLzQ1L+Jw/nrP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EoJlG6JbZMLwZp+m1BZbhMawCR/5RmCUTGA8njxZFmehPeIWW7JFgU3N3x+hw4LpG
	 OFd8vAkhr0x8OLlVta9zD5wf8H3Ubjf8Jf3f1vtYzyRuprlUcFKOyEkPVbYKb5VeQH
	 qbEXmxnF+sqcJQC3mdXguj0PYnkR+jPTfa6NbuU+/yBmjaAHHAcPZZ7CukyR/+/PNj
	 olac12OyMTg+qwOCnlM7HvFzIAr3zGA6X6dx/l8Y7JVYdwCIROCjFl6dtK+RjNo3el
	 bCQmg/ubnFasfzVUqGzpA8ydpEV513sGZfHTIC8E+3Ud0Tvou/MlqMu9K7CGaWuID9
	 XQKE8ByoWqfEA==
Date: Tue, 2 Sep 2025 16:42:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	James Clark <james.clark@linaro.org>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	devicetree@vger.kernel.org,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
Message-ID: <175684936304.1217220.3167248149687349464.robh@kernel.org>
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>


On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
> Update the OSS email addresses across all Coresight documents, as the
> previous addresses have been deprecated.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
>  .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
>  .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
>  .../arm/arm,coresight-dummy-source.yaml       |  2 +-
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
>  .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
>  .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>  .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
>  .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
>  9 files changed, 42 insertions(+), 42 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


