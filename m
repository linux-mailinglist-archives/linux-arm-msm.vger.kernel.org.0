Return-Path: <linux-arm-msm+bounces-97953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNT9BTv+t2nrXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:57:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 797FD299B67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61099300D454
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FCE396B68;
	Mon, 16 Mar 2026 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB2qCFJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0GUfxRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1577396B78
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665768; cv=none; b=DdXaljpbs2rX1CN/KxVLB0tvSlhdqngmBl2JDqAXqJm7a2H5LDi1Ui1ZCfBLOeYK2iNy0TRQqwpfnnAT2k4tMHVKyAqWxCOB70SmYtJxdAiM44xh0Y4awpV/FEiJLNgNVI8HJH5mvNcyBSm5xhmJeosAcDgVBiwQJ9VAZuozzYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665768; c=relaxed/simple;
	bh=UudFQD9Y1asIR34bLW36Fh4vtDgY3XFE+jPhNUBfFis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HscdZQU6Yg2G+8KojvpgyTLYJc1WK9+UQW5rs/2DbstvfOmIDFNAHLQulF+fX1vpDBoSg9/q75pOb0MuQysLALdQJ2J3WQulr1BBID0TzGiLOu7e9p24pR+DKBGiLUvLUSBmoHhoheih2Evy3BbVC93JA1bc2R5TtmnUj2fm0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB2qCFJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0GUfxRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBidlG1724710
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnqiazJWrahgpC81KIxe5p8g
	n66gwt9igbrey0G4FIc=; b=dB2qCFJ/dUDq3K6n/8SuCycOEJBAVkvEfJFoVKf9
	jo6rP9wOLdgKlv0wf0e/nQ1FP5AxCpn3jqkCsyK4KR/dsVf1mu9GTxYj8csBMOgs
	wdS93hlVGNKTahQ2UAqJPbeJq+2/reL77/SCmRg0G6T7X4M+YrhcfkiBY2PFbTBg
	IslzBpsO0nynUnxpIF3hCi2u3CjI883hFxz63/kSTOrONX0NX9UbxvWyVvcfl3ux
	YXF47/3s+3TbF+1S4h3EBPHYUtuU7EAEOi5vnbs5T0py3GrP1KxP3M8Oq04TPvyi
	C8gBT2ZZldNsFQ+BH4csyFVAd1pb6HW9ptzLdWsazS9aKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udnnut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:56:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so2677788085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773665766; x=1774270566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnqiazJWrahgpC81KIxe5p8gn66gwt9igbrey0G4FIc=;
        b=B0GUfxRfFTGsaA9XdWzSI0KIFJQu3WbBe1XEzZaQDROykLpyY4g7wujV+qAHhP6p0X
         /H7C1oQ9Td+8FsFfYEAh9lNnPCuO3jIHg0YgvN4lhwzG4RddhMh1yQz7R5nzFTu3Ad+H
         /ZgMUcesVie92UNdWpAy5OI5us7WgWG6e4rKWDTEAYhimLWu5HqKk5uxATsg/z2Dy+45
         skvmjx/6AIpc5/o+dk7EzMLCoTm9UGOx7IKqypWM8dVKAdwenFmVURc0MJONBL5WoxcJ
         sBnrIHAh+cGvkJIMiwkM737NvTJhi7by9h/PX8b8e7kyIvBCQJV6jYDnCFLSUwxPdvHQ
         JOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665766; x=1774270566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnqiazJWrahgpC81KIxe5p8gn66gwt9igbrey0G4FIc=;
        b=AkcDNglJYlEcWZBi0CZj95o6E6uj8tk3oX7mGTKkzkNvjpLCe/tlewhDet1tMJh+3O
         hceDdKrjnPZtr48ziU2U3k/FEmzmpkS5NYitofuaD50q8NXwPzqolj2LaFOLJQ+Nb4EO
         MGdXvDYN4pNuGEL6lgNUoo+hcxgmOWeK7yV2EOxW8brCTaM3i5G9RqQ+t0Kq0fy6EgdE
         Yf552hmBEp9IVHLF4VIsZH3P+hEmrq+mnJCJzZAJguNpf6RiuZc8D4PG6OFrFMkGOw9B
         o3j7PboK6h8olGxqzWt7XAQSiDEGUEGFZkp29GGeEmzjd8EGff1LV9Dye1UZnNotRa7V
         VOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFZs8qStyTZZV/2iz1515WHsoXi4PwtVe2Co6CKF1D5yF/l6xiF/2QMzUZPt4jGR/qbYJpQ/NGG9UU+Stx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5aw5uyd5x9Y2bgPCL5FTYjnLzOPq1/vwOCUv+O88SUoDPpwI5
	F6H4+BkNvP3CLlZ1YLqS93y8N6y2sAauWO7UIZK1CxUiqk+R3dglPmb/rii6O6+zK8JgGSdJ9XK
	iDi+fWEBjT9Ol9mrQOsIKs299PPpGAIodocPcXCjMjgT8AMbHpc09UX8egHfNIm7rkF7p
