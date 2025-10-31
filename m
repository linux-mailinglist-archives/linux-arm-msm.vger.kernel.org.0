Return-Path: <linux-arm-msm+bounces-79838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FFC2431A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A7C18869F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF25329E52;
	Fri, 31 Oct 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNppK8iX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNg7Qffr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD131B116
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903366; cv=none; b=rs2C6GpacjRdbMoP/+O4iWcnHDqCBf+Lvs6QtqsbfnaRK2p7mIU7TMnTreh7r46J5xbJ1gFRUQW1no0xszo/tNgRpiNJYLIzBHPh2tj+SGE7kCkImZ5Cqm25uMOyShvX9uPrQz5P4aZjar9lIXuugPs3k8gdkKHybhSPGLr9iCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903366; c=relaxed/simple;
	bh=owkSwYp1NZxcVFt1hH/FF4+Ij0aRtJUPqCn8L8MupxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WirU0OVde6wSBdZfCIaSjVAwSpXTw9BnidoUW4rpHB0Mkf34Q/usmikZ1KY/rziKC9SqxQaiAyaoeoodDTx3SyAQLHSPj3w3bDzJuW+TlaVqHr0bTYDPKGZkkyQmWaSVLplWhbvfPyNqdGOOLYlzYWTFoFik0FmJuXMtXlRRdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNppK8iX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNg7Qffr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7n0A4872593
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=; b=WNppK8iXQ+5JkJmJ
	IK0p23JVD7GhYa8XpPx4aQKVzOWSw1aSe0VeQEEg9CEGajR7Y4XeujzHO4kojchR
	5QGH3jjf7snoIHG+iqLVoZDuanuXwMi3U6mihO9Ibi1VEB2VI4TT8DsyDK2KroSw
	zTfPe1uEYnlje2lrz9qp+T3kisdPxlf9VyxIJWz2xhgvcFJc8YYECFqVdD6JxqnD
	1VSZO+oDKfh1zP5SX+LX33ayD5hkoAIF/w0sfgimjTxhLjes3m2yKbJHmyUVgS0b
	V69mggpmosmgH4zXYHh0XF5da9s8hnsaQoOEZkfAS7ZgOcMi3q5yB0EWLS250vir
	ev2v4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn1nrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:36:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e887bef16aso3910171cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761903363; x=1762508163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
        b=QNg7Qffryllanng/m7wWke0+D1RqDUht9KFT+sxbXtAJbXqYqDRUoMkZj8EtknI/kC
         A0iO+Q+1/1rURPlR5ErqziKLcDwuJSTLWPqFXIl9UcthDU9rXqsCT4AyEyi3f9bvsNIK
         f1By/Y/euhk3wy12/q1sEGanVPp/XMpXcyrrpMjxfdo+ZFWHoHMnfzC6bYmI1tIvI5K7
         pERDc9opHs4BZtfNSEQuYcCRCQ+MfMsYLQT9MjW4e69yUyiuxEXa/DK3Q9gdjSfyELHm
         5NZ/1ueBcbaJTbEI1PEFAS5RqqLaxgFxGlGvVkOhXMDRzL50hfVL8xkUsT3pTQGtPrWq
         xmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903363; x=1762508163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
        b=VibtgCSD3K+FkjIM2wvRL4idkCtld0BYzqbKWQalCPvbbuwr+ArIAWB0ao+82EbAs/
         8au5Q7BbCabTjdJX+Dq5aaLv2XNjAA/cCmFLqeNANMjWIu0mnG25j40Uvf6mnny5xq+R
         CAEX2c7D3Q/ATqHv5lNy+TibXDGjsDXKHFtgv49FgSbDbHS7dxEw8/QnlmWJpJe9N9Yk
         hrQe1wZbzTiwPf2KEkjPHUIlfyISYYB68Xw6tG+ivQanKcj2J1lsjQinN9YPTSDgJavI
         SIbasEI05HPxatFaciAb1Mumh+TEjAYpdb738Vm1yuY48UTXmas8nHbvgCJB26HdFj8N
         nP5A==
X-Forwarded-Encrypted: i=1; AJvYcCXR6rlC/AVQoRMlHv900RPkqrKjUpPj9gw+bKFNhoXJ+Mehb7woc+YgIJj4kRRjhj45ounhFoASv9oHW6/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4vmYCxVx/MwGIvWnCUD2jrjKnWtAd234+/GfL1Dh4daoMuQHW
	bDCiiUgcUNZ2dQJdmXWz00VQPSidLB0ci45g/dmb2hC9zNzFTGwXACOfebE4QgPA5I++pLY8S1/
	jfwvb5xxLXep/8BGJsoM4WJUl1WwAUg/U5ZY2xjvl5t2BO9gRW65yEZBm7LL/LYEdgX4/
