Return-Path: <linux-arm-msm+bounces-103706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAl/FdDs5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0542428A3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CE3E30166FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7749F383C99;
	Mon, 20 Apr 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCpOV/MK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538612D738A;
	Mon, 20 Apr 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675843; cv=none; b=rM95GaEWOVIqcHPDFTbiCtlGvnpD+4/mSyF6VBdbTmST//7j8rCI4ZAuPA9uOKQD2yQ+/hs1pBhd/b/GMrvFm2okXOicy7qVu0m9NjbOVpiz/tg/sLk8ww7dF1xSmcUn7yxdLEn6EubFcZSzv0ZHB7ibZuiTSCxmpIozAVRD8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675843; c=relaxed/simple;
	bh=zK5g1EeyPVdyoo1yUkq1PWW7is8crU0xFWfy1utuYaY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q5Ce7nJqiNxqKVUN9/k2Z4EbnmDQ0wFJUM4ITktkdLdGItHt1ejP3ql6HwcB4/j3o/MqCa9oFJxjCZSdK6goH1itw+5Go35kNENNwGzYgRHSZ3EEag6svsrLjdMiT/y0CSaKEYvQh7ocpFb825nCPRWiFL5R4nl7mZ2BTlwLOOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCpOV/MK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4AEC19425;
	Mon, 20 Apr 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675842;
	bh=zK5g1EeyPVdyoo1yUkq1PWW7is8crU0xFWfy1utuYaY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CCpOV/MK5zpY73t+UN08CzC+fNl7cPbILPu4BqLuhx6mPc21ulLXqepeG076YSCVv
	 GY1r6zGBEldbtCNocqOx2nwXex/5AI+Rd582O2WB46b+qQIC3ZpIx31p8tjZo7PAx4
	 krwiYxoq9MaYS/4qbYLAzPbuz6i2MmbIps5hWXF8fw6JXFIpBEsycQFzd5i+RMCAcd
	 hcuJbpvq6m+p4JDrpImA8U8Fsx/KleKXgS/GDqzB8ahtmfvm7cVK4MukC9baIJSBu/
	 0H6XkHfvIlifjelKw3ph0sJITPnuRxioynU23TpeGgD+CEQSDELa2q/U8S8sD9jb6s
	 GucwGTOm80y2A==
Date: Mon, 20 Apr 2026 04:03:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
 <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
Message-Id: <177667583832.1359985.10364830499161105694.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103706-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0542428A3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 20 Apr 2026 00:42:52 -0700, Qiang Yu wrote:
> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> required by clkref clocks.
> 
> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> differ. Document them here for qcom,glymur-tcsr.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


