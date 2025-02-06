Return-Path: <linux-arm-msm+bounces-47005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D656A2A254
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6609E3A239F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2DA154C0B;
	Thu,  6 Feb 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="btVR24li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0513AD18;
	Thu,  6 Feb 2025 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827264; cv=none; b=irrnOpGFMz8i+BgYSfsYTdK87NdLcHUKbW9VuSe1HkTe0T03ULxzFImK1t5w7gRtvwVtp4l23MtdJRDQ12LPJsxLrax7R978hjKxbsAHicgX84mayjmd6/NNErrZi7BRjL+CbvGrMN5c2F75wJwYEp/3lYvI2/J60LSOhHNmDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827264; c=relaxed/simple;
	bh=2g4WGxLqw+k8j3lEeztBspCbb6fO27t/Rd0hquBq1zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G6T9cm0TYHB5h5d63ytIdL69wE6o7UEsegjVnZaS2vqIU53Nc5cqHGMJQASm2NXmmahBZ6+u1MBdyM0AwLb47eRow9jFb2UJxZSzyvBAQbZW5V/Mnv0HPUBc2MBw+nmnWPlrjbUPAC8jAp0D5xqUU5luF55/CnoyZZRmdAnZfco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=btVR24li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5163JoOM017544;
	Thu, 6 Feb 2025 07:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUlG3UNtQJExnVI2dfP6DGSLfDrec9VsYrxCHKK+B9Q=; b=btVR24liqNCeM9Pr
	EtL5s5B+8EeiipP6Vg6GGPUkkKDE1MMbC3xyoyq3REh+1JVp9KskNuo/fHkey7FP
	rmVGhSThcXEmbAj6xloDDepk5LKAZ+yIEF0IABfBjT+hp4ngRXGeILgxExmt60uU
	7HoVQmVyJ5tnWVAtUPb7rRL/ASnTK+T9WJQCjbiDyn58fISm3eeBDQbVLypbMfoM
	dAHKtOfZv/koM0V5d36dTJFFMOAG3bu/zkHG8fKTu4FMHBgSouRhDzhR4SVMcH92
	vzUbxp5jK0VRvoRJrgtEeSv+vEyOV2TAAkETYtQNc3UMk5CvMxyUJnFbtxpGknc/
	55Owzw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mn2ygge1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:32:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167WcmY004871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:32:38 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:32:32 -0800
Message-ID: <a56ee502-658c-4189-a963-51b488da95a6@quicinc.com>
Date: Thu, 6 Feb 2025 15:32:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im
	<minwoo.im@samsung.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
 <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HCq-x5_05vsA-b4SdG6bzT-DOJeaUXeF
X-Proofpoint-GUID: HCq-x5_05vsA-b4SdG6bzT-DOJeaUXeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502060061

Hi Bean,

Thanks for your review ~

-Ziqi

On 2/3/2025 5:37 PM, Bean Huo wrote:
> On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq
>> clock
>> scaling may scale the clock among multiple frequencies, so just
>> passing
>> up/down to vop clk_scale_notify() is not enough to cover the
>> intermediate
>> clock freqs between the min and max freqs. Hence pass the target_freq
>> ,
>> which will be used in successive commits, to clk_scale_notify() to
>> allow
>> the vop to perform corresponding configurations with regard to the
>> clock
>> freqs.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> I have reviewed patches [1/8], [2/8], [3/8], [4/8] in the v2, since you
> just changed coding types, and typos , but no logic change in v3. Add
> my review tag agaion:
> 
> Reviewed-by: Bean Huo <beanhuo@micron.com>


