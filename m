Return-Path: <linux-arm-msm+bounces-59431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F6AC3F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 14:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E3417A1D84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 12:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459BF1FFC46;
	Mon, 26 May 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Drmulf52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891601DFE8;
	Mon, 26 May 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262173; cv=none; b=QS9qO8EcZ/CeeqcZYv4ABZSZx71n8gJdSd6HihTHI+wLQvnfC7YyHzTgLkMXPMfapFDC4cIcxHqsoszOfiTkkrf3qEGnbOtK1x4+YHzrdnPJxST8OW0IHUeQOgU8l9RIlMWYdFDHvg3r9zPgeElQcy6PhXbiDptFbdaiq5771pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262173; c=relaxed/simple;
	bh=4E9MVqUihvjyf3MlTLRLsTqOw86xjLpIYSFPtahvYLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eWOKv76LEU8r78wbx7T7KFRM+h3p26HgYGIELpqP0uKAH62gb0GlfPj+ssi0cx3DcOkJ4wt3J/x3JStSTsMwaLX444+bdOa+sIH1up8ucGiaht3XJKbvOr/WYloxtCJ3Adrbh6vw4R08QG0S/lIxAoMX/s1ByLcjtU8nErap6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Drmulf52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q91lap015727;
	Mon, 26 May 2025 12:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	++eHJTg6nwBtRRWpfeobl+erEFq938t+JYbREpmq6W8=; b=Drmulf52i3f4nRoH
	R/244wCNe8Iy3gYjPinYkFs0IAvpVWQmZWUWudnXtYaG1vGK6O6snSUabeIz082y
	eSvtxKXryxCMhU7tVeZThrj2mnluJmQ2gqYWD/NEYfmf0ggvFEN16pf22L7CJfwZ
	9Ei+W/9euKGYkWZp1WM+mgyRVwvrrbrMi9Z9kTGeS8Wn7Bf3eAhIZxjqWywG5VIp
	uuR8iRAxQOiRVngpHCpcn1oLtQ23K8zz9wo9zTOiH/pK6aqGEItVeYzlk469eX40
	p4NNYrSudug6ZQCe8NRVNWZ2a6gFB6U+zI6Nphxm+8vTavsATdhRA+O2w7bBxY6Z
	7B0MZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5m4vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 12:21:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54QCLqRA026385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 12:21:52 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 05:21:45 -0700
Message-ID: <6367013c-58c9-478e-8399-b4a53e2d8a66@quicinc.com>
Date: Mon, 26 May 2025 20:21:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark
	<robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
 <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
 <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=68345ce1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=c4V0u5EJHjKTGh-yu2cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwNSBTYWx0ZWRfX2HrpXyis01E1
 h5qfjPL6uGiJYB+ycRr+hQkVvcy5v9/bAQfsI6bP/choEvyKdXeG4p1o+MwqceXp3Jvvn4NcK+S
 Y9aY/k/vfNiqe4Kn7qstl/6MlCu581FR88WSCg8D3X80ltq8N0+lQJQb0t4uQLms2NzsB0YA9dg
 zh2aPMzZZnmYEqtsfe+voBv45oNhgMpzgPAxTx1o114t4L0pGKjfubxi0s/PukwhZn7zGZ0uS8u
 L3UqBATupgHtWAVcKGsmOA6DsoYCL484tJbeuRovKxwsbu570jcpm8RkSr7YLa2jfvnyR3RLPnR
 1ygxIdMsgWIh+7xUCuctoIrtWbqJjwk3rh8/upkg2JcJI+gNx2iWdI7IY7BAqpVs/9lEb9miN04
 BddZDrhPjTNPoTsLrcmJE2c8hBWZCe8L364fFRLvPG6w1LyZEv8IcURs5ZPcyn/qlgQZUXCC
X-Proofpoint-GUID: 28rMw1k_p1WuO9MdpSCcMqY0SgH7FD4m
X-Proofpoint-ORIG-GUID: 28rMw1k_p1WuO9MdpSCcMqY0SgH7FD4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260105



On 2025/5/22 20:38, Dmitry Baryshkov wrote:
> On Thu, May 22, 2025 at 05:51:52PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2024/12/6 16:51, Dmitry Baryshkov wrote:
>>> On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
>>>> In preparation of DP MST where link caps are read for the
>>>> immediate downstream device and the edid is read through
>>>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>>>> two parts which read the link parameters and the edid parts
>>>> respectively.
>>>
>>> As you are touching this part, could you please refactor the code
>>> instead by dropping the msm_dp_panel->drm_edid? There should be no need
>>> to store EDID in the panel structure.
>>>
>> Hi, Dmitry, Abhinav will be leaving the company and will no longer be
>> responsible for updating and address the comments. I will take over handling
>> MST patch series. Regarding this comments, I don't got that where the
>> drm_edid should be stored. In MST cases, where multiple panels exist, i
>> think that there should be a separate drm_edid saved for each panel.
> 
> Why do we need to store EDID at all?
> 
Got it. Will try to drop it.


