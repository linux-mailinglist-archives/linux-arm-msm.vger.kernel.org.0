Return-Path: <linux-arm-msm+bounces-23367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9091069D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 296521C2125A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAA91AC258;
	Thu, 20 Jun 2024 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8zbHJQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2E48CCD;
	Thu, 20 Jun 2024 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891129; cv=none; b=Qni7TulxNPBiBiefmIQ57X+iADTTf7ayoLLywRGdzGxbOvzmCRHONJsn41GtNo+zL56fehroXAxuCrIvqzPXjYNe269lbAXZr9j80gxnuKz6V6+ucCNMy9NCPdkTGCUK019TmsMvD+0JPMX//zqLujASg3dxEMktDTXP5tuQwg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891129; c=relaxed/simple;
	bh=FfPpOjJnEITcR7i8fMExBoCLBH2IU2CdQTn9lzapm0s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Do9+hqCTtkkdNTPL8meImrG4eBgpRFDlmmJSUV9i17xukI+zPUo5GuaHhxXJyS5WSaevTeab09dmty/TL25PfonA9YrAnxYabPAv2rf2TfsyrnNY/3T3gUJ6YbCD3lmuZ/AR4q3RJ5ANSfL2E/Vk9SY8jj6szxUx8iCfOwRqYPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8zbHJQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA65C2BD10;
	Thu, 20 Jun 2024 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718891128;
	bh=FfPpOjJnEITcR7i8fMExBoCLBH2IU2CdQTn9lzapm0s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=f8zbHJQHAYF3TlFVevSkIHOXiMGnzT+s3X+X3M4iFXWT4IwKykpu6GuR/4MMDdy4J
	 lp1GKDtGHXt7c6gILs3r6LHA3OCCOvEtdDxlZc+gcE3sqRWSrXZL/kbKyD1OUtL91B
	 UeLM7+7Zqw2eAFfbI9fdSzuG4/tfO6JwtVAXdgObNYMBLJten6AA23mCjK2ZeDqFBS
	 KzFwmtejpUgoz8THIZ6eWpukbmEbq4mNOYme3YzrZDrcz/KddoaLBl03hcPNCEyb6d
	 PCyFIodlZkXDTesVVkEXC5KWgoykPrCL5kzNPV1lu8+UESh5+txQ7jYdT5v+NQNg4Q
	 dK80vQZ1qh6aw==
Date: Thu, 20 Jun 2024 07:45:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240620120143.12375-2-quic_kbajaj@quicinc.com>
References: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
 <20240620120143.12375-2-quic_kbajaj@quicinc.com>
Message-Id: <171889112732.2146896.6642576596328895598.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: mpss: Document
 QDU1000/QRU1000 mpss devices


On Thu, 20 Jun 2024 17:31:40 +0530, Komal Bajaj wrote:
> From: Melody Olvera <quic_molvera@quicinc.com>
> 
> Document the compatible for the component used to boot the MPSS on the
> QDU1000 and QRU1000 SoCs.
> 
> The QDU1000 and QRU1000 mpss boot process now requires the specification
> of an RMB register space to complete the handshake needed to start or
> attach the mpss.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  .../remoteproc/qcom,qdu1000-mpss-pas.yaml     | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.example.dts:70.3-71.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620120143.12375-2-quic_kbajaj@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


