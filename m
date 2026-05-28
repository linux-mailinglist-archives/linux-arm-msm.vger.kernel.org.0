Return-Path: <linux-arm-msm+bounces-110120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBlfAbZBGGr3hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:23:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D74045F2A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FF4230202B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4791A3F39CA;
	Thu, 28 May 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZfziOKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+tWysVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D43F210B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974580; cv=none; b=TJS4VK3E10vM49oRI9WaA8RAenSCawBElxq7ea84ihnBql4xH9qb2scdGIiWC5R38aBvX7WAfzWQpTYGuBBfNNah0pHWDZl8KnJQd3cWpBI2fJzgXJ80T5Adeio+tzqjU6XRrDlPo7cBopT7BarEgFb0n9FQGe78oi4l9HYqTds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974580; c=relaxed/simple;
	bh=sV87Xc8i99EVxWO2FVxuMWot0RX1WUeFmz0bMZPXYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrsfQigMaZnc4AbuaqDhSqKG7zT+fEWC9MDYyeciqelsaP3TzkclBgCMXuCcjtQFs06HBIrJv643ejZ5TUr+di/Vo65quBCdGfBvRWFJTBOiB5XXxGxoi6WjMOQv+WlSPZlkTGyyN3/Kdf8sPXWTwOUf4K7CcFVA7alLBMG8Y1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZfziOKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+tWysVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wMHP382539
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=izu/KqM7htjjNlIIypCwCyXp
	aBgseSSoEL76tVPD4KM=; b=gZfziOKY+bWlMOtAJqDUSsmnkokIbJjjNUVBOvm0
	sS2R/TKaN82Qu8wW4R4wXC8+ktS1e76hCbOUqeQ2rW7zOx+MgjLM8Joo9SnmHnLe
	FU20kNYOYegWZ7AXOfMtgFoR6n4h8OK8So5PSJwnd0BMCcI3vAtfugl9wnt1qE7f
	YllnGjlrHvd790lE6KyYUea0FC4ZeMxAZMrRRWxzHDiyhwdmIB3O4mm3F1eq0xT4
	vQNPChnKCX3G5PmL8ExtZGAG1wFlieBcQmPz5oV9g+Cjh4yjQJU1eeWmfbIATykD
	gSxXdmNa9vqrRxIF7CRz9PQ5w3jijR6b3UOOWxVbTiBMqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrjv60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:22:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so312762331cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974577; x=1780579377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=izu/KqM7htjjNlIIypCwCyXpaBgseSSoEL76tVPD4KM=;
        b=X+tWysVF02GiFnaRJLXa2S234XN+zP3zp6gJ/j2KYl+HYgLdeTylzS07sT/v5E1ZWV
         DvFZ6X775kaCiEPqGM4+dThTyTIoYZh/etcIeDSY2ZBqLLJ86ZpA30aIXk1IrjtsKGyJ
         1p4M1Mfq1tB2zoPQRj3xLzeJVPvQs5qasJq1twbJRg1lONaz+Z9s9RKwuJfFWkKuK3d+
         TopjRYX8i1pqXhC80m8M5TQXDjoZ9QpCUwrLYvJ21DuLi9kVZ5boybPggDwtFxuF1ZvJ
         RxlMAoSGY33FXtfddmi74+Lj9cKHPcQYEQz/dXAb1RR3xud9FPQG/aaFYKTnwnlq9yBo
         jWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974577; x=1780579377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izu/KqM7htjjNlIIypCwCyXpaBgseSSoEL76tVPD4KM=;
        b=ozf+2KpHKlPHB79ut8E+UzWqlk7umF7z+tF94Ea7ynCAu31uSybRLZfuHIa65K3nRU
         FxZ/MSPgNSN3qFHYl/393prfzMb/E5LI+ao/nae9ZHjX+RWPukyYBwLDpsY+AW18Kqco
         AsxEO0ywdC81jdp65J+dnfk7UTcYcfwiGAtKCMzwfGDd0tvfTGXnP6amfTJAkNRP5Fhi
         xNOAtUZcSzwodr+0bOWhl7UqZ8iua8B+b2yXlDQwGhKMUCV9xSI0+Z6s/2c3cugAV51q
         bqyEGKs7TKeuCOjqY2hMMNSe3LUHsZsAr8pr2XeUT9l37pX8QmkhyaYCYWCVXhn9rhOk
         oHHw==
X-Forwarded-Encrypted: i=1; AFNElJ8gXtT/LF4jKhBELdQxtj7lp4wtdFao8sYDa8TukiUpU8Cj9VHCLNi+GEfHtjmV3qOM1W1tG2OqLz/Xfu5x@vger.kernel.org
X-Gm-Message-State: AOJu0YycQitDcdWjbBztGtZOAWViupygyTTs85oVi6lqr79zjDwv6L2h
	rKvL0CNXYdmLZKcCQqzqOeBabk2sa39zDK0pjK8hIz5zkYEeb6mBiz+RWrncMIeuEHNmfsZ6B1q
	fyUZufVDxmyYv3EJzRRbzvlwMrIU+dNZkHlok430iKPhawUGb3jS96DW9c20EeMRsA6KvFwgmqs
	UJV9w=
