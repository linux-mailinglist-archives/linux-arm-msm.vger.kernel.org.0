Return-Path: <linux-arm-msm+bounces-111642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dMCIKhUxJmoUTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB86525E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:03:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XH3EVETY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N4XUx1dM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111642-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111642-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B13633009CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38D630D3E5;
	Mon,  8 Jun 2026 03:03:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07231DF75A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:03:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887826; cv=none; b=unYUlVUpxBHmg8KVunhc/p+2+KOcEXBwuqPl+6rHN2i0biZrdaFVD98shd7zjLcUg00qpmukpPukUnmCnTqFCvBv2ZoAkwVQAx9MYctgAQNkuIYqgPUe9VlgtLBoAKBCN3va+iK5z1o3tfTe8uZy963Oc37layz7kn6xPO3v4q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887826; c=relaxed/simple;
	bh=RedlagW/PvjjhqDVG99IQ6d5auiFjaTKFCx9huap3fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eoA9lEVHT6wuAv0E3GgiGzQg+BI+8u0BPu3Hy3fuaWZxZyPZr8ArvPnPBUDHWuSLBX3S6DHiiDeyioUVChcXbAEUQ2BluhiWgFCGNo0RTPniEzzQj2uJJ3oM02AHAZQ173pLSnyYQuH+dS8XUzhEeyV7pZKajjqIngEcHEVKZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH3EVETY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4XUx1dM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVwR1572480
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m+4ZJ7/L63oNOlJAm3sJKbxb
	wT3OhoVPYj03caoi2CQ=; b=XH3EVETYIYlkgIisdIlOO6cZDNVTHCZisC2YDeNo
	iYkkFKXypOxHMAWGnNipBABbbDG/m7gJIYGfdX59LKXm0P7+l/uAR3RfNVCuGMFb
	wlNbyQK+NbJqp17WDNwroiCRy361/piheME0/oeI+C/4UXsSs8awfPjyL/QKiIgp
	SYg1AHZcA2GzGXH5ec/t5lq3UXuo5hTsu0kgvbIKCA8+3xQjbFzW75wjCU263pbJ
	+Rn6ofM+AgRr4LcVtIGw9yW+ih5EMeU7QguXUcBOZBE0ce94b6Y7bkujnIn7mtzD
	K4RdU+qRdjf2+KW4d/dEznXyx69lW4x3xOn5RQPIzUuUBQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wa2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:03:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ece6adf0cso3245022e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780887823; x=1781492623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+4ZJ7/L63oNOlJAm3sJKbxbwT3OhoVPYj03caoi2CQ=;
        b=N4XUx1dMiF9pJ7Ll7wnDGQcjqwMK4SQUPaLXAvt+Oi6uSvID6+caTM11xj1X4DMlMH
         9yhoiXvlMfroNd60y48BlgBj4IPxerYRJIfuwyFZ2TOY9NFzeNc5SwGnrqJLQyfZqV/t
         1tVC/kNzsf82F3+35ebGY4y7MEmP9Z3Kzpg4JM5WXUE/QJPnKulE/hxGudC2Z5Nvna34
         +jg3B77CO/ImJbU4RlVCoNzk5zGgyTUWIR9JudnClAMDBrM5c9hGZvM4bI/wz5O+V9Ad
         +MJiHZ4dUPf9IUsF3MV8vOwQgR9e61DxnCM/CPGCI5oF5qGejihzVXJNIjTLsTHZueBl
         wGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887823; x=1781492623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+4ZJ7/L63oNOlJAm3sJKbxbwT3OhoVPYj03caoi2CQ=;
        b=i4jsNQYCOKW1I+Ch33XaYD4olEFViQJI1uVwSvqZjLHWhBUwSMVhRt6Z1ISUe/kKV+
         /bwPBHvjLg/4yK6BtiCm8e4fnFAB9YExpBwQ0ky33ilCPYlKk4qv5RB/zFIfZUxWCN2W
         4D4mR2XpDksGTWOibr7PACPF0LeELtCq3lY84VJM4Ao44u30cYOVxUsYkmVX4D2ZOG8U
         K6uIyUZGv2GFq2LITOb3j6+7Fk0aMcTqUVmds7Y9qwa6jW06e/7weexwhMTkTAmjVU7l
         1+MXqomo1sDAYjGbcm8sxY6drxulbG9a241uJRCEN3/Ra/uiYzjzh02ZBy5K/lCWy9+G
         o4oA==
