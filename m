Return-Path: <linux-arm-msm+bounces-42879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749A9F889B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 00:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2160D1894671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8C81D7E54;
	Thu, 19 Dec 2024 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS5VizN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11711853;
	Thu, 19 Dec 2024 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651649; cv=none; b=LbiIqLh8KfxvhYQMIb7+ekPjKJ+Yz3ceqdcLmAJAFzJKpmyBP4PaN3UrrQKlgGLaGIQ2+k2TOpnNYnwgUCSLTpJ8+twr0u/S5bc2IBgn+5KmZ4alNh6TiAc+Y8D45wfZtvmHhCmr5aOllSIyu7IXGXkpiyrsLRMPSzESdyq956I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651649; c=relaxed/simple;
	bh=xBHLwyNDwN9JlckXRYADykYadFm2XfjZkQIk4gIqioM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=U9tNSV+uFo7Hg9+T6L28vjM5qwi4UfzU1c4cnghiNryngpknqhH5Mg+yJUDU0zhO+bFM9G/UFjJF7jwoud6t5Mfm/zIH0bKG4wuLa90iEw5aJJbqY2FsgSF+htMAnW/His+mQC9g8uTrbIL+iyDgNhTiEua3Phe/ED8k1G4caT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS5VizN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239DEC4CECE;
	Thu, 19 Dec 2024 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734651648;
	bh=xBHLwyNDwN9JlckXRYADykYadFm2XfjZkQIk4gIqioM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KS5VizN9aFrorxRK5m1AJESqSX8tTtYdg/fceNXdbH7Q8HSzZFI0lMlXyrQOwaksy
	 t928uKxw3FuYZRjYa0sZ0rOmQTh/2SaDJiZwcmttD3wVAeZE7e8B0UmI+ZB2NxQjrc
	 DFQom9pL/0nIIk37H29erIRftBQtmsOXP9g3R5vPRgHmOlbGsl6pIgWateRrR+v6JO
	 eYqJZqdx/I8a89qtYArajICpI3tu1v8NIzSzpQZLmEGLaq+fwHK1kNlLBpSutvgMfq
	 sNpgw1L8yFATturU33QEzz5bwz0ADg1Vs5NUajgRMD6EpjXxg1YU8CrTQMdFg9uQkB
	 1mTdES2LAespg==
Date: Thu, 19 Dec 2024 17:40:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
In-Reply-To: <20241219200821.8328-1-maccraft123mc@gmail.com>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
Message-Id: <173465164666.1272507.12748400044061507887.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's
 EC on IT8987


On Thu, 19 Dec 2024 21:08:18 +0100, Maya Matuszczyk wrote:
> This patch adds bindings for the EC firmware running on IT8987 present
> on most of X1E80100 devices
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml:22:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241219200821.8328-1-maccraft123mc@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


