Return-Path: <linux-arm-msm+bounces-110659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO22A6/FHWq9dgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:47:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DC623746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF5153020A9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D933E1232;
	Mon,  1 Jun 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhKqjwH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4F3E1694;
	Mon,  1 Jun 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335927; cv=none; b=dAPdoCCbOzom1Vkm+JOPrJrqa2fhpEjM/KovXaO3/qqvYuNm5A39/mj7qt6+qL9dE6mjN50CyrJW6U2u4y42aGoScYUcNTA2paLVzjlPfpmT8YGoV/GVhsceBh/FBrSIganPkuUL+1puSj5S8q4A9YCZc2liIlktMxjmgLVSPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335927; c=relaxed/simple;
	bh=xC0eNyhxKpECC6dSaSCXTHEjo6rt8dNfk6cTKHB7xG8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SM5Ce86PJVrBBSwbX95VHsHxrhE7XdlUmFk99D/rPB4L1KDMfqwI0zUN3RfpI3tOCkflpEbixucRCkJcpY8NZ0R6dFbWgrI9AfGkYa5GIfvAHSkgsZkUP4OUcJP6yYENWkMwxxgsC5bYVSULpDRcpIMK+dInS3mHCKSDWI/HoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhKqjwH8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B281F00898;
	Mon,  1 Jun 2026 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780335925;
	bh=Sr+l9IhS+1OggHp7pGNXo1FcZicIF17+zu39AovSjBM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QhKqjwH8/hIaykq3ejrGpzbOi6RBm+E81MRxycSn+RRWBn84hywzKiYH2GuZLidtG
	 2PfBG63Cb0RzRDbwO85O/ngaz5abvsw58vOJen7JbVDJXgoaWjDfFOXPC5UoOnVdV7
	 PgzoL7M34uPYDTaVB2ZZgMBE+aniedFwi35XS+YzjEZ/9pIeNGY5mOMbnW2hBwYIC3
	 qGmEHlzBM7qLyfFvEMKPA+657Mi8rS+qtKXEogIr7TuuldCzvg+J1tlO8wQk/GjDvG
	 Wd7JDPXVXHC87yuqixuaaBAyCZqGDfX/zJ9OSl9jwX4shFdmEpBQKxtWadXNAwISL8
	 u5qN+7Lc/PS6g==
Date: Mon, 01 Jun 2026 12:45:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com>
References: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
 <20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com>
Message-Id: <178033592356.3996739.1050010038980629699.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: qca,ipq5018: Split IPQ5018 PHY
 bindings from ar803x
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,oss.qualcomm.com,davemloft.net,google.com,kernel.org,vger.kernel.org,lunn.ch,redhat.com];
	TAGGED_FROM(0.00)[bounces-110659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 062DC623746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 01 Jun 2026 17:19:08 +0400, George Moussalem wrote:
> Move the definition for the Qualcomm IPQ5018 Internal PHY out of the
> qca,ar803x.yaml binding file and isolate them in a dedicated
> qca,ipq5018.yaml file. This is necessary due to the restriction of max
> one clock in ethernet-phy.yaml which ar803x references as further
> testing revealed that the RX and TX clocks of the IPQ5018 PHY need to
> be explicitly enabled.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/net/qca,ar803x.yaml        | 43 -------------
>  .../devicetree/bindings/net/qca,ipq5018.yaml       | 75 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qca,ipq5018.example.dtb: ethernet-phy@7 (ethernet-phy-id004d.d0c0): clocks: [[4294967295, 36], [4294967295, 37]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


