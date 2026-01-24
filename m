Return-Path: <linux-arm-msm+bounces-90421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB/kLR0qdWn8BQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:22:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 206997EDFD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6272C3009166
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 20:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731ED239E76;
	Sat, 24 Jan 2026 20:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWoWePvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHQtNnnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3326561E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286168; cv=none; b=QQ3IbDRcpfTMEHkcptMSckgelw3AVKDFrymgoIPGyLKJfiuI9ELhDbKw2tDU6lqI60XmoU0OkNFJEP6Dulwfaa1rrJzXBMJWTyuUOjdWS8485qzRhkZmZliHZctlr/4dfHuFrVu0Ed8FMw5ln9HDV4u99Mz1leasTcbmyFE0UPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286168; c=relaxed/simple;
	bh=SCT7nQE/hYMoboU+umD+G3VmYfCfWPktmmoJSAp2Jw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl1VaE5HHvrUHQJ4AjzVcI9g401I6wDwFWdV0P2oaFezuoaE6u4xlMq5DecYEagLhdno4zz0TXG9kBMOcXrsS3ewnYH7HC+WzRVNNVcvvzOa8n0lXwDcGuAoyHl+vf8mmZI3W+MIFAchki/6/5nTAv81TtN/UY4+Qtur3jBBdXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWoWePvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHQtNnnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OJUfYq1628488
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oFPaTDK3TLri6Kv5yIIBf32t
	fJCORMMg2vmVaMPtZIs=; b=lWoWePvQIOI7JIoR7sLr8ieyUi1ZnWmKrOMPShTG
	XwfYpC6+J8hjFZpszixxdJwuMtJMSCp3U3pzat7kFsENUjLaLnibaRdLeoOfmfaZ
	dj+zcktWne/b8wVSxyTojUGupn2dac7xMJ6OKZGIiq0NAUfD4OEWjMD9z6e2jn+4
	PeCbJracr29gF8FAL3iAKBNsabnDO8a48B8XxLwhWEJMtk4abZBSWgl12ctIpZA3
	KGwRy3XqJOB6p7L5oANLwPAAsTvML8wkdR1L2ZoQSvs0j5pI3j/qtplVyAH8G9p9
	lL9NxoPRHewyKN+USjkdlLb5R9xwXSZXaL5CrnNIUq8vxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qh4f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:22:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso1098664285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 12:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769286165; x=1769890965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFPaTDK3TLri6Kv5yIIBf32tfJCORMMg2vmVaMPtZIs=;
        b=SHQtNnnO65XMmq7Wf6GfNPiBn4DA1QfrcdrsRs7yBG1w9La40Dk53QTfpdSrw7LNwk
         IgRqmnNrM5JtxLRl0A8Exir60qy9zaLEvzEbRZY8F7rRuvaFxyNi6Q7amhMaTmM8G2zh
         /kTktNA2aDuZfkhfnd5cYkEeOrtxtNbjPE/n8EiC7QtHPkEf5T21gUvm3gXlRFVsK4m0
         rSoVBt0cGMbuXLO94eEQO7dvlEXljoiCA/VlA+g/axgvgbMDDeqJj2mg7qqzx/eq9Z3z
         S+Hy5kqXQ1DIKhuy6gf3v3XOf9aPu8IXIa66eSr5ZXumvrp9ZPlB9LKQ/7NdtazuqExT
         FDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286165; x=1769890965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFPaTDK3TLri6Kv5yIIBf32tfJCORMMg2vmVaMPtZIs=;
        b=vM4zDfiAM0tXQV50tzfizSkiIj/QJaf49zLV7in4NSqENsBjpYUaT9zFx85rEd09fB
         iCBObasQIeQRlQs97AJwtD8EocUT0GZiN1rVP1CJkkYcYZ/wRnp5+RO6DWbUADqkDVUZ
         FHVcoYo+h/X6xvMKwu8lf4+tlQgyiXqa0uZpAz3Nfikeowil+ntpoQXLP2foit7V9Mmg
         w17RgieaVMJgEeFeHSAeyHLQUVfaj9imzFgV0/d9ESj+WDMKFzGXsm6NWvlK07wIrosl
         +fIi+RUZhcmb83eRWu4mglpY2oX3LmqAi4vdSoAfUe1WB+uVM39sRKMmuPpfUMiNl5HQ
         d/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoEtCt2+ZJUk/cCxGAbQsk6MfhluQzk7PjLdrgocxC5g0oesGx6FI87YTa54nP6V1E5f8o86W2Qh2QZnRA@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOyMNRhm06ovBhWac3XD1qSjKOt57DDTKaOdnJJ7gZMCkBKuK
	JR0mZwL4Nq+t6/xQLyjm/OcskIAwjkTWjdvmvxbxlAzuBcggnic5gwYK0dBmP7UW7ZCmJUACZNq
	jbUeVjYHNV60W7xmF7TUr9uLjqomZLuZTFeYoxOIcq5m0FPUAOuBgUojhpWmrWf7CWKGpXQgew9
	1P
