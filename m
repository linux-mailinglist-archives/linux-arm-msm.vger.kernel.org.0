Return-Path: <linux-arm-msm+bounces-58086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADADAB8B63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264494E156B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41371F3FDC;
	Thu, 15 May 2025 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8nKleJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434151F5413
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324223; cv=none; b=mTj1sg+QGRkIW0QxZJDKfnZ6AZs1Fg5IbqwvZKWQQ/5kUasUDZPRe4zK+zGyVdPvcB8u25HKWYQ/HBnozf85Co4ff9+ZF9ULW1zVgctZcfNobH4m2YDQH+wqvXIQ8/Wd3jg1KRzgC75q06xCOStjRKa7ldyReEtbsON4t7TgOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324223; c=relaxed/simple;
	bh=dNlcXEL1og5hj2r5kvEu/Kdl1W+j+I13r6l7i2pULIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra7BMjAQs6zOOvzBmzqKces36HTdGBZoM8Qw+xGKcHYOnPA8DVAxwL+KW4hNSg4Jb84U/n2UJuOsY3vngt/ryWc+0gMzm7/RF2qNHX6A9FQz4RpiCw7RGswwTf1Abf2SzpjZFPnFFtUVEEnmK/BDFWZN6FwLt+aFDJ/vx6p3Kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8nKleJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEk1009131
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=; b=U8nKleJtoiVp0HPr
	Ek0MAMznJhONqXdxdfICIwTA8XT6akalaMuedCzh7N43y+Jc0D4LSl34+JQCJcd8
	xOT7oRbShJqGJZFqgFdJmVC6TxD766q9WehiJVIep+knlDBAlkUCAM5WQcwGXFrh
	ssDo9wjLPYIttGE1EVwU8AOVPgvU/Wr7wBpip+fIEeNKR5T4zWMWBWe/jxvlzmSE
	ilb/eX6at088x+i8uo8LyoyiSbonxTHu8jnwKt6qnQovQhhrrTMgf/ZMHbxtQzMU
	2TRmSSkzJJyVf1efm5N4JoT4vgGrqEoLpR6G14XeI57J/88Nm2lpnjvcPpCdk1GL
	QJuypA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6q7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:50:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-48f812db91aso3137231cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324220; x=1747929020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=;
        b=k/Tv6igYCuvh6l14+QeDaJXC/Jj4uIGoNJAa6jLetiFfoOIotc6OA/RKga8900DJt5
         l0xOh0NleezbS+e04QAhDQyqi+okJX2o6tnA8rN8HH2hiO87vJuOd0nVhnD2hRJleb/s
         Q+A+ityKjdFAX8truoVIRSXLwiuGLGX7Oveh2+3w05gjtcXNNpRCIc2S/rbOz4WIsnG3
         axaOUoe5rY0yRCwittGjGewAblr+rnA05CPUDXQOYOpXzrLDu80lzamBWtDXT932K7z3
         /LMsAdJsIs2KJXmK0cnv3o3vj/CDLFwQ6zbh7w8IcsSd7nJRBUoSMMHHsoq69OG1rG2/
         DNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2rLxqm3RY4GVDUYCJVFcVLWeUB6mEGKWg9TvgUPVakBD+nAAYANvYhqZ3zX706/vffAWUOb6xApEhVOcb@vger.kernel.org
X-Gm-Message-State: AOJu0YzNocveqA9DI4J1ayCJrReAtDY1uF7SckCq2OdzPBOMiJ5O02BT
	tWRdOwEpXhXVWE06OgE4vIdthBH2wNfTdTFR9Ya2704OYFG/eb2ZDzHh20PP3IBOdzioMe4Cork
	tbPqC+JgtbUiivlUk/OJcBb/trAbB9fUBG6SUuWZTIdnKKQNl3PxkH7Ip5ahRMUjP
X-Gm-Gg: ASbGncsOMVfAG9pFUQPYXItodCv8LqgBQW+S+4Y/SHKXPLBU+eAo6V4EfUvnTEhhphm
	Stae9zxRECkdBP2BUPy6n7GkaOl5wiowvQPoqqo+jwNfRlsDXeb5T99QPUkWXf7o/rlijip+oRE
	iNjOaA0DjWToBaZmxcKhrTRzUJk+cPUou+gD1V20FyFHp7PL5Q7450nzgC61PgVQxGbAryLVFNj
	+Dp5WH8O9jPuycz2pH7ecDy3ZcHQZVl/czD1SPt1OHU9Tnegadi08edz0jMtbJK3dlaOGJO1luP
	BfPE0m7RnUTPSAH/lc/d3G49+2vNF2MxY/T+YlKY5m8ho9ginHseKIAtU8vgEJ8snQ==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-49495c66538mr38609221cf.6.1747324219742;
        Thu, 15 May 2025 08:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMUIAEtbW2Lfnl05viWeYgKuGoOg/uXu/bpms5M6DOAK+WjTQWzMp430rphpSK5jRVU7Lf3Q==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-49495c66538mr38609041cf.6.1747324219274;
        Thu, 15 May 2025 08:50:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm8041666b.52.2025.05.15.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:50:18 -0700 (PDT)
Message-ID: <c1a18f29-440f-44d9-be9c-fac49639ccbd@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
 <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX0+dBgWAQi7RT
 ZyjpMyWh9Ap38USuenq0zrE/upVRMJGYtjZXUc2JoBGfhR/zijU6soQPO6g4rlAOY6+NwnLUmIv
 a6OOdcF2O2IJ8tSdXKTSFyN3tDHk1HdeTsQ8UFRKe5Mb3phme8CPlJ+mjlDkra77hhbnDK5Ghhw
 qkEE7+URSaWHNd2K+FnAY8mr13+7c4vTQFr5o5yqtL5P1UcpOGaPe/DIwm4leuDdBDA+HB5qYq0
 kMZycibwSipzDJu/m/WvJn0txQRnBVqP+pU6AQ73emawnQuWJNU57W0ttoKc0aLyCzyi4vOhfAs
 u+4zSqJ4DrzK1PpKNyCb3/qRqgPXx/JTl1IBKLnfjzkRBnFnf7kAz6yOn2HVuPVFzY6naEeqvim
 t9c/oWBlQbt+ReJerIN3TDkOr/uQXl53NrS49UIfc1+ORgAAbI5JoAMEPAVsv6G/EZGz+Ri7
X-Proofpoint-ORIG-GUID: -lmvDEv4fB2SPh-6fnH5NAOzYzoi99pn
X-Proofpoint-GUID: -lmvDEv4fB2SPh-6fnH5NAOzYzoi99pn
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260d3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jzhEuBAUjWbXnsiB1ZYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=997 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150157

On 5/14/25 9:03 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig       |   8 ++
>>  drivers/soc/qcom/Makefile      |   1 +
>>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>>  4 files changed, 311 insertions(+)
>>
> 
> With the SAR2130P fixed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> +
>> +	/**
>> +	 * @highest_bank_bit: Highest Bank Bit
>> +	 *
>> +	 * The Highest Bank Bit value represents the bit of the highest
>> +	 * DDR bank.  This should ideally use DRAM type detection.
>> +	 */
>> +	int highest_bank_bit;
>> +	bool ubwc_bank_spread;
> 
> Nit: any documentation for this one?

Not even documentation seems to acknowledge that bit's existence

Konrad

