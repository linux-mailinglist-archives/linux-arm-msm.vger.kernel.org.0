Return-Path: <linux-arm-msm+bounces-11773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8085B514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 09:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C51AEB24753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 08:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4085C907;
	Tue, 20 Feb 2024 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="e9uNO9s9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7D53819;
	Tue, 20 Feb 2024 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708417622; cv=none; b=i8p91uWHXVYlI+SRd5azJYLhbKcFiJVTB3iMVMkchWUunOrpLRvoskfA/S3p6Ygf7aV0LpVjW6ZVVYh6KBKJwIRDLUqwo+RSkNmu5+1NFkzlos01pED9ADwTq/aJz34qbz6gnOSBK3WGn78TpJg06k8LTP2pDyjLPTKwpADWm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708417622; c=relaxed/simple;
	bh=FbwtcBufwoXbPOYPnUNJ/O5sjaNC9PrMa+OFLq/9LlE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iYG/fUczTpLnQEORFmXF4eV0HQ/cZcMrrZ1khpvNhxKV4kUkhPkmX9dMgbWRfWHR5PMMiFS7uF5bFXf0YGvy4cqpg7EzqqeIjt4JxB7ze6bDJktJSMD4Tq1pLh2fpRf8BgwbBFu8PHOR6eZd+/qce8KEPjtB8LXyYSzzcUOJ7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=e9uNO9s9; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1708417584; x=1709022384; i=markus.elfring@web.de;
	bh=FbwtcBufwoXbPOYPnUNJ/O5sjaNC9PrMa+OFLq/9LlE=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=e9uNO9s9BlPlVK+KiQU0PIEORK8P37I2txeksl/zdJew63C90YrlGcWsm6Hu4Hue
	 6ljrcEcfq9efe8BC4qP7lzSWY4/cJKmXgeh4kh2GA6Ab5pc2t4Cli6eI2aX+/LFxp
	 eShaxJI1uQRCHSUgE/M3sDjBVhoE1PshpN9ZGPZkHhHvRA/Jh3hTsAAlJXuIIqiou
	 /ybXYix9AEHJLFZcrGYmM8qwXF0a9IIvlTEwDgoNad3g+4s/ZKjH9MYInmI9bnlVc
	 LySTN7kZRkolEB7j2W+DWXMcYupogIapYd+ltxsRyKb/3gdFzKFxO54FE+7JBNCSm
	 er/rX3U/+vMS+IV7JQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4bYo-1rbnUP3YVK-001fxX; Tue, 20
 Feb 2024 09:26:23 +0100
Message-ID: <41ca529d-ad0c-40e7-b68c-c90297815bbc@web.de>
Date: Tue, 20 Feb 2024 09:25:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, stable@vger.kernel.org
References: <20240217150228.5788-4-johan+linaro@kernel.org>
Subject: Re: [PATCH 3/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240217150228.5788-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oGPEHuM2HIdXgcEMfwBFL/voM7jpNFUkHFQ+0xcJgl7i8MgwK7X
 JRpaE+mgDDalhXTyU2+1PFOILTsPDZpOepGGIJfCQ/2E3ldh+sgz6VTMBA01/EflCrvIeWY
 X6YhCNZlgsWrsvUtm8o2z+5W3E7+5Yd2k54efbPAD5SQDEAsv4P7H2BQFpKQnAy0uARDOGK
 1wwp3iW69af1k6eyCiBoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dgtWsq+B+98=;0ssw8wp6F6jnkVukgPpAy80HpQc
 B0VMFA61OwPAzcw1oE4HEkJI7Op8/UpgfZD/rlEvXu7wBJAltZnVnEH4QBK3bR6eoqIkHYpQ3
 a+NQ7/veaLawT/cH0RCDP6lm/j3niZpzb0CUvZiz08gIn478ffjixzszvFQ3nwCu6Uk/2cbZw
 1lBdOowsMiRl5XYsrKVcTqXngRFyOQ8SaTtPmk5Ocd6GHZGSPbPWnZhxXYQrACxB3DEfP0zj+
 OgghtCVE1xS7INrVaqaoFlTWicIfb+TO/All7DwO0jxT5TnGCvyj0xiK13IcPE4yfzG5cXk+4
 FXCNlG8KENRG+6N/YDVgCl1h5L13SfrSfon9XMCLUbeuC0bPlYx3ESm7tmaXMx+i9vLlnu3Ij
 cr4ajn/JugewLTyYfpvg3HGWrZDDvY0lgR18LO4Mgh2GkF0TXEwTYk6yeI8ehoClatHTPiMEQ
 UkriLgw2lJ7hxlS4YiX8OJneDycZUdyFCCs+GHFVgXnKzA8WLTuXBF0xhxkgbnmZaLPs9eOfk
 ld8pY8kpC0FpG1LcNjEY0PG9eOrGQfv8CNbfcmm5rf8dQiD/LdlXdJE1rbKpOW/YsnSIcGrEG
 JMfJTj7yCiFrNZJYI+RkVnf+dnQstf10h32TAnwbBfExX/OHZUBI0TH2W5pyXCscDYnThQKHW
 sLphBvemEcnXdJDIkba0ET40K11L5YTJuIuiZyQdVn+mtYfyfu9oBU610S+X5NC9FU2RlEEGJ
 XKH6PwGUwmR3NkZinJ70pekoeQfe9t4woQs0KZtNZDTWe0fhh65IQ6qWmSuccCqTsLcGVsImx
 Eesic4I3yq1Dcu9fB0rDoBFux2rfDY6Ba322mXCTCYqKQ=

=E2=80=A6
> Specifically, the dp-hpd bridge is currently registered before all
> resources have been acquired which means that it can also be
> deregistered on probe deferrals.
>
> In the meantime there is a race window where the new aux bridge driver
> (or PHY driver previously) may have looked up the dp-hpd bridge and
> stored a (non-reference-counted) pointer to the bridge which is about to
> be deallocated.
=E2=80=A6

I got the impression that the change description can be improved another b=
it.

1. Will any additional imperative wordings become helpful?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.8-rc5#n94


=E2=80=A6
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -76,7 +76,7 @@ struct pmic_glink_altmode_port {
>
>  	struct work_struct work;
>
> -	struct device *bridge;
> +	struct auxiliary_device *bridge;
>
>  	enum typec_orientation orientation;
>  	u16 svid;
=E2=80=A6

2. How do you think about to stress such a data type adjustment?

Regards,
Markus