X-Forwarded-Encrypted: i=1; AFNElJ+sbb2IXGmmRRQRpZSjsvJ/eXxvKpwPO6SmOUOGz2P6TCDDYqYYqBmKIMdlAM6VFe95JNugLBfxKPTbqw4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcrwEJZVoKH6YaB0LdPqeFQZN8TVDlougkG2jHCaAUTrRj9Bp
	cLFh+G5lQMPSZcF4tK0vkf6dRaTst/9kIGNKPLbEXD/4vFTC0Z7rAVMw5IpD6yz/W+pzquKD9tB
	POBdPZF7AnT5Ovf9ZAM8j8HlgOC0Tv3tc/8+PWpNfhbWOxjeyAMat+bzLgTJ3a4iC6O5v
X-Gm-Gg: Acq92OFpRNuKhZr+00LVjqELNs/geBE20a1iQvRttZpyVTr4KQLAY7MGlbI94Z3/oux
	iNYObH1rOJquz2ICGbb0gQ2kHniCDXPEXJ4RC8aeoGAMlk5qktOflX7O+b4MQELV/f114ZNDVMm
	Gb/uSExpoMpBiHZChvOeF22BL1NdCXXt/WeTpEwo6zSwOmkhAJRciqRVfRSDweRvLL/M6G9YRax
	lM1dWGqcwBR0HAyQZoSVyP1tCSG+r7Z8FiCv63ODEns6dhwprZ71KzC9Pv/YgG5Q/QjOSPsVI91
	/sVc8VcrM1DaLtwrcZWCACnKbE7hNHCT/JtYVH9Skq43tjP6v7duqCs8cyrA0216uztZrzpmRVH
	FBYE/jN/wMqnbMUpQEdlKlMWSY2AmylDeBN9eubld8+yvYsX0TYjYstNA6Uqr7AAg2KDpwP4INn
	0Jl/xTMs5QHmyYzhysGoUcKdCLZF1O9j4Q2UFZKejmwB8y2w==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6267144137.24.1780887822549;
        Sun, 07 Jun 2026 20:03:42 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6267138137.24.1780887821881;
        Sun, 07 Jun 2026 20:03:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b992a66sm3394569e87.74.2026.06.07.20.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:03:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:03:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Message-ID: <yg3tb3rmxrzvn5kum2vgz6dntzru4byzhsqh3bgjk75kej7an7@pucfscjjgslu>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
X-Proofpoint-ORIG-GUID: sET5HWc63YA10HKadQuyeL4D3TytIWQy
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a263110 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cTwmTnRGAAAA:8
 a=SPvLqmS7uWcKxiEksG4A:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNCBTYWx0ZWRfX1HIkniFEpfUd
 wbv4D8Oqb6Eg2j1cZ7YHZ0GUAVtmiyrZybO0bDw3re1SdavMr6zdYT/MMO9cra2jBTlW3Oi1izr
 PLFxjFnYBmGq6pWU/zDC1XxuKGglxXzCoaVufKcnXLr6emmn1oJyZZiNXDTPMcRMA9vD7VwjgHf
 k/vL7vfyF5b0giaQnkMbLdUvWYjVujAF1ViwvGmuObU9A8mbKTav1DqlOxaIm52/EuJRNd4A3jX
 L3tnWyUYi3bScB4+Lx13A1LgEnJm5zGOkPoDF8CwdVGQXJl2krCft0EJyPDwPHxUawpdzMSFlNF
 FtrMM+EnCpNKadov7fP2mAuqGdGeX2xjQts8mAe7pi/QyH9LpLlBYjRsgOX2tujY1oMHuFbE6SH
 u+b2esjOXl2hHwWaaDfp/wD5GbSl6xOpYWcNZ5MWtCQYZ2zuXbPTXylXNlVhNCuN3M5BWKQU4EH
 WdwqbYLQ9HwtJFDnhdw==
X-Proofpoint-GUID: sET5HWc63YA10HKadQuyeL4D3TytIWQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3BB86525E0

On Sat, May 30, 2026 at 03:58:12PM +0200, Herman van Hazendonk wrote:
> Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> generation that preceded MSM8960's Krait CPUs.
> 
> The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> make a separate driver cleaner than parameterising mmcc-msm8960.c:
> 
>   - the pix_rdi mux requires a custom set_parent op that temporarily
>     enables both parents during the glitch-free transition;

Can it be handled by CLK_OPS_PARENT_ENABLE ?

>   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
>   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
>     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
>   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
>     later 8960 reorganisation.
> 
> Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> rotator. Reset IDs are exposed via a separate header so consumers
> can reset the GDSCs and individual blocks.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/mmcc-msm8660.c | 2998 +++++++++++++++++++++++++++++++
>  3 files changed, 3010 insertions(+)
>  create mode 100644 drivers/clk/qcom/mmcc-msm8660.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d9cff5b0281d..f64b0002c85a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -572,6 +572,17 @@ config MSM_MMCC_8960
>  	  Say Y if you want to support multimedia devices such as display,
>  	  graphics, video encode/decode, camera, etc.
>  
> +config MSM_MMCC_8660

Please put it before MSM_MMCC_8960

