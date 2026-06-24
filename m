Return-Path: <linux-arm-msm+bounces-114269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1L/+BkFEO2qjVAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463D6BAF5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="J+/vqGOc";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dfx00ODy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DAFC3057619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 02:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03B1245019;
	Wed, 24 Jun 2026 02:43:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B712F8EAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:43:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268989; cv=none; b=Ad63tRgd1VLDHtNl08IQaBpYJFCQoPflelGgAJuIe/z5N16LkWjDV/VU6erbwdLpx9pkHnLfzGrwkEjoN0JRWk1gU1sqBwn/MruTewGWzI5kw/U6Sz4iasbsAI9upv7myOwJVcyqxRw27hpqy3xRCqCYzPafHWxJkqprhVDlHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268989; c=relaxed/simple;
	bh=1BUkjsbXJai+1Y/OyCBHxg+SQuJVTVgUyXJfQqGUeXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqC34tK/ywvG1YqauWzNVmnnzmPJNjImSAdD7mL6p7aBKjdVZQUNju2trmeq0g1j5y59dPZ69vjLWsO3kWw17Wrv1lOMjg/axhEs3SYNtyO/YawQRTID2H6FDFnqs3SOPr726SFANXyYYooWzEExaRAner08YIP9ArYaRCHHwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+/vqGOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfx00ODy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1U9nM1400625
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xBXRxomKqNN1kZzaPtiFIXNw
	qHBxEiMa6YFVXqngpiM=; b=J+/vqGOcxPmiitqbT4ZQ6jhFDViAQ3zM665ZnVPU
	tjYFGex99L5nwCL6K23JQv7dIf00H+7AN6cI8uKEQnpZKHwjzxqmR2ZL8F9rvWK3
	U80WJBNLcwkBV2mQlmiOCwOh2+1S6M1I4JHAqEL2tqRoMAp+79IGx1OSQ9IsgvLO
	2G/zS90V1jdKT+uEbN4yiuYN+9oPug2ECOSaXu5zSS3JoqmMgrzquWg2+7gtjMF8
	EpVAZIJXufXhb4trVXXpA33ANnHohTAkkhup95A4ysXZC49754lUvxKzC5HhD/hD
	wEgBAn6dXFKDayekajH2W7Ivnc6jBxLcRpnfOdMWC9he2Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aq86uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:43:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c1f6c5559so603640eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782268986; x=1782873786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBXRxomKqNN1kZzaPtiFIXNwqHBxEiMa6YFVXqngpiM=;
        b=dfx00ODyUz2gb/xF50h2Ggs7tmxLvPdsAIF1vuj33UbBkpxS+g+xbnZ8RGM0eagfuc
         z01Yb5/8uaBdLOSPjM9ME9l+bGl06cjfRdL1E3hrd7HVzedszdaq3RfK9cRfmmlI3D9m
         5unyEPSsmMhUWTY2+flMZ1sMKeov8RE5S9Hwj7xkqMrGFSq8fK8WgqjmQsksFmFgM/Jh
         fOfy8C/TmUL85NC5uvbQpOVnEeW3El47joQKawoEnUelQqBZ4rh1wjch1HkyV+rzL/N/
         tNFbSJaVz7iWBuiWPkr2yKFqteclQki+nc4htXwSES6sjaaU308dU1ZRZNOLzNXZTtUk
         eQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268986; x=1782873786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBXRxomKqNN1kZzaPtiFIXNwqHBxEiMa6YFVXqngpiM=;
        b=qvvjtHJACtXUABbG4NEU21S1tbrbqNsBJoZOoyY6CqRA9DJDDP0WNOdCDf8ZNE1vbm
         1m+XH6FdkmT+M7TuEyogavcqy6QWzzV6dkxXj13ZreiZL7V52L1YhJwpIUDdCLGRxRlc
         mq9DD5+PG4ZBxoiTaPlnDUCPrYKHp/PHqPgUOgugSJDjKWG80reRHM3qywNROVcJNBNR
         6GZMEoHdotVV5kIUadaXEFLzeT8XonXzFKiwz3hIjv1z1y1hX4PHCerXhOM/az/tpJ/Y
         SqmpOFw5BnMj0f2v/CGUPltXPISzyMvGbANE++21/fhSNXzktqG0BFRH5rZfSdpBSC7h
         f/GA==
X-Forwarded-Encrypted: i=1; AHgh+RoHF5D7HKh/1wbthPRT5EyQ1zPXda2cOadvRmzmnocvbAWefF4DLf5LAPr7FqnYQWZWZ3G4Mtq2PvvFPojZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp9aaGeomJKkxgGUwRo14eBP45sndYfZwglMETRwjvH9icQJB
	TzWtt64rSKW8HZgwDy7i0MF90y0VsSExsf/IqDB7ocmndySFVOXewI/lQw/ZNV/aAw9I/TratB3
	ypUHxuGPImx0Cj2qALe4I9nPrlWhjHJ6uLC7/a1LsPqtzrIxmwz6XkQ4memMlgfUSi+R4
