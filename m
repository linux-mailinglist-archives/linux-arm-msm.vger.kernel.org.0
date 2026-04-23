Return-Path: <linux-arm-msm+bounces-104325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cArhCAoU6mmytQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:43:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DD452296
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59CD3307D588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E363ED5D6;
	Thu, 23 Apr 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2qhwwt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAiWVIuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCB3081D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947988; cv=none; b=ZBa4mutNr4H+qABk96B58NK4CpTC0zDFQdDUPeSNIPtXQoqVUApc5NxkI4/DvIukOmiV89wg3ecaJvqqjbNYEgPDvJThheuOawJmWtLiQ/LHNxPBEDF08eJP3dPpr/l+maY8Zvay1D3IiHjri6XdoFcG3PjEo0wY1+Hx8RqWa3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947988; c=relaxed/simple;
	bh=A6hBBjjIfDH/uUohRfa8UWvH0sf+HCQmBnq0isVIbMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCL9QaCr/tybwyIZBaHIFCk5yY5ZKKEJaEdnJ+kY3KdVOd63wh2/BSBwlFuoVg7QoFsuMcJIiW7xhZYLSQpRkVM7jk14UcMxWuVH3SugdBNmmSUzehIJ7x3mCkS3yiAQK1l9IkHo1l/8ABxLVxAxt52EtuM5a9sxB3c4KEH6uc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2qhwwt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAiWVIuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tp60179248
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y/sRZd43PXMTXtDKzHpqfTW+
	WXL2d3XAXP7k98FLyUQ=; b=R2qhwwt5/qakyGb17GEKm+rFRiVTIgJBCFYTEWiH
	v2ZSetQ8h3XwjdZ+JAX0S7ByKLN5HnpNXTZoiGKTVWF6jsaaXv2KD2hZzL4EkkJo
	GeMrzL4vI4e2tDTHyVGjPqUZ0i6b1HsEsktVdFJtdsfkL8Gf2wCZCFfKFlKrBA+Z
	9tUwi2RCE98DhwC3kPqSziBE5OTn3NBhoB3EWtSIhXgtXQQV7NSIcf3lnuUzyAtB
	hOzfZDK7LZQJRJy6r8SgXHOsCs7YYwoxGtmR6ExFPmWZADRO3+kf/Ses9CF6oxvy
	8Y9l/OZvcpuhYxd3Q8CmbYKRgOja0znL6A5NQVF2w74NSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hfk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:39:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so8236121cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776947985; x=1777552785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/sRZd43PXMTXtDKzHpqfTW+WXL2d3XAXP7k98FLyUQ=;
        b=YAiWVIuEEipLj+Lg7QPK369c7jhGxY3m0G+fqpK/a7CHf3douFsfTr2FqRJyRGG84l
         J6ad7IQlfx1W++8LAGnswxc75c+vxLWT91XxDDeiMbL8ln49cRt25oappDVfpEhktKbP
         eBGC0LtTwaUX0Blur51CMwxXmDS1vg8P8B72YqlLp6hYWk93UhU5JjQx2K6nbRoLFn06
         MFPil9FKBPp7jNY2NyM6aV0Szt1uHiN9Gbd8YGQYx5ma47s6UQvOi15EQLUHiCzFaUeI
         P+Dre3XrZbzCeDgSrIul0kq95M4ffVd9V406ynk1diRpQAoJthyvpaN2FGHJRMLmnAFs
         s/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947985; x=1777552785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/sRZd43PXMTXtDKzHpqfTW+WXL2d3XAXP7k98FLyUQ=;
        b=bbphAH0CoIdomQ/tM2TSO+KsvSyhqOFEeoE8GF2dwk068fTYVT87zJLkPIFUBxNNjg
         Q1TxVriMY9/DhmKrS+cEoblCO5Sld//ogwpTsASDNSubOACJTOPzX5W4scHjhzw8m0A3
         IHqeqLDLtGfCMkphVqhe5qy/doBBlFcE1wGNufJhRPkfl0HNRI7YsAT8JtcyM1fq+lgQ
         0vEU7zFEd2sNMOFDxku3zrUrJZwLkSitOC/sjfyfL3Z714kcWlAOf15HlQgchu40/QCS
         RYD5bxvPn1N6SMf2wc6fF3BAdN4xYBQx5W8FxxjMY6PJAJ3gKBl5xdWV717V1fR6iAss
         XNrA==
