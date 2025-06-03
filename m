Return-Path: <linux-arm-msm+bounces-60085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11324ACBFBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B973A4416
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 05:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CC5202984;
	Tue,  3 Jun 2025 05:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMMeDjDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456B1FC0EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 05:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929702; cv=none; b=fqUAvczRAG4CNsmLBEomU7h+q2Sv0zkl6aWHQz8ORLA0rJxDa+nX+R6x170LfnZYzp/MoUIoIvD9VHGcLOb3G0ri0ZXtknblDRU2Op267MzFalNVHr4/I+SnUxrI/RNKgDD3tv/S5dOzyQ2bs/UMkIl6Fe1S3c6lYUK5BdDaid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929702; c=relaxed/simple;
	bh=aKj4GZ6PPp/Nz5rkizthBgyRPAg8m37h2Nts/v5Lkpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WENh70gLZsogzQxvgE9lEbyWmLiKFzypIGd5puXwLa3DdEDJ6CZChmBHCHy9xZxAM3sYGj7g3lXP/VQrLgLu2UpDdoOSpdn1RUVJpos1DWkSR6H2bjqB7ADV2o7Cekypx0HhD549EbAoxYxAIe3wx50DLKQjiXGh4MLulnb3Bx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMMeDjDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJdsv026772
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 05:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=; b=PMMeDjDY3puQMxys
	t1Ii+iOdBbmKvmXBEdyK7nxAO1FI5EEy1lEK5F7d/3S+HNBMYgjxlJjGGW2XLnid
	mFtD4lobaqq2j8un3/a3hsdtZcZmOpkdkLNJKInyHbOdqilKPbZztW5sbfgqxE3h
	uhyo0uxCRH1yn6tnRcWn85vPhRklBwxGZWBsoFkymbgg++MVFN7D5qdaR1TbNC9z
	P/GtNcVK5v3p9XnxdpLILzQ4NkTKWqpgLt0nk5hScwd1TLpzB8BtCdMU5OwBt4GV
	nA5tT/7lcEtvzYQYo9xQnGX1IhGTryeCjD5F4jXfN7IVThU8qsKZcvoGH+0e8FQI
	2bUDfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rseut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 05:48:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso3348027a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 22:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929696; x=1749534496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=;
        b=sJ8KN9QIMhaqJaycbeL1BYw7OaSlq+shJ6HxdVogX5kmepUUFpzlsw+052ANvGJRjV
         9mNsBvfPLE99+0NJgID+NURxu9ThUaEne1FNNyyx/rI0ZHLWOiibORWqWZXr3l7LrImZ
         RHt10tCX62nuepsvXcw3t29jP6zuNofzsENynkaPK31yvc0Pbuv3XhOJYAGpY9iHQCxv
         1Bl+56eg3kD+El3pPGmknHpcPSMsZ8bbU0lTh2/fuPpXkICJW37iXE+AmsniVD3KA45S
         s8ADaEEOQsa3J9P6qxDiG90rgtNTSTg26fkUd67GGo10eYf+vaxZyweR63DpgP3av/w3
         SRIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOpenkCtl6DNxMJN0pb+VXPbY0si8z/Ll5hh+xifZVfS4D3jIUtTZnr/a8bxX1x+YidOTW2kUSwALGop/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rb3kd3MOR62SDDyMxsUOFQkG0P/Hr3ZMSGbi37kSEaFEJLw0
	q4eL0ajf2CSDn63GLr9YgA8goVz+IY1ilV5xEO2rmEbO9815rXrqlEkB4CUL57hIHYK642lLHxy
	3Tu2iDO4npe7LvnU6POO6+TkN5tkMJbJowabFialxxJDi3ECX8bpJrbfFXLcimFAvfhKU3WqH4c
	ojNKE=
X-Gm-Gg: ASbGncsbhsqdkpN04NdPptoh6z4S6dtubMg6E6AVkPYZKJadRJR3k8vt3aCPnr6nCzw
	dqSFbRTarWVqCQylkpIkOBAhVR36+uZYqUDfrdX0KRz84hqVyCUlcqTcIReucO6eMH2+1FO60AH
	yrEH8AHNtTIvVrVN6vGt2QByOSjN4gG9kFGcx3zPCOlfT9JZsMMEKOBJFSVn4lEnctYsaJSTzKz
	UzJeHkzxDHJG+4rnP8fFEgAr/fG8FmL9lQ1kHPK7pM3R8GZj3oKdNrnbQp+J1QzUookbaLdE82S
	wMgmoMRyOeaq1CBmZF3dv3BCKDWTLZJ+5bSsPsnP1KcelYwA+pWKC2blb64vJX04jETXycTHAWG
	NmdpAo74h1sk=
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596981637.40.1748929696384;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAtEPb0qgjBapOIIc/FVtRuoOheBabfhP2QQGPgPqaMfCZMRqkfWJocE5Xr1V3SkSH42ofug==
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596940637.40.1748929696012;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7464sm8636060b3a.180.2025.06.02.22.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 22:48:15 -0700 (PDT)
Message-ID: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:48:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nwiGLozJfta1etVbHZjwhcz5V0UfQB8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA0NyBTYWx0ZWRfXxJks9Vvwxj9+
 VgxnJ6dJ9Ij0gkn6uQ8DA7XEmWD9k0wA0tJgKMOHHRj/r2qjcl64IiAFvpZF6k2HakmGfnRbjK1
 2x37JEPnC4sNPZQ38rGdsTaMfcA/+lSiP9G5QuULYqXvshXboteyFoiWm3GX12mT1coBuRpraeE
 gE0oA0cPWaVOzKDmw0gNIuB39+Wwa7F1An8Xne05/FzkHrlpjo31NrFYZpC+RPZ6PyYTeLlEjCy
 9cLQoNIMnco8RQwYqSBmS/YMPdnTNxiEsHwTPMfu9ss/SAbiSZ/IuHy/0e07ugsrTH7+sFsPKx6
 brWEk3R6bH5yPR4NamGDI+z5xFDhoybyxjpwwXXYh0s7GWZtiULdfAxdDaOUqh/WO0UDy3uAdpx
 CilzSLiKMyxtLnooL6eJW4YwiLJfWsIOQotVwfFlVwPG1AigLedba+7n/KDLI92X1wwPKTxc
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683e8ca1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=g1VTAUynFBCLE_zrBTUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: nwiGLozJfta1etVbHZjwhcz5V0UfQB8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=676 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030047


On 5/31/2025 6:36 PM, György Kurucz wrote:
>> Add charge control support for SM8550 and X1E80100.
>
> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting 
> works well, I finally don't have to worry about leaving my laptop 
> plugged in for too long.
>
> One small thing I noticed is that after setting the sysfs values and 
> rebooting, they report 0 again. The limiting appears to stay in effect 
> though, so it seems that the firmware does keep the values, but Linux 
> does not read them back. Indeed, looking at the code, it seems that 
> actually reading back the values is only implemented for the SM8550.

Right.

Based on offline information, X1E80100 doesn't support reading back 
those threshold values in battery management firmware, so I can only use 
the cached values for sysfs read.

>
> Anyway, this is just a small nitpick, this does not really affect the 
> functionality, and I would support merging this series regardless of 
> whether the read back values are always correct.
>
> György

