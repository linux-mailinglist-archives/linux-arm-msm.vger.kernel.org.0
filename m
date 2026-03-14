Return-Path: <linux-arm-msm+bounces-97696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJUfKn8xtWn1xQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:59:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FE28C941
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA1DA30300E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DAD33F8D9;
	Sat, 14 Mar 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRodZ3Y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D608330330;
	Sat, 14 Mar 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773482360; cv=none; b=o+zrrBf3qG8egMScqvQa7sDdlZ72z36ZoOgDfd8dLJ/ismmriw/lOoZWGfxuAH/00hE9oBTVytu6Lx8ZvR505wd+1USrGjbTDZlCPnrjvzc0HsKQskC932P259nowPGK2QoiVosUdHCLlZSdGx18bVNaMtYS8J83sxGeMMg2HSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773482360; c=relaxed/simple;
	bh=d9YHLNsSIDs5Yi6inbyfPqerSJ/w/2ZQ6McbJuWR5sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnrA/9vTVYfZ8HWi3++IeVOe4zGViQE3v3N+7l3sipu5hV8ZlFLmcBOGfYFfQPEaLiPTupOcY+chBI/pcyBsLfWda8fSs9APqHT22BLNXx4qxSJW8P3guO9QPfbBEXA3Vjer/oJDHUqvxGhkijMZG4GTTRZZmDESB8Mmbg3VsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRodZ3Y+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D0CC116C6;
	Sat, 14 Mar 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773482360;
	bh=d9YHLNsSIDs5Yi6inbyfPqerSJ/w/2ZQ6McbJuWR5sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRodZ3Y+8viHaYpqp5Ht6NG/pAml12hKn9jwZTE31/hAzeA97/ygx20cKtT/+kS6F
	 3QoP/v0pGosFBNkDd+9CBQ7BV7gPA2Sw2fw2M+lS2v82Y3tGweIrehso7/zUdnwqzm
	 H+zr5ktpYMp4Woz1zGyV94ZLmHE8tXkAjQW6q0mfYSVhr+peVaIh68qdj++Qtv/pC3
	 lHUtzDWlmrnMB18nZb/FTjltSoh7+/2RFo5cmDNKOPatK4Q7/276fZDH2SNUlyuNJC
	 uYftkKKhAJ3r21YDd63mc3g6eFPPatW7SJbUX3zkUBZY1j8O4uZTCMWCyNaJuUmJGQ
	 aPJ8yujDEmmWQ==
Date: Sat, 14 Mar 2026 10:59:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org, 
	angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org, neil.armstrong@linaro.org, 
	festevam@gmail.com, Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: glymur: Fix deprecated cpu
 compatibles
Message-ID: <20260314-russet-squirrel-of-genius-07f51a@quoll>
References: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
 <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-97696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-Rspamd-Queue-Id: 3E7FE28C941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:04:39PM +0530, Sibi Sankar wrote:
> The generic Qualcomm Oryon CPU compatible used by the Glymur
> SoC is deprecated and incorrect since it uses a single compatible
> to describe two different core variants. It is now replaced with
> two different core-specific compatibles based on MIDR part and
> variant number.
> 
> CPUS 0-5:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x2
> 
> CPUS 6-17:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x1
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 36 ++++++++++++++--------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


