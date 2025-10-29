Return-Path: <linux-arm-msm+bounces-79398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CAC19668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033E8188BC33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E8532AAC1;
	Wed, 29 Oct 2025 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOXIJ5X7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFIuuh/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D455329C4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730612; cv=none; b=i60pmdxEuaPE8Wj5GCWY8/VYyOjSgudd8nJ0eelPeUDfxegSjcaAJFNecXPH/U7Nq//qWVrcMZNjhaJwmusxdKcPOSvVTQS9scp+gkgXjLvcuG8kfgFjsM30ZjF002QBMM47nJvH1FYZzOvnW7fexvTSIsEgiaT++8yeAizFvHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730612; c=relaxed/simple;
	bh=mUVFVXyWIuUdZYclv/LiD9nnidNGrwpodmI4ocApS6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKyPoJyOwZxck/wpInYVJgfJMffyrQFErD/WbdTlavfxBR4hJaaeVS5D/YhJadWlyg3OluCxo6Vik0b+oHLPWjYqJFYNFKKph3upvaQXuIlEhoqNn3omp+36va7+VJGCuz4SPUN0P42oZqcKTrTMMvsd8oxiVdvhIabOhp+MMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOXIJ5X7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFIuuh/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8Th6w4135566
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX+z0zuBmZ1IF/kipaR4w1lPQN0bglI+X/qgX7JeaWQ=; b=SOXIJ5X7NyS/x87f
	PCygJAZQV6pkM1a8VGccHJAhdgp1in90HTaJRBWqEjzQhVW+9TGIf/dr8ZqW9AHs
	NAdE9bkucW9GwfYl78PjR4oLHz3DtK4GaiRXwZJwtl5VyEFJnaUlCdxO7SDGXLLK
	B562o2Z7YIIAF2K7bQQTBf1Xnho3iXJChdZ3Xmlni0yyWK6ZqNEU2q/2+EAxzjmF
	5GI/r/xZXeb+LWgfBtgxSaggeWxNc5mZwcoGH8p7aixiuUoNDq3ROqEBPigWAifm
	pXs30nEKYoPnNq+bi2wkinBmZxutW4De8LPfD2c+mOMsW2JqjayOS22Q6OZkC5Cs
	bg2U+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r6w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:36:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb86039d9aso15710681cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730609; x=1762335409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX+z0zuBmZ1IF/kipaR4w1lPQN0bglI+X/qgX7JeaWQ=;
        b=IFIuuh/wh0MLjc3u4WqzR/DnAXWmVQsGXILjvzakprgParaRMu1BYbRYXMEENRQQXl
         MWwzzTESHWgOMsoLjnZtB/FQjmUEdBRuiu2lwHCSVwnkPF8Chlf5pItfSCsoHdHrAZPi
         tFeDmecRX2o9jXIxbi38XaACjCUyZWmuM6Kue7e8t3nTMY/jkoqcfZjU9l6yo3ozO3bC
         p7A4csU0A6XqESEVHSDcNjcRr2HOAfB1XYyYTask2MAxB6bBFhg3W3ssYxgtvo0DMAby
         D8Kg2kxiuc2wMi0Q8rhBHuM+MHwIMCjkbpxW1KiJfdCTKtOFR7NiPdLhQMRB0NYYHfgb
         R5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730609; x=1762335409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX+z0zuBmZ1IF/kipaR4w1lPQN0bglI+X/qgX7JeaWQ=;
        b=GBDy0P3SVyfZ/xyNXZiFPfeku2i99u5DEXxEZuklPjJbUZnLa0tB837wmo9mOVBZS9
         U2J2mWSBTSvK8Vue/tqOaIK6f50iJqtX9Sgbmo5UBoPNkl9ng5N2BWcBpUMMxBuqToct
         ocClNWWsBj/V0XS+RwHN0CqPP3dPQpjRMAFj0VKF93q/rL0tzZU7SZf+4LjArL/sIeRH
         4s8oM4CvpxyzzYwfxsIA/luqbXCXRTGP8nSV7VcLdxKrHGGjfhNWcAyn4JmwVopeQLLA
         6wyiYwNaZuBTisapLjxzPtJFF9fzxWt1hVSOQpUqGT3jEwpIJfFRuQQi/w+en5qsRMqu
         QRfw==