X-Gm-Gg: Acq92OETnY9TmLH4bmuxdIhM5FzuAWFhOD9gq3/b3t0bBi2ZTiq8JVlOuJkfMYCxIF4
	s2wg8JZPvSlZn6uqkbhHJNxKv33NNm/RTAW6ix0+wUzTZK63nGhgU2kv+lUJk45+tq6Dxbi0nvU
	eerpPSA/gfXQOpT4VjtvOMlCFkbAjHqShRzYU5Dgbdn4V7VqUCzTZBJI70DpP0mxVllRczUS9uB
	3bJEjjQNyO8Jc6jagf/iTvnb9fhlXv7C7Te/YOCJZJ6CQUiJdLNCCKAz1uAzdtzEnl9zxh1Hr0+
	7k//2J6WLqLvjmiuOf7n7xtPgy6pJIAm+aydXRCtuguKAUJVb8Y4YYsHQGOvb8jUwXEgO3CH9AZ
	EKhm/AvsecTWMLesoyZl27R7r4+hnXRPFuWH/I65EzrXaJn5yhwF5VpOSBMiOk6RiFERbfXYtxz
	o/QWf6bEY9wpy3ug3m7y4uZucb4riBnyyz4dSnO6UquOT3pw==
X-Received: by 2002:a05:622a:5c17:b0:516:e6e6:63cd with SMTP id d75a77b69052e-51722f8cc28mr15107121cf.2.1779974576911;
        Thu, 28 May 2026 06:22:56 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:516:e6e6:63cd with SMTP id d75a77b69052e-51722f8cc28mr15106671cf.2.1779974576431;
        Thu, 28 May 2026 06:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462e263esm1915294e87.34.2026.05.28.06.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:22:55 -0700 (PDT)
Date: Thu, 28 May 2026 16:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Message-ID: <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNSBTYWx0ZWRfX/225SwXJl/Re
 /v2UMZk2aud+QVVDDU8tLnxginT3LGwXDpf7EDTAIHMgSoJSKow6+zIrUi/yEd5Ze4MBft3F8zS
 lCrlEyxnZBKvBJ2uY5X8EJglabI27ZMh31Xjsg+o/PGn/5yNdWBZAsAAzdyWNUFoLmlpfrwUwc0
 3zN3HEs23GCREaEWhbrhk8K/vuRgwjEygpkF1rlqp1Qxv/Ttrt+9cQvVTYhIXONuGxbd3uES5x+
 tkMf3gQJJ62kciaanQRUTbG/yGRJeL128pvif6APjTaua6wlOs7rpUxPNPi02JvW3DI3V6m/PX4
 ocwKljLzGmgkpAJgE1tKcDISVbVB6L3AeLjDZw2RyuujKejUL9nYNnLVFRRoW5VjRbxVrao+q94
 huqWi9lhA3+UC7JWDN7sFx088gdspYn8nc6NxqEj7kFV+QTu3zuuTXIZ+vS2rMWHoe01WaULh+p
 UINE2Scg4aixQXHo1Qg==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a1841b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7SXEGdnjidMFAlfwy8wA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MXLwjWjuPJB82p8u2SRERsPKV15QBa97
X-Proofpoint-ORIG-GUID: MXLwjWjuPJB82p8u2SRERsPKV15QBa97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280135
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110120-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D74045F2A86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> enabled from probe as per the latest convention. This helps to drop the
> pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
> Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
>  1 file changed, 11 insertions(+), 142 deletions(-)
> 
> @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>  	},
>  };
>  
> -static struct clk_branch gcc_gpu_iref_clk = {
> -	.halt_reg = 0x36100,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x36100,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_gpu_iref_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};

This clock is not critical. Why is it being dropped?

> -
>  static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>  	.halt_reg = 0x3600c,
>  	.halt_check = BRANCH_VOTED,
> @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_video_ahb_clk = {
> -	.halt_reg = 0x17004,
> -	.halt_check = BRANCH_HALT,
> -	.hwcg_reg = 0x17004,
> -	.hwcg_bit = 1,
> -	.clkr = {
> -		.enable_reg = 0x17004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_video_ahb_clk",
> -			.ops = &clk_branch2_ops,

This clock isn't marked as CRITICAL, why is it being dropped?

> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_video_axi0_clk = {
>  	.halt_reg = 0x1701c,
>  	.halt_check = BRANCH_HALT,
> @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_video_xo_clk = {
> -	.halt_reg = 0x17024,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x17024,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_video_xo_clk",
> -			.ops = &clk_branch2_ops,

This clock isn't marked as CRITICAL, why is it being dropped?

> -		},
> -	},
> -};
> -
>  static struct gdsc gcc_camss_top_gdsc = {
>  	.gdscr = 0x58004,
>  	.pd = {
> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */

If you are chancing the driver, why are you not using .clk_cbcrs?

> +
>  	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>  	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
>  	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

