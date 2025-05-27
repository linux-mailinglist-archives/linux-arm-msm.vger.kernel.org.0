Return-Path: <linux-arm-msm+bounces-59607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AAAC5AC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496DB8A1F1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909FB28A1ED;
	Tue, 27 May 2025 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7KOfxMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1DD27E7C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374458; cv=none; b=VlikQ3SOF39bArCXGNTWRudE4+KAfSuxmzIPm/bW6o8e+ZDeSXMNF+n2Sl6m0HSpxGeFbW9SDmgEBSn/tUNON8Nclq4mV6aZc4p0lTtWLHm4y0nyMjRiMms5qFc4+EZGfckal7MVJEZ0eWf4gqRecJLydz9VwWRop9J9Cd6wlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374458; c=relaxed/simple;
	bh=Gim1EvixO2KOD3fkcQcxzVOp9jQUWY6RRDvJDoEk5ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDUqK7IGfFujboFiPK4gVOdp0Q7NrDNBTSOmOvFTnj7xt4y7e+GjNH9phpksh+aWdCokhuoJC43dw/mLL4TbvDhSJFbpOJmaA6H86q7HpsuTwysixZEDPHBCJdpY19FFRRkS75aTSn+G13wQ35f8hL2hjAVJQ+ZbaTe7vwHOT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7KOfxMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RC7sGx017822
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 19:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUJvkp2j6OioUYbp/N/L2xk2T6fTsVqGyrhvt5RQDrA=; b=f7KOfxMGfgVUsHGT
	k2dwXfNH0XREBIwF7qzgvSVgAHFz67XTm2Mw1M634Zh258+1wRvsZfr9cDhJE8wz
	erUPKCCCgqYcu20wCSiAjO9EztP6/zc073AU3XS3g3TKzIunrL81t7IOmnt6VkpX
	izg0cisgcw4JW3arrcNzzM1AzyjU4Y9vIYOzaSf3qeWzm6bhajscxxGttiJU3+VR
	P1Y9LgiNmThHUITWLY3bQnyjqcBXXtfBBE8gMRJLxbfwOulcZ8XntKditXw2WODY
	KBR08kN0yTX02L37UsWP8U3aKqwUugU4rdqn5IrBToQnYruB5s5JPfspwx/x0Ahc
	40fPFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wg7jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 19:34:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so25205926d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 12:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374453; x=1748979253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUJvkp2j6OioUYbp/N/L2xk2T6fTsVqGyrhvt5RQDrA=;
        b=wFVgUvMg1OJwZzErTyH0usU9AYDGckYPPilDfUOFOBh9cJXG6sL0qiPpCFzYUCABZb
         J3QOkV6A68/6tUvpYQ75TvqsdEPiappqQtc+3Cj3V9SpqKjc9ZV/sWQJP7qCBSAC0sgh
         wGeNNSS5WNgIc+KdO8rgyddeHw/lFQd3mu+Ph+CExxUQe3ejZX/g4BiHBehkY7Om/30W
         rDK4qN9GLT9SBwfSs8C4kUKOaRNyaT6oW0YcM69aZrq7Q6DHVXZzRJXIjS+OqDy/W9rG
         6gYauVOsN5SOHsruCG/d10dkMynIp0u08y9/conEIxU7LtsWUbHkLKSiMb8LqBBjVIZp
         3RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX60V0kbaWaPZf6+o92S81tqRXaGu06EraGRhtHzpPVwJPSE9oyHVuEZYe+dMad6KdfqcZgas5VKL8Adzb7@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSEyKKW7aVwgkdA6HPb1NRO9wBBE5kYQ9Racq7JCcDKkd9O44
	aRj3sKuzoKv92Hrzd/RWRzobqtHUSHmlUa2SrFhFHtrHYdUfYqjgL2xqUzmxvq2x1vg5Vhby1f1
	NbKV2Z4aKIUIfyfbyS3qNidq1hRgTlmES+03UobPcKVQXdh8CquuzK0sH4C36Zz2zjbnN
X-Gm-Gg: ASbGncvNmtHVlLaBrr/sbfniTWWge2ddS4BUTXn2AsgkFnqulDrAQlIosWzdYZrz2H/
	7sWJDkC3camri0aicDKd4AIvivFMLQZHF48Vzn4Y2BhH4zMoRWEy+ooBmNKmuDoJTUFNB7zWlzX
	OQKnpwbtm0E0RksK0xnRhD0vEFmivzOf/aT+BrQ57FWQ93JoXsabt3uMkGNpYzFKY+G8bwxgDgU
	MJbls83DvsnjmHnyhWdzt4w+BHThAWo1Za4XDsyEAvgjsFNJtFDTHBY99Y38DltkN6kXECWFk08
	MaSScczNIJiGQ3qR9wLwAIwzGgfhyRhJKv9VF8HOeUmxhOemJrYQlobnSdvxAq+n2Z0vGurLJRo
	=
