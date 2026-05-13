Return-Path: <linux-arm-msm+bounces-107469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIJSLZrNBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F523539B99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EA1B302F360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B103BB671;
	Wed, 13 May 2026 19:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhagM5V1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F2C3BB13B;
	Wed, 13 May 2026 19:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699391; cv=none; b=Pft9n/qPT/ADKtM8etJHlXo9sZoceRF0YzVscaF1cXgo1dRbAJgfKBGQQ5ctsypKP3Adfg8CbMWuOfQfDyGvoLZrXF3OmR3spHno07AjpNBRsJmvw9lVSUFFNwDWUr6FlzGQStuRl5/wfl5yAkl37uWfQTXMHweakBowGYHN5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699391; c=relaxed/simple;
	bh=DO7j80Q3U1LZeciSta6B92mH3hWTwiFdCzjIUbZF51g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EU1XYV9llcekkn9/tbSE6uPBS1lTRDdLJoQIOZ40uhshRC8atyNteFhkH0YgItz6CxRtMyLIQ8CqrZgE1XT5JQIwVkdPm8uqtkyPn8gpySJzdnMprjE4Q7922FymE9ZO1EE1FQTqbBoJWSc50l4UbZv3PnaoBLII2KBYqhfIbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhagM5V1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678E3C2BCC7;
	Wed, 13 May 2026 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699391;
	bh=DO7j80Q3U1LZeciSta6B92mH3hWTwiFdCzjIUbZF51g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhagM5V1X7UqR95/8jzbbR7PAYvwI1P3jELAJioSs4utC87syl0OonX04d+ynv0X2
	 cQm8uIvnNZ0bHNadVOsms+xMmaKTpCYdbepmFKjsEI8mXd8WrBG8Uyh45n83/r/+iD
	 VEUs/nzLwBm6WlpTTkugOG9IUhfTBZp7Ac2x2Pb9FIhFLkA6jwI/4mnWcG0EhIlmEG
	 OffYypcmLx2Svv77c6ZTEX00rH3NEixHZESggmgXQUhSXKbbeKfjBkyTHR0lO0GZBy
	 HmOQnPi0FdQX1L5CPcCjTrXdSOiioF5+bNotI67su+QLRDQ/Mk/Y1qUXh1BS9cUab8
	 lTqSAX3EbiQug==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths
Date: Wed, 13 May 2026 14:09:28 -0500
Message-ID: <177869936438.1496622.896099724549747289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-sm8550-ddr-bw-scaling-v4-1-5020c06983a0@gmail.com>
References: <20260330-sm8550-ddr-bw-scaling-v4-1-5020c06983a0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7F523539B99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107469-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 30 Mar 2026 16:50:20 -0500, Aaron Kling wrote:
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths
      commit: 3f5dcc05cd33e85e897571b4e44feb06f5399b68

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

