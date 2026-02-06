Return-Path: <linux-arm-msm+bounces-91978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LZlDsughWlKEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:05:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A7FB3DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5193010DB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8578346AD6;
	Fri,  6 Feb 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgq6+Wfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A431633F395;
	Fri,  6 Feb 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364906; cv=none; b=aiK6mH0IFzeCpGm0FB/m9n3Gx6OtKuPYpsUmVsFAKOMHjN5kdCfcZ8gvRfjfWXf/awx7eplKIn9/5GF5zSDSqTYEWV+eUPg9wCLPWKqelJptFUt4lo0UA5UussVRYQzSk/dkVBW6XLG8gYobdfaKZlO3jEl656fJgVZYlBJtaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364906; c=relaxed/simple;
	bh=8xG3JPsnWZhg/I84nAFY9ErZo3wh4h7qBN5sbtVVtOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+5aQYGBdN7XKAEL8H+DxFUYB4bQR/1I4W5kzR35XNCB664yXW4hjITC6Pmlg90xwWqHxRwUmqja0v6GVEneYIX8t6VjLY0IHkwfEkS/vVA4iMfaGl3xaKFGOU+4myckgmYcknpgnWnIu+6qG5mCNPkEolqK5fNCf2zh7T5aTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgq6+Wfs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EA8C116C6;
	Fri,  6 Feb 2026 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770364906;
	bh=8xG3JPsnWZhg/I84nAFY9ErZo3wh4h7qBN5sbtVVtOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgq6+WfsTFqxbi/vuNmyZ2oRdjtbUetWYpXA18v5oa0OH+ZfjJWY6E7DoL1SL5ZA9
	 dpvASmEWCXeJBVBgwbc4yXXni/SKa7Ji89rrA+jWwmjlUgP+RBh+5CI4eMKDLEXEQW
	 eUQsP4Ih9SWfVIyC44W/XfqoNmizf3k/Hdcs05rT+L6LyiE9Lsp1awwwbevUx+swcP
	 yEzhhJIay5vh/JQUNgp8IAND2PVSlvVp2KYO8Zemrrts/Qt8yfelMK8nWRT/RatPyk
	 hpGrRDBkA9dDVzohBRTQ9cu/aApV5Br5oSznujElX+K7klRSVJK1Xba52gFF+s8Yg1
	 5eJECI+OQWmZg==
Date: Fri, 6 Feb 2026 09:01:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, perex@perex.cz, 
	tiwai@suse.com, alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	quic_wcheng@quicinc.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stable@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: qcom: q6apm: fix array out of bounds on
 lpass ports
Message-ID: <20260206-funny-beaver-of-trust-873343@quoll>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 924A7FB3DA
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:02PM -0500, Srinivas Kandagatla wrote:
> lpass ports numbers have been added but the apm driver never got updated
> with new max port value that it uses to store dai specific data.
> 
> This will result in array out of bounds and weird driver behaviour.
> Fix this by adding a new LPASS_MAX_PORT which is can be used by driver
> instead of using number and any new port additional can only be done in
> one place, which should avoid these type of mistakes in future.
> 
> Also update the driver to use this LPASS_MAX_PORT.
> 
> Fixes: 55b5fb369c02 ("ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port")
> Cc: Stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +

Why do you send this patch multiple times? I already replied to it.

NAK

And also impossible to reply via korg:

sendmail: server message: 550 5.1.1 <cnor+dt@kernel.org>: Recipient address rejected: User unknown in local recipient table

Best regards,
Krzysztof


