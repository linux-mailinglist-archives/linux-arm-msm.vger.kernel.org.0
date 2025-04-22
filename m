Return-Path: <linux-arm-msm+bounces-54957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369EA96D08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 15:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6040A16514D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8B720D509;
	Tue, 22 Apr 2025 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeADmndm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEA226CE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329080; cv=none; b=Rr5cfIzq+Cad05CBfCmQfNsp2ElJBz+PVHN+HAA0YkPN74IZ0eeSRV82s1jD7DRtbzlWPodgy5BUMrOAooV6yh2i3e+HSws+zJfKU21Dl+29GL8Va8hVCBnjFcOtyJtqcPfu+WInU4n5WFeF4QSwzSZmB8FxcX7aC0/21HD3Gfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329080; c=relaxed/simple;
	bh=hs/KULLT3NdIW9FT/4EVSYghokrCjq2zBPZXmtOIrKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCiCTMByygyLidNyj0eqHaZ0f/EPEEIXzjS4z0HO8Xazr9+ZOy/BKHXA93+Mv4DmHro8cjVMEyNZGLUlXGn7i3kGL9gSQB1TYoZvM9HZcUk19y3aIUODzf/u2rcHL64iJ2inXWOlC1m5MV5eXtEmemhswTI9Gg025nbRGO2hyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeADmndm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCiIhn023515
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=; b=aeADmndm6tJVAhfa
	m9hM9FuJQrSmny9BgTCNxJOzoQ4Aw0p46VZStJpnpYi2iHC6Uf7qzzbtPoeXWns/
	t9+vw/E2i5quOOBUxOH5tDxkVDOnyHBQzrXTL6s32o+o5aW7o+nAMqgDCjtDk0FK
	/6/x4n2i08PSmMc+U80uLETxgAvNB5Ls9QSsMz8AGZOs5FXgJcxp+WL8i1XJL/bu
	c/VfwFe7EMjLn08xeMb0fkm5d5aYi8kiBe1wh7IttwgLvmTQTFGE+GuGoQlQR8RQ
	LDbFA3VGPpC0MfsvUgoiWPCjhVFLNvm1kP6Y270XVq+2eWTuJNfGFsj/boJjDQ9V
	I5VJmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwqrmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:37:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9450b19so111155636d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329076; x=1745933876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=;
        b=sVgfE+h2diSSGcVGqGkX3x7KVwgNT0MzS0Aj4NLJQQJadt8emVX+kf0SdXbOeaBXqW
         qHcQGKnSHy98DNsL48KiNDAABizMB+PHC0S1VsRuXwqcziNlAivOycpcQg9npgSBWcAg
         XOeWFVqToriirye+bX3h3H2v1gpg4mypwlIVyaXlnQcGVn0998uiOuP1Arv7PrJLSu0/
         WuQS/2sYBIIROa+BMPBFG70QNfCtZ2PxkbXvQBh+bi9yXqNndpE5UkfLHb7ot1A2F8JL
         fHLpVUuYx4FkxiqAUIazUfwajtiY5UpMYmxsX0M5l/8ZUONJClmdylg+ZtWMzDG+uP6k
         U1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWbUj8iCD+4AbKWPW5rnY75Fd3zkePWE7fNjR8F2FyhwBE1V+Mb47nFDrxS7LdWJ4Q5ESBsN0CNfNiY43n1@vger.kernel.org
X-Gm-Message-State: AOJu0YzAf4jVsWazgXmRLnptK0h+QnSKG3hi7DcQufqcYtguj7Xlvo3o
	clo2S2LnOuow4bxchzgnA8qzf6Ixa3DAPpwmgL38ZVfzDsCF116jao6wJFpbs8JLCSRDli4eD/Q
	XwJpAVd6omP2xm+p5eULpdlajd6283NoGtHYymE0IyK/ABzpVyRRslHzvcezXsOjlk5pQonAA
X-Gm-Gg: ASbGncumW01IbSTJUZTclp9XNRi/UusZeLJYLRNCWwUp6MarFvQO7ibl/ydFHZlY+3h
	Lnh1oZJMA0JIQpacNf+4PjCj3yMXGwb613dB9Ja78asRKIaxBiiSGOEiH1ijvB9LZvOWxBd6Tsg
	Z58InZ61ZGrlZ8UnEe0k4hnwUcGcbLADKqF6VUEXVOSGUAUe+y2VKgGlAMsTeISPMGBr4A2+k4T
	dMdcC7r398ow88XEQR87JH7/7jrlXcFm5hbNNGFsVCdbTj5oH0Vpo26IGWKHfbT8YIvVbeWel07
	b1Lso6geTNiqYaZ4PDek2rQRdohy6QxHR/nqd5c44F3RAFN+3jGUrITSz6FaXbS7P6en9N+09T8
	NpCenY2Sqji8CLCMyJGDsSWK0IiYL5o0BP93vg88qyd3EuS/j3Ko49p7Hf5EQoSgh
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713756d6.12.1745329075729;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs5xmFsFakaRJU+iwqHLQfYpkknb90+sqtIxpjfjRPKBSqlIlI7xF2xKWLEcXvzJJAnoNEDA==
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713396d6.12.1745329075396;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm14805871fa.97.2025.04.22.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:37:54 -0700 (PDT)
Message-ID: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:37:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to
 work
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=68079bb4 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=3E2bT0mqOhGjLt7avEEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: WCcuoKbRSpzRam3xd-kKhmjmKq8vtXol
X-Proofpoint-ORIG-GUID: WCcuoKbRSpzRam3xd-kKhmjmKq8vtXol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220103

On 16/04/2025 03:02, Stephen Boyd wrote:
> The DP altmode driver fails the configure stage because the status VDO
> that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> them so that the configure succeeds. This has the nice side effect of
> properly reflecting the pin assignment and configuration of the DP
> altmode in sysfs.


Fixes?

> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/platform/chrome/cros_ec_typec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 6ee182101bc9..2cbe29f08064 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>   	}
>   
>   	/* Status VDO. */
> -	dp_data.status = DP_STATUS_ENABLED;
> +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
>   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
>   		dp_data.status |= DP_STATUS_IRQ_HPD;
>   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)


-- 
With best wishes
Dmitry