X-Gm-Gg: ASbGncv5a++lx+GJDxddfEObOR0sXFz5GHS6r4Gn4s7hKk9fB/6ofTHbzH9kRWCS7sB
	rqX0gNyP4xOfT6LvIdAriaHiKSUlTkYkYtDoeDpCSk3cOzXh1t65W/gY1aTWpfN36Huq1BFoU0U
	3T6P9XcJVmr1v5yMKL4Fv/WBL+DERqJcM5fTNrvfHqBbn8oku2v75GrUGB/lN3sMUatSQtK9o35
	KMSNljsFEDdMCAstZWc7sjiHV3CLmNNl4w865uOwTfZuAWmw6cQs8B2tFJb0X34b8S0iMGAQ5pq
	P9T03+OsDcXryHoMZ9GPx0oTEZ2hg/pw1uDQjNKhK5rVHQZc19jbi1ySpL8qjB9Jk94B6lPvcBN
	St9rA6rst81C9ZlfQS+Zt7Q5KKXXxgsHs6REAjOGxDv9PZp991QCITM8g
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id d75a77b69052e-4ed30fbae1amr19445031cf.11.1761903363102;
        Fri, 31 Oct 2025 02:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM64Dqu4qewULsJFetcmJmwTPjhEdUVf5uOKf3Q05MzwfWGWCLJH888ksuI5tZfx6XDLpCCQ==
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id d75a77b69052e-4ed30fbae1amr19443691cf.11.1761903357777;
        Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438536sm1183628a12.26.2025.10.31.02.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Message-ID: <60a8f86b-f529-47d0-92fd-90ffebe28243@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:35:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
        "Nikula, Jani" <jani.nikula@intel.com>,
        "lumag@kernel.org"
 <lumag@kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "sean@poorly.run" <sean@poorly.run>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
 <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=69048304 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=1UTDxpAJyHcS0dvM0xQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bDInoVDRCibRZzAMKUpiKvBf-WXduRqH
X-Proofpoint-GUID: bDInoVDRCibRZzAMKUpiKvBf-WXduRqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NiBTYWx0ZWRfX2+5Agf3POZys
 30Ds3PMW8FZsdBSR7AqplGGauCwxd4e3W40XTA2r1gwohuBqY36ZdOmq3Tot//cuBwrQYu/9dF6
 EI+RzR7y/3ppEsk98oTotucP2wWEiLmkVmd4/UWlK6ZrjHlDw0XhpmB01fKPvZk6Pb0WV+kIHmz
 usL8V+6bkToluNhwamrAwgQwBgFCT6liHliiMIWNU1MLYcQSre6XTMT1j4uQRrdfetmiuWeyroq
 10BzCuASbXR2iOg+nY9dNSmJq9C7HFQgvHWNpQg5M4Alq9V3GZixrYTecOln8DBlZg6BXHF3JaD
 3AIjOyfhwIsiozWEl5mM4nEuZrVQnmeZyRq5jCh3VqAXHz0FFBuJDb8AY8jmoKsNC5UP0W3+2Nr
 6/Z3LkyZl7RXufowIRVoGmGc3ZWCOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310086

On 10/29/25 10:42 PM, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:42 +0100, Konrad Dybcio wrote:
>> On 10/28/25 11:28 PM, Khaled Almahallawy wrote:
>>> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
>>> spec.
>>> Update its name to align with the DP 2.1 definition and reflect its
>>> actual use in the code. No functional changes.
>>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>>> Cc: Dmitry Baryshkov <lumag@kernel.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
>>> ---
>>>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>>>  include/drm/display/drm_dp.h     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
>>> b/drivers/gpu/drm/msm/dp/dp_link.c
>>> index 66e1bbd80db3..5d465cf4dbc2 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>> @@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct
>>> msm_dp_link_private *link)
>>>  		return rlen;
>>>  	}
>>>  
>>> -	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
>>> +	if (!data || (data ==
>>> DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
>>>  		drm_dbg_dp(link->drm_dev, "link 0x%x not
>>> supported\n", data);
>>>  		goto end;
>>>  	}
>>> diff --git a/include/drm/display/drm_dp.h
>>> b/include/drm/display/drm_dp.h
>>> index e4eebabab975..610b8cbf1125 100644
>>> --- a/include/drm/display/drm_dp.h
>>> +++ b/include/drm/display/drm_dp.h
>>> @@ -849,7 +849,7 @@
>>>  # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
>>>  # define DP_TEST_LINK_EDID_READ		    (1 << 2)
>>>  # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >=
>>> 1.1 */
>>> -# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >=
>>> 1.2 */
>>> +# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
>>
>> I think it'd be useful to keep a comment of what it was before the
>> deprecation and rename
> 
> Given that msm is currently the only driver that reads this bit and
> correctly interprets it when handling automated test requests to
> determine 128b/132b support—and following the style used throughout
> this file, since I don’t see other examples referencing deprecated
> names in comments
> 
> what do you think about using something like this instead?
> 
> #define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE  (1 << 4) /* DP 2.1 */

Makes sense, let's do it

Konrad

