Return-Path: <linux-arm-msm+bounces-83769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66AC91E9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5E7A353C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9223101B8;
	Fri, 28 Nov 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiUqHjyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B53101A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330307; cv=none; b=VBNyJnKLskwIK3rgo9vCVxAGYMGcC5qoPBtcMVWj44dHbbKJh7uUJ2tuedf8h61oKxAnh+PyVbAjz+3tfSih2CwkSM8z32O1F35Pr/xuWBixR2Pqago+C9kzzRjXycUoiJMbhKwEZlw5voicf9mZcFdUI9lXcMPA4FuGkLADxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330307; c=relaxed/simple;
	bh=y7YyltfOK1HZGQNfYmeYMZW+cIIEcUH/VJlODSP/tH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4/eDXPET1HK9e8SMvpU8LxRnGggRG83tlq4yuHNEgPKJc6TpTset4cEqNyYNL/vuHxTQUVlLt3JtEszg5OPmyw74ayUTpYhUjGFDYGagriXcwDjR1rvfle4UGFRfkj3wi8Onap4nTH7SxO1wqBKbgZB9Gw2svqOetE0B/zp+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiUqHjyQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1454273f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330304; x=1764935104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxu8fFmXPVRbVoD/fx+XvNyXn/v3XeJrOou1JkmNFWg=;
        b=XiUqHjyQckKou1Gph+vo3XKYjiLdCGSVZ1ajcP4aMZc63rHxGX4TlwwZfjIj4OAAeC
         t20G8hL/tSrWBFgWMtd38fn3bDCVH0gjeL3ua6oJLK5TKq45QWe3OWdcj8KCar2Pc/B1
         oQ9P0PGm/7U3tJP3EZUppS9kXn2cGbAffef6M7Vd/ZDcbySeLYJHEciwZftqP21TQoKb
         +y+6MM3Px3QR7cdokNK9Qm6koGHDGxI/wbcRJSXFaZAM2mCD/ISK/cXXOiSqxVcX3yE8
         w4kT4QTsM7XbSJe2pIz164XFaP9+RlRrHwrvwfjmBij6NWIOF0r7s48bqwy/H9w/cmVG
         MZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330304; x=1764935104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxu8fFmXPVRbVoD/fx+XvNyXn/v3XeJrOou1JkmNFWg=;
        b=S0i4FOVqGevxd1vIPwlSDAxb7hPwSgvb3MS+ge4XXkEi/JGw0wQJ64mUCb4HrnrpNM
         GMHp78zpYTJmKZ843y5GLAESKN6lnH+FdJVXsOAG7dsLzWcdop1JtDP917YwyXvex1Ux
         dSuJbiPxv60enKe3USYm1Mk5OWyWAfki932MTf15+PGEQxq4664FJcuQaobslkHjb4QB
         fyPsroGuz1TklWDkNQuanPlivSxBqCizS5lYoXSV9moTKQdq19iOb6lCGHI5oT97DRqm
         gYxkRe799dGSr0d++gfo8DW0eVfXSfj8stCLiqQdJg87qZeqkvAu8+ErQjKh3/q6XnTe
         QLNw==
X-Gm-Message-State: AOJu0YwyuwpWk92fqZAvgDE81/PE+VrPTxM2FUSegpTnGbNtxpaJwnzD
	6YT8fwqi4Usx71WT3LpOhQPjWeA+lkBhShnwDfv9YJ7MSzjgdZGge95NG97SdtFf+NJBjHC9WRk
	M/RUVDGI=
X-Gm-Gg: ASbGncso1DvWS3j/ZwPJYjNv1Z4Bt16fzeP3k/71Chu9QpzbVDD0piT28e41cxwHxs/
	pMx08bzv2TJoADcDUykCKI+LtczNbMfu44RqHPjMoMw+capZaPN4nJA0fVbDyB1x1l23qgpjts3
	sGu30fG/qa3TjaJQWllNvWeMH7hbGqQIRD3RI7Fj1AYqZuphs9cK5ztjVvx6cBpnrValQwjPLS7
	mgWUx4idaflnYc3FT3wzmpDrFwFBoy325XRVqlDTBzaOhz3yxzdx9g2Y0QRPu+Hy+8WCy76vxHw
	Vus8BXcqJFsEMivVN88xQplYjSV1Q92XfgFlKQX5VsmA2cvtm6sJopPMAGb1Y5a4UMKXJdCnDrf
	aEkjlTrRgn8Av1zgWhfJ5KS+xvt4nCqEVxkQKY+MfR49ahp1bkQrCSwdH7pH0xcRsAW6xfoEfB2
	TQV4fv/OMbZbShBNC8GChSR9VynN8EJT5ERX7bdPLTlPb7L5vWVGHJ
