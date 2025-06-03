Return-Path: <linux-arm-msm+bounces-60131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A3ACC46B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6341650C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0F1221F06;
	Tue,  3 Jun 2025 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMFYrqY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820662C3250
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946946; cv=none; b=eNQ70rDgB7b6H8ljLWXAg9suI/yJ5kIq4GSq8jK7UoEu+f0OG2/PQrDzNF8aFjR1GgWI+uSHCyTWNmF4t0Uuj4ho9lmMojrvR9UxIpR+ee6fmrPbdiCzg8z3n/b9fKWgaGPSDVZ7CqDiiFBeBmWZSmv1WND1ooZ7swJ3i8nyvG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946946; c=relaxed/simple;
	bh=8BSx8hG7e+Sa8wiL1xLVnVmH9RmhWOKPCzG1Q2KWa1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSI90dRIiAFbYRJlruIM1Y+B6xSM/I8hTsuwqf2Pe/RFbSwdJBTcmcgqjms3+Rw7cpFcm/gB//UScUuPO08a/nyfWUlTOA5o4N1zcf/XxLDhFAdqzvX9stlj3SB569+bPki2nKEk1dEpPJDqrRfT5f10bcZtAhLGjSscp4jdX90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMFYrqY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JKaR013530
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ENKaMLcnNd+HsLvJhufWlAMm
	Y2ISC1qjYbmzZ02Ak3U=; b=VMFYrqY+ND1+jxv77tSBuqVeY2Krl7EEQjr9Jqjz
	vTaT7wgPsyY3cJ6VI12gFDtHLMKgaQOfHNfaJdriKnhB1fRn6dUfhVYfOMUInPZA
	+LrG7ltCNcEolV4aYwIiNjlS8zuiMmy4qmLcQC5HJ6wzLEBXgyl4lyC2ETWxnFnl
	LQdTyzw+wR66fC7nOOdhfeU3l+i7Lyzf7bWsab1wvQjtuKH7Jm8MgnWkHJuggWpG
	as7g3T09Hn6OIvQmvrKXVmc0GMJjV2VnLp1X++m/yaIDwWZbvcjPePVRicG8RBkX
	RQ/VIy0axCOIx9v1muMeBpIYjik5cLmLaPUmyojUQsQPuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nj8k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:35:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6face1d593bso91718396d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946943; x=1749551743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENKaMLcnNd+HsLvJhufWlAMmY2ISC1qjYbmzZ02Ak3U=;
        b=aVTaHMCSGXcSgJKp4cxKIU4Qg+Rrhoix7IN/ZqTipPDUnCF8yY0qo7YbblxdlSTOSz
         pVIBzxPTdD26LOuEdmZP64DiH0Mmd5QIlcPEJ+KHNaFNszZbvkdwtZ4FdNNWg4t3tRGb
         a+TUcY9MhTK7ltmzgT0xXR9n+0JDyORhLV/Q8tpJazILtiNbxKY2J+M9tTI0rcvSe0+W
         tYkDhVqoJfwKpgapf5EEW+pZ+whAJgFSKi3mRXUpkYedlA8V6C7zs9kzuHMCAUEVdCiw
         urdF1mfFX3OUPANtX5NK7nrstZTP+4XgQwdgCSoRglwR0BKeM/JO8C2KT3cBE8Qvs7IY
         pWxw==
X-Forwarded-Encrypted: i=1; AJvYcCVuU9z4oBbdyQx8Jd0YlqJvpEmylvg+fovxAy6dSIaUAT4L6PJKCSF+kUsxFRgQmdXqxv23pOvXRXrfyDnr@vger.kernel.org
X-Gm-Message-State: AOJu0YwNz/nospYobFblOPzRhjaQ2aLn8V+/kMTWpz2sgQlyQ17oy11I
	Dn0jBdUVW+C2AxGNZyL2MGHmadbm3tKPpP2fO7ghkg+la7v+RNsalYIoiCN31dPsYaaQtkVCXW8
	mObSB3vG4KkWOnVm9StV0KXicIkG3A3vdn8LHkx/F4D7MxTrcnkeV9lpOJpFFIIEtABD8
X-Gm-Gg: ASbGncsgIAiNQptLirxC2MfAO8w2SPLF/g6ueYfaKvuPOabeoJ3rl4TKfB0NIn9hIa3
	0itqWv717jeAV0OXEJtRreaLuxIhcINPSf6KYmpQFX2uaZ6PH6WpP4+EhHAXZ1xHfhDg5ZJgr1K
	XvaG64gJTuQhvhKbDDrENLKqJUTGd5M0Lu5HX3YTyJ6lStgcfbFp98gr5TuCr5MlgL7J9I1tccv
	5VASAT1lNDhQ8uzoxTE7wRmcW4OzR/5/ZpmXNptqvkcBm8A1eSipe+lR0z7PVba2rPbIRQKR24H
	jGj4yOlR7zKWsopEiQs2+qPbcZz98n30V0oVTlBUF9oA4iljyur5zSbu4xtnJoWMpr2WicxlzfI
	=
X-Received: by 2002:a05:6214:2a8a:b0:6fa:cdc9:8b01 with SMTP id 6a1803df08f44-6fad190b279mr276523696d6.19.1748946943304;
        Tue, 03 Jun 2025 03:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6+xnPN44BmihhZOTq8EzlP77OCBjKRSNvGyN14bFyu6GdHg2oZCIDt0Ztgee2827hAufidA==
