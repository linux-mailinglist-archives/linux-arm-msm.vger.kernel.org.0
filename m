Return-Path: <linux-arm-msm+bounces-63549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91522AF7B40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB0D5A1E7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6CB221DB3;
	Thu,  3 Jul 2025 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAZPNi/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EAC17D7;
	Thu,  3 Jul 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555712; cv=none; b=IwZgG7N+Q0oGjliE9q9L63MxsIEmXbz+S5Yu32sdubxHIG8f59AVOawb/YYRQzf8NeEgYQeo2pnlkIhvjA9reUYnROXwKo6sROizzs0O9MFQjhtmDn3FiTEy6a5orVikJ2TsF8iBLX3R7LLDjDsWzIvPqwLkryEnW2DbUYFjzYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555712; c=relaxed/simple;
	bh=VMJ7FGSaOkPmjgdljgeMFkk60bz4jM+JhLrRpK2P1I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lmQ3DGpzqn+aDRq2TaPwEC8jKZp4QqRhBOZUWr93t7Q2bxO6HzX2AXvqlEJ/SWE4iEKIP1suGGULY8O0T7eNvtdUzz4Hu+CY7KUmvpfmCdCJ3qgmBMweGm920N8/lhtV/3lgV14vpHXvxUzh3Nv+QEnyJV526P+7Ibg4AMxHgsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAZPNi/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DLS0h021104;
	Thu, 3 Jul 2025 15:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgoSu0LOTK/GtsHJUW210NhYdTAe4MAlCgoVLLqhBBA=; b=dAZPNi/CHbjwbRzV
	nYp0zE3oyKsNVgQHGjh2y5dQ4VoThqngOV/0P8999HkC9pUmQpWwDeQsYEdWBLL4
	pYDW4+sySwD6AYZm4zRwjfI5Pg40MYonYf0ZXqNhlHp7AV8+PKDgtp9wypgsGaDP
	SKSOsFju8PwzGbxN4+leEbaoT206MOpAFHzrJdI0ac1GguifAzwmLiVIeaHwW5lW
	Xcl7nSMtBdrr5LTqdowAHiXJkBHCfJK410Rzd0xOam4U1T6+RbojdrJOWyjIthoE
	yZlqYWI/Jc2CRoLPhrFs9JZoeSvyV7MgmDhyyvtxw73PREqyLn9SPkrXQmzajYqn
	dIs9+Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn7kc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:14:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563FEpOw015581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:14:51 GMT
Received: from [10.253.36.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 08:14:47 -0700
Message-ID: <ba80ac3c-2e42-411d-a2b1-b85ed154372d@quicinc.com>
Date: Thu, 3 Jul 2025 23:14:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: phy: qcom: qca808x: Fix WoL issue by
 utilizing at8031_set_wol()
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        Wei Fang <wei.fang@nxp.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Luo Jie
	<luoj@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
 <20250703-qcom_phy_wol_support-v1-2-83e9f985b30a@qti.qualcomm.com>
 <20250703162316.32a9d442@fedora.home>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250703162316.32a9d442@fedora.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX82n6uz2UaW5g
 FcNxeKeJ41EYUysgWzhN0rlDP7UbDYiWhAor/FnRB2IJAIpIpFdZqQGQPigxGF7j6fg/i/Nf41+
 BBLrY1KlFH0T9AXovn9/1EGaEATJ+o7u2rQBfPtEKDhT9sK8Y+7Iy9DE9e2DWlRkwJxczw5aN28
 PAuF9GxNx+9DF/s9QWnuAB/6zeLj5XuuAxEJMnlqES+mJpbjnEFCoyt3Xh2MJdZjbvy73ScS7i2
 rkoygdQW6LFNXgqrdcFqWkEitoftiqtqsK0miqRNq/Fb4fejNXLHR6bowmhVcKTX8jfhRiTKbdr
 2HmV60AXMFvp41ewAmlcCd8COj9vgLebwac/5Rz5lP0sWoSsmWT3bqpHTNC2uJmmlhwwnl+VM14
 OaIW4aXg08UyOh6zr7hHcZO878rckNI//bVGBTDAOqFIuV/6kZ8bdEmGefFzNGoaD6/975s5
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68669e6c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=JKpRZwQOhUIvib8X3ZwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oUqNE08Ork7EFKozgu4amYqrInp-VW4U
X-Proofpoint-GUID: oUqNE08Ork7EFKozgu4amYqrInp-VW4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=843 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030127



On 7/3/2025 10:23 PM, Maxime Chevallier wrote:
> Hi,
> 
> On Thu, 3 Jul 2025 20:14:29 +0800
> Luo Jie <quic_luoj@quicinc.com> wrote:
> 
>> The previous commit unintentionally removed the code responsible for
>> enabling WoL via MMD3 register 0x8012 BIT5. As a result, Wake-on-LAN
>> (WoL) support for the QCA808X PHY is no longer functional.
>>
>> The WoL (Wake-on-LAN) feature for the QCA808X PHY is enabled via MMD3
>> register 0x8012, BIT5. This implementation is aligned with the approach
>> used in at8031_set_wol().
>>
>> Fixes: e58f30246c35 ("net: phy: at803x: fix the wol setting functions")
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> 
> If this is a fix, you should target the -net tree instead -net-next :)
> 
> Maxime

OK. I will resend the patch series targeting the -net tree instead.
Thank you for the feedback.


