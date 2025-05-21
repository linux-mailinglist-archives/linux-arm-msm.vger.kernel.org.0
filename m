Return-Path: <linux-arm-msm+bounces-58839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B51ABECBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E363A5731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E523372E;
	Wed, 21 May 2025 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aC9SZxwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D722B8B5;
	Wed, 21 May 2025 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811189; cv=none; b=dPZQPO0m3Uh6vWY8cP83oHlLNYDv6U7qqdjtIFKjRQ/fKY02vheTPWdbjIOlWn25AvS0NZutzTn8UKVAvCmNor+s79VgkWyEE5GskP6mxfZ9p/ur/7A2VykanNRD8k1ZUobtykIYO8JHykudMe5ayjDvnTW/b2fl2H9jh3o8GWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811189; c=relaxed/simple;
	bh=x84u9qckH89jq1nabqOHuAQm5M4dSA9/eZu8we7XL1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ssHE6vkJrrreq/JPQN8vjr3ENsMAbWpdvljSAKFrkxKVmfMH+9kbFEhlXQK1FnYBErHRw4728o23BuclS1ilISu4KwV/t8Wu3J9lknqTn72pv5705pGyoMDLbXF7uqdE8qidEkpu5K1OrTQi2i3XQFRCjpJ90o2/hhlUYTGI8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aC9SZxwm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6Tc2v004354;
	Wed, 21 May 2025 07:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQPHWZwd0L1ohEAFE8//z9F5diCwvbFjg15swR0eETE=; b=aC9SZxwmKqib79M+
	Ma/pU0pvCtAK0RGb+sTz7fXYUZH6XOjR9Z4rStqqPpBq7f7Vn/8hugT3fq/87X0Q
	y+4t3rx97FBLg2270OHUK5JszfyddzBolYqdAP0bE/cnjrbsNnStnG3lKFLx8ZeV
	d2HC3lwsQ9kVdtwpxjpPDFJi0OIZhq+c54HCmb5oQNvpfv9U14SHjlbCI0YkXr7E
	Paklt5+1RHbyWG0++GUY0zVeVnlTw751lX+7mQV5rGW0HktsNct7/yG7jdoNn67E
	xWjzDOhagIBDhtQuACxnXdfa2YjXKZ3WChRd42sn5AJJ0H0EMU5y6s4mvjhGx5Xu
	O32jgA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6su31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:06:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L76NjD014676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:06:23 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 00:06:16 -0700
Message-ID: <6be65186-5af9-4a95-93db-41996310b715@quicinc.com>
Date: Wed, 21 May 2025 12:36:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <CAPDyKFrYkKFJ=+4t4ad=a4GJUCBVO7FuaRqdxSTUWtHOWgUA_w@mail.gmail.com>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <CAPDyKFrYkKFJ=+4t4ad=a4GJUCBVO7FuaRqdxSTUWtHOWgUA_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2yeWrEZCH9pEXSANZfN6AeunNkEfPVPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2OCBTYWx0ZWRfX0U5OfGVXTXUC
 VK3Yc01faWHYYT5X6T8If7Xd5V1M9fNZhwvZmmvhEsFW/nIY6u2PZjgHySFTuw3u31S3UUi4ChC
 PV06I1iQ/MgsQwuIlBhdsGolXYbMN2YstgEufdBbji03uXmS5wQ6sIIeRfiHogZfZ/c4Urf5yT7
 pbrMUJlTO0YL24m5gN/XDq4j8thCX0oCfZnQNLYzcImHDLzbYxkc+iPtpAHGjwHQucPQAUS91uD
 sSQ3df/xdDEJDSL6VbyxwhxS3PCtpJyCLWo+WufhSU4opVo0kPKYD7bIZASDg1hxFIcMLBOqbEY
 /jxuRhdo9t+hrOYG28eEfnKlpMB6Tx6/7eM60dlXPL0IFR58H+3iF0llRmRpL57N51JywZSlUA5
 h732E7dVDNNrng+oUSLbtIU2HnAasriCLhPz+PQ7KZ2heTXgHAFRfooQ0dPavCWfiqAv6KKS
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682d7b70 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=FhJCr26c34s6W4MfTmIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2yeWrEZCH9pEXSANZfN6AeunNkEfPVPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210068



On 11/15/2024 4:28 PM, Ulf Hansson wrote:
> On Mon, 4 Nov 2024 at 07:07, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>>
>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>> This enables runtime PM for eMMC/SD card.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> 
> In general I think using MMC_CAP_AGGRESSIVE_PM needs to be carefully
> selected. I am not saying it's a bad idea to use it, but the commit
> message above kind of indicates that this has only been enabled to
> make sure we avoid wasting energy at any cost. Maybe I am wrong?
> 
> Today the default autosuspend timeout is set to 3000 ms, which means
> that beyond this idle-period the card internally will no longer be
> able to manage "garbage collect". For a poorly behaving SD card, for
> example, that could hurt future read/writes. Or maybe that isn't such
> a big problem after all?
> 
> Also note that userspace via sysfs is able to change the autosuspend
> timeout and even disable runtime PM for the card, if that is needed.
> 
> Kind regards
> Uffe
>

Thanks for your valuable comment.
First of all sorry Ulf for the late reply as I was on break and came 
back now.
Yes you are right this has been enabled to make sure we avoid wasting 
power at any cost.
Moreover for a poorly behaving SD card we can't penalize the power 
consumption of all the SOC's so thats we won't to enable this flag.

>> ---
>>   drivers/mmc/host/sdhci-msm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e00208535bd1..6657f7db1b8e 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>                  goto clk_disable;
>>          }
>>
>> +       msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>>          msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>>
>>          /* Set the timeout value to max possible */
>> --
>> 2.17.1
>>

