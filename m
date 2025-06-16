Return-Path: <linux-arm-msm+bounces-61478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA9ADB5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B843A04F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEF420C00C;
	Mon, 16 Jun 2025 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjXswM0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD827F016
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089204; cv=none; b=PHOPn9Pok9KoxKUYIbt3oNjDMGDa/qt2VDBsutUz1/bqvThr5rmUT1s48FRzJs+oFjxm5Ur8zskx8CjPRHa9M0KZLMlnN0IAd2pbUhuMfv17/VHoAoFuLDGBE/P1DNsCxa9YHEdv/PNn1LdEA7dsPQ6mbLXK582ufsoRJR7Nl2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089204; c=relaxed/simple;
	bh=xe8kV5y3CWGlDnK3dNNThBhNLUjz9DxmDV86Vg2im7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmRVA3cCW9PkGlhoqlSJB4Q9jMljQJS+OvmodNKMRBghi1WNJPAUukvatmMvpBBw+XuEiiwS+EcpRk6s4GfSR4BD7tCIBUQCEG2aW6fPsOGxqYbKTKk68kMWk/PJZGXxHsSuOwDZANGA8ovuBoyEmyMgJuEivZeXoxKii2k8U0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjXswM0i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G937AZ008236
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ls5lBrZa1Chnre4Poq+4r9uvpQzSemOb2h+RYlU45Y0=; b=YjXswM0iC/mXVieN
	JntauwXDL0Yu2WWS/tTdJieZzcK9Jsfu0rhDapgiisLOHCsvfNnpFjVMdSAYutZG
	3+kCinjzgQgseveOc6Cy9J062wHe+nG/oQmRrm2+smJK+d/3gXUWYk2N3ChJts8U
	6hh9TGiAWxtjdu4tvilSwi2xV/1L96Dd0DTqcRyfh4gfEFvvN3nnfjWNcbKaHlE8
	Ns5m5+Isl+qDNHK34gSPeEhQMYmWtpM+uT7KtHqesbu1xShK1q5ZG2sYr+SkA87d
	2kI7AZqmsc4jRisbRvhIgKERvM9ZDIHU9I1LbhCM2aeKMTIF0m04lYSzmbWn0ZF2
	mzEsvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928md2dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:53:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09ed509aaso771612385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089200; x=1750694000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls5lBrZa1Chnre4Poq+4r9uvpQzSemOb2h+RYlU45Y0=;
        b=TLjDyW5qc1N/IUta9KArgz+rZatLEjDBxziWYDruBzXOt/UVQswl3kJdS/yN+2stpV
         jT2cISs5KOFxntHT5B8CDG44HOdIhFG//4pN5NzSlCtmUoA09DuFFT9+5IgVICWSU8Xw
         vkvJGkBPW0tACG4BKFTHDyXLQX1ziR6vZfGU3i23gWfDT/ZYB41gt3RiK/hs+8Gx2Xeo
         hKMmnJkknoVqKlgEllo5PF29352lSFGROLQFzWWhaU/ITpWIZQmk83l/wt9UvLYAhBDR
         RQkn8MuddivN2rbkQhbMMFPenj5JbS27Nr6XhY8q8ddFAQ1nsd2iZKSzwPyRQw1OxyKF
         hzIQ==
X-Gm-Message-State: AOJu0Yylq/MXbSJp17sPVtP0hp6RFGPIFt9nk6nbSOV2NVJDvuC+PdYC
	yY6sVdWGcZ25Kpcu06ifw6inwXUwOTcp2KzCd/4ZMCnPGF6NApmhCWTAYErOVdHiGsZWnvlrJ1a
	bTZT9PFIFMwEeAOhdfWOs2ePRWcm3O+hNXbeVXhZl81wnqgXKB0im6Eqbh2A/VasNd1q8
X-Gm-Gg: ASbGncuVNiAewYJQoJhSHEfhudB1v91QjIJEC1IheuavxMDChiwQCf3iqM+QiOV4d9K
	cdpIQewZPWuGf4bAymZf3u6lthoRkU6a34Q0uvVN6Dm+EafSWGFCI79Yn9qm7Ung66ECXjWLDN/
	IVvhLN6lFIQPkPKHuiLfCf1fjzVRJG6F/NGlN6kAZZS/IkX+EyH1mW4kX55KEvtQ7fopNUzkyNZ
	nKiJ5+y0T7yf2omlmumw6k787tvb1TAaflZTNQOyel5l23ntVgK1TmfAFbWnjLHcrbaisx0/Xr/
	NJjUORRaDAYvO+mPPU2HjmxMlHKftWwa2H++5edqim0YivbW421iFboqBhmmjy8fl7lTqUK8ItS
	ZjfkKh9iIMLVt2m9D/J9KqBxFvuG3YVD3w1TtJjaQUDme+8wSUNscavrwB6+06bwX/cLtavQ/YP
	Q=
