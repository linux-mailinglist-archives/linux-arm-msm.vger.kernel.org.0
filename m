Return-Path: <linux-arm-msm+bounces-54958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85CA96D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 15:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEDB4169EAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D948227700A;
	Tue, 22 Apr 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+stn940"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BFA27CCF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329103; cv=none; b=riHKmjodPf+1/51qKcPZCJYYb825vJRsQMRylrVVOr8D5q+tipPYqxnP+HFUNldfsInWycoCYjivAj6Pn8sXmdOEGhUdyIODjh0mbtXDOhdXEqEGKVcEXrkrCXC2HbhwjU4pT8QxMk5yhCJwEOcMqKqKaogizWP6L0PNl55/N88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329103; c=relaxed/simple;
	bh=Vo7LBJ4qSIokdM3rXBUtbQW8y1+BMQJz9X4whpI4Mdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8MQ3VY4JzNs1Ie2CtSSYikce+BsVx6g/Ri5g4QXCgCHdz38Y6JR8Wo3wWUJbtkVepeHLZTdECkl6APv1GMZMTP8pAdUzmXhBKBTSWZnqbkTtJ5NL43ZyAYukd0vwLza/jkzp5L8EdqlNbMmsg6fwFpyJfY1uuOxwV6xK0M3cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+stn940; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCgmrx025931
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilHPkZ1uHxo7brGrnzMpOnSz1Ev4aJ+rhxk80FeLFKg=; b=i+stn940t91WbXDA
	o5gYe7W82IjavkwiooQZ1/bma9l+Hv/5LvSTaO69FLB7g3K7YOjyGRS0OtBydMSD
	oMbjG/ZUPIjeTqRE864tgzV7t5QKJlC6VUEy66apEuKkeyyK5nkuuUwDH8t6f9wK
	NDNPnEQFQVhE7FiRmx5F7zdMbkOHB1wR4dcTddOs/umQKZ9exOYy4ksPAg60kNVX
	pVnSEPxqnhBs2BFjFLusEhjBoE7f7JzxaQcDoO+N/lUZw1CFhZ0KTcKX37VrYSdd
	tQzt40BXFCC5dN/8RHoJOoLVDNna+NMJyK7wvl+x8essW22rB8ggVrEXsu8iElbc
	6G5rKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjffg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:38:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c7056506so85592316d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329100; x=1745933900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilHPkZ1uHxo7brGrnzMpOnSz1Ev4aJ+rhxk80FeLFKg=;
        b=qrKQy6iQd1IhkcHUUgsF3z7+hd/bCbw0rAEFTIGyVZ0fo9c7cG7+0/Uz1WVnd1/qOk
         ZTCogsRjy1lMQpVtz2FWzBv2E86i08Iqmus0ZKRhCFfca+MzzgrlssL9fClLHqDjTjY4
         aviLrjpBXzJZKaMWfIZb6rIzGSD7aj7rEYOF4IC9bIFMpiXdcxEY5lE5mAgI0iRBgzIi
         Q2qnk3F5TkH4Sc7uTDLDl3NU6MhLPWrGLHJ1DnIqkcVfBUZbeZDITSh63yRVLOeXgF7u
         Cpl4ghxTjxIHGckbSGRaZbvqERtXobDDNFVs55LQhqKFNI5F32xORCSXMz63Sw44rbF+
         ONYA==
X-Forwarded-Encrypted: i=1; AJvYcCVIgFnXRbpLY3xL3Zq4JT7GN66sU/8t1MI2ET1vD9RJ0aCw0CMk8OuFdm73r9pMoonIrUZzuzBYiaau2Bug@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSAA6MuOrAHhgmGWCsv2RSjblooFF7dtB7pzIVOiJEcRUCsqH
	XFeCZ8nJUN9TGuMBfHgCN9RdtlI4eQddigrY6vkmz+1gaYrsd4bGEO2XGU2G62iu48mafJMHDSU
	HVIR12g1PN6bUBwDS8MQGGFlU1qjtxV0TWU4stlJZcajh8ngTVaR0l/F+M5vjhjZ1
X-Gm-Gg: ASbGnctutIa6f+JxGDcPV3xaj/N659nSIEzSVwzisMeb+DjJJNhsFoJ5d6lMYEv0f0X
	mHg+Kc1MUIoUH+F/Dy/MaV3TmRkWfqYP71pKDHy9uA5E8cp8imH7MWCA/RHHSfLz+yJy3NebOZE
	OzTo6UgFZUHLRWjIf9CGGATfObSzsiT70MUZ/BwLwHH3Pvzo56eNG93XzGiPvyfthRsNxZrJ8H7
	YbrpElRQ1lfPo6M43Qji+PHKBM3/BCX8LGaBPHyrpMpxQbfCmyjirhYyq/JnL2dnPgdeccfZQJv
	J/FbHbQNMgl9rf9uoP8J81r2ThkN7IBmGMVQNT3GbHj6kNnojf7Wnm3tE1bMs2MLTe1QPavI0iz
	HleOZRp4DOrBv7oSmAXFQWfsm0Ntux7DwSOYF2n7K14YvqT0+NC5h6BNFq+fqtk3D
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr209862476d6.22.1745329099934;
        Tue, 22 Apr 2025 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg1jhTk3vOeJXRA+sWOMATxjA7QzH73/aaZLzAmeAZgcQaBJj9d8Zf2ioNUSQsH0+gO0UvEw==
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr209862156d6.22.1745329099609;
        Tue, 22 Apr 2025 06:38:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a8655sm14444531fa.62.2025.04.22.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:38:18 -0700 (PDT)
Message-ID: <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:38:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
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
 <20250416000208.3568635-2-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3TkaHxG3KR6xiFyRtv_6aGtQchDHP53S
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=68079bcd cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=o0b5XE3H0qlelF4PaLgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 3TkaHxG3KR6xiFyRtv_6aGtQchDHP53S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220103

On 16/04/2025 03:02, Stephen Boyd wrote:
> If we aren't expecting a status update when
> cros_typec_displayport_status_update() is called then we're handling an
> attention message, like HPD high/low or IRQ. Call
> typec_altmode_attention() in this case so that HPD signaling works in
> the DP altmode driver.

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
>   drivers/platform/chrome/cros_typec_altmode.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> index 557340b53af0..c2d9c548b5e8 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -280,11 +280,8 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
>   		typec_altmode_get_drvdata(altmode);
>   	struct cros_typec_altmode_data *adata = &dp_data->adata;
>   
> -	if (!dp_data->pending_status_update) {
> -		dev_dbg(&altmode->dev,
> -			"Got DPStatus without a pending request\n");
> -		return 0;
> -	}
> +	if (!dp_data->pending_status_update)
> +		return typec_altmode_attention(altmode, data->status);
>   
>   	if (dp_data->configured && dp_data->data.conf != data->conf)
>   		dev_dbg(&altmode->dev,


-- 
With best wishes
Dmitry

