Return-Path: <linux-arm-msm+bounces-88772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A9D18A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 674B53017864
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5D62877DA;
	Tue, 13 Jan 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrXhx2PF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8cnS+Z/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299D2BE620
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305928; cv=none; b=JZbxrgAa+xU/jjjkev6h96FY3qkgMhsADoXR0DGcRqXGMUnA0hVXFwn1lwX9k0GYuL3a3lZ9BxWWi3mCZcGpLukWgZr6UGFWAQUdHHvA81BQuw6FzAYHCdM6U/sphoarYu4sJGmGhKyo84yfWHSsGmY35hJF2LKRBO4Y6fhex8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305928; c=relaxed/simple;
	bh=It7af2VW91c0VsZt3moynwLT/GbUzHAEU4VDKoHkFNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AidRRPUj4kD2cx2QzkpYoWHdPSkx7yPJa9DfRgSHQYBsr3N09iAxRxVfLdxkfZdkdkIFIUmbKgCcQDlVCQfwOw68mUvaRAdr9Ev38qBmhsOSWat9Evyi4NMYtNspyQ4zhhiX110VDikX7AsXqgJN8QxTp6Gld6qJRGKMf5NC5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrXhx2PF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8cnS+Z/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7BC8q176979
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAKLxj1rYUJu3a1ZyekiQdFMm6/MPsIeMq4BBQ3ot9Y=; b=YrXhx2PFlPyb6l2o
	6av2d2F8bOpNJUhGKUseqvjOhGS0s6ftLLRdCT+imxcloX2qOCohM9m8IwirDLjm
	wKeYjZukCIqgqvdyt3rBVV41x77iwp8l0LmiLF4W/bZqGA9QloSfp4cx/WWZ//sA
	COJgJbaNzuDsP0URU4ASbLrcIjT/vx50r0nvAaBAys/seaSZoM083bi0HQ7ylwx0
	IYIPV8oKGq8CFkDFhJoK9iU6kNc3ROmL/UBvyTjin2zgXM+sF7r7kDgznl5796ep
	epzH0qBSr5eVR0zcnwtvcmeXNlcOFsCFfawEpkv7MzO+i5SS21evVXH4mdy1ywZZ
	Zvy9yQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f34ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:05:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so6070666a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768305926; x=1768910726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAKLxj1rYUJu3a1ZyekiQdFMm6/MPsIeMq4BBQ3ot9Y=;
        b=b8cnS+Z/hHbykKoZNkPUNPeNK3tROIVAE//U83/BzfRRFW9ZqM/9tmood/2MtUA3ax
         mp+zV8EVkwl+wsY5NSkoUumMeSyJ1zL0ETkuwRHduTeCI9FOx9xidwvySl6auqcw7N/Z
         jndSu6uxMCpmGVydgiqyJJsouTBqIFw5A1IvphxKL6XHk+aeRASFgJ/amGDttaT3ZcFc
         hMwmL+x2uzZi0nrp1cZZ8XkAATIfh2Bk3VXDhbgZZmmBrb8BhQV6aaR10CcyFgorFb0e
         4sqs9+1CMkIlwWiwy5OFe9xrs9ZddyS1pwzSR+tnHZ+mzIPNWw9c4GTyDto8GcAjMwjz
         ZJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305926; x=1768910726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAKLxj1rYUJu3a1ZyekiQdFMm6/MPsIeMq4BBQ3ot9Y=;
        b=esZgjOe/9tn3BHl394avW7xdQv1maztS84vEY7aN4Kvq0g0LZv81jNjMdyt2c2gxhu
         B7Bq9Asn+jpllIWgzyjWH9Ga/7YRoXWKtIAZeE6xD0cLXYiBIw2ComaDMCbniX82nPM8
         +ejbPd/YfQ6T9ofxycHKvJr06C/Ri65euDyrhDqGuvjgs8QVqaEQAG+OGDr53XTWzG4U
         tudAj0UFWCDmRW2yAfU5YzJO2ysTguP9T7NsfgcgbFjAv9XPRJ2/Yt2mTUuOEmj8tcUL
         l8bsfngUHj1MZCUKvX4P7ptaHhbUG4D2dAF4GJ/ggM67hX/4Hr1Ey4CiK9TavWSKN2my
         N6YA==