X-Gm-Message-State: AOJu0Yw49gIb68mAsKR5u+0rT7u61HPmk3JvmPHPnPTlOaVM65TqnVNc
	hYoOeqC2byFfUf/+TdD3MJtSqWUymE7IIZfOx6U3S6PDsGPWj+jBHuTw+/Y4es+VvXyBaKRhIwI
	2DQwhggCeFbBCm2vPipCGJZrl4dy7H8Mh8C2onXF/efwC7kM/hbnqVQz+WoWm/w8ftXW3
X-Gm-Gg: ASbGncvzf55gyCe1ZuhTDLGeYCAskfnclMadZ+hT93beQQhMKFjs6roaorYLx7a+X1y
	Rsm5AlKb1X49doDGVKC38i2BE+bMlNFl76uzHx1jNUg1RqEKc7akdMxy3HLuRdWLopDnJbfYhfM
	n34ddD0zlPyJC3AKu0HuFpe5ts5uqqOZ71eLWbJvvEEMW0BbulPW8vgC6TGVIbFtXztRiQGDTz/
	X1K/zeGBOEB1GPU034zcQaQfofgwjbizLcelJC1Zi91JkHu56em24mR219dvDw94DIgL7VURpUY
	TSJF3Um1xwJz2cq2aKRVfY2kgYh2M/X3rY3oZxBWnkf3OeCxHr3v5rxkQICq3qzGrPVMfWa0+Hq
	OjhPVhe4shsK9rNnJo1LV/hU5ZKoN4nFYQGdd4wp7BgpnxsMlyjzIl6ce
X-Received: by 2002:ac8:7fc8:0:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ed15b7550amr17762781cf.1.1761730608692;
        Wed, 29 Oct 2025 02:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiuuYOYZ78vOwZJBF8pnhsLeaffastPxwg51v90izy5tvj931KhAwTG4MlABhwJ5UScWforA==
X-Received: by 2002:ac8:7fc8:0:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ed15b7550amr17762601cf.1.1761730608194;
        Wed, 29 Oct 2025 02:36:48 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8530905dsm1366152566b.6.2025.10.29.02.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:36:47 -0700 (PDT)
Message-ID: <289d000a-b142-46cf-ad15-07ab8ed377c9@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <c83079bd-ebd2-49fc-ab62-1fba08276cc4@oss.qualcomm.com>
 <51f10d4e-3962-4c20-9d5f-afd0ac3f598e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <51f10d4e-3962-4c20-9d5f-afd0ac3f598e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4SjMqkXsLxE20a2_84XyL3Dlak7qS1ep
X-Proofpoint-GUID: 4SjMqkXsLxE20a2_84XyL3Dlak7qS1ep
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901e032 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=AlufK8GOJj28j8g1HjIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MiBTYWx0ZWRfXzwMPQXNlqdXW
 +iN9bcfM3RoGCB9e0cbYjhAmRP1H1EL8THkTLw3Vi+xs6srmEZi/D6Nnudv0+U6oNHjQGTxYUZz
 1882NEUmBnBbyLOa77OenCfkWtOheZImuUznwhtbGXhE+NmMzPxPxFgGpv7gn+YR6Ym0l64re1C
 V8hltwWHLgnJYGrvzZCUKVG/KXyJuQm7miSF+5yi/HkfnqqeiRNwgNWxusBaYEiNoOXb8Qy+MC8
 oXcbr09YJUoBvRao7GlP2j9nsM4Egt0YI/edepC7xDAwt9OSOjbY5GLuJhCcXuya/bvC0Jy59UT
 /Sc0DdlIL5koNE7GLX8aviwiT+8PmlX9HGZyHDFSFNaO9utpxP4Bcb6H1oeSlehcjmv95pDzph8
 07jSzmEIZ2f/zbc3uuqnZQtPhXpmow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290072

On 10/29/25 10:35 AM, Dmitry Baryshkov wrote:
> On 29/10/2025 11:33, Konrad Dybcio wrote:
>> On 10/28/25 9:59 PM, Dmitry Baryshkov wrote:
>>> Historically all devices manually defined GPU zap-shader node in their
>>> board DT files. This practice is frowned upon. Add the zap-shader node
>>> on all platforms, define a label for it and use the label in order to
>>> patch the node with the firmware name.
>>
>> I'm not sure this is much of an improvement, since at the end of the
>> series, boards still have a &gpu { zap-shader {} } section, with the
>> inner one not being referred to through a label, which reduces
>> duplication in the single LoC used to assign memory-region, but
>> doesn't e.g. prevent typos in the zap-shader node name
> 
> By the end of the series the boards don't have zap-shader{}. They use &gpu_zap_shader { firmware-name = "something" ; };

/me wipes glasses

You're right, I skipped over the last patch

Konrad

