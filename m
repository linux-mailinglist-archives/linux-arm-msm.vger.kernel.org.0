Return-Path: <linux-arm-msm+bounces-107924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLtlMnciB2rasAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:41:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB45509BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D29C6305F046
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE07747ECD6;
	Fri, 15 May 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTfuL1y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPSatr52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685F47DFBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851908; cv=none; b=Tkz+2oQJMwq09TYtu3r0BhY5bgQOY2ccIhvR/N5pgUH/BUy7Tz3LzGalHKC14KEm3RI5fF//EBo01Y72gXmmPE1BdE/JaoiWn6vOwP/ttClSw5sh5wacBB8qQViXTB8RhulpLNc9ZrRbYb5PNrpfLXPtC7LHJgQGkhc7gi3nNIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851908; c=relaxed/simple;
	bh=x3KC5gvjDTWSMf7+jkoN0GhGLGzyorgflzt4JqGg6/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBP9fXwHSn9BCnpeayfctdRXOKQBEJYHEuoMJJqsDx6cPl+7vZQ6u0OWGlQ1UMtjcaOjaQeZNUem50gm9zDTp6wY2rMaUIzVZ4l7cW67j8QKUmEpERWnwbcKM0hBW+yK33NYoUNJScZYkFRxiCjY3Gfx89rI1vK40kEncnKc9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTfuL1y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPSatr52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBWX4r3795697
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wLrE+oAQthnuDuTT92AIEx9
	TsN3ufsAGSFIiE3PcpA=; b=FTfuL1y4JNRUKPQ5lNia0ICqMbz/kQUTwXF+iz6v
	uvMsvhIGbaXc6SxFbrE7Qq8k7ukd2GN9vWZqm1ylO80yOPjp3ZHcHCDigQBd6i2V
	0LgHPUQVtYMXio5MPI4wP7QP1StXTMcAjRwOJfsaho38+IN53O+0HC1j1AGIEQpA
	UFmqJISUzdWv2UoEsDkdb5yhIiLptVACn686Yn1A7yAp4UV8KBq3mb1kBIpLQvt5
	vHF6ZF10EOE3WOxOh86N8nyeQC5zhdqXdiRiURLRQj85tNt7IUDV0HSVIOHhoOF/
	/UyG9/xj0Q6pTxOfewat6/qbEMUEcWBeiwxjqb85EuAhzQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sucfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:31:46 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e06cbc08d6so24790714a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851906; x=1779456706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wLrE+oAQthnuDuTT92AIEx9TsN3ufsAGSFIiE3PcpA=;
        b=fPSatr52a3Ecjeh8+VXzivXgS1x4Fg1SoMHb7WAMYMYEYI/4QbTm+j1OrAmr/qWm8V
         pwrPAl9O850IvPKuVnG+dbHAF1DKj+pg+UyW5WEpS9zWtI1k+c52kl1CfeXMYS1iJBq9
         PfimSulJX+5zzzLPPCXgo8go7U1iC+p8Kek8+YLbL4YVkWjV26zYsz+BUQyLBvtzLyLg
         7sZw9ETPQ2SHC8P+xBFab4cb2JTO560f1BV/IX6DEvBygSovmLZkbcpHrxnREIor8nC4
         xz2VLxlPriKDki3lahVJ1dzIISx2ekeEeMPPn+7DHxUn2hifVrIugl5VssgHuCzCVQ12
         tGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851906; x=1779456706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wLrE+oAQthnuDuTT92AIEx9TsN3ufsAGSFIiE3PcpA=;
        b=qQwPCsufFenDaCiWf3x2MRZRrjIa5+pOASsnTjy5ThzqEWlPgfr3wuK8bVoPbBmioB
         hUutfY0rCP1Q7j9oyuqtJJCZmsq/SeIB4HRlp/iuQm7Bb7VNB0DwM/zdC0srKlDqs2gC
         zlagy+hmhX1g7pXLO4Yyms24J0rNZ99klCxsEth6z3PodG+f6luVREVGQaj9cDvoYEuC
         wzkepOxDV/D0qVAgq3xyP1g2RNl+oheGtBrsg8Ov4J+/BQgCJugLHtugvyIdMjOm5wgA
         11JiIBKeJWWnb5ejaO0db7P8JfOxMm74qFabJfg5QPHPWLdweFEvi2v9eNtxiZC1OSMm
         fiag==
