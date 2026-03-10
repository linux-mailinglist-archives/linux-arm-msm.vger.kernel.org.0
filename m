Return-Path: <linux-arm-msm+bounces-96646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMdROqElsGl/ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:07:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D322515B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A279430B6E1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFC33A6B9F;
	Tue, 10 Mar 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvWU2tMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwZUmQxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E23A6B9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147458; cv=none; b=c6+yOLQlxI17NPNAGzL2BuiS2Y5qMSQ/q0jTSli3whVkDCKIuy7H6hqxmfcso+c6z0AVOOYtX/zdJSQ1xT2uLmnwvgdTysUxw5Bw79IS+DWujdyFITIOZo2NzqvWKqfLlwFwhXMtM7O7A6UMxDJmxucI6UCYwntVHBNDGgvOdYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147458; c=relaxed/simple;
	bh=tu2Gxm6migseLbVRCGxJBC9msahNRSNXxjCo6hBhLPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlHk05PCXMmm9meA1NHQKm7pKup0Od9oYkR/G7i1wDnnBQoLbhVYqstUTfhhuwn3qPwPFUOUTJ+UhVDJtuHIM9L341kBprSHds2ec4zOzgl4f9h4E/CagHXI7k+NF6AH7pKXaiPEyGQf6XODzusk7Hfy1xS2owHK2NyHFAcDUn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvWU2tMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwZUmQxv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACnk0l3893219
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbpq8Q3E6rdb+1y5IxmKtuLhvmPIDFUCQzWva345ooY=; b=fvWU2tMQKg7wjDiJ
	hN47G14LOWFg7XpsLLWBz60qPbI84BtEhKVtWAa78U97uyWkli27Twrb/TLko+At
	U5lAahNCBKsXE659McDjQ8VWGE4ouN2ENhEtAt2ZaEtskYZfQeLKMNb7n6lZAOvw
	B1eQ3QjWc4N12bEEp0x6yiK5C8A8mzc/1cQBl9xY2+ittoLQTXATz83j4ezKB2Q9
	8dtd3DoGzBfQs5pnGwGkDdZVtE/wgo+lhsnDyqcJgFw2qShhTOQiP0VMlVokJOeC
	fKZ3qR9uGOm8KdUVjuiBbL4N6OX3AdoUQ3LUM3sjAO6/Nc4PAuWM+Wfa5V7kEkrV
	KCCKCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyr10u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:57:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so832136785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147455; x=1773752255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbpq8Q3E6rdb+1y5IxmKtuLhvmPIDFUCQzWva345ooY=;
        b=gwZUmQxvkloDeP2tUOh+Nh3XNafUga0FFkF1XFUD4s+a0B60IfaXz4jmwh2isSrqrW
         WLlpYlGyJ+TtoUnHh1T73i8SWMnm4OZzEh7IVvpdYjqwpSGBuu6D2CgoJVtq9HCdAyoL
         +z41YQF/KxytEBS0/dWkoXzuPZxIwG1l9Vx3t8jijxwb/zGRr78ASyDJumBp8DMdnSnB
         blPTw9PB18qartQZLnSIpCpYq5vzsmG/Nj8MdR9a9id8xsGmUTZCGQkeMPAmvPSpVo6F
         r+Q/j4wk+SkXGwLNPAy8azJX271vl7iotIxFEm/KvwvmgBhvC9I2BN7qMAKOldVWalsJ
         SIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147455; x=1773752255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbpq8Q3E6rdb+1y5IxmKtuLhvmPIDFUCQzWva345ooY=;
        b=C/Dv7V1n2Ut1Y25izz23AOkmoWQYkrUvrZyzPeU/vXgk4S+cXGVTQW6qZIhZiVsHsp
         ffMttAgHvwtWA4p2kKN43mBT5pX2bRqZt9s81s119dzWx5GmOs/Jfz7miTzXY7uoH2lS
         Q7MP8s5SF61qCgbJx2DHcABwKOWhcwZMTegLABOSEi+++AdoWGFRtnAZI5QempHV8iK3
         666jBOfTPHb7Hfol3BsnVwLAhiQI1tAhI4fvR9avkMsMrQvzcZzTl7t0LQudC0EG/3/K
         a2O8sEF2gKOy2o8GXMURmGAKcsbV5MAjfmBNHDHA4oXqrZpuqwQAanFYRHsFakmvGWRP
         dDog==
