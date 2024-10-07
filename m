Return-Path: <linux-arm-msm+bounces-33456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A6D993980
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 23:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B01428425F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 21:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFC918C330;
	Mon,  7 Oct 2024 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpppgbJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386F18C930;
	Mon,  7 Oct 2024 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728337504; cv=none; b=aemp8Z53IBoLUIXaMbAnVP33FQtCwRTfZsj400WLwak/GlSBTYB1loWEbeqIVwxnqVVbQvioQIMXZEAjV5xDeyrCg1cPrY447mX9POn34NT8LwqJJiW5roXsK/lojT85GQlB/gYl661tc4iaihYvtSpr7NT4qYAE4YJnnwJwkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728337504; c=relaxed/simple;
	bh=GRV57UWvCNyArwdO8K9Y1agFjqxbhcl7taFP+OQH5JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFaTUfwMGmmdFrxXWeSqX7WTa3ZE2Np9EVZomKp/KOlflL4+ExqgaSs7NxjB21rU7CmJFCssnpQmkxKXyICPXdNf+jJSUcCWFGwAQ9ipkfc//wOLaOCNuulpeoZdo9VafsDR9En6p1FRmUZlM1w52ZvMMvc6ceEiW1YlVrCkRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpppgbJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439F4C4CEC6;
	Mon,  7 Oct 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728337503;
	bh=GRV57UWvCNyArwdO8K9Y1agFjqxbhcl7taFP+OQH5JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpppgbJXQjFbk1SYkjd+DEu+Zr+wAkFZiIdQEsE6Ohy6lcGVt63qgITpxhK2Yzyus
	 uDL05cj/eaThkAocsjemdU3Ebfy1p2cOHykqF9u8HBY5SaoPK9ckGMQtr3w9tliPPN
	 wvywOhAIy5OGXLDgt5Qn3gnPaQ4gRiyHfLdBUxdo56u4vpyNNtfVmCbVjp4MgH6RpD
	 t7vOV4ofoujfKLZWG9eUI9XSqWd71TqeaumE29K7OBbp1zdJ3s5NjzR3RAa8evWPFN
	 YYHJL9xw5i9sXm06fuCpkOcM2Ztmd+PHr6oa0vrCS+HfY/zmQGX8o9ISwmbzV42g/M
	 BCldeeeIHrTnA==
Date: Mon, 7 Oct 2024 16:45:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
Message-ID: <zdcfrk4oxu4eq5cjzr67hunpznzv366kalih7z4htbzaelbafq@ok7rux3nqr3d>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
 <mgdj5xvqby3ftnnhma7dxvxskavx4p2pkzyorg4z3cza5xkimr@sqe4k2szwfbq>
 <87f778cf-0e1e-4505-a0e8-7434316a9537@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87f778cf-0e1e-4505-a0e8-7434316a9537@quicinc.com>

On Tue, Oct 08, 2024 at 02:10:02AM GMT, Kuldeep Singh wrote:
> On 10/7/2024 7:10 AM, Bjorn Andersson wrote:
> > On Sat, Oct 05, 2024 at 07:31:49PM GMT, Kuldeep Singh wrote:
[..]
> >> +
> >>  #define QSEECOM_MAX_APP_NAME_SIZE		64
> >>  
> >>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
> >> @@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
> >>  
> >>  int qcom_scm_shm_bridge_enable(void)
> >>  {
> >> +	int ret;
> >> +
> >>  	struct qcom_scm_desc desc = {
> >>  		.svc = QCOM_SCM_SVC_MP,
> >>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> >> @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
> >>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
> >>  		return -EOPNOTSUPP;
> >>  
> >> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> >> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> >> +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	return ret ?: res.result[0];
> > 
> > I'd prefer, with the additional check, that you'd structure it like this:
> > 
> > 	if (ret)
> > 		return ret;
> > 
> > 	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> > 		return -EOPNOTSUPP;
> > 
> > 	return res.result[0];
> 
> Sure, above looks more cleaner. Will update in next rev.
> 

Thanks!

> > 
> > That way we deal with SCM-call errors first, otherwise we inspect and
> > act on the returned data.
> > 
> > That said, the return value of this function, if non-zero, will trickle
> > back to and be returned from qcom_scm_probe(), where Linux expects to
> > see a valid error code. Are there any other result[0] values we should
> > handle, which would allow us to end this function with "return 0"?
> 
> As qcom_scm_shm_bridge_enable() is an shm enablement call, need to handle
> supported(or unsupported) scenario appropriately and other errors can be
> propagated to qcom_tzmem/qcom_scm_probe.
> 
> Please note, other return values(related to access control) from QTEE are
> failures and do not require conversion to Linux error codes.
> 

I'm not familiar with the value space of such errors, but any value
other than -EOPNOTSUPP and 0 returned here will propagate back and be
the value returned to the driver core.

It seems reasonable to ensure that the return value space makes sense to
Linux, just in case something up the stack decides to act upon the value
we return.

Regards,
Bjorn

