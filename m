Return-Path: <linux-arm-msm+bounces-79098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A21C13089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40144600D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 05:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C47127B352;
	Tue, 28 Oct 2025 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od5+Q6EN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D4261B67
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630908; cv=none; b=noMqKMbHLolqIu1YZYHVpVtuzGT+lAZvZdaU3gyJ5JA4c2QY5v4w1V6HgW0ilv5/BfuX8UnifZB+c1PBxam1MUxChWQhUUkCo0LbX5ne28jiVwGB9a4t0VeuyQWi5M5L0zLSgp+uSsvVzHPGGfB9Knd4ev1ZWzpKZaxYLYH5L3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630908; c=relaxed/simple;
	bh=wbrzyQzJ/ISMxfjHCPJo4dCOxW5GR5mv8F3Pvly+tfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8BPL9HQhhtC1+WZEmp8CHWeae58sT3EM/RkzCPakCpWYEaXvLWwLcIBRH11GNTdd2ZfOWenU+tONt0wU4j4FfxUFw/Ps7053HrWxN+Wff5Xl7ZZddOqSwZEYC/D9bUdnKfUzXjpJhHaNzGYwgjjquSISRGIqDExfAKdfv8KMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Od5+Q6EN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RJO35f2546709
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=; b=Od5+Q6EN/hVcROkv
	68QhvL9ePE1pHjnXWh+zV9xtdoG9kqSXFOH2ATTmCVE2mHk5ToP/thq7TldSQHJZ
	nx7RovXoZL7Qfmap5TTVF10lORG29RNRbed7jbaq0rS1RGQNNTVIBIJYHajuUB/m
	EituOtTvHoaWS42QNop+O8QvhZJ/P4ndH4vH2J1Bb/sj6Az8YsgUYTVMy+bpTeSD
	3OWQDjccQoBpbj9f6mWDLjk1Frh3ZBJ3LTpeavIplBzLLVXduP1GREB6lAtHfjL3
	mxiJ6s3qPTeTZfZuVkiEZl79DNr3bvmpGMGa39W4Bp5OtG/lBJj2E/fd+At76jaV
	bw7PcQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2jxv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:55:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6cff817142so3157118a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 22:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761630904; x=1762235704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=;
        b=fw9Fy+cK6wsGuF/xqnmHqPPfrVSdMrA/3eFCB3oNceAsLGjdPLk1OV601UGkZzlbp/
         Ycw3MB21amnQxWz3R5SxXeOM+3EPNrrrTFhbVddH+NkQmszOslQaqtVIbCaU212U9p1J
         YXIT+CoQfLRlVMLg4X8PZQME8Z+CFCoerKwLz3YqQ9JPgtZdpjE7yTcytb9/v57EZywx
         6mkooKw1wWiikSNqSC6n/AawOv6+h6K0pH0hxseYpyH9zMVCzH7lA7Q8lIPM/PEaVdjl
         qt3GCIIXDoImevT6Oy81e9WoxGnT0tMHE9ZbdtueWrXGLvPkBuMWapx3p0mGwHUx8jCX
         SeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiyK35kM+xTCusU3d1y8oFkX97Wkzf8nzBmNSkuH+vaaV3rx6lDypZyB08/mQwFYV8bU0OQB7BPbJcls5j@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+SoSHfrZmOA6DG7sJCb4lpobRh/72tIx/9oP2pToGeKMlQBn
	xsJ4ZciMESqrz++coDZQx0R/m3irdRy3lY5LQor776m8i+xFn2U6Fxdf3dlNqDNn4XcbfUx9Bk9
	E23qrguarJk27is+AzJMOr5q+0gVTto5IqfGChD2rrs3xJ4CuVjcuQ9ZDV0tIHfiPpvi1
