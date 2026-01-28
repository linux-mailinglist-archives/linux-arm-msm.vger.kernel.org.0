Return-Path: <linux-arm-msm+bounces-90956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NjlFlLueWkF1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:09:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D03A014D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E5913004206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1212327BF3;
	Wed, 28 Jan 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoOkDoTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03524B28;
	Wed, 28 Jan 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598543; cv=none; b=tbjAdCaGvojETzjhpudkaRsR+eX61zlxDQJtrGdIndeUmZiRtX2sPmc60U9ECqZ3Kz0nCx7crnA4wuTpthe4q6fwXIijH1s5egZVwMuwjAaoBVlQ+/iywaHENbB3UA58ghASBrHAYKyiEmuxE+xrhJOg0EqAc79yoVwOngwAH6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598543; c=relaxed/simple;
	bh=C5RVk89QQKjlpMSIOy5flFClNGlbdRmoXjmH506VbBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYnTNLp3Qgfmg6eFTeqrFwhsu3H6h3SV132SBt0wCDIs2Ky8NDBX7SfvEnrEbT/uJdtFWA9gC8BXHJkfpUeEXhlm6spfkpE8EoyLnfdeAWmd7ViBl/iwiOZdqKs/CRBf5r5bsmT52f8EpAQoq1v9Xpb3FLO/UC1tfG//KQZo2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoOkDoTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA05C16AAE;
	Wed, 28 Jan 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598543;
	bh=C5RVk89QQKjlpMSIOy5flFClNGlbdRmoXjmH506VbBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoOkDoTx2Wo8VKyyXcazt/wdup2qqocVDbbHW0FnXq4A2AWoLgB+oyMGOOAf5h3KB
	 nx5gbfoG0eAYbgO0M9Ou4LMoUBWnn/jY08kX0jPx2sDr+yLsJkEJBADv+gJAwTB7Ng
	 ae4ZnvsbbxFFdTgFGG+rxpS/wA6QkZMHysvtRNtY6ueDYW0LJdT838IthP0p/7EHCj
	 5MfiIaqo+CHeZnlnw4ymIDD0u349zME3h4jR39aUk1RItOIZ9jYIWd8iz25cqY2Mtc
	 M5zX4A+ab7BhVggRaBBvs/QFWtoTKGC+shk0k2z6opuC/w3DyHdMgREau2niHNomHW
	 +x9jaZhjfgYdw==
Date: Wed, 28 Jan 2026 12:09:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: qcom,sc7280-venus: drop
 non-PAS support
Message-ID: <20260128-purple-hyrax-of-tenacity-f1d2fa@quoll>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-2-7f37689f4b39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-venus-iris-flip-switch-v3-2-7f37689f4b39@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B4D03A014D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:23:01PM +0200, Dmitry Baryshkov wrote:
> The only users of the non-PAS setup on SC7280 platform are the ChromeOS
> devices, which were cancelled before reaching end users. Iris, the
> alternative driver for the same hardware, does not support non-PAS
> setup. It is expected that in future both Venus and Iris devices will
> use different ABI for non-PAS (EL2) setup.
> 
> In order to declare only the future-proof hardware description drop
> support for non-PAS setup from the SC7280 Venus schema (breaking almost
> non-existing SC7280 ChromeOS devices).
> 
> The dropped iommus entry reflects the extra stream, which should not be
> treated in the same way as the main one (which doesn't match the usage
> described by the iommus definition).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


