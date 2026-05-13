Return-Path: <linux-arm-msm+bounces-107503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE+SJzEHBWpRRgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 01:20:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDD53BE7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 01:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B4C23010ED8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B763655F1;
	Wed, 13 May 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfEwWEpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8C1B6D1A;
	Wed, 13 May 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714409; cv=none; b=DNxGuov3wtiV/AHq43aBM2P8vK5uUuzztalMDdntANHwlog/wvShk9kuz7gWapRsjMaOkk8YxNxGdLJKQoH1ZQpsOazSaRnJ949geYecLst+xNY9cBsUKNItYsfsM2ClBRQb3FBFPBnWvrjQtouzed9hje/APB3073iNlwbtKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714409; c=relaxed/simple;
	bh=7TTPL3LG2P8OfeFkwXeR/jGlgxkKCAcMwGn2yF3v1ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuB4TnJoJZMzSbE9F1YZb7ITqAFeenQPL0Y2qGQRvabcYKDAY4jMEFaVvRRzMafFsa4GIfRLRZEOuuZyQUB/LUTzR3bhDeorrr/WhuL1jWV5aBqeddcvlwWKCpVGI2+knmoUY1syXbXHQDZUTzhUk2VWEQdLIb9dKqPN5shMMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfEwWEpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14C6C19425;
	Wed, 13 May 2026 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714409;
	bh=7TTPL3LG2P8OfeFkwXeR/jGlgxkKCAcMwGn2yF3v1ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfEwWEpRqCWgqHbEsAlUAlh7rJ682620IbkoDzfP72lNq+dddibrzPBn0bgpn2mGI
	 CnX7ah0OlV5cCs49ssmJXCgrP6CMTj/9S1yJ9mEtqqnZDl4MTjOCrc80jFvkzmiy0B
	 sWJYPI4ht5twEABMIvEeFaTZ6RS4XHxHwr77THY7F8ZWI/4SqdLjOUTQN+vvIGr68U
	 sOQ38I0HsXypNjjc9F7KRWhtZ7Ut8fS26Q8gIaMzi8o6beLsT2giSlGK3YoIkW3IfA
	 G+rkHrox3WOlauYDLjDTNyrNJpG84PWvIPyAImMbpZzJfKa+OV6ozWS+FrjD3HTyMg
	 B7TpUn6k7vBXw==
Date: Wed, 13 May 2026 18:20:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: qcom: smd-rpm: Add Shikra
 rpm-smd compatible
Message-ID: <177871440571.2291174.6393021319553027315.robh@kernel.org>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0FEDD53BE7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gerhold.net,linaro.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-107503-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 08 May 2026 16:10:46 +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra rpm-smd device.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


