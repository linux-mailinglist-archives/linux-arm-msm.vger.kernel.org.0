Return-Path: <linux-arm-msm+bounces-63215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BFFAEF895
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E81177AE513
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE8F1A3154;
	Tue,  1 Jul 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAR/4zt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74827462;
	Tue,  1 Jul 2025 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373098; cv=none; b=M5hmbmwmoxSxrw4nspvApPylii7uX8PnmHs6E+bfRal4joGN3gbs8+bnL9bu6DbFuo3LJm3frViXXoiDtHi9qb/nTBGMp4qP2NGo9+Srpj9kcKUH1afalZkf7jNzIePXwHYHJLbeKQd1HksY5rUyHjJcGIeaC53o8b4xvV1fIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373098; c=relaxed/simple;
	bh=rC3nbSjkTxDZiV0S388tfEEhbV5WmW3jytAOlgLANsc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VoE+5E0OfJHq1ps+hvf+yduxBQqvTxTaWP8AlPRfbymJ2ycsT7B2AjoDmtnTT+/3FDDGulcJXmzVP7t8HPbYae7jZtDqcPWrTtyIKrPxGwngB3JDNN8oTn+ZO7UR/Ag5JO4JhidRwdOjhV1OnaYB6qBvE4oE5xfZ6GpzqTonfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAR/4zt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF4DC4CEF1;
	Tue,  1 Jul 2025 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751373096;
	bh=rC3nbSjkTxDZiV0S388tfEEhbV5WmW3jytAOlgLANsc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OAR/4zt7DnQ46HaU2ljC0epjpk2jglIToKK3lWwnpMfmeh8MqhzAQpUJDVzvZmJrG
	 1+vWSV3K0fhjNsnfatjkZj5Ym19iKNnlKHuFYJ9TGJ2oohKar1iaQsjdyqP7Q1vlm4
	 9GFFvpsxTFVU/Qv54n6emUDpK9phBmWyja8SC3XCPbSiyQQyEiYKX32ZEbbJTopHkN
	 pW/toQQ0lWd/K8XCnKj/pF95l0Sjhrw8vhomTXUrG0Tq4zwNjvlSbpAfrAphZtVId1
	 OU2sUh9p57mcdLarO+fMts3vCTsn8Ns5wV08f1LYI/Kru7CqeaLsQnkSKh0ookIm7g
	 0Z9OrFzkesYog==
Date: Tue, 01 Jul 2025 07:31:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Michael Turquette <mturquette@baylibre.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
 <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Message-Id: <175137309494.1261491.4971396724610309661.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible


On Tue, 01 Jul 2025 17:10:18 +0530, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


