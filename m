Return-Path: <linux-arm-msm+bounces-53595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAAA817E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 23:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA7C23BF791
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 21:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405A11E2843;
	Tue,  8 Apr 2025 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHN20sUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B0321ADC3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149104; cv=none; b=m0xQnR1KmRyRchQ16gm8kFPlQw/eA9bBzGq0MFt7XP5bDHzIZDGuDyVTyzXI373DXzvkzJAEnhf4xXoi7sir3uD+zbWhIIjYyrigbsR2fnvoQ6oP6lRBlP78LPBVkZbPRgRjVODtQrG/e9/G9Zc8icmnkVLFKSlT72aV+iuEKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149104; c=relaxed/simple;
	bh=SO5j5WgpKL3BcXKO5kOdxByCJcvTLcn9ijCoQY04dpQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qMg4JhaqBlHARh9vOIgjkqZs5/zf1MnGGZ6p/grd+IWL3gIj3IsVA+b5rx2R1vUsfFzVuWR/NZduMxCSf9vo19wLHZqPrz/YmtXZ+0DAuZWYgsICeH7oe6czfCdVAxOV3bVSXmB+J5Wrmqge1m+ZfwgI7RMIL8y6Y1kh2vinaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHN20sUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYq3s027508
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 21:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qYMmx1cwwXQQRUe4B443jnoYMCJS9Y4BrBHvddUYs0=; b=fHN20sUjyr6/tJLY
	VFhatTXDYbz76Q0DK5zR2QYW9X9Y/auQ1nlJ7HFpRTshffjRlcLSirXqIxTLYqXN
	w9ZEOnVuhOGlCcoyLHhIlt8tdrbPluKXVrQurRD6TS6/lva/R+tq9uDsvFZ0xQ+Z
	a8oBH20Ljg9CewBtye8yMMArv4aaBjMQDRJ5jO0eqoUpthRtmP68Ac4hWhMDDm5g
	y/cf6cS5DuNI8wypYHE7MXHll3Esx3tiBVKMMI9PAOg77sogXsoWndhNgaO91H7w
	ttTbf4MUUpKSARWg9BevWtu+FFt5XOHTPhBZob3Dbve218YHPWsWynBBu7NIsiLf
	LJtPTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrha7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 21:51:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241e7e3addso50011895ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 14:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744149100; x=1744753900;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qYMmx1cwwXQQRUe4B443jnoYMCJS9Y4BrBHvddUYs0=;
        b=TLw2NkV3LIuixJ1DiuqyxFkjDuFWX58LPKvRAwCGaPqQBECTaqbvVDImbrUlBHMPqI
         ldZR8qUvJz4l+5QXDgoqOGvtR9vQR2ynKkRUlw8hWSmzsV1Wi7ciX9lH0iIaNEmByBt8
         Lf3A5D8KG9VzvuVm8MHd5higbIM3kCZn5661iqjBJAnAB3PNQemAXiUWQhdPJDcfD9DX
         I+cy+czmIP4reFGRFv+kma5fhcI7S3aBcYWtcmJ2VdvTybB1F+yGetxYFUXIHbHG6syV
         l2Vuey4UbNDCVygqt1oVOqaPWmfuKCt1eVIASxvAowZ9r9hsQj0aw9/DSZwQ7f/sXrSW
         uNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7JsluYdzV5yznB+aUWGEAnhtrqVczuLgOa3C+Vhwn2s+3Iug8S8H/F7tj5WvAaxMb5Flq8+iRUAEXneA@vger.kernel.org
X-Gm-Message-State: AOJu0Yygby9IBd9hptTWKb+3QsncAXxW3xFiAECOnXQdWqQUGF8cwqTa
	aBT1HbTkU+KBH3HlhbpmFXWLH9A38DdZwpjMbUeJsQTRswmHoS3tscAB8zHKBmGgPYLqSBQSzQR
	Qh8Pmijnf+0mpl8E4MvL+jH1Xmc4a0BkgwXpUwe2XfezsAIpEN9vdGPQlQdO4W3Fy