X-Received: by 2002:a05:6214:4589:b0:6fa:c81a:6229 with SMTP id 6a1803df08f44-6fb477a4fd7mr146959956d6.43.1750089200297;
        Mon, 16 Jun 2025 08:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9lFS4BlqFJWe80LkGYOUJy1z8hb3H4PDMo7stBR5xzLLNxsbI4MtjzfYuC4UMNrju/BVvSw==
X-Received: by 2002:a05:6214:4589:b0:6fa:c81a:6229 with SMTP id 6a1803df08f44-6fb477a4fd7mr146959496d6.43.1750089199802;
        Mon, 16 Jun 2025 08:53:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fcea3sm1587702e87.254.2025.06.16.08.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:53:18 -0700 (PDT)
Message-ID: <8af6ce19-7aa3-4fc7-a963-d8ab0cd22b02@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 18:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] interconnect: qcom: icc-rpmh: use NULL-terminated
 arrays and drop static IDs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
 <786e3337-4c14-4281-932e-6a93aac53cf8@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <786e3337-4c14-4281-932e-6a93aac53cf8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMyBTYWx0ZWRfX9JQpYKQZIz8p
 kcvFauUwt+dcHUA/6Faa45OK7cbXePbJ4AFmVhPFNUJmJ0OVWpemTzN1tAOPSbScBzdY5RAQeXI
 2WPEN1/nAaDwpxT5xkExAsSag24SjldX8BH8o6DEAhc6ZUrGm+iCB5VgwRBHw6ePNwOpbvBc4KE
 UahtBNrZ+bOeHwJ2FOc1uHyxdp5SMz7BK5oYKrLY+wv/lznaCh19AuO1lPu9oPDuEv9S61dQTke
 hx6C9FwNrb37lQKEkaoZZa0TpfvUteU7iuxD+dkgPKkGtLQYgISeOB85XOJzv/KSil5cOH/N7c4
 AkI96ckC6uFesGHbF2ikCQsRzo9kPEvlADR7nwdUNGtl05ChhupEJyKFTDglL8c2qlOrQO+bRPy
 piTw2KUBoJPT5HcCGNv3dbFx8vUo7nn0PUxdXGrgrMA4mNo2uQW4S9FPPJd67J4+OPZCUcL8
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68503df1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_0zWR6m1PiBrtj89O7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Vt4F5loyyFO27WuRhTaDs6z33ak5JlcP
X-Proofpoint-ORIG-GUID: Vt4F5loyyFO27WuRhTaDs6z33ak5JlcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=851 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160103

On 16/06/2025 18:51, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 16/06/2025 02:28, Dmitry Baryshkov wrote:
>> Qualcomm interconnect code has been using .num_foo fields together with
>> the arrays embedded in the structure, which results in hard-to-notice
>> mistakes if .num_foo gets omitted or incorrect.
>>
>> Rework RPMh interconnect code to use NULL-terminated arrays for the
>> dynamic IDs case (as now all the arrays contain only pointers) and,
>> while we are at it, rework all the drivers to use dynamic IDs and drop
>> static IDs code.
>>
>> This series touches only RPMh interconnect drivers. Corresponding series
>> for RPM drivers will follow up shortly.
> 
> Can you specify on which base thie patchset applies ?
> 
> I tried v6.15, v6.16-rc1, v6.16-rc2, next-20250613 & next-20250616 and 
> they all fail to
> apply on patch 5.

I'm sorry, I forgot to mention 
https://lore.kernel.org/linux-arm-msm/20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com/ 