X-Forwarded-Encrypted: i=1; AFNElJ/cLtu3fCv4cQgZKCGYF3v0kZ28zO4Fx5sqmBfvTRug4lT6q/lIDNVEFeM9+iUUu6hsZwGuQhVNvDtz4WYN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3iLe1q6PaU5L80oM4L1c49gH0Sdpn+bIZUQ9B7uDrkEFkhI7
	5u2vV+eWroMGb7bP2BtQ+mhQDnNvYsYAbe9ZDG/rNE9CkLaSTqFkwiEfbJBxbKAQw3rJyc6kWsQ
	pFQMSwiumJKM4L999BPNpFX43Gi3tPm7xYBBmlYNNFRBVOO1nbWXE218tD+dtBi6c1vY0
X-Gm-Gg: Acq92OFxZ+imO/HDn0/bJkOnb6NQ27QUGPFzHn9FzGNt05H9QtPWAstp7qyoC0DihdU
	uHCTQaC/ObA14PMCi4Umaxi+lcUEsbZYYl03COqREOiq4g9uf+XQFCZjj+TIZWpegFcXXy1aN1X
	Bbo9CUduqnCDPR3nZHTwG1d6/jgZHBDwkpVD/zlNs4gar0DfrCWrh5mjRc4xB/Yp27TpjsWVrWy
	HXDXqIFywUqI8o2546mcim8niYiBriyBOh/f5wXQdgxprr1BAEP03rtT6ygfW6ieWfv2YH6uLya
	h8pB/E02PDV6sqOxrEzqjy7JFX8b1NX7tslSR3jIDZN/MUevs6sWypXr0X5Zps+hSygFUzAwuUu
	MPRW5T555J763b8CrOHNw2zcNqNqKHMnLcAuwhW8fL8OjmEXChZTrJxows9to9NACpabhxSHZk8
	y8XpGJS9gW7EO0286/thBfy4gyoHWPIZ7DY2YkkkN5K6lt3g==
X-Received: by 2002:a05:6830:3809:b0:7de:44a5:51d1 with SMTP id 46e09a7af769-7e4ea0818c0mr2309407a34.7.1778851905555;
        Fri, 15 May 2026 06:31:45 -0700 (PDT)
X-Received: by 2002:a05:6830:3809:b0:7de:44a5:51d1 with SMTP id 46e09a7af769-7e4ea0818c0mr2309325a34.7.1778851905111;
        Fri, 15 May 2026 06:31:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf0a5sm1313704e87.75.2026.05.15.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:31:43 -0700 (PDT)
Date: Fri, 15 May 2026 16:31:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfX9Baw1CYvT+WM
 fGGEtyF4LMTSZx4zXCT7J04GY5khrB/N+ZdWPLiSAyW/sdeLBqc8ecfRzatI2KgVN70jhw6Ou8p
 cWouCpiJ+0dr1cs0HGq91+jD1YgSnetSxdjXrKDdh+CDKk/9/5A8fGtLCFGDsZ0GpqjasLRQN3v
 hKHRF6FEyYpUsAGPDsYnezruM3KuOORKYUC91HO2kKO6lr9JT5RfPuWYZJEnM6016i+1Ntkeioe
 z6H+pBztnyJw3qiNExPlhzqkTFTLBYLMgiHwG2/1SaHemxynxJKUtTrpXRU7ch4NJ7QwT0/HkeP
 g96BUGFfQblNKSZmo/+B6gpsRnXqSAIHQe0vTQFmmTEUAGvIGxA5d3MN+R6j0stvT3glENjuAS3
 dgEuy8D0K8aK1gUxpiwmgBLDdbpq+pK80D0vPR648l+Fyjn4CtfWZk7ENizEtBAFtvzho7/bbaS
 OifVOw7GX9FVfbeCKVw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a072042 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8eC56JA1x6P3gbDAbPwA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: oxelNk5VbCkWz0vPDx_uJjIWj_Cg8rdg
X-Proofpoint-ORIG-GUID: oxelNk5VbCkWz0vPDx_uJjIWj_Cg8rdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150137
X-Rspamd-Queue-Id: 5EFB45509BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
>  	.driver = {
>  		.name   = "qcom,gcc-ipq5210",
>  		.of_match_table = gcc_ipq5210_match_table,
> +		.sync_state = icc_sync_state,

in Kconfig:

select INTERCONNECT

OR

depends on INTERCONNECT

>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

