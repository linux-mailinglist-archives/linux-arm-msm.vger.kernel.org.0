Return-Path: <linux-arm-msm+bounces-62440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9635AE81F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1FD1BC48E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D3325DAFF;
	Wed, 25 Jun 2025 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0LtvTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFD25D8F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852282; cv=none; b=W02hxdfm+Zuv296k/S4kCz0mIaqzKZJqN3KMzA+u9xyUcNIognG8+/DloBw8rfIBpA+3SQzR4yLa20t+1ExGaiE/T0C6G99GG5uq2APb+hqMpLfOSLVgAdQS+XdVk32iHTCvTD5BPBL4QmF8h9OliSpt4Lh4kHDaW/1rHhLz8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852282; c=relaxed/simple;
	bh=fs7c8Qyu5BrfvUyh4WP843ByKBeqVCKxGmA3+fES+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0Gte3oewKolRnnC687wp+/URJXU3SjoIRQ2sW17nTAnIwaBsxSWUXxYziM8KFmMXmnnibFEDRk/LYIAMMcsPBPz0S6QogHa6u2lhBMLNUsSncYRIVmzrHVPypyoUO/ELlRdXAVy3FcEDOlzQxTPwQB6TbZJGg5efRr6EaEu8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej0LtvTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAQv4H001165
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=; b=Ej0LtvTJLh+M6FeV
	IpxDKqLh59EosLSa0ArOiC/IdoB5oFywQQSaMN9UOAu+528/6cOO+3HkHRWcx+eZ
	0jT0JNFfqT3nwlmkII6vBB25GITh5GOGzuM/WCmOwHtibkfQ2fVELQC/mlsWdLN9
	wkBi8SHN6I7tMUPFT/FScHUJp0NCJqQ7qTiekP6jqlq63IzQjIV9kP6letvWDmdR
	03MPl4ft6GCNb+F+ofB1DWHx9fJ2fyE9zKg5OHpljk7vS5DqcgRGwaT+DEQJIW8x
	iFwpIiDYVIlIugDWxa5VqsufcYATT7Df8Wp/sDHjUzJEk8M0JQcmvwvVk5ls0vhZ
	qOVP4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td9kd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso153569485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852279; x=1751457079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=;
        b=HPxbbdOwkLS87k6m0E8rwKyIjGDFYcQa+JLQ+Sxayf3PR4DyEFRikCIRNOcjYu1aXV
         +e7bEon8dOIge81GPmSmOkmKzHHXE17baIr2ncXBojBMSt4LFWiCr4WubZFeCnocA9P1
         mjjoUESt0ATcV6VcJZ03w5pef0ClxH12hrnbxhANJ39+zbQV3PlN2dhWrNzbwpj28TDH
         XU3fUAAwMFhEzBNvAJ16KmRCiLx9cIIThX4xKcVAJIio1Sp4WN+GxKZZGQEFCAWJEgDH
         dJZs1REyWZu3El5EwHeXczmSnkuMKQTTmxWWbLSxra8ehlkoNCMKWcUK2c5Prg5SwSa7
         61Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxGdDf7M3Wq322gRqJrckruczzp0MyVtsf9gUfrcCzq4Qic2jzRvE7SqtPFugnVZ9Wl+FWKxHz9l05Cte@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMbKXtzILObusv4lmbP9yjmmUJtGgpjNMGFSBSoW9gQtRSBDj
	gs2f3DyQtUWBahNbPqe4MNrShGo94CjMNo9WOP5h9Noz4wmB0SDGj/TFndbxaScmLYP+nsz8lbU
	lnleS4ssOZK0fwDBJ841vrvffREwTPk/zROocblJGcn58OO+pfptgWIzErgGSwwxHF3b6
X-Gm-Gg: ASbGncsTPAcCx/YXnRQgzfX2r4i53XutvTxzWqBRSi/Yskym/gkiG5P6QSSa326bIpW
	IM62vK3X7L6I/23+lG0ubq/ScMFsNLmZw3BJr8fut/rqepwwJ9+GfRgHbOzBRSiHC0a+oAm5Sb7
	7w5GNjIqu9Uv18eESA90/WU8cjfuPwhx9p1KginoAib2zaFmrpiE03WvKowT6cvQ5XG5WpzhQdL
	w2oegmdjr97CjdGF3dXhpMo0vNZgOyh1YKOihMIWCgKonAl/Ld7rFJGUOKDj/6S0oGTbYiao6pT
	aHnaRrEfMulest0AQAfOg/5BquCgz3K/5pmQTBI1ikdEhrhtd/ja6yf23s35NKcISTJNbSxfLaU
	wkHQ=
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128604485a.12.1750852279227;
        Wed, 25 Jun 2025 04:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccfvELeUXoP8b1jBpiU9AZeQNg48frmRiDDZy9qYIkV5bzxU9h6vBSLu6n9Ur83kyw9tsMQ==
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128601585a.12.1750852278731;
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f485d0asm2360299a12.64.2025.06.25.04.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Message-ID: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685be2b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=SHKt8ETI8ElOVTnc0VsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfX0zPCOMXzIcOi
 TASA+9w/HJdLCFEsyAvNyaNaj/8etFXEePmCyR7IXWcxtDRPZBHiCaJUtQbhE/MuLvOoGOeJOYd
 SSMwgqFuCYC4JY0/yzf1EtQjrnHSRMRXxrR7NrZiVLl7EO4TErIS8HD2rmU04VDqVpejGpexyFd
 3vfXwZK+3cAg6DQYDhY/6tXDUclWwfKBtl0tJ/R46qimhm234ZpxR7HVPZ+WkdfCgr/7jOsrZik
 OX9EkhZP5vvxG/NWmlenTEcsrPgBStkMi+SHT7A24glLp52ViH4KCeSKFqJZ6par05P+AFPmrYU
 1umWf8uDLTLMWpTyJiskU+aRi1d50vnqZeIRS+waiIx1BOCMhOGNxBchAJx77YEWQrhMy+OPiQw
 HLAo28ucA1QTjOaSGVHtTjOWUCsq3GqxCga8pXfGvHsQuSs3F3NDJlZk0mytzPzSTyCEb8l6
X-Proofpoint-GUID: KjIyCwAZCvT5b0HNzFM27bdJY6-wkQHj
X-Proofpoint-ORIG-GUID: KjIyCwAZCvT5b0HNzFM27bdJY6-wkQHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250088

On 6/25/25 11:14 AM, Luca Weiss wrote:
> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
> 'latest' HPG revision (as of November 2023).
> 
> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Both the original and your commit messages are slightly misleading, the
HPG (and the code which is indeed in sync with it after the change is
made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
You most definitely don't want to set the entire register to 0.

With that fixed:

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

