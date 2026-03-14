Return-Path: <linux-arm-msm+bounces-97695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KD7K2gxtWn1xQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:59:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01628C930
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15797300F785
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E501330330;
	Sat, 14 Mar 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqMUsa+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3F1DF980;
	Sat, 14 Mar 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773482340; cv=none; b=ToSytVqFRi6mgZAGh4R23RkG7Remri8s9Wo4pzzOYr73fJs5PA7lWzGVq+KmGOmPCBdlAFWW0RGAKkeUcxT1/SIakyFm+fQSqvMTfaoboFQay7O6lXkgkrRT2zOHRTCno2WRvUdnrTNN1k8129zkdqqKGxFmpMvMqBNcefIP8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773482340; c=relaxed/simple;
	bh=zXA/PF29j9H2U2V+HK3Ii9CDpw6L5aqLq1qZcaJE07g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GG3OcSR2u0bpRnfd5VqUU1RNXDae/9q/B1qHBD1x4LnWKZiYr/7bmGLUNBMZ/cKgnk5JwHZDykctTfqQYgzGIKVVJdYXg1FuZPRhCmgZMrztQf7Q72iP60K2FEVzb7wjpVHvhGkOc7igevTW/+9MhL1qe9UkPivXNCkCSbAZQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqMUsa+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7AAC116C6;
	Sat, 14 Mar 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773482339;
	bh=zXA/PF29j9H2U2V+HK3Ii9CDpw6L5aqLq1qZcaJE07g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqMUsa+gN5D+WFfhn7eQnYDyfpo+vqltM6nuIZXhSC5xq0kCJ3JHiyAQB9YdTfcX8
	 kSKKMF4CDmxVhE+iMTMuFKN1YEMgcDAb0ZHU+KT6qSD2dSLMIa5XJw86qz22KsL6vr
	 Mh1sCC6o8kpQOaj2rvtAp9wNoos8hQ6GvO0UBQIbOqCGDAyCTEStjHliSiNEHAo7QZ
	 Rz1PYzCQJ8lZ1R6v8fWkrErOqtoW/KlQHTbwHl9ODRin8JxyFQ3OkNvCy3a7xAudln
	 zHkRmqJ4UvE4ZbAdFhRBPbe0YmUEp24bnOfFVqrbVEtcPm0lqPATpxs1Lx1tO6dD7R
	 RC2wVzpMb4GtA==
Date: Sat, 14 Mar 2026 10:58:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org, 
	angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org, neil.armstrong@linaro.org, 
	festevam@gmail.com, Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: arm: cpus: Extend Qualcomm Oryon
 compatibles
Message-ID: <20260314-vegan-clay-roadrunner-8c1af7@quoll>
References: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
 <20260313103439.1255247-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313103439.1255247-2-sibi.sankar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E01628C930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:04:38PM +0530, Sibi Sankar wrote:
> The generic Qualcomm Oryon CPU compatible documented in the binding
> doesn't account for differences between core types and has been
> deprecated. Introduce core-specific compatibles, by appending the
> compatible with MIDR part and variant numbers as listed below.
> 
> qcom,oryon-MIDR_EL1[PART_NUM]-MIDR_EL1[VARIANT]
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