> +	tristate "MSM8x60 Multimedia Clock Controller"
> +	depends on ARM || COMPILE_TEST
> +	select MSM_GCC_8660
> +	select QCOM_GDSC
> +	help
> +	  Support for the multimedia clock controller on the MSM8x60 family
> +	  (MSM8260/MSM8660/APQ8060). Say Y if you want to support multimedia
> +	  devices such as display, graphics, video encode/decode, camera, etc.
> +	  on these Scorpion-class SoCs (e.g. HP TouchPad).
> +
>  config MSM_GCC_8953
>  	tristate "MSM8953 Global Clock Controller"
>  	select QCOM_GDSC
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index e100cfd6a52d..ff317fce086d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
>  obj-$(CONFIG_MSM_GCC_8998) += gcc-msm8998.o
>  obj-$(CONFIG_MSM_GPUCC_8998) += gpucc-msm8998.o
>  obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
> +obj-$(CONFIG_MSM_MMCC_8660) += mmcc-msm8660.o

Also before CONFIG_MSM_MMCC_8960

>  obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
>  obj-$(CONFIG_MSM_MMCC_8994) += mmcc-msm8994.o
>  obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
> diff --git a/drivers/clk/qcom/mmcc-msm8660.c b/drivers/clk/qcom/mmcc-msm8660.c
> new file mode 100644
> index 000000000000..5e6943430d29
> --- /dev/null
> +++ b/drivers/clk/qcom/mmcc-msm8660.c
> @@ -0,0 +1,2998 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + Herman van Hazendonk <github.com@herrie.org>
> + *
> + * MSM8x60 family (MSM8260/MSM8660/APQ8060) Multimedia Clock Controller driver
> + *
> + * Split from mmcc-msm8960.c to properly handle MSM8x60-specific clock
> + * configurations, particularly the GFX3D reset bits which differ from MSM8960.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/qcom_rpm.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,mmcc-msm8660.h>
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +#include <dt-bindings/reset/qcom,mmcc-msm8660.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +
> +enum {
> +	P_PXO,
> +	P_PLL8,
> +	P_PLL2,
> +	P_PLL3,
> +	P_HDMI_PLL,
> +	P_DSI1_PLL_DSICLK,
> +	P_DSI2_PLL_DSICLK,
> +	P_DSI1_PLL_BYTECLK,
> +	P_DSI2_PLL_BYTECLK,
> +};
> +
> +#define F_MN(f, s, _m, _n) { .freq = f, .src = s, .pre_div = 1, .m = _m, .n = _n }

I think you should have gotten a warning here. It should be .freq = (f),
etc.

> +/* Pure divider+source RCG (no MND), e.g. VPE on MSM8660: NS_DIVSRC(15,12,d,2,0,s) */
> +#define F_DIV(f, s, d) { .freq = f, .src = s, .pre_div = d }

The same.

