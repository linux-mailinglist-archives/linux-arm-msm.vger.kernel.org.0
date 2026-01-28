Return-Path: <linux-arm-msm+bounces-91043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPAwEb8cemkY2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:27:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B66A2C04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B5BB3005EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9A2F5A2D;
	Wed, 28 Jan 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrTlf8X9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E12299949;
	Wed, 28 Jan 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610427; cv=none; b=fdHBAU0DkUfdxFQad1/y7tH7c27lI1ssEuGR32zpdlB3FNXE/8YXBaX/oiReaInt+iFyFAMro2kQXLclJNUzT6oFwBqa3K+wqyMothQrOKYS5mnQlZ4uQp5tCamVMG5wIem3BZ5irgyXCzeSO8EESmnotxGacv5ZNLgCedbUmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610427; c=relaxed/simple;
	bh=OBUn7chH1IqlZDP+1sHFHF6vbJQMiuijy0bawWZlG4Y=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EGxSu9SipqqYcF54DGo3pNaGoO2QwWgaR5JFFEZA3oXFxvHguKVToWSPiI9L65zyn/l2et1BU8zxeMmYDf0RN4Pj/ZvD7le1sdOyUD/e2zjQaLPM7EhHNJvv0UNmhVyYIGo02wM2AQ0980n34O0dlB78wjz/4xiIiH3OywWXWlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrTlf8X9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E639C4CEF1;
	Wed, 28 Jan 2026 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610427;
	bh=OBUn7chH1IqlZDP+1sHFHF6vbJQMiuijy0bawWZlG4Y=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=FrTlf8X9HACdib2MTkRJXxZTb1U8vvmbFBqNhNmWU3vtw/swWDK+id+V62Blm+hLn
	 IVRpUYNQP4qpuKSWwEqKSix6XOug79GEkEdNs5bvlXHuwsxYclgtEsk4hRPx77NV/+
	 XRJs0eymZ51MdBnRQaW1P81tBkPyLL6XA63WKLMrZDvHExPAfBQjMCWShh/5tZvInZ
	 OwTopU6dJDBhZbr72gnPlD9wL2Y9DHv1oOsHAF8LkIGMYIRMC7b7Tc+yEm6Ja4oCUw
	 WwfnPgZrjCCx+zatAaWZFOtw20UQIh9CduHqC1ITPcBGDyw8UfXe+bO+WFSaJh2GF3
	 oqUtZeLtHd2YA==
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Jan 2026 08:27:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <176961029843.1671023.5334223517300256096.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Flatten usb controller nodes on Talos
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91043-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.1.134.160:email]
X-Rspamd-Queue-Id: 79B66A2C04
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 11:57:18 +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach. While at it, add the wakeup-source property
> to usb controller nodes.
> 
> Changes in v2:
> Reversed order of patches as per comment from Dmitry
> 
> Link to v1:
> https://lore.kernel.org/all/20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com/
> 
> Krishna Kurapati (2):
>   arm64: dts: qcom: talos: Flatten usb controller nodes
>   arm64: dts: qcom: talos: Mark usb controllers are wakeup capable
>     devices
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +--
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 97 ++++++++++--------------
>  2 files changed, 46 insertions(+), 63 deletions(-)
> 
> --
> 2.34.1
> 
> 
> 


My bot found DTB warnings on the .dts/.dtsi files added or changed in
this series.

Some warnings may be existing warnings. Consider fixing existing
warnings before adding new features.

Perhaps the warnings are fixed by another series. If that is the case,
please set the base commit and any dependencies for the series using
"b4".

Ultimately, it is up to the platform maintainer whether these warnings
are acceptable or not.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260127 (exact match)
 Base: tags/next-20260127 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml





