Return-Path: <linux-arm-msm+bounces-51796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CEA67B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 445A23B2023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468EB212D83;
	Tue, 18 Mar 2025 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9m1skF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDE20F091;
	Tue, 18 Mar 2025 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742319602; cv=none; b=eV568+XmNaVhnNJB/bByAcI47xoU+MBu9UD95h8kGZ50Uu9x7xAHS1XIIU4XAAKmznGFaeO0VZPN2viAu0QECiH9JD0yUGexZyxEtYy8iZxSfsIfiq9xRxMdUAsrjby0ce8uaodrF4p50u0f1TcOh5Fbpi7fiJbAVQMAZsrMJWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742319602; c=relaxed/simple;
	bh=qoLQwFpyolz3QhRAjnozqvOcSs62LeQ0H5auHHLjAS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tp0Aq+5Vxcg9OXQGpX++KodXLldEh++sbYqcgfqpoj3cdd60Gg+aRp6MhglkDPHgvli6Zv5OAk+6ugj0cHxHBhtFdQ6HHW1b0K8x/z4rDlEhZ3JS+VfAEfM0uxk3BXHV5XDZw0X0oAKfGnot2KlpYG63F8D9PiHs9gV1KNKWMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9m1skF0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B1AC4CEE3;
	Tue, 18 Mar 2025 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319601;
	bh=qoLQwFpyolz3QhRAjnozqvOcSs62LeQ0H5auHHLjAS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9m1skF02kF6FLgsYcmawsXo4/NPefeN9w/jHmarRraWZRznDnWAHhHMY8QKa7ZXd
	 n3jCTwbNmtPnHiMT8E8N/4nFHK473Sl42Gaxcvh45R12tzpRJG0yT1zQXAuqaT0pXS
	 IojCmCYMruf6pjUQpyKMQnzQcNF48jo4iTEG9FEo18Uxy9FE+Dise2qdqts/iyD1o1
	 x3EdyLWa3QtQKwss7HHlizayTr1pEauF2FEbEJThoKG4GZyOBzqri3RewwwwatdEHn
	 qVyXpto+Yc/jnxgpLRr694eR56BdUpoZ3orCjIFXKDZ5KTDhs89GVDqBmhjjJ5pjiL
	 u3xY+nqu3Q7iA==
Date: Tue, 18 Mar 2025 12:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, Georgi Djakov <djakov@kernel.org>,
	James Clark <james.clark@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, Leo Yan <leo.yan@linux.dev>,
	devicetree@vger.kernel.org, coresight@lists.linaro.org,
	Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: qcom: qcom,rpm: add missing
 clock/-names properties
Message-ID: <174231959987.3278245.15510321850308863529.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>


On Tue, 18 Mar 2025 15:21:55 +0200, Dmitry Baryshkov wrote:
> Qualcomm MSM8660 and IPQ0864 platforms use additional clock for the RPM
> device. Document it in the schema.
> 
> Fixes: aa0c4b815045 ("mfd: devicetree: bindings: Add Qualcomm RPM DT binding")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


