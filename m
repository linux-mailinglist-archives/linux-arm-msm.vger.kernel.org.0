Return-Path: <linux-arm-msm+bounces-74608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93619B9A702
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B29DD179C96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8FE30C620;
	Wed, 24 Sep 2025 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmqeUxUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350930BF77
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725834; cv=none; b=HNdW0p+slfVGwpRfA7mT6vc/nDmD9rnuyQYUVLUwjQQD8c5M2i1BumYlOduv6k8hs2AymMwAO6glCu1YnVmHv2T4xBZb0QBUjBiYV6bTEtbuvf2YISCD4d5REmWGUo6RfzNuwumdlKy1BWDH1+tM6oSQHYJ2VFJeK1zdd39xPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725834; c=relaxed/simple;
	bh=egQMVWXofRluc+O3XNLhjP9Calab+RJ26V1U0vRAXkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq6Tii1o5iXc9B0kMc4C3FpHmEKGdDxFUSOTyHggsbxkUW0aFClv9QvmAEccuIMicY83oRvoF5LXqLhvLVg0TTN3Sk7j7gs3sb4aAvuEmXZ8c+FTzwyalo+F8nCKLkUHTOn5Avly/TAK+FyA/Q52nGOqw7X4+nJOHHm0IbtY2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmqeUxUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OC52Zo027912
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckyGnU4M2Rx7XqkYDdLLQ35Tz4lqFcFTvWIE7FLlHNs=; b=GmqeUxULT0MKNMZa
	kT3Wjtu3jdiQvTc+lafWiA/wk+n9rkUTdB1SesDLHcaG/aRBvz97QyoD038SJ97j
	W5TPT079T5u25+o72X2GoEsizAGRXDhdBTQxSSO913dLvKuFnwfqHwytfLH2J6kW
	f0yLiF592DI9lvlG98gTa+ZuV53dTmDRrgKVZDvSvLknm35um30H0710BUq3j9qP
	rm5zvRzWX1CPh1Ne4pNHqfcyGJfx76X/vbnnY3yJ5R8UeT317SMN2CFZTp6kUhP1
	k4auf7tqvFJwHyDpkA/dBodUl+Knqi3y5vfnlucZGsv9sEW2QStzm3gYJzjPga7V
	B4QJhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnw2ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:57:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7958a07a5fdso951506d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725830; x=1759330630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckyGnU4M2Rx7XqkYDdLLQ35Tz4lqFcFTvWIE7FLlHNs=;
        b=eJeGGh+UfpzNI1O6NybDhltpeAmT1yIZKfZ/fO2fzLD/WfvKqQOyUX4UI17wMJdWg5
         uKBFbTo257K07Z8xf4oQVjLxZF8oItROv2pxHVXDtxd0n/Tq4zUnQLFCWAxIDwMeN0Zt
         8wwfHdM3RDhVXW2J5ClIShhe6OLtubAguNCraYYTcbzDUSvqwA4aANpu9BwXRyMM8s1r
         1T/IWRMaB1XaPhMSEramv3oU508PuX6YjUUyXelUWvH8cI6HgAGOFmapoU3olhCz4o77
         SkVajkjXLVVw+3l2aFHlFL2mKqtI13P+97eGFpoNG2YXwJ346GSQsTo/CHmZ6uXYlCbU
         FUXA==
X-Gm-Message-State: AOJu0Yw8wYBmhE2gWJ8H2fSp5mlJAC3cHXOYd84LNRDApwIZvYmHL9yN
	JvMOZIDDPv3a4tiig8VHdDJQXZAdN3FrGJyvVnN9Ae2OZ42WITxuwwVNsWtj3Nx+1Yxo36vOvRm
	IFp4tx7Mg1U/OWauDxIDHQfj8LmDaIX1scXF0/fkRSv4NLzQ+75ojuSkS7O1es075GqTV
