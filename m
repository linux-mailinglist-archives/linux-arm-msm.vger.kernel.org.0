Return-Path: <linux-arm-msm+bounces-40488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA279E5388
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B118018826D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E941DFE16;
	Thu,  5 Dec 2024 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN2Guluy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B31B0F1F;
	Thu,  5 Dec 2024 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397494; cv=none; b=Ps8g2zHhRW14cz3PyjcXTmO+tqajm3/KwiPxHWRi/3TatJNGO2fZ5dUtqDLzc64I9kI8pzhBSZzssDk6ctxiRS7XVaC9kRavAiwpB4mNQiwO97l2CZzHe74LMKu8rupFTYTOtM2L7vndnquaAHJ9O7EKidtTvQgfcK3bzOAr3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397494; c=relaxed/simple;
	bh=03418Nmjp7L7uNRQ/VmAj+UPzNS51bahbk7mIDpWr7Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=d3AWyIHTyBV0V52sn30464gV3Xeho34CxYbHytWJB8m+cimMf1GaNShcB376c7KUHP9F9W5JxiAUjlMXu5G4jNzKgt26o1qFzm4nU+EqNaOfazhKplqXTu05e2PNnbAIY18c+Dmc08F8Jn+4uKgNrEttwZQVj3Ra+iuwbcj7alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN2Guluy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEAFC4CED1;
	Thu,  5 Dec 2024 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733397493;
	bh=03418Nmjp7L7uNRQ/VmAj+UPzNS51bahbk7mIDpWr7Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iN2GuluyByYZ/wLneFG9wJ5ByKuXB2FiMRkddeQp8mBIrvgrr9clb4Gh35KlxCuaZ
	 FRBvZ95aXOkgVxS66s9CxGKYsNfkdExNH9J5l3/Hdg0mipMXKjp44wEV8Jiu9R0GVW
	 iY6M5mejSUHPSjWzuX3e3evBzETE0tG1NfRYoFNr6M9JyLq2EHCUDzulqcXPs373UR
	 Vc00/Xyl5bXBbRg0UFRJM8ooi3o4odpc8IhLzSzeOKhhtOVzfFjpQISzF73fUZ5zLw
	 SYezLCysfB7ZfDH2NeHiKWcbS84LJo/YBrEjBoRea7gpcPhkYF1agyIjXNzZYepPQS
	 aC6Pl4VmNV/IA==
Date: Thu, 05 Dec 2024 05:18:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: quic_shuaz@quicinc.com, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-bluetooth@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_zijuhu@quicinc.com, 
 Rocky Liao <quic_rjliao@quicinc.com>, devicetree@vger.kernel.org, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, quic_mohamull@quicinc.com, 
 linux-kernel@vger.kernel.org
To: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <20241205102213.1281865-2-quic_chejiang@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-2-quic_chejiang@quicinc.com>
Message-Id: <173339749198.2690453.6235486221062242906.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property


On Thu, 05 Dec 2024 18:22:11 +0800, Cheng Jiang wrote:
> Expand the firmware-name property to specify the names of NVM and
> rampatch firmware to load. This update will support loading specific
> firmware (nvm and rampatch) for certain chips, like the QCA6698
> Bluetooth chip, which shares the same IP core as the WCN6855 but has
> different RF components and RAM sizes, requiring new firmware files.
> 
> We might use different connectivity boards on the same platform. For
> example, QCA6698-based boards can support either a two-antenna or
> three-antenna solution, both of which work on the sa8775p-ride platform.
> Due to differences in connectivity boards and variations in RF
> performance from different foundries, different NVM configurations are
> used based on the board ID.
> 
> So In firmware-name, if the NVM file has an extension, the NVM file will
> be used. Otherwise, the system will first try the .bNN (board ID) file,
> and if that fails, it will fall back to the .bin file.
> 
> Possible configurations:
> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21.bin";
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: [error] duplication of key "description" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: found duplicate key "description" with value "specify the name of rampatch firmware to load" (original value: "specify the name of nvm firmware to load")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts'
Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: found duplicate key "description" with value "specify the name of rampatch firmware to load" (original value: "specify the name of nvm firmware to load")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241205102213.1281865-2-quic_chejiang@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


