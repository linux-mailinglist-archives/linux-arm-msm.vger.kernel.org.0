Return-Path: <linux-arm-msm+bounces-79566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C048FC1E8D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F022189F8CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFCF2F744F;
	Thu, 30 Oct 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP8ryppx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1522BE7CD;
	Thu, 30 Oct 2025 06:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761805496; cv=none; b=EmLIO3pIVMuY1qHJLQ/BCHJP8wP1fOvb5LRJHhZP5Nl3eNa9j9UD4O621jPB8WrKiuq9wmA4kOhTxr5qzbV1wGZsn0e6bWq5B0Jw7dKYh1Y60C3XZpUqRltPMCmmPYS41Z2pQstDXZKs3kfKa0IgmusM27bkMLEc46ltYLyy/JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761805496; c=relaxed/simple;
	bh=uYPDTyqQ6bRTWr1TYUkiW27uTR568Vaw7ChoeCMRHWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa2/GsiJGW9m6aNYOxF3kwUTHgI4jziV1zomOlGMsj3Qe6JrxI73A6dy0YAkl8ENjyQOxyqG0wfKPHJmhqg3YvQbld4LvmI5hMiQmq8WsPcg/UyjpbJzjEFCV3kypqvZE+bUuBW0gvXBwGJRCg8JNrg52XSB01xU58Kk1LcnKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP8ryppx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6748C4CEF1;
	Thu, 30 Oct 2025 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761805495;
	bh=uYPDTyqQ6bRTWr1TYUkiW27uTR568Vaw7ChoeCMRHWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AP8ryppxF8+p+ZI7dP0yth+6WBqk7Sm/5EE3z8AtLYEhkPbgjodOfPR16fQO0e8ZD
	 FFpvcuA9XeC+kko3K35UAOIHTFv/Pq9Mm1dLzH7OW6lxOehF5G+ZIgDiwkz9CbnOrd
	 rDAfti3elF9xosqqI3BqcFuVLCFQCaaEp4m/R51odOtCGXGnY2dYSOr8FplN9+p+XC
	 WUC5gKs6fUU+Ti9s3T31OLNBb4XnKpopcH8V1bppwbDDNndWCDi1ej0J4qMBF4TMlE
	 myoIeyG5pVoXxhbN1/hBRG+OOKTB1V+jgnxESOJPLyO3lIf81hfHQ99dbA1nEUHaRZ
	 skT4leqYYAMzQ==
Date: Thu, 30 Oct 2025 07:24:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, trilok.soni@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, yijie.yang@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
Message-ID: <20251030-innocent-wildebeest-of-persistence-f79aa7@kuoka>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
 <176173731073.226348.14173297054891268954.robh@kernel.org>
 <554b2053-db21-46fa-b5b0-3d548c1e182d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <554b2053-db21-46fa-b5b0-3d548c1e182d@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 10:10:55AM +0800, Jingyi Wang wrote:
> 
> 
> On 10/29/2025 7:28 PM, Rob Herring (Arm) wrote:
> > 
> > On Wed, 29 Oct 2025 01:05:41 -0700, Jingyi Wang wrote:
> >> Document the component used to boot SoCCP on Kaanapali SoC and add
> >> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> >> the "qcom,smem-states" and "qcom,smem-state-names" properties and
> >> add conditions for the "interrupts" and "interrupt-names" properties
> >> in the pas-common.
> >>
> >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
> >>  .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
> >>  2 files changed, 194 insertions(+), 23 deletions(-)
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:67.46-62 Unexpected 'IPCC_MPROC_SOCCP'
> > Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:70.33-49 Unexpected 'IPCC_MPROC_SOCCP'
> > FATAL ERROR: Syntax error parsing input tree
> > make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> Will add dependency in next version for the include files in example.

Which would make it impossible to merge. Please read internal guideline
because this problem happened multiple times and was already explained
that many times, so for sure it is documented internally.

Best regards,
Krzysztof