> 
> Thanks,
> Neil
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Dmitry Baryshkov (28):
>>        interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
>>        interconnect: qcom: sc8180x: specify num_nodes
>>        interconnect: qcom: rpmh: make nodes a NULL_terminated array
>>        interconnect: qcom: rpmh: make link_nodes a NULL_terminated array
>>        interconnect: qcom: sc7280: convert to dynamic IDs
>>        interconnect: qcom: sc8180x: convert to dynamic IDs
>>        interconnect: qcom: sc8280xp: convert to dynamic IDs
>>        interconnect: qcom: sdm845: convert to dynamic IDs
>>        interconnect: qcom: sm8250: convert to dynamic IDs
>>        interconnect: qcom: x1e80100: convert to dynamic IDs
>>        interconnect: qcom: qcs615: convert to dynamic IDs
>>        interconnect: qcom: qcs8300: convert to dynamic IDs
>>        interconnect: qcom: qdu1000: convert to dynamic IDs
>>        interconnect: qcom: sar2130p: convert to dynamic IDs
>>        interconnect: qcom: sc7180: convert to dynamic IDs
>>        interconnect: qcom: sdm670: convert to dynamic IDs
>>        interconnect: qcom: sdx55: convert to dynamic IDs
>>        interconnect: qcom: sdx65: convert to dynamic IDs
>>        interconnect: qcom: sdx75: convert to dynamic IDs
>>        interconnect: qcom: sm6350: convert to dynamic IDs
>>        interconnect: qcom: sm7150: convert to dynamic IDs
>>        interconnect: qcom: sm8150: convert to dynamic IDs
>>        interconnect: qcom: sm8350: convert to dynamic IDs
>>        interconnect: qcom: sm8450: convert to dynamic IDs
>>        interconnect: qcom: sm8550: convert to dynamic IDs
>>        interconnect: qcom: sm8650: convert to dynamic IDs
>>        interconnect: qcom: sm8750: convert to dynamic IDs
>>        interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS
>>
>>   drivers/interconnect/qcom/bcm-voter.c |    4 +-
>>   drivers/interconnect/qcom/icc-rpmh.c  |   20 +-
>>   drivers/interconnect/qcom/icc-rpmh.h  |   13 +-
>>   drivers/interconnect/qcom/qcs615.c    |  713 ++++++++-----------
>>   drivers/interconnect/qcom/qcs615.h    |  128 ----
>>   drivers/interconnect/qcom/qcs8300.c   |  911 +++++++++++-------------
>>   drivers/interconnect/qcom/qcs8300.h   |  177 -----
>>   drivers/interconnect/qcom/qdu1000.c   |  470 ++++++------
>>   drivers/interconnect/qcom/qdu1000.h   |   95 ---
>>   drivers/interconnect/qcom/sa8775p.c   |  493 ++++++-------
>>   drivers/interconnect/qcom/sar2130p.c  |  795 ++++++++-------------
>>   drivers/interconnect/qcom/sc7180.c    |  892 +++++++++++------------
>>   drivers/interconnect/qcom/sc7180.h    |  149 ----
>>   drivers/interconnect/qcom/sc7280.c    |  840 ++++++++++------------
>>   drivers/interconnect/qcom/sc7280.h    |  154 ----
>>   drivers/interconnect/qcom/sc8180x.c   | 1013 +++++++++++++-------------
>>   drivers/interconnect/qcom/sc8180x.h   |  179 -----
>>   drivers/interconnect/qcom/sc8280xp.c  | 1257 +++++++++++++++ 
>> +-----------------
>>   drivers/interconnect/qcom/sc8280xp.h  |  209 ------
>>   drivers/interconnect/qcom/sdm670.c    |  712 +++++++++----------
>>   drivers/interconnect/qcom/sdm670.h    |  128 ----
>>   drivers/interconnect/qcom/sdm845.c    |  986 ++++++++++++--------------
>>   drivers/interconnect/qcom/sdm845.h    |  140 ----
>>   drivers/interconnect/qcom/sdx55.c     |  611 ++++++++--------
>>   drivers/interconnect/qcom/sdx55.h     |   70 --
>>   drivers/interconnect/qcom/sdx65.c     |  577 +++++++--------
>>   drivers/interconnect/qcom/sdx65.h     |   65 --
>>   drivers/interconnect/qcom/sdx75.c     |  498 ++++++-------
>>   drivers/interconnect/qcom/sdx75.h     |   97 ---
>>   drivers/interconnect/qcom/sm6350.c    |  838 +++++++++++-----------
>>   drivers/interconnect/qcom/sm6350.h    |  139 ----
>>   drivers/interconnect/qcom/sm7150.c    |  860 +++++++++++-----------
>>   drivers/interconnect/qcom/sm7150.h    |  140 ----
>>   drivers/interconnect/qcom/sm8150.c    |  930 ++++++++++++------------
>>   drivers/interconnect/qcom/sm8150.h    |  152 ----
>>   drivers/interconnect/qcom/sm8250.c    |  977 ++++++++++++-------------
>>   drivers/interconnect/qcom/sm8250.h    |  168 -----
>>   drivers/interconnect/qcom/sm8350.c    |  901 ++++++++++++-----------
>>   drivers/interconnect/qcom/sm8350.h    |  158 -----
>>   drivers/interconnect/qcom/sm8450.c    |  823 ++++++++++-----------
>>   drivers/interconnect/qcom/sm8450.h    |  169 -----
>>   drivers/interconnect/qcom/sm8550.c    |  683 ++++++++----------
>>   drivers/interconnect/qcom/sm8550.h    |  138 ----
>>   drivers/interconnect/qcom/sm8650.c    |  713 ++++++++-----------
>>   drivers/interconnect/qcom/sm8650.h    |  144 ----
>>   drivers/interconnect/qcom/sm8750.c    |  779 ++++++++------------
>>   drivers/interconnect/qcom/x1e80100.c  |  819 ++++++++++-----------
>>   drivers/interconnect/qcom/x1e80100.h  |  192 -----
>>   48 files changed, 8655 insertions(+), 13464 deletions(-)
>> ---
>> base-commit: 410f15dcfe222c06f0d6379adec630061e88dc72
>> change-id: 20250613-rework-icc-0d3b7276a798
>>
>> Best regards,
> 


-- 
With best wishes
Dmitry

