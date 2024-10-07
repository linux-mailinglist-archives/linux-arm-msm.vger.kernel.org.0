Return-Path: <linux-arm-msm+bounces-33302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A069922A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 03:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCF581C216B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 01:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC3C10A2A;
	Mon,  7 Oct 2024 01:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEz+9DuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF210A19;
	Mon,  7 Oct 2024 01:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728265211; cv=none; b=NWaV9wvJ13AeLY8QYIyXAkMNOKZGIDMRLpsOuosGrqkjp6liO8xgA7xEXS5qNgiBprILOFvavhYY3fAWEtYWT0Rr8GF4VXtcN1pBIHH2Myb6PzsAm9WC2iG1doWIp2j4zhmyn9xJQfepGmF8gHIrtSAK0YwajH97DKseAtTJZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728265211; c=relaxed/simple;
	bh=A+b1tLpCzy+rPykLVYRW1olrcY3QatzNY+BHX1OgQs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekQZnL+HPllX9IQGkxowIcSHj5BpJO38uTWiJgd6bJRP0uKA4Jn3e7tmXeiEGRkYDm+l8j5yrd5uuzqQCFqGuBlQr4MP8N9IP0kWiL316LbPwwNVZuoMc6Z/qiXzj0Yqdr3ERMZXO7PSFiiFQP1kA+RLuYrPPoo07affAZgyK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEz+9DuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C74C4CEC5;
	Mon,  7 Oct 2024 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728265210;
	bh=A+b1tLpCzy+rPykLVYRW1olrcY3QatzNY+BHX1OgQs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEz+9DuN1heMTbivcfQIGchHP7dm87Crzwa5JcBKRsWzKgr/5/RcDk7Ew3JWXAWOk
	 QaB3HFsI/wGb98Q6YkU/UIO7gkkTeAL3Gg++wwbKvN7MamuP6v8niUjMZknP4bhpr5
	 0fyMkPvM2LutoFI4P4f0DZ3SkUCibBwTuDxS1jNfckY7hNIRgbtwu4IcvzFjkTmG2O
	 jA38LA6cIUGaspbv1kh8KdBtYNEQ81qAOM5jxVDQ5kA8xizWZOHWoWuSMqA/+Tofv5
	 s8RsEmHFevojqtuejQY2AveWIB5Z01zRFTWH1NTDVtgyWEqTu5S94rYk38Jz4oVI0O
	 t+sf/Bdw+nQSA==
Date: Sun, 6 Oct 2024 20:40:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
Message-ID: <mgdj5xvqby3ftnnhma7dxvxskavx4p2pkzyorg4z3cza5xkimr@sqe4k2szwfbq>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005140150.4109700-2-quic_kuldsing@quicinc.com>

On Sat, Oct 05, 2024 at 07:31:49PM GMT, Kuldeep Singh wrote:

Please shorten the subject a bit, perhaps:
"firmware: qcom: scm: Improve unsupported SHM bridge detection"

> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Currently for enabling shm bridge, QTEE will return 0 and put error 4 into

s/for/when/

> result[0] to qcom_scm for unsupported platform, tzmem will consider this
> as an unknown error not the unsupported case on the platform.
> 
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> 
> Change the function call qcom_scm_shm_bridge_enable() to remap this
> result[0] into the unsupported error and then tzmem can consider this as
> unsupported case instead of reporting an error.
> 

Sounds like we want a Fixes tag here.

> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..620313359042 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -111,6 +111,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>  };
>  
> +enum qcom_scm_shm_bridge_result {
> +	SHMBRIDGE_RESULT_NOTSUPP	= 4,
> +};

This is not an enumeration, but a fixed defined constant. Please use
#define.

> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  
>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
> @@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>  
>  int qcom_scm_shm_bridge_enable(void)
>  {
> +	int ret;
> +
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_MP,
>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>  		return -EOPNOTSUPP;
>  
> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> +		return -EOPNOTSUPP;
> +
> +	return ret ?: res.result[0];

I'd prefer, with the additional check, that you'd structure it like this:

	if (ret)
		return ret;

	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
		return -EOPNOTSUPP;

	return res.result[0];


That way we deal with SCM-call errors first, otherwise we inspect and
act on the returned data.

That said, the return value of this function, if non-zero, will trickle
back to and be returned from qcom_scm_probe(), where Linux expects to
see a valid error code. Are there any other result[0] values we should
handle, which would allow us to end this function with "return 0"?

Regards,
Bjorn

>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>  
> -- 
> 2.34.1
> 

