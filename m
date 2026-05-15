Return-Path: <linux-arm-msm+bounces-107725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKHQBjXFBmpdngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:03:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D09F54A455
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4BA73004DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB783E025A;
	Fri, 15 May 2026 07:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoYIE3d1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F73E023D;
	Fri, 15 May 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828595; cv=none; b=AxoHDAmoCIa4bi7fiA9AdDA3CfXr+lrIp122rlPPln17XB8YmescZh5HnKV0Glg1o9CuioPL6D2wqyWL67lClTVUVqty0aseV06fypAUanWZiekL5AWSWm9KB8kyuHP02qj/S8J9aGwSyioLXDaBiyDdrCa4dTmlF8nNx1IsIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828595; c=relaxed/simple;
	bh=UFt1H7tojIcyi2oC15rpkmT6R6HC5/FNUsSIF/Zi1J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2g5+8l4beP0A00uWWiPqUDzlsb3XS90rHt+VuwbofdswkPegoqPvxKH6BnZDVNmb8Y4KPz4z2gY/7RW/78D6d2qh52w6/seT9HSg8mHQpP+tmX41bhaR6iqqDGHfEau37e4/mUXSf8IJg6KKOQNOXoLQBnXiEowhkzBDZd3JJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoYIE3d1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E6CC2BCB0;
	Fri, 15 May 2026 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828594;
	bh=UFt1H7tojIcyi2oC15rpkmT6R6HC5/FNUsSIF/Zi1J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoYIE3d18NM5bJCnRjqcHMyUcICYz9g4b2qzfHDjKjsLG2NaqBdm/6uE1oD/XZgoF
	 14+tsjB/Wia9FkSFusxW0lRQEkXa5m8Cc7NNtU1sDtBEn7QaDGgMbgEYAVB0NEeSwj
	 rwQj1NbvIeDv5yiovPNvJd/b2xK1/hq54Zb8rz5GXsX7phXFqwEcAQtYirqBaUn1Ro
	 pl64DRyaRU+W+hn0U3tZQn5Z+znD+zKwBkAy5mNILA1PWsrzK8PIDLIGOqvbddTmz4
	 LLY0kz6yf3SuHK7B6+rFr0/dFkNdPnr7LbfZ5nQXSTMTcISlVmW6+9uf3LwrWPXYuC
	 FOYqihvAmu8Uw==
Date: Fri, 15 May 2026 09:03:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	davem@davemloft.net, neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jikos@kernel.org, bentiss@kernel.org, luzmaximilian@gmail.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, Douglas Anderson <dianders@chromium.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: arm: qcom: Add Microsoft Surface Pro
 12in
Message-ID: <20260515-fabulous-married-pogona-ebccd9@quoll>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
 <e54aa6c1e190b0e26d58504c5ea1b05fd09d64d3.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e54aa6c1e190b0e26d58504c5ea1b05fd09d64d3.1778822464.git.harrison.vanderbyl@gmail.com>
X-Rspamd-Queue-Id: 9D09F54A455
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107725-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,chromium.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 03:41:46PM +1000, Harrison Vanderbyl wrote:
> Document the compatible string for the Microsoft Surface Pro
> 12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
> SoC.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index b4943123d2e4..aaa9a129908a 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1168,6 +1168,10 @@ properties:
>            - const: microsoft,denali
>            - const: qcom,x1e80100
>  
> +      - items:
> +          - const: microsoft,surface-pro-12in

Why isn't this part of the other enum with all devices?

Best regards,
Krzysztof


