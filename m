Return-Path: <linux-arm-msm+bounces-66234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D10B0EFFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85AFA7AAFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3BC2BEFE6;
	Wed, 23 Jul 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv1I/PdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC542BD5AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267030; cv=none; b=o4otieHBZjDhrTusAkpUXW+2ycLsMWO3wOOQ1wa2WwQbtT/LuGV+aGHBL0bVYaRE9e/XCU4qsGWCT5IF1rD81mPgxVcZTbbSOvgQyBchZpmefpoDRyLTm4KxEwQy70CORdUagdcnN0J8SuRLpRgjOsn9EuKXvx8xlzWA4b9gz0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267030; c=relaxed/simple;
	bh=VZ6H2QqhGifjHQ2Cq+ZjqLjogniGh02DxOQCdfNC8IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXnTAJuE7MsgTIQZ9Yg7Au9tqZ29m1zadumxPDyjH5E5f0SRSAAhnbVqeU6pKRzElugzqX4bSgTjlaeuNnZSTuoixgVMDY72sfj//Lk16zjqUxtQTStApyNNFmKfl+kXV6iOC8EZk+OndDqFt3tXApykLs0njS1Uc6v2VHTMgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv1I/PdE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9AMOH001970
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3WPPm6RUB+edcD+yYLNUyD+huQyOSescoQcJtylh1s=; b=Zv1I/PdEDk7aA0q1
	FINhBwRDh/LayvL4SnyhTB1So+vWOL9HgMkPjtiXjvs/t2RB381UOUPA8GnQhXgr
	e/lmqLi/vYAJ/QEPYJxC+dgTdZkgumz9Bq9ngpqx1juCssJU7Ytf1lULXSppiEZm
	tQan85pPIEBaSjYz5YKB/OHnINwMaYDpE3QdhlCAEj5Sgu3K71Gq+ZMs7vAF3ECs
	TvhsNaKcnyTcS/Tcv9f6WQwuXb92QhTj79ippoeK5A97ev1SYuYo/yMyAHdXnTQH
	YTPQkwsugld8ascrp3XdK8WUMt+p3Iy7dw4L9+ehX8IN72yoxlEkwwOg0lI0grGP
	T9wC2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w5yf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2ced79f97so85570585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267026; x=1753871826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3WPPm6RUB+edcD+yYLNUyD+huQyOSescoQcJtylh1s=;
        b=JJQ1jycYKrsJaD/LBSd/3MhBShR82qFouLWLu+nf/VQWplzg4DjK3QQajO/gJNSnsr
         CwyTFhJ3EmLH8XAQb7i7HlCTg1SUKJcOSoIkLbjAvwEBNjFx6SpbLxXT/dq40NeWE4Yh
         jXBZDTWA5msSn1lACN09nLgXsU7+QnG+2utxF8rlKILpxFcnngHQd79pejxr7IBZ74qF
         F76ZYOrko9186P1cbpLpYR9IFTloIWwCpbVVYy98/UB39Jl43/TIbA3OLPGnN/uy9ep6
         tMPObnAiQBsOg4ikU1fpJiz7VOn6+ZnopB05pmrYA+9M1FJo2B7EoFGt9J2C7aJXHQhO
         I+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg+479ZLsgIzzRPkGK8qOsnyPZQ2RtzarCLX6aAWHEKMVoLtNNqUkZKnIlJer7yk0l4lBUf9ZuDqZyqJg/@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1VVPdTdgC/v/VMtvx1C+3NxNxjfNRAQ5TG0M/4SWrjpi76E0
	FOr3/fWntQt1PysAAlh3KdB6dwNJ/aFwFTlcSrgaV/Xg0GsCrYGuT+soEH7Y3qWaSUjBgdRYR9H
	k8NbQaI66VHBotchbCB+vlCwJ6IeBbbyPHR7UYkO8YbRwsuz1hYYsyneN3XYdWowQCdv7