X-Forwarded-Encrypted: i=1; AJvYcCVEkhKBh9QzcRx7dRUy5tafQuMHehyBn6WSDcRTS+7Wp6WmT3tpbueatSQXk9HsKZ++chxUvfk9GGspMw7M@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiDSxVWVr5SU5bIj5TYm+6L9I8BOA0KJ+gd9Sf6rg24NdH0UA
	ZEnuImKXkSYYxvBKbN5d3obGSOYSxtU1WL6psYIZ6fmW5QnqEHpv+yisdlKP0LPOviemcssIVC6
	YekVhmj5M5wSIedK0IlUaih55EiGUycl0xlcfpTIniPKyrBK3xqEK/RhlEdfD1q9JH97j
X-Gm-Gg: AY/fxX5yiSbANKjpB5Dn9x0VsDs8eirO05ZQM2lA16P7QKZ4TOhN12b0ZF6+xtmvc0a
	z4GWRIR0Q+67geAf84mE+Txbrtto13yHKXRiemxogu3s3645L7VwXgbgugx70G0cpzZoKnPFfwO
	QSmyIQF8eGMfCsJQ6J/C2uIKZqdzE49nihUKmxfWSMI7W3ImDFJ4AdaBCKdKaPWRfzibRJ5aZF2
	DGBJRBPfWaknYdNVB92abOD2Tke6MQR+LpVz+i8L/xz4UefXZ7oN+VsBieURaVu9Wr9zeEpFH3M
	JFl7jY7bROjmgAEvwEPsafM8ADGzL8UxRLfLp6YBBhfTWv+Si6IdrKt16bFyFiNCcYoPlP3gNgt
	qM6788m9dvPcn3CFq2dlpQHCx1CHK4WNYYf+f3afMBmW+MzlP5g4gHS/xp97Zx3lPWox5L0/C5N
	KLxmoH3Q==
X-Received: by 2002:a17:90b:5445:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34f68c4f041mr16253669a91.13.1768305926062;
        Tue, 13 Jan 2026 04:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSvga3xUvK1QPHbLnMK4e3YlIXfwwC2VdNhB+MmZFlf5p3oHYcHUoe53lZmHMlX3Eiro+k0g==
X-Received: by 2002:a17:90b:5445:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34f68c4f041mr16253647a91.13.1768305925522;
        Tue, 13 Jan 2026 04:05:25 -0800 (PST)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb75902sm19799395a91.16.2026.01.13.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 04:05:25 -0800 (PST)
Message-ID: <c842b3f7-9f6c-487a-a119-90ce4e566681@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 20:05:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
 <qnwvucdihyavgn5prchafmfly7mc4b5ts4h2wxjky2cbkv4t33@ct6zncecngvs>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <qnwvucdihyavgn5prchafmfly7mc4b5ts4h2wxjky2cbkv4t33@ct6zncecngvs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwMyBTYWx0ZWRfXxGFuKODM9G2A
 2Q8dct64oA4Z1rlWD+t8qOROFNVRaSvVJ87nLIGW2ZSSNc6FgxGd4eCef82i7KYZasf7Wqf5eEi
 qjoCq3m8GUG8j1BOYAdBPqSzunJsHVGnetN91Vk0+Sm0L2EAKAUnw5r2hBlxEQaEvfa+1/aB82m
 wFVHCoW0+pb9VV/ZUSxJSdbTKfuFkLOf+DS9LJSIjp3fjj+Z/qF+qtfdZAVLe5lBK5xuXvwN4kK
 0kf5Olcfz436l5LkMGCNl27k8iGpvSXnoELjhtSo5DOsYdrIfRvHR+F5VUXSbnqJnh6+I8LyueM
 cN0qVOQ8cRjD6wj0oda6swvCK8f6oh00MboKW29/1NMrFl4NTjVNaKU9W9j5O0h+z+/XtUSj/5J
 qIkwB1JNctarOIiEeHMaTHDk7DXHfUv0287w5i3QPU5NEq9oawHDdDU+/s18DQtiN9cKD4KBaqk
 CntIfH3Dir0QAWwR//Q==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69663506 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NVtIM_OMUeQWeZrT3AcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7HldpLgU4wg1SCh3xSmMRzZH1bjiKuQS
X-Proofpoint-ORIG-GUID: 7HldpLgU4wg1SCh3xSmMRzZH1bjiKuQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130103



On 1/9/2026 11:27 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 04:30:21PM +0800, Yongxing Mou wrote:
>> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
>> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
> 
> have been corrected... when?
> 
sorry, will correct it next patch.>> to the appropriate DP-mode values.
>>
>> Additionally, the HPG specifies that the LDO value should be set to 0 when
>> in DP mode. These misconfigurations can lead to link training failures on
>> certain dongles.
> 
> Separate commit
> 
Got it. will update next patch>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> Missing Fixes, cc:stable
> 
Ack.>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
> 



