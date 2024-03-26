Return-Path: <linux-arm-msm+bounces-15276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F284488CDFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928A71F36028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B057813D252;
	Tue, 26 Mar 2024 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YxSVHsDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC013D295
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484001; cv=none; b=tTjeGkxx67mrV54pVdjSjzsSjfKgLXIBYBDa491U7e76CC0CgistMCJ5u940wNXse+t6d3x8mjLXaWqkvWlLrIsWRgHohskU0sUXAoWuPRP+b+mcOPOyUNivMOzptFUuQ/F7uTHjdl7sbKpShmaiaN/Ds9PBvCTh3iXepxNxQaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484001; c=relaxed/simple;
	bh=btunXKwgkufCO7HD+m8VJEh9e4JqDOX4/d3qyOulTA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovvUo4qX2DRKvhiwWzBeT3FmZxvoT5Wbk6p9wIM1gYusKS+bjf5E0bt4vDvJ1iLGOBnBYCCc328+E3jKcpigtlHcNxVNCK92ZUUXox23y0OaEN8xK9+k4Db600OcHE92WswqoN3fO93TpoROdmCy+hTU/JkEhZpWijjvg0r57ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YxSVHsDT; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso5911084276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711483999; x=1712088799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UbYSMMZKtzawfJDJE4cir49VqhmCQiE1LJhdXx2FwYw=;
        b=YxSVHsDTPGIouqPy5YnQfc4NLv2Xe7U54N3RH+K8OaERQL6XR1h6YWhMOR2y4jM0Hj
         4/e24S25rukMeHVEGZqJoC6Sn8I/fxSYRCXRvdpRZozRfRk2DdW1oQBd+R5dcAIkZI1d
         hvNGH2q4A5Y02FzS/bb/ui8Rbbi5NWPknBqc4tFKzHQeM12ou1NSXTLT0MqhI/1FHq6d
         kakkthDG3QcO8a4CwZWGnjPGIXWO5NPy8Y1H3HQvYnFkAq8h/THE+Yqehmfg47KLAZ+s
         2UatPvhX5rUQPzvtc4EA57f9CkykU7YyKjBWguXlHImDRpicAQgFdXSk8v92G3ZZ1PMf
         5Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483999; x=1712088799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbYSMMZKtzawfJDJE4cir49VqhmCQiE1LJhdXx2FwYw=;
        b=sZlSMO00czki58Acwz24TAVZkcQfb9OAFD/lEMyZM2TyF2lKguK0A9jsGaBPaeardm
         zLDfbu94sotBcG+kkZ8XwOzfb/y6Tn69cXi8kS3RaOpMNlFh8OdumOXoqmGSxow9moAQ
         jYMfsyKz7jQPZ+WZ/hXdl9p/sal9f2ScBvXW5uoAupEtdRy9pnbLLPu6Dkn+OfjDIbKO
         StzZ8olyxtgP96rFRG+NJjkNKApMKgq8s+HMAaEU9RMylai+agjlrOciQNAPI+Su5krE
         IRR8DNJqobq8zMb0MViFCAEXm+w6s620YmGiFYlKBNhgf6vRPPicb3kre4UJD252ToDV
         yIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBE0AkcG7BenYnd7FMv7XA+DK3gcjSZqhKgz3nQRmgxMA/vQAr+Nu2v2Vuwk5IMi1pc0XYFGYOpUqf97fBzNdBqryPrq736SdGwg83Zg==
X-Gm-Message-State: AOJu0YxlHE+iYaj94nwQHhRM/bz4EDXNepBoUU1QFMKfKK7qBPgx/LPj
	LPoeKb8QURIHKIgOnI0jIqpmilKm1GeLaLFiYrXpIbBS2oz4M0HG1hZw0HaafWI6sphipmze1nn
	SRSOqvansieF/K9GvRsg8SKOdPxFLKADgNKUmFRK8u4VlgRXF
X-Google-Smtp-Source: AGHT+IFFX483t90XKNX+OO769dAgkkQ3Mdks7uUfVPLNLZ5sWIKnzmWcN1zXVl0obYk/iP34XbMH5Mhww+pfc58YeU8=
X-Received: by 2002:a25:c7ca:0:b0:dcc:623d:e475 with SMTP id
 w193-20020a25c7ca000000b00dcc623de475mr3650511ybe.30.1711483998811; Tue, 26
 Mar 2024 13:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-topic-rpm_icc_qos_cleanup-v1-0-357e736792be@linaro.org> <20240326-topic-rpm_icc_qos_cleanup-v1-1-357e736792be@linaro.org>
In-Reply-To: <20240326-topic-rpm_icc_qos_cleanup-v1-1-357e736792be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:13:07 +0200
Message-ID: <CAA8EJpo=JScW9ksFtq_rzvJKue_1bVcK2oiA5ZfjpyD=F3wNZA@mail.gmail.com>
Subject: Re: [PATCH 1/4] interconnect: qcom: sm6115: Unspaghettify SNoC QoS
 port numbering
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
	Shawn Guo <shawn.guo@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 21:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> When I was creating this driver, my bright mind overlooked the existence
> of desc->qos_offset and decided to make up for the difference it made by
> adding 21 (0x15) to the port index on SNoC and its downstream buses.
>
> Undo this mistake to make the indices actually mean something.

So, what is the meaning of qos_port?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/interconnect/qcom/sm6115.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/interconnect/qcom/sm6115.c b/drivers/interconnect/qcom/sm6115.c
> index 7e15ddf0a80a..271b07c74862 100644
> --- a/drivers/interconnect/qcom/sm6115.c
> +++ b/drivers/interconnect/qcom/sm6115.c
> @@ -242,7 +242,7 @@ static struct qcom_icc_node crypto_c0 = {
>         .id = SM6115_MASTER_CRYPTO_CORE0,
>         .channels = 1,
>         .buswidth = 8,
> -       .qos.qos_port = 43,
> +       .qos.qos_port = 22,
>         .qos.qos_mode = NOC_QOS_MODE_FIXED,
>         .qos.areq_prio = 2,
>         .mas_rpm_id = 23,
>


-- 
With best wishes
Dmitry