X-Gm-Gg: ATEYQzzNKMCkXyC5mx+HSBnn8x7BRhibHWpj7M5x8ogK4MZ1n0EATOB7guxkEcdnwYg
	L4IPSnzbxx7mAXHWYUWfFfdaU1cL4ipvKNglRPmTiHjtPqSMz1GY+SqlCMgYoYfJJARus5cy9bA
	8NCw5BI/i1symtJJ1YuwiJq4FJE0OiDBAs3ZRTZwdpv6kb1q1feq6EKKTCRy01WNmxGGqe1hG6m
	duzkSl3e3X7g5WTajYxs+ntKFwJVRB7KhiTFbXnjNxKVsQ7Ji98an3v9TNWDW/EH8bGytlJjnYm
	gVnTBH/DRKQPZShpyHzPgoLzap0gzrSrsPG27PSpXOxCx3BWaSSaCE2Unjy31GMGMQo6UXgfprQ
	ngcLxaO9gA+vaBJckrllgvf1HRZnFfB18LD+GIUK9q8DL6s3CjVZZlaNBJ1nbsVcRg8QZE4TH3o
	a5XROI3wLNkU7dq+I2JiLT43BS07k48mMiYmU=
X-Received: by 2002:a05:620a:384a:b0:8cd:c18c:9eaf with SMTP id af79cd13be357-8cdc18c9f6bmr948773985a.68.1773665766119;
        Mon, 16 Mar 2026 05:56:06 -0700 (PDT)
X-Received: by 2002:a05:620a:384a:b0:8cd:c18c:9eaf with SMTP id af79cd13be357-8cdc18c9f6bmr948770585a.68.1773665765708;
        Mon, 16 Mar 2026 05:56:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33d16sm3554262e87.6.2026.03.16.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:56:04 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:56:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Message-ID: <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7fde7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=h0ysocOLckJHODvUvR4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f4czeUlWgMvqhGI4qbGwnFD8-ZBwZGJk
X-Proofpoint-ORIG-GUID: f4czeUlWgMvqhGI4qbGwnFD8-ZBwZGJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5OCBTYWx0ZWRfX4gM163Lm/LXE
 vuQ8LO6voIGAi/nJeJi6+SzJMRUO4bKS/yMoX1OGuXudZO5zl/Ha01TsTQt1H/Rtt/OUJLRiM1E
 +gwAup3LQH1UiB6di7MEEHax8kBURtnHu8vN6To7QO+hiIlk4eRGBtMqHEu3hjl+XvMmM7inh84
 d20FHTQPu2CZUOUSFI2sWIPCWU1kVK6KC8Ff7IIKL1DvJ/uXwyOmmu6oq5DGvn414KxnM0+JfQE
 BPQpm6dRjgAaOrvc/qT5+01WGr8MLZF6X14ywpFLXUGkTDQ1y8XGmjv0R1ftZvVKvEhGAuaZR6d
 T47YLL7tVcQlgjZ7+cQD9VLG3AvF84W1fTncF6jmf0kwHPB5BXtRU3ZkJ1GMTrhqE8ASRh6YTse
 WOtQtR1fT9IMxt2zePCGHa9CDCcBUcR+8PbeUkkgGs9TmT9seuyPHrtWcCgvgmwWp76oEn4EyqU
 TuyXS2v8qEuUq+f9fCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160098
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97953-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 797FD299B67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
> Keep GCC USB QTB clock always ON which is required for SMMU
> invalidation on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */

Is it used during all SMMU invalidations or only for those related to
the USB controller?

>  
>  	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>  	regmap_write(regmap, 0x52224, 0x0);
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
> 
> Best regards,
> -- 
> Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

