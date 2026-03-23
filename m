Return-Path: <linux-arm-msm+bounces-99186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEm4KMwUwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:24:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C442EFF98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D4E30022BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D67838A725;
	Mon, 23 Mar 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehppcrzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPy9wxLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62847386427
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261061; cv=none; b=d6U9CEobHRLUiO/pOToQIzFkz/Bb3uZlSe/BRPgSNawI+RQYoqYNNGL8Fwp3IMtFn7jfMpEtvf15OrQ7T11nWHhs0u1AXDSOae1v+gHOwSZPDtuqr9tkS5e0yMI7509Osc6owSLud4UJxnaXIFE0J5ad2sbcHb9HKK72Nwc1Cyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261061; c=relaxed/simple;
	bh=bHPN2CMidJ9Tf8GVrxXqrL+zB9dliXEdZEsMytVl0Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=limkZzOmcM1sn8b1f+9ozp2NBfgPlOXXGASVtX/lE3ICxT667A0VUVmqQldFOUhU43ovSHEhb9L8mnX/oSellrm9n6KGgcgULbNTp6a9H+BiM8MgVk/muRSCMzI6SCoqxVEhXdp/7ahv0VdfkNuqb9qVhsLpeqABh0gOFxWPpH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehppcrzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPy9wxLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tBSi2291169
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psp5AD64siCth9lvoT6mZpf4pH76K6Tx3toQAUSZxYo=; b=ehppcrzVVcvjUH5/
	4iXXOs5azDXAEKiIt9aAXx1Rcp5A72TJpXV73SLjFbzpYFf5WNKvWawgcxHrbGUX
	WNNzpEsWBllOxeYZ5uK7tXoyfI80MmsfObyhkmbHRlP5pY6ZaNkNdcVM1TOelKIQ
	UFh8zHIccfXekl8M2qktuH75vHjLJBiXOKHzcr5fdI3HACUnOn5VP3006IIwMvFS
	VcXZDAwCb10r8veONdhOwBxAp0dmAU3VF90KSn6MapYm1zuMzvheF/FICIlyT59M
	OHH4jDet2HsClc1ZGAUCX+Azk/aSyYg2c1lX4hw8eL8Rt34DKZoo1yn++lB3/oJZ
	J3cz1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70g7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:17:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31f391b8so25254931cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261058; x=1774865858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psp5AD64siCth9lvoT6mZpf4pH76K6Tx3toQAUSZxYo=;
        b=NPy9wxLKWJ2lG+xigsCg2j96ioXSn7XP92J2lQkGnaFNED0oCVqyuQFFytUtdtP8ru
         mJuCe9KqAAaBtBgOTt8NvF4Up6Ej7p7YMgB+Td9mWp5bDUqdymHSbINaSUro3QxBfXWl
         gSwRRCydXO48lKdlGDO6xkVKEmFwuHi80nSx3vv6ksmiFAi+dbrKpkXhgyA1R+YVDmGR
         ZoD16dRjsWsF6EnvfOHgX5qADsxs/OpJWUsn6zICmYV42mz5lrx8uS2KxCPi1lqfFD8/
         K9NFkFm+dXMDMAF4hcY4ZlGfFMAqXX+eGEUMzq7b2Pm4W30e2xW5qRt0ekh8wrLcea13
         aeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261058; x=1774865858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psp5AD64siCth9lvoT6mZpf4pH76K6Tx3toQAUSZxYo=;
        b=TdCiSo6IqvYKInWjLZkNtiJT+YjZ8x9zHhoT47cb666zbvnmBTTkaJJ2UIi4YbYp/S
         AzLB+EcaEKgR/Dnyhl3tcvQatICh7Kc88RMqUNqiITPr0KbXaa/32Tu4ZF2QPqJG9XKA
         I+UMcjtJGGplnqEKpPJfkd8yh4pMuyQJd8BjMuZATDq+OVbXSQ/gCXEzQb6K2+npnOsM
         T63zrKZwg3NBN3AyOO1LXX2Uew7S8Ic1PjPMEqWRYmd+9L/ztGj+4FmhINdSkyln9MeW
         43gjVHWNNHUyQ0wzr5n34jpO9cO5UG6hhN5qRN+8Kd8kaEuXdNJPYXWOJa6utJWHjDld
         7dsg==
