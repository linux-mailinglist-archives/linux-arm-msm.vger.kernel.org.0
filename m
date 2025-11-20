Return-Path: <linux-arm-msm+bounces-82637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1EC7300D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F15C8347F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CE9284888;
	Thu, 20 Nov 2025 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lhcnnLRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3212FF69;
	Thu, 20 Nov 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629352; cv=none; b=DkmbSobieP+GDmF1I0YJ6edfFoUFsgvelxlQPb2bLOrqQRhz8tIiAfvQnta256LQecnsFeEvDMyMJIhO9F/ds+MiUpQAue5Zd+D27TzkvPJOME5rbYSZbmiggf8WsWbYoeEkv1WM0ariUboBMvatw9FbzyM4V7y8WeTAG4cwQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629352; c=relaxed/simple;
	bh=tvr5KEl+5jdPz5g3r0dby9/xor5+786slh8yb2SIF7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WC5yUz8vxbKLBqHnNDx3X1EXgWk4x5GbWqv58uNPCJon9t2AVkfSQnzJS+O9R+iLOYi8Y8aa5HLQUL/euRquRUMv/FfT5AdaNF7Vd4q5VjPeJordB+cJBS+PvFYPAj4JstR9VnbjA8hXs78C5BnPLWehRBRAW5OYO63T6RVL8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lhcnnLRm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pu8Y4185034;
	Thu, 20 Nov 2025 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cD9jmBh6F6XRkchGZaRUwfUZ0TpdFNa6MKHRpBt8wFY=; b=lhcnnLRmne1XZSs+
	x2MniyNrWyTN/0ZY04UwiIEjtYC7xazLfTXFL9moa4yCgVUe91/XStoE6bTdkK/x
	Yp8fTthE5A0LnTjsUaN4zb5/ZNBEerRaF3LhP24CWKixTrAOr5jrb7NBD9VkDBz/
	TcvrWTlPl25/tmFih+CntIyQkd089dpFZW5M7RbFpl+rjgrjdHc9u52QLNmdfECj
	2o/CtfoVKNNksqMng3wucSrlPs8cfl8TBR+RX25juA3RqXjVV2OKKrxWPVimSGf0
	IXgMguUX89Bp6DZsI7ya/sb/G0K2cxbmXbew5jF2nAqpgxg4iaLjxA3c02qetNfB
	o3IBtg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6unuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:02:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK922e4015795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:02:02 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 01:01:10 -0800
Message-ID: <b4a4493b-0b4a-42d8-b4ee-ddbb348f0b01@quicinc.com>
Date: Thu, 20 Nov 2025 14:31:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <marijn.suijten@somainline.org>, <swboyd@chromium.org>,
        <mripard@kernel.org>, <abel.vesa@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
        <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
        <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_riteshk@quicinc.com>, <quic_amitsi@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PqNPwdwjcpIGtsDjBllpy6cYIDZ8zK_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1MyBTYWx0ZWRfX/o/pD8dGN+Hb
 HIUYZph3N10Geu1hkO2nFgoR3Wv/FvRTF0QZWi5Ebv13Tnx6OPSSbhEEGfvurebndAI0OraASBk
 vhA2a1DcUter6PxyGXO+OHYvLxQxzLIpCUmlvQ7JIEE4EtMoNa/WZWmrlJzF8dsmtOq+fC1+HQx
 AkWA8G+TRqqGW7iBA/MPRJM/549T4DxBN1u7+NVk3/IJOZgnBFlxgeSE5Orv+06dzHb30NfQAvy
 qN16Bc2HrXCRUczVxzGxW1gn/nDkoqw4Fhj+cvjwX6RhM1Et8rqP1IIIz1DniqwVPY/VKP9bw24
 tBCbuoz1poUqZjIxLVNvqyZhQjIfMgHoF8BNmdC36tijDZwCgnZM++V6MDyzLzzGEnwh2YJX0ZJ
 6v+K8C1AH1WB/B1RXuFeg3VT5FH9pg==
X-Proofpoint-ORIG-GUID: PqNPwdwjcpIGtsDjBllpy6cYIDZ8zK_L
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691ed90b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=-2IW8HrhzCBWiBGBFSsA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200053



On 10/1/2025 3:13 PM, Konrad Dybcio wrote:
> On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
>> On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>>> This change enables display1 clock controller.
>>>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>>> index c69aa2f41ce2..d4436bc473ba 100644
>>> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>>> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>>>   	};
>>>   };
>>>   
>>> +&dispcc1 {
>>> +	status = "okay";
>>
>> I think this one should be enabled by default. Unless Konrad or Bjorn
>> disagrees, please fix lemans.dtsi.
> 
> Of course there is no reason for clock controllers to be disabled
> 

Sure, will enable dispcc1 in the main dtsi file.

> Konrad


