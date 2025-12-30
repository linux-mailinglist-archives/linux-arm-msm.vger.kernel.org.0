Return-Path: <linux-arm-msm+bounces-86926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CCCE8EC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49C3A3002068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630E2FD7D5;
	Tue, 30 Dec 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNNoAaTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E932FD7A3;
	Tue, 30 Dec 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081274; cv=none; b=FhwFoCiwjzVZnJThSwVw4XPyZhEuqtjH5YW+AwM9Ut9+37xIJQswsUK39rz/xuA65wk8yS+ZMu5ABopo2JoUTDdsNBuT4ek2XHo6b/7EElXSL4A4Re1GSccCoalaf9OdKtj3GHtziWQNm9IyTRkqimgih5hA+eVH9gBkzi7G+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081274; c=relaxed/simple;
	bh=X95x1hQaSWCAV6YD/01KOZzlmtQARY0C9O48Su3w3vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcIvewVdaAxhvVkIPpxeJ6FLP0/VVChTs2l0uIKFIE/sNQfctMn7EVVyTtTkNFFE5rfImnhNRlqWnW1lOzb5l6HuKWj0C//bYyywju5i+zdgB4KEUxMDyKfk2efjsgELgsQYVjoQLBh4jJ+WOlDA0w3c+AiyzX+sLZu+lsLp4pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNNoAaTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A7C4CEFB;
	Tue, 30 Dec 2025 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767081274;
	bh=X95x1hQaSWCAV6YD/01KOZzlmtQARY0C9O48Su3w3vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNNoAaTd+w2vpO2BzjZeHOtngb7jBEH00qYeuI2F/LGvlsqd8e1orb0CeXpJtRsHt
	 fRKiAFxscfBDoeA1E2KMlcamRaO5a6BgflB2qH9sy84bG+SygjPMNhNshbM2OhyqrQ
	 EHv1idzsLJLD7mcBXv3kmXVFvirHNAXia2dkLOcFbeOoluBRqc8Ch2Dwn6Rk3kRING
	 OUQeBoaJxdW2wGe/2RmVojln0sPwS//9076drbKk7HVykqbchODlnMMUyD1+3XkdeV
	 58Y6wJJjha9xuZEIf86gZKb2HXySm02KTdsGi0mjtrkG6yWC7PRn7LvVXZxzkZsH0H
	 DX+uEja1cPufw==
Date: Tue, 30 Dec 2025 13:24:23 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aVOFL3jmNrFNiYV0@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
 <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>

On Tue, Dec 30, 2025 at 09:05:28AM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
> > On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > 
> > > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > > dropping SMMU stream IDs which relates to secure context bank.
> > > > 
> > > > This problem only surfaced when the Gunyah based firmware stack is
> > > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > > hypervisor.
> > > 
> > > We are porting the underlaying layer. Can we make it to behave in a way
> > > similar to the _existing_ software? If DT was a part of the firmware, it
> > > would have been fine to perform such updates. But as it is not, we
> > > really should try not to break the interface boundary between firmware
> > > and the kernel.
> > 
> > I support your viewpoint. But in this current case Linux kernel VMID mapping
> > for secure context bank stream IDs is incorrect. As Konrad mentioned in the
> > other thread that for secure media streaming use-cases, it rather requires
> > proper representation via iommu-map such that appropriate VMID can be mapped.
> 
> Yes, I understand this part. I'm basically suggesting that Gunyah should
> ignore this SID when programming the actual SMMU (probably like QHEE
> did).

TBH, I generally dislike as to why the firmware based hypervisor
behaviour should be encoded in the DT. One can always argue that Gunyah
is doing the right thing given the purpose of SMMU stream IDs. And if
Gunyah has to change that behaviour since Agatti DT was based on QHEE
behaviour then the same behaviour will get replicated on all other Qcom
SoCs.

So, I would suggest that kernel should follow the expected behaviour
which is to not program HLOS VMID for stream IDs dedicated for secure
context bank.

> 
> > 
> > > 
> > > I'm fine with the change, but I think we should make sure that Gunyah
> > > doesn't break existing device trees.
> > 
> > Sure, this change isn't breaking any DT ABI but brings compliance to
> > usage of stream IDs.
> 
> Actually, it does, as you can see from Rob's email. You didn't perform
> make dtbs_check while submitting this patch.

Okay, I missed that. Looks like the GPU DT node already defined minItems
for the iommus property but the others didn't. I will add following
change in the next version to fix the warnings.

Irrespective on that, the DT forwards and backwards ABI compatibility is
being maintained with the changes being proposed in this patch-set.

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index f0cdb5422688..e5e62c5bab42 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -33,6 +33,7 @@ properties:
       - const: core

   iommus:
+    minItems: 1
     maxItems: 2

   interconnects:
diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 3f3ee82fc878..8d4371697867 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -42,6 +42,7 @@ properties:
       - const: vcodec0_bus

   iommus:
+    minItems: 2
     maxItems: 5

   interconnects:

-Sumit