X-Gm-Gg: AfdE7ckx614iKToTTl/+NIOS9xGEOINhqQBXHIp2OSKKu9Pik55kbrQLThvc6bZbDPm
	PP6/QhyKqqbG75LSdVku/Q84bPmLK8ApFz0ow37NRDLAiNRrA5JCxPD1sS0N+3y3oqjQuF23BSw
	IxJrS6LOztbIksstGe72efkbC+nDAfgfNxVG8PjKrGXB8JDVpzTJN8ajr1KE66Xl0kwyrgEYHLi
	qtj+Hqv+Vk6uHqObyUNYThoTA+/KQEY6GC9pu+OxDDczD+rXrYJHDbgcBwcALwMmeAJzPelUUPX
	cckA44pamQkudLKbKM+i3a16AXtCRfOB6AqZA3yrKTeyIaVzIRjBoJn4X/QGJIKQpClu02hbfwa
	GNVDFfY/zxsGgZqo5Rf99hQCarP3NxaaZtCnm5nkBQ9xTSIlL+PG6Uw==
X-Received: by 2002:a05:7300:550:b0:306:f474:738c with SMTP id 5a478bee46e88-30c68d1b308mr2036640eec.13.1782268986070;
        Tue, 23 Jun 2026 19:43:06 -0700 (PDT)
X-Received: by 2002:a05:7300:550:b0:306:f474:738c with SMTP id 5a478bee46e88-30c68d1b308mr2036590eec.13.1782268985518;
        Tue, 23 Jun 2026 19:43:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6eabb7a5sm363369eec.26.2026.06.23.19.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:43:05 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:42:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
Message-ID: <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfXw9cu+cAX67Gw
 0mtLcTUKPI+xIxiMKdYrfNmFltVz6d2RZArq5eXfxe9yBJXeKyIqkzE2wxciWfRE0DX/dSOsdwS
 FybEUdTQ/o4DLFfPFs6mneYrt1j3Ap4oCN7sp+BlimHKSOZyFYtgktWRvPlk3OfSG+RgRzOKmYk
 n3TV3NMGeDlo7PZdLlP0ygZRYD0D6lYeZNISyiLidrtJ4Cqn5FZY8zuWxCnf/xFdA67KxLT0Fx3
 eYB3p3/0FZkjOAtUUOsoNDvvRO2291jmSWjTIrjsgBf5DABcAT14+gT+IHM4H/yu75ZjQTpQbbj
 8bPI1l9NQXiZY1x6GvcNb88Rbu3PRH7Py3rsxFskerd5ZCH+r49nmTV7YkNEbNSkGmobgH6lxXU
 hxLbmcdMHG6Esb25D+5syZDVI+OQvSJnLUHQjjIRNyyGrvqiW5zS6fPBjZTXK0xrJ0ckqOFMhfF
 tXhYC8DVoD/ICJgnDnQ==
X-Proofpoint-GUID: D27GkuhXomcoKZTpJQmqej40TYJqtGgc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfX4kaSlrY1OqnW
 p85SoD/ARel7R4PrQtdoj335i22epA0rtdQzPGHKr1NSuGQP+meBmvZoNTda1Ue5XnszQd5r8gm
 Qhn83cmMv8cljGr7qdiyc7SYwgZR2PU=
X-Proofpoint-ORIG-GUID: D27GkuhXomcoKZTpJQmqej40TYJqtGgc
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3b443a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uRAUcPz_pJdlg0Cm8TEA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240021
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114269-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6463D6BAF5D

On Tue, Jun 23, 2026 at 04:24:07PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/dispcc0-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc1-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 4024 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 7d84c2f1d911a35430bba7670409f59972dcca0f..874136a2ad9aaa117df2c7ad5c8abc5280b76339 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -145,6 +145,17 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
>  
> +config CLK_NORD_DISPCC
> +	tristate "Nord Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_NORD_GCC
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the display clock controllers on Qualcomm Technologies, Inc
> +	  Nord devices. There are two display clock controllers on Nord SoC.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config CLK_NORD_GCC
>  	tristate "Nord Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 58f9a5eb6fd7fc457607a179d8bab5623fedf706..4282f43e7078f1fe0dde6f942040eb6bd122d7ce 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
> +obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
>  obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
>  obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
> diff --git a/drivers/clk/qcom/dispcc0-nord.c b/drivers/clk/qcom/dispcc0-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0097482a1a94a99a05767726b5a7405cf014fea
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc0-nord.c
> @@ -0,0 +1,2006 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

This include shouldn't be needed.

Shawn

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