X-Gm-Gg: AZuq6aK2SY/T47Vknp3m0jIuCLv04nRNcHdc0L5USNtIUYjvwHuPA37+4O3HtCJDd3O
	0KrR9GB9AxoLDvKiCrfBXDfzNWQ2VNO0Z95+eTKkQZAY7zpwaGwkwyMsp6HMKQfiXlCOlNdrtkG
	6iQipQJncSdYbdzaABAD9ZCP5Q05fvkYNlrdOFsxgCJfhOP48OfopOwJcmKnWSsGOawmh3aWN4W
	XKVoEqsW3iO/7W6rUJxXLLKUyoN0OnKkvyt1rmYzPogmp+R05y52Cc21eCH9cb7cJyO7tiEtc6z
	G/lobXW/AEUf06pxdd9fqHg63hVOvlgDTvcfHoqC3nnKrIXJmdz0kLufsiG2j5nbXbs0hb6SNAW
	DloqZy1Rgh0kZtk0L+G3GxSJa852GdDebTNyns8YTUbbWJVBSIbc4DR7FCfcN02IRzK7VHZ/hZo
	ZYg3XS27+h7MC3Zo9knVX56bs=
X-Received: by 2002:a05:620a:4687:b0:8c6:a57c:842c with SMTP id af79cd13be357-8c6e2e363dcmr858944885a.67.1769286165086;
        Sat, 24 Jan 2026 12:22:45 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8c6:a57c:842c with SMTP id af79cd13be357-8c6e2e363dcmr858942685a.67.1769286164662;
        Sat, 24 Jan 2026 12:22:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a6c87sm16017121fa.36.2026.01.24.12.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:22:42 -0800 (PST)
Date: Sat, 24 Jan 2026 22:22:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
Message-ID: <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: y1Ekzin2ufH8OiAm3gqGffHQdfyhi4px
X-Proofpoint-GUID: y1Ekzin2ufH8OiAm3gqGffHQdfyhi4px
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2NiBTYWx0ZWRfX1okLmmEfP1vr
 1nEdtAIRMafHqDV8W5rN6dun0EtbrvmQYbfIYow9ihQUVNfCnHUAIoBWue3e8l5WlDsyA2/uWov
 iSCOb6Y0xCaxlWJrP1NaRkPHkL7XQTRWKDbn1Dn5fSN40b6BkTcT8p0hZpUeAvxzM/aUBEiR3jw
 GeNNO2NroR2cj36ntsbaZslRm2Z70TllQD8jVhn2a1Ke61YITuD4yEDS996XHQ4xzDueAsaPA8J
 Q4NCngc3YzMr02T2QYqW8Osm9neS1f/T0YIkprkIjPedJtHXXGcOnYCE/iRYDVEFIjNtgfquf+t
 4lvLEcoIWhE6UlKbhKLDu6nxqyjdtKIQdBiSiHYCV67SBoAF8ra0u5nz49YJcA8yvquCyDepJyb
 mzu6Ov1YcmP5mrXCg7vNtm2TWkLB62Zqbt12cDQ/LyPeJ0ZsNA8c0axnSL/FqmXsRJQOjzZg2rN
 At00tobfUM5Mq/8ivHw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69752a15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aoCLA3dNgO5RQvRKTysA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 206997EDFD
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 11:05:03PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/gcc-glymur.c     |   1 +
>  drivers/clk/qcom/videocc-glymur.c | 526 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 537 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7445e396048a5bba23fce8d719281f..20af4340b08f98773eadcc4a97b1669f51277eb8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_GLYMUR_VIDEOCC
> +	tristate "Glymur Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC
> +	help
> +	  Support for the video clock controller on Glymur devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode and decode.
> +
>  config CLK_KAANAPALI_CAMCC
>  	tristate "Kaanapali Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..a71dfd0ddf5122d91b5ab4427a9e36cdd57f7bbd 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
>  obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
>  	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
>  	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
>  	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },

Separate commit, description, Fixes, etc.

>  };
>  
>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a5045866982554ea46a9d75033537e7771df8fd9
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-glymur.c

This one LGTM.

-- 
With best wishes
Dmitry

