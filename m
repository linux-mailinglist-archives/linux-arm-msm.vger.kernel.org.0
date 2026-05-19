Return-Path: <linux-arm-msm+bounces-108584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CmJKdugDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:41:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0276D5833B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99E56300E31D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A299534389C;
	Tue, 19 May 2026 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HK+7T9cI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB8343894;
	Tue, 19 May 2026 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212421; cv=none; b=X4nz9FDZvxYS4KwvjD4cDlMKGePWFb6yxtAlXORwq9TZ98PFVMSbI7FYqsSoTbBIimvtLjVLPXqHukRXWq3AA66VOlFyJJ/Ygw0Cde+NCYTR+5Hp5ZyG2Z4GHTCGQ7qAozifWjVgREW7UfHL56wb1Rgka3Dmy8VGi8C90k26CFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212421; c=relaxed/simple;
	bh=fLa4lHp4a6N2natby72bQD6RiFos6+Inq7OYKu7kEeo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ek4uWkcQCsk17kp4rWhPSw1slKucEOnqL3h/CdI8Ss2pNvbGs0mVLQRjJr6Ry4JpWEAngEAX7KvhNiZV98d3o+XExDHesrVKtR/rxy4AoN7cPoaPu71fdUgxFIgtdWxiMnRCI/BZ6hoacW/0r1J0yYGV5XUDZvZ3K6QsNZumJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HK+7T9cI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22305C2BCB3;
	Tue, 19 May 2026 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212421;
	bh=fLa4lHp4a6N2natby72bQD6RiFos6+Inq7OYKu7kEeo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HK+7T9cId6RFV6wOn5kzQokgro5gju/zegSgzLjYO5ugPNBugimJ4oTmMOhYOJKbI
	 Gly6mOv+v3GHtgdGkY2tZlmqVQCN3K3LZD5bA56+QEM/dbTUjlwMB+8mIMOAicfznB
	 x+obT+Dn8z8JOo8+/OTTzKskV47Zyz1P6qEwedS1Nb9XWqsWcJXsMfPoUHcCW2UCsY
	 +s3zmjy5xRIbbhNPvKx4s0sO1GcFJgWu+eZ78yUMHo7lPjsn4ckozB1aE2f9qIyIv5
	 A85QVrPgkdh2+D/yM3a7pXypJedV/4Dm+TiEC9r+kksXq0sralhcW2egY6jKHcFW0T
	 isdG/v0DtTdfQ==
Date: Tue, 19 May 2026 12:40:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
Message-Id: <177921242050.3254832.4034348981825996968.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108584-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,ef3b000:email]
X-Rspamd-Queue-Id: 0276D5833B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 19 May 2026 16:19:49 +0530, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various domains.
> 
> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 53 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/limits/qcom,spel.example.dtb: power-controller@ef3b000 (qcom,spel): '#power-domain-cells' is a required property
	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