X-Gm-Gg: ASbGncslyqIqa+egsX6FWm0//0IU6vbBrb4NTgtxOW7GvjXcRDS8jHIfFslwIsv3sOf
	bgosJGrU17MvvCYIRP1WZpSCep//OfTUv0DcpTIN+P2FGSs5Z6Z/0FEPXJwqUTFCxOO2vFcXC8V
	w7dIlTbLVqYJTZE78vvHPlS3otGqxRhiSHY1LCiVqTn9PqYapZKsYktB9iiHyjlNzUnwVj6toFn
	c29kc5XHK6q5b6nuSRqxviyizgyhZtNtwJzNxfOqNp0gei7sO8UM7t8iK7twq8hcpjcke/lQleu
	P2f+WqdjAzlTzceUobg8ty02helT60Z38Yp7HZr/Tuq01tsMu7uPlLdJhnkgpqlRSOCpKV5Cw/V
	4Gkl9KA==
X-Received: by 2002:a17:903:1245:b0:221:7b4a:476c with SMTP id d9443c01a7336-22ac2992a09mr8608925ad.18.1744149099655;
        Tue, 08 Apr 2025 14:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCNranT1CO/GEUVT0ohp6e+mD5pBJVFGlgN+QUZlRKj2YbWbEFTNk7ni641yJ3KvIeudhivw==
X-Received: by 2002:a17:903:1245:b0:221:7b4a:476c with SMTP id d9443c01a7336-22ac2992a09mr8608705ad.18.1744149099281;
        Tue, 08 Apr 2025 14:51:39 -0700 (PDT)
Received: from [10.71.114.173] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ada60sm106004875ad.3.2025.04.08.14.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 14:51:38 -0700 (PDT)
Message-ID: <de34c654-5b9c-4c21-aee3-e732f6ed374f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 14:51:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5 RESEND] thermal: qcom-spmi-temp-alarm: Add support
 for new TEMP_ALARM subtypes
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F3M7gcfch7YvpIs50fMhI7JBHZkUal7g
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f59a6d cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8 a=EUspDBNiAAAA:8
 a=P6RHbN-0fNZ3JhbA0IsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-GUID: F3M7gcfch7YvpIs50fMhI7JBHZkUal7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080151



On 3/20/2025 1:24 PM, Anjelique Melendez wrote:
> Add support in the qcom-spmi-temp-alarm driver for the new PMIC
> TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
> subtype provides greater flexibility in temperature threshold
> specification by using an independent register value to configure
> each of the three thresholds. The LITE subtype utilizes a simplified
> set of control registers to configure two thresholds: warning and
> shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
> code reuse and if/else statements when deciphering between TEMP_ALARM
> peripheral subtypes.
> 
> Also add support to avoid a potential issue on certain versions of
> the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
> is disabled.
> 
> This patch series is a continuation of older series from 7/2024
> (https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
> but current series has been reworked to address the change in thermal framework to
> update .set_trip_temp() callback function variables
> (https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)
> 
> Changes since v2:
>    - Updated function name to include "gen1" in patch 2/5
>    - Added Dmitry's reviewed-by tag in patch 2/5
>    - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
> Changes since v1:
>    - Remove unnecessary moving of code
>    - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
>    - Updated temp alarm data function names to be consistently named
>    - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/
> 
> Anjelique Melendez (4):
>    thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
>      subtype
>    thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
>      Alarm subtypes
>    thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
>      peripherals
>    thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals
> 
> David Collins (1):
>    thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
> 
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 515 ++++++++++++++++++--
>   1 file changed, 464 insertions(+), 51 deletions(-)
> 
Hi Amit and Thara,
Can you take a look at changes when you have a chance.

Thanks,
Anjelique

