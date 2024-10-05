Return-Path: <linux-arm-msm+bounces-33179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D699174D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DC98B20EA8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1C61509BF;
	Sat,  5 Oct 2024 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSmpFEqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8481B960;
	Sat,  5 Oct 2024 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728138244; cv=none; b=pw2GaPjHEOb00P/KkuvcNFp567Dq1nAlP5mOgXUbaj18dUvLaWqbef//YXMBnWwwFRs3Ivj8F//qsOcvatq5wDxYJSHraRg0nw78/mcUsESrTmun8hBSxN/Ig3wqnNTuxUG1JXwSMOotDjbPMeCb3A6GjJrck0tbwE+BcmAj5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728138244; c=relaxed/simple;
	bh=eFLS1U5nNbqypwc6eUk4aCyaxNgxHUNnFm0FihZc+mQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=kwilAO+36kHyBbzH4g1xGVyZkmajvtnoxlgdRqy/xoNZnYyAoWu9Xsdg42MKAMv79pRW+ahNN9ofImQ52MVstzDUrKQO5H94Zm4Q+lDg8pNaQeQuHhQl82XESs4B0C5yhbpfpZAzn48Ziu5t6zEZ5S86QrhHEr64mPoAB34XljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSmpFEqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A7C4CEC2;
	Sat,  5 Oct 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728138244;
	bh=eFLS1U5nNbqypwc6eUk4aCyaxNgxHUNnFm0FihZc+mQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mSmpFEqvcbjWpAr8nPXhP8lZCZADaY8RqUnW2qAec5FSYtFNjhsEwpT9QJlbZYzkA
	 HqTWpyYGVWLzaDML09Wslhk43Maq0tSyC4pAub4Di3OO1BFANM0O706YZHQkpRbGgi
	 onyl9Slm85f07QQKjSzCM1ODK+Qj3sUf6DThjaMM0VqbV1VHgGgyVeOBuJP3CLOton
	 71Ydm9/AluXfoxfe+thWFiDmkWcfMethqR0lXICUCQtMXTOAwTs8h0NNpFA4NfBW7v
	 eDS//87JWPL2nOdh5tNqBu+1Lwf48Kk2YCETX8kUC8jQ5mEHbwjjK8tDr3JDHrFvnq
	 IVPJkVVYsxvjQ==
Date: Sat, 05 Oct 2024 09:24:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: martin.petersen@oracle.com, avri.altman@wdc.com, krzk+dt@kernel.org, 
 andersson@kernel.org, devicetree@vger.kernel.org, quic_nitirawa@quicinc.com, 
 quic_narepall@quicinc.com, James.Bottomley@HansenPartnership.com, 
 bvanassche@acm.org, linux-kernel@vger.kernel.org, agross@kernel.org, 
 konrad.dybcio@linaro.org, alim.akhtar@samsung.com, conor+dt@kernel.org, 
 manivannan.sadhasivam@linaro.org, linux-scsi@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
Message-Id: <172813824187.140695.2656302375333082019.robh@kernel.org>
Subject: Re: [PATCH V1 1/3] dt-bindings: ufs: qcom: Document ice
 configuration table


On Sat, 05 Oct 2024 12:13:05 +0530, Ram Kumar Dwivedi wrote:
> There are three algorithms supported for inline crypto engine:
> Floor based, Static and Instantaneous algorithm.
> 
> Document the compatible used for the algorithm configurations
> for inline crypto engine found.
> 
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: alg3: status: 'oneOf' conditional failed, one must be fixed:
	['ok'] is not of type 'object'
	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241005064307.18972-2-quic_rdwivedi@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


