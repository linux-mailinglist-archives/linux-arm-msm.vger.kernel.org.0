Return-Path: <linux-arm-msm+bounces-105677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANBCCyxu+GnPuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C04BB564
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B24302E903
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BD438B7CD;
	Mon,  4 May 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aw2mYZdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B868388E4A;
	Mon,  4 May 2026 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888574; cv=none; b=V0ORCdH6paXDmH0c2P/YUaR/lSV1It1L1q3ISlAk1DOWcrnvY98hgQXl22ypvjNk2YWnZCjHx4ZjiMa9/rQVRvgthsjmu9iYMQ1MqbaEF5CGVwKodGnMtkLACweFu7gxpjSyYdFsXHds+spASNpZEYg/pM2WaF0EfVkJuE4Omjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888574; c=relaxed/simple;
	bh=1YOlxeyVA0cWlekYA2w4Ucx5FwbvE3hcvP+Sby+ziyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFIjI/Cu96o0i4T1QJEjZSBmZ0pPY80koapX+1LR8qxG/vyVfuZ2FSWXf1PdroKIbVZ/FjWO0qAsqdWaY377zywC+dXyhY1D22JJZwaVrsUUkJlPw+ghCnHxuHQZTt1xEO6JFpEFZFLan7h+pQQBph9YgcV+uqb/iN/J+zzNJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aw2mYZdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AB4C2BCB8;
	Mon,  4 May 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777888573;
	bh=1YOlxeyVA0cWlekYA2w4Ucx5FwbvE3hcvP+Sby+ziyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aw2mYZdCfaSv4rHOWmuH6p+Xh+EKCaHEqYNA1+/hdCmidY1lH5Iph8o21Tm7uj4Ma
	 f5PcYqJLYYGkapTgVAWWyjSAfxFbZ7V8sxEccbuJgAnpnCQgSnS+rCB7WIfSHH9Ih8
	 n+L1Feb6gqteVLPPdcpoMMWJ7EB67SeqaAVjJ37Z+b22/Ytbj7TTUL77SS5pwjSeFG
	 Tu0aZgvkMAEFCS845ZmrfF1G/4HEW2JV1eZBViarNCYQGKD5ggNliF5NKVC3qU2WAX
	 aYREXQzxtYzHlKVbb3H5h75rWnYjPgIvoR7IXgzSl/jhAEvzE3lSE4bhENeDFeYAI7
	 yn9Al2ZdhHvag==
Date: Mon, 4 May 2026 11:56:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Message-ID: <20260504-mighty-fat-deer-fb7ec0@quoll>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
X-Rspamd-Queue-Id: C96C04BB564
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 03:14:58PM +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra APCS block.

Here you explain why it is not compatible with SDM845 or other variant.

> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


