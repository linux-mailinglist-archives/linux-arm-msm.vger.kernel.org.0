Return-Path: <linux-arm-msm+bounces-97637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /YC1NpmHtGmOpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:54:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34628A324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53DD7302B802
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 21:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03594355F54;
	Fri, 13 Mar 2026 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0CbYZTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D451EC01B;
	Fri, 13 Mar 2026 21:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773438870; cv=none; b=TpbRP6TZnT+om+CyldXVUQbD1ij+dx5bDJCo8Cd4hDPwCD04MW0zWlY4tE90v3+XQZ1YWgZ+lk13yjinL45gqNfySVp3+jxLZhYSSpfPbQxvfsPhd7YJwCQUpmSgr7Q5cK45v7jnN3UITsyFK5QTAplJR4O6k38yWGxUhHCoScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773438870; c=relaxed/simple;
	bh=c9fnUiG/AbnP2qanxxG12d19at+kYpDMVVkqjlSyvuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhlATqSjE1SC2ZjK3bRfwdB5qh6ABLkBKtQz5HmsBfa0sR8ahbqEvNhqwqZ/xzfmCj5HeU/gcJJ1zZqrczetNlxtnoonSTigy46Z3JQjsVKc65FPm+TJGJ+SF8fWf5WH6sT318wJkgcDysBtgmVCmk2f3YpB3//oeRorla66nHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0CbYZTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493F9C19421;
	Fri, 13 Mar 2026 21:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773438870;
	bh=c9fnUiG/AbnP2qanxxG12d19at+kYpDMVVkqjlSyvuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0CbYZTtkkHmx308AVBrbymS0KdJc5zvVcaZgXr5bwBJ3oHFpDp4F9ek786W+L2WN
	 Hj5I3qiPZ2CNW47o9W7Hr539VMKPDqu+ThpIfJaOCq5ofebgBL5G0hp0mqDZg/3hIP
	 ekcqVuvMsQpyZo6goqREuYM51nU0SVPnF/H0lQl0NCXIeMzKcpSCyn0gMUAQjtpJJL
	 jRq8B/tXraNs91dY2bV7rg0MmqddqNgKpj+9s5pNxvn0BNHALD/9Wf8HCJ3dV1G061
	 gAC+NcwbJ/ZlAzB97rVZltk9ScbKkl/AMmAWmXu+yUeOcyE3hHfMNNrJgYdoF0oS9G
	 y7BYYe3TXc7Gg==
Date: Fri, 13 Mar 2026 16:54:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, freedreno@lists.freedesktop.org,
	Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dt-bindings: display/msm/gpu: Drop redundant
 reg-names in one if:then:
Message-ID: <177343886847.3412788.12364118148298803763.robh@kernel.org>
References: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,suse.de,gmail.com,kernel.org,vger.kernel.org,linux.dev,somainline.org,ffwll.ch,lists.freedesktop.org,poorly.run,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-97637-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 6A34628A324
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 01 Mar 2026 15:20:34 +0100, Krzysztof Kozlowski wrote:
> Top-level reg-names defines already proper order for "reg-names" with
> minItems: 1, so no need to repeat it again in one of "if:then:" cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Rebase
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


