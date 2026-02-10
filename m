Return-Path: <linux-arm-msm+bounces-92496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMjKHr4ki2mTQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:29:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9511AD3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD4B3049970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8383532938A;
	Tue, 10 Feb 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tos0V+pK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUTvyl+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5A329378
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726464; cv=none; b=DrGISLziO16KveOWMtiVcCY9ZKf0tNENogkGpLIkNAKk70YurK/mGGlGyb47BzjnSDA7msPrcWKFzBjif+oIL52cMSizLweC3HaRUyciEihdOwiFF+iHJL6QbCOQG6EONcdFJCAlsrVifsnF/qjFCN//RbwYbn5MmeV+z4LwwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726464; c=relaxed/simple;
	bh=efhsIlUcgrxJHBgx9tFahFZW3O2XY8N52nafIZ7BREo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4np0rzMLsrJ/AhTOaSvCfGVqKcAHU+kmvwu7xB/oxj6fW6L3ttJ/LEr1IUllcy/zwV5EKhD7f2ZNX+AONLlhYJzyhzlUzwKwOpcuHgeI0NyVDU6qTKKylPcVfdkVBQ5Mj5Z4PT/eCmhiZOlNpCW9G6Ow3nfILO91UcxgpRq7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tos0V+pK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUTvyl+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6SlBC441429
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0MYFCYT/8/l+a8Upz+OX+GW9
	39DYsFckcT2Q51X/lXM=; b=Tos0V+pK+QqxYCJJ/XXhqh1NJx/89Dlp0BpLQ8Ni
	EBlOooAIaKNPikRXakPaLq69GB7Zk17z/P5iGDezAxmb99Wj0w9fB96VV/4HtDm3
	T5gFT8fI3/0tB19gIGg5meqVh0xSStFlNf4ZO9CscLdZkAMzcG1ehIALzb32AtA6
	ia+yF8EwgdPxPctpyMfplpEi1AT1i/2Fn+kGDiXjNpwNCP7lHaKPH26ijVeVo9qe
	Xwwofw82Yp7Heq1xq4Lk9g3InCUokhVx/PqfhvjYElfX59grIOnvlxyNhn0anDIv
	cf4aL+1thUBtbw2Ec6uaqg4iAbQ212Qqb+wrc575Kih12A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9jjb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:27:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b4b53e4so1733229385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726459; x=1771331259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MYFCYT/8/l+a8Upz+OX+GW939DYsFckcT2Q51X/lXM=;
        b=FUTvyl+C/XMJbwU9l5bS1hQG4bETScic9RyEXpJYz1zpPpGg8nBQVFZ/pfmEIUNAK3
         0uW8VlV8sgCocFnKC1sCRf3gam1yhclkwp9mLnjRtyWuYvv1l1AODix8liNm+adjdWMR
         3/YFwXBCTDecgjvnAvf3zj7kgbrUzVQxD4uTdO+xvdH8G+hxDv6LORRPmDHEx9zUzNup
         DOwt9s+myCH5xIdGyIkYkCiODCkbcsAUMCYddF7lfbXNWYkJpHWbswydkawksUs8D6Lx
         uG7LmcT3BGCNsrvqMc/TwZpKL4S4qbAdOU37P6vLFS9LFi6+A+hAcEJd/fkyLqF2ijop
         csOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726459; x=1771331259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MYFCYT/8/l+a8Upz+OX+GW939DYsFckcT2Q51X/lXM=;
        b=Lj5H83iQYrt+ugs8XVuB/VsQmJRZSXnqNsbrJkM3L8WfQlGim7lxth0k91jSssfIGg
         YYaeL4IcQEBMWZAztti2ZbpkNfqYp6Y8jy5HYo45qzHiN3MUfF1taDwjI+KHyXas38Vv
         OeufaPRiWD2rdCqN3336RjmCGbKJR8hJ9P3K95op3/SsSGv++P9iEXXVH9WpQJOb0Tzn
         v81J8AADfwD6e20dvsm8M8mDixvgrvba/t06kXCRU6WtmVKCXWKOBF6PFCzbNLhXv4/L
         zvGYbCSM2OSK8gTncqCxhBYL5Ey1o6z98A54fpzNgwxvuffFXsHu3Qfn82BoWN0dJ8Lc
         0Faw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmTGoBWomDi1tYSBdbq/CYeZOxMQbulMgnR0FMWuhKHSVa19UBurLhUZzAsKdxYp3yajHYQkN49FkZ0wR@vger.kernel.org
