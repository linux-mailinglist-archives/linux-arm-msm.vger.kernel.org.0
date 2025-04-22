Return-Path: <linux-arm-msm+bounces-55017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E2A97B69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 01:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA3D1B60176
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 23:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFB921C9E8;
	Tue, 22 Apr 2025 23:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC8qoxc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438121C18D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366134; cv=none; b=pXE5eO+eeV1ZHTE4oXSiWWSvJG+HgpMQBHpl9hVd+XUh2i1yL5OKy7ygNUcR8S4O+arncmCr3JEFH5DEEtqObLFyi/GMrvCjMBAPCtJHbHc8NruXfxD9Mw72IL3Ie9pPq6NjCiUp6a0i23R/cBzaUDGC8YT4rsrBpuyF/qzJ58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366134; c=relaxed/simple;
	bh=1uXwF1nWfvBIYeAK4gSOok5hMVJKS76PKakAup+bCLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+DHZZzMueIpT3lPN8h+sQSoFtGeXVmO9z7fGR0h/BSj7z6+aJgQswBQQ1Ohgccfzd2NGTb+UCsvIdRSwMa84KUIjeJVDmtqYHtZX4J2/S4APFEaH4hTcld3/3plRPOg7zvVho8HbGLm/o3WjfFW9gCwYLQKNNcqsmOApXl7/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC8qoxc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpVwI025922
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=; b=ZC8qoxc7CQdP2CNZ
	gjEvDtH4JxQAupCMm8zmFo0A9OnDxqQcN9EQhmxlNjq18u8eyl+1FLs9JVM2tTnW
	1Ed5xjXSFE11Hee/kETgt/S+iE+HKbjv7y4C0AF8fnPf0cHPaNxBhDiVOMUZZXOR
	YdN6sJAm5Ar3H2hNPXztuj6BCd52JFYdZXZP4pS/+mTG9cNtuyrVHVUCum7f5Fgm
	4qLouDg3BhBDzZycpLRgEIxHv/b7lpHAAR1gjJdhTEwzujwyP1JIDLJ8+C9KXAil
	/RnX/8LAIKXK+zVr4nXBEbw6XmQrd3w+IiaOcb8fAhiR9dhaX+oc1vyCt4UZy0VG
	JuU/cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ga51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae537a9d6so6012241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 16:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745366131; x=1745970931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=;
        b=hPCru+/0MUmnYLVRvcLuiExLVHn7MlTYq5ZiwMe5SLwZMrPmCLoGHnQRnOV3/lcwjD
         HJ/MDqGqJ8tWu3n7k+QkQfaOzqV51o9GZXv/cKZMpwF4rm9EAQrVwHo5Q/WmhaCrai2W
         nUhLOujXjy4X7SwVGUmTF5QDXVbd4XxRg4/xI8RdSUYQYGY4nTgV4TjBvCZrYJ6xIfeJ
         NF5s0cHo667xUWg6sUWP+EpaknK/HayWqKF/AxRlXScbBBcFlDjZei0eqraohFX+ciaA
         bRseTIYhilpv5GVxbP7ED4yX6O2F5g7+PDF1uggD77MtHpqDQD6/v9oOwoytonPpZSzV
         iUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmSdkkTHBYppTD/8sac+6mbftmA+c81BJ2XQ5gtPlknQlcBUOOePhrFBHOiv8XVQ9fHLi0slS/wYyu1pqJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUT1xMDM0OfoYi7jQVZRC8oDe5BMoZTzWUE888QH21oKRM495
	ghNyrSklGyws33SRDvno9kshqvJcRIFN0a0x9m0CaL0Qf/pS1Z+xJRCUExKOs8JxTsHRjv4ld49
	HSE4L7gjWpZedFEoxtrHaFMtO7+CmBFBzOaECZtS7ln3SaEYJ4J55HPo69EgpjzDz
X-Gm-Gg: ASbGncseQnipj1k1kXvZ+nzgAnkpj+Rcg7ObW0ZHgK8we5p85Ntx6xFeF3BOgg0JEXs
	gL4hQaaOvOTGhn9CGN0Q1xRJvWZa3EgZHfMRZZ634KNjaF6V1cZ7zydAr2jfjbFwaPKPhqf84qs
	xZbI6t0555alJOxQr4wUz0uq9jENy4+nynhCXkp+LApZ1hbT8irdIEIj/tDN2UYUgst6JlYn9R4
	euQK8fdJnhrNYkDtUZVyRZNv9NibmSlPuTMCWBeJqlDqyuk5LJApoe2EfhicodA7Z90eI26J9V8
	QViTorYj55ugIZ7TckTPUTXhPRukXz2qVWLSa9GXM6RWDCgIX4eKWbVxjripiXU8dmQ=
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5273061cf.12.1745366130616;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR8WOuTeaBqmC8HY7gKGm3GRXoWCrCxlpeSTPYTgdFKgYeceHJhp2S7nDIq6tfwkx7ivcQ5Q==
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5272961cf.12.1745366130332;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258342fbsm6701884a12.49.2025.04.22.16.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:55:29 -0700 (PDT)
Message-ID: <8c0c0740-3f75-47dd-8f11-c03fbf8b1583@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 01:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C8KHwB01O0Fvl3HPP2IoA60wpJoWFLZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3OSBTYWx0ZWRfXwas541neQ6lb eSID/sDs1dCJDvnyOXURyyXLeK4i58SpMlL0Rf33F5g3qlIqvqTQvr1BBgQcMDG8oeR2Nt+ghiC 6HIbt5stYtIElMErWoBamtGBijoJe0cMVns9kqk2hBAlPZCDIug/x/fNg27PxSDnSH6JttaNSyr
 OuIWDq8tCPipOetcvCNqnAvqgmmoZlBKbmyZ7saJy3yu4fS8K1MxlO43Rvu5RMbvgcZd3rz90CF 3AOEIuQeZ03Km5xqsU2cDBuW7UtH2Eoogy0nAeVpobqhRsq/PDetyiqm36bHFwoCoqAc9NdGoEv OIl8CEdp6y2hMhP8sSti9zdaQ10KyOWneYYwIRjNhq1onFoh157E27+gF2WQooFSKrbh84lyOWK
 0FPVqHPfMwTYEbO8DppQhGFFpea2XlBjfed5qI1qgV6ohJjYzUTfsc9VcWMOrremqOHt30OE
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68082c73 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=Kb3nHg1V0brCK_6dO4AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: C8KHwB01O0Fvl3HPP2IoA60wpJoWFLZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220179

On 4/19/25 11:00 AM, Luca Weiss wrote:
> Do some tweaks to the common file for the devices in the 'rhine' family
> of Sony devices, and add a dts for togari.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

I don't really know for sure, but maybe this driver could be suitable
for its touchscreen

drivers/input/touchscreen/atmel_mxt_ts.c

Konrad

