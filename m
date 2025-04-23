Return-Path: <linux-arm-msm+bounces-55145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8BA98BDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AFC91B63AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67301A9B58;
	Wed, 23 Apr 2025 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7yFIYaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A11A76DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416325; cv=none; b=lZoSuUeZe3ZdoFGFWTifK7Vn9d2rmqHcJiZeBxJ4TlcRWk771BKeJWouhWTW/L2fiYRVL1zK1caI8PZYLm/eAlXcAiHXGwP1tzD5OXO1Qz3gXck2H4ZkYtLWOGyfbhlrdhEGZi917TsaUaknQ3uWfg7ZTDc5gtSWrbql99MYZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416325; c=relaxed/simple;
	bh=0bAnqI40qy76MCtFlvAvA88DQRF63SAr4EXXQFTXYnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQiHBhOE+Be9lSZYzTmNmKTucBt+Ns+n0lDi4HyKcvlyzIXYgoZgIX+z5xmJa02FzKx2ZeSQyS9qt7SUqhg4HWg09OYFEWcwfnJMVN35yVOgkL9M0n6ePhmNRXI/7BXIaF1fBRYcUltKagbQY+WlwBbbXlDUFc2TBaUtdWo/K6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7yFIYaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAIREL016863
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkJf7kOWyPXE/bAYrd0wNfurykT7yQdN5XAbkQzQbAM=; b=I7yFIYaRltaS8kba
	rOOsTY8k9by6Ol4ONAO4ulcraS94HwCoOHibcZi+u2y1+RgDu15tNcWY9qWPOtgL
	mmftD44RzR7+KquS39u6NqtItkeEY8Fo8UGRujXjYkvlIgjUW3FkF3cmVJMNv5d5
	6uoiGH4/gE4IdU1ejhBdvTTLwT2gg8a1sQ16uq2D4Mbb60UOweGfzrltX5y0ODyI
	vH71BzVnj21YzCaawcVXm3P3J9xuUZIY9LcPEizXnqaBJbi/QJgBUdyYRGevq03S
	HHTIqmft6gzee6h/CTtOUToosGmZV41CPtPLykb3nSjf70r6HMAkaH7YJy/cgbKJ
	irhe1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh02af2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:52:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c579d37eeeso963634485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416322; x=1746021122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkJf7kOWyPXE/bAYrd0wNfurykT7yQdN5XAbkQzQbAM=;
        b=N0c8Y6oXAvFout4oM64d7UPY2C9ZInyQn3UqEFDE/dDVu/diha5MiNBh6bAMhh5sRT
         iugEkMs1Vav65F3DCG60XOeVO2W3QaidCmLPdhBHvXJX9WniFCxsDfD13WymCOK3xmuK
         W9yOF6udHD35WLLWO4cP3+JcbARAoOAiaupVubKyYiiePsUm9JIFRmX1900pc/ari2Tb
         9cRunjC9cGsGxl1KoSHH/MkAl1g2zSmpDAdmX4d1mYs8SewtLrs4eDND0HqT2ejVS283
         E+dqfGiya4AMX6Ra33kD6lTuU5XPh5eYr6oV8f9GHxiS+LHtCme9jNYPoiJsmS8EI/Nr
         KYVA==
X-Forwarded-Encrypted: i=1; AJvYcCWjhvhXlSsswiCkl3lkEETcs74FfJWu2p5JH73eCyGBNMJYYJtXqvgJich4fzhWm+eXnq6og8+OkMidvrjv@vger.kernel.org
X-Gm-Message-State: AOJu0YxzgkVS0fe/TPzTbYouzHACeLcA+lFeoR4J0oZNs8LiMIZyPPUf
	fqifq88TuJKQzEXaT9MN08koFu4ZXDDtbQV14sBm2L4AVzVNB4p2Q28t+3IxQeujk9wO00QsPdt
	e3c2ix0/rKcH5xMeQteQjDWeYvg+wl6/QMICut6tjjGRfC8u1ZYSPPmOr56tl+6CK
