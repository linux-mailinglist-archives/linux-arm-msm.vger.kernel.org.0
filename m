Return-Path: <linux-arm-msm+bounces-57482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD3AB1B83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0BF98220F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC04F239E8F;
	Fri,  9 May 2025 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1rOUacq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181C23183C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811405; cv=none; b=cfE7hlIQSW4SrrQnW9skGKKsLoAk48Wk4gnodr12Bl9pq537thw6Wtqzt8TpcUngMpkwerushySEXZ1dAzMY8sWQ4U7xwrnr3BNPnKOC3NdZ7Q9bcAd8jRv6lTbNX87CfdNuoF6R/HmnqXYfchxHz3hOKiZkXjv8bnretVvicvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811405; c=relaxed/simple;
	bh=p7CnOI+eB6urGUFpnCOyOafwARFO+PzXylkm/qR4YuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laejPk0Y7Q5JfvIrhhC+iyqcQocQbJacpEQ4jouOw+RXBGXyvM00bPFlaoxzJ4QcLzMeHT3rkmlmrg7/qTxvU9/b6/kMSePeGuTLIdnQIuQv5pQ9ydmfh5WvKzTn5wCJ+wB5729/EizjPcs6qro7ikpy8VgO+fIr7hmhRgw4Xww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1rOUacq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BhxO2022749
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 17:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmh3GZgplEnn2RGKAzJAQOcuqEH4ffRTlVelkfCzQwc=; b=Z1rOUacqE3LfbypC
	jkp3OdHQZ1tA+qYFbrX6/L9ydisjdV/ySkHrWA9ARdnC07SCs6R3GdQfI6J6g9w1
	oYE2wBr2vD/HjIURRmcbX+UoIxs9s6dSl/INw/gdbw96GomUkTdZCLdanP/rchRh
	ohkf4z+DssYhuYc+LTVfiZ1vaUaTIaw8rG1+ap/NwMFcuTCJecnrd0OyA8UnqhEH
	6LH1Hn/UIqeUSeJoT5+6O89h/tnp+XDK18onP0pyREQ8UdjXZyNa33WxUEYVDTSb
	4AKAcrCIvOv0dKg64oKTHdcQA3W1bdDaduT0ocVLKRfWFj4J+86Zvsqb6DrlQw8W
	fkLBxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp85ecr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 17:23:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a4a83106so1279751cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 10:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746811402; x=1747416202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmh3GZgplEnn2RGKAzJAQOcuqEH4ffRTlVelkfCzQwc=;
        b=paNyX1xBHAkDAOoU63rLCeOrYuvfwr7oQQAEHRXvElp4Rr/tI6JDWCIJY5nW7z8+YV
         401kbtM3Jj0R86V6wGqZTsqG1NEuwuNgoLH26SF1Qxb2pxggTcGX2tVq56GHMK92vHEU
         gv10ZhklAqMIP8D0usAv3U8GIiStBIvXh/M2QthHA7hNBn8if7Z3vgcAH7nriKSyMhsK
         FJjE0BLuJdOKhI/JFiupQ2b27fy+QvyiF3lTq81NLOU3KpUy6ngFHN6bW9/W7brsLxY3
         h2a8Vh30z4UZKgYHj2iMyCcbgwaR7ewNjsf6jfSWhzOPZMiLvDfMhViOYp4N6ZfK1+gr
         P4UA==
X-Gm-Message-State: AOJu0YxVEYPU3J2Dum7HPsQLYOj1J4+2DG10oNqEQnYMVEDbLNMsiatc
	km4614gQB4wwluFW6KBSfm9x6Kq5SwuBq/EDm/Nj1cgSa3yy9EFLoGfhFOsrgzHyokIOMXDoxfa
	BjIf2GADrrlVW1w2wXZn7qG09rSEIPcERyWSFKdKIduvwsPOjJj5iCfZ5rgpPPUhd
X-Gm-Gg: ASbGncsiRYFHBBvOZmYbRhixqvOF8AWuLJODKtQke2ZAb1ZqvKuq54nSFQEQV5JcqnP
	W5V2nl2aY345Jk4z/NdtDomW0m3v1Mp1IIn+kn+/TS9PmBBEYjHvNF4DhmMYypDeMxZpqZrA9jp
	3UP3faWI+KnC14omVMLzu3xO0Z4WEtvqPskw9BH4nEi8sc8hGVHTAGJDohkiOOHaTAafBrc8UGw
	kkqcwx4zZ8f8M0Vl6tZdMj6i2kFWTbfwVn87iuDW924nLRIAethFVVioVYp5+O8ij1+rbtffh9g
	nTlLD36PfrrOr2tR0e/Z6Ut/8w5bJNkNsE3sB9/O2TqDIX7WcEAbYar/S70kpspeww4=
X-Received: by 2002:ac8:5f49:0:b0:472:17b5:dc3b with SMTP id d75a77b69052e-494527db5a7mr23857751cf.15.1746811402071;
        Fri, 09 May 2025 10:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5QRIK4iJ4tOkf2Lkv/WKPhvF8dNzthNmK3CXlwA30g+Lj2Iml+YpRYF3Uf6pB2/U4x4Hxfg==
X-Received: by 2002:ac8:5f49:0:b0:472:17b5:dc3b with SMTP id d75a77b69052e-494527db5a7mr23857521cf.15.1746811401604;
        Fri, 09 May 2025 10:23:21 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746cf4sm179304566b.102.2025.05.09.10.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:23:21 -0700 (PDT)
Message-ID: <3d871abe-1185-4d30-a99d-ad59706002c7@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650: add iris DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
 <7347ced4-980b-4630-9b5b-4810df249b89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7347ced4-980b-4630-9b5b-4810df249b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e3a0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qJQYiIqyEECs_jX5HgUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Yg_KPSsD8R2OD8fjLAQkmzseWqD2Y571
X-Proofpoint-GUID: Yg_KPSsD8R2OD8fjLAQkmzseWqD2Y571
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3MyBTYWx0ZWRfX5XGuRBDKJbkV
 jgPNajn8iOq3sR+MnDJKmLqN/FyyoYCdon9u1ik8lWQXP9Y1G/kJFYRrrUUOOR6FlRIGydEXTtF
 de/gaZ1w/G8jEBISm7SkLUSo1Go+tCaRyjhDM6Hywu9ZBYcvzMVx8eCIWWJgfor+xD//bNfBi0k
 raBAZwlBpz1SyRithzVY24is1PBGmQzOMBHT2OQbVUiyoRl7qjQK13i69mD1YyVYo9qaKDJu8qh
 cRPs01GA+8B3AydEnokWYK2kD4s24YYBtZhr9Lieo/KV27ICkFSMqRIRhbKvBEYa86PV1bDeBZk
 utlzYEsGDyOfmr7jxLLW6/L1337srwI8qHZiHwh1Ba4HvoKVwDeQB8QMyxh/t7BshAcewp2xlmm
 fkhCykVgF7o9dlNJMWjKysKkQNAb3w2BDKsj7jjzQ1YahWYC1m10RZZI/l4NWcCvHI1kTbg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090173

On 5/9/25 5:58 PM, Konrad Dybcio wrote:
> On 5/9/25 5:28 PM, Neil Armstrong wrote:
>> Add DT entries for the sm8650 iris decoder.
>>
>> Since the firmware is required to be signed, only enable
>> on Qualcomm development boards where the firmware is
>> available.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I don't like the new comment above status given it says what we've
been doing for a long time everywhere, but i won't ask you to resend
just for that

Konrad

