Return-Path: <linux-arm-msm+bounces-83998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A90C98361
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 17:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81E654E1C6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 16:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD5C3346A4;
	Mon,  1 Dec 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzfN4wmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6ED328621
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606042; cv=none; b=drlKWsmWwgXLmtqY6dpaK8JJ7uyqnPM5b3CodE9R2elFOHfVCz2e8Ck2JDyMLBWAqttFPMR5/2VWH2kWNeWsszwqG0DXIrghuTSQHh7PVBp7TYJz9hJl15iwgEFlhQmWAZRyvDcPkJyv6meW89tkygef+BzzWlEYwtLJSulW0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606042; c=relaxed/simple;
	bh=cbTq8BHjRToGTEY8Sx66KTwTfnaIXn5PKzRscbZtMbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4RQRuvTWuKb0j887KQ6mc3FwOwdy3C1CmUhS3UlXA+zQlgWOoEfBPJT2wuSOKRyw8axsRGSzIQtbdw8fDZpuEtiFPAsWi1ClDclA9N4fr3FoTQ3J/FxJR7L7S/pBSc6Q3/Pjm9uxdPvAknBrkWImrWK+iTNU/10HNqHaHJSeNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzfN4wmN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so4244687b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764606039; x=1765210839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=DzfN4wmNhudh9Aoo99BlK6Ljv9vadO0w7/OlP7wg/MAmTyeAD2fMfjZe8RJoqcoAx6
         xHyFEXNCUOVrZAuzr9iWeXwYbotQl3IzUKSnwYxDfbse93Bex1paum/dJiMpt7JfbGqY
         mQZ/+CwybL2tCvzU3T5SUozd98yu4O5/p8XxGwnTeeC0Fe8SV5Z9qgjZWOHoUIbTmWlH
         XyrMfBcZZfTAIaX7hRbO9zdDygKjrNsXbOD0OyQYzyPTdis7RHTTAKD612SAYh620O4N
         GOs1DPvReKrst2BeaUiNzaawm+ba03LT/oDPzfdCq4FNFeGE6EMZhM7HMKjX0fOYupPM
         ORaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606039; x=1765210839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=p21FZKFspXRu6YbGe4FADGrL4L6fpgnrTznsgn6rPtX3cfHazBbx1gLs157p280cor
         ZYnIZCM4mAAlPEbYczpy3ZAZR9YdkI/VMXHMVESE5mXHNWUMProoiHcjPq9eN1QsYJPp
         nuQHMXTYC7uMyWjHCQrUKNLju3mkjXlspaiEqyis5ivIyuSm7hVsRhWsgK26CqSzeK0s
         1KnMNHNQFq+9JSEmUXSFd8Ut4xtrYFvDZrqrfyYySd0uPMmvv6SqMgNzuIWq7VWTwnjh
         YC/4Uf/1BViawplw/BcYQ+VBxi5RrtDjguu22+31IjxltZCgvlzE9ro2JgbpXgeHOYoE
         aSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoIs19BxWJfgwdt99gbj9nPmWGJhqDf22Ack9r3kzxEZzAZrH9ppA/u3Lktxsxme2Lp71xOy9DWZWpcHww@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nqjqjBqwFl4fqJtSACkBkYm200dN8/AAtNqfKVCnratvIKcV
	IW4R85VlSR75fAxQ/TL9Y73NpRxyes2KVymHgU+KQCjhA8wDpNFGI/UcEVinWp4UJ+E=
X-Gm-Gg: ASbGncsGHS4EnXDGIXRGTT7zZ/nQuS6i1vuCzFw/3dU46MY393TVy2aoZdpJg75i6PO
	7CDLZIdYy5rA85qghv2ckyrkKOpNlEPk/pLfsLWyrlqcJU2hSunqFk6fqA434uFOZEk+TKO+1P1
	d1bdUTz8BbPmS2oSS2hOOdD2og4Zc2xcDnG8YJTdw4h3Bor9zlqoMUKvBE9g6MlqH+iFQ93gVcU
	aZMb7re8cBDkkcaSHFHDLg1wHQVE3oY1zXwz0LSivOsrhXopR5M0VtdqdCXDGw5Zkg+8+GOIRlA
	dh4Px6oUP/xnWfgUkjyJ3ARPs8gajzLiGPd78pzk/jqzVVxHFyWNKqR7bS+5FGFA/mbM38S4oZ+
	R/vxJjvel6d6fWZvgLOnnrKEpjdI9FqFzcGgMeZ2AJXuBLVWLQxNNobdxxjebNQc/xCHiwIVAsg
	maa+yWt9YNJigDmw==
X-Google-Smtp-Source: AGHT+IEC7gGRxUyVtd+YE469cDLd2n7LeD/hmDQKTfHSUTd0/7SmlOv1H6YZTofFyUN0T2uY8DHV7Q==
X-Received: by 2002:a05:6a20:2448:b0:345:e30f:d6da with SMTP id adf61e73a8af0-36150f059e2mr47497364637.37.1764606039144;
        Mon, 01 Dec 2025 08:20:39 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7234:1ea8:3e35:6ee3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm14161217b3a.33.2025.12.01.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:20:38 -0800 (PST)
Date: Mon, 1 Dec 2025 09:20:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Message-ID: <aS3AU0gEEOvWs4Uw@p14s>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>

On Sun, Nov 30, 2025 at 01:36:07PM +0100, Krzysztof Kozlowski wrote:
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> Also, first patch or two patches could be taken now for this merge
> window...
> 
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
> 
>  drivers/remoteproc/mtk_scp.c       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
>  drivers/rpmsg/qcom_smd.c           | 10 ++++++----
>  drivers/rpmsg/rpmsg_core.c         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
>  drivers/soc/qcom/apr.c             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h |  2 +-
>  include/linux/rpmsg.h              | 17 +++++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
>  include/linux/soc/qcom/apr.h       |  4 ++--

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

I'll let Bjorn decide if he wants to include this in his upcoming pull request.

Thanks,
Mathieu

>  sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
>  17 files changed, 64 insertions(+), 55 deletions(-)
> ---
> base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

