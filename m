Return-Path: <linux-arm-msm+bounces-60074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEEACBA81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 19:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE7D3BD3E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 17:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C121E9915;
	Mon,  2 Jun 2025 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqAM8tVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B06617B421
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886860; cv=none; b=MuZ08FY2O3Xbrv0Qaae03vhOfW11GeN8svATD9nEMLFZ5TXRXXLH0/w3teAzmMz2fWpaMkdyQrEPb8o3TRBZzKkruFNPrnxLI3LG4PJZKVBCXkzr/GwKW/vZZpqJtxWIzSPvefDS842b6KgQcIDQDF8O21/IXAwFdBqejojsmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886860; c=relaxed/simple;
	bh=rQaFfjBFw2cNf12AuPRlV+vlVTZ+cZahtbK7eGhXkZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0Kk8wFFd94lfuZ+l84YJ8GNJkdHe3t4mGecDNEAfSPLrGpk/NbFYSafZ+94kyTA4MAOKJ9It1Da12nsPJKCkFbUv6GA5zOWoujcXwMkHAAa227CzuScsTSPskZWzMQHltgtwN/JTZxzcSS9qQhf9CZKcVgbNBx8zpSwi4jzcl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqAM8tVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJvgW019012
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 17:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=; b=GqAM8tVufg5aWU3o
	Zmu0odxQY1VNvlCf+uN7AKQEugEbd9BIpuad2THHcb7yvWnSxFPzI3kQF+qXNr+w
	YnHlHl3D+4JJLYYIbRe27U3EpVQr9l8YYZzA+8aU/PeaI1TGmdPAZmCcQIZt8qGD
	xKD1w+vMDs8BpCD0OzvnMrmc+Es2BMt1gAo5Nwp6X/7l10VHrLYcdrnUOoSKUlVp
	o6mTyJLFQEGuhuArQ+0llqFUQvDjPI34JOPMdRI9RIxcLwzzQeQPGwpDHMfFdzvC
	TgSjunoWGpVLzrEi2uBAoho4FY6naTF2EzeoTkEuZSc92FD/ZPf3tiIdHvg6zNVh
	HSoddw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8u82f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 17:54:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349629fc34so29953735ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 10:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748886855; x=1749491655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=;
        b=uQjhoi1nIJIq444/GAOQPp7YZ6j+u30WXgXnHrhPy2DIFnpAQ0VHW9GLyhVPC+aCqd
         3oqkcerOtffV9+KDzHTVchdYuELY7jZtoQK4I+NFNrqwGCKIlIetqBtcxgZBI+/XURpL
         LXwObQTDXeuw5jbrAlSr01aU4wnQ9o4GXgRYAyxPndwevDGKkJGc8ucA+W/6Sm1VGLaR
         e22xxy42giHP0wAxz3yTGnSJdqJP4bfZRnHODNouxxa9CNeZlyB1JOdzG2BmJwNcOX49
         I7/1gfioiI/T6vlQSj6hjHzCjx0wsYLQM4m+Lq/0m0L2xlngCvBHcQxKxDwtdCOvOg7I
         RTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM+xUdB4Yf895IYHfXRxL9kjlhYnz4Wv/zz+0d9743yK3CK7yjzXXyiEktOPJ7J80wLj0N4HGEEI7a7CYn@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCB/CgQJFNNZ4FDk29FfhJb/0GygtLB69rDqkEa1KePVxeHiA
	YtR3utWCiHAe1cg38a820g6scLiOzQ99ClDNA3m1OYhb5lINfNqPgJkkLu1Evm4m6+xycY2c07Y
	KO38+R9cYYR50wvVUlXYVpo6cw2fPCAkeu85e1EAdw1AzVzaHnMyrg9vURomXaxZHX/oV
