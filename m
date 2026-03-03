Return-Path: <linux-arm-msm+bounces-95053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNyGJNSApmmIQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:33:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA491E9A5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70C2D303467C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 06:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68592FBDE0;
	Tue,  3 Mar 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+wCjG5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD11E230E;
	Tue,  3 Mar 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519633; cv=none; b=dCEW1WmTrUK+D7Q/kbnksfx8/n0LZdhkOhNPHzk3J7vtQtcJmEspyGwHlHowzDzo7P5eo+5CH06EGDw+OKM3ctX6scjTIXFQdXWHBXrDhyOqwErtHR6iv27x27HCG9ZvPovDpbhMK7HyE3NnnTUxfFwPT54cO0o/KGle7NLTDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519633; c=relaxed/simple;
	bh=KJs1ByjIkGvjPiSKi+3Y5WNEnzooK0FP+vQXYCd+ncI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFVmD450S+CbhCry7lUgevkqyKNDKCRe59Nhi4nvanvX5KaZIazoxwGJZMmOAKT/6DThWYd9m1FPI/wF+QWCygXAtqfiGDq94WmXKo/2m10elgTrY4jwqKF+pNOsW8e9stlu6NctoK8j9F6pGRgU1culIvFpuWlTCQV0xZfnH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+wCjG5S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C10C116C6;
	Tue,  3 Mar 2026 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772519633;
	bh=KJs1ByjIkGvjPiSKi+3Y5WNEnzooK0FP+vQXYCd+ncI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+wCjG5SA5m8Nvw23b//2pl3YeHZkv+ktLUAKXaUfSW/wLCpgX1uU1sgWaEHZVGr/
	 CEhXKO0VxzYoBksASo5kHlcLtj88VnulMHf0szX3784j/qyIJHbEb3O2Ept/vXOmQQ
	 gubYkIG+hr42mF9AO9jweZimLyt/uwtanBub+azL0aQeAvlvAmgFjaV+4DvLi7z0tf
	 dYj47R1JkuvCmfLQ2nwfpErC4wbBIh4gUYWU+5fsX9QS95Y326eyjFJlsaiTSGFwtK
	 qal78ifvq6adBCW9fSQni2qZ8JZTNiS0VOxQ0RRUSu+dFw7ygZPgxwE5SzTLhVCw83
	 3RUZFvPZFUwig==
Date: Tue, 3 Mar 2026 07:33:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core
 reset
Message-ID: <20260303-brilliant-tough-hyrax-227f39@quoll>
References: <20260303034847.13870-1-val@packett.cool>
 <20260303034847.13870-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303034847.13870-7-val@packett.cool>
X-Rspamd-Queue-Id: EBA491E9A5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95053-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,somainline.org,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:41:25AM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the xiaomi-laurel-sprout smartphone DSI would not work on boot.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Yedaya Katsman <yedaya.ka@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


