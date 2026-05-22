Return-Path: <linux-arm-msm+bounces-109174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMtGGQL5D2pXSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:34:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325E5AF8E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128DF301F1AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3480E357D1E;
	Fri, 22 May 2026 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE1Gvc66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090682727F3;
	Fri, 22 May 2026 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431670; cv=none; b=PKr6U4oyNoyMimf0oPZibwnlX3Vpan1ozNm7AX39RMihaB9KwE3EBpl9rk96ejREXqQWUNyMXqf9gFHFiQJIsRuWvNNvQqkkwaKbtNFyGHDUuAFkj+UEfcFwNNC4H9v0W7QmaayrhYLxIDggk1nHVu5YPq1kFP54JZyk3U1lrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431670; c=relaxed/simple;
	bh=w+UZ/JGO/uq67M7KKp3u/ca3N3WWzp6/S1ta+Uze2hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9IHfSLgyuHKUgjapuPR6W0/D8vT53R8dH+wB1EkLkAX8xBZITrsr8SD5QQAQExLninK1GB1gSMZkGx7u9fM39n5wTlcujqDLo3lZizFd3v+TMdZX9mmIJukHRcM8CEZ0HIR9kXAuUtUaxW7sn0Kr8lbLet+OpxY0mu5ExqfWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cE1Gvc66; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277181F000E9;
	Fri, 22 May 2026 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779431668;
	bh=B/D0+DLS4mnsbS619yw6Chs2Xyq84MJ82i/B6J9Lgd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cE1Gvc66WlOK6LOesdpfppfzBiuGSh1G8gJvYKGymBsgpDEdNTF6GyxLoBU0GyAMc
	 MD6WwDyjgGwIuzhqeNmDxcKRgUa2z6qqcXPy7zhTWqQvQO5m+g33H78wgeZqLvXY6V
	 qzah7Ac1TsuVbf1kBqUtWM2ufERsquNMY0XATPTYfN8Pn1W9Y5z2b07htycPqyIC+9
	 s9+7WS7YdXwPy4OXwRILdhVT3ywZZBm4jG+h/9EZ5mMsXKpb3siaAVqgMGvNjVcibt
	 RHiaLFxXiiey2wRQdUMlmfa2VRLpbuh92GJPSX4bk/YuVbhbuu7f2H/BPGK05wIPqW
	 DNl53jycy67AA==
Date: Fri, 22 May 2026 08:34:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Message-ID: <20260522-juicy-seal-of-wind-a2fc50@quoll>
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109174-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 0325E5AF8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
> Shikra specific bindings to represent this constrained EPSS variant.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8543fd00d82acdbb3422bde462417118aa4c49d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/qcom,shikra-epss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CPUFREQ HW for Qualcomm Shikra SoC

Qualcomm Shikra SoC EPSS

> +
> +maintainers:
> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage

EPSS is a ....

> +  frequency in hardware. It is capable of controlling frequency for
> +  multiple clusters.
> +
> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table

here as well, like I mentioned last time. cpufreq is linuxism and I
asked you about name of actual device.

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


