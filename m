Return-Path: <linux-arm-msm+bounces-107312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHEpMyh1BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:57:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB36533705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7BD2302EA36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAEA477986;
	Wed, 13 May 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZJQtIfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12E3F2113;
	Wed, 13 May 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676808; cv=none; b=REjV8cVt4W/4QK7Oftvp6ANHiZLwTPff6AyXvahGJqlJUUfp1ChvflwXoHbiFP3Z9jXHiCV7K2KAGMA4eduajdh4/b/8XxMmEFFM7FHMBVftaYSfmCaxb87KENNlNIUZtv2UjOrkNVlWz40QBacOL8od9tmTcWMbR8q3lhCYsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676808; c=relaxed/simple;
	bh=o1OfZey8PrTu/5v4iQXkQku7LPC7G/T9iYyY5bzOpLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ6m3Vv0tkI2BeWTruQ6p5pWP/vKF7tVuIoXZ5PHy4FUDweqCLsJczD9zF2x7psSRzF/wXmNyo7tDEJkQnNpKEEyhHAl5Vr4FP+Tlu9tYnWdj/8pjJwvk29gAaaMYv+G2QIjgyiboPqjs9bK0yfvuywzekS3/dgUw6rHUJOw6NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZJQtIfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C52C2BCB7;
	Wed, 13 May 2026 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778676808;
	bh=o1OfZey8PrTu/5v4iQXkQku7LPC7G/T9iYyY5bzOpLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZJQtIfCEATfPTgS7RYqjgkcC84NC0ZJugyHFdRqEfmRZakEbRB14LiWoycYRO+91
	 HXeJd1ASMGMsAwQhuAA/bTL42PwbZ85k9aWn/PoDNRdv3tLma5HmK4ZZf9jRJjqvqz
	 J6VP/5otjb/g21I2kk6mtg1iDYT6838/XuTK7rfJ4UmGf9zFhLg65fYLajv9BGMy3i
	 dVV0b5KvLsAd0i0mUN9YDopByL2ZP2Cu5Kn0TcKAyVrj5vTjcL8wVUVLBsy9eMlGRo
	 G7DJFKWzvX90kW7epticeCUsDfeOqLm5Aug2NRbZql91R/TTV83CBAOupGefdnQ6dc
	 tJNm9dDH/vlkg==
Date: Wed, 13 May 2026 07:53:25 -0500
From: Rob Herring <robh@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Document PDC for
 Qualcomm Nord SoC
Message-ID: <20260513125325.GA594921-robh@kernel.org>
References: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6FB36533705
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107312-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 04:07:03PM +0800, Shawn Guo wrote:
> Document Power Domain Controller on Qualcomm Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part
>  - Link to v2: https://lore.kernel.org/all/20260427010922.230586-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com/
> 
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob

