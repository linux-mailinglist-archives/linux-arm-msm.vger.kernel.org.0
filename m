Return-Path: <linux-arm-msm+bounces-102673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIfFFr7P2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:23:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 002833D5A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 605D3301FC17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD4437C91B;
	Fri, 10 Apr 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjiup33z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUsCz3Lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B337BE8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816634; cv=none; b=fdeb9csRsrQF/8sGlhJoTcqQqP0MGu1RKQSLJTugsRkwLS3JFNoTdIxc0+Hlp1yC1FX5VuXq117dz5koQPc4Pz9/SZZiTBXd184k80qVLyzhz7GbWAOz3xXv147txaZmHF5ED6B8x8PNgUHBeHvkmZw8nUiyrfg0SZZ6JCTV42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816634; c=relaxed/simple;
	bh=wHuxTG8hoBBI8/Q1UiTwy4FT+VT+n1u3RBt2eqHnW/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jueFFlPxc6N5dOA8vlzkgnOdPafc+/CbdTbb9VH5lYjpcWxuh5I19jWn1flSTDEK2iSciwS/1QCpHa/nIXa8Zj++Uo9Jrvm8/uWCSpPCNzN3ecMY2hlNZcOFAuOlTKTatseWFDRTd550r0Xh8cul6YqMb9T2GH60ktZy9Gxb5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zjiup33z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUsCz3Lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oW9k4148785
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaYLNQUphR/lWUOk/mTQUwW9YYZEvSerDmEd50yoXrc=; b=Zjiup33zzocnk6bv
	WHB1lT0HsouahnjG/Xxfaj/KQ2/4rYCGivaY7KTnqIF3j6l51k2T99+VnJxpoifJ
	on+AU2MccbBy5k/P+y1+86gnD0IgIrpPHEXwQRX4m9e/Raad/4zomhPjXTC12fTI
	hOrvH5Krwnyl1lyd6bsBImuUbGFhuVTWQdWMdN8ma0CLs9ujZrAnN1vOaEMfboZM
	uL40HclDdIY7odtpxZT/gd4nOlHpHRRDYz+I38yyCfixfqHpKQdna5itF852KY7T
	UDieNCENvz2CZeoBikqK4pNdaN5ah4yjZcy3QGrtPEm/uuWnq4V1XNusjUxnIa6J
	81ypVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggyqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:23:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso18045051cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816631; x=1776421431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaYLNQUphR/lWUOk/mTQUwW9YYZEvSerDmEd50yoXrc=;
        b=eUsCz3LqqL/g5FnmlV0isKKJPaU0nYu8CRVBx5JIWCixeRrPG2BK6l3eO14GNXIXNK
         aho+pZYD7BnVZLKKxRqp6p6HJTCAuiY5zA9Xb10kLoK+l8PKtBgydSdlripDd3WxssKB
         9jy7MNK3uc1MB0uZDOta7fuW0v/EgQ+3N6qWKWXZjbMekWjuzcSePZkW0lm94+kFjbz8
         haI7cDbdLSmCKY09dPl34DTzpyvxfo9HTdDFrodIlOrmmwQkaZ3pLMbpHJYCFqUxBVKG
         O+5cgRbcpyCpuPkFSBfGAy0wjzfuL7JHJ2cOYqxOG15AKQfL8rSkMSU1xInliw+kLngX
         IyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816631; x=1776421431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaYLNQUphR/lWUOk/mTQUwW9YYZEvSerDmEd50yoXrc=;
        b=jPYZWIK8bwwgkpfMvdC6dz/ihta6QoLcf8msNzFZ6zHmtBsU6hi3Gtli0pREXM/GHQ
         F1bFyH2PNVEoou0dGp/wtuOYKe6G4KVyy7Xv9esuk4EjM+X1gaZQnB+LFFfCheKh3FAc
         DrJt4Zw7y9JkZtmSTXq5uFjY2yk85SazUacXB42I8grhhQlflQkmf9E3JRCo3u9TsvJ7
         fjepRc5KpujjDil/hZPGJLQWNuojpPG4hgfPSc5gKQbaxgD5qYokhWLocXY0ETdm3YSZ
         79uwtxnvipmVY95WuAKIA/rqz3awsZTRjMkm/TGHLVDOABhFU4Y8MMxqlKATA1XibnpW
         rl2A==