X-Gm-Gg: ASbGncu4Qh7lL8/N1cpcJAtPF1WzyNZasgKkWfe3Or4jSE++stW0uSF+CMSnb8lTKBR
	ya1F8Enqi+FPaGWrw3RyXFwcL+s7274N1TGgW1i2/uwiZQ+coqyqeitL05qLIkXeNHGtlydhaFa
	/wJgoEzqOFy7AfPcCeIFZ+Z/0eL10qk4W3awQrI4kSaCIZvWTD8AZ3YjEt7J2TrGT9OewVK/5XB
	NvF7e7IY2WbxW+0Q888RY+BsXtUOnwemCX2gFisIS4LqyTImMiCL4d1bL6U+ig+65lfeFqZ7dPs
	dPL09+TcL/fGB7GzhZHCH9UYEqPV2+rXSsuIZReApYWBR80pR1SUvfczCW8wcq4ENMtF6zsZF45
	CrOLcHq9gW08Ypwi6iS6DIw==
X-Received: by 2002:a05:6214:2502:b0:7a0:a767:a178 with SMTP id 6a1803df08f44-7fc0eab2cb9mr3300416d6.0.1758725830017;
        Wed, 24 Sep 2025 07:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO2Vs3swRlyTQ8GDhqQm+/1/ktn7C9+edXnhTJgkKpujjA5KbntbkQppXM7aYx9IqAay9SnA==
X-Received: by 2002:a05:6214:2502:b0:7a0:a767:a178 with SMTP id 6a1803df08f44-7fc0eab2cb9mr3300156d6.0.1758725829452;
        Wed, 24 Sep 2025 07:57:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f1221fsm13219669a12.32.2025.09.24.07.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:57:08 -0700 (PDT)
Message-ID: <bb25208e-a6a6-4a81-9dd5-5c5eb1cf16b4@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d406c7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Fh-lqomsUFxGDEjQWKUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UAz6q6gDkLQU_r-OqJr6ZALERpufFMjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX06S7AYZrUgmK
 OD1bbKRNc6DoCaq3mGQSxMpUewSFcKGDj7f/IkurERlHu6i/uVyH25EDH23s5VqNNnlfTK45GMR
 Et9FWHFkdOXbhDH4O2jknFkoTB86l3uVPTmS5gTeM2wEdZKxCFW/GGL+s/dxURH7drSwWHZr582
 qk3UBMMlAuDX/0EpFNDlNIiBFMLlFt9pBW1h5uyAYyq+GXL4UsYym4VM4YwNOae5/NcWra8ZeR+
 idC6Lqfms+7Dpvtsm3Pdzsf63cAyVvhj/+53huZspF3JLmW1fIHe09xXVTbHehZgkozis0DDQsb
 96PV8xunnYawcst8+wFL0YMFkPnLODVDdDyp+wsUhT1qyFmgbPZfCPXGH560II1ly7up18Q9atg
 dm+RbFps
X-Proofpoint-GUID: UAz6q6gDkLQU_r-OqJr6ZALERpufFMjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/24/25 6:18 AM, Jingyi Wang wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> Some remoteproc need smp2p v2 support, mirror the version written by the
> remote if the remote supports v2. This is needed if the remote does not
> have backwards compatibility with v1. And reset entry last value on SSR for
> smp2p v2.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

[...]

> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	struct smp2p_smem_item *in;
> +	size_t size;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return 0;
> +
> +	return in->version;

are in and out versions supposed to be out of sync in case of
error?

> +}
> +
>  static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>  {
>  	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> @@ -516,6 +542,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	struct smp2p_smem_item *out;
>  	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
>  	unsigned pid = smp2p->remote_pid;
> +	u8 in_version;
>  	int ret;
>  
>  	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
> @@ -537,12 +564,14 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	out->valid_entries = 0;
>  	out->features = SMP2P_ALL_FEATURES;
>  
> +	in_version = qcom_smp2p_in_version(smp2p);
> +
>  	/*
>  	 * Make sure the rest of the header is written before we validate the
>  	 * item by writing a valid version number.
>  	 */
>  	wmb();
> -	out->version = 1;
> +	out->version = (in_version) ? in_version : 1;

= in_version ?: 1

Konrad

