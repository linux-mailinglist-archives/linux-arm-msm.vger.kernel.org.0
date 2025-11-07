Return-Path: <linux-arm-msm+bounces-80731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E079DC3F4E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B93188C38B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE4D2C1596;
	Fri,  7 Nov 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgQgLoGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GczcBXD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A025CC74
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509904; cv=none; b=qgUfttoWWicHUBCXIOL49wRl7tWdO2wLFS1CR+xMhbtpzdddIfKXA4YWALFa3zrGusnF8RPzcLdxPofDtbpB2TYNWzT/n1acj/g9jV+0Tm8KrDEoG+aiNBOpdvvaMLh03BCCzV5bOhKcmuT7iUp1esrJ3oRXEwV37H1ryYx+Ifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509904; c=relaxed/simple;
	bh=Zv8AR6SJ54Ta42CALeGguW44PsrjtNsPhE80SPyIkT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6gl7lC6RUIvjF57g1lOj2kME3iObD8W6nW9lZNAGxmBchT/4Q1wFTUiUYMLGFaJWJcpCbLrmMCDCgkx71Qn6E9a1auSEaomoBp4Hg10fZVvR6Cm05jgKihgydbSEeRV+aH4XA4ZKvNFj8D3KwHodyMZ3/+R3XajpUKfJRe3gCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgQgLoGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GczcBXD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A782Tlk4131550
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=; b=BgQgLoGtWEj4H0Bf
	pjSqJrqRKNE6gL0TlSurzH8occv83BjsK5VWm8zeS9lPqvasvcWy7rQZ9oF96lYp
	Sq9DwiI4SCqjcnlRjgsaDwivy7L4Lm2g3FE2ZfCcdFGgKJvnkpF7/jnn94dmqQhn
	mWD5E7iRt+O9EclXEkl/6db3Jzh2X0Bc6agk9DZwtxLeOM+jt+ZRXw+uNo7sUsOi
	8RlMj3bsnydPlmEJmU2V30/28m7RpSgdTHvaAu4EnVWTM0p9ODSPGaTWQCBxRv7w
	c8kQQUBf1qjE3D7+C5r9CrlzVy1i4ZYSz/FJkuhX9BYZb/GVxDFegDjvKm70Tb2G
	3pgAZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3mqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:05:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804372387fso1736106d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762509901; x=1763114701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=;
        b=GczcBXD4sctSgG7Pt4NIvF9hRbZwJ5beeUxOadhvOkqVDCb33Eqm0mGVBHOMek1Izm
         b2XLUl3C4Rcowf+hujuL9RmvQuy5mXo0KmnHRafiwiSCEJjkfFMXWxesl9QFqj6wWMiv
         yVkAfgwBD2CJwGaFKAsBH9Xs4v6Ll2ldJKDPtO0GKBYWA2K3QwuR/M2nXX3XJScQD+l7
         4RxJys3IAR7BCg2cYx5UITWWdRzcqYO/wUuVd01pzHZKTN4/XW5ssOSvHf9X6Ju2cDCF
         bU8HSQ7eNW2JNGUm2AmnP3vj5+B+9TCvBhwSQySfXKwe8MYAnpoQ0ATjt/b/GgeQhV0Y
         z3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762509901; x=1763114701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=;
        b=DNrUsyP4OKkcuyX2DUtfAOY5aiFmxkQcPD2NvqKAKnHvtMSGpmDLoQZmqLL2LHZM8/
         b/s3gslq/5xepiS1nO9m4sAj7DFmqIbxyKlQ7EvULeF4tBFasfDn1oN4dRcDzwf6gTPb
         A8mV2anbXj9rsbQKF+xuMpjiJzJKgSWDl6e9eC+a4PNqN/+OGCi+XUrw/+w1wlUSPgzJ
         LEGqS2wv1KHa7QgwX5tMCasweecqCWNLsXdGzrrV7tfRsGYX15LKDGT7QTtnSEYhaE0u
         wsQUPum0KH4KPIssJJe03RomedNAo1Gtm4dLFhtrxJ46TOYz6QwI45h1LEIsf8voXQOA
         j3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVV6qBFL11hCzSNgW8BCGJ4fOE63iffzYHeExjHO4saDPIKstnOVnAoWcju1ApiwfdjLnmIUrflhFKs9Dfh@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZcZsDVTbPotwzScfd+rQJUszMU94GReg7zPSlsEwF1HyTrjw
	VHWTZQ47EbMxALTHT0rmas3+CNEH40a/Z5mjrakbsCvDD2mAonbAvjufurIY/TmYsBqBhFhG3kf
	pZdlFWxozL2D0Om+mIIaON9SgcK3+mdVbxT+Q3phLlTbNpLZlmzQnvxx9DuFqgBbmbxy3
