Return-Path: <linux-arm-msm+bounces-92284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLdKNTfWiWn7CAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:42:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39810EE22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76CB33002A08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481DE37105C;
	Mon,  9 Feb 2026 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3VECuPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYFl3dU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16468371056
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640922; cv=none; b=ZnsmgKdAOpsWFvCfP25jlCM3+A4InsuaozJG608LVFBIAOOFNXvbuDB3MlnI/ALOuDh7/m9Gsk37BCC7IuK98q1pZ1+JsKOwIFRCS2w5Lz/ENiBNIfB4BEiuxbHz1f/0WghBsP6vgtfZk/RoY/d2s7WzKDKalnj+SCMiBcmDpsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640922; c=relaxed/simple;
	bh=vuR5baP+ZtsKQDCz2wa74r+e8hW0ez4+kSC8kiRoyng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtBsBadhIim7Wanv2DbcYGf9hpfSmrGdwsCOIAMYbihR/gSv56uMAHOCWld6hwiWSAfgq/iemkwJpS8p0/UdiGg9R13tDbzgmgR0bVE8nXS0hM+Ujkh2RLLcq+vT0hudiWb2osmgLBoz+HD/nehg+64aZZMj0zjvt/XFm7EGkbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3VECuPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYFl3dU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619AlAcW3700602
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gw8uMnSWgQZK4yW3clAoBzuk
	lE3SzW4uk1l1y5Pg5vE=; b=o3VECuPksoWN6V6Dh7/4rHmKVwHO/SFjMPvj5Nqj
	a20zf9FZatxnnfeoxoeI5DgF6C+sDGYdylaHUrY415BVi/Y4iKilPkLdNNuYStoL
	3xMBXUZm+EEU0UXP0qUpyP1YsielqTUM+6EqQPoceHWPuEtaB0QUV8U1lmNqYuyl
	DDqj680r1dgd7GE4zC411gYVe7ievuCzLhl6uJIhxOiDqmageCpYyAnj6lEIXpMt
	Pb1HnZjsR3wwZ2KVy0C8QkI3so0uRJ43pQ/KBFQcq0ejR7I34JIKKsbV+Pxx2fUw
	EJJEZWVkAx/xagAcMyrevT3fGoHA/opp/4NkSaWNUT4Keg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m8b62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:42:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b4b53e4so1247663185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770640920; x=1771245720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw8uMnSWgQZK4yW3clAoBzuklE3SzW4uk1l1y5Pg5vE=;
        b=MYFl3dU4ECp/0yiewhCAa6tAh++tnor69QQepcVvZo97WuD9F5ryShSgtu/ylGDI0U
         hii5lFfgRy6k6NyAufRrmp0L6DE1S6BICHaOrVHbEy74qJ6Nq49js8U9fZBBosMiWSPS
         6kCd3F214F4XL5pUGrImfYOTZeFHaX1/Nn/mwkZRQMegfzBdzYnx1R47bQ8VcT1sQ1kv
         2zUlZDNlneYZ/smdvRwq249L3NUcUofqFU4KYlwr3WlYQZGv4EOJJbPls0MwuY7fIFQi
         W1bBKS9653YI7zsMD+2QzI69oViS+lnnXOtMdKDqK0OHFHBScZymCrzgOvEl5Jm3P0ni
         cTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640920; x=1771245720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw8uMnSWgQZK4yW3clAoBzuklE3SzW4uk1l1y5Pg5vE=;
        b=Nv817BehOQVJHp4UaawxX4uD7kjG21BAMwGtTD7Ect6DhkMO/Blo5r1pMnEMxaMpzi
         KpghEixUVDzLM/JYDE045GHNuAghJCQW+MWoKDUObBxSvoMY1vt+stsaWabevjQF3IU2
         qFG7wAtwCmYZzhpOyrj0kfB3Fldv5DAPZo34pBHE3ECBYjqZYoR4cdQbPUl2kXjOTJDu
         i6juCcLS5JjjhCiUmpkm6tVLvClNJOZq2cTdzEhcgFpP2K7/OzLQWZ4TKzEoxN/sfk4l
         XghiSz9zTMk9n/AnK8dNqsYC3zkHYz0tHny/DxnPWzCdAuTA3EjdDe8/1/3LQbK+fVP3
         3wiA==
