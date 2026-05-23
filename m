Return-Path: <linux-arm-msm+bounces-109434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ5CAHIPEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C805BC94C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E80773003328
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFF22D3ED2;
	Sat, 23 May 2026 02:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkxAT6Vj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5252298CC4;
	Sat, 23 May 2026 02:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502795; cv=none; b=nfOSyHCuhIalw0NdHwF/NMf19BVEMLANIjcieZMtbd82ULx36t3P0/KCanS6c3W5UZEICLe12NIYL1nZxrtF88Jf02Mx+RerXntkxawpPsi7b8rmi41O5wk4S3pUAd1/s/xjF5vo2iIp1TghyfYVg1iuDmnbP3ia5BDjk6CM+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502795; c=relaxed/simple;
	bh=Jb1cgXT+m6qIvAxiKPlYy7OzW8pI8/acTYwcZKsEHx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYrPUf1WgwKdEHqNRF17CybK5emW8FS/NmOsOJEteCpDQotBgQh9yGV7F4jVlz+YSni5aqRDK6XWhw2nL7TF8q0hepV1r2cP3Mg5QijPaQFZyraSx0rOKK9lkkPhDJKPZcz87GHXNh2PAPQI3RnujukUIWlAC/wMtlHH/eV7xBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkxAT6Vj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD831F000E9;
	Sat, 23 May 2026 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502794;
	bh=JVGNEIcFBWgqs/FdAqSiZ9HCjBSKwe8iBDty/6CjCCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkxAT6VjaOhMWRAPlaC4dFNisHa84ZoMZL/gVSC4VI9EF3DDfeNCJPlMN2HMtuSCa
	 7Ti8SY1qXj0C1qQOyUbYoxkAuR/gyO2qa6AXEIJY8XHP3e1tKxt90OZfLa9sOZtR93
	 Cq3MbYlAmpf/Q2dWAsa9nWP4vIcE9aspplb3nS8sjdajtxcKnrjr8CNTaZkVCSxwCa
	 r5c7KGtcvzQhMkZFAzW9bhhfwkUjM9qda5v19JgPGua2lkPFIZY2RyPfsYeg38R+55
	 /ohGRiSYKyNMZAQaKqk5Xre542IKyG/1jn0sPmQyDz7F+S6oZBE159ydVaG+O//01z
	 xEfoGypCJXSWg==
Date: Fri, 22 May 2026 21:19:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com, 
	aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com, 
	jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: Re: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
Message-ID: <ahEObi9ubGaTEcwK@baldur>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109434-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 59C805BC94C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Feb 27, 2026 at 11:45:31AM +0530, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 

@Andi, I've merged the soc-patches through an immutable branch into the
qcom-tree for 7.2, please find this at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260227061544.1785978-1-praveen.talari@oss.qualcomm.com

Regards,
Bjorn

> Praveen Talari (13):
>   soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>     path optional
>   soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>   soc: qcom: geni-se: Introduce helper API for resource initialization
>   soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and
>     geni_se_clks_on()
>   soc: qcom: geni-se: Add resources activation/deactivation helpers
>   soc: qcom: geni-se: Introduce helper API for attaching power domains
>   soc: qcom: geni-se: Introduce helper APIs for performance control
>   dt-bindings: i2c: Describe SA8255p
>   i2c: qcom-geni: Isolate serial engine setup
>   i2c: qcom-geni: Move resource initialization to separate function
>   i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>   i2c: qcom-geni: Store of_device_id data in driver private struct
>   i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
> ---
> v3->v4
> - Added a new patch(4/13) to handle core clk as part of
>   geni_se_clks_off/on().
> 
>  .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
>  drivers/i2c/busses/i2c-qcom-geni.c            | 324 +++++++++---------
>  drivers/soc/qcom/qcom-geni-se.c               | 270 ++++++++++++++-
>  include/linux/soc/qcom/geni-se.h              |  19 +
>  4 files changed, 491 insertions(+), 186 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> 
> 
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> -- 
> 2.34.1
> 

