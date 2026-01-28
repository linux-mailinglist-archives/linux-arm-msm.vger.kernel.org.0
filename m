Return-Path: <linux-arm-msm+bounces-91084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGSIArCSemlm8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:50:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA16A9C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A876C301F494
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A47D313552;
	Wed, 28 Jan 2026 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAxBNWVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA7258ED5;
	Wed, 28 Jan 2026 22:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769640598; cv=none; b=ISLxS1k2FR2F8GVCMpV7LMhts1K8oxnGyKn8LmNepcJngaH3yqULL6Qod0jr5hNol09sX1TCyFogIhHh100sqmOx3Q4vBOkvE3utVNu1vtd2X6a3mbY9ySlGvSDTj5yi5bdVP6EOdcbA7myMsQjmi/EK6ITXMY6Sd/gAYNWNxVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769640598; c=relaxed/simple;
	bh=OhWAtoAMVGY6Et1Yc8CX1lcJ3C3DcbFYlo0kUfcMTlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcI0unI+IxWC1KImz5Tq+giSYuJ/H6+8kL6dHsL8oqjmVZ70/+S03MQHZifx199ZsZUDuDSS45r3V1W/mjhkhANGSlNGomrGqKnBjATUJ1MYJalYPgygNioj0yGOSEKEW/RO7qnYdkx20432y55C84iLyTLR5d431vn3ocWjM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAxBNWVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1A5C4CEF1;
	Wed, 28 Jan 2026 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769640597;
	bh=OhWAtoAMVGY6Et1Yc8CX1lcJ3C3DcbFYlo0kUfcMTlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAxBNWVQeEfMmmrELqou1/D3qlgg1A+BMPNR5HleSgNrqa0bhMLaZ4vPqbt3rUEqV
	 G1Q96A9C6DeoTCR3tHo6RmMKDXPtQ6q8kzSTELDW5Feyf4euirux2yv8+QUfnoM34O
	 VQoCD6XVL4jPcWMDRWpZJby5BaHC1r9/S1a3PvhXS1RjCimmhoZ9nnS3Ai0WvbUcFv
	 ddFgiJeekXyaYmerNB/xPQL48dMnD/Y+BNvvNW0vwi0SVxtBLavtuXjqrJn6ecQ/5y
	 IMIsVloNypLDJD5gavVLyJz1nTI3d4rWVUof1bJPJIS/RhexmSVt/EMpo3Yjn6rp/+
	 nMIE1TGe1sk9w==
Date: Wed, 28 Jan 2026 23:49:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	bjorn.andersson@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com, 
	aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [SPAM] [PATCH v3 00/12] Enable I2C on SA8255p Qualcomm platforms
Message-ID: <aXqRzQCZB-L8MhRg@zenone.zhora.eu>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7AA16A9C2C
X-Rspamd-Action: no action

Hi,

> Praveen Talari (12):
>   soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>     path optional
>   soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>   soc: qcom: geni-se: Introduce helper API for resource initialization
>   soc: qcom: geni-se: Add resources activation/deactivation helpers
>   soc: qcom: geni-se: Introduce helper API for attaching power domains
>   soc: qcom: geni-se: Introduce helper APIs for performance control
>   dt-bindings: i2c: Describe SA8255p
>   i2c: qcom-geni: Isolate serial engine setup
>   i2c: qcom-geni: Move resource initialization to separate function
>   i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>   i2c: qcom-geni: Store of_device_id data in driver private struct
>   i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

Can I take this all via i2c?

Bjorn
Andi

