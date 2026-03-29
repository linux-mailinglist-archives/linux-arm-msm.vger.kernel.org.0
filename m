Return-Path: <linux-arm-msm+bounces-100601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3d1WD5ECyWl4tQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:44:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FD3519BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 407CF3012CDE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8224F2DA76F;
	Sun, 29 Mar 2026 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N47DLME5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAUqmCYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429FC2D0625
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781070; cv=none; b=Ymegwt2vJlyNlcsrFLOyb81j4itRZHZnAqPa0elyXGReSwp8jOgy9UW1BU7AESiSpy7Pu+FmG7JaTXVFlhFZOMzUXPy+LI5l07bfYYISyftPuopPWLs5Sw7LciunO4Ibxd420/n86xJcUyrsA9/jmersdj0NHctMvPnH279XKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781070; c=relaxed/simple;
	bh=vhfz0nPiZUD/mEsvUgfDG2+/f1UsnrHRMrm0iAugh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgWmoxyz34kirNJbTXfkKVr4kuGpYgeaHd2JO3Ei7jOf/mlTt1b0gm31r7D9RE+JRev/5Ic/Nt5dA5TG93bbFZzhZSbLQs9MCZhh10ifNhF3QaAZn7AyoAEPM1uEU/zw/AvLqiY6HF3rg2v69WzUWsJvzrJP3XzfK9VT0pw0pbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N47DLME5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAUqmCYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhbQN581069
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OKdlwfPurs7StbBKnRf2C7EN
	JtQQjcAVg1fRHz0n5Xo=; b=N47DLME57dS9i6E8ZZgUnr3YoSqM/brhkuSx5z/g
	KGDcNEOhenwVziB3VUKmlSBK/9zeV+35/EneQVdFXspMO5u8kvRa2zyDXMAI+hla
	EtTnBkoTeX12YvXO0i6cD3pUdUBv0GAO5wVsoowVS+u4qbBLhWZd8XZ5HkwEqDRr
	bSFbS9sdgdgBe4Er5tmRF0sRNVXgcp+8k8Ff8FkEPVJTdV1JrWT4TQVzRlbckruK
	vGgNOaoiaKCLefPsGkAEB2CdnTsx3QZDiI/d4TZVPGGlVvi83PPco5bB8JcZfZTG
	gYBHWFE6EtaxjRPFkR0Ta++D5zNEBy71SMIsJZEui37WhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjrhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:44:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso49000351cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781068; x=1775385868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKdlwfPurs7StbBKnRf2C7ENJtQQjcAVg1fRHz0n5Xo=;
        b=GAUqmCYkkkBw0/mbTDAmi7Q44xQxK4ukE1FVCT4xEbv7Ja5Al9pgbCK0Mup+I9sfzJ
         9/YonCEb2irG/mhl7PHohtbqbt5pud4HmMXkSKWBOjJd2GTnKsHLHcF5m8Zfgt+Mn6TD
         5USInIFspXDRvm9h8qM/Wz/o0x+MpE9aw2RLnv6oDEF1Zr5ah3jzNM/I4gHoJ/K54nzN
         4Q2FJfd/tNdtuFJrP+uF+WEjsb3MuhStYIPcWw+WrznlUnOOs8ajiP0u+tryLc1LGll/
         t8nnszO2Fngfsoy9HB+1CwfOWCVMWl+PPCMbeKRq82gr/B5hnpzEfoNfZK1y1uqn/ACU
         syMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781068; x=1775385868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKdlwfPurs7StbBKnRf2C7ENJtQQjcAVg1fRHz0n5Xo=;
        b=jBiq9gDwq/UwBOlVyUaEsU6oDjoqSZ8qvDhFASKkP3IuWkXIj5h53ujSAelL7vmArc
         TNvOALqMzyQbk+H6smNLlfC/aNv0MqXGY2Y8ZmHfGTa9A2ZNpge+gxbnClV5JytOxOWQ
         lzhvqdO3nxmW+KW0xHIv7wA2N9ELnI2mbrvjgDpnfD14cc0F55Vt1PaTrrHITzBB0P4v
         KJAAtxMju0kHVWvXRhMBKbrI6trQLCTVkFy1AMeo4IlvVGWRaQeKaLg4LGDM+AVKSKQs
         tY6DM9yW4z4B/hGCcbTcHX+qoO8RLEMgtEMrAxpjM5SHdmZRMQGdzl2yNl83POnTmHen
         WKfw==
