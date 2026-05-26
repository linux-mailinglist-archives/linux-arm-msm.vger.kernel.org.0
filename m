Return-Path: <linux-arm-msm+bounces-109887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDb+KbXCFWoAagcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:56:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBAB5D9287
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD503302F683
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250AC38BF7A;
	Tue, 26 May 2026 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUyO5zVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81EF38B150;
	Tue, 26 May 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810337; cv=none; b=kLmW5i4AsYR7d+TjYJfTuu4I6MfwXsWQM9EHoI4ZvZZJGANbGAc6wrUtglihY/y0EEtqjkUhVVoCrttSgkzQiO0WHuP52NsF5Id8+34AqT9HIQ7NvbXhwIcHXGa45gmCVc8UsvpbsQpiqa6NQsHoLiwtGOCiTwbIsp1QKjEND3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810337; c=relaxed/simple;
	bh=z8JokIXzkRk1xPW1ZroqVPnre0GbNXHfP9bcHXmUBzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VINCxN6sueyrwCaohjHhh2nqE9B1knfgdZKuOU/Tt8gt55bTSD83LkFJcLHMW+Q+6mn2SVVOqJe5HzowGD2NuIpI4HRd1FUbZHpqiGZD5IB2zwe57HQq7EGTi1fKP9YADbR/JXHfsD2OOzDRiJoF5HdIPO3dqtK9Yc1pgMzwmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUyO5zVK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272791F00A3A;
	Tue, 26 May 2026 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810335;
	bh=o6ZOpdcooECKlYdGEkMt3TkcMoyrYav5PVhJftWJ3r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUyO5zVKJg4RoIQE/Un1jPwQOBn3NgWQV6InHga/aSjomsJ/4feSlar1gJerZmJLK
	 MvjNM5zyujbC4OsbPN+iX5s0/6cHlPsHyAVyCU6pOsQxAfMrXus4j1F7I91Id6/Xl7
	 zrCWzP5Ywv+xjdhXo5YJGAbemISU68AD+xPUEjub8sRFm+sPXVtaJpgXCuI5R1UIX/
	 FAzz/2P7t9gtbN9rq/sdT49YUTat80406MoZU4XxMTTFv6DqzD9W023hj1i1hcXI1U
	 jQrTSV39GmA3iwKeoNy65i7q4vo/UXtgTuvxAR3T/4YwuN1ZpHby7/toXZ9nIgCP1R
	 U0nQbeVicP4CA==
Date: Tue, 26 May 2026 17:45:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
Message-ID: <20260526-quantum-funny-gorilla-cfc983@quoll>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109887-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6FBAB5D9287
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:32:24PM +0530, Komal Bajaj wrote:
> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
> passives, and is designed to be mounted on carrier boards.
> 
> Three eSoM variant are introduced:
>   - CQM: retail variant with integrated modem
>   - CQS: retail variant without modem
>   - IQS: industrial-grade variant without modem

Industrial/consumer variants differ often only with thermal, so how is
it here? Thermal difference does not make them incompatible. Honestly,
usually industrial one does not even receive dedicated compatibles.

Best regards,
Krzysztof


