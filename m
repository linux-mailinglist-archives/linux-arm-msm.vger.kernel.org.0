Return-Path: <linux-arm-msm+bounces-55114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64682A98829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968FB167CF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C244426A081;
	Wed, 23 Apr 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gbgs5Pmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DBE215F48
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406572; cv=none; b=gsPnOpzHPDM9EhH6Rcxth+TzV/80lkhpsPcZ3GT3KzjnFJJ7xCP+HCnY4mXvr0Cq+AK7bQoJQR9IAP+T+3PeNTPUhy7ESeKC9JJ6YbA4Ao8TD9xaf00JJSrAE1hMx7cqfWPy7tfANtTgmNE9E81cVo8Yg/ZHoOiiEipfjWalaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406572; c=relaxed/simple;
	bh=yYkyb+EUkaB7iruBXQArN8V5Gx5hk+6OjIcFf6LQfTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4bz46+KtYFn3j8YJsHSY360c9Rn7ebj9x6bv7tJr1RBSdWFW//7DU5N6MkxhHXK1B2YpENEdzssPahlumeCSCNWccNpKK+5ZDUbsrXCL6qX8c6ZPjIYIbvcA2INgNNUsTma54qcX4apLv0buSaAkcQsK+lh2HzN/5RCOrN5O20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gbgs5Pmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB3hNr013403
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd3YHcBC3TYtyVK0LNqsKsNH4Ca1SUDlk/VqAbaBYrI=; b=Gbgs5PmbS8Rwe2pl
	Dq6Am/mKNhrlPfQGhW8NJ20qN/u2MfsTbMt9JKfTsZsriPgCrD1ZJH6fyBdkpHSu
	jdoV1xiMyokzvwCwhb84EVPK+qC/ms8DuOjyZ2u4k5Ie//6MviheNXJIR5BE6Hlx
	XZznHFV/OYdCeG/heni3kCKt45iziHEyIsWRyKiFtmUxqlC6L7KT26gWzDXWwYyD
	SKbu5nLgMhry0zDGxU24KWICXm+VTEokewsAax3Pp0KBl8UwFiC/c6fvmx1zyq0u
	DAP9S1arRjzHfhq+Rhf64cyydOfzx1PvSvdLg514Bdlkkw8JkIxoax/0SwlUhYOP
	pH6qqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39vn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:09:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so120942585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 04:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406568; x=1746011368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rd3YHcBC3TYtyVK0LNqsKsNH4Ca1SUDlk/VqAbaBYrI=;
        b=sylpq7+lVymx3c5VVgQ1swpbi/mLdTA5iWZkdiKMrpHMKEPMLgCppbw9GVxfpTGLgG
         WbHKKnXcCiBQfNzbzR5rW934r9IT4Usb6nhJzy5RYe/5ddR84D8qNiJvF2AxS4zl+zJd
         6k/FzafmO9RtxwH6AIfztldCqPHyS6NWo/vhTvFgvaydvZOQPB8zIoRkeK8bQqO5a65m
         /jAX8U3OWhaOLRdeEOzoBWh7vtXjYHIic4UYQzfHGL5GDIUkasp543OEJYIe/O1NefCp
         xyUJJCz+cJFF4yeQNmd6tqBniOBfb8PMEpa+SPC6bmnAWS0nfRqThwRK2xddk6EHAV0x
         sl0g==
X-Forwarded-Encrypted: i=1; AJvYcCWivlHPYOfPvx1VkdbpCjZxjZDrrfp8sZF+UQf50h1RF1bQxNEpXvv+47fZeVODfRpC/jUpeyoYW2o48Ylb@vger.kernel.org
X-Gm-Message-State: AOJu0YwepJMx1X4zI29eKq9wP4r7BXOCtzo5kHgnKaSUvREBkrOG2Sub
	BH53LRbA3e3FWpjMQS+zOEVzt6KYvg0puV0kkV3UbzQtR/JeF1c7qnV2xxADusxU916LeH7+8KO
	B5GiXEHx5SMAU4zpuPGwZvEzmFBjFO8GZ8AknOv/9S3Y17DasFk5tQ5mKbBoqzqdr
X-Gm-Gg: ASbGncvLoRWNcyHZh3p+yEujydOT+9831NP2eJ0wLx0Ve3g7PIO82oxGUw52gM5ljHP
	4b42tbAdIkdQTo7dsLpZyTAP0cmOVbaPPXP75mxDnaYOiUSpARBiYWaJ3s25NXI+8Wl/xxYqYnn
	YunkQRnrfO/KR69Na2FiL82No6gL3vrzV+tWxQFqcntOA2+OscR8kZIdtVCeJ0+5PigmJ06P2O2
	pUPDzFhkCJTrx4wbyKscUD2BsyYprwTjn4cm1N/OqZGm9WhK9Wx82/3YwSB9mTCS6M59m9KNtjB
	sakaxgbZszvgeCVmoqtWVZWxOLkRFBlxZ73uOm3VFZytF5aebbsmzFsaNHz3ovEbNxY=
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr169136385a.2.1745406568548;
        Wed, 23 Apr 2025 04:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiZEnn54IflaB3i4pqXC7ZrnER6o9bw/syciNUcOHoqO5HVrimc4sTg7qhgrFutnZVRtO8kA==
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr169134385a.2.1745406568049;
        Wed, 23 Apr 2025 04:09:28 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm784078066b.166.2025.04.23.04.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:09:27 -0700 (PDT)
