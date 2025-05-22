Return-Path: <linux-arm-msm+bounces-59023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB615AC0877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 11:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E304E5FEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A740254873;
	Thu, 22 May 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FkxMbu74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB131E0DE3;
	Thu, 22 May 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905647; cv=none; b=VFYBl6oROW5+Fd5mi0QufdodMs6oYCDtUYj/pCAyW/vdynRn052oK4GUFI44qQu/TbuaHXHvHm0wCHbXHVzw/JLcKrzHvFuDc6PLm3n0ldyYvT+H6kAIizjYZlgB9JviVwD+WwWDsQo5fxxOmE97BSHGVrsawsTlG6/XaaELFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905647; c=relaxed/simple;
	bh=IypJbHtPtGnr60GnDnY/4E33paJD/tPKLrN5MDKX9VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GWwmiwujgvmXqoGxn5kfdSsFV7nL66+NPtiuWYF7zJk7ZTkOXeIVbqd0RukESPZ3uPXe8qHTeqK30HwsvppLXET8GeCLCdGlqUzWQzySphIcxfi/wOyU3ZP5Bu3uIfbOQoOhLveHsBgJJlZEndicUGC1jxG+yedXuU7e8HlrXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FkxMbu74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7IPxu013417;
	Thu, 22 May 2025 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TWNeFD3RtvStATwZPx3RrPcEDbFBkfg15OgYn7S8Pk=; b=FkxMbu74hjSwIPgf
	ZqthEca5AQJXLAbU5yiy8FUD8o/1gEBGIkT0D9HSmMwraeF8Tgh552V582+uhzcE
	jHWK1hGaBhOcAZcBrKNHME7r08lWEui6Qui+KxMi0FG67T4EIDA/LnZmCu2byGVk
	0cIrpTMgSijMTTIx8uncJ3ZoQjxTnkp4aytyebpPHw20sbyXOapCB/OOUdlhgIwp
	ESKU1cyrI7dORobI3tc0TvvCL5UHU8lw2Wz7aIjhXpG6DuqYzSh3yR7v8snagw5c
	BaIjJHW91ud6P9gVEOP98mv85yAdlqbIFGRBXmxqlI1XnfsCiGAGzNUzn8LQIcl6
	WpclaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5dwdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:20:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M9KPLc009388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:20:25 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 02:20:20 -0700
Message-ID: <6d3fabc6-9701-443d-a08d-71e6c69e4ed0@quicinc.com>
Date: Thu, 22 May 2025 14:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-8-quic_nitirawa@quicinc.com>
 <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
 <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>
 <qrope222shpeqvhe2dnh4p4jmznuu7tr3jh2zujwbbd3khg4yo@wm2epj5ydefc>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <qrope222shpeqvhe2dnh4p4jmznuu7tr3jh2zujwbbd3khg4yo@wm2epj5ydefc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5MyBTYWx0ZWRfX3aBf8rINn04w
 W/+LE+z96YZ18oSRyXEO5hgIfX7y0gmBovLSkMj5EDSergAYwTy0fpVzKlHZSkQG0A9c/woCunZ
 EtJe2f7suAvSA49inX1riXf/kKmCe3AgkxTZhUMltK/38vudSYGxGjbCKFVPZKQ0DoHPmdoMiSC
 OP+ccuuSuq7A2rQXJegpBgMqIXHy8I4K1VjBkYIm1FtXAdbqRLyUfIs9JKMUQv5s9H9/o1Zhe37
 bkXeaPrAl0hRaz73ushZC/sNmXB8lOt6BkTVH+Dy3ogaU/bVXvNUVZ1DOY2e0jE0oHsYDgCvjGV
 JWWN0DHHxXtfbglQxH05mc+FWHv38PaB0abB5CrAw3WOFqsCENJgpJv/W7dwzkWRz8Nyg4ov6A9
 OZ0IZ9YZZpFj7nDC7OPA9d5L9sEEfDpmgatB+emGhckIEmp4A5SpXVNkXK5dwakhqedLBmgm
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682eec59 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tevBJ2omWQ-VxGc_UgsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9EMLqy3UAAPLFhtUPvafhHNHjRooUPkB
X-Proofpoint-ORIG-GUID: 9EMLqy3UAAPLFhtUPvafhHNHjRooUPkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220093



On 5/22/2025 2:23 PM, Manivannan Sadhasivam wrote:
> On Thu, May 22, 2025 at 03:49:12AM +0530, Nitin Rawat wrote:
>>
>>
>> On 5/21/2025 7:19 PM, Manivannan Sadhasivam wrote:
>>> On Thu, May 15, 2025 at 09:57:18PM +0530, Nitin Rawat wrote:
>>>> qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
>>>> Remove it to simplify the ufs phy driver.
>>>>
>>>
>>> Okay, so you are doing it now...
>>
>> Yes
>>
>>>
>>>> Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
>>>> into qmp_ufs_power_off function to avoid unnecessary function call.
>>>>
>>>
>>> Why are you dropping the reset_assert()?
>>
>> This was not aligning to Phy programming guide .
>>
> 
> You should mention it in the description.

Sure, will update the commit text.

> 
>>
>>>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
>>>>    1 file changed, 5 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> index a5974a1fb5bb..fca47e5e8bf0 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> @@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>>>    		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>>>    }
>>>> -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>> -{
>>>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> -
>>>> -	reset_control_assert(qmp->ufs_reset);
>>>> -
>>>> -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>>>> -
>>>> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>> -
>>>> -	return 0;
>>>> -}
>>>> -
>>>>    static int qmp_ufs_power_on(struct phy *phy)
>>>>    {
>>>>    	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> @@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
>>>>    	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>>>>    			SW_PWRDN);
>>>> -	qmp_ufs_com_exit(qmp);
>>>> +	/* Turn off all the phy clocks */
>>>
>>> You should drop this and below comment. They add no value.
>>
>> Comments are actually provided for each operation within qmp_ufs_power_off
>> which actually facilitate understanding of all actions performed by the
>> function which may not be fully clear by code. Hence
>> I thought to keep the comments. But If you insist i'll remove.
>>
> 
> For complex code, comment should be added indeed. But for
> clk_bulk_disable_unprepare() and regulator_bulk_disable(), NO. It is obvious
> that they turn off clock and regulators.

ok sure, will remove it.

> 
> - Mani
> 


