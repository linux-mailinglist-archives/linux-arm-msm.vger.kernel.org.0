Return-Path: <linux-arm-msm+bounces-74411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B2B90308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 12:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EBE2A2186
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2980630AD10;
	Mon, 22 Sep 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK8+hF3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA92FF15A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758537547; cv=none; b=MCKWs1IRuO97yVilYXEf3m3RsISp6CMLEj0GlHkOLfcrfDsSqch38gXfIV+xwxHLSsO2kqJ0N+g9RKTbOuO6juZKhLYVrcevySJ33liub48uU3LHVtzz3cvcHsfDc6nRONDkrWka8cxs2NDzCWzfnxW6kMaI+KhoX2sqImejk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758537547; c=relaxed/simple;
	bh=n9IiNcHVzF8wSrGZTJKLMTVcm6rKQY2sKCgE2XYStcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gg9WwfqdmNc1ak/WC/JUSb4BX/NMhsCSS0QXXdRbmT+OrdxHwRtG54XaOaxvjdFz4YRPo+q4/800aZ+am2uKorbc5vT2Csv61fLJcj4kNUErS+2fX+VjAForE2nCtike7oV6m8fyphePP7xDnn0YOM7GR5s2MbEx5gxDHhNzCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK8+hF3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8v168008465
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 10:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//qK6wXZg3VBUfn/3y6cWL6qPfASe+TuJHYX2mofcCE=; b=SK8+hF3vd7O8Lkok
	QQzy0rGVxV80rkqb0+J65HgOtyQdcWLlD3vOxhhv10WZuEgLf3R3m/X32WC0JCjJ
	JgwHbMi5MCiP3W4t6183/UiCst1mplMxm5Gb53dPvydfSOjI/9ks13DF+VmtOTCS
	+yzH/r+Q9spXyOp4u6fmjGvm9be3Hs/dbqpAoHnrtzFUBc78NTGM+Iv9LCYpYX4k
	Foi88/C9kPkuJ7t+t2xERB/IwsFFjA2Fpzamllt+yLQDM8pV69utChBW0fAPpW2d
	W1/jEzh2xNRf9J8D9mo1LaVjT2R8z1ympQlmyUaBvIkkq/q7Oj0uErnGq3LtlHpl
	6PfKbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7cepx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 10:39:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26b7fc4b7e3so8406495ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758537543; x=1759142343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//qK6wXZg3VBUfn/3y6cWL6qPfASe+TuJHYX2mofcCE=;
        b=RMbwjyOKBZ3g5kPlcA4m3+TkSSGX52c/Ib3TleudOubAgWHc60viBjbuS2fOljhGlO
         8kK1zaubZRJmuVqRHgsEfX0hyREDWepjFDR3X2U0vCbxji/yDpbjVDRYbA1WBa9nQlQq
         +2exnREogc7JXE9og5WOlYx0P2K3E5FcGdJN5Y9LyF02p4bhfGZKfJcFKBFRixNfUFxs
         BpmQIi9zQqVu6C23W+m2jJm4r/pYKp5CNz4g/t58nRXwCiDsflphMlMY2/i3OvvS/snY
         fbT9rldpsjDU39UEj9T26ay8sVtpNicH0jdSiKtBJUaDqB3ndNox0OAWmbIiJ0toq1xA
         iLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc2qNcFcilNMZBi9RhXordfU3h0UVunZMz6cq1etZs5MXdcJJPGc58dGmz8jngBZyUzG9uVyc1+qEdLbeo@vger.kernel.org
X-Gm-Message-State: AOJu0YyuBRe+k434MWQvpiY3yK/OiRbfQoNsYD/Cryx5LzKJzz36dPje
	y2jSdP5TC4aRGOlV1JZC/SPPUJNnwfv01nGj0iCyqoWkTFCI6j55IstHJE9uNRItMG3+wwo0EVz
	XvL72EJ6tuQdO2Wo9Bua6tw/usfW/3Wu+9BlTAthgyxNrnF7Efq+TR3DnvO/QiCVZ+z9R
X-Gm-Gg: ASbGncsGJXZxmVAoPKCLK7R31+3BEa68IvRrW2Qxml/+UA3EwK0iLnJio3qzZVv1K28
	KisnPg7vbDFHwJ4psz+q7WJgJj5XgPUSdWUhn+uzyUPsyTHV9a6JGm2MdHMhhRSiqaNShN40GED
	epseYT1y+l9U3Ctsz7WL+9KCN6k1XdPvq+jV7V5l8aYoJ+qscPGxNaHw+6ohkhZZgBqFkOT2K5I
	zvG3fAdt07XIApvbbmeiABIZst4NCaLNez2RpJjE7C/Y+PbExx56mZya3KqdLqOOSI4ppyZNiYc
	xbfyZOHdvdSL34AdcBfeeQA/duP0DyLZmppnEhbkTm4rdwSOBoYEjdbXpdR/8spgng==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id d9443c01a7336-269ba5443fbmr57182885ad.10.1758537542548;
        Mon, 22 Sep 2025 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ8EgA46Cot4VHvbFVkU1N3hyNZvluBxUAUjIVdbYP7UL9NYQ0X80HJxHmx6fYBf4OwquS4w==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id d9443c01a7336-269ba5443fbmr57182785ad.10.1758537542098;
        Mon, 22 Sep 2025 03:39:02 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803611d7sm129020115ad.143.2025.09.22.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:39:01 -0700 (PDT)
Message-ID: <c95870e8-e481-4d3a-ba4b-b990381b3d45@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:38:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
 <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
 <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX0eNFH+zvNfnK
 dU14JyDe3niegVPpa30K9bajXJBCvUc9hvIjIgLRas3xsHo3nt2tNWYY2i1ThsQecyAB2ryNura
 h5t8+nVBfHC32bhEKF8lbXshlzwM4ETQDr7Kpkz05boMVl6NhpaiczwJxjwpQwviiG8SM3HZSbW
 ZU/9FVvFMSpo2gJE4BqzE0f+1eyd8JF180An/3ZkdgZjneCHt6ZUq04sv+PgiXcHJLvJQ3S3RKg
 uxDWcSguCDVw2j7MSfixf1cI29GEVtT0ayh8TrnxcCYlLw1Mvphc5hqrN/LyWb6cnDGgYCuDgxh
 NiuUwq7h31H+UM+/DG6oeiU3IYb2ynRhKRGLvnrc5kNR9FieE2Cj+Wu9wUQa1jt9wo0o+kXJ/xh
 kfeUllh5
X-Proofpoint-GUID: 4femdk3lQ_WavqILcgHWBw_qha4CiB9W
X-Proofpoint-ORIG-GUID: 4femdk3lQ_WavqILcgHWBw_qha4CiB9W
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d12748 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F9smdMtuN0WkDBw8KqUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033


On 9/22/2025 5:40 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 04:04:42PM +0800, Xiangxu Yin wrote:
>> On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>>>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>>>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
>>> Why? Start your commit messages with the description of the issue that
>>> you are trying to solve.
>>
>> The original reset list only works for USB-only PHYs. USB3DP PHYs need different
>> reset names like "dp_phy", so they use a separate list. Moving resets to
>> qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
>> I will update commit msg with issue description.
>>
>> Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
>> using new attributes?
> You can't because othe DP PHYs supported by this driver will use 3
> resets: phy, phy_phy and dp_phy.


Ok, then I will update commit msg with issue description.


>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>>

