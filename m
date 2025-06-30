Return-Path: <linux-arm-msm+bounces-63098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262BAEE425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E876617D53A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B60119924D;
	Mon, 30 Jun 2025 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti3Gh2d4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752BE28D841
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300135; cv=none; b=ZBr1SHTkbBVQUU+F53ltJQ0auEPTF/GI4Hjj7puyl63v4eCYqpbKUByBkcGS/GsxetY22BslwEoN+s4OHCizvZwBNMGCIq0CXFYMX8itY9PVxoIIWklAKuSmLu+gJI8K02ASZn472JiP0RIO+xfuiOcD086vsaTv6Pthg7YsokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300135; c=relaxed/simple;
	bh=az5QUBg3paeo4O+KQL7Xcce+9nwdOOaSJbdP+VaTk84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsEgkCZaBzdWjhT+h4QApdDRDKcOF1jE9pc/A8BQyWTSOHb5NMw5iBwt4xAjK7qoe/n4i8twvcd92o6zPREwpaDl9WjAW12M+vOz/q7QOL4JZMQkmdFzVi/Ruej029Jz7YDTA18Bpx2cRsycKqc/guRPH80MBZccHTxcq9ZgQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti3Gh2d4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG6XYe025086
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 16:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=; b=Ti3Gh2d4RQmncd9/
	egBI0ZyWLS8PHaIpmdWutgtOIc3QymidjFS4CkKnNfsXy4hPkk7D5s786Rifjs2t
	Hoz5WJYmmnx8soCWqG5GcV9dEDbnVldPM/VKi6vjwEOw2Mv3cV1wyQZrheJDrc9y
	Cc5FTZ68uFHG50z/PMBl0dfV7O1MXrkwGj9supMJX5TG8ZMjVsFSSSl5jULK0Niw
	hlSvwsuaJzQOR4hsOaAyJztlWq/Yy2WJoZCNEMvnTIbl9qDH499SPjk4czakNZxZ
	Qhw0scVLkyGwfKcA0V/sN73aBVXcNwkqemsT238Z4k2enr53zIU91Y5k3x+x8s6J
	Nz++nw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801wc9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 16:15:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-236725af87fso54709915ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 09:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300132; x=1751904932;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=;
        b=bL96j0KqLdZV1aLhCgVyyQbcEPFTVrrTfh17Fp4t3YaanztudVXYdZYAgdEINF+svN
         V/eGWfEAGn7ASuAj/x8k1YAJS3yKz8S9xkcfe1kPx3Oantupb4belOQQ8eM0DPgEVSry
         crUC0qcbzerry6mO/FJU8LrJWbKB4LKr2k2DBGxHF5GXmtOUvnoM2DLegTZniGnSVhtp
         jFAGODhrGc8csy2UA9AsqX4bqWZmk3UYePzsffPu3Ayn8X4NAPnBgefX5BA2IxH/2Gpp
         5MLgP33U2DcMYZfraA53YbhtU1VQjrppC3WFUs9CPwjQEeChRz4PGIR7IDG8kvRWLJ2/
         P+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+RoVDGNx8lMZPWuDwBLRCwl2Q0BIFZc/X1TnKwzsorHOcPyEtxRsOthLAKapZr/OaCcwxaCrD+WeF78QU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5q6NE1HdM5WkPTkYZe/qKPlsXgOMqcOabZGoDDzKmLQKibu45
	Qqcuebapdnag3iW8Fnx0zx0CehklaO4d4m2fnKUsBrC763VMoOCiw3/VpqZw3+zyWECODfr8BaP
	Y0jXINK2kxSnw7ijdB/S5NQofxAxtnjWyCF+foh/MObjXYL43DIGMhRVOI6vM7ERQ7mWA
X-Gm-Gg: ASbGncv06Fn6ZWeEC5rxzqdCbsstd9hruih5ljVO0+XEMTfL3gPmIeFWcYvmvgmyfWb
	eBe1DPLG8jIAQ8I2Lc0O7xAf2k2KRG8OiTb9AUzkCv6DSLc4m8MkCnapoICrpVg3hQQzgxjb3+n
	CxRz54Tf9c8JddACLXsgvrZlqCEkaH7orB7H2mEDpz0WN6+TI2YCRMzftGY2D+Mo3CkoNhV9bU7
	E7rleNKqBFz6uhGQ7f5sbm0nbwWgZ9xTJi45kBT3dTOg/IwoojO+YlzUnAe2v4uh7RSAXZpW/22
	LIZf4PFd8UN9p5JjYE561N60ifBGYQ9BsvIPWIW3TBM=
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr209862055ad.17.1751300131830;
        Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIs3i+DGQtrPZJHgDp38If8o1rdqI9yiRt+U4S1ECjmkidu5/g+aW0XIiSH1eCUSC/7H2oZw==
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr209861455ad.17.1751300131259;
        Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54417f7sm14678037a91.45.2025.06.30.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:15:30 -0700 (PDT)
Message-ID: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 21:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Doug Anderson <dianders@chromium.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4nKbqvbnomhDRDeZ5hKU0AbQQpqdBVtN
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6862b825 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=rtNiIixKYgeDUDJv+u67mw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dp0Al3FcNReu_-gFsVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 4nKbqvbnomhDRDeZ5hKU0AbQQpqdBVtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzNCBTYWx0ZWRfX/nGdUQRAwTkJ
 5pJIl8EuzUTFuDmt/zX75nVF7t2YK1rQCfJszHDL5WISstqERf10g6kDGOTFDvIMLE8Vh6smQFL
 Z0bG/3/Mw9mhbsb2Qsm5bU/Jnb7qPBzz+mmR9+7RW5Jm1f8RZ3CVixVoLfDvfeYzFLsDJZd1FrX
 eBYJhfg6Vxs3v5VyOsSbhADUS+V2vppvAPlXgBfdgs1qvQXXRQW2lWbpHjvgsAN+5BAVo+0uiqC
 +PYB+p+dwkgx7NS8YmrqPx4uUMO0owsEf7503InQTbUbfdcFVJySzamnpKab/THmPNx2l/hj/ao
 tSWqizbqIMieLFbhGf7TyiPTm37pIUU+8ZlFZdElLXmIY8pOyJFl5bxh/Keo5ngMmwTwAYssOY4
 ipPSysqXpK0wlbONudJjZ+R/ePNeVWM8UFSGlkkWF6iRGUgsxmkrAu2BFC+Mr61/mPYajKED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=746 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300134

On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 15:46, Rob Clark wrote:
>> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 29-Jun-25 15:58, Rob Clark wrote:
>>>> These runners are no more.  So remove the jobs.
>>>>
>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> ---
>>>
>>> Do we have anyone using cheza at all anymore then?
>>
>> Probably not
> 
> Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> get rid of it upstream, as it never made it to the outside-outside
> world..
> 
> Konrad

I am not aware of anyone using Cheza boards within Qcom. So it is fine
with me if you plan to remove the DT bits.

-Akhil