X-Gm-Gg: ASbGncsuXhmmLhy0sAlNMxs3f5/UCgXNTv+Ek5bHsqdvr3pqSABz8nxkYxGLzvxVART
	Z0EOTnPEZOxVlx4ytvp4sOHsS5Yk2+M/ax2/qLhuFcszDI2wguC2PDjqr66UV5izEp032LAQDGO
	Yvh0BB0b1KmbY3TCNDH3wxX7WkHD6zUhrXR1ZNdq0NRQcWs9m9KoQxN1Ep8RQEUv8Ow3DEcYwmI
	s+x6xH0PKMgCyoxVpKBMMRmALQtcvse5DZdBt+dYVZ1/jN8blBc+wwja7BZbwAtWJG8BM876Fc/
	N/krU33nogEnRUXfFf9GcjoReIbLXr1rdDUivDut9ZPfEMZdUto5UteyG9nZ5fp/5DecKB2fypo
	zKQCxZDMYTztotHpkwdsmlp3ZStactakybzEKBG1dO4pjS7HMhAiTphlk
X-Received: by 2002:ac8:5ace:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4ed94a59fd9mr18685681cf.11.1762509900766;
        Fri, 07 Nov 2025 02:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvb40HwfJq9SwOccSWwNZaSEGTSrcZ5r3eBdB9GGqjvFsf4uLiSdPwNbh+m3v/j1axxuAnw==
X-Received: by 2002:ac8:5ace:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4ed94a59fd9mr18685481cf.11.1762509900324;
        Fri, 07 Nov 2025 02:05:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be184sm199260766b.56.2025.11.07.02.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:04:59 -0800 (PST)
Message-ID: <17c9c47f-22f5-42c4-81ce-a5fae9bfff37@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:04:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
 <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
 <20251105064252.qxqkno4xqwfrhmlf@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105064252.qxqkno4xqwfrhmlf@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MCBTYWx0ZWRfX6TTLYMzcHzFZ
 ZsUUE7XhgAzC2HkzQ/gBDfxGk+wFRNYqg5NgyEVwjqz1klPBYV21a289hxulNnAlkHyYWzXck3O
 a51o+voku1bg4FSa2K9r5g7df8SDo6ywoj56SUEzqXFXYsKQbQqCjrpAkEjb7K5P4eBBr8e2XKb
 mfgF2TK2ybioyhbMjxl2bBAxOTy0GDF4ePFyiLW9DohL9yFR8vHeSCGkIVMDKZGu459fmfCSgCd
 UblXxyDKJ/rY1ApoieFCuqP9EpkpV/NTci1ghWIh8xWhDMBVYN8TtMM1k26Mb3xMQXdZO2c8XY0
 6cTc4oMEHqR2X9TtyTki1I9NxA26DXpHwbiaZ8f/YCdjT6SX8G36fElXxPobjoYLEpLXOCeDB7x
 lFx/X14hVlMukjcYi3pBgnvIOQ5s4w==
