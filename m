Return-Path: <linux-arm-msm+bounces-60474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980CDAD013C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 13:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B205171FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D612874E3;
	Fri,  6 Jun 2025 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvRMOeek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE61E412A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749209588; cv=none; b=m+ZiFMgtdZto+LZpH66xyWb0V25SXGyHLrdEB9GbEsbJ4YbZ+VgqM9VWew0t9/G4SeKxbpsKbQxAfPK1QSl8bhmADh5cKz/PJ9j0lAh9ywPdOpDy2pBTY7/A3fykvj7y69MbZuomDkX2/wrvlYqOXFoVofIOHRu6UsKbBYmf5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749209588; c=relaxed/simple;
	bh=rjq1RfB16uNwsEaeeDKPTE1D7mp2xB4/K2KeD5ubBp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkyScBCtbAqpxypNYnXbZQBADuJKXjxpqeVI4mPqsi89SjNzo1SGwfLkYFOXyQtbJcQsb77BxVqj7JoRSpEzckWnG8ACtv1qwsdUhcqDMhMvCCEqD01+lX9cLwy8tjEdTckot6lJbCl445htTVytPVki1lPriWjO+5/ym9pb+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvRMOeek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569ae64031915
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 11:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBsVUSV4bS/Pj8To1O6ismeXm6A04KaflnyzIZ+5dok=; b=AvRMOeek5EwJU2YB
	0fyP/4clx+tIreBlfo30vhV6WzpoZEFXv0O5iVcSwLbb78v+srVl0kMSKf1kGmY5
	zvXTpd/B0JpsKkLWBcuq+Ah2ZxATf4rVEunFlzhjHHgBDW91jTUS7wY1KSNcjAMq
	5FloY9SaMTjP5qiomrJIuXu2w0RiFdHGXd+UASM6TtntCY20EWrL5VaUmUDERLDf
	oHHbDlhZuPDulg+ljh9dHBx4Cq4XZepbv0+qAnQ7jUYFm7ywrun+pAzm+z1RAvmI
	gxyWfYPFS71srhJlh7iIbYWO+EbQ06TLejh54jKqGJCiU0aTt34QwFpaZEAnw2o+
	y30SYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be885f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 11:33:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso45089885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 04:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749209584; x=1749814384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBsVUSV4bS/Pj8To1O6ismeXm6A04KaflnyzIZ+5dok=;
        b=cMWLiW2NEsPLkn1759WFrJWeGIYG7JL8ouEMIzx+DemZ96fGoJo4jDCKeLXWOYWzgy
         6LVvDe+juC2N0YZqHiCSmrFuZOgnn0GK0OPU60dRa6hdWbk2MoEmvwhivjfscFQWoAHp
         p9qjEUl1Rmkyt1ZpLy4edf7vx8m2z7v3i6c11g/yx7dhXVlUEos1riHq9iU19pqpBqrZ
         qvY4QgTc6ht66NuadZP2QaJOWAZ5GcwPcNHDT369sETLgKw35QB2PZKsHf8mSkyzb3rA
         q4nAhmrhBdv1A4F8IyFfnifqmpbWNIjdfLfRA7eLkO7ZJ53Xf6SEf8NZeT7B4f63cj1g
         /0kw==
X-Gm-Message-State: AOJu0YzRzosNZBjVVas5tVWs8d89uxXSqm82ZGoI4Di5Bor8LU+eWPcB
	AWPFEsf9t88P+iaVg/Y94d7JjSsGWZHoO3dJEpVv1scPG/Q8ysuIKqUGzxKiFxLmaSCjK38owuw
	9AP85+9Jyl/aYnnyCFqXSi0uMyiSTejhlyRA4N1FDkMhOXEyVrBZroQISmtXTKva7sy8J
X-Gm-Gg: ASbGncui9rvaOhfWXyfrQq9EFF9C5AT8Jukh6yu3StrbSFSeKUz5fSyH6HE/9/XuaQf
	nidM6bXPBQYymvRXygz2eW45r6SY+7bXrkXBplTwF+l0lTlKp2maZ4iSddE/NxRwa8wS5RkgZIm
	ZArx3bz/hIYZxRmT7NL5WyzkwDA4LhlBmPuo4tvqxbPDRjXSV5s6u8oM8FojHL9ueVuOaxwyqd5
	K43JSOjhYxekLN0nAKVYVoy/CMb5UsboHTEkbLierInhyDxqXxNI1fIrDRqcAlhJklkglZYoiev
	54rXRg64lhoYMKED93vRDX0+vpJTZxTDeAJYe1BZQ8T72uNdY+FaToLEjb7TDTnXbw==
X-Received: by 2002:a05:620a:410e:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d33df1fe47mr93551285a.13.1749209584473;
        Fri, 06 Jun 2025 04:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkuxkZEdiQyqedab+Vm7k2HP8tSudyEGg5/Rxa0+D0cherRON5LyZpShuOvPOo20kuyO7SzA==
X-Received: by 2002:a05:620a:410e:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d33df1fe47mr93549685a.13.1749209584031;
        Fri, 06 Jun 2025 04:33:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783de2bcsm873720a12.68.2025.06.06.04.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:33:03 -0700 (PDT)
Message-ID: <05534fa7-9479-4fe0-85bd-0dca5541f739@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 13:33:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
To: wctrl@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6842d1f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MzN8uu8svZ0T6_zCNRoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=lZGKyyPKw46fRox7ShMU:22
X-Proofpoint-GUID: d4N4ITMg2BbKEuSewCa7oQhNV0dtq4Kd
X-Proofpoint-ORIG-GUID: d4N4ITMg2BbKEuSewCa7oQhNV0dtq4Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwNCBTYWx0ZWRfX9ckYyyl8co0V
 +vJ+NysrO2g6FCQMHjmoBs/jtqPKBH/wUPuscPc2C2CbZPG3VvSGhHpkUZUN7/hfHOzHLqnWiQa
 Snz4zBXO/ueNWzMz+ZBadauh/of8eGvETCRzXmxgPT/SRAadFchW7UduGrnm903XQKDiZV8Msiv
 OPcy5KkBFMzT8f9y9ZR41TJDM0xF5P/0tj1yxfpT+EuRlYypxZQp9Pvf2Uig9yZc4r95W0IcrcR
 7o6SXWZ9gv0gmWDd5GYzP3KVNWvCFXEDQaQY3yBILGrRFVEqd8zpy56ZK6wvMI+6o/AWZ+vmX8q
 fvHwvI88ASUmqNVuhS9svcPqhcimm7djjdH+diMtze5WFxa7YHIMm9BxLRhLr+Uk6FVWsn47qAV
 FsxXR93tVc/ydqa60wiBXZ5cXnh8YHXnR50A4qNIgo8f25lSj/sZLJijY41kdmhZY/ICnEJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=686 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060104

On 6/6/25 1:03 PM, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Replace the raw values with macros. No changes to the output
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