> +
> +static struct clk_pll pll2 = {
> +	.l_reg = 0x320,
> +	.m_reg = 0x324,
> +	.n_reg = 0x328,
> +	.config_reg = 0x32c,
> +	.mode_reg = 0x31c,
> +	.status_reg = 0x334,
> +	.status_bit = 16,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "pll2",
> +		.parent_data = (const struct clk_parent_data[]){
> +			{ .fw_name = "pxo", .name = "pxo_board" },

There was no MMCC node beforehand. You can drop all the .name entries,
they are mostly required for the legacy cases where we had an
incomplete DT.

Also, current approach is to use indices instead of clock-names to
identify parents (see any modern clock driver under drivers/clk/qcom).

> +		},
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +
> +/*
> + * CSI PIX/RDI clock mux support
> + *
> + * On MSM8660, the csi_pix_clk and csi_rdi_clk can source from either
> + * CSI0 or CSI1. The selection is controlled by bits in CSC_CC_REG (0x0058):
> + *   - BIT(25): csi_pix_clk source (0=CSI0, 1=CSI1)
> + *   - BIT(12): csi_rdi_clk source (0=CSI0, 1=CSI1)
> + *
> + * This mux is critical for HP TouchPad which uses CSI1 for the front camera.
> + */
> +struct clk_pix_rdi {
> +	u32 s_reg;
> +	u32 s_mask;
> +	struct clk_regmap clkr;
> +};
> +
> +#define to_clk_pix_rdi(_hw) \
> +	container_of(to_clk_regmap(_hw), struct clk_pix_rdi, clkr)
> +
> +static int pix_rdi_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_pix_rdi *rdi = to_clk_pix_rdi(hw);
> +	u32 val;
> +	int i, ret = 0;
> +	int num_parents = clk_hw_get_num_parents(hw);
> +
> +	/*
> +	 * Turn on all parent sources during mux switch to ensure
> +	 * glitch-free transition.
> +	 */
> +	for (i = 0; i < num_parents; i++) {
> +		struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
> +
> +		ret = clk_prepare_enable(p->clk);
> +		if (ret)
> +			goto err;
> +	}

As I wrote, I think CLK_OPS_PARENT_ENABLE should handle this for you.

> +
> +	/* Select parent: 0=CSI0, 1=CSI1 */
> +	val = (index == 1) ? rdi->s_mask : 0;
> +	regmap_update_bits(rdi->clkr.regmap, rdi->s_reg, rdi->s_mask, val);
> +
> +	/*
> +	 * Wait at least 6 cycles of slowest clock for the
> +	 * glitch-free MUX to fully switch sources.
> +	 */
> +	udelay(1);
> +
> +	/*
> +	 * Now disable all parents that were temporarily enabled.
> +	 * The clock framework will keep the selected parent enabled
> +	 * as long as the child (csi_pix_clk/csi_rdi_clk) is enabled.
> +	 */
> +	for (i = num_parents - 1; i >= 0; i--) {
> +		struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
> +
> +		clk_disable_unprepare(p->clk);
> +	}
> +
> +	return 0;
> +
> +err:
> +	/* On error, disable only the parents we successfully enabled */
> +	for (i--; i >= 0; i--) {
> +		struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
> +
> +		clk_disable_unprepare(p->clk);
> +	}
> +
> +	return ret;
> +}
> +
> +static u8 pix_rdi_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_pix_rdi *rdi = to_clk_pix_rdi(hw);
> +	u32 val;
> +
> +	regmap_read(rdi->clkr.regmap, rdi->s_reg, &val);
> +	return (val & rdi->s_mask) ? 1 : 0;
> +}
> +
> +static const struct clk_ops clk_ops_pix_rdi = {
> +	.enable = clk_enable_regmap,
> +	.disable = clk_disable_regmap,
> +	.is_enabled = clk_is_enabled_regmap,
> +	.set_parent = pix_rdi_set_parent,
> +	.get_parent = pix_rdi_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +
> +static const struct clk_hw *pix_rdi_parents[] = {
> +	&csi0_clk.clkr.hw,
> +	&csi1_clk.clkr.hw,
> +};
> +
> +static struct clk_pix_rdi csi_pix_clk = {
> +	.s_reg = 0x0058,
> +	.s_mask = BIT(25),
> +	.clkr = {
> +		.enable_reg = 0x0058,
> +		.enable_mask = BIT(26),
> +		.hw.init = &(struct clk_init_data){

WHile I noticed, const struct clk_init_data.

> +			.name = "csi_pix_clk",
> +			.parent_hws = pix_rdi_parents,
> +			.num_parents = ARRAY_SIZE(pix_rdi_parents),
> +			.ops = &clk_ops_pix_rdi,
> +		},
> +	},
> +};
> +
> +
> +/*
> + * MSM8x60 legacy footswitches.
> + * These use a different register layout than modern GDSCs:
> + * - Bit 8: ENABLE (set to enable power)
> + * - Bit 5: CLAMP (set to clamp I/O)
> + * - No status bit, requires timed delays
> + */
> +static struct gdsc gfx2d0_gdsc = {
> +	.gdscr = 0x0180,
> +	.resets = (unsigned int []){ GFX2D0_AHB_RESET },
> +	.reset_count = 1,
> +	.pd = {
> +		.name = "gfx2d0",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = LEGACY_FOOTSWITCH | SW_RESET,
> +};
> +
> +static struct gdsc gfx2d1_gdsc = {
> +	.gdscr = 0x0184,
> +	.resets = (unsigned int []){ GFX2D1_AHB_RESET },
> +	.reset_count = 1,
> +	.pd = {
> +		.name = "gfx2d1",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = LEGACY_FOOTSWITCH | SW_RESET,
> +};
> +
> +static struct gdsc gfx3d_gdsc = {
> +	.gdscr = 0x0188,
> +	/*
> +	 * GFX3D (Adreno 220) requires the core reset to be toggled on every
> +	 * power-on, in addition to the AHB reset. The legacy MSM8x60
> +	 * footswitch driver (mach-msm/footswitch-8x60.c) does exactly this:
> +	 * after powering the GFX3D rail it issues an extra
> +	 * clk_reset(core_clk, ASSERT/DEASSERT). Without it the Adreno 220
> +	 * core (parameter cache) comes up free-running, producing the
> +	 * deterministic period-8 render cycle on the HP TouchPad. Listing
> +	 * GFX3D_RESET here lets the GDSC framework assert/deassert it around
> +	 * the rail charge (see gdsc_enable LEGACY_FOOTSWITCH path), which is
> +	 * the framework-correct equivalent of the legacy toggle.
> +	 */

If only all upstream commits had such a nice comments.

> +	.resets = (unsigned int []){ GFX3D_AHB_RESET, GFX3D_RESET },
> +	.reset_count = 2,
> +	.pd = {
> +		.name = "gfx3d",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	/*
> +	 * RPM_ALWAYS_ON: keep the GFX3D footswitch powered across runtime PM
> +	 * idle (clocks still gate), collapsing it only on system suspend. The
> +	 * Adreno 220 shares the MMSS AXI fabric with the MDP4 display; cold-
> +	 * cycling this footswitch on every GPU idle forces an a2xx_hw_init
> +	 * microcode reload whose MMIO burst can stall the shared bus when it
> +	 * lands during an MDP client-switch underrun, hard-hanging the SoC.
> +	 * Mirrors legacy KGSL, which parked the GPU in SLEEP (rail up, clocks
> +	 * gated) during use and only power-collapsed (SLUMBER) on suspend.
> +	 */
> +	.flags = LEGACY_FOOTSWITCH | SW_RESET | RPM_ALWAYS_ON,
> +};
> +
> +
> +static const struct qcom_cc_desc mmcc_msm8660_desc = {
> +	.config = &mmcc_msm8660_regmap_config,
> +	.clks = mmcc_msm8660_clks,
> +	.num_clks = ARRAY_SIZE(mmcc_msm8660_clks),
> +	.resets = mmcc_msm8660_resets,
> +	.num_resets = ARRAY_SIZE(mmcc_msm8660_resets),
> +	.gdscs = mmcc_msm8660_gdscs,
> +	.num_gdscs = ARRAY_SIZE(mmcc_msm8660_gdscs),

I commented on the other patchset. I think handling footswitches
separately from GDSCs would be better.

> +};
> +
> +static const struct of_device_id mmcc_msm8660_match_table[] = {
> +	{ .compatible = "qcom,mmcc-msm8660", .data = &mmcc_msm8660_desc },
> +	{ .compatible = "qcom,mmcc-apq8060", .data = &mmcc_msm8660_desc },

Unless you fancy any quirks, just leave qcom,mmcc-msm8660 here. 

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mmcc_msm8660_match_table);
> +
> +/*
> + * MSM8660 MMCC register offsets for initialization.
> + * Based on webOS kernel arch/arm/mach-msm/clock-8x60.c
> + */
> +
> +/* Reset registers - safe to deassert */
> +#define SW_RESET_ALL_REG	0x0204
> +#define SW_RESET_AHB_REG	0x020c
> +#define SW_RESET_AXI_REG	0x0208
> +#define SW_RESET_CORE_REG	0x0210
> +
> +/* AHB enable registers - contain both control bits and clock enables */
> +#define AHB_EN_REG		0x0008
> +#define AHB_EN2_REG		0x0038
> +
> +/* AXI enable registers - control AXI bus paths for memory access */
> +#define MAXI_EN_REG		0x0018
> +#define MAXI_EN3_REG		0x002c
> +#define SAXI_EN_REG		0x01d8
> +
> +/* Misc CC registers */
> +#define CSI_CC_REG		0x0040
> +#define MISC_CC_REG		0x0058
> +#define MISC_CC2_REG		0x005c
> +
> +/* CC registers - FORCE_CORE_ON in upper bits, enable in lower bits */
> +#define GFX2D0_CC_REG		0x0060
> +#define GFX2D1_CC_REG		0x0074
> +#define GFX3D_CC_REG		0x0080
> +#define IJPEG_CC_REG		0x0098
> +#define JPEGD_CC_REG		0x00a4
> +#define MDP_CC_REG		0x00c0
> +#define PIXEL_CC_REG		0x00d4
> +#define PIXEL_CC2_REG		0x0120  /* Not used as enable_reg */
> +#define ROT_CC_REG		0x00e0
> +#define TV_CC_REG		0x00ec
> +#define TV_CC2_REG		0x0124  /* Not used as enable_reg */
> +#define VCODEC_CC_REG		0x00f8
> +#define VFE_CC_REG		0x0104
> +#define VPE_CC_REG		0x0110
> +
> +/*
> + * Mask for FORCE_CORE_ON and sleep/wakeup delay bits in CC registers.
> + * Only touches upper bits to avoid conflicting with clock enable bits
> + * in the lower portion of the register.
> + */
> +#define CC_FORCE_CORE_ON_MASK	0xe0ff0000
> +#define CC_FORCE_CORE_ON_VAL	0x80ff0000  /* FORCE_CORE_ON + 0xFF delays */
> +#define VCODEC_FORCE_CORE_ON	0xc0ff0000  /* VCODEC uses different bits */
> +
> +static void mmcc_msm8660_init_hw(struct regmap *regmap)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Configure PLL2 (MM_PLL1) to 800 MHz for VFE and other MM clocks.
> +	 *
> +	 * PLL rate = PXO * (L + M/N) = 27 MHz * (29 + 17/27) = 800 MHz
> +	 *
> +	 * The bootloader (moboot) enables PLL2 but does not configure L/M/N,
> +	 * leaving it at whatever values are in the hardware. We must set it
> +	 * properly for VFE to reach 228 MHz. Without this, VFE gets ~66 MHz.
> +	 */
> +	regmap_read(regmap, 0x320, &val);  /* PLL2 L value */
> +	if (val != 29) {
> +		u32 m_val, n_val;
> +		/* PLL2 is not configured for 800 MHz, configure it */
> +		regmap_read(regmap, 0x324, &m_val);
> +		regmap_read(regmap, 0x328, &n_val);
> +		pr_info("mmcc-msm8660: Configuring PLL2 for 800 MHz (was L=%u M=%u N=%u)\n",
> +			val, m_val, n_val);
> +
> +		/* Disable PLL output first */
> +		regmap_update_bits(regmap, 0x31c, BIT(0), 0);
> +		udelay(10);
> +
> +		/* Set L=29, M=17, N=27 for 800 MHz from 27 MHz PXO */
> +		regmap_write(regmap, 0x320, 29);   /* L value */
> +		regmap_write(regmap, 0x324, 17);   /* M value */
> +		regmap_write(regmap, 0x328, 27);   /* N value */
> +
> +		/* Configure PLL: enable main output, set VCO */
> +		regmap_write(regmap, 0x32c, 0x00800000);
> +
> +		/* Enable PLL: bypass off, reset deassert, output enable */
> +		regmap_update_bits(regmap, 0x31c, BIT(1), BIT(1));  /* Bypass off */
> +		udelay(10);
> +		regmap_update_bits(regmap, 0x31c, BIT(2), BIT(2));  /* Reset deassert */
> +		udelay(50);
> +		regmap_update_bits(regmap, 0x31c, BIT(0), BIT(0));  /* Output enable */
> +		udelay(50);
> +
> +		/* Verify PLL locked (status register at 0x334, bit 16) */
> +		regmap_read(regmap, 0x334, &val);
> +		if (val & BIT(16))
> +			pr_info("mmcc-msm8660: PLL2 locked at 800 MHz\n");
> +		else
> +			pr_warn("mmcc-msm8660: PLL2 may not be locked (status=0x%x)\n", val);
> +	}

Extracgt to a separate function, please. Pass pll2 as an arg and use
registers from it instead of raw values.

> +
> +	/*
> +	 * MSM8660 MMCC hardware initialization based on webOS kernel.
> +	 *
> +	 * WebOS sets specific control bits in AHB_EN_REG:
> +	 *   rmwreg(0x00000003, AHB_EN_REG, 0x0F7FFFFF);
> +	 * BIT(0) and BIT(1) are control bits (FPB enable, HW gating disable),
> +	 * NOT clock enables. Clock enables start at BIT(2) and above.
> +	 *
> +	 * We initialize these control bits but leave clock enable bits
> +	 * for the clock framework to manage.
> +	 */
> +
> +	/*
> +	 * Set FPB enable and disable HW gating in AHB_EN_REG.
> +	 * BIT(0) = FPB clock enable
> +	 * BIT(1) = Disable HW gating for all AHB clocks
> +	 * These are required for CSI register writes to work.
> +	 */
> +	regmap_update_bits(regmap, AHB_EN_REG, 0x3, 0x3);
> +
> +	/*
> +	 * AHB_EN2_REG contains additional control bits including
> +	 * VFE_AHB FORCE_CORE_ON to prevent memory collapse.
> +	 * WebOS: rmwreg(0x000007F9, AHB_EN2_REG, 0x7FFFBFFF);
> +	 */
> +	regmap_update_bits(regmap, AHB_EN2_REG, 0x7fffbfff, 0x000007f9);
> +
> +	/*
> +	 * Initialize AXI bus registers for memory access paths.
> +	 * These enable HW gating and set FORCE_CORE_ON bits for AXI clocks.
> +	 * WebOS: rmwreg(0x000307F9, MAXI_EN_REG, 0x0FFFFFFF);
> +	 *        writel(0x3FE7FCFF, MAXI_EN3_REG);
> +	 *        writel(0x000001D8, SAXI_EN_REG);
> +	 * Note: MAXI_EN2_REG is owned by RPM, don't touch it.
> +	 */
> +	regmap_update_bits(regmap, MAXI_EN_REG, 0x0fffffff, 0x000307f9);
> +	regmap_write(regmap, MAXI_EN3_REG, 0x3fe7fcff);
> +	regmap_write(regmap, SAXI_EN_REG, 0x000001d8);
> +
> +	/* Deassert all MM resets */
> +	regmap_write(regmap, SW_RESET_ALL_REG, 0);
> +	regmap_write(regmap, SW_RESET_AHB_REG, 0);
> +	regmap_write(regmap, SW_RESET_AXI_REG, 0);
> +	regmap_write(regmap, SW_RESET_CORE_REG, 0);
> +
> +	/*
> +	 * Initialize CSI and MISC CC registers.
> +	 *
> +	 * CSI_CC_REG (0x040): webOS camera dump shows 0x85
> +	 *   - Bit 0: CSI digital wrapper 0 enable
> +	 *   - Bit 2: CSI digital wrapper 1 enable
> +	 *   - Bit 7: Unknown (possibly global CSI enable)
> +	 * Without these bits set, CSIPHY data never reaches VFE.
> +	 *
> +	 * MISC_CC_REG (0x058): webOS camera dump shows 0x0400
> +	 *   - Bit 10: CSI1-to-VFE async bridge enable
> +	 * MSM8660 has direct CSIPHY->VFE path, NOT the csi_pix/csi_rdi mux
> +	 * architecture found in VFE3.2+. The csi_pix_clk/csi_rdi_clk (bits
> +	 * 25-26 and 12-13) don't exist on this SoC - only bit 10 matters.
> +	 *
> +	 * MISC_CC2_REG: webOS shows 0x004007fd - additional enables.
> +	 */
> +	regmap_write(regmap, CSI_CC_REG, 0x00000085);
> +	regmap_update_bits(regmap, MISC_CC_REG, 0xfefff7ff, 0x00000400);
> +	regmap_update_bits(regmap, MISC_CC2_REG, 0xffff7fff, 0x000007fd);
> +	/* Set dsi_byte_clk src to DSI PHY PLL, hdmi_app_clk src to PXO */
> +	regmap_update_bits(regmap, MISC_CC2_REG, 0x00424003, 0x00400001);
> +
> +	/*
> +	 * Set FORCE_CORE_ON bits in all multimedia CC registers to prevent
> +	 * core memories from being collapsed when clocks are halted.
> +	 *
> +	 * Value 0x80ff0000 sets:
> +	 *   - Bit 31: FORCE_CORE_ON
> +	 *   - Bits 16-23: Safe sleep/wakeup delay values (0xFF)
> +	 *
> +	 * We use regmap_update_bits to only touch upper bits, avoiding
> +	 * conflict with clock enable bits in the lower portion.
> +	 */
> +
> +	/* Graphics */
> +	regmap_update_bits(regmap, GFX2D0_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_update_bits(regmap, GFX2D1_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_update_bits(regmap, GFX3D_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +
> +	/* Display */
> +	regmap_update_bits(regmap, MDP_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_update_bits(regmap, PIXEL_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_write(regmap, PIXEL_CC2_REG, 0x000004ff);
> +	regmap_update_bits(regmap, TV_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_write(regmap, TV_CC2_REG, 0x000004ff);
> +	regmap_update_bits(regmap, ROT_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +
> +	/* Video */
> +	regmap_update_bits(regmap, VCODEC_CC_REG, CC_FORCE_CORE_ON_MASK, VCODEC_FORCE_CORE_ON);
> +	regmap_update_bits(regmap, VPE_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +
> +	/* Camera */
> +	regmap_update_bits(regmap, VFE_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +
> +	/* JPEG */
> +	regmap_update_bits(regmap, IJPEG_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +	regmap_update_bits(regmap, JPEGD_CC_REG, CC_FORCE_CORE_ON_MASK, CC_FORCE_CORE_ON_VAL);
> +}
> +
> +/*
> + * Unhalt all RPM fabric AXI master ports.
> + *
> + * webOS downstream kernels (msm_bus_board_8660.c) program halt registers
> + * on three fabrics: APPS (4 masters), SYSTEM (17 masters), MMSS
> + * (14 masters). The downstream GDSC driver calls msm_bus_axi_portunhalt()
> + * in footswitch_enable() when each power domain comes up; mainline GDSC
> + * does not, leaving fabric master ports in their default (potentially
> + * halted) state. This can cause DMA stalls and arbitration hangs.
> + *
> + * MMSS fabric master ports (port:name from webOS enum):
> + *   0:MDP_PORT0   1:MDP_PORT1   2:ADM1_PORT0  3:ROTATOR
> + *   4:GFX3D       5:JPEG_DEC    6:GFX2D0      7:VFE
> + *   8:VPE         9:JPEG_ENC   10:GFX2D1     11:APPS_FAB
> + *  12:HDCODEC0   13:HDCODEC1
> + *
> + * SYSTEM fabric master ports:
> + *   0:APPSS_FAB    1:SPS         2:ADM0_PORT0  3:ADM0_PORT1
> + *   4:ADM1_PORT0   5:ADM1_PORT1  6:LPASS_PROC  7:MSS_PROCI
> + *   8:MSS_PROCD    9:MDM_PORT0  10:LPASS      11:CPSS_FPB
> + *  12:SYSTEM_FPB  13:MMSS_FPB   14:ADM1_AHB   15:ADM0_AHB
> + *  16:MSS_MDM_PORT1
> + *
> + * APPS fabric has 4 masters; unhalting all is safe.
> + *
> + * Driven from mmcc probe because it runs after the qcom_rpm platform
> + * driver registers (mmcc is module_platform_driver, RPM is platform_init).
> + * Doing the same in gcc probe (core_initcall) is too early -- RPM is
> + * not yet bound and qcom_rpm_write() has no target.

A very strange idea, but... Make clk-rpm driver export several resets
for you, asserting / deasserting a reset would halt / unhalt the clocks.
Then you can solve the problem for both GCC and MMCC drivers. Also, if
you have a separate footswitch_enable() (instead of reusing
gdsc_enable()), you can freely toggle necessary resets.

> + */
> +static void mmcc_msm8660_unhalt_fabric_ports(struct device *dev)
> +{
> +	struct device_node *rpm_node;
> +	struct platform_device *rpm_pdev;
> +	struct qcom_rpm *rpm;
> +	/* halt_data[0]=0 = CLK_UNHALT for all bits; halt_data[1] = port mask */
> +	u32 mmss_halt[2] = {0, GENMASK(13, 0)};
> +	u32 sys_halt[2]  = {0, GENMASK(16, 0)};
> +	u32 apps_halt[2] = {0, GENMASK(3, 0)};
> +	int rc;
> +
> +	rpm_node = of_find_compatible_node(NULL, NULL, "qcom,rpm-msm8660");
> +	if (!rpm_node)
> +		return;
> +
> +	rpm_pdev = of_find_device_by_node(rpm_node);
> +	of_node_put(rpm_node);
> +	if (!rpm_pdev)
> +		return;
> +
> +	rpm = dev_get_drvdata(&rpm_pdev->dev);
> +	if (!rpm) {
> +		put_device(&rpm_pdev->dev);
> +		return;
> +	}
> +
> +	rc = qcom_rpm_write(rpm, QCOM_RPM_ACTIVE_STATE,
> +			    QCOM_RPM_MM_FABRIC_HALT, mmss_halt, 2);
> +	if (rc)
> +		dev_warn(dev, "MMSS fabric unhalt failed: %d\n", rc);
> +	else
> +		dev_info(dev, "MMSS fabric: unhalted all master ports (0-13)\n");

General comment: if nothing happened, keep it silent. Use dev_dbg()
here, if unhalting succeeded.

> +
> +	rc = qcom_rpm_write(rpm, QCOM_RPM_ACTIVE_STATE,
> +			    QCOM_RPM_SYS_FABRIC_HALT, sys_halt, 2);
> +	if (rc)
> +		dev_warn(dev, "system fabric unhalt failed: %d\n", rc);
> +	else
> +		dev_info(dev, "system fabric: unhalted all master ports (0-16)\n");
> +
> +	rc = qcom_rpm_write(rpm, QCOM_RPM_ACTIVE_STATE,
> +			    QCOM_RPM_APPS_FABRIC_HALT, apps_halt, 2);
> +	if (rc)
> +		dev_warn(dev, "apps fabric unhalt failed: %d\n", rc);
> +	else
> +		dev_info(dev, "apps fabric: unhalted all master ports (0-3)\n");
> +
> +	put_device(&rpm_pdev->dev);
> +}
> +
> +static int mmcc_msm8660_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &mmcc_msm8660_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Initialize MMCC hardware before registering clocks */
> +	mmcc_msm8660_init_hw(regmap);
> +
> +	/*
> +	 * Unhalt all MMSS / SYSTEM / APPS fabric AXI master ports.  Must
> +	 * happen before any peripheral (MMSS block for MMSS fabric;
> +	 * CE2/ADM/SDC/USB for SYSTEM fabric) performs DMA.  Driven from
> +	 * mmcc probe because it runs after the qcom_rpm platform driver
> +	 * has bound (gcc core_initcall is too early).
> +	 */
> +	mmcc_msm8660_unhalt_fabric_ports(&pdev->dev);
> +
> +	return qcom_cc_really_probe(&pdev->dev, &mmcc_msm8660_desc, regmap);
> +}
> +
> +static struct platform_driver mmcc_msm8660_driver = {
> +	.probe		= mmcc_msm8660_probe,
> +	.driver		= {
> +		.name	= "mmcc-msm8660",
> +		.of_match_table = mmcc_msm8660_match_table,
> +	},
> +};
> +
> +module_platform_driver(mmcc_msm8660_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MSM8x60 Multimedia Clock Controller driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:mmcc-msm8660");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