X-Google-Smtp-Source: AGHT+IHPuIp0koy7rBjnMMzDC2ZSCV1Eo0XBFQRwVw2doZoqHo22+cOgbDjiDAVCWmUog8kHEm5g6g==
X-Received: by 2002:a5d:584b:0:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-42cc12f1d70mr32107657f8f.5.1764330303740;
        Fri, 28 Nov 2025 03:45:03 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c302esm9166695f8f.5.2025.11.28.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:45:03 -0800 (PST)
Message-ID: <8dd9291e-d960-4b3f-b7ea-d8181170f023@linaro.org>
Date: Fri, 28 Nov 2025 11:45:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <TwmK-uURupP5hBnnezZHzRLz5w4IrchF_aST91tZBiqdh8cEJLG2lLnRi5EWP8IHJ6vvA2gpHVuYmQDQoOyX1w==@protonmail.internalid>
 <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2025 10:32, Mukesh Ojha wrote:
> There is a scenario, when fatal interrupt triggers rproc crash handling
> while a user-space recovery is initiated in parallel. The overlapping
> recovery/stop sequences race on rproc state and subdevice teardown,
> resulting in a NULL pointer dereference in the GLINK SMEM unregister
> path.
> 
> 	Process-A                			Process-B
> 
>    fatal error interrupt happens
> 
>    rproc_crash_handler_work()
>      mutex_lock_interruptible(&rproc->lock);
>      ...
> 
>         rproc->state = RPROC_CRASHED;
>      ...
>      mutex_unlock(&rproc->lock);
> 
>      rproc_trigger_recovery()
>       mutex_lock_interruptible(&rproc->lock);
> 
>        qcom_pas_stop()
>        qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>        remoteproc remoteproc3: can't stop rproc: -22
>       mutex_unlock(&rproc->lock);
> 
> 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> 						recovery_store()
> 						 rproc_trigger_recovery()
> 						  mutex_lock_interruptible(&rproc->lock);
> 						   rproc_stop()
> 						    glink_subdev_stop()
> 						      qcom_glink_smem_unregister() ==|
>                                                                                       |
>                                                                                       V
> 						      Unable to handle kernel NULL pointer dereference
>                                                                  at virtual address 0000000000000358
> 
> It is tempting to introduce a remoteproc state that could be set from
> the ->ops->stop() callback, which would have avoided the second attempt
> and prevented the crash. However, making remoteproc recovery dependent
> on manual intervention or a system reboot is not ideal. We should always
> try to recover the remote processor if possible. A failure in the
> ->ops->stop() callback might be temporary or caused by a timeout, and a
> recovery attempt could still succeed, as seen in similar scenarios.
> Therefore, instead of adding a restrictive state, let’s add a NULL check
> at the appropriate places to avoid a kernel crash and allow the system
> to move forward gracefully.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v4: https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
>   - Brought the same change from v2.
>   - Added smd->edge NULL check.
>   - Rephrased the commit text.
> 
> Changes in v3:
>   - Fix kernel test reported error.
> 
> Changes in v2: https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
>   - Removed NULL pointer check instead added a new state to signify
>     non-recoverable state of remoteproc.
> 
>   drivers/remoteproc/qcom_common.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..6480293d2f61 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>   {
>   	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> 
> +	if (!glink->edge)
> +		return;
> +
>   	qcom_glink_smem_unregister(glink->edge);
>   	glink->edge = NULL;
>   }
> @@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>   {
>   	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
> 
> +	if (!smd->edge)
> +		return;
> +
>   	qcom_smd_unregister_edge(smd->edge);
>   	smd->edge = NULL;
>   }
> --
> 2.50.1
> 
> 

Since this fixes a real bug, you need a Fixes tag.

Once added.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