X-Gm-Message-State: AOJu0YxLiRMFNchYNwzpKXBgE52MPvJr/h6Z1p/2hSJ5iAJSF46+xskB
	0ZiBWQzNrhwrRW498epqSrp+ZdtsPlGt9fRvZ78Wp3kYGjhYWbQqXfw6zw/Wt9UaWHkam0SDdjN
	sGc867IADUsmgMLFdq/AvvcN7f+5aos7bMU0/UBy1NqSutWZC6q5759lwC15XWsAq6QUo
X-Gm-Gg: ATEYQzxe/CKeaFs8moPOW47nTfwcyNHs9EbDtSMMwRk06iTy+bbN8VI2wr5ESsWWTEQ
	/8IPqhnPfhMNVi7HAuGcpPpECUjL4N12wJOSdGbPqNM44uHC61HRRsO3QcB0dlSpagSk+wHzUa/
	Rr4TIXffgx87g8knpAALtyUhVyVdYR9xvZhhqbaWCtlQA7RDjY26/rjEngBKdHj5bLLyyW/L6JJ
	Mm3TrjhkvU3gxFTl6QuYHInyp/KFizXve5XHG4eJXXcyruaQiuZSwiVn/o56Jv2QW9K9sA9hI9p
	8O3hcV8YBO4VpI1JSmgmVFaSWxXgdTFnw/XnuWirbauDJqkXptsF2DAh5O1spl5tudvraxhWeE3
	Irkeft2kbtpTQZlZNuLaKknvc8S3xvO78wIJ2wFXLO3sP/QXFqDsT452we21LrNW4Y4UeFvERL8
	SenIY=
X-Received: by 2002:a05:620a:1a92:b0:8cd:9599:b7c6 with SMTP id af79cd13be357-8cd9599bab0mr184206385a.2.1773147454859;
        Tue, 10 Mar 2026 05:57:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a92:b0:8cd:9599:b7c6 with SMTP id af79cd13be357-8cd9599bab0mr184201785a.2.1773147454284;
        Tue, 10 Mar 2026 05:57:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b6a1sm473128566b.18.2026.03.10.05.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:57:33 -0700 (PDT)
Message-ID: <8ccf631d-9423-4997-b142-64d36afb25fe@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:57:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-23-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-23-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0153f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KV6pvVub3WdHM6TKT1gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qei8X0UmQEhRkQmOkeH7lrZhxa6Fugjd
X-Proofpoint-ORIG-GUID: qei8X0UmQEhRkQmOkeH7lrZhxa6Fugjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX9dSmFZ3oiTA4
 CmCkUuN7m8YX3hFEy5XdoFN7zfeU0cLGz76fINLaN6BJIIe4/TZcfhrbhJyZbtoT/fn7j0xRFLc
 uvyvfhslR1MR1G2G4OXyfi18qlcxtMurGQKlvY/Scxops3/dsEwI9RjiXOSZnU/HTf4TTrRqCqK
 +g16eVrnguOCEMCD97kY6wmeiVo4XZdwdAD27qzJbKBOxB0UJpt9urw5PqEoII0vSZXobq98PuF
 XDP3LW91BmDveGkczSxpT0TgYf1XEsjXw7E8Rt1dfmfl740289qfpX8ZnAO1a7QVEFw0wLzUxZa
 MytllZcqTMzjSb5d9UaSs5UwgpxSamgK1ILUHk60llZTzTBMm+UcKFyDdIqdug+1pWIH32PgWhI
 VxwVoyxUt93WqNzPUh9cfcXnvlVbkrK2whpPmP8Rv41bDAo6Ma3MdiCcXVfHCa4Ky/QcpJGzRNr
 u0SRE129zKjQORTF9rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: 13D322515B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> Sort out the remaining UBWC swizzle values, using flags to control
> whether level 2 and level 3 swizzling are enabled or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -101,11 +96,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
>  		       UBWC_SWIZZLE_ENABLE_LVL2 |
>  		       UBWC_SWIZZLE_ENABLE_LVL3;
>  
> -	if (cfg->ubwc_enc_version < UBWC_4_0)
> -		return UBWC_SWIZZLE_ENABLE_LVL2 |
> -		       UBWC_SWIZZLE_ENABLE_LVL3;
> +	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			   UBWC_SWIZZLE_ENABLE_LVL3;
> +
> +	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
> +		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
> +
> +	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
> +		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
>  
> -	return cfg->ubwc_swizzle;
> +	return ubwc_swizzle;

This is a little messy, but so is the valid configuration matrix..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

