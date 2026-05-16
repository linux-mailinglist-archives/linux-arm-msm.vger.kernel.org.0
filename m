Return-Path: <linux-arm-msm+bounces-107991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH8lB+k/CGoRgQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:59:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E6655AFE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2F5730078BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55B037E302;
	Sat, 16 May 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfuFmycN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816262BD030;
	Sat, 16 May 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925539; cv=none; b=hOPOID9Jt9G8UT+PfwX+RTmSfu5QFgZUCieMgZKemM8cVyx5eplJQ3wqcs81GT640UKqs/WFfiRO+GqPgabpoBl+qcD2Uq7DNTFzI0NFDrTtDwEDcmitn7lAm8k9uWPhsdkT3cnWAUCcHE7bE1NdHrN1TeLwfwSCDVph5/4H9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925539; c=relaxed/simple;
	bh=/Cd5D81A/OW/oM0+DfS9RH4MadGII7LyE+NoEou+BaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgdaR7wJoQ/mK+PkYTc16/j6Cks+vQ6lYzz9ss8Do1MdtFtenac0Pd5QGCF7sJqwFgQ9i85toPXRAKcy9pLd17XZoN7Xe3qQ8lSGIu2WGoET5UzPsF8nBqga+GP54SbtUdldgkZe8pcAx7liIBxkNfTDDiXMYiPxIQMh+S53v8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfuFmycN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D495C19425;
	Sat, 16 May 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778925539;
	bh=/Cd5D81A/OW/oM0+DfS9RH4MadGII7LyE+NoEou+BaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PfuFmycN2tjuGlzq/imCF9DtawVa0twAPOKCEssAq/ifsGBa8fyaWistx0ROtmQOP
	 +dh6gzaLwICB496evvnPFIqSkPJkk/hj7xDh9wlwe2+SXvKq0eMfIntQb6PJZLeWHE
	 qD+xE/Fs78AwC9fp/Vhhz7c419+o4eLyJ8IuDqa91DpMrFom0CoZ/WLNWxmfXR2mSi
	 z+6vrxwRKri7KgVRXUgfnX7VWpEUnAtrywqFCZKiui+2hR5kIWWW0Y8OsKVLydIgx6
	 7o3Z/DOn0ECyQY+JGik+aBmm14acXVNPDasfa6bG3i6AQ0VuhY6mQG6l5HgzCq1VvY
	 YWVRvMDyXP7sw==
Date: Sat, 16 May 2026 11:58:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
X-Rspamd-Queue-Id: 99E6655AFE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107991-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> boards. Both boards are built from a base board paired with a SoM which
> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> LPDDR, eMMC and UFS.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 2741c07e9f41..28a18254b4b7 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -63,6 +63,8 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,eliza-cqm-evk
> +              - qcom,eliza-cqs-evk

When we talked privately, I asked to mirror Shikra approach. But you did
not - it's different from what Shikra sent.

Shikra received my comments - but you did not mirror these, either.
Basically you went with third approach... well, I think this is the same
case as in Shikra, thus comments from Shikra apply here (at least what
I expect to see). Also, another reason is that this should be
consistent.

Best regards,
Krzysztof


