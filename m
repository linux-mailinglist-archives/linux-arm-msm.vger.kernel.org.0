Return-Path: <linux-arm-msm+bounces-97403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL61OSTls2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:21:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 601962815C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C35E730374A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4578B309F1D;
	Fri, 13 Mar 2026 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIosWTDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCrVqYYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B98738F64D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397179; cv=none; b=eCVujUqgpVgyCDFau4baF7kHl9c+Vbz95qBBdemZWGVX/uUSAPs84UNq6+SCw5E0Y4gRPS3RJsuBFBOZWI8SoK/QivYm5J7CBnM7xjYxSYJs+yV+54Q0jO8q4xZCxBjxZUiN1I/nNm3P+1C9vVCPU2JLQqk9YqjZNcCgJCO+j0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397179; c=relaxed/simple;
	bh=1F8Wfguj6DdcYhkAt1RTnNhn+M3z6GesUqLesvs+S6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDQOGukF7Vew5k9tNNc1t911lW8tYgG8UqCkh5Onu2nrjmPC7gLg+e7LtNlF8zbKT02f+R57p2uyD/HhO+yMdq+Dw9qwhJ3vDkoAT6V626lRZdchtttoCHHUjd+8PQkZOL0gkU3WdT8gi9KVYxjm5hHgtSh1UAXmXX3eVSdBS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIosWTDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCrVqYYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tYXn3229726
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFJr93g+gvzJomEerwFbGRLs36qbntliWexUDx+bAtg=; b=hIosWTDY0aM6amfz
	aMTQjkO/31Q8KLzkUqubCKC0NTDF90ia28DAxSKccLEJS17kTqR3NFXFEUfoUEZ/
	Q12plSPBzIeBRV4TqZOM/kiyakCN8keI7vg1mHj7ndujd0BxcRBXusXqCvj/NmEa
	E3Wzyi22JaN8FU0SqtuiL+oCyHBZJGDhPhnq+US2mzU9Q5R9rD9CFXYxgeDI6/uE
	NgL7hV77aZUVlJwOPiapuy/5virWkla3xz7TueawhOyf7VDc8Ve32t7mXpOtado3
	L0eVq8+FuzjEvRPMKmzCPinAcQZzJM4VonzXJBXoQXTlOekzJa9A7QrH2gzgI45G
	tDMI4g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hpvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:19:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a012f8ab7so11485316d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397173; x=1774001973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFJr93g+gvzJomEerwFbGRLs36qbntliWexUDx+bAtg=;
        b=YCrVqYYTZGybE++39LOvXCg4TJYj6rSey0ICXhExw4vYPTHpBIFoN14XrO9KKnLECv
         9DXQ3pRVfrfluzkDx55K4jpJwDEfNryUsMhJCH0q7eeU4KJ/IHvIUbDJwptEEmto4z4i
         9WDl82N7OUuxAekN6lgXZ4BeKftyxHvmpKZg7stmXjxcuGBHceB02UijsuVw/Dsy6ocR
         sO570lKWr54aVZpAbFFvm1Av5piW62vlo6Mp0znvEF/JzT4UMkzY5FMT91NEPp4QzS8+
         RzfJE5OzkkAFy5QMCBoZJYT9nt+8WD26Go1c0FxoguEWv/4VCyRWsijdVVMyw4eUJ1di
         Argw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397173; x=1774001973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFJr93g+gvzJomEerwFbGRLs36qbntliWexUDx+bAtg=;
        b=YI7FjcJQmcNyVz13g8chM23A/Rpab3CoWVJGyn0Cqfx5gR2FiHrWJKerHUTp3U8WdV
         Jhwy1NtXAUFTXvYOcmSY0uFDgxInR5HBTY7uWUrFTCTgtSDJpTUPflYDn0gklvPRefg5
         VOC6rsmNubd0080ihHVLQeCgomHg4B4NKNsAaTRVPR6TJ1L+RU72xVO5edIiTdm7na9r
         RFKHd6q4gAkQIwzeCX56cyC4rixhhFpWhg9fEyd8yyDNof7yeT7d5lb1iG4PtK3tMPhk
         h+bw5ws0hplliL0G7vOI7mkSLWfMRQmLgPHBcHP+iIsbjLfhJV8Y8BeDtN5XkKPZGu0d
         EiLA==