X-Gm-Message-State: AOJu0Yz6tkCw95BY6pgEJuWkNY0cBzj7egbUdwvwuRZhAq16U2Kka+2p
	RBPttrHVVRSbK6Gp+dbD6DxZvtXWDyMEvWumPdyNEcdcOKxfBepyzKV4rb1sbUIznM7CBKwJfVa
	fXW8HMaG1rrhwlmeJGm65L6cfbuLUou6RsS4EuLenQl9AhXb2uDX5WnGaFgUaBvb0La76
X-Gm-Gg: AeBDieulOc2o91g1Yv3AU00GHeQn9sUCPcBr73Q9IU2qIVE8+hBvXOov+NhC++UFofG
	DjiUNiApwCIP2CW/kyaCopw2L7IUUClx/3n8prkNgssvn1x1cH5pa4hCvDPrSttj3E8tI0pYaBZ
	iXuG/AfjOCt25GvdBnf73FoJCqKoONFyUuTriNfDM69QjYThaAUA1TUPtZGKXapaGBi5ki2i9Js
	3ya3RjagMwDeGJGa0pA+3vDDvkRvvn7a5u0Saqf3FGxthjeUAQYrfnx4TqgW6ZHjxKEX/T3/7Tb
	YIlTc1ypshgy07SKZX2kadbXscZuo4MQY+tA8xOuFO6EaZZ9lGb+jSW0Ir04TQso/kgKswDFp9J
	nASElS59lJ2+C/zlbxVmVFgxiTUAoUbT4qICMDni2sVsHMRhXNyL/sW923X8DRkxOoY78TB9uk4
	1iw9A=
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr28793481cf.4.1775816631341;
        Fri, 10 Apr 2026 03:23:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr28793161cf.4.1775816630923;
        Fri, 10 Apr 2026 03:23:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5457sm66123566b.35.2026.04.10.03.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:23:50 -0700 (PDT)
Message-ID: <724f14e2-83f9-4637-8e63-f31001ca0725@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 39/39] drm/msm/dp: Add MST stream support for supported
 DP controllers
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-39-b20518dea8de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-39-b20518dea8de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3nLle3ZnqtKNb_9-4k9JRkpqeL7mFAh8
X-Proofpoint-GUID: 3nLle3ZnqtKNb_9-4k9JRkpqeL7mFAh8
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8cfb8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UGWVb_hElQaF8LtDzA8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NiBTYWx0ZWRfXw89n/nOU0lJe
 AUeoeURt+Hfi/YtSs2qQzOHwxlglsWeNeiqlPhsxZhUR4yB73v3zc5+YhU32oRYVvmRSQjtmIiU
 WlGvMPuswm/ReXGKv/ZPN+ej064Vz087xWhshasVs9fN57P62dRM8c3AVdLvv/ppG/VUzS/2JbO
 AFcSUAg8DAIg1Ke3FaIPfLkhxxAwG+XGyNEzhd/kNGiQibGwTfi9fyXV2hJHHT54OKRi0WlPE3V
 hUzjim8cY3I6hg+wUG6BXB9e5/HeLEQFkBRs1SquU6UCxQg6SGqk701l7uFYEEl4PePIjs+VJPN
 pJnmZLrYM+0qYg8FTFMZiwAKS1Rs2l8A0EJCfaBXD2YUeZH1lPNDiNRk9DmHPQnZ96USwsMvyoX
 82kAgIvXLkLQYPq5/dd+i+1pfiZxcEpXGJeh2BIYJJt7CsiGQXgK3v53wiQBkaKGlMnpJAZ1rBC
 MMzi0JiVozaQgfD9y7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102673-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 002833D5A05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 11:34 AM, Yongxing Mou wrote:
> Enables MST support for MSM DP controllers that support it, allowing each
> controller to handle up to two or four DisplayPort streams. All necessary
> MST support code was already implemented in the previous series of patches.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ca89e20b7563..f632b4f64ccc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -107,16 +107,21 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_glymur[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },

Please reformat all the changes so that the entries have one assignment a line

> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
> +	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}

All 4 DPTXes on Glymur have the address spaces that suggest 4-way MST


>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 4},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}

Same thing here

> @@ -133,38 +138,47 @@ static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2 },
>  	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}

Interestingly the eDP host on 7280 also has the registers for MST..

Please recheck all the entries

Konrad

