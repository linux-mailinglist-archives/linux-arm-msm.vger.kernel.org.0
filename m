Return-Path: <linux-arm-msm+bounces-96376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E8YEZU8r2mDSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:33:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FA241BB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C9C3099223
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D2364935;
	Mon,  9 Mar 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTxc8vQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0RSw6FL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50535A93B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091752; cv=none; b=bYNeAoRjaCDkWta/Q6CJl6C3uhU3rUK5zT5v7X2UGMaxKxsTe2zJFP/QvMMYnPest2pRxtyQ2c6gKuE4V1do+pNIkTYOug5gNRR0JnLKpRaIDvyCaqJh8TCGmVdku1OU9M+JboQHJeABgV2+IDLgRPpJjuU6VGxwmuVtWVGncGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091752; c=relaxed/simple;
	bh=yx/PJl3fOh8J95iIDiPr9KOd+MZ3nf8yHNz14rVyUdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekhE/og936Uti1oEplvL149ZKEpLSYdTyFfUgGInZL1ViXcHfGAG5CvcU23G+ES9DfYjGFgSnzPl/9dPQsnIElw1Wb0NNytW2sk9p/f2Pi8IrNCDlP74c05kyKaJ2Vuj1v+z/Z/BxXuHB08MQHjviposPS6fdpgkmG+nZdoyUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTxc8vQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0RSw6FL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBh1q1660014
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5rtAzHt3NbBvzXh2JyDmHMWK
	PJ2f2balQs8e+pR1eT0=; b=NTxc8vQwktdgwjKha6NJT9BAaTuetQBlt860s7Wx
	pHv/QE+8Cyzi/SNnU9UJNFNcPOG4M+1ybPa5T/Q8bTdaNQGkTC7ps3D/iSsqLrHs
	EFpPpGLfToj8OMN4JVke7l1Vjw01Pfym8usgNafKJaZE2Gzm2lEdUu2Pdy3PGNne
	ni9i0pb7O2usEWbgU9cn1VShgZdxGfCNYrd7NE2CFNEO5g/GcKzsuN0xrnSIqpPI
	WukWw+AcdTqWLw94uukDeZELVy+AqxoTrfs7oMZNkioyKLiH9EfcFlPUlMkoD0v5
	1v/EW73IwmMaGJt4YFSqHe/nH+AukONrtIvk76usu0i9LA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41c3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:29:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a178d7270so187022986d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091750; x=1773696550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5rtAzHt3NbBvzXh2JyDmHMWKPJ2f2balQs8e+pR1eT0=;
        b=c0RSw6FL7NMNNuQuWI0rfqVLSlbqdF821Nj0mjbMd9NDD75fMijSnroO/eW23kcknd
         mdbooMkElNnOoVNW804k0tyuo15ggYNVEBUl8iu7sQqbr0q/szhQ+T1/e4ER9wRfy/lR
         ukNc/6iL0wuMTyiTJmPQNDOHUDtYY8D+Z531zD+DJp4mA7x8/J7JC2dD3QCuoaj9f2CZ
         hJ8ZO4LTrncWUw40jYvURPldFyrMcf4gXU4+4gaoKNd38XRUet17ATlBEo9HeI6SxW2C
         YRIqqjyjkAwPPxE26pxCGzBSh2psrwB55NNLzp2lE/RJf+pfrXYZvX6y7fOCU3pROhk3
         l0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091750; x=1773696550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rtAzHt3NbBvzXh2JyDmHMWKPJ2f2balQs8e+pR1eT0=;
        b=BqojIkPzbsBJskw9ZtZvqBMQ8d9y87uJAS7il0XP8EitYAXYMm6PHqVUZBjxrAZlup
         BDNabKxTQNJ8LUSCU5bEwtJtUSnyrTdefV7mLqwReRZO4Thk9rY2/jHoc+YKud8MZul8
         Q7wBIAtT2+pWXrG1ywJ2fC5rdBRsImbvet7ehNF8g50XfEQo5Q54yKoVG00O8UkLLW+z
         Mec2zKResXeHsHywbWlpIXlBBMdRboC7R9xms9kwRcTEogsbrB7UQrsQmQT97xL7Z22G
         tLqmxx2saaEDh3a/znkslIJ0jGAyI8MOzAjdqvtK0tEgdZr0B7RwphFXmkCeVQxddIpU
         y0kA==
