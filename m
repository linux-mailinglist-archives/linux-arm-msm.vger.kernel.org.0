Return-Path: <linux-arm-msm+bounces-64480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76668B0113C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 04:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4066A482D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 02:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C66157E6B;
	Fri, 11 Jul 2025 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Utx2lFiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8244A0A;
	Fri, 11 Jul 2025 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752201164; cv=none; b=TJ4Q8GXThFCPGTQSvEa6t4B7j3krrYt+Vz/MhbHo4ejro6w3Vo3LDsh0pzFpiOKzThCrQu1s3AFgUzKT8WGkLhQadPjsN02Avc3RLRGwv1fYAY7kK3SB0lCzLQxKyxixymnbkjjz5C1hhRO8i16nq73zIJFxy0/Pg4P3L235j0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752201164; c=relaxed/simple;
	bh=tiAbxeh+3LEIGShY8Zl1p9RnVrdifpatiOcWmKio/Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bg/fU+DIiCLmHiGX+srKINEe8V7tEyVaW2vesxJXcJy9fyhYqzURadGeBSE1bRnL+WZAPM3qz+kopwakcwK6+C3cHeK27uIKsTK8KNuFQQr6jNhbgXchhmB401I0Mhm6lP4l60dBGDvf2FI+VqbXIPrV9vf7G9bSlVfpJ2FKK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Utx2lFiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X7X0003786;
	Fri, 11 Jul 2025 02:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cyOl8EhTF1d3FCvkz0zXmE4naUXkNV+0lh56s0a95M=; b=Utx2lFiHByXUJ1ld
	yRsoojfMis7Kc4/sDKIZ5/FFC1EFnjTwOk21JesZu9nDKPao1+T8BnG+7OVXfwao
	R8LY/l+EMg11aYN5+cBc/JMYsu7HaVeVUAglldLoq04bbSIUMEXtvaVX6tmFCblx
	hO9JD38IsEY6C7sqkHiPSzIfEFoGcLrf/pV1N8yGApmtTn5HF3X+rQayCUCaMqu+
	qk8jjamqQyeGT2UBMbvU+5InrGa0S2AhY1QchJWl7xyTmx4INGXaC9kNd6Ow45ay
	qEo/hKDkBmLWCbCVyi2kHfjFk9sNhtTtx4RWNkhs6583g/A594d4YBRDTZM4276D
	XoBJAw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbny23w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 02:32:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B2WWXW015861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 02:32:32 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 19:32:28 -0700
Message-ID: <f544feb0-94e7-447b-8658-f9de9e3a82b2@quicinc.com>
Date: Fri, 11 Jul 2025 10:32:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] misc: fastrpc: Cleanup the domain names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <srini@kernel.org>,
        <amahesh@qti.qualcomm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
 <20250709054728.1272480-4-quic_lxu5@quicinc.com>
 <f5ea9bc1-7617-4573-a10e-3499161a7819@oss.qualcomm.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <f5ea9bc1-7617-4573-a10e-3499161a7819@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAxNiBTYWx0ZWRfXwuUIzLSJh4e6
 tidIDbNXEFvmBm94+NMPefVpC7f2MiRXo8naowLeQL0ypgfdYLLS8qhoSvBZYncoCkjxnd7NFGC
 Lz/cJ2Z0ClhUS74xpAu++jz2fNT9ZtJ+iPs12gkRzmZRzRs/LMJA1KK4ckXoedHMAAPOeHCAqDm
 IbgKZCLmDtul4g1eADJ0Mz19qvmTsrNLjEmbBLQkyFImWIweSeRIAHsO/8y1V1ZRQXyY1HR+aAm
 srmkPnPf4uGeVUvlbkx7uQqfpXO9o/0CXU5OmC3vwpg7gLGd/9biFUsTZy7h+YE/kdMfKdmBOE6
 /iQcPwZs8DaAKVTj5kLCtqj99LgvC1bFzByz0+P+mCQmHTclHuRLf3Ok+rdkOAJXftU1BD5sJLa
 YufhZQ7vRmVICQvPL4Dt2nxW6vNy5CRSZhm2y9tkwSwhREb6rIH66xIRtDvg2B04zNdDgAUF
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=687077c1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=TqdbdoAbpVb1mddDCtAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MQuMv_cc354vnnoifl2MlGq5MEFq3aVc
X-Proofpoint-GUID: MQuMv_cc354vnnoifl2MlGq5MEFq3aVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110016

在 7/10/2025 3:25 AM, Konrad Dybcio 写道:
> On 7/9/25 7:47 AM, Ling Xu wrote:
>> Currently the domain ids are added for each instance of domains, this is
>> totally not scalable approach. Clean this mess and create domain ids for
>> only domains not its instances.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
> 
> [...]
> 
>> @@ -2330,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	case ADSP_DOMAIN_ID:
>>  	case MDSP_DOMAIN_ID:
>>  	case SDSP_DOMAIN_ID:
>> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>> +		/* Unsigned PD offloading is only supported on CDSP */
>>  		data->unsigned_support = false;
>> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  		break;
>>  	case CDSP_DOMAIN_ID:
>> -	case CDSP1_DOMAIN_ID:
>>  		data->unsigned_support = true;
>>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, true, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  
>> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, false, domain);
>>  		if (err)
>>  			goto err_deregister_fdev;
>>  		break;
> 
> Taking a step back, do we realistically need these checks at all?
> I would assume that there is a layer of security on the DSP side
> that would disallow running code in unsigned PDs on e.g. the ADSP.
> 
> What happens if one skips them and attempts doing just that?
> 
do you mean comment data->unsigned_support lines?
On qcs9100, it works normal, test will fail on unsigned PD if it's not supported.
but we cannot comment what would happen on old DSPs.
I think it will be safer to keep this.

> Konrad

-- 
Thx and BRs,
Ling Xu


