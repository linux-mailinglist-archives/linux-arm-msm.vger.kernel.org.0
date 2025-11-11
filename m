Return-Path: <linux-arm-msm+bounces-81243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5EC4DA9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B12A4188F923
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A06534FF7B;
	Tue, 11 Nov 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJRMpH5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRwbNMul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86573546F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864030; cv=none; b=gn2wskdInRgrD/GObHZRi7s7SwDwGHjMPVE+LhesKG1n2/rFkzXtLivJNOsNDA+VuuDUrccRmSGKKt1wFAygGP2qNgA2yDInSRwRoVnRi/YcXwA+i7ebYH3f7kXYISqwrKhRbQroXwhCwS1obrMwj1JdgyvpvVW/mgWWeJi+eWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864030; c=relaxed/simple;
	bh=Mmwf+SgYpOW49FVFFebTwW//qfzMVBV3emHZpkF5kxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecrJNy8VOGcxDl8LXav2sa9YIUa8mhMaLSP5ltakGdpMpz0PaNYuc3ww4CWx2xCSuQvwl1+B43MJ0kaxa6RqKPbsWt5iyfq4W31vUneZq/xEgT/rbd4zs4bA2ZUwiqEL1RuatpB6UJhwc3MVugAiPn63ieCAT4Yu6cfFnl+aViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJRMpH5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRwbNMul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGV492129956
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8agYfx223SVNEnTOzoADqgO7cW6tHMwJWHrHwFhic4=; b=CJRMpH5In5LvwALq
	R5XGoT5CXnFWLVkURWj6M0kA7W+/UV8+0N4vTJUrE5WSOkZcriufYLWh7EoXHiDx
	baEzIKXElZtY0Zun2YSUg5afo1ClZ1NPz2j6c28fiWLintntu5miBzsynjYQijkk
	HlOj9H/8tHK6QRjASQ2RdrdgePKxMccdqj5OiX6tfOhT6TKdCbEuPVmYQAcByf97
	FYevllhZk2Z8AZdRse643cO7y+6UboDBEK6qsewRqAu68F/iZSy4AO5dW7X2p3Sk
	0PRH0f5Ch3kslNASd42c/6x9vHlcIjFYpBbwgpAAq0AKZs2+6+tXXoQwdjzkO2QJ
	CAU2tQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthka5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e89f4a502cso116374891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864027; x=1763468827; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8agYfx223SVNEnTOzoADqgO7cW6tHMwJWHrHwFhic4=;
        b=jRwbNMulOAL3RmTvmaQt5u6JydCxPco9YKz/XV0LVpDfLdNXEiiA7o6254FrrnNlb5
         GD5xZHXnqK502B9L/MgDlFjhtZMQvNcgHD2rWz5hXXDmbBJLVKq0pklVRvfvgG0emZwv
         +eGpYSzpbj1uhFp+CjRcqVq9ScP+i4RnTZS1COY92KafwXJP981TMz5Q1NwlJpAY/yQo
         2E8UJ6Vnjq+FHcCjnNK8e69VkQDCKWUNVaElMT0f6WJZT4xb4d3Y5vJQibmykp9+EbiK
         nvGQiNgBxL3anzOzdOsQVbPT0KylZ7u7HRa+26FH6a+K/uw0KcdC2MpijvIFDZrxWSVK
         lfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864027; x=1763468827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8agYfx223SVNEnTOzoADqgO7cW6tHMwJWHrHwFhic4=;
        b=StZyaDI+J104nQSFZk6kLFgZcyaE5HzFJnMVb6kVrb+R3iDNYIO9ukVn/gRL0+T/sH
         /XB49pj5KnqzmbYUm5u3zblkug6xhXPX4s9WEojt4Jb/5VV80hnUXXgs6JeraBApyr/I
         wbiZN+fYg4XG1hd5UnL4s6QsGWuna0QfrDybYRxOOLATMS6H/bNOaAlZeSM4OwGEJfmN
         JBAm2HtgrURy5SgYJQ61Ot3GU3bQ7eD3XZbsm0JUzDJrYAyrbVE03L5s04dKNiUA760v
         MWCDrfdeUF8nXWDvLsnBlM8YyZfQrHFTXRA1B1EQul622SBEFwcO+O08bTJx4Xr/q7RV
         9vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsn3V/s4yAjx8jjfcXKSkPeKY9SMHKdiHp34SsxQPA9oaEtrXEm2AK6Rbcn1iBDgSkJ37vlXIWQLAeBki0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv937SXkTY3hQ/9UBbq9vDQZi8xbanUTHSmXZxTsHV045VSAZN
	GrucitKbOiCnRpnxFDa9pGoawK0OK38p10hWt5pW+hXd9iupnVAIxP878YFsfoUxG2PwMs219k6
	DfY4Xrd8Tv6iR3Mv7IBP6fFGhBeui+lpJlCww3Ku8QxBTl4mqX4J4sVqEzEJ4tSe8ktmS