X-Forwarded-Encrypted: i=1; AJvYcCUAxiI+ctgPOa2CTFK5CqKkvCRFg7Dpy4JjLvROJplqXSI5X6wHAAoaHOlaN1j7+CN49Mo6m+5PwUKIR8nn@vger.kernel.org
X-Gm-Message-State: AOJu0YymuZbLASkQsv4TCFjGyRDNpbp9hr6Qyi/H8Is8+5GH3T20ZEBI
	714iIlqWBxdjs1kSGcPIaqRXi4qm7oeWage9Wc8U15EsIKKrHqnILORqNTZvBRGB/+Wn+xPk7uz
	GbD4ExbyLR+RYTUuDehJJ5S9RyU5mj8xZ2yyw+WxQvmK24qXZUUw8EopiIvdmgU13RSPi
X-Gm-Gg: ATEYQzwypmVxzhPvtKUelAN4o/GhL1hUW2h5y7GJ0T7+lctfG4h8bVJbsgBl5wazCDE
	gPcI70M9W4Coqz1A5/Z3b7RGe6nq5t4J5wvuZcWpLKa6OAA1HM5IrDTtYLFbww5vBBbjdzmfcL5
	/L9uRRIGW2NAngGSeMRNdwdvDRmXHRlwohgSCAQMDi4KhPGI7f+w7c6P8pfEoct3tq3u4fGhWQr
	sWtEBb+sv3ilSyE6i2Y/Icyg/rzWlBZspJ/J8LdO3vkcKskqrp+ERKNMGOrTw1UMy3dgI1TGxvJ
	NrlbTDdoi/YtoB+fHuygJStaSSXjKfYLwEogFG02cLkhVgVHYKFuJ0i27In+wmJvonkaoZ1s9VD
	Cq7u/zeeyA4ulFk2/Yl9r//PwORdUdbje8OivIDjNrB/d43luw8yf8352wUm4DmI3KZUuNSvTam
	LbEhJzWAJcI5C42Dbx8JlK8O3kV6HArd6coSc=
X-Received: by 2002:a05:620a:4147:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cd6d43c6f0mr1633871085a.29.1773091750045;
        Mon, 09 Mar 2026 14:29:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cd6d43c6f0mr1633867985a.29.1773091749621;
        Mon, 09 Mar 2026 14:29:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d088f7esm1383011fa.45.2026.03.09.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:29:08 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:29:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Message-ID: <pdakhjbawafhsc7cqlcyd6n5bn5n2llpiaa7gz4h2kubz64fax@kv4ttde6hl5n>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-2-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-2-f682c82f116f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX8WS62DNffFmw
 VFDRJ/nWdakw/rU23Eebs3juAI/uMX/ykeIxy1HLsF509EaNnhIIa8lIyavV3YPIgzhCn10QWsm
 V0dFD7NERwm7V8/dnUNlJG/uVNwaimVVY5sQ0PctuMMOEKuKde2p5/3Gffcf6R8F8AFwKffVPoJ
 GmnK89HJfKGb52icV4VCtiNo9Rvg6rR+Tg+MKTAOJA5F9xBJBG0BGZgKru5F1qnQ1VGENTGOn2s
 RxdzGlzWDe5+q8q3EZbgli8D6PvtPkmQvsUrALuzFRcKebviFjbUISoOmT/Y8pcSvlSyr6U3+9I
 P+e4OaoStaqETbq+jRygt9jxCjRH6jDee/5MV//oiJJ1RONepmytJdCEC00yhq4mIYQkz58S9st
 HpQpXWWULfj3H3aCyq6Wz6x/eV6WOb0JWEHET3W3ODrPfs8zGA0Bc1DhzkQ7AyBt0aZ+NyiYv1+
 H4mM0F5bLmVIlKMPJGg==
X-Proofpoint-GUID: LQwMZvk3Zg-3eHnmZo2Aq5xIKlMlHqwj
X-Proofpoint-ORIG-GUID: LQwMZvk3Zg-3eHnmZo2Aq5xIKlMlHqwj
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af3ba6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5OlZN23s_qRqNvjSa5EA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191
X-Rspamd-Queue-Id: D80FA241BB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96376-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:06:18PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the controller needs to scale the RPMh
> CX power domain, otherwise some of the subsystems might crash or be

Which?

> unstable. So adding the RPMh CX power domain to the controller will result
> in all GDSCs being parented by CX. This way, the vote from the consumers
> of each GDSC will trickle all the way to CX.

This seems to be irrelevant to the commit.

> 
> So since there is a power domain attached to the controller, enable
> runtime PM.

And this is relevant.

> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 0f3981252a68..7cb5076a460f 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -8578,6 +8578,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
>  	.gdscs = gcc_glymur_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
> +	.use_rpm = true,
>  	.driver_data = &gcc_glymur_driver_data,
>  };
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

