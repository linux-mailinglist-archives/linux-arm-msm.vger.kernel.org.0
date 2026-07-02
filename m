Return-Path: <linux-arm-msm+bounces-115829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Mi9BZ0CRmpLHwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:18:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE66F3BE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SnUFleNc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17D6630610BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0E2375F67;
	Thu,  2 Jul 2026 06:12:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093D3750B6;
	Thu,  2 Jul 2026 06:12:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972726; cv=none; b=hQd1R9vjRG+n9DgHq5uRByo6MViGBqOUhNV+rcHlDFZBCKd/0tcBpSru2lANHGUegUqursCaeUKcMH8D1/eA7i3om0pNkznfWKOVouFea8dGqu2CkOBm62gET9rcdXTvf+J7G/lAyY1LkpST/gHkAwTpUEqJHNMset/G8hDx8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972726; c=relaxed/simple;
	bh=hduswI07gJ0MhnGZKhJ1tUTJH2beaihRK9u1YpLbwcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZROya9GPohkHv7pX00eflreIXgNmzBj/S/hA8u7l7Ul0j70PG+McRblMreHKVNql3s4CB2Q3oCYhdaWxavTar8FU1yjgxsFQlPw8+9XRj2tTFAW8zmATJitW+jCnU+cj7JSQ7iqCc2mIKUEg5mNirkHvRxQa/0I5CwLKOqSbG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnUFleNc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F1C1F000E9;
	Thu,  2 Jul 2026 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782972724;
	bh=jRGcvDR8CBDSOCR6Lp8cAuCESyy8VVvYP/0X1by0aKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnUFleNcPFIoaWoy6G/bsLb/VGB6k488wokGtCyxiFdgoiObEYFbslQia8LfZtFoL
	 3XQZiPSTn1W6JoKPD7vhPqoTnhsYHqsePKdmtup4uFBBJ/K+CUyusCA5XlmlDBPfil
	 40rhh9QDGFEK4oppNCCgFFVFOmcgpHlON0Hea2ktvQO+PmcjzAeH4t8BnD0EF51Zfk
	 BNJnTinpX4YqEHrrbzA7dVH8/C0oFWTn9mGLEQJoExfdY3ceteirKCVLUc8NGxdH2I
	 24dDGOzqierzJiImYzQvym0bI4jBHNgTSZ4My+FjyPHwi1ZlepdH5UOhmFRRrgJfBM
	 /802g+lF6IhPA==
Date: Thu, 2 Jul 2026 08:12:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com, quic_srivasam@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
Message-ID: <20260702-monumental-inventive-malkoha-dcfe7d@quoll>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115829-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95BE66F3BE1

On Wed, Jul 01, 2026 at 05:31:13PM +0100, Srinivas Kandagatla wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
> accommodate SoundWire controllers v3.1.0 with 17 data ports.
> 
> WSA instances on Glymur has 6 DIN and 11 DOUT ports.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