Message-ID: <b7027077-e9a3-462b-92a8-684a42d23604@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:09:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com>
 <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
 <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
 <CAO9ioeUDzYLMvqmsOQ-VfgLQLavHqn=QVYxyHzetjSfmhjKFjw@mail.gmail.com>
 <1a623099-40bb-4884-8d93-132138a4150b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1a623099-40bb-4884-8d93-132138a4150b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3NiBTYWx0ZWRfX4milK/m9NFOj +0Bv6VZzz8N7ikmsvrEQerCNf7XpGMUnOqjUckNpBmFJ/iykJz2+Ti5dzul+4c/oGufSeBmtZWV p+HbZMlLSKVJO700AB8mZpKqLZbNZHbaLNyQK+NA4lOVCJCZFIByz013D/MuFFWLoqvB9/cY3Xj
 WdM7rofmEnzKJWfh964bjayQLe/vJQ6Eo+a0fLfOXAj7fG6ccwRP5RjKuWEPaE5Q1iUv9yKWqFF bBCuLQz+HPi8k3I/bGrzQSxSYAtgir/BlFndGuOFMstjqnBw+FchT8COEd4CcVmFw7E/tCkPtse Pk+AXZbuGpOSAbKrzKatVLWlPteLdFrMCjwiohWjjkeNxppyhgDQrS0vK8JCFv41YoJiCu2WUWl
 Zs8aZXuE9SKkVVA5gDR2cnUQyWC49Ht5tWfOTMRg6/GZ3P/9iVIrY3QHzyR3CSlmjfadp/Cm
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808ca6a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iCsAco6G6QYzM88_SOEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 18Uwbr9GLamSeuiPZE_20lhkt8HtKy_i
X-Proofpoint-GUID: 18Uwbr9GLamSeuiPZE_20lhkt8HtKy_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230076

On 4/16/25 2:26 PM, Nitin Rawat wrote:
> 
> 
> On 4/16/2025 5:43 PM, Dmitry Baryshkov wrote:
>> On Wed, 16 Apr 2025 at 12:08, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
>>>> On 14/04/2025 23:34, Nitin Rawat wrote:
>>>>>
>>>>>
>>>>> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>>>>>> Refactor the UFS PHY reset handling to parse the reset logic only
>>>>>>>>> once
>>>>>>>>> during probe, instead of every resume.
>>>>>>>>>
>>>>>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>>>>>
>>>>>>>> How did you solve the circular dependency issue being noted below?
>>>>>>>
>>>>>>> Hi Dmitry,
>>>>>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>>>>>> about the circular dependency issue and whether if it still exists.
>>>>>>
>>>>>> It surely does. The reset controller is registered in the beginning of
>>>>>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>>>>>> creates a very small window for PHY driver to probe.
>>>>>> Which means, NAK, this patch doesn't look acceptable.
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Thanks for pointing this out. I agree that it leaves very little time
>>>>> for the PHY to probe, which may cause issues with targets where
>>>>> no_pcs_sw_reset is set to true.
>>>>>
>>>>> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750,
>>>>> and it caused bootup probe issues in some of the iterations I ran.
>>>>>
>>>>> To address this, I propose updating the patch to move the
>>>>> qmp_ufs_get_phy_reset call to phy_calibrate, just before the
>>>>> reset_control_assert call.
>>>>
>>>> Will it cause an issue if we move it to phy_init() instead of
>>>> phy_calibrate()?
>>>
>>> Hi Dmitry,
>>>
>>> Thanks for suggestion.
>>> Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on,
>>> whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS
>>> PHY reset in phy_calibrate introduces relatively more delay, providing
>>> more buffer time for the PHY driver probe, ensuring the UFS PHY reset is
>>> handled correctly the first time.
>>
>> We are requesting the PHY anyway, so the PHY driver should have probed
>> well before phy_init() call. I don't get this comment.
>>
>>>
>>> Moving the calibration to phy_init shouldn't cause any issues. However,
>>> since we currently don't have an initialization operations registered
>>> for init, we would need to add a new PHY initialization ops if we decide
>>> to move it to phy_init.
>>
>> Yes. I don't see it as a problem. Is there any kind of an issue there?
> 
> No issues. In my next patchset, I would add a new init ops registered for qcom phy and move get ufs phy reset handler to it.

I don't really like this circular dependency.

So I took a peek at the docs and IIUC, they say that the reset coming
from the UFS controller effectively does the same thing as QPHY_SW_RESET.

Moreover, the docs mention the controller-side reset should not be used
anymore (as of at least X1E & SM8550). Docs for MSM8996 (one of the
oldest platforms that this driver supports) also don't really mention a
hard dependency on it.

So we can get rid of this mess entirely, without affecting backwards
compatibility even, as this is all contained within the PHYs register
space and driver.

Konrad

