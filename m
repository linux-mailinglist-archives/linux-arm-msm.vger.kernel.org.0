Return-Path: <linux-arm-msm+bounces-74547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB684B97B24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 00:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728762E4331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 22:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2273D26E6E3;
	Tue, 23 Sep 2025 22:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/h0kwTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F37C2E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758666048; cv=none; b=lx73vbVTYZl/X0ZCPrqCPUHo2Dc72EZq9M1xpkwumao+HE/UmWDRWKRjw60ZBI9N0oQBsSPtZ4lVYowPDMIUiR62pC7GzWXDfptkKVQlaX2JIb6jV7cqhKB0SmRNHJslWeakgyjiYEB4b3TKxdHMYGCQw8szUMmQbKHN3p4Q+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758666048; c=relaxed/simple;
	bh=pM6SrP+KFWtAPLiu/qBEKPbBVnygt7Ql8aDnlXuXu8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnE3vawjFAIb1t6/JfNqcY5sH5XM/PPFxhqyNO4/mwBRhGIJk0VHQFZ0Kp76vTMj5IYcHbK70j2taNoO1pkKqT+TSFPQgSI9SIheALEBBhOX2O1llUx2aOGsaUnEp74gDU0WJ+mz9gXzdJhFckQuu2hmEPstuQojhDl4fJ7tejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/h0kwTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFBCoR023766
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=; b=F/h0kwTpuzKJK9Si
	C/vHQHBGXHXHcpUGOYGpWXmSYEgDE3kQXgXBZXjBZRqWKVAwdmfXBOk1F1Kmsirm
	uEAScIhViYBsKBb6KarpaHr+0uWwz8czX2/9RqgY1YDFmb+ej+4IgAEkOz2hg506
	RS0z876GscswgrouDyiwKBaZgIRbYbAL3aliex+xmh/gfvERGfOJQTaZrB6/X00P
	zFoFuaotLPLHPa+lrD/ynOGx9YOBRvpa2+pYbQK5vtLiHMjQztJJ7kBYhJ6XJg5o
	hhTbqhVIKPDW53cHFvasOg3/LupMjWsBw84aysd/4Oe9OBpQhYAsWnX7AXzwxWYP
	hwQG9Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nye0hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:20:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so7962219a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758666032; x=1759270832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=;
        b=rMHclHDrFvAeLHU00UXg1ii+Y8Dal2TJ5IxyYrIoHGPTgP/qv7YLw0n6dXM+2UryVr
         lYupiJMekNZ1PH47yLUhQh8/x0Ip3jORGnwqpcEJ4ATEym3aV6xVf+RVYf7iwTLLB/6z
         7zUqF5GkL/Yal1Ehy8W1gizBZ4VNIxveDM8efNMceSUE2I8RoWMolFIZsk/IBTDjZDIk
         Ddfo1251j2+wevzjNFX67ttuirWhqi6K4MGW/Aad+c7xy5mblP+LUNXmKxGBIVlP94As
         +GZEjJc842Z1OoeXQdWoEcI4zx2sX51QOZ6qJbPaj9MBpkP7oydvAgHtFo8AJUuh0iL+
         tYDA==
X-Forwarded-Encrypted: i=1; AJvYcCUxnR5zU5SFLABec+R4bKf05Pc5ShXpWYnaVr8KAg/TooqX8Oe78RPCQrN7CEHPxIw0sOleoEaAWiSBfQsR@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAE+iSmSc2C23YAEp+Y04ISSqDwLdcFS9cb33LP+dwl//lPPp
	OijlX9hjniHZ3YaLIb4kp7mRCltgXEiFK7Afu0MLWpIU4hyiEQNQOeJAD/LInb77FkCDPMWRzgM
	T+WkOrhVcB3RnlAZ0MyXLB/H6t0Udh36WAe3RjKUavfSZEND+A5ap0T/SHT5ZfzaDhFA1KYFaBX
	Ds
