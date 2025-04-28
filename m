Return-Path: <linux-arm-msm+bounces-55902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC687A9ED2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 11:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84323ABA5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BA725FA29;
	Mon, 28 Apr 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfL2A6KF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0525F780
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833220; cv=none; b=SU4/F9Nrb9wJLD51zvQn6WCsNmq26K7bN0HlUgjn+xb7h72ONHe0f8u9bDpFcmVabraTw5RoVz2an1X/uGuRWBV0WDKCyjjwPpoRfwacKXBaVaLiGAgt+uT/Ht7t13Gn/5VD8mFWibn2VZu8GSfdlDyGoY6/OV9bdiwBDn+2Qkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833220; c=relaxed/simple;
	bh=p4kNQdwzmDnZta4PbgZFZq/U7oDnPl8MzQlY6H2Scpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1aW2dhgI8j+tHuvJhzPv+Sn7zcOXhSQOgdvjML7QjnX423H3Az8mJSelWLmkeaApVAouPN/SLkcMUedNbT0efKX46hqbIOYHfyYAxCKsc2EavbGC3LvmMfhkdI7rLRjnPezVQ7ujh2wz5TVYmgkJqU4BB7hhRJIHCjiAMY7ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfL2A6KF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3050825f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745833216; x=1746438016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/tZd4Ypk5BJk00OTo7JvTXUhxLykKpGhTfHWhdUsfHI=;
        b=KfL2A6KFL3AMx8D59wiXmSEln9e363SZI7GhY2v0eq0EjdfZk2Ru6wFuUIFTmv6yFV
         B3NXKlGnXjtPBtp/kaFtMVovlJ1xbqOY9V28wpsZh/+YSMgScR+4GkGkDtqSt29dqrSX
         MK4eXdXV7s86RvywP+QLar1+/rOHHe52egXH/hcJZFl/E7mmoowGtBDmMe5imkx8shl6
         rmN3kr8hLVJTSbMi1ajwQl1cPkjkRzE3T6ljayNsdJA0nwkGHjYhbV+pcPJqFazMB2Qa
         BbzSZOnGcn8OFmDMQHvOHW6JCeA8dRXc5V9V/UMrXh0xxHq5XzsgngPJLXoTDXgTAqdp
         pUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833216; x=1746438016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tZd4Ypk5BJk00OTo7JvTXUhxLykKpGhTfHWhdUsfHI=;
        b=KrLc08XhsakvzPEgXYOHpm89FTLXuEq4uGcTE8qP+lrh3DNBG7D0QJu8aRdWojEbxA
         gB0PFmvvdn1VAOiDQjsWrqvv1aJhOMVCJONGiAzPZmCTkfh6KnsKi1mdeF9GPtMJGDZK
         QBc0ovoTffUmKgUzby4egUMVdU9Nn/mDWzxbZrSSUVL3bMYagoBXyU8jEt9aUDJDjPOL
         rkiVWOxzspYBw1CqkWi6pXm1HB7duVqyUCqIed+R2bK+03FKipS3kcjsvIts9O9paqRS
         PWvPmN3ZzbNS3w3ATiKJgLDoTfWceYIKks759GCMqxHMy4m7H9NCs6kAOUsGTRYZ5u7i
         FcIA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ebo62/EqZA2dtlAipGOR474YuCIOiZYTuH2RM7fiqXekvVL4/NWjJbmjMOt++kyWfX0hvvdaNNNRc1X1@vger.kernel.org
X-Gm-Message-State: AOJu0YxKo5jgQgfCcH8VwYf2mx+o3MU0rHOcxzggA92iGOW66/sucNT0
	+qf5dA3BZ1nXY5Bk2NB3DI4H9zm2iaIKakii+7jx1HiaoOtuIkGdTkTHFUfOloI=
X-Gm-Gg: ASbGnct7GexlRE2GMTdqDdY8VzbAmnVHNXQFLAzR6YhiLNgOFTglYRin6cJ7HBd0lGZ
	IcN+a5k8ekQ0b0LghnBAKmtCS//5BpI3ThnH6WTnti0CIXr461bm8wOAdYgAXctsne4x/yWyZrj
	PHa1EsQULp88FnLsOt8cklxLd25T3irgzOW9x7SGp/BlpsWSmkZqV+A7QTXmK07wQC9jNvwa0yX
	eTmmI760ZaEp7wxOSo124KOdKcea1G74L5O2o+Cmn7v1wtvOKlTyj3tXBltmfke1PvgwS/B/NTI
	+3/v0CM/96swWMahHS3Bsi8fyPrZo1RuGLI0CGMfWGzTwg==
X-Google-Smtp-Source: AGHT+IEmllBzyXjLLf+kiGyB+WclUcZwpuBSk7Lzu0+1JVWeTqkNy2mJ6U8hjuYfUNsLgR1qBxihEA==
X-Received: by 2002:adf:ec87:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a07adb1766mr4500559f8f.59.1745833216549;
        Mon, 28 Apr 2025 02:40:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca543bsm10716844f8f.34.2025.04.28.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:40:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:40:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
	20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
Message-ID: <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>

On Mon, Apr 28, 2025 at 02:59:02PM +0530, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 1ed798d31a3f..cba71b5db943 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>  {
>  	struct iris_inst *instance;
>  
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);

I feel like it would be better to do:

	dev_err(core->dev, "received system error of type %#x\n", pkt ? pkt->type: -1);

regards,
dan carpenter


