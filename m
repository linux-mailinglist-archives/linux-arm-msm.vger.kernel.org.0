Return-Path: <linux-arm-msm+bounces-89080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1BD21757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5934F300386B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF743A89AC;
	Wed, 14 Jan 2026 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdg50+QP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVVcLm8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1638E128
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427605; cv=none; b=DfMz/auKf8yG/f60kGwyerSStp6Gyl2F8asvAkac6wTodMYo8vqTXgE+FG33zeY9q5B/pFhvOvresGHTYK1FVaRPPoH3kKqbGK11LjcdvlNPj2AZkWG4WAvCLeHh3oYza0avVIsPfBpuK1tIPHgrNeKsxujVPaOyRMetR0b/IHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427605; c=relaxed/simple;
	bh=UUEf5rAfbiLQj64m+WE8UuO45dPfSZfsIrkA+XZUuUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZL/2PtNbGhlnYmOB9PKd44JrNABv4BqxcaTM4tFE6RVFc0atKNAo7HZOTjwDMCImIWuvs2Ci0PfJGXVySVcS6SqxbZ5LoZSXwAeLoCBeinVRlsF0iPvGw06Wb5uSf74HMFWdet+0EqZL4VJfcxQESxZ4/NtCpr998a4JfV0YH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdg50+QP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVVcLm8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EF45t01943025
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mXXKzKH61dvsjX23qk92268u
	au0Rcf+1wCgw2oxpBt0=; b=cdg50+QPM2UrSJnw4EKTFZ3MBOQQXKj7y+xxhw4G
	4JwflThEcejK5TV+Tkd9/DpEqvG0tEwn7ztNiJYCVOtIgSwiuSse8aIjt4kkdFju
	bDdRaHfJHAoKIGCH6OAqhOM8q/rNOq/+6UY/qG1TpLQsJhMdyhyMwz63MaYfrszM
	kRvRs1/nPqPg0oydTKIxWwa8NsF9XjijNO4aWmdOeWAiBt7ZXau1+g85LEKS/poN
	jbO8y3k/pBras+4T3vfR5irCW+ZM+R0tTHBS2Aca9Qbec+ULNcbMV2H31oen0q/x
	66XHGmLbmgbgGBM2/IMBsYcQ3+sVIKJxOM8Z8+Z679mtYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6tsj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:52:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52fd47227so57240785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427573; x=1769032373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXXKzKH61dvsjX23qk92268uau0Rcf+1wCgw2oxpBt0=;
        b=GVVcLm8Aa6HW/dXriYyJ8TwpO+lmDTpAwYHhyswmfbXm2tkVESAtNOlu1+xDdbMbC9
         Q+yowDpYjpE8Yib2+VOkeICrcdZq5oNkr41I5uDyGp4r+ZmY2JsqaTjzunT7vHyHlU2i
         ATcrdbMw489s7UCJo9fL6iVZnd49LmkfX6ZWyVrWsAkfpzJt5JmyGb/vYPTO7ievi1IZ
         aROXh1sH3cz0LDQmfWCDjZmY+dt+ixsGbOMfuL9UWQRzRhAFHh8UsRAXF7/t0pql0m5U
         c7BQuUuJjPKtYkRPf2+R4gKv5OLH+3qCuPcfg5tzML1eWxaJpHpAnYxVrldUAKvAus8E
         SuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427573; x=1769032373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXXKzKH61dvsjX23qk92268uau0Rcf+1wCgw2oxpBt0=;
        b=ho+adfoSQ7HEAzY6tPFSCpkTcWmwtnBrQxNDF00O9e5mAAQ35LgGZ+wrS7Vbqm4lsi
         l2Ipbi36a/LI5qM6Mz/3N/Poc8e/BlR/bLCuUo9vLO0QqFdr3ZJE4dZ7XJ+lqMDbXUX7
         ledCJpvnyfzs3+SiwVePSo0EFvOirN/u/9UlKP7kp+VlkLI4C6v1l+d+vZTMNBueUF+5
         Vzl+ulYk/7OBAts51zE5MLNrn3yIMULlc4RMxn1R7Iq44viDf8zvvt0opikqNnz9YMZh
         KbHIDgw6mKYmyT78+CymkKOk7iyPuGV1ELkxnciE5GJ8c4OfnH228fkqEUvl6si4SCaZ
         3F0w==
