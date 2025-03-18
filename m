Return-Path: <linux-arm-msm+bounces-51799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E0A67B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A97D19C641A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318A7211711;
	Tue, 18 Mar 2025 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYEw0NL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A792116E7;
	Tue, 18 Mar 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742319738; cv=none; b=qqGw5E/D/M/n00tSMpSBFNcSZ/Qz18c5UCfIRjKj2uYg5dPucofDdLmyVkwggCRj+wT+RXCQc4UFk/B12fV4bd6ums5UWvK1W1y46soem8u7X1SayvswUplyCwvvF7YX3VuXxRrAaMf6dmeFHYgaV37fqXxkx7EMzhSXtSHVpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742319738; c=relaxed/simple;
	bh=nDTSQtsXdcFV3wn+/fgzKF8to8BLpGLSyAQrro91I+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSQ7fqJehZcVl2aOx1OH1YeNBSBMA36uKkRf5QHtHj/7v/XVqu+LAkW0M2tk8+elUZyDOYD02/7Jeu9NgzXuqTsdjbkq4WNxttvBjGSnrNw936Zib1GIIs5d0ZXRnXygSswu8Pa5w35iLGk1e1w0gU0EmrFmJTzSEcbhixq4IHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYEw0NL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A3C4CEDD;
	Tue, 18 Mar 2025 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319737;
	bh=nDTSQtsXdcFV3wn+/fgzKF8to8BLpGLSyAQrro91I+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYEw0NL4o1bJLrWVXJ1Lu4adR2NQNviKVPCVOqWfDPrxdMD7fcslpbkoWhpqaz9Ef
	 qbbIR0BE3XzE9wKukl1+FQFydksuoISNW+iW71CSAWxe+WFJwioFz6XcoKCxplLERs
	 hwRa3tN2glcCuTcJ0MZpTxXRrBgjN09Mrgb+lrgMYIG0tP4J9r1Gz1D2wro15a1pRm
	 L/WQ3/ecbCM/RWapd8MyCIvlMlmMqdSYIueTCKTMgbIcMyFbAQhhY9uaQaAlmTvRZi
	 0x+/hosRV8P1aRbXKxAKSbjfRVXv2Sum6iZizbeWWhRgVHUhXmWzHXTm9QEyM63xG7
	 q6+r/RjMq9kbQ==
Date: Tue, 18 Mar 2025 12:42:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	linux-arm-msm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Message-ID: <174231973562.3281729.13844213824981860585.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>


On Tue, 18 Mar 2025 15:21:58 +0200, Dmitry Baryshkov wrote:
> Add compat string for Qualcomm MultiMedia SubSystem System FPB.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


