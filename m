Return-Path: <linux-arm-msm+bounces-87060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC536CEB5A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 667E1300EE44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 06:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289F030FC3E;
	Wed, 31 Dec 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WnO5l0T5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F4279DCD;
	Wed, 31 Dec 2025 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767162837; cv=none; b=mJKoqNDMho2c1o9Ku3a57/DhEG0twwo1VPVs3aejZyZ2gYNw3hWUhx4/5J18Sopj5E0mC7FXehmp3Rvaf8Vv5HqTtj+jqjOBYOHWz30Lvh/n4ybpyeZ/Fps8wG9bNg32GnLFLVUg+gmodm0FJYCX5ibqZZxWkXs4PWoe+MH62RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767162837; c=relaxed/simple;
	bh=wK/xRRGUTRCNiBaTrGsIgQBhulgCfKMSWzmG9OA1gd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LDBkcy+pEbyNH1wmiiT/xzbSj2ZNGRqD1bWEVH37xlYT9qwAwVv/JFP8MBPtuxqRVuKxzOrXObuYECtkMCkygIfqa+c2nU7v9HoX+rL9WzdaKy7V3Mkqdsb6Qfp7++qXBmwpEnb4am24FLfCE5SpjP5GuYthbtQl3x1M4iUly+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WnO5l0T5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUKkRp11478218;
	Wed, 31 Dec 2025 06:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7CjBOfTYsjbb+wmdMM7HrHvZeDauW3EYInAPZ4LtsE=; b=WnO5l0T5moScLG7X
	Yo8UBR0FoZYuo57C8h4RKxTmxy9Wh7OOKms2/5uTWcltVPH1UGxwQ0kqnJ2Bcv6r
	uxupHARLHWJ0Rnrt2DE/4JiaR1eR81q055WHISW282t5DUzkIjlQAeNu+qSUre5i
	qZ/xAZmbVfhI4me/imGZ1397KEzfw2AvZVKqkBxIVLEV7+fFZab/5xVAOCTjA1N5
	cPD/wiUeciBN33Nt207uVneJm5m0iFplmy7quEJTCxeAy8BGcNIYGDKHGyAw4XsT
	0CiAdD9jIl6nxrH1WsSFdH0sjnmK5kRJ9gxLkwZ6hI+dwjayBtB2lVxxywI/AOJ0
	JJfYrA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc74631nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 06:33:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BV6Xck7032398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 06:33:38 GMT
Received: from [10.216.39.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Dec
 2025 22:33:29 -0800
Message-ID: <73c32ad6-0970-4135-a9b3-70ec8abb02fa@quicinc.com>
Date: Wed, 31 Dec 2025 12:03:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: display: msm: document DSI controller
 and phy on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@oss.qualcomm.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-4-quic_amakhija@quicinc.com>
 <20251227-vigilant-nebulous-crane-9c5a8b@quoll>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20251227-vigilant-nebulous-crane-9c5a8b@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6954c3c3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=g6kCBGneLQuQXpvsAkcA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Mh7eZpDP6e0e6aZRDUfSshu2Ao5tybNN
X-Proofpoint-ORIG-GUID: Mh7eZpDP6e0e6aZRDUfSshu2Ao5tybNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA1NSBTYWx0ZWRfXwGCPChApSGTG
 P6aiC+99/K4vCBclFnv0CtqR/fFrLOWT1CIDLshqMLmTST6FLZjneIzU45ugGz4N0nRcIb2POmo
 7ZPDMeyAtRJKcRb4fl1YV0qfbwnDiqAY8HbYPa2WLTjstGWJnJjnKTkEee++TzpqU2Sm4lXs6GP
 lWg8q8tWdIyLRQ4imOUjsabkxahUQSRkMUR5rlUg+perVFgfulT9p408dKxYgNeZu/RI41ooi2R
 5r72wDDkRYxEQw+5nad+0fEY2koeocIVugooBvQAF/3g3LgN74yt3NpbWQSuN88esqL/gGhvVyD
 cJkXJoOf3yypMsZgBEWkU5KEVSqmsydx2sfPsjBQd22+PLGSH1vLRqqYI/d6WQK7ataEcHtkVsE
 CZQ1lqLKuQO6xPMoYiwayR+O597yqwntC8q4MlPcS3bofyD4YBnVx4tUb23Vbp/hNQbwrPyUNM6
 ZMM7PJPsJCPVLcUkphg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310055

On 12/27/2025 4:44 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 25, 2025 at 08:51:32PM +0530, Ayushi Makhija wrote:
>> Document DSI controller and phy on QCS8300 platform.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> So you are going to ignore me? If so, I am dropping your patches from
> DT patchwork.
> 
> Best regards,
> Krzysztof
> 

Hi krzysztof,

I am sorry, I missed to add your reviewed by tag. Will add in the next patchset.

Thanks,
Ayushi