X-Forwarded-Encrypted: i=1; AJvYcCUhwJie5qSHnS/74C78MBSPC8+6bnTV+3KNZU5sEf1qsWsBgbT7i31NbIuw/8PMrSNoFpcnuOYDF51bbO6r@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjP+fjcs53K/4YMMNn69Ox59U9jHRxdOka157i1ywl49AxOJw
	EMCPMdsra9QdkxBGbJCv3aBMPLyDAGCkPIP/L9DmBramWAh1XROQeBOYBzwJN5sZWBiLKqkUP9V
	nd+qGd+53/t5tIz5QOXosUNsmqFqH1H7AO29WqbzmtiDxPYRtjasYBrIxm7Rb3RPKiG1P
X-Gm-Gg: AZuq6aKbzlophdue7+Pan8IRb104hgIBH0AZMs9B0rSTkHi1TcPNLJgH6j/3NnkNQGW
	LzCxr3S1pvSoRJGzJ/xXCSXeRUiK0vqwKoYoOea4VUru4rYmfrq/2mV4TPLPTt4b4ajSHf8GG99
	IOC3UkoER5+6JqTNF9/8lY34zcFN0abAjIZsxOZSVxy2dJVP6nSMEzVm/mRvHTxpsg5TpiuUsBw
	dzHy73mbCXszxfc1oP2kBmMSeETWM58epXmOZhtH83F39y8nEn/rsX6rTeCWf4yaiJFnUXi6Qs4
	Hy73dQzhX2XE50xf6fvA37Tw5TIp4w2DBKPfbxxMRY+ExB9rSHPN31R6k+RT1yLDoHXLzT1Ndlu
	dcIAUvvjN4JDV9dtEtwwSIL/726BdVFZKKLk7YSQnXm5VqvsUgSvZk2MnW2IEu0l84n7v0zGHr+
	fA5XLiqn3VQ8vvKGP57d1vyIU=
X-Received: by 2002:a05:620a:1aa4:b0:84a:d3ce:c749 with SMTP id af79cd13be357-8caf15f4335mr1546577085a.64.1770640920280;
        Mon, 09 Feb 2026 04:42:00 -0800 (PST)
X-Received: by 2002:a05:620a:1aa4:b0:84a:d3ce:c749 with SMTP id af79cd13be357-8caf15f4335mr1546574685a.64.1770640919888;
        Mon, 09 Feb 2026 04:41:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63e7576sm25236091fa.33.2026.02.09.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:41:59 -0800 (PST)
Date: Mon, 9 Feb 2026 14:41:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] soc: qcom: pd-mapper: Add support for QCS8300
Message-ID: <onubc2qpbazy4kge5ynedl4imihcrj3btlo5aqvmxubk23t2hm@rasbihmw56gi>
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209112947.930853-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-GUID: Ia0plAteMZVe2KiijmXXpie8M8OqkcSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfX6vdaQuWmuR5F
 edNsla4MwSFsNd9ecJp33krqbp5M/wyfydmKpCB7Z/aUrogxc/zW6s3YyBYUQgEBHywWDdVYXLV
 CciBfZmXEbbNX58p9hxbYNdOyyRea4diw2vE3l44OSD17omIdqkdIPNvPqv3CuuMpGw00Lh10ZP
 E457LxmhTMr2vCUT497RCsLK6TisZGfZumpUQEL14EiDgAsjhgEo9alAsG+eF+WEIJtowTiixci
 rWRjp8INhivt1+PFpCAQFBWmwvJpbHBXKRiXJQ79D9oA2PK/BWncjeLJiOa6iM8WYMuLKZ7ohWe
 7D5PF7NhLE3sOo5nwGgnj+yI/Z6accAg5BlXOQJQ+g/WuQT1aUA2Ra4M4HaLCUOA4H721iPUG+b
 ZO+I7YYw2j+QADe1wEiQvSBq+5rWOX/lKoL4htZQUDWz2Ncds9Tz4/Q9j4btxa1V4XDNZsjpm/+
 TQvJW1ASA+Q3waq4uFw==
X-Proofpoint-ORIG-GUID: Ia0plAteMZVe2KiijmXXpie8M8OqkcSA
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989d619 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=XKmsNy_LA35zan2BBdkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92284-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A39810EE22
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:59:47PM +0530, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm QCS8300 SoC to the protection
> domain mapper. QCS8300 share the same protection domain
> configuration as SC8280XP, except charger_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace to
> provide this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 8b899ec7f..32538e659 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -413,6 +413,13 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *qcs8300_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&cdsp_root_pd,

No PD for GPDSP?

> +	NULL,
> +};
> +
>  static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>  	&adsp_audio_pd,
>  	&adsp_root_pd,
> @@ -593,6 +600,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>  	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>  	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
> +	{ .compatible = "qcom,qcs8300", .data = qcs8300_domains, },
>  	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>  	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>  	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

