Return-Path: <linux-arm-msm+bounces-33478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90047993F69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1BEC1C22CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 07:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B231991D5;
	Tue,  8 Oct 2024 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atv7CDrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581361FD8;
	Tue,  8 Oct 2024 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370171; cv=none; b=tBTN98uXYM/vLqkjcKy6nIoahnVjnu6aCiPuKNmbS3WFh1LvT7UbvAHW/E/vaHp0Dh/tuL0yFmKN53oYrhpsaGMSWOKM00pRqsq76sr6kiQZqs6RWRP4VxdLa3XMPjdrzJ4RnnprGm72O+TV6HI1blBL3ZaW2Xs5yswKFFejY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370171; c=relaxed/simple;
	bh=2EsFLNVfwNRhK9yqWJ0ZCcWMrpp4nlYqIepvRI4xp8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujvPNTUCWnFOpw+FiJxRkb3gbUXWJtZZc5bz9CB+YCQXsXsd4LbePC9KJvAmvflaP+IL2qA8ZpAgArns8P/5Kw65iwylnoQuRYDo4MWSFaoyAB7kFhUTLvJW5ekvbUiGa3RXZ4t3kPLT9glktm3iYBWsbz+SdyQhCgGTWVX8BKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atv7CDrS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7645BC4CEC7;
	Tue,  8 Oct 2024 06:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370171;
	bh=2EsFLNVfwNRhK9yqWJ0ZCcWMrpp4nlYqIepvRI4xp8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atv7CDrSSp0bfDKOrUHRPt3x75XirnMoDSR6iIS7qZYEp7fYkPQmyEaazu/6SO4eJ
	 9hsNF+u8oVV2asleI5HedUrNPwRdFCVd5QyFqcLKhX1IgfmAQ45aOxLZWWNFbepmLG
	 MHLTO3eFpatWV5kmCfjHPvyddYlUG9Qkpk45Hqkai70zVsHZrDMZjUmtCdZpSiYQTX
	 MTGmvSTctKGvJ358kjLb/WLHbF8O7I7fTA6CJAwRNbRDJExRa5bD5kvhMUWR4YsNVI
	 KcKciSZWn4SGE2h8EEdpyCBWvq/d15ufPSNqQkq2q1y5qAYoRIMlc6qosUKRXtUeQT
	 9ovlsvkE+hhuw==
Date: Tue, 8 Oct 2024 08:49:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-2-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> +/*
> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> + *
> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> + */
> +#define QCOM_DDR_LEVEL_AUTO	0x0
> +#define QCOM_DDR_LEVEL_PERF	0x1

I could not find any driver using these. Can you point me to usage in
the drivers?

Best regards,
Krzysztof


