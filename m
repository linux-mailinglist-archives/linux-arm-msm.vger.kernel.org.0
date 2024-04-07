Return-Path: <linux-arm-msm+bounces-16704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D489B48C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C98001C208BC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 23:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3D13C466;
	Sun,  7 Apr 2024 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXlXUebU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EDF3C08D;
	Sun,  7 Apr 2024 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712531677; cv=none; b=j0Dp7njlY7zUPBxTZ0k7Gr8cTCXE3pHFHiVcGZ/V/P8fhnRqUXuKPX1VLia4XcvqoJdZOamkmXfvb0cVfzvqC1yADhsIDdh+ShSAa+5PgkMaAskZ/9nzvz/0vbTp0SiJHR5DcagYyTMDsffNqtyT9G0pIRxL62f5L+X0TZsCZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712531677; c=relaxed/simple;
	bh=/BMAD/yJR2MHiaSVqLdHWB1hpQ0Y8qflUgqPAOQ19a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwJe5dBGVsaI24X3erv5R4ZY0AgcmiaTQI2IzS3xdBLffNONMJZikUfg47HZJyfhtI/ZcukO/5fLnKCKltm+Qwt1j2ARpsm3ygAg45SDUEgcWiDLOI1etwzRwbCri+kpxwqc0qrT18Sf4ckcxQL2c+rx8gXNqHzjwsL21QqABoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXlXUebU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB971C433C7;
	Sun,  7 Apr 2024 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712531677;
	bh=/BMAD/yJR2MHiaSVqLdHWB1hpQ0Y8qflUgqPAOQ19a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXlXUebU/cWiG3dBbC8sBVNX/jTBxX+GSKdK3umBfot9ohodxMv2qF0ysXimesEm5
	 2FALGhROMjwnnxFCvZYgxUVBjM9UzunfsVXRO4HNMovhCae0S/IxPEjeiGY1FTNfmg
	 OFFYBC86p9LvgNJDXqYx5GBKjGBrn21ljwlcdW/TyZk4niouBIOBdtSvJp88oEsgos
	 Mkt0ObXenubwWVK+50QS/jeidiaN+Wx0/H0Ws6zvPdpaYAfDAxQ6kyS6WQHuIne6wJ
	 FVSv0SwwY+BPGLfb1Ehyw3RqhkvjLUs2phinDSKTywQTVL/Msg5f7uUuGA7EjjYciF
	 vESJ9+r53zrmA==
Date: Sun, 7 Apr 2024 18:14:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Message-ID: <k5lgwpkfjjt257aq4tlux7lcke7v2euiegqi5mvevygizlvwo7@jg7f3e5rymmk>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>

On Mon, Mar 11, 2024 at 05:34:03PM +0200, Dmitry Baryshkov wrote:
> diff --git a/drivers/soc/qcom/qcom_pdm.c b/drivers/soc/qcom/qcom_pdm.c
[..]
> +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> +{
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	if (qcom_pdm_server_added) {
> +		ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +				     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);

Sorry for the late reply.

I met with the owners of the firmware side of this and we concluded that
this will unfortunately not work.

The typical case is that when the firmware comes up, it queries the
information from the pd-mapper about itself, so this would obviously
work just fine.

Further more, if another core causes the server to be deleted and then
re-added the firmware will wait for pd-mapper to come up. So this will
work as well - as reported by Chris.

There is however a not too uncommon case where the firmware on one
remoteproc will inquiry about information of another remoteproc. One
example is modem coming up, inquiring about where to find audio
services. This inquiry will be performed once at firmware boot and
decisions will be made based on the responses, no retries or updates.

As such, starting pd-mapper with an incomplete "database" is
unfortunately not supported.

Regards,
Bjorn

