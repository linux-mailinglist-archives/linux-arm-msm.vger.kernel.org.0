Return-Path: <linux-arm-msm+bounces-79534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822CBC1D042
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 20:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F8C403E4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 19:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4AE358D21;
	Wed, 29 Oct 2025 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeWsKq9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3773563D7;
	Wed, 29 Oct 2025 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766459; cv=none; b=dY7Ogk4uvjHyghpe11aUJQ9FH79nQjDKBJdopSI0Zl+o8ff6czTZ8csRlwoEsdagCgCtv2Sq7TH2w+PHHkMb9eZNfSom62zMQZN2hBj5+nk7LebmQtkSa+kd00fhSrjEcX94wp1Lybo5o6pyEjfyQkcmKz1BMcWMsT/Kt86rfv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766459; c=relaxed/simple;
	bh=ZNT5rwnQpzS511p4/++y1rZUiJHh5M5x2dk6HgWxHhw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fM+jkaV+RUdXFXmrAMp5eyZtRfTEyPd2d+8pgthVmSVsLdm8NQ2hKrx9v+swtIiRd+u3c/0q81BSKb4w3gIrIzpQ/RZv9aIiNpHFVLgP01BEcFa+p5ei/eRKUi2LRvKMfA2wIwFTxw1QX8zJEiU21EKy3RIkbqQS1RfXJG5DkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeWsKq9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886D5C4CEF7;
	Wed, 29 Oct 2025 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761766458;
	bh=ZNT5rwnQpzS511p4/++y1rZUiJHh5M5x2dk6HgWxHhw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OeWsKq9NKsopaSfW0OgIblY6gULObAdoX8YwgV6e98qbeWCXENqBdxP3PnLmNBI0k
	 Yzaz7sjpXyZxeSAtUXiaQvAsYqPacRGesJEk3NeqApZEA8vLGlPR4+Zdi7tn8RlwUs
	 B0QkIfJ1CRiHOhYfDwjte6zQFAtdLehxaTmnRGfGIylYGR2ZR9VbmuGwFymAkDqvSV
	 NHjulIzHelEJEDN3Gs93USOJKRX1qqD1bjxkcDdomTHaIMxQwlIzaJnFiHyrFJACP/
	 vyN/KvGI22Ycy+oziaknVoMDmoySaziKs5V6JXn4WFHJ18W/bGOmgdIDAQGZAfucuK
	 F5nyuJqOhpLKw==
Date: Wed, 29 Oct 2025 14:34:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: srini@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
 broonie@kernel.org, perex@perex.cz, devicetree@vger.kernel.org, 
 tiwai@suse.com, alexey.klimov@linaro.org, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251029160101.423209-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-4-srinivas.kandagatla@oss.qualcomm.com>
Message-Id: <176176645546.2481487.18047032469966565976.robh@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115
 LPASS RX


On Wed, 29 Oct 2025 16:01:00 +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> RX macro codec, which looks like compatible with SM8450.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml:30:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029160101.423209-4-srinivas.kandagatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


