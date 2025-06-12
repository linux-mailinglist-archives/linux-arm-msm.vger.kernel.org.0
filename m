Return-Path: <linux-arm-msm+bounces-61112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A49AD6E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF25F1BC2CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4A7236A9F;
	Thu, 12 Jun 2025 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="njXntUFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3035E231A32;
	Thu, 12 Jun 2025 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724975; cv=none; b=ORux5l4R7F8MfySaatF6quPmPsPP2VXIKUjsjy+HkwqUaUyjExq35PLr8LRaAv2FuFnPBcj4Kvuk2bzFrg3BwPtT2DqOT4mrpq5MdTMFrA9aPfinqP1PI4Oh1sGgwqEpRdR5yB6L21Qk/VlxbsuKArHaR2+lHf/BDxCQk5jnaRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724975; c=relaxed/simple;
	bh=lRvJOiOoQxNwg1/S0z3v+01XL+nggaA0QMHlFm6CCss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i1ahfGlUUYxDszhpj/O3mB0AkjaJPdU6HUg0dVEHsU5JphR133Iv0fX/CekQ5xd3UPO8DMvoaek1Ek/3IpoeR0nMMWmEZcqldMHw27tnFJaZMnL4PbyXSbF+4XiCacPv2oa8Y6xbhkFtD4r3DK05u7GNEt3LPxw0zAjFA952JVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=njXntUFo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8L6qM011530;
	Thu, 12 Jun 2025 10:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4034OsWfnzqWI7rpRXbrvhnUsIe7YHju91pqkD8gVk=; b=njXntUFoQo1PyQt4
	lD4i/pyOMkJ9KrmGQozlUQvyMIz5CDJUbAyJQz3mUnB8g/eOOVyAOi6U0jJxmN59
	JjZKdfm1cx3zb3Jq2kGqPw+vJRZFZaR7OSOus6wuuuiq6tOm3K4Mtek/UeOv1wVS
	XaUoTp4b3MkkK77UfYPsXS9eY6DYp81+3hMZFyKlDNK4KKl2Gq4dgaJGNJejlbv/
	FhUB1H0re1Iwkn1rDsNLtk7u4it1SBzLlEBeyScr6JcN6bySpExwFWg8cGYmXXw5
	daljSgENRyJikx98eID/uiBfb3ekFFfpz3RqGaPvpK/nEmSjA9Ey0cbAsaKabNVN
	zpuGkw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyvnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:42:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55CAgobO001890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:42:50 GMT
Received: from [10.218.12.164] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Jun
 2025 03:42:45 -0700
Message-ID: <85594b9d-b4fe-4cfd-ae3a-07901b9e27df@quicinc.com>
Date: Thu, 12 Jun 2025 16:12:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
 <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
 <x2avlatyjo7sgcjubefexsfk6gerdbhx5dcug2kszk2hukcusm@srs5dwuc2m22>
 <4a8df547-e625-4dbf-9c6e-44a3f793e602@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <4a8df547-e625-4dbf-9c6e-44a3f793e602@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684aaf2a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=07oZwJDR7OJQ1aN1LC4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MSBTYWx0ZWRfX7pwmCrcYR40U
 fdQq8X1+w0C1dsCnR462/nZ/W9XQEOL9Th790pgqvRbJD58W3PbrBL5fOMF0YcjH0bmdjB93uzU
 HyerLjhMPyoNpMHuHCDdR2+MCUHdLl57d+N5XwKQ/ufWDGpGMAM6UkcuSbW6evjUsAHixvsvV7W
 bZzice92BBf3bS+eN9PzpJKaZgSPNbsO1oOASwoe6BR6FgVmtk8BRg5cLB5rDNmfpozrWosTykK
 bf6nAc6RUKvu0o1CDAaop+27zOijwzeyE2+V3TgDTa+06aTuXLqorw407zxGkMnSyLIVhqImNT6
 DS7jBvp/Fz5P955kIoY0rt0f/7Ywu9VXJeYeYy4m9xbtvKUhb1PsuPn09S7KdGwf11yGo5ArkyI
 kpDGrjeXudsA8wQjzOQ2KhE2/gdCQeFc6Le2nAfxDCddylXyOvSs7fcygdBidAD2se01z/j9
X-Proofpoint-GUID: DWzGg613QCuoJZ3IrlGm5yhEOASbYPOa
X-Proofpoint-ORIG-GUID: DWzGg613QCuoJZ3IrlGm5yhEOASbYPOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=661 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120081



On 6/11/2025 8:17 PM, Konrad Dybcio wrote:
> On 6/11/25 4:19 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 11, 2025 at 04:08:57PM +0200, Konrad Dybcio wrote:
>>> On 6/11/25 8:37 AM, Gaurav Kohli wrote:
>>>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>>>
>>>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +	thermal-zones {
>>>> +		aoss-thermal {
>>>> +			thermal-sensors = <&tsens0 0>;
>>>> +
>>>> +			trips {
>>>> +				trip-point0 {
>>>> +					temperature = <110000>;
>>>> +					hysteresis = <5000>;
>>>> +					type = "passive";
>>>
>>> All of the passive trip points you added that aren't bound to any
>>> cooling devices should be critical instead (otherwise they're not
>>> doing anything)
>>>
>>> otherwise, looks good
>>
thanks for the review & comment, let me send 3rd patch with critical for 
all trips.
>> Don't we need cooling-maps for CPU thermal zones?
> 
> no, we have lmh
> 
> Konrad


