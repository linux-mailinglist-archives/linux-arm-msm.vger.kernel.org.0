Return-Path: <linux-arm-msm+bounces-44133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D1A03F7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7AE31649C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C588F6B;
	Tue,  7 Jan 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="op/kj4Zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0F6136
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253635; cv=none; b=GHlm7KnIkaYX1EDZ3CjL6VkTxw8vlclXFZJPelKxdW0nY1UkC6IZthBCqrQGc7dmZLWOAZNcCEoEoTT+vD0MU8EBQlMrC+2EU3Bg6JoporLGmYyEKXFa+UyJ6GNHxIb358YWsWuvoOZR+1QqEaTJxU7Bkd0CT50mDjM35XtDK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253635; c=relaxed/simple;
	bh=/wnUtg34NNW0iCqnmbzVI8/wUL5hgvWlZUtL+e+iG5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkR7jL6XnitC+nZY8KkS42r8LzF48/IUAGxkzXZaiLkMurh5B4LbP3sHvH/LTwXG9WfGfmL0coCqJy/w2BDwG9u+7r5WDMLtWZyXV9Hy0kRmnLdurOpw06qxNGaPsSTcmYAD2Tc7CbZK0coK0kQQU6dAamDzfJCs0KFCF5IMYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=op/kj4Zj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e399e3310so18097022e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736253630; x=1736858430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RQrJpIFyvCVhXG5hwSbzvfDihOKahqIxy2tIWPOeMI=;
        b=op/kj4Zj/j6KfFJQRQ7ATCqF7ncbJTn+bosMPGKtj/YOdcDvuvYYIcmvJdrmEF1Q6u
         Cf6ERIt73CMJFwhKvIEP6XWIOOj+/Uc2bqdoD08CV/2jsGiO10MEApONMzAs8K+mEuLz
         pPCMWsP3w7PFC0OBpjfdktaJ5ZEI6UToRHMMXsr8kpykb+ttqxcL9GyatwQE+Ppi1ZfY
         yVS9ZoH5LGZunuSI5aclrNWqHLUHti1rbsOECd0o7DN6SboEIVNWgmtSl9kAc/was1GK
         7k/fzOjvdPps/zjUM4/ixDc4vck2PkWKBQmz4H16zTwyIzgCm9xED+SPKQF2VHi8ZQEO
         XjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253630; x=1736858430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RQrJpIFyvCVhXG5hwSbzvfDihOKahqIxy2tIWPOeMI=;
        b=GO11q3ag+rUy/4B5tSHupHSKj9bR/EBOoCUudbjYOCDAJiHnO4tEihm08MjbvublZp
         bBhYHOv8zAazScp/hd7chQgHOgiI/5I/bAzwjeQ2c1R172kiiVI/Z9f3WqHEVekIESRO
         LxgJzAfZ/VJ/5KTcJ4mqZvaPX3brQ4sBaFfrhmjznxbhZ6cnkFPbd3EX3vtLLNrqRClh
         xmDw8G/vVhfMRPS0210xzFf/NbPjHSPztwl3UHZSaGcMcCkoCs34IitGOxs29xpe0t9y
         JwxARuzBilgRCF+EKlaAyUkK3ewmlTtkx4i/YhBXoUB/7wU/kaBTpuuFl66YxLHh4Dy8
         HzNg==
X-Forwarded-Encrypted: i=1; AJvYcCXDQD65cmXXwrnqWj3lVbxX1sbCWL+/cgCTdw6UP+2TtuZnXcIlrPbaimfGOs1g+0KO+Mn1+AFuoLANgX/D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xeRwCNYgnuA5Id9jfwGZyMMothjpsEJXm6Y2/kPEysuQQeAS
	3rfLWlWeNPdYHRGwIJDOystxd331dbgIo0qTlY9FSazsjm4tzCjdhcWrvqzEFf4=
X-Gm-Gg: ASbGnctWLMVMerIsnhXNHrw8nvNrtONicl2ept/e7HE74zWb6QXh6zcOghU0Yxl+/aS
	q60LLYJSK8GgJHKMa1X4St4uxnFmLpZ8S17/ZODY+vWjfno6uVAPNjALQ8ANRedArvtoTQZCWFL
	xyuF2y/EqYRVV/csrM/Su5nxN8IGItHVcZpk/AlH6wLNmSEYriMvArP2WuJM/f9srw2gc1D2UMK
	5QDVYIz/LZ48PaJfP0vjeoFBMzxSZIxn6RslWOJ6p8c3q0Pt2pFiCg782PGTguybfzYWAblxpZj
	rdilFureEH6maY3URRBch6UDtvVmNTkmQA7A
X-Google-Smtp-Source: AGHT+IHfLD22gegeW5i8N9NeV37bATxX164JEcqRl4NdlxtVuibI0QC4UoWYNE8FI2iEShO1rDv3dw==
X-Received: by 2002:ac2:5681:0:b0:542:29f8:376a with SMTP id 2adb3069b0e04-54229f8377cmr20213326e87.36.1736253630513;
        Tue, 07 Jan 2025 04:40:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214b5sm5231705e87.187.2025.01.07.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:40:29 -0800 (PST)
Date: Tue, 7 Jan 2025 14:40:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix an OF node leak
 inqcom_smd_register_edge()
Message-ID: <wry5yiqbw5bkqtyibh222wish6o2ufzinh4kicomirdd3vt2bn@lods4lgjvytk>
References: <20250107081823.1682549-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107081823.1682549-1-joe@pf.is.s.u-tokyo.ac.jp>

On Tue, Jan 07, 2025 at 05:18:23PM +0900, Joe Hattori wrote:
> qcom_smd_register_edge() leaks an OF node reference when
> qcom_smd_create_chrdev() fails, since qcom_smd_parse_edge() sets
> of_node_get(node) to edge->of_node. Add of_node_put() calls to the error
> path of qcom_smd_register_edge() and qcom_smd_unregister_edge().
> 
> This was found by an experimental verifier that I am developing. Due to
> the lack of actual devices, no runtime test was able to be performed.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/rpmsg/qcom_smd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..6982015b218d 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1509,13 +1509,15 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  	ret = qcom_smd_create_chrdev(edge);
>  	if (ret) {
>  		dev_err(&edge->dev, "failed to register chrdev for edge\n");
> -		goto unregister_dev;
> +		goto put_node;
>  	}
>  
>  	schedule_work(&edge->scan_work);
>  
>  	return edge;
>  
> +put_node:
> +	of_node_put(node);

please put edge->of_node to make it more obvious what is happening.

>  unregister_dev:
>  	if (!IS_ERR_OR_NULL(edge->mbox_chan))
>  		mbox_free_channel(edge->mbox_chan);
> @@ -1548,6 +1550,7 @@ void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
>  	if (ret)
>  		dev_warn(&edge->dev, "can't remove smd device: %d\n", ret);
>  
> +	of_node_put(edge->of_node);
>  	mbox_free_channel(edge->mbox_chan);
>  	device_unregister(&edge->dev);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