X-Gm-Gg: ASbGnctyIHk8mtLgLvHMv187WdNymN7BWlALfn0xy7iNnMahrpwktPW0pWxIsjV1k7L
	8K9JvXGdgw+UFLPH2W0UHT3xylprQfkYLkTAsWAkM6w7f2qAV6ZYyZzwV4KfMEof6gJP+IwNt7v
	a+Wx4tJQi1q2Jom4yX3nJm2vCllkUrwj4jUlyYtqt7gh32csGC4BM+7NzDSipMhMYh0xjs7S17A
	++6DcSz5BU7VLlYHFXAOUNTiPvD/FFv5Pxr8wsDX6CglDy9UOyo6HX9xA2UuTVCPAkKEbZYs+0y
	Tp9cBhFdveTy1yUnAxBIY4QJRW5dmJYB41YSp/kqpZmtS2s9BkIUAxaE2Dwrx7gj1+3GzXUfm9R
	MVsvMoSPTTEUZ/n27bOZZkQ==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id adf61e73a8af0-2cfdcfefdcbmr6109106637.16.1758666032109;
        Tue, 23 Sep 2025 15:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrs2A71G+cFUsubAv+Vc1pQAa4dVVMm+2irnjFOxF6C7V/RXWnkIMo3dVaiu2z3htTxPtYpQ==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id adf61e73a8af0-2cfdcfefdcbmr6109080637.16.1758666031687;
        Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b554aa612e7sm6897265a12.8.2025.09.23.15.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Message-ID: <19bf97ed-3cb7-4b69-8d54-3cfef15f93f8@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 15:20:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
 <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d31d3d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1kqHEmTGbaOex8fRdXYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MJ4hx1cBUxFEP5JQiVYBQYC7oXpN2kAy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX+rZ5vTfqGUPQ
 m8fdTPW1nWHyVUojwahbMmru6tsDDyPXSdSot8QXHEl4v/wttWIv/M4j3bbtfXd2WrQCxnoZD/Y
 nmQYy81MRd97FfTCU8aC2OEccwoVzZjo6rjRRPgRCvmaXLTvCXTzQ+Zh9s1Fb6E+2WxbaWO7BDt
 5m4G+sK22LIJqlREDXg05CkiiaMMeN9evNZh7h4CMPIb2+WOQhI2M5NiK3LkzD6lXSiwFR7i4O/
 El1eG5529DB4IIVt4nZ+Ik8dQ3O/3/cRIlsq2ukR5k5TKCxaYexYi/q1L51E9t+rcMZyyx7+WAW
 E0IPK66Ms/xHeSQ3g1s4UdVxF0jzylTtGkh6dnDElHLAmULE2JPfAousB7nLiWcaEOOzJ9EXN2Q
 mC2ZEe+M
X-Proofpoint-ORIG-GUID: MJ4hx1cBUxFEP5JQiVYBQYC7oXpN2kAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090



On 9/22/2025 4:50 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 04:32:39PM -0700, Jessica Zhang wrote:
>> Since 3D merge allows for higher mode clocks to be supported across
>> multiple layer mixers, filter modes based on adjusted mode clocks
>> only if 3D merge isn't supported.
>>
>> Reported-by: Abel Vesa <abel.vesa@linaro.org>
>> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 4b970a59deaf..5ac51863a189 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   	 * The given mode, adjusted for the perf clock factor, should not exceed
>>   	 * the max core clock rate
>>   	 */
>> -	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>> +	if (!dpu_kms->catalog->caps->has_3d_merge &&
> 
> Well, not quite. If 3D merge is available, we should allow 2x of the
> clock, instead of skipping the check completely. I don't think that we
> should allow 8k or 16k just because the platform has 3D Mux.

Hi Dmitry,

Ack, I'll fix the math here.

Thanks,

Jessica Zhang

> 
>> +	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>>   		return MODE_CLOCK_HIGH;
>>   
>>   	/*
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20250922-modeclk-fix-a870375d9960
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 