X-Gm-Gg: ASbGncvA2ght6dTkt1SzsEh0DfEygfsPUUAcLwlJBUJGyfHjMjvqBNxHe50qFcflTsZ
	6FilJmuQLaRrXPincQFAbf3VFDlzST7bNn/Xb6vi1iLvi0GBmFdrhrqhx++NWmmU5yFDhvYQu7C
	3o+n6TEK2fYyvSL+L7QGAW2Oj5AbTLv+31FacnlD0ZFAzX9teQ5ILnnOSoPpkV2vCHkLyeWWpbz
	edx3aVv+hXnDxUzCg9ntTstDXEzVkrP2mxgsNjRVRneQobxNEZx2aCr3rU3GkCrPBLD2YTzLjly
	D7S3tG/ngu8R0Ps2wh6GrMltv8TWm/Z/fnaUpn18lemHL1kba4utV5CFTo4EJdFdkHMSwg==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id d9443c01a7336-235395b1df0mr187796105ad.24.1748886854611;
        Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnVKXZ0LTtvyZS3lGmVIwCTIOA+EO1ClF4BKT3ba4Q6ILhNwe3yQldHpOCpjXK3ErOrV831A==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id d9443c01a7336-235395b1df0mr187795645ad.24.1748886854172;
        Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8a40sm74072675ad.2.2025.06.02.10.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 10:54:13 -0700 (PDT)
Message-ID: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 10:54:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson
 <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE0NiBTYWx0ZWRfXyLCPDNM1pEHF
 lQp9b4oaICn+KdFBBcPw6jY1HkzJgKhsAd7E8jtTPqZfd/bsln523g6kKxymxf+KhfhAR7Q8H3y
 A5rU1XshbxnUtxOgaIKQuxbwv3o5RUDU5bXeJhb61uVbdn+85l9jIwNig8esth4j57JjU+DyRYw
 GlIra3QNXCxntS/jxN5xXd6FR/S3pfdTCWucjq+JAwaPCtT3p0rez7QEwKBuxIh9aoj0McD1rsJ
 nQed8G3nRsKa9nN+ZSS9DK3n8a1Q8naF3oO+tKGfp/jNnZu0bmMAGaQvoUvcJGoZ4cIJXL5Kuny
 m0sN/+bq6T5r6ySWvjGq7cixvCFNPkHEfV8a6ONIqAkCoI03lOY477WSi59y/ct4kDPMT7IhzHp
 D7P6el3bqWQA6RLvS19YWuDSwVldLKgV5qxFCgfjFZ+ILyNP8MbDUq2BLve2zbQJs5DNFWv/
X-Proofpoint-GUID: ZHqPv9uGpJPJ4hNKtMwjMmruTJvHfRsT
X-Authority-Analysis: v=2.4 cv=EpjSrTcA c=1 sm=1 tr=0 ts=683de547 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZHqPv9uGpJPJ4hNKtMwjMmruTJvHfRsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020146



On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>>
>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
>> msm_dp's atomic_check callback returns a failure if state is not
>> ST_MAINLINK_READY.
> 
> What if the state changes between atomic_check() and atomic_enable()?
> There are no locks, cable unplugging is async, so it's perfectly
> possible.
> 
>>
>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
>> there is an atomic_enable() without a prior atomic_disable() which once
>> again should not really happen.
>>
>> Since it's still possible for the state machine to transition to
>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
>> this check to return early if hpd_state is ST_DISCONNECT_PENDING.
> 
> Can we really, please, drop the state machine? I had other plans for
> the next week, but maybe I should just do it, so that by the end of
> 6.17 cycle we can have a merged, stable and working solution? This
> topic has been lingering for months without any actual change.

FWIW, I'm currently working on the state machine rework by the middle of 
next week.

I'm anticipating that the rework itself will take some time to get 
merged, so didn't want MST to get delayed more by this series.

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1d7cda62d5fb..f2820f06f5dc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>          }
>>
>>          hpd_state = msm_dp_display->hpd_state;
>> -       if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
>> +       if (hpd_state == ST_DISCONNECT_PENDING) {
> 
> 
> 
>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>                  return;
>>          }
>>
>> --
>> 2.49.0
>>
> 
> 


