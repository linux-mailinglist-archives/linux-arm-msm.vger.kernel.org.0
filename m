Return-Path: <linux-arm-msm+bounces-55839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A096AA9E0B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 10:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC73188EAC6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 08:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A051EDA23;
	Sun, 27 Apr 2025 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hviUbNP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181633FD;
	Sun, 27 Apr 2025 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741719; cv=none; b=JHv4viWAs8GuMhSK7dMWFpcBdtK8jTd0OOvuh1cl7TxXQ8MdW203JS8epotO+881e3+3f2I8xgmZw9al6vcyVjlvWI1SfRbUvlD0HwWt1f2Flw7R8TdDxvC/21eiqWIyOW/GzLHk6xG1HEcXyRlp/M9nZdxM9Rx7wm2HcAuWGkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741719; c=relaxed/simple;
	bh=aJnF4XHEh/0J5e+6Rlsg9uDZhB8qdoyrhtfofnQolgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JbOD6N3VuX+H+8FKHQpv81IR+6HeVRthSgyUw5+PEoweKmKhdqWfEzEJlHgySZybmX9Kkq2yyPMcRh7qFaUiSx4iNml7Tx+Z7skoKJE+pPtKE+rSzQJ5v4l/7ndpg4vUQeGDtgHFjD+SxjZTLjBoELVym9OzSmzTqTF4XkpxU5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hviUbNP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QMQuLn028040;
	Sun, 27 Apr 2025 08:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lbqq24M/Ux40LvkCpduFkVyXMFtWO1BJAG+CznhRMrg=; b=hviUbNP1WkT4L6Cl
	TeMFp/y8yFaBQ0iEtWxgbXvoD97b1BgD4eD7zPifVnSMuamnC0GMBanw3WBhjouQ
	NwivsIqRujQdkSBBs/MiCIiGYK+2jElLdLAlF4qeOOWfpPKt52HhBuMy62/ajbgV
	NjFyPAab4D7jSkeWlIlMhRf+rmkQbP7T4WgMBgI1eH3S8c6tCEbltTckKOI769yy
	CDN68HaOdMouprdnOvLd7/xcUnj/xtxeQsqew2djQi2ac3od6p6dksOm7cKS6thZ
	RQSTxsAoBZ1GTMjUw318BjFSSvS4DRGBd7tDxUt3oIhJR75fTD2EPXEFsH0Zsf7q
	u/ZQ8A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmu73g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 08:14:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R8EinN022865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 08:14:44 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 01:14:40 -0700
Message-ID: <df287609-a095-4234-b23b-d335b474a130@quicinc.com>
Date: Sun, 27 Apr 2025 16:14:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
To: Luca Weiss <luca.weiss@fairphone.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lFvji37wv4xtfm_F5Wf2kgIrqNMKD_iJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA2NSBTYWx0ZWRfXyeSi3DIebcyu wI9VJLPSF79+Ik+T4tOJP8qSGaR7jZQPnmTXuHodSQIAHCOKCFOuPCTzZJIc/K6KQAtXAHO6SW7 vifv4qg+NKzdXKOBqgNJ8V6hceifslXXFsXVHIaxgsPzREtMymnF3bJS9YNiexW6/XcujEoN0qn
 59ZU2uJRDj5PsjgH8NpoJWwQmXFqHFileyv78R9krpIj3omzDm+e12i1E3+/SnpiUUthH78UcNM QMnOGBEJ/CfGQpI8yJe0CZZKyitoKcSe+p5JdNG2Aq5EwvE2leeqi4iHe3ARGJBHW2nLdjAPh+W z06AAixhIm9bIJBNAFKvw8aJOVBuXb+mN5EWRx7kh7rDClVlbTZTSJSZ+sqQjys7W2IQkDBh0M9
 3ODkBuPorBc/1j1uQxqBuoq4AeaZvy4guhq0ILbM8jEJ6lEriubv937RmbEX6jwkeOx96bxk
X-Proofpoint-GUID: lFvji37wv4xtfm_F5Wf2kgIrqNMKD_iJ
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680de775 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=cA56n_0BHuVisEfHO2oA:9
 a=QEXdDO2ut3YA:10 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270065

Hi Luca,

Thanks for your report.
Really,  6350 is a special platform that the UFS_PHY_AXI_CLK doesn't
match to the UFS_PHY_UNIPRO_CORE_CLK. We already found out the root
cause and discussing the fix. We will submit change to fix this corner
case.

BRs
Ziqi

On 4/26/2025 3:48 AM, Luca Weiss wrote:
> Hi Ziqi,
> 
> On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
>> plans. However, the gear speed is only toggled between min and max during
>> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can put
>> the UFS link at the appropraite gear speeds accordingly.
> 
> I believe this series is causing issues on SM6350:
> 
> [    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 200000000
> [    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not supported
> [    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error
> 
> That's with this patch, I actually haven't tried without on v6.15-rc3
> https://lore.kernel.org/all/20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com/
> 
> I believe the issue appears because core clk and unipro clk rates don't
> match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
> valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
> specified to 150 MHz in the opp table.
> 
> Regards
> Luca
> 
>>
>> This series has been tested on below platforms -
>> sm8550 mtp + UFS3.1
>> SM8650 MTP + UFS3.1
>> SM8750 MTP + UFS4.0