X-Gm-Message-State: AOJu0YyB46BcZyvBuvlvUBkY7renRcSgi8xlYWVZ29ZB5cOQJMOA4aNp
	GGDt9BaNauJu+/WIzk3ImXDEszak2SELUhpj7UDVvtgngO/ZLxKuYzPtCIc4bsI9YsBuL4ahbt+
	1IyB3a17ohw5YJ3xpcaWaJ2DXgVWN1xKhAj4/Z3guCafmoGt4OQQWspcLG2dKXNVxYaJP
X-Gm-Gg: ATEYQzx/aCPEoBFp8fMZ+1lL7sPb2Te9oK9+NQu0USWL3ex1qxA90lU8jlLiIAdBPm4
	aUJxPhtTrgzQKj5TWWrvPRzQVcn4gZt7MVjsW/n8tHbB2chPxrPBBiPyuk9E7WXxuutH62BFGox
	K/+R4t3BbeKK+VM+bSOwAFGMAFnB464lkZH5d2Yz/RlSFsozCZUev3UpkktADI/2af2M7RmHTJA
	wh1+pVuYuyPXadm8wmVWdjP7hH5lXaQFHDmfV5DmzZV/bC+/iJV9r8X0IZYBZ7p0I/TomudvuZe
	6K4Q/aA4n/o05SXp+Y8fW7t+elDVyFVnQ8vLmdXKglJvSyoiDeujj4/4CHU2kvI0A1kLIR1GMyb
	VIl/k3bDgfF/isVrm8Em1sYBAMYdtPUZXHUslaFf/omjO1zu3utc/5/EgwU1EkYdZpkiaKi7id9
	awMgM=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr44088511cf.9.1774261058641;
        Mon, 23 Mar 2026 03:17:38 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr44088321cf.9.1774261058280;
        Mon, 23 Mar 2026 03:17:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dc51sm473401066b.22.2026.03.23.03.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:17:36 -0700 (PDT)
Message-ID: <471a736a-f715-4c29-8e76-fe26aa4e77ea@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is
 not available
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-3-ad9bcae44763@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-3-ad9bcae44763@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11343 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1Mc-sfmLbtUOKB2LNIsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: G_dO8TFvYsFbJG9TjRhM2stPLy_-Dz81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OSBTYWx0ZWRfXy+EETJ6GpGzp
 /C/MYnvpumhJ+DxkzU5XCHJBLhEyt/Qc3FWmZa1eVQrrcg7JTa1oiM3f8YVm9Hh8+OEbkapfo/p
 /bA/uOn8jq/nsc9B20YVyMtfEViMreqMYalpI/L7nyK+lWhF9zOoZ+NiIivRnmbKimXzpQqnUkR
 E2r9OQNrjCovjMZEVHezq29ktT7Cm69FQ2mxATTPP1pCeVrvndMArBG50f8KiLqWpj7pDkE1wUB
 3x+6wEBh+YDrJDx/qJEOf74iEc2RVtAsj8h4eeE+nxhSlHfimzA+HkPB1fWN8AZwQjW0lJoVPFi
 TihgPBFQQOS4bhFFm2ZRevf8TJo6+buQ4I+0hYulIe1lOrmsaymYB/U+w5kCoxnkop6dhhhq3xY
 OCe/2rKtBhE4tSf0LKmI3HjUkJb5twa7Jnpf8gXqSM5mPprLrykBXmUJEC7LV/71xkMrT53AU/i
 65rdVO4NqSiUWcFwuKQ==
X-Proofpoint-GUID: G_dO8TFvYsFbJG9TjRhM2stPLy_-Dz81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99186-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02C442EFF98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:20 AM, Dmitry Baryshkov wrote:
> If OCMEM is declared in DT, it is expected that it is present and
> handled by the driver. The GPU driver will ignore -ENODEV error, which
> typically means that OCMEM isn't defined in DT. Let ocmem return
> -EPROBE_DEFER if it supposed to be used, but it is not probed (yet).
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ocmem.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index d57baa9cfa03..c35a98984acc 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -203,10 +203,9 @@ struct ocmem *of_get_ocmem(struct device *dev)
>  
>  	ocmem = platform_get_drvdata(pdev);
>  	put_device(&pdev->dev);
> -	if (!ocmem) {
> -		dev_err(dev, "Cannot get ocmem\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> +	if (!ocmem)
> +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER, "Cannot get ocmem\n"));

dev_err_ptr_probe()

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