X-Gm-Message-State: AOJu0YyuYmPl+rQftX53nnLnzLyY93SSSlUwP6NXzu2zMvcufpBp3exq
	bIBwYcjwwMZftjmooUyi9p1Y/yrd5VBAcJhcqC1Yvxp1nIi64wuRl6SpD8NuDAmYE3LsG3H3YDv
	GIlxAD1SFDwRAnCFUSJnk45ajG8OuNTLFn58kufHU3/yXL1SHHxbeG+OL0ANPszYNHD8H
X-Gm-Gg: ATEYQzwukTR41DQb5uFcZb+iUUz+EBsYSgKec+MjnAEA5yi7xLHeOYIsduvGy0icSlP
	Hiox24OjglZTrwl/Tz9X3KNwMg4NLp0tnaEeHRLnTTlxQnb3DkY65E/NOJR3UqpwJQbVfeiFfVT
	SHHwHOqBb5kS7QFTm9uX/qcdO4gWDAy0FJvVTXUDObeuKQ3c/ls+OMySNLtLRZ1bo+Cl+k1tVUP
	QUzl34v8WERK2g9swFuXwcwvgoAHqIAHSro4qE5yIt+4aBOx3CSuBoefgDMzLlkZ9fQaIh4OX1j
	GXE71E3AxILQYSGgOWRMjvVchg45xGeOfUxTyqUZK74rLIuYR7GnfB3LoEvRjoAxgmCfJJGB13F
	qkD9V+BYZWtNV83EFiT1QNW12AKAJgmuKNmFudIDtcGGuLuWMaryrxAzfSvB6DDQV/tKTkP9ebH
	lJhKk=
X-Received: by 2002:a05:6214:4e01:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89a820986afmr27954966d6.6.1773397173290;
        Fri, 13 Mar 2026 03:19:33 -0700 (PDT)
X-Received: by 2002:a05:6214:4e01:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89a820986afmr27954796d6.6.1773397172874;
        Fri, 13 Mar 2026 03:19:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97756e59b6sm16300466b.10.2026.03.13.03.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:19:31 -0700 (PDT)
Message-ID: <351bd44a-3570-4490-a471-0d31750befaf@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:19:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/27] soc: qcom: ubwc: add helper controlling AMSBC
 enablement
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
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-4-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-4-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2aIxxQgsw0sTpKwPtryF4KzKaFL5gu3X
X-Proofpoint-GUID: 2aIxxQgsw0sTpKwPtryF4KzKaFL5gu3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MCBTYWx0ZWRfX7Lj2cTuHTcjx
 D2kpSyqPYFe/V2kkKNb0OC3MW4JVX8Ej/eNuTIyf/bA+xzRhnH+xMTrzdVCTzjAtXtQPl9a6i0A
 ePOEWkxe9cyIxp0bBM7qo+/f5+EgKgT5CsYP00cpJdlRW2/V2uma+ieLtfdsvY+8v0hO7ckR12h
 UGW+r38MQtcyHsSNX/0sq/X6KC18y1ak6mmmEjX6HrALVXOluYaxJivxdqwJzKImaAiu8qc8HGN
 zlvZFYyywPddRmyc7BazaNbJkM75DBu4Wt+jT8VqqUTvz9g2H9WhWeC0uYBMsuOPmwExNZspjaZ
 eR2Xipw3VtFrwTFuqVfEYp1lyEZ3DJlkgZaF1RW01YjsEzqmKhOuSupAGdsPDzzSHDO1Xw/oa5X
 +cApVoqb+TUeqQlkK2Nu2nbfxSJZ25WjhUZr1ca+A2QdW+t+Y1Me0I5nrUnSifFT3bc5BQ8Pjm6
 L6JQ0bPxBfI3CocCi6g==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3e4b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ofppVGNrExDXTkBWrYEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97403-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 601962815C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> Adreno and MDSS drivers need to know whether to enable AMSBC. Add
> separate helper, describing that feature.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 8355ffe40f88..83d2c2a7116c 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -116,4 +116,9 @@ static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
>  	return 0;
>  }
>  
> +static inline bool qcom_ubwc_enable_amsbc(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version >= UBWC_3_0;

Note KGSL doesn't enable AMSBC for UBWC_6_0 and A8xx (but does for
A8xx+ UBWC3..5)

The initial commit adding A6xx support to KGSL has this hunk:

+       case KGSL_UBWC_3_0:
+               mode = 0;
+               amsbc = 1; /* Only valid for A640 and A680 */
+               break;

That was in a time where A640/680 (8150/8180 respectively, with UBWC3_x)
may have still been under heavy development - this initial driver was
targeting A630/SDM845 (UBWC2), so perhaps that's not really meaningful


Konrad