X-Gm-Gg: ASbGncuHic9Rh3NVNQF8VyVsMuXmMvC/qhRBhuvC2iVNLf2bjfgvVkQJeUvJdTwXmT+
	jh9loQ4ytWMQJyuaZMsDx7Plv/QJQbh3t9uqmnOAuOp3LD1Bs/4DdcUIEWLWr5uxm+XIa5I67O+
	xMKgeVsqk6lMJ6C/QH5B6ij10BwkaaZo0u2mrmbd4DG9xMOp0dIi4T9ugC852cAeu4dmvqKSpqa
	VIYJeS3/4rACatDLkcH0bpPMrSg4cx8d5RHBi7lbthbgq/vmppckwxyOhMfKvEhy+GkOd2nvbAi
	B4hU1J2z15GMbReIQWxy1eDdMHxbZH3eiygHmlpqTJeKkTwa5/Thgqv0qovg624LUb0ZV7pdR5L
	GFqglLWwvSVAb4KF5gruzuURz7acQ9tRpTZHVQBxxRFVabwNQcCYCbb7gyr/aRrXs63fxxxA=
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id d9443c01a7336-294cb67481cmr35489495ad.54.1761630903947;
        Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNN7tbxAtF8QwpzLzr8V1BNKo9CW6ELJvgyAYmlxy+kOCt0Ww5BoZG9W1Wv8WH/BdO4oLiA==
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id d9443c01a7336-294cb67481cmr35489155ad.54.1761630903456;
        Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Received: from [10.133.33.222] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3405sm104695945ad.2.2025.10.27.22.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Message-ID: <89ae527a-c4b4-4294-93ae-e9afffb11f7a@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:54:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
 <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
 <8a6861a0-f546-475b-907c-65b691d1d340@kernel.org>
 <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
 <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6ortJ-_x76q67k9-xBrGSCSzID9Quz3i
X-Proofpoint-GUID: 6ortJ-_x76q67k9-xBrGSCSzID9Quz3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0OCBTYWx0ZWRfX7+zisoQ1MMeL
 VFYgxLn2AUMbRnmwjetdfJ3jMq+LFRTDJns/0CJccXkpdELqkhyj87bbF/3QiSTH50t3Sm0+kV7
 DuPpXy/C90rA6K8pnr86GpGNUDvvoh6HtStCKtx+4yv4vkiHB9Bjr/RGl08R80aTXbjiovblcnn
 UcRTAXKNimjcFvpsutkxKue1Ehfm0fPjSg6j+Jw+ALhgBxEi2TjbnQHyHiqWDYlf5RKlCbKhWMF
 k28W7J9ZguyQctK84LS9E6fzm7fU2sRSPgkA46BGl/flVQ3uvZoOuMAlwQhv0KdMxtmh2TAQ4pM
 3xJxL5jM0QK0aQIqb3uj1ILwQphPnaSLnjHeX/5Tvnb5Auos4DR+tedM/Cv19LJ+yF16WORRecU
 F+Lpe2WXol7Hba7aAMe71H0VjxRTvA==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=69005ab9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rkEqYQ_PoaDmHDwLzVwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280048



On 10/27/2025 7:52 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 10:40:39PM +0300, Dmitry Baryshkov wrote:
>> On Tue, Oct 07, 2025 at 03:43:56PM +0900, Krzysztof Kozlowski wrote:
>>> On 27/09/2025 08:26, Dmitry Baryshkov wrote:
>>>> On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
>>>>> On 18/09/2025 13:14, Yongxing Mou wrote:
>>>>>>
>>>> process in other patchsets and in my understanding on how to describe
>>>> the particular hardware block. The changes were reflected in the
>>>> changelog. If you plan to review this patchset once you get back from
>>>> your vacation, that's fine. If you don't plan to, I can ask Yongxing to
>>>> send v20 just for that number.
>>>
>>> Solution for me could be to ignore Qualcomm patches till they reach some
>>> sort of maturity.
>>>
>>> I am not planning to review this patch, because:
>>> 1. I already reviewed it, so not really necessary, but even if I wanted:
>>> 2. It is gone from my inbox...
>>
>> So... Should it be resent to get it back to your inbox or should
>> Yongxing just restore your tag on the grounds that the changes were not
>> significant enough to drop it?
> 
> Granted the lack of response, Yongxing, please send the new iteration of
> the patchset.
> 
Sure. Thanks for the reply. Should i add back the reviewed-by tag or 
just resend the this series?



