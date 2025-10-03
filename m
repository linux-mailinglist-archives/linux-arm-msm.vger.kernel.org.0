Return-Path: <linux-arm-msm+bounces-75945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE6BB82C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BA3E4E39E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F2F25B687;
	Fri,  3 Oct 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pvHZeJiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078EF26158C;
	Fri,  3 Oct 2025 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759525921; cv=none; b=CX8bjIsWH8lvr9WD3PGXIyljQ8qwBcy172Ea4SdspFF4ZGCO8P0dm4/NNDHvDu14XQmmzLmCmXHFpWOVjDtQ2/manYOgOP9/X1aYGTb0rfENl3bvS8lQ5/1TY033/UbVoQ3UnNHoax2IV80fzpe8G8WsOkLdWfcVni/w5pSe5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759525921; c=relaxed/simple;
	bh=EnTBkGoH3Jvr8KONUsAx0aPNp0x02Zoc+/pk/0q/4uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dE/jU+Wp9T2g2/Zax+LTzmhL1+0wUf/9NlE+1yo73Bj+MOQMmClzTVu0c3F22uoNTAvVlVxHJQnlASeyG9rCW5K0vJKqlH8GyIJVlqoOnpWiUvZ1/rwiAq+PL6iDZwlAuswtZkDaZ3pLA59bdXkSfB9njrg7ng6IocEkl+Ht7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pvHZeJiV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AuIIj006266;
	Fri, 3 Oct 2025 21:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlnlmgOOT12GpfzucYvYIMK0TqyeJkc9z5qxx9XRYY8=; b=pvHZeJiVs9273E+a
	MKB9du1YD58L3VnG+boZHwnA/z7pQ8czFVDKbBHIbxy9se3oIEIy2cgKthO2ZbtX
	VqYhGdf823e29/tFy85dsaMqWWVV4wwnAI1FkBP2Dd+9W2dnuly5EuRzP/tpfB/T
	rE5PIELLjNbpRWPMYjst+SgQ7KoLi6/a+ilZc9f1qNF6QGgjWYgbgLHsSE3mPthT
	FioKhlUEhKb9/ez/EFsN0AyHt4s2RfrXErf7Mjo4jAaRqL3sARBM0PDsHfhaxayn
	m3cPCLln/UjtcCxg757AoBYYG2uVM7d6G8xKH7REflRmg41UK27L+uQB7bgsNuYC
	OmuGOA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pduqfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Oct 2025 21:11:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 593LBcHc010764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Oct 2025 21:11:38 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 3 Oct
 2025 14:11:38 -0700
Message-ID: <4e58fa6c-ddec-a6a9-fb8b-5f4ffa12fbc3@quicinc.com>
Date: Fri, 3 Oct 2025 14:11:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>,
        "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>,
        "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
 <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
 <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3c1VoxhXOBkTC4TMBzna8V3v2NIgBFn4
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68e03c0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=bJ9VZFcO5FWJG7T8bRkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 3c1VoxhXOBkTC4TMBzna8V3v2NIgBFn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX1n6USvtA4GKA
 4gP2OSfg06dxDVx/Br7mf3Nkka4psSRegTv7qkd6boyHDQDNV8r8lWcggJZJJcXNzvPadtXZVvx
 srIE/K+KvaNBXtgN7XuLhunD+RqZo62DqUSU8SD/ltpaSZDf+tPnHXNn/qyWUI2a5x5UwUoJOYd
 SJq2tWPU+tmqghle5BTOKcMqfULYS2Dv0AwqVOsmilb/40AdLSO6bAxXE3vzlPYD37tmclBNeUe
 FO3pQU6Hk+e4a2A+nhmuArmlDq5U1vvwDplIr/jYWM7q5jgHxJlhz0f+Mri0mGVb70lnF1/Mcmm
 17d66YGlBz0gaqHzWH+x+r8rJCfPRn8jLdcY4HEMUyrt23j4BFMFM4VOtaOTXXFaLS7/6kh85lz
 OR4nwwl6T+h7bSxQzccqrivaMO/ERA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 10/2/2025 8:10 PM, Peter Wang (王信友) wrote:
> On Thu, 2025-10-02 at 11:48 -0700, Bao D. Nguyen wrote:
>>
>>
>> Hi Peter,
>>
>> The current Mediatek platform driver applies this quirk to all ufs
>> vendors which is consistent with what we would like to do in the
>> Qualcomm platform driver per the vendor's requests.
>>
>> I do see that, about 5 years ago, Mediatek merged a patch to keep the
>> device vcc always on, probably to workaround some HW issues. Since
> 
> Hi Bao,
> 
> Yes, some UFS devices may have issues when turning off VCC.
> 
>> this
>> is a very old patch and the impact of this change on a broken
>> hardware
>> is minimal, I would like weight the benefit of cleaning up the ufs
>> core
>> driver by removing the unnecessary quirk
>> UFS_DEVICE_QUIRK_DELAY_AFTER_LPM vs the inconvenience of a 5ms
>> (potentially reduce to 2ms) delay impact it may cause on an old
>> broken
>> HW in the suspend/shutdown path.
>>
>> I believe removing the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the
>> ufs
>> core driver as well as all the platform drivers yields positive net
>> benefits in this case.
>>
>> Thanks, Bao
>>
>>
> 
> I think you misunderstood my point.
> I am okay with removing this flag, but this patch will cause
> devices with VCC always on to unnecessarily wait for the
> delay, resulting in wasted time.

Are you referring to the always_on flag in the struct ufs_vreg? I 
believe currently the ufs_vreg's always_on flag isn't used in 
determining whether the delay is applied or not.

How about we add the check for the Vcc's always_on as shown below?
The Mediatek's workaround can avoid the extra delay by setting the 
always_on flag as it already did, without using the 
UFS_DEVICE_QUIRK_DELAY_AFTER_LPM.

if (vcc_off && hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
	usleep_range(5000, 5100);

Thanks, Bao

> 
> Thanks
> Peter
> 
> 


