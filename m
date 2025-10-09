Return-Path: <linux-arm-msm+bounces-76718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2628BCA219
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C44BB1A6697E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2FA35949;
	Thu,  9 Oct 2025 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv+H5D2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02664231A21
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026091; cv=none; b=LRu1j2n8m0y4DDP1qZjrKHhz6xOygW6YVBvOwLJ8btWyCD6xZRTz2iVFdPWWdMscoccIvW0QHoyrljUxTYDjkMDDfs0ghWHWVYKx1KOcr4LU1pr/zIowjivuuPrWPSLTLJj1+bn1atV9XO4CuOwrupB4YkSlDN3MjBoiNQSRRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026091; c=relaxed/simple;
	bh=wnjQVG+egmK2IXhzGH82IGBpeDw+1s4hu8UVsW7/sgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRUb+PiASa+19IclcCNadXCzR4mzahguyw44via0V4HvCOJ14Y6LNwDJGc1kFs6pJO+vqXS0v6sUGtMg+CKRn3Cr9ARCPukXfXMzX9Y0Qgb2HJB/uQQwLFbZdokuEwZm2d1PLOTU7Jtkgxu+eyq0gkI2SNmD6ilQl9c2oLYtEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv+H5D2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EZmnt024093
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ9LcKuZ6RaI0QjDWk+WPpGF97bOBxFsnMcVmm6o4g0=; b=hv+H5D2OfGlqf+y9
	/PSpdxaTYKMxoVN4k62FgqHz1rxKKD8aXMnTm/nVgPli+9kzdF44iNUMObioxUbj
	81cbqg9t+GtCxT/kARnXsIFKqQwGytBQHCZfqy0otpD5b+uoUX+uPbywnlDzmk5G
	vw0FOBA6ArmpQ0crQLT9aZnnNypjRA/Wd35s4/CnTjlHoRLMHRlhx3JcTikYmg6y
	DP6wonghk3cJ1loKcHTIWJDFYNHFakUtzQVKr1PTDn2rtQVXGxA3y3mbULJZP+xd
	X+aqo9oerBPPRCgRTORlwaNY9JKoOU0hexPP7SCdAOETGhicUqnfkvO8wPNkdDyS
	jNCbvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m3j83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:08:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dc37a99897so4320911cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026088; x=1760630888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ9LcKuZ6RaI0QjDWk+WPpGF97bOBxFsnMcVmm6o4g0=;
        b=doiQ+YuyDnjrGecrzmh8GQNdvQosXIz9IAiomMrWl0FLgFK+tvA/a4w4Wa93MmR7vx
         zn4B2rdvvHuntP7bkV9oF3NEHp8uVFmPH6oWq40Z61mEprNnIdip2FnimDugHs75JUN0
         Dsg/1eSHceB1WnUbwSzeQ//LqsGXyPeiQtde7S7wkppozre8qleScfhk4TsC9JAh6B9T
         dU6FC/fTwjgiaVk8wIkNTWulD1IqKO2vWanfB3AwOijr5rYHkwx0Vx1UprfS9q6ucovW
         vzvxUgioiY0EUdZ+tZ9a0KSjzQvOXAafS85M6WoNYHEs6tc1XEpdxSK5IZ/WhzBSoVSr
         hIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqt1uMMbinJZqlUnd39xI+7F4Ls6SKASFhkuPolG5DlcAmmdJMDsHY7I85kKgC9fKPYo0hb9Kaq6JGggC2@vger.kernel.org
X-Gm-Message-State: AOJu0YzMF7ORrQFAniYDZVohViMKG1IJ8Tu8opX7hlvcF3vyem1WG7MN
	ap3uuBE0goht5Fp9AlIZA1n2A0MFSdjLOY/McDy2Z2HFICXIFcRVh0skDR4HuWYO7jtFTCKJPkO
	MSSL/aRYJXqCrqIwDHJxVEBatNkkznmAf7ksx1dcZ/Tl36b6kBOMAQ6U3V6heRdkbq3jS
X-Gm-Gg: ASbGnctGXpEyxeoofjMkgtMqQFE2+Wvnvs1mJmi+ZnnxGJ3JZ1qOt6pWqpp/BqiRiyW
	OGw8m2QEj9vbSe0TCLEAOYydD7pTxMfRWLDOB8c/y4hJ3yPaQqLdVfMJpNlr7H6DJnkT5JzOEsc
	hr3hjUt1nYqSyqJBZj//+5yeSXbSNwli53EyHrnwldD8dGhNtDVnaJ9LnQ2p4gccReSxCmLbvn8
	1Ayn4nUJLf/iGcVbmb1lbGKPBmzsInCAT1axremhTQBBQ0OWjh1722jwHlH0olF6WIk5108GQtw
	rCjwRXSrIGu858i+SJX5Z7I3WGDd8faHYmoUJFDUqUffGjILXJ/oomxALDVpTmJn/aoSQkB9qsb
	1V1/ArjifJ+APS4L8HOD4bJb5LxM=
X-Received: by 2002:ac8:58d2:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e6eacd4f8cmr74888181cf.2.1760026087638;
        Thu, 09 Oct 2025 09:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+Z2nuPl0CiMPeaV1ZrBJxe7W45K0/bsiPvQVl/aLb1IdSFCEiGmt6XM4B2I/2P+tfM8wiQ==
X-Received: by 2002:ac8:58d2:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e6eacd4f8cmr74887731cf.2.1760026087092;
        Thu, 09 Oct 2025 09:08:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71503sm86363a12.27.2025.10.09.09.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 09:08:06 -0700 (PDT)
Message-ID: <1cd57f5c-d829-4dbd-aac9-b07d0e155e4e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 18:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.17-5.4] pinctrl: qcom: make the pinmuxing strict
To: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
        stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-60-sashal@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009155752.773732-60-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4ySRn6XPJlQa
 HyD7Oh5RuN81urcQTj5KkLUmVDIvNnQE2qNLxOYmHMkFGokJI18p10Earf9vZsGUQ+tTXnF/ERJ
 CIe6AnhadF8WY17fCMaT/c0m0skjvjZuIVi06lDZyZuf6DLxkrXXThi9+9SpSaiWV+yJWd1TeZy
 YQJ8RptfDAlbbBKjyl2K3KhM3j3WUWT3oBBUGTIXXiwTd+EfjQIhf7G33MGcZ3gSXu7H8d1c2Uz
 v810OPZd8K6saHiDAqhnTh8w99bxKdNn7UPFDQ5zPdKsg/3UsNtdibCKQmVNOs4DFlzwGfUDJlF
 0YSQ4Et2FblcmPydNPO0y+Rj65HpLxLL2RzuRYHn6gi3ylyaDsk04bpS4yt0cvhcY77MI6GV5Tp
 mZnvfN5y7Opbzaf5YDwiCdpuQAFDow==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7dde9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=FGwjZpymIQ_i5ujK4VkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PmW298YHyXu4jLDC-U-80orlNNTDHd8v
X-Proofpoint-ORIG-GUID: PmW298YHyXu4jLDC-U-80orlNNTDHd8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1031 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 5:55 PM, Sasha Levin wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [ Upstream commit cc85cb96e2e4489826e372cde645b7823c435de0 ]
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

I didn't receive more related patches, but this had quite some
dependencies (in pinctrl core and individual per-SoC drivers), which I'm
not sure are worth all digging up and resolving conflicts

Konrad