X-Received: by 2002:ad4:5f0c:0:b0:6fa:ba71:9851 with SMTP id 6a1803df08f44-6faba719f3cmr24651906d6.34.1748374453320;
        Tue, 27 May 2025 12:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjlh7IJ1HPf8/Ye4KqMKhjhW+XesLiSZ6cwya1THWS+oCZUq91KslQK5TLzdgt+AXUqmiwA==
X-Received: by 2002:ad4:5f0c:0:b0:6fa:ba71:9851 with SMTP id 6a1803df08f44-6faba719f3cmr24651516d6.34.1748374452953;
        Tue, 27 May 2025 12:34:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8f21sm52046441fa.81.2025.05.27.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:34:11 -0700 (PDT)
Date: Tue, 27 May 2025 22:34:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil@vhh22j6b5cvq>
References: <20250527121807.3597061-1-korneld@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527121807.3597061-1-korneld@google.com>
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=683613b6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=1XWaLZrsAAAA:8 a=P46Q_Kkv9e1Fnqp5vpcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: IcfK2EtM_OYSNogFuZpok_kqVEhjpiZb
X-Proofpoint-GUID: IcfK2EtM_OYSNogFuZpok_kqVEhjpiZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2MyBTYWx0ZWRfX20k1aA4yug+A
 AfHGGCXOBL6nNqV75ydH7CxMMs6vyq+kcGFrREg6j2RUcsCB4hAdBVaVre9jEq4Icobs63AjSpp
 CF4bj2P8uG3sKYHny6Ez+i1KRz1d96aJcjkPwHg3QS24u6VJvn30BN44ipx/bcy6NzmVPgpCQvq
 8f2C4o4RH6PtSNgt6raG4mPmInOHKpvBa7JpQRh3MzruDPzUvVjE6GkSEjkusNLVIJ7OTIiLmo7
 nTDBBADucZT5scW6x/SODYeHiDP5rW9VLH7J+t0j11NsWhpNEHAh4AF6IMFamqHqaacdpwt13Tk
 SzUNnBgsgsQMmdFfF7uvVRmqN+iXT/VPOCGDDEysobKkb/9S98MQbI7JCUxuhZqK2iN+JtPPIjf
 Ez0iSjdKOR48AtAAJsNWy55GveZy6z36Gf5CIUQqlPAlibLjZE9LfFCtrluc2gflwJqxIKL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270163

On Tue, May 27, 2025 at 12:18:07PM +0000, Kornel Dulęba wrote:
> Battery charge can be reported in several different ways. One of them is
> is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> power supply API. Currently the driver reports the capacity in this way
> on SM8350, but not on the newer variants referred to as SC8280XP in the
> driver. Although this is not a bug in itself, not reporting the
> percentage can confuse some userspace consumers.
> Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> calculate the percentage capacity by dividing the current charge value
> by the full charge. Both values are expressed in either uWh, or
> in uAh.
> 
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index fe27676fbc7c..5ed5452ab51c 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -577,6 +577,8 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
>  		val->intval = battmgr->status.capacity;
>  		break;
>  	case POWER_SUPPLY_PROP_CAPACITY:
> +		if (battmgr->status.percent == (unsigned int)-1)
> +			return -ENODATA;
>  		val->intval = battmgr->status.percent;
>  		break;
>  	case POWER_SUPPLY_PROP_TEMP:
> @@ -617,6 +619,7 @@ static const enum power_supply_property sc8280xp_bat_props[] = {
>  	POWER_SUPPLY_PROP_STATUS,
>  	POWER_SUPPLY_PROP_PRESENT,
>  	POWER_SUPPLY_PROP_TECHNOLOGY,
> +	POWER_SUPPLY_PROP_CAPACITY,
>  	POWER_SUPPLY_PROP_CYCLE_COUNT,
>  	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
>  	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> @@ -1063,6 +1066,21 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>  		battmgr->ac.online = source == BATTMGR_CHARGING_SOURCE_AC;
>  		battmgr->usb.online = source == BATTMGR_CHARGING_SOURCE_USB;
>  		battmgr->wireless.online = source == BATTMGR_CHARGING_SOURCE_WIRELESS;
> +		if (battmgr->info.last_full_capacity != 0) {
> +			/*
> +			 * 100 * battmgr->status.capacity can overflow a 32bit
> +			 * unsigned integer. Do a temporary cast to avoid that.
> +			 */
> +			battmgr->status.percent =
> +				(uint64_t)100 * battmgr->status.capacity /
> +				battmgr->info.last_full_capacity;

Can you use mult_frac(), preventing the overflow?

> +		} else {
> +			/*
> +			 * Let the sysfs handler know no data is available at
> +			 * this time.
> +			 */
> +			battmgr->status.percent = (unsigned int)-1;
> +		}
>  		break;
>  	case BATTMGR_BAT_DISCHARGE_TIME:
>  		battmgr->status.discharge_time = le32_to_cpu(resp->time);
> -- 
> 2.49.0.1151.ga128411c76-goog
> 

-- 
With best wishes
Dmitry