X-Gm-Gg: ASbGncueV+C/yeuHu8KO0hJ3VuoMyAfOWRTgjZ0eEvLs2syYLff5++de2R/5yYCFZvY
	NIQqoEHJeMx+BkdXmjqqMmm9pOi4fAXHuy/8hWTM6RIVYDbPDY9yHNURASRdKbOgEGSzJyeafOx
	1NGQ1dXcW+H4t7VCOPBtslx6X5lExBej/JYoEmTO4zZ2EUJ1n4lj28vKCL2oKUaZLnnjWQ3Xfzc
	0TGnzxMFVf/de8U4NMKsNTJb9duq7ROw8Ce4SCG59UmNj5frBLQB97tWuhRguLIlvAO+33xB1Ff
	ENDo/8pMfgbJhCRKGc3nt7KepnaWivucM8dQE3IUwtN9RR8zn39ENC/0cvW+VvOWmTFaLtLkyMy
	DFu2h9+gm4jvjBJpWmtBwtErcKnRKIxL7ESPQsMtXP4szURwvs+OqcQ5RNAO0gN0x
X-Received: by 2002:a05:620a:248d:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c927f6b2b9mr3017557885a.12.1745416322122;
        Wed, 23 Apr 2025 06:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrD8GKWDiajlXtRlhCqQokXaChDX0L7FWqOCEuiK4S46NfWfbpwHzSXWRpOSxjfqEHecTieg==
X-Received: by 2002:a05:620a:248d:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c927f6b2b9mr3017555185a.12.1745416321797;
        Wed, 23 Apr 2025 06:52:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ce:6a0b:adf3:3f29:4dd7:6598? (2001-14bb-ce-6a0b-adf3-3f29-4dd7-6598.rev.dnainternet.fi. [2001:14bb:ce:6a0b:adf3:3f29:4dd7:6598])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a8416sm18673731fa.63.2025.04.23.06.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:52:01 -0700 (PDT)
Message-ID: <7ff824d9-5d86-4d63-a8da-5d94cc489ee6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:51:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <1adda022-b5d2-43e0-8cf1-de8e72544689@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1adda022-b5d2-43e0-8cf1-de8e72544689@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfXxd3IJync2d+a gk6AXYtkdKunYBYMmqJ3UMmMT1StEx6G1XWv0qTJagep6ffrodnZh9JLViSVSNDejnuGyw7fk9U sy2ceY4FiA85o4lbtlCV2vpRnHaaGxcjy/SHND5wrAtFz3gFyIltMFxwYuakGH/nqRs36r9T2na
 nG9wmj2iHm+Rg5F/c3BOF9ReJRi2ZhIndYUkd5+iQ75EJKzPl7BMU/cvd3kzpEIRaeRX5akgjqQ MtQawnIHSuLcvs3vbOEPOlCdLFA3wW1aICKX43eelhTi6/P+3crzpnaFo/VCccM5PdvHEaJ66Y+ YrsRhmrdSN6DMINz2CYmL7/y6T1jf1jI5o5mTaGNqPnk3e+CuV2cD1T717W9lw2nvxvI6fC8No+
 e5IF/plvHHSTi9hEBZ3KbsSP8r3IRWmqOb19nV2/Yve/83aah7L05zrImzbvgY1M1OZBJ4JV
X-Proofpoint-GUID: eFcATKra1-rv46jQzr0xqbD0LnWzibEN
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808f082 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=m2W-dpWsrdQmR1pkfZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eFcATKra1-rv46jQzr0xqbD0LnWzibEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097

On 23/04/2025 16:47, Konrad Dybcio wrote:
> On 4/11/25 1:08 PM, Dmitry Baryshkov wrote:
>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>> Refactor the UFS PHY reset handling to parse the reset logic only once
>>>>> during probe, instead of every resume.
>>>>>
>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>
>>>> How did you solve the circular dependency issue being noted below?
>>>
>>> Hi Dmitry,
>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>> about the circular dependency issue and whether if it still exists.
>>
>> It surely does. The reset controller is registered in the beginning of
>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>> creates a very small window for PHY driver to probe.
>> Which means, NAK, this patch doesn't look acceptable.
> 
> devlink? EPROBE_DEFER? is this really an issue?

Yes, it is. No, devlink won't help.


-- 
With best wishes
Dmitry