X-Gm-Message-State: AOJu0YzspbSNIvs6jPIwGgbHGC2I/nNwG2OJ6X3lRYdDKtas6M5z7U98
	edkg/PHAcn+UIkDMqpXS5QYoeiIkUKlOPiqiVXhmQV+w7v4Gp26ZL+8UGPbviK8DM01avMn53PG
	r5wLnqzT5RZs7isnsX6Gyr1HiEAdQ6BBszg1dHB+5qL1YDEgbAIRxYdBFHjJDu4X243Wg
X-Gm-Gg: AZuq6aIcOU1k00EaJtgcJp7xSWy8Q/TvtVzG4ETXqhetbYYlXMnLShyjQTABicpCKQk
	nUM1/lFUXdCwZzuXGAXZ1muhRJmNtCiuzre/iE/8LL5WAmZKxPIZbgt3jA4bp1PjyEC48N4ORhT
	dfl7UXN4WP6jkBbTIJOWN7+zyprA7n3kqQvME/56f9CwlqxdxM/xUF5QiAaRKbzjw+tdSsjuuKh
	yUrj/7wqEfS2D90wrkpZZ45Dm///zOHfoe465aR+C+UfsrTyyBxn49p4HwQKMMX600yb6uGUSjQ
	h1S3Rhde7hDp484Mm7Re4PO4Gj3TxaE3cJdcMZodZcLuls+tdCoJTkIrJfcbIDh7+Gq/y7GSZRK
	3O6cI/er0HptDXc0zs9qlQBtV2/1lfXSSgV5dFceJuo9uYTTnC2VSlk3anQBbSkXnAExMnUmz3R
	c24xnUcFD/4Bx3gCbMtVShLBXZoLh4kUg7NJo=
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8caf10244cfmr2024234385a.52.1770726459337;
        Tue, 10 Feb 2026 04:27:39 -0800 (PST)
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8caf10244cfmr2024231385a.52.1770726458913;
        Tue, 10 Feb 2026 04:27:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6236383sm32602591fa.10.2026.02.10.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:27:38 -0800 (PST)
Date: Tue, 10 Feb 2026 14:27:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 3/5] soc: qcom: pmic_glink: Add support for Glymur and
 Kaanapali
Message-ID: <hrlgydepwoh6jwrxi7if6awparre2vhehxywshtxv6s5km6jkq@2hkh7qhawkxe>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209204915.1983997-4-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: GRZij2yFXyb6a1pgj9W9UiHNUBjOZoLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfX23JYmZ2m0ntM
 pZfpBtnXHZoMyt3y1QL1R9zE6m5BMxrWIloNr8dNKFA08ECE5HCmhepLSGKLgZZvoZHkEmkXp/N
 yEwJIGVqVvRaIvXIWl+evOuIIdgJvEIMkykq4pVs3e8Vioj76m69oifCwsAfZOxA1GcEYTyiZmI
 8aMESGoUxO4OHQ8NClM1I7r/YFoQJeYJ3KrtPjYVtmQiZz++msHubPaskBma4gGKovjZtzdWN0o
 +TJFtPUZ3N4eUlMU9NJYL4Tl60iHoGVuFZ8ITwUMqm8rDc8bbwN3NXyWD8yah+kRh3+5iGhve79
 iS8ahMMUvBpdjtcEBRyvMroarmhM7kjxI5sH6xgfS6nGUnJwVOVqJnp3d4+udnnWEqr55qdlO39
 9p9X/Kq0Uyy9p3be7I7rBf+3nnY60SflF0M71BJs36ftl/AzC8rokzLq4svLP8/8MzIMvf7rSdl
 C84fDsrLpwJWj2l+Ihg==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698b243e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_MtkEuZf4ZNMOBkvimgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GRZij2yFXyb6a1pgj9W9UiHNUBjOZoLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92496-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8A9511AD3B
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:49:13PM -0800, Anjelique Melendez wrote:
> On Glymur, a compute platform, and Kaanapali, a mobile platform, charger
> FW runs on SOCCP (another subsystem). SOCCP does not have any specific
> charger PDs defined. So, add support for Glymur and Kaanapali compatible
> strings.

Ideally, this needs a brief explanation that they are not compatible,
because of foo bar baz.

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index df2fd03d3b33..3042261578aa 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -397,7 +397,15 @@ static const struct pmic_glink_data pmic_glink_adsp_data = {
>  	.charger_pdr_service_path = "msm/adsp/charger_pd",
>  };
>  
> +static const struct pmic_glink_data pmic_glink_soccp_data = {
> +	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> +		       BIT(PMIC_GLINK_CLIENT_UCSI),
> +};
> +
>  static const struct of_device_id pmic_glink_of_match[] = {
> +	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
> +	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
>  	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
>  	{}
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

