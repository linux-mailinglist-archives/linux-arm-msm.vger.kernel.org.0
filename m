Return-Path: <linux-arm-msm+bounces-96877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPPINYQJsWnhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:19:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3225CC27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49DE33030757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E45B359A8B;
	Wed, 11 Mar 2026 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE2/xUcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE832248873;
	Wed, 11 Mar 2026 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209984; cv=none; b=kjgDftmyDZ2Ve+gnqSdmrqU23fm/zylB06C8mEuU+WV3CH1Q+AnHz3xnlm4lyObO0YcY93xuVkoUM8b8/0H5qDWMQMUMHnqok3SWPfHXITurbBOD0bB+s3SYGFCTeXzOcEURJeB/l6cTs516ZwhQWjF9415Wcn/i+wxtDGsPYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209984; c=relaxed/simple;
	bh=4iafiXE/QL17CkWZS3QG/yMHJM2p+fVM1bfFtHPiSZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXA+V9eZXQNIFls26B5hMU9lvvKCQveiK/63QsHVexA1jtY1PAZJNwUXXV1fK4HJcq3K3Q5iKF0mH5Y3E3CBusCE5LQfRIFG1i61XP+e52zFs5cs0WiyvjI3APP3ClZ3rVIPne7sgNBDhJlN2KWAyST3+IqMyzJ6asTQR5KAOe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE2/xUcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1AFC2BC9E;
	Wed, 11 Mar 2026 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773209983;
	bh=4iafiXE/QL17CkWZS3QG/yMHJM2p+fVM1bfFtHPiSZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YE2/xUcN5jSLkB4chV1f8BvLUfrdVtAH+XfITewyjZyPN/9hLEMJgSt/j6ExiGUzi
	 9T/h+p6OJm/X4TabNiTlAE0uz2trY0vfjgk+yknNVyhi3Zacq4A1hs//+OCPdRDwwB
	 ZZiKTjG6CBitzenMwdpfbvOBH7dIrVWw5AlAnIyw1U6iqkIe+C91X6L4nXFvmh6Nqj
	 88rJmej5fUhiGe0zmBewnOjxE/JIluzXKdUhRSsMrv0VrbrJ02vcuuZaMLyVbCj1dm
	 EePOM+S+7TBETWeQIvpS5ntK6HvpmaFJrfXRn31rEmQwc0bQ4gTJJMVk+0iOgf0TpX
	 n5z1M+yhh7+3g==
Date: Wed, 11 Mar 2026 07:19:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Message-ID: <20260311-fragrant-ruddy-cuckoo-f7e9cc@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-1-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-1-0a91575e0e7e@oss.qualcomm.com>
X-Rspamd-Queue-Id: 53A3225CC27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96877-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:03:17AM -0700, Jingyi Wang wrote:
> Items in qcom,adsp.yaml have common clock and interrupt properties, move
> these out of the allOf section to avoid list the compatible repeatly.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
>  1 file changed, 14 insertions(+), 50 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


