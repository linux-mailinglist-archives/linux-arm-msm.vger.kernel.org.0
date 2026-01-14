Return-Path: <linux-arm-msm+bounces-88974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B56D1D8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EDE13020166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9298B3876D7;
	Wed, 14 Jan 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilBhHczJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/xRLYgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6A37F730
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383245; cv=none; b=jpqF8Lt5Zs5ZGcyzdmuKPAG4EnJyLXBe9dALV34VfpAJHbVMJKSouUqN8rGkVCZQXZFFMH43ff4o3iyTWyPGh2NlmTyjl0lZE67SID4VwgVNZPXzNW6aQtCUBdbr5QJ2KR7x7ajGNAEUFHV+KeXkt7fTjKsnX7ilYKRsGsZJqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383245; c=relaxed/simple;
	bh=lskpaMOVflSnNksHAhZznp+rYCA5OFUOv/tczxISuPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSmONwvpcfwvpLRjvBjeUJWGnh+7GqFVXBG6k8jkR5ZjLGHzyPeSHe8RypNtOLMrffHUw7NY84cEbPKZ8v231EOCQO1aGOGQvr3Y+lQAeC+sS2pag+sKc+PHGDqsr+u3QFAmiWCCsPDbnkJbeNzJWJ4vlzOkXsrqaZ4aSGwurmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilBhHczJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/xRLYgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jH5O147890
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30mGDZI96aGwmWtU6KYx4GGBJ5IuzYUxRp/LWAwWnyE=; b=ilBhHczJDjW5qFm2
	AUU3PVtrXjvO2YLCQDMpdf7rSCE6nwCv27oSc2dfb+7BcfHHbWEFgJ5aq/n+E3D3
	HmaLtyG98HvcJ0xucygl5e1FYo/5dcv7jjyAqw2FMXwHuJS2joorlYoRg78n28h8
	7Fgu4AiUpCRDAPquYlqp61ZGuw/F3jD80UxCMELFBBRQuNLRJUb1wKbnY3/QMTdc
	oOcKOKqMhejFnFyNP0DJywXpMqnV1YWO0LN2RKeTVVNLVwH66ki+R1jy35WhRrHX
	t5HLG4vmW4GXEstqXIYgMEGm1vJFa5FcGbx2RD6bcVRvFTGC2tCEMjkzx/BWxzwb
	p9wRaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6ragexd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:34:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bedacab1e0so239238585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383242; x=1768988042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30mGDZI96aGwmWtU6KYx4GGBJ5IuzYUxRp/LWAwWnyE=;
        b=e/xRLYgJBTTPk0u1K42rnwZQhe6y3LBgncvliUfuYNkiZ6tKHyN3NKBrkcNMBfV+XE
         SHXlsfo7isdY/QaCnWNKmLz5y0RMRVjX1qdFwqATjjCG4IXe0HJDbaaHTk/Dgt2hjeNM
         /o7ktFyK/JGg7h6EPAu6XaonnkNaR1SXXZDngOBFx6JwB3wFM8WbBztZVxJiHhvWCEy8
         qjjjP7MOoG4HDNZAU3YN/rf67kTWt6Mqx6vmu9rlD09VTevtJC5D9FKbnGBBOzLH4TFW
         biLpbstcjC0W0lVMSbXPjte7launcVq3JSJjtdZK4d+NqSDoFYFNlS3P0ZEg0xeTyhKE
         usVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383242; x=1768988042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30mGDZI96aGwmWtU6KYx4GGBJ5IuzYUxRp/LWAwWnyE=;
        b=duWwqm3Uv1n7k8uId7oA9CQyC4CPTiSYY8D8e1PiQzETt5g4TARGKJoitx02j9whSu
         ny+v37WiDlNuKm/MEbuYjAxWMqFst6VHM2z0Vi3aTsuEFSaFqvXys7WQ5jxvCVMZi+Fi
         FIfRx0zUPNqqCDZ7wFzTBDhnYCyZ4U/uXY0jcksLololG1WjFukkB1UWERvAeyn3XvjE
         PaCay/WuZOy1R7jU09BRFzeHV1t5id7iiCtLVYJtqfTDH+QOdRXwq2cnD1n26DiokynN
         TLs9b+f8pC2BBEH53h7Ie16RQL3/kFhe3WxfRL0CaQ6qZ76QXfvYRWkzUFw98dNdkoCM
         zxfQ==
