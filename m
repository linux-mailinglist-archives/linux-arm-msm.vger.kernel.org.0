Return-Path: <linux-arm-msm+bounces-86809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A223CE6274
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 08:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03161300DA43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86DC264638;
	Mon, 29 Dec 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoFkSicr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177C259CB2;
	Mon, 29 Dec 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993719; cv=none; b=kWYOC8nlCGiFCQP5DDL4SRm5nHpB5BUpNJT8fDGQ+IwNzyYuNRaQjEauZFjpllL1Gy6X2BV5Uh7MYKLbpQj0G5AFkdlQbr5VfCTQdDaQUJQcAGZ6OvwQYY9h0/g0XdixxSaMAO/EtMwL//wBZzyHx5VNlLuK0SJ+1+oonMhhKQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993719; c=relaxed/simple;
	bh=9gGsY8j2iqa8tDRFxRRfXgvI09YVE/FYZqJ+DuGo3OQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aXBF/wCYLsneFP7qxKGbgqSJoTrbng55MH8FpbFXyn9oWyRK6wY1ZFAynILf00nXZakC2kuAPOOXvRpu5peC7/u2LkEafRtMpmWyAcV7Q85sk8mbfAzk/ulrLCy95tEnnRo3S5S7IcgNL6PDQijHfoqt4Kbpx979kjDiOHYdZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoFkSicr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA24C4CEF7;
	Mon, 29 Dec 2025 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766993719;
	bh=9gGsY8j2iqa8tDRFxRRfXgvI09YVE/FYZqJ+DuGo3OQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YoFkSicraWcgpoHFTi8BXEa3xPeWRLnN4ppMRKEdjaD1P9kFQcXBbdVj/REH7G9DQ
	 AOxhgmBJjjWrUU05REicYgs8nbrcmB3I5wLGv/6givFHYrUiwQxwvTf8gS5zsHVeNk
	 S6U440YjxlDQw/dzYvtu1iRKFP77XuHavJFh/U/c7X6z+hqCHvNNWBgG1JUVkL+TEB
	 x4nWOiHN6zft5Jfks0+KbZWQLeIHFE+49TIIPNPpZL1LZfgL+fte31W700ll5KuMNV
	 4YhNrOWcYH3B8qyZWkUdp/rArAmjFA7aCyDiXrpQhLqMhROY1oQPYNRj/66222xAb1
	 M5vr3fG9BUTPQ==
Date: Mon, 29 Dec 2025 01:35:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 martin.petersen@oracle.com, andersson@kernel.org, 
 taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, 
 krzk+dt@kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 vkoul@kernel.org, linux-arm-msm@vger.kernel.org, 
 nitin.rawat@oss.qualcomm.com, konradybcio@kernel.org, 
 linux-phy@lists.infradead.org, neil.armstrong@linaro.org
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <20251229060642.2807165-3-pradeep.pragallapati@oss.qualcomm.com>
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-3-pradeep.pragallapati@oss.qualcomm.com>
Message-Id: <176699371795.453334.1254086534957374498.robh@kernel.org>
Subject: Re: [PATCH V1 2/4] scsi: ufs: qcom: dt-bindings: Add UFSHC
 compatible for Hamoa


On Mon, 29 Dec 2025 11:36:40 +0530, Pradeep P V K wrote:
> Document the UFSHC compatible for Qualcomm Hamoa SoC. Use fallback
> to indicate the compatibility of UFSHC on Hamoa with that on the
> SM8550.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.example.dtb: ufs@1d84000 (qcom,sm8450-ufshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8450-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0'] is too long
	'qcom,sm8450-ufshc' is not one of ['qcom,hamoa-ufshc']
	'qcom,ufshc' was expected
	'jedec,ufs-2.0' was expected
	'qcom,sm8550-ufshc' was expected
	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251229060642.2807165-3-pradeep.pragallapati@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