X-Forwarded-Encrypted: i=1; AJvYcCWbQ0pew4UtcYVTQIBQ21dDMNjuZ/SDC789d4FAb66/nF8uoa8LFBT5mAXyOxmW1+MQzVAHxtqMWGfXpGFa@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3/UWZP9jPs4ISDUWqXWK1629AhWV/2X09VExBDG/BCPjEnFD
	LspIhtjnW815V4V5fpm9hV4/UrJYXKjPtrqn/Lj8KSCXRQ/JX6ysnGa6aVVQvBmGkLgvDT9JOi/
	QPnXUi02Jzmoaw2YUwohgZNTVbcy98bBpptJvUjd6DIc+yuEB20pHWrB70Qga4KJ1rpUn
X-Gm-Gg: ATEYQzzA0EO6Ft4EsW6wD8aVWKfVxibh/cMKB8gLzQO+AO1CbRdERbZd2GOplf1LO6/
	eAbYy0uOiaY2VzRPdw1sbcJUQU+1xYRAjh8vAsUigb9RnKOl4045cUbfmxo9NMiKz5KUFlYlxXa
	SMVxEdl2y+69YqIAwqMMgiIm1qlOxxpEDejTUKNgmC1GT6uH66DdCLIarWun60KWkqzmPTw1H/J
	7fVjGlYliCQttzm3YdSLCOvJNSpAbvugJEmqFpUvrgcHVbXdoul+00+MyI39KDajeLAzav250D7
	apVbop03/3AreMGbPiTRjGUCpwHH7gPioMp7fE7b1bZR3//DyzoNS6U1TuE3VqrOeQ/eWIWR0M9
	InAC05BoPiGmbKRZcCt2nZEfRBubumeSe2PJOfrGCJJbvwBphFF22eOM1sSqF9jVOYvQvn+whBn
	qcNas7wINSSVuwkCbROLRQPySDF+QJNGMlVEg=
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr130217291cf.18.1774781067530;
        Sun, 29 Mar 2026 03:44:27 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr130217151cf.18.1774781066997;
        Sun, 29 Mar 2026 03:44:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455de4sm959136e87.63.2026.03.29.03.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:44:25 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:44:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <a3rrkgvkc4zxcq5oqvws23lyjy6dinlmfgp34wzguvdxdxig5f@25atyxc7zabm>
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328014041.83777-4-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: TUc-rWOyu1UiOMJP-8kDs8PaPVvAc4Fs
X-Proofpoint-GUID: TUc-rWOyu1UiOMJP-8kDs8PaPVvAc4Fs
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c9028c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=innpfZUmd6CVFKDc9A8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX1Qjv5Ru2ZtK2
 6piDt/amifsEkQEC+jbRBmCGW1gT9tw8Q3A6ZKx/+bNxgPChFIaZkyIyTl6MNWmJ5hA/Bk9y+TF
 V+LpP4sud6XaM7gTgQCmWtUMlKQP36svZYcGLl7iiBxqe/lgta+7LTU9elgpQ9r2PdfAv/32Cud
 RicIgb3CdSe4uBgUajl3ZXijt704hJV8EeDOKvCbgRWCgqTr6oyAYBP+c1Rn9mmJcqaUVddUZsI
 Lrj29Pisrb1dveNZgrLu36pKIe4asiMFF29oEfPzjqKPQ4c+Q/ttv7D/q5xckfRIcVLJb5CgnaZ
 LNitl+Yipv+ubA8PDWCS+eeCj7FcfgP/Gva54Y/HorhjRS6RWR7sMdXaemFPyGrIdJZmI5MlnKt
 lUfPykto2VVWv3AWfFMJs8HYlGCPQcoJlqd8KQn1NgfhMLC+VziufUMpIRiGgvQOqZD/o4q3ABv
 iC/w6vaoi7AdldLALRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100601-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 996FD3519BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:40:40PM -0400, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
> the cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 13 deletions(-)
> 
> +static const struct lmh_soc_data sdm670_lmh_data = {
> +	.enable_algos = true,
> +	.node_ids = {
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +	},
> +};
> +
> +static const struct lmh_soc_data sdm845_lmh_data = {
> +	.enable_algos = true,
> +	.node_ids = {
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +	},
> +};

These tables made me wonder, can we determine this information from the
DT? For example, by reading the qcom,freq-domain property. But...

> +
> +static const struct lmh_soc_data sm8150_lmh_data = {
> +	.enable_algos = false,
> +	.node_ids = {
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER0_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +		LMH_CLUSTER1_NODE_ID,
> +	},
> +};

... this might be problematic, unless this entry is broken. On SM8150 we
have three freq domains, but up to now we were programming two clustern
nodes. Of course it is possible to define that node_id is 0 for freq
domain 0 and 1 for domains 1 and 2.

> +
>  static const struct of_device_id lmh_table[] = {
> -	{ .compatible = "qcom,sc8180x-lmh", },
> -	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
> -	{ .compatible = "qcom,sm8150-lmh", },
> +	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
> +	{ .compatible = "qcom,sdm670-lmh", .data = &sdm670_lmh_data },
> +	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
> +	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_lmh_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, lmh_table);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