X-Gm-Message-State: AOJu0Yz0awTi0w5S/dOV5D9Be4fjP9hOyjfYJMSbFCncngbbH6R+HGTm
	F7jt9VkejUKfk9Tjxuosb/eeXjmDpo/9tSrMIeFCZwpZ0vHOtICf5B53QC0XsHKBaY6Vh5S2YK7
	+MAx5mKy7euw/h2lBBNZXn7jnwQVCmVkiILa1EioAYHWKftpYJVyxU//SCvJ3asHvHZe8
X-Gm-Gg: AY/fxX5/ZiP2/R5LQ1nb8lOnSHie0jcpJLWJBv7xopYeFbC9YFUV6BAOgStTwJkJZgC
	aKJGY+JnvyyobADj6oRrtdERi7cBEdN6i/ZrLJVqhzrZaSrEyKJvegj9IGHDwZlS7GRTcGgUhJZ
	pV9GTlS22Je/qGq/IWGgqyiAa3SZsEIZ2axUJJaXQMzBUD3ISvljs0wKxMRW7sM4LkVw55pN5vx
	9rMoUPCpoZSuGiElR/0P1aR94fD8G2OMHyKEMT1zcVEXomkHbZuBmRXzmsOYRGYfNez1MbEgbIK
	0SEWOS1Y8DRXS97LJ403FjSGONQ2QgIjggo0VvyLhOr9ZnFHbvSVpMnFshFSSbhylAQvT9N1b9L
	2louP0S5FZ+4c9P7v2LD7+TKEaehGE09HZAOwwBonaTjYOFNyaNrcmVvZr1AaUDmhNAs=
X-Received: by 2002:a05:620a:45a8:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c52f96e736mr215569285a.0.1768383241991;
        Wed, 14 Jan 2026 01:34:01 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c52f96e736mr215567885a.0.1768383241499;
        Wed, 14 Jan 2026 01:34:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe76sm2424951466b.40.2026.01.14.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:34:01 -0800 (PST)
Message-ID: <46637460-05de-4e94-ae5a-73470cc34821@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:33:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NyBTYWx0ZWRfX4wvKHjmpSzg7
 8pFnOZ+9JHIwBh/fup31Z697oQJc/NN3o5t/RCHCTjkINeCIyuxsoomB8ncrMMbhUdSEnKQD9hP
 WSngiS4UD8J5nU9f5Vk0gYLGzNOWIYrPpVrotb/GUs38zI424o9dhaCMpEYTs0A/VGgmPhMO3Zm
 M+mNj3tTv9YthszOx+UdAQkfFAT74qMc+kDV3iLc38F1JhGnDOL4D6WRykI7tL1xJPjdLHVhCdu
 LczCC1srFxDsAcyfxubvpBdKeRUWVP1P/hOIWI00ak8jIAqss8oHkPRe7xZp4t8VgG9s6qw/2Ru
 +xFz3thoKenQXtMFBz+/KTcMUwgjPNYRqjpqsAb0ttrmRJOZrSB2esCfsRyle4FecPh7tQVFW/V
 OpBQHNKtwbZ01wkVugWRt0uO7gW0sZPCLBpwQJhEfs/rM9hq/o5BR+vBVaDcSkGRU47+1ol/9gI
 262oVc8mJOIAvScDzXQ==
X-Proofpoint-GUID: Z4T_bmutJbyDtjeLm0YcZxeSUQUr2ztf
X-Proofpoint-ORIG-GUID: Z4T_bmutJbyDtjeLm0YcZxeSUQUr2ztf
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=6967630b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=39RDWWulZT2pG2_OeVMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140077

On 1/13/26 5:41 PM, Dmitry Baryshkov wrote:
> On Agatti platform the ADSP provides FastRPC support. Add corresponding
> device node, in order to be able to utilize the DSP offload from the
> Linux side.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add more FastRPC context banks (6, 7)
> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


