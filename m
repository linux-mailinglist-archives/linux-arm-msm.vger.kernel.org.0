Return-Path: <linux-arm-msm+bounces-56604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449AAA7C93
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 01:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC25C3BA4DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 23:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E4F20125D;
	Fri,  2 May 2025 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c+T49bYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EBF13D2B2;
	Fri,  2 May 2025 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226913; cv=none; b=KNdo1kTz/nSiJ1iXnf+k7xgfGvBgHhFrwsYdddD17ag+mPMry2Wi5FWzN3sDLt5ikkVXMLgUAwFUyYgG7/zeK7pr5olwRv6Yj5KAl6fs8K0TB/AwIPSU2SpNGa0VuQPsFFcngZ5PSkEQ1zDb2Wo4D6b+DmfDQ9jx7VYo+CprTJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226913; c=relaxed/simple;
	bh=xowUpDcgfJ7HFtbF5SNhGV1wN1vrSkyNG05yUWmnR6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dAn/Iv1wvQ+VIqU9B82KXVdxMHsMl80CPZXhwqCLhEfTEF9+SdJGWCv7Zx4I9FmrQJe+eTE/4If1KunrOfyktDtjERq1Tw1tWKH7rGOgpyYU6iTtCkZIYmJtITTTx5D5ffojxK2wHF7VT51y5sfjKdxFClW9MhRcDdUC0DxWkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c+T49bYL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAw7O014262;
	Fri, 2 May 2025 23:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iY+nmkKaaE20tfgLYOqLMSWqNJcOAkBfllOva5kWFKo=; b=c+T49bYLYobC0/hR
	zSQalHzo2XsEEg0aWvnb+DqjdXhudAOucToDCLj6xUN578mk5enFDuY8kViCYFKA
	Vi/vjBYZrR+FCMZGrEwipUqIfocDffaHrFahWxaNlh2+taxjQIAIXdsmWUC/gNjb
	MP/6xVz9sKmQ14mnrlQJS59/4KrGlpyJeSzjrGZxPygY4O+3klDygIQoB66Lf612
	NTqQ8ggkk0MOuzzUZs7R9fYcRpstpkqb+iv64CLt/qn01jzC+6As5q9jS42ctzQH
	CLx6MWLDiFeJQFyOShRmAaB/3S0GwxYTBFaLjZgqQQ85OwIEQ+lLUZ1lPd3ns0zC
	8CWqgA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u41gv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 23:01:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542N1aju006435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 23:01:36 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 16:01:35 -0700
Message-ID: <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
Date: Fri, 2 May 2025 16:01:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
        <johan@kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
 <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68154ed1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=_8BcBDBh2m1gIszazZ8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XaX-uqJztxIlqFkB3hKB_sxlDMRA311p
X-Proofpoint-ORIG-GUID: XaX-uqJztxIlqFkB3hKB_sxlDMRA311p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NyBTYWx0ZWRfX3xZ3+aKOBKI/ UlWsTeP2ait2RqBXVoLyAvTuLKb5W5R28J+rR6pL4rEdrd7aiUWNtd0zRH+ZdCDB8uaCgEWNGwe 17Fg5gSMH5LX0VaatRozTvxe+DbicBwXrqVlStE5br5RYueNNXqaJfim2nQ3/um8taDJMvZGogo
 85DOpPp1O1zWg/aMXDvKs/J3kmggiiCXq52sZ8/BFsn997+bT4nlCkVUDuGAGbtinr+Asj1BZ8b ayBdtt0AUQUnmlwD/bYQinhL8sPc+0/MVMlDROeVQ3MMdKhqRROtTqgwsfYsu76/Hzr4mE9T8BO gWTJlh2ELdyJ9WPySLWGfHWP9CTJ4bxvBHy9T6cyrdeTfMUkRXTX6gdr2SG/nxIoDnJZTIR4ttB
 4ayr2XiBG4pqRAbFe581NCNiT6fz2oaJeMSZpv9UxmVvJLuArEITOR468ikbCxJQsrncFQgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020187



On 5/2/2025 2:54 PM, Dmitry Baryshkov wrote:
> On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
>>
>>
>> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
>>> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
>>> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
>>> Section 3.6.7.6.1.
>>>
>>> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>
>> Hi Aleksandrs,
>>
>> For this patch and the rest of the series:
>>
>> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
> 
> Were you testing in a setup with LTTPRs?

Hi Dmitry,

No, I have a setup with MST so I re-verified SST and MST with these changes.

Thanks,

Jessica Zhang

> 