X-Gm-Gg: ASbGncs5dAbHuRkBfJUJnHv1n2pBGqw907SSp1zy9sR2YJKem5/r8mjJb+33WulWfyz
	u0yrM0Lj1C1+4n5ZgmZ23LApo1vvf9HG16jZcWfv4cx3sNejnT/5J8w11TfEqoLbUCUFklwQ0Id
	VPRezp2BTlbAR9v5TwXN9S4xhrMNuFkRBqoycK059lOT5HoFWOROONOU2+r/06CuesDP1RBXTBX
	D93V0GqJOJbi5l0whtnooIKuIx0moDZHA41mgbJjVpS1JbugsADx6sO68vw5w+DspeT/1it4ECQ
	bVFubr2pjJLmsVYeQgUi4x0MjEkCp7mVVPzj0VKhLHZNnaylmEct36oO1U1LbnQRxq/hM2GOTYQ
	/Mv8VW+OMWsyWAbnEeA==
X-Received: by 2002:a05:620a:2609:b0:7e3:3996:f491 with SMTP id af79cd13be357-7e62a0a57c4mr134094585a.1.1753267026387;
        Wed, 23 Jul 2025 03:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf4hV1cEmi4SrXNUuipDGElpSF5X/2irJs3VnwL9DVxlwxrsZDYzctE6f2Vdwwz4dC9NujMg==
X-Received: by 2002:a05:620a:2609:b0:7e3:3996:f491 with SMTP id af79cd13be357-7e62a0a57c4mr134093185a.1.1753267025970;
        Wed, 23 Jul 2025 03:37:05 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d89cdsm1029598966b.62.2025.07.23.03.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:37:05 -0700 (PDT)
Message-ID: <2182b484-9ccc-4ebf-89f4-519646958413@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:37:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_mapa@quicinc.com, quic_narepall@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sartgarg@quicinc.com
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-4-quic_sachgupt@quicinc.com>
 <6xvsnmbnnvpmlgvmi42pt4d3ugkrxhrgrkp56szqhgh2foxe72@z4ildfxufq7j>
 <c6ca33b2-f8c5-66e7-bb3b-dd595ed040c5@quicinc.com>
 <d0af754d-8deb-041f-8e34-1c1214fccb09@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d0af754d-8deb-041f-8e34-1c1214fccb09@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6880bb53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=OTpidQhUJuL9SOIRPhwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfXwQFAz1bzz/Lq
 /K5mAByrt/PgKfEjyLHI8hg7BGpSydBEZgzxYiQ2ksYU3la/lIrk8/yM0avynKOyaOPyny9D753
 LqA28CKDEOEIo7OWY9toQPbY9Hn+n5SOyJA0dxxGh3jK8vsFA0rfNGjfPJscMUpz2+6MBun5kUm
 DWTNaeZtxEDjvwrhbzcaeS+w3SzDurc28gzV+R/s+6N2hAiQpQJ+/vHJoXauwqv7UV4O+S0QRTY
 31viMp4HrDBjWDz3Hb/Xz7aXSUCR81UO0YYbKC2ePViqZUk+IAI5MAyx6UTU/wtcYc4ZqNRG1XY
 h4xGIxCpLUrzizp56a3HMaG7jx9t8UK+98myzbggTwcV1ZQUy1NqlaQkBh1r5D1ZGkTSri+J73u
 C4su4FcrKNfEJInJWOIRPB0BMWMC2AOxM7S79hRjI8VJTbF5yFClSGy7kKdumhvLt07nJBBG
X-Proofpoint-ORIG-GUID: TQk3p-E8MC9oWQK3E0wLt_IN67egn_3-
X-Proofpoint-GUID: TQk3p-E8MC9oWQK3E0wLt_IN67egn_3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230089

On 7/23/25 12:14 PM, Ram Prakash Gupta wrote:
> 
> On 6/10/2025 5:47 PM, Ram Prakash Gupta wrote:
>> Hi Dmitry,
>>
>> As updated in [PATCH V3 2/2] of this series, I have started now to continue
>> this work. Will address your comment next.
>>
>> Thanks,
>> Ram

[...]

>>> And the pointer to dll_table is lost, lingering for the driver lifetime.
>>> Please drop the devm_ part and kfree() it once it is not used anymore.
> 
> ok, I ll allocate memory using kzalloc in function  sdhci_msm_dt_get_array
>  and kfree() after copying data in this function.

You can use __free() nowadays (see e.g. drivers/soc/qcom/mdt_loader.c :
mdt_load_split_segment), which will dispose of the memory when it goes
out of scope, limiting the need to clean it up every error path
separately

Konrad