X-Received: by 2002:a05:6214:2a8a:b0:6fa:cdc9:8b01 with SMTP id 6a1803df08f44-6fad190b279mr276522996d6.19.1748946942829;
        Tue, 03 Jun 2025 03:35:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791034asm1871748e87.108.2025.06.03.03.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:35:41 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:35:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
Message-ID: <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
X-Proofpoint-GUID: dXZzcBnAOkRnkqm1WJn6XDYqrXR4aCUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX0czpNu1lKLBW
 ZznC1Mp1KByJdbJPz2hZhco17UHLFkgiFPy+LKwUuyR/66Y+TGJjlfenX5hDY8dADYv2b0uJWGl
 Q/LhB/BFth5a/0kVh/VKpc7a1lqOyV2BIXTgCqiHHetRPYeRxEVkMkIjTj4T0wxcF6ycOyyNK5T
 iGwTZhz9F8dlCA//xcEWk3pXjvkbIIkKHmUf6FD47ZwF6NvokeWZXxLPuT5VW9AN6i2LTbVbZ6c
 9RACGTvLEFFGJLcc7VVelHkfjaa+PkZHzagcQYIugya8wQy6o0C7M0Oa3MTVBUjFiyOnQWU6kd5
 9TPghS2ZAZ+k27uwYzTny+KdQjy3KF+V//zrcgrE7kv1F9NGQArNdRUsGan/YN2uXVe8uk06Td3
 CsbKD9jnfr8YFUbQfUDAOCkLA0A9nSSegAmm2gYH/cm10h+T0D7o4xtZA3r49RS2HGXlOk/J
X-Proofpoint-ORIG-GUID: dXZzcBnAOkRnkqm1WJn6XDYqrXR4aCUp
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=683ed000 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gC4Pu52S1TLJhMqEWYgA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030092

On Tue, Jun 03, 2025 at 12:50:18PM +0800, Fenglin Wu wrote:
> 
> On 6/2/2025 2:17 PM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 03:35:07PM +0800, Fenglin Wu via B4 Relay wrote:
> > > From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > 
> > > Add state_of_health power supply property to represent battery
> > > health percentage.
> > > 
> > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > ---
> > >   Documentation/ABI/testing/sysfs-class-power | 10 ++++++++++
> > >   drivers/power/supply/power_supply_sysfs.c   |  1 +
> > >   include/linux/power_supply.h                |  1 +
> > >   3 files changed, 12 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> > > index 22a565a6a1c509461b8c483e12975295765121d6..74e0d4d67467500c3cd62da3ae0b2e4a67e77680 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-power
> > > +++ b/Documentation/ABI/testing/sysfs-class-power
> > > @@ -562,6 +562,16 @@ Description:
> > >   		Valid values: Represented in microohms
> > > +What:		/sys/class/power_supply/<supply_name>/state_of_health
> > > +Date:		May 2025
> > > +Contact:	linux-arm-msm@vger.kernel.org
> > > +Description:
> > > +		Reports battery power supply state of health in percentage.
> > > +
> > > +		Access: Read
> > > +
> > > +		Valid values: 0 - 100 (percent)
> > What does it mean that battery has 77% of health?
> 
> I will update this to explain it better:
> 
> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.

Which basically means that we don't need it in the first place, as we
can read capacity_full and capacity_full_design (or energy_full /
energy_full_design) and divide one onto another.

> 
> > > +
> > >   **USB Properties**
> > >   What:		/sys/class/power_supply/<supply_name>/input_current_limit
> > > diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> > > index dd829148eb6fda5dcd7eab53fc70f99081763714..12af0d0398822ff23d8970f6bdc8e3ef68081a1d 100644
> > > --- a/drivers/power/supply/power_supply_sysfs.c
> > > +++ b/drivers/power/supply/power_supply_sysfs.c
> > > @@ -221,6 +221,7 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
> > >   	POWER_SUPPLY_ATTR(MANUFACTURE_MONTH),
> > >   	POWER_SUPPLY_ATTR(MANUFACTURE_DAY),
> > >   	POWER_SUPPLY_ATTR(RESISTANCE),
> > > +	POWER_SUPPLY_ATTR(STATE_OF_HEALTH),
> > >   	/* Properties of type `const char *' */
> > >   	POWER_SUPPLY_ATTR(MODEL_NAME),
> > >   	POWER_SUPPLY_ATTR(MANUFACTURER),
> > > diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> > > index de3e88810e322546470b21258913abc7707c86a7..dd0108940231352ac6c6f0fa962d1ea904d81c7a 100644
> > > --- a/include/linux/power_supply.h
> > > +++ b/include/linux/power_supply.h
> > > @@ -175,6 +175,7 @@ enum power_supply_property {
> > >   	POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
> > >   	POWER_SUPPLY_PROP_MANUFACTURE_DAY,
> > >   	POWER_SUPPLY_PROP_RESISTANCE,
> > > +	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
> > >   	/* Properties of type `const char *' */
> > >   	POWER_SUPPLY_PROP_MODEL_NAME,
> > >   	POWER_SUPPLY_PROP_MANUFACTURER,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 

-- 
With best wishes
Dmitry