X-Proofpoint-ORIG-GUID: tRDFHiuC6x2xK9vZlwJwP28EKtq5ydRS
X-Proofpoint-GUID: tRDFHiuC6x2xK9vZlwJwP28EKtq5ydRS
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dc44d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C1O_lNBdy6xfDsNB084A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070080

On 11/5/25 7:42 AM, Mukesh Ojha wrote:
> On Tue, Nov 04, 2025 at 06:33:49PM +0100, Konrad Dybcio wrote:
>> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
>>> As a superset of the existing metadata context, the PAS context
>>> structure enables both remoteproc and non-remoteproc subsystems to
>>> better support scenarios where the SoC runs with or without the Gunyah
>>> hypervisor. To reflect this, relevant SCM and metadata functions are
>>> updated to incorporate PAS context awareness.
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
>>>  drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
>>>  drivers/soc/qcom/mdt_loader.c          |  4 ++--
>>>  include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>>>  include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>>>  5 files changed, 49 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>>> index 5a525dbd0a2e..9cdd152da592 100644
>>> --- a/drivers/firmware/qcom/qcom_scm.c
>>> +++ b/drivers/firmware/qcom/qcom_scm.c
>>> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>>   *		and optional blob of data used for authenticating the metadata
>>>   *		and the rest of the firmware
>>>   * @size:	size of the metadata
>>> - * @ctx:	optional metadata context
>>> + * @ctx:	optional pas context
>>>   *
>>>   * Return: 0 on success.
>>>   *
>>> @@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>>   * qcom_scm_pas_metadata_release() by the caller.
>>>   */
>>>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>>> -			    struct qcom_scm_pas_metadata *ctx)
>>> +			    struct qcom_scm_pas_context *ctx)
>>>  {
>>> +	struct qcom_scm_pas_metadata *mdt_ctx;
>>
>> This is never initialized
>>
>>>  	dma_addr_t mdata_phys;
>>>  	void *mdata_buf;
>>>  	int ret;
>>> @@ -665,9 +666,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>>>  	if (ret < 0 || !ctx) {
>>>  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
>>>  	} else if (ctx) {
>>> -		ctx->ptr = mdata_buf;
>>> -		ctx->phys = mdata_phys;
>>> -		ctx->size = size;
>>> +		mdt_ctx = ctx->metadata;
>>> +		mdt_ctx->ptr = mdata_buf;
>>> +		mdt_ctx->phys = mdata_phys;
>>> +		mdt_ctx->size = size;
>>
>> So this will always cause stack corruption
>>
>>>  	}
>>>  
>>>  	return ret ? : res.result[0];
>>> @@ -676,16 +678,19 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>>>  
>>>  /**
>>>   * qcom_scm_pas_metadata_release() - release metadata context
>>> - * @ctx:	metadata context
>>> + * @ctx:	pas context
>>>   */
>>> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
>>> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
>>>  {
>>> -	if (!ctx->ptr)
>>> +	struct qcom_scm_pas_metadata *mdt_ctx;
>>
>> Is the existence of this struct any useful after you introduced
>> pas_context?
> 
> Yes, it is still useful, mdt_ctx is only relevant for remoteproc based
> subsystem like adsp, cdsp, modem while they are not required for video,
> ipa, gpu etc. but the superset which is pas_context is needed by
> whosoever need to support secure PAS method Linux at EL2.

$ b4 shazam 20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com
$ rg 'struct qcom_scm_pas_metadata'

include/linux/firmware/qcom/qcom_scm.h
69:struct qcom_scm_pas_metadata {
80:     struct qcom_scm_pas_metadata *metadata;

drivers/firmware/qcom/qcom_scm.c
636:    struct qcom_scm_pas_metadata *mdt_ctx;
680:    struct qcom_scm_pas_metadata *mdt_ctx;
728:    struct qcom_scm_pas_metadata *mdt_ctx;

So really it seems like it always exists as part of the pas_context..
should we just make the larger struct integrate the smaller one and drop
the unnecessary layer?

TBF I don't really insist on this, but it surely looks a little odd

Konrad

