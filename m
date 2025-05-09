Return-Path: <linux-arm-msm+bounces-57429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B5AB1365
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E31D01C07512
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B942900B5;
	Fri,  9 May 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl0GjNo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D1928ECEF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793831; cv=none; b=fc4WJV1b3QiVlkwlpOzf1wgQ+hmAqQeHvMBIWPPMVv1EmheJUq9xkFDHLDUBgNdA+g5cZv0beoxP9MGOr5YQAJher4CSd8pj/NMuxJrnj5pG+wOKRYDm6SdTEHiSVNAov3eX9HyVteicaAj3KGZsEVTIytTeiYPuYDobyFGRV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793831; c=relaxed/simple;
	bh=EtIqMxiMTSEf7RwEbSPialgbzUOQRaigNeo+faqjLU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efeJUq6NUHgc/s6hwrqJpptClanB+mvk0YztmPHR4mGi/xThnpcvEVCVnUZbDOtZAmlQMAupbgMmxYuvxyoh38LcCVgENPhMpeDHgWin/Bjo+Bq1Rw3PWMFoQOIVEkWedGdW1ItMtnCaAIyDTIl3agBl1KlN3PFMcNlwn3vxC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl0GjNo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493502p031336
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=; b=Zl0GjNo/+5WV7EPn
	4aLty6QN0B4QEZiS1wOy5GR45AjjQMZxk+XfpKka+PdyTX0/EviO9M8R5oYCiW7e
	8i0LgoFSEtmSH+CfuSgbPYTBq2Ay9EryCfHLsqYD1OZUwBwlaE5wwIwCjcxWbg8R
	9QTdoFgzdQqwX0qRFKXYowco9/paEOSGPnSZUdxWx2oXzY05p0Reb2Tt3nMvTz0q
	chqbAzz3oauv5l7FJnd+DPClKz6vVWAuHkEdoDxT7I6duu1heMOow0xno0BJ6rcb
	4WQG8MQ964LhxdBktcwHjCT5A50M2lbnH4jge0FUJYGc0Em2WZ86f2iyaLc75SK0
	oaz/7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgmksh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:30:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso56448885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793827; x=1747398627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=;
        b=IHyz/MLxch1wVpWCiYWFWUuTKZa6Q689NoH9FaM16q0zNa23f+4ql1oMF8ZtI1BAv7
         1lo+glhSSFp7bli/NYvyXeoi4rm+hhX2/TjJIIEooQmcxfsrUHQ0CAr5LT71LRoUQpya
         Bh+CxtHkquzk/TL+QOtCoC22f7UE1BuHBAO/yhOEWQtTgWa5xHswJjnBfdZ6n2Z3V81Q
         dYdO9DXMRIVB9MstmR2tvcTKhxKoBcMKPo/1v62YxRgfY8P9DWWAPtEh3StmD+xRAu+7
         0YpbXESt4zxRqYWpBP4MpjFegDjHkKizWqGhG551AO45knoMOMDsPkEwuLNK7oqEyPyH
         PYFw==
X-Forwarded-Encrypted: i=1; AJvYcCXVUmK21IhHgh6ck6xhsVF5jUZQZT/tFD7Zt8x5FjPMAKoKaSnJf33QGFrE4lXfAeSSZ+vj/BM7ufVbcTMn@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvbXvqr13iSFhED3SHQ4WrdgiAiDhQLtP30YE2DTG630ARlvw
	IosQzrQAOesygwKIUY3FUxDHXYK2oCXPwmc1gNZ9egaPmRl6jrkmLD2Cl2eVbEuLKTE73BjNYDl
	Z7Sf9KU1mTtBfEpoPtT/FoefOE0n1CsQeGct54K3T86Z1iAmYNv3ilgcSKAw24Mzj
X-Gm-Gg: ASbGncuFx897JYdDx5oeE3o75LGImu+xCqIWbynuESTNLRRjJJ4EKoNCZ7tYvuamkGr
	U98jMSMymLxgFM4vgi8Q3Vzoidj9zpXJNQu1ssCWFiNXY14YdP63uVkhTmu/QtHsJ/tNEirXfl4
	PZn5SgPq5MkhoilORhHsSRs8RZHZk/mIYc00KgXdTQMWQTvikk3bzt5pT3h9HIjKSjy3+lkZ/J/
	CIDIoqUQEJiiTELF1rCV7FGFaYGqgwPD14s1jTysSM7bfppn8IF0GYJ6QmqHz1CuFuw1O/wEx6L
	/tmG6ji2MQLS9FhmJGAfjYTKy4F4q6leHl/lBI8j84WN9j52OBXD5m+HWiTDLRiFt6Y=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17282256d6.5.1746793827331;
        Fri, 09 May 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU6gmI8KLHNG4ho2OY5Av6zEE6Kq1HFOv+DgFV16MqINqCdZXRWO8sLBv9ZYej736PGPshg==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17281956d6.5.1746793826703;
        Fri, 09 May 2025 05:30:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc4f240sm1317373a12.33.2025.05.09.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:30:25 -0700 (PDT)
Message-ID: <eddc2ea5-dab7-4c9c-89fd-23ed20b85ecc@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681df564 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HXtwfQqbK82wVydd0M8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfX1+Dlap0K8ZJ1
 7JHAutB+/GbQw8PsFzwYd2x6DbyQbMCB3TgyElB4qSiSvA29M4V8DmbYl6+EMJb9fOOb+swpdZC
 Flggp3TAADwAp7cpZQyt7V81a0mjReXzyIGvxp7wrcUVVF2nU7+iumUZyh5YlNBzQrV8Qj00MSj
 jgZItAskaL+IQhbc5Mb7cJh2LTKElPFYq9Xvtz5gWr18hhHaIB37vdNwI8fK4dt4YiKVW5QkDOo
 Xy6vn0zqDY99oD1i7/B7gG0epHmeN2u3jQ9SqmrzVX4p5jr/KSmkSoTZDWFYzZ4ahRZhQjNJdKJ
 QTqf9kpFI4OCZWIEYTxDOwt0hT3ZfNRppPmxa1Cv06ghzMuGoNVVA336Gd/cx8MXgiof1FvUKi/
 lMrQaFqHzLZF64pXK1rq11zcpKIDbj3e82DUy1FbyJ8cQfgNi1DJpsYfLxJbE+GGE69AngSh
X-Proofpoint-GUID: rIudYdYWV6k3ebxXkciUloCUF98qJqBS
X-Proofpoint-ORIG-GUID: rIudYdYWV6k3ebxXkciUloCUF98qJqBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=831 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090120

On 5/8/25 9:03 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The value the UBWC hardware expects is 13 less than the actual value.
>> To make it easier to migrate to a common UBWC configuration table,
>> defer that logic to the data source (which is currently a number of
>> if-else statements with assignments in case of this driver).
> 
> Don't break the value exposed to userspace!

Bah, I keep forgetting it's there.. I think I'll alter the mdss code to
do a -13 in there instead to make it a little saner with the future
getters that return the x+13 value too.

Konrad

