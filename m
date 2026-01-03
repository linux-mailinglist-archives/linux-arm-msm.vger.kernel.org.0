Return-Path: <linux-arm-msm+bounces-87324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E45CF0362
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F4032301354D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D2C217733;
	Sat,  3 Jan 2026 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp+WCPqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC112FF69;
	Sat,  3 Jan 2026 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767461584; cv=none; b=QQfY4irdCDm7TyWVe29Fp2F4T8N+91fH9KTpBw3sOCIDPm4O26qicP6VV2uV+0/p2BNV0FlhCCzoNxGL2wvu1oTGEVFoskWjWy0dJrNVp4uXvutXr+wrwYi/+PDu+CXfArnqqwaQ9+H9qQhamWcw2gHK0xo6bU7OD2NMerlfs8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767461584; c=relaxed/simple;
	bh=iFuAMR8Cy8xCV1l5qP2ufkm0oszRW7MT41boaDMKRQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9WkVkTM9lLONsyP2ZArnnZqiZseIK2TNEzgdF51IqAc5/Z4t6tuCIuQ+S3kUl/UaX13xWBU9XHMSLHVLZVjVPFUzHajX+xvcOXGfrUBkWLiDFBwsICKCjIP39hxv2BewHCYmfx2Zwkpdi0Mu/hkKeEL+RiIlNbZcwyfK39l0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp+WCPqd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDF0C113D0;
	Sat,  3 Jan 2026 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767461584;
	bh=iFuAMR8Cy8xCV1l5qP2ufkm0oszRW7MT41boaDMKRQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xp+WCPqdDf4gJb/T4X7Cm3RF8ubPLMU3T+A+zLJk2E8kNlkgeUiZQwv3EenU4joZX
	 7Tc3EdRTYNATlLAqQB8u2tZ7HSgqdWlNRRKq+Zo2WGMGyGkQHEVN7vPuUv2iWO3jjr
	 f/E12JjI683V7LIDmzMDPMlTYES4gO4AJrR7RMFkO/O+ApzHAiO45bduqNJkPCVG58
	 DCT6sSvmUyPJuPNL0t20AsoUCgQ/mOi1VxeVpOY44bT4E5uQfzUMYB2KkMaKGPVpRY
	 0Qnavw+iTW10fRjbGlAosK4u74JSJpqNNSDNKZvTo1UB/OkMzu6fGGegiuW6KpumeM
	 2AGlma1+Xj+UA==
Date: Sat, 3 Jan 2026 11:33:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 05:14:11PM +0800, Jie Gan wrote:
> 
> 
> On 11/6/2025 9:57 AM, Jie Gan wrote:
> > Document the CTCU compatible for Hamoa, enabling support for the
> > CTCU device on the Hamoa platform.
> > 
> 
> Gentle reminder.
> 
> The dependency[1] has applied and I have tested this series on
> next-20251219, no conflict and work well.
> 

In your previous reply, you're stating that you will update the patch?
Are you saying that whatever concern Krzysztof had is now resolved?

Regards,
Bjorn

> [1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/
> 
> Thanks,
> Jie
> 
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > index 460f38ddbd73..57dede7a90e9 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > @@ -29,6 +29,7 @@ properties:
> >       oneOf:
> >         - items:
> >             - enum:
> > +              - qcom,hamoa-ctcu
> >                 - qcom,qcs8300-ctcu
> >             - const: qcom,sa8775p-ctcu
> >         - enum:
> > 
> 

