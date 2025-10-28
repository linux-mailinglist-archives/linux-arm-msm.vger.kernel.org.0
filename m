Return-Path: <linux-arm-msm+bounces-79196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED8C15194
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 857135050E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22551334C3A;
	Tue, 28 Oct 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfpIG9ha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE71FF7D7;
	Tue, 28 Oct 2025 14:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660674; cv=none; b=JsBNftkT5qGfsE3TGpBM6yBHC/rJV3x1G3WXo3BYmARAwtrbX+tm2nRhXWDfOugvYYqvlB8VJYmKjuvlgVIx5JXGAYbCkvCjtkXnglnncmuK1FasBf2oKnphikNl6VdG4Dfucu3rac/TcqS7/nLKyi7GD0BdqSUpyes1BxFzyjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660674; c=relaxed/simple;
	bh=LFrNkgz++NKx3ZLaA5kLsj4DAvY+Qtrbm3Vw90hg5ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHgv/ZnZeVor26HMh1R8jBZPZQ5+8j/TGgleClUAA76Y1BQQTAdkYfR53G91S+dVFSdkOGucmncHhu+qZVgVa5qeoZTz2t+NnugxN0OxnxoEFQugUugOmNLVQvVI0O2c92V1ckUOlNusVFLpZTo5sXlXHHOCDloiVp5YSnXLVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfpIG9ha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0367C4CEE7;
	Tue, 28 Oct 2025 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761660672;
	bh=LFrNkgz++NKx3ZLaA5kLsj4DAvY+Qtrbm3Vw90hg5ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfpIG9ha4egCypTulD9PpSTaMwJ3kOP/e0MUa9Sl24Fih45QRz6qoa9gdBa+Mipmm
	 m7EJqTm7LhePznLiPITI835rpf42mWMTVIgIGJRXuQMYc1HT3cCQAKUnJ35ID5pz2W
	 L4VTcOyF+6eF7jst9PaWQZUOlSH5qbAHjcHzb5rUovd4Xg5HprKCe45bd4WEmjvDwg
	 2OWBkXrkHS7xjSntjyXBHXFjb2vtngeAtiOFMbPaqM8MAWFJJGzyANRjFPBbwAI+kG
	 eg4LMBjfP/sngQdroNuykCSvkAzEse7lXNXwFpQLW3XM78LYFFxh5EfJ5dYWq1Vlt6
	 DqU0czpsGLm/w==
Date: Tue, 28 Oct 2025 09:14:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <xg6x7vulzjtiqnzu2g3k4phhi3og537cwu2quwqgdlpcxoggwt@pqmfsvsumt2g>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>

On Tue, Oct 28, 2025 at 09:36:09AM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2025 09:29, Krzysztof Kozlowski wrote:
> > On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
> >> Document the Kaanapali and Glymur compatibles used to describe the PMIC
> >> glink on each platform.
> >> Kaanapali will have the same battery supply properties as sm8550 platforms
> >> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
> >> Glymur will have the same battery supply properties as x1e80100 platforms
> >> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
> > 
> > What does it mean "battery supply properties"? Binding does not define
> > them, so both paragraphs do not help me understanding the logic behind
> > such choice at all.
> > 
> > What are you describing in this binding? Battery properties? No, battery
> > properties go to the monitored-battery, right? So maybe you describe SW
> > interface...
> 
> Or maybe you describe the device that it is different? >
> >>
> >> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >> index 7085bf88afab..c57022109419 100644
> >> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >> @@ -37,12 +37,19 @@ properties:
> >>            - const: qcom,pmic-glink
> >>        - items:
> >>            - enum:
> >> +              - qcom,kaanapali-pmic-glink
> >>                - qcom,milos-pmic-glink
> >>                - qcom,sm8650-pmic-glink
> >>                - qcom,sm8750-pmic-glink
> > 
> > Why qcom,kaanapali-pmic-glink is not compatible with
> > qcom,sm8750-pmic-glink? If Glymur is compatible with previous
> > generation, I would expect that here too.
> 
> And again to re-iterate:
> 
> If X1E is compatible with SM8550 AND:
> SM8750 is compatible with SM8550 THEN
> WHY Glymur is compatible with previous generation but Kaanapali is not
> compatible with previous generation?
> 

There are effectively two different implementations of the pmic glink
firmware (in particular the interface); one designed for Windows
products and one designed for Android products.

Then for each implementation there's incremental additions over the
years.


By not accounting for this in the fallback compatibles, we're relying on
a growing list of "specific compatibles" in qcom_battmgr_of_variants[].

In addition to this, we have the addition of USB4/TBT support in Hamoa.

Enter Glymur and Kaanapali, the implementation has moved to SoCCP, so we
should no longer do the PDR stuff.


IMHO this binding should have fallbacks for the major "versions",
mobile, and compute. But perhaps even for compute/usb4, mobile/soccp and
compute/usb4/soccp?

Regards,
Bjorn

> 
> 
> Best regards,
> Krzysztof