X-Forwarded-Encrypted: i=1; AJvYcCVEpQEJivBDclr6eDVir/nhlUjQh7U06IDb/tbMZZbuChpu920UiJXe+0KiY0clhYcZGZntutna4mGmEcqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7t7Dn4UpbYat3QGXkiDA98xbDRrQZKmh4cMxJ2KhSFRJ3EsAy
	Q1E7nhx6y/U6+Pj04bK1Zt7ZyjSCtiSB0yv19BerKoKsh3NYkvr7T+KYDBFuyMS1wV0NrcKU2gt
	X1qGYdj/cOXoo/gHsYqmRdvAy0k9rSTkojOC+PhBlpN7eyvFIHcBWR5aOhPJ12i+k5h1D
X-Gm-Gg: AY/fxX6eBGch1ZmW4j56ZDCS34MpEtsNVR+ICVMiMi/RxB7vX8L1XB5rNM83G8/FLbi
	FRKB+5IfmF/LILkiiMcIQmOv8eLmP9quC/3A1/geRCF2LR82a25Yolk6rMtAZpL4cgjW/uayxIb
	j1IBNVPrkOldp7qHSI+pxiNNs9foa/MhieK/TK2nXD4GzrKHIRmEOOI9afsFd0TDS5L0vVs2Luw
	zKqojNa+hBza3qYss38F8hR5Jv/3O7f4vUWgpJXAyaWViaWcQmKkU9alaOTYhT6rNSk3GFUb188
	zoTlPIh4DgxON5fvWjzhQDcN+fse3QfehjSjfZ4VroX0qwGysOWauIdURypxPO5nS8OpWo7TsUY
	WqI0o+5n4lzibFS1wysB4tVfgx8XnMV5jsh/dnVdh7YcMU2zfjrA2rlganCx2adxbLCzTX+aSCB
	6nxfSY2HedvaJ2OJ5T2TxCxMM=
X-Received: by 2002:a05:620a:19a2:b0:8b2:ec5c:20cf with SMTP id af79cd13be357-8c52fb05526mr581402085a.9.1768427573013;
        Wed, 14 Jan 2026 13:52:53 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:8b2:ec5c:20cf with SMTP id af79cd13be357-8c52fb05526mr581398185a.9.1768427572535;
        Wed, 14 Jan 2026 13:52:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102088bsm1061646e87.31.2026.01.14.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:52:50 -0800 (PST)
Date: Wed, 14 Jan 2026 23:52:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <4xmpzkerelzmetkobjw6y6okazwyipocrg74scfeoh4l3nd5qd@huhap5cwwlby>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VFs4X7J9vej_ViJi1pCeu_0-Q5eds9t2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX7r4NyO6vYBc6
 I0/fGCzMpjtKnQb+CrHlThoukB/qOoeTNxMLF8NFhuK5ixeOjljFoStvl5wEVG84SemfZoxcpy8
 L0vzARkHK4nIFU6aUWOE1FIhZAiujqO4VAm5AQfnNFlW5mMGkJ1a71O7PXkZfCn6mHIMqJgkA5e
 9ny6Jp9VoixeO1lkzsokZ/TOHXi02AFdlwdNzb4yzP7T+KbP1igVmyZedJd0R/Qae1pPY4v0HoM
 7JVgDDhkSAffj4/o2LmTgUT3VZIFULaWcTt4yQRKJP4vgyyA2zlKkdRWEQhyKUyRmmc9kwBAjsT
 4u7Nj2n8ANKvN+yMQtODbIMaMguV+MUMFelbPRYH96n+pb3RiqIsIAVY0vvfadX5JpKgBqJ4o+f
 G3J0EucN5s24jo95HEJJBqwiclgJQXAj2Icn5ecZ/OHUG+OJvJGS/Wo2+99giaxMoSRIC7RfTKj
 Oyu8/rE/+9rYxu4D3Ng==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=69681035 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ES-LWyGZB6HvuNGBYh8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VFs4X7J9vej_ViJi1pCeu_0-Q5eds9t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:59PM -0800, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
> compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
>  1 file changed, 42 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

