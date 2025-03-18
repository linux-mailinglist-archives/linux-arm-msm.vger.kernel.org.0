Return-Path: <linux-arm-msm+bounces-51797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E9A67B25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24BAC17D0BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA7D2116E7;
	Tue, 18 Mar 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXh9oDS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2B1A2658;
	Tue, 18 Mar 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742319632; cv=none; b=RWQE5FAXMRH/a7bkdV9do30SnSYIDWE5YT/OljB0xz2cnF7TylCi0B7GNUfbh331NmMNp3VVr5fGhKIZYZQCiV/+r5ANs591JyDcUpdGmBwJMdW5VAwOxd/3to7fGyUBbbC11ztRhJXhvwVp1RJQEv+QgHgaK7mLeuDm16yGoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742319632; c=relaxed/simple;
	bh=cUYQCkESwWasI7h0pS1MGj7Wb8ODx2zDhK2nrfIcw9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joK5Pa0ecNMP4qfRGL3kxIsPipLmsbS2ausAPu2RJeoMC3fqpNrN2ZCit4TToMF8CyWZQarESScaOmWRlJQ5wh7pDc4OYSMEcakPt7ALoit9fw4EMFHigxDrYkp6K8OvGvt6P1DKh32PI6GM5Oz/fDvFugelo6etbZUSWBHsmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXh9oDS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC27C4CEDD;
	Tue, 18 Mar 2025 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319632;
	bh=cUYQCkESwWasI7h0pS1MGj7Wb8ODx2zDhK2nrfIcw9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXh9oDS4ma/dF9t+gI30B7iGD1BB8HaFWilQ2nNDj+NT41/5m1G4lzjmyGzTdfse+
	 tlYjXkSA00ucDQHWwvzE9fosNBNqmrQvV1weeWrhzKI5/JsGoHBYO91E9uOJvO7I+d
	 OSLFAk1wxCpa2p/DI4nUn+8+EkUcMOn6WnyUOZ7172BfF3a7W83p4WnqR8oEokGUxc
	 QyFCj0GJSpC2bbTR0qIrjKIvkY0yHQy1FAJ73tn7XtSGrwZBBNzYtegyPq2P6xbb7G
	 p3il3c6vMxxlFlfxGai4s/qRj8x3hPkmqYUXd02V2ndEaCV/iBai69h7Jz9CMAInPJ
	 FgYBWY3fFzWYw==
Date: Tue, 18 Mar 2025 12:40:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, coresight@lists.linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Message-ID: <174231962960.3279035.17499878913808619235.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>


On Tue, 18 Mar 2025 15:21:56 +0200, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks. Document those optional clocks in the schema.
> Additionally document the one-off case of Zynq-7000 platforms which uses
> apb_pclk and two additional debug clocks.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