X-Gm-Gg: ASbGncu1KMVSiUgtFUFwhQ7w2hrvezyq6ewx3HdcRlRR+2xbexMFgPUVG5DGWARdBT0
	3pMbrezkhzKNnvJa07ue7oU4W0VLHySu1o2tEtY/pxT0JVnLgNi4NGbj+8JpthCKC4AZlo43u3L
	EzH/lEE9rzRd0Tu4tKqGShIi1DjUCh/FcB+o9QlnV5v6QbT2Q4IV2Xc04YeNGAOy6EwZn1GyYp3
	+8n7G6f8K7KIkH4fNaf4RtHd2OUQG4x0yFT8Djlqc0ZJuZ0EnzL9vFL9/1V81YHvaMzcWJSMfX7
	XwNBwY8C6GEPSlD+hOEKc6Ra0oPhlMpsa2ONBqTxcQf0WOELr2K0/uo0+jUO7VSG27T7XTymvJ5
	8VGhqPdGn6bWZp4Vp+q728exkrixGxmiVCrutkg9aslxbTp7+ZaOEtHZd9YtoCwz14JCYt4boIl
	mMN7yDCl3rQxzl
X-Received: by 2002:a05:622a:5e05:b0:4ed:b15f:57b2 with SMTP id d75a77b69052e-4edb15f5a5bmr85004761cf.5.1762864026888;
        Tue, 11 Nov 2025 04:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe9LUolpDhLT0R0tyAlGuJuGN8jrUFYieDxdpVOFRHcF3z84ppoj6e3wQekkYdV6mDwe4Ogw==
X-Received: by 2002:a05:622a:5e05:b0:4ed:b15f:57b2 with SMTP id d75a77b69052e-4edb15f5a5bmr85004301cf.5.1762864026189;
        Tue, 11 Nov 2025 04:27:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013cfesm4868256e87.23.2025.11.11.04.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:27:05 -0800 (PST)
Date: Tue, 11 Nov 2025 14:27:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net,
        Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, mm.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 3/5] dt-binding: arm: qcom: add arduino unoq codename
Message-ID: <fuz3se3hwtoqlgcifo35qozda5xy2gneatm64f5nsq6n75jteo@vqbu7naldfgq>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
 <20251106153119.266840-4-r.mereu@arduino.cc>
 <2c67a82a-3a4a-44e5-8c82-42ec6320d5b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c67a82a-3a4a-44e5-8c82-42ec6320d5b5@kernel.org>
X-Proofpoint-GUID: 9rdXq9gJBWB1U0AaguCoy4ipio8ETyZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5OSBTYWx0ZWRfX8vmNCGPPAjzv
 WkHA7D5BzEOxvqh401Y/bErY6guku0SsuG+aDybsfM8oJ0BOaU56M7lDhvvwrSw/EpCilW9D/u4
 kpRVxVH7XLH6YMazG766JvnShjcEoM6gU3SxBTnDRGVSG51RWN4+WdLWECvQtPuWKW+KruCeYLA
 OOzbBtdYwzAtlBQCFAxm4Mvn4qBexBJFoS8cgw55PABzpore9eCKk088zto1FSFGlCPa6JlAr0K
 WUb9nVYVVZNEt5ZPH2kXX8xqC60T3pYoBSNhHCbqplnQOZqvwy0xum5THlnDSuSR60eMg44XTrJ
 iYkrs7838qWg7BVGVo5YPCPBn+5gbe8sJqGAy9v562YxkrXS6P57LAZJKpHokA+Kj+GaJo88wkD
 pADnb3U17mHseHs1EWjMTh0ZS8yRbw==
X-Proofpoint-ORIG-GUID: 9rdXq9gJBWB1U0AaguCoy4ipio8ETyZf
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69132b9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=XehZ0O5PNwaYdYEx2uMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=i6qsmYmKKdoA:10 a=csto0wWSG80A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110099

On Fri, Nov 07, 2025 at 08:13:48AM +0100, Krzysztof Kozlowski wrote:
> On 06/11/2025 16:31, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
> > 
> > Document Arduino UnoQ. Arduino UnoQ is a single-board computer
> 
> compatible says imola, not unoq.

And compatibles for various ChromeBooks also use codenames. I think it's
not the first time the vendor uses a codename instead of the marketing
name inside the compat string.

> 
> > combining Qualcomm Dragonwing™ QRB2210 microprocessor with
> > STMicroelectronics STM32U585 microcontroller.
> > 
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> 
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