X-Forwarded-Encrypted: i=1; AFNElJ9x3QYD+n3Eedt0/dRumCKpknetdmvdK5aaDdZN046UFEdUBVc3ff3QeyK8w4KxYKUtum9OLbAHWqzMJbud@vger.kernel.org
X-Gm-Message-State: AOJu0YzauCjzHOpBGJru71ZtN+DqysjWWNK3ufWJhI/KeQVCPyTMkQEh
	yAvCmhnWzOn9gP+IHPPO49fuCMk7bmSLqD947H5COjdTZpyZ5SDWSuhZvrJz1qwT7ptc4/Xmprc
	o8/raUr3UF9sHLcKs1jCbEMfQsna1+sFVLgjQkM3PQIMhv3WU+dKVv2BW5bekYZ3ZmFrc
X-Gm-Gg: AeBDiet7AlNsjc+mcvtnbS/D0MaYECBgNfGptczVINN7WZpnp6zaKXEab8o//6huSxU
	ykZHa2n9XdzqOkytW61phf2krC/k//GX7/V+zA56aPPF614hq6nEunMdfbIrKy50pfC384nssQf
	EoJgoCTI+VSZwVd4jfozMhgvKcDs/PmfqWg8VvsMAD/V2WBdkzjfIWwMvg71ypPadUrkDZhwdqJ
	rxI2djC4zvXxrvfozg1JxuSyzoUDwMiTgRJDZrGL4VlIBEc+f7JJKWmxkyzYBOjRoREvo8tA8jw
	6MqzEAwpVFh7cfeGmEoOWRP29Dqar69Kd82LKrY4aNInzEmWJ39LMWc/RFT0z/uqyHcLowexuWb
	Regv0TsfUtpdhk57TCDVVLcWjCXVkp4yIM5bI7MMmapukRSTxc63Vg7NE5laQD3bfFh82NNXd8B
	QI3MkMjg+7TF+h7J3GtA6lUxWzW+uQK2By/AWObNmZES/e1Q==
X-Received: by 2002:ac8:5d4b:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50e36b3c81bmr400983101cf.10.1776947985273;
        Thu, 23 Apr 2026 05:39:45 -0700 (PDT)
X-Received: by 2002:ac8:5d4b:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50e36b3c81bmr400982571cf.10.1776947984734;
        Thu, 23 Apr 2026 05:39:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm4969779e87.55.2026.04.23.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:39:43 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:39:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
Message-ID: <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46>
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
X-Proofpoint-GUID: jHoyy-brcK8nwHHLOcY6jyb0U3oPtunC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNSBTYWx0ZWRfX676j2XGdmTmx
 TM8sNevUdW5pNzoWxbiCyHtwQd7a0NJ/rFQJWtTlSlsj7GaSpOga3QykjrExWS8GrcRpaiKIpN5
 EliX11GGmdJG2UbQQbz7bd2n7O4ig6UhqPDxU0h5BPMoUTglfow8072wwFq1RETYhvqwVpS2p5s
 9134vHQqbRWzSMEBLNbj0mwbOpU2Chs9HJu2/8wmIWPedpvmliBuCY5r629sUJosTz6UMdcsbQF
 vVRd0KTwszZoabvZCs5iv7cBXqLWLJIdgEU3C1J4znqHCT6MJ5MTLZHV1tC6vZnUplL0ye23256
 fCqVHiZFLCCKXM/3IwwxnRxISzSEcETBKiw1hJf4dKt7l+EQlUdIPlNwtOxTmhouPBAb3xNIgBK
 ByLVtsS8NoNFRGtYRy5TMWYpPfplTVcN4WT9qef494uvHX7Dy3Tc9Y+/DXa0+cT5UHGZJrfB2SH
 yQIF5/VNvHEs0t6WcZw==
X-Proofpoint-ORIG-GUID: jHoyy-brcK8nwHHLOcY6jyb0U3oPtunC
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea1312 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=n-5QDBJNWlt_wJityfQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230125
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104325-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 251DD452296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 05:21:01PM +0530, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
> pin and already reflected in the wake irq map.
> 
> Remove the unsupported wakeup interrupts from the map.
> 
> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> index 0767261f5149..81c08b18ac71 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> @@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
>  	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
>  	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
>  	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
> -	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
> -	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
> -	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
> -	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
> -	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
> -	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
> -	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
> -	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
> -	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
> -	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
> -	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
> -	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
> +	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
> +	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
> +	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
> +	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
> +	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
> +	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
> +	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
> +	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
> +	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
> +	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
> +	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },

Is there a chance of mimimising the diff here? It is harder to read than
your v1.

>  	{ 152, 108 }, { 153, 109 }
>  };
>  
> 
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260423-sm8150_gpio-6b97306811d4
> 
> Best regards,
> --  
> Navya Malempati <navya.malempati@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

