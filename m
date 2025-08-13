Return-Path: <linux-arm-msm+bounces-69075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89191B25705
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782215A2382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696222FB97D;
	Wed, 13 Aug 2025 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mlm+B7aE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082652FB96D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125715; cv=none; b=SheRHYyFvLG/7Jxwe4lJv0oj39Yyl5K6SrWdPNN0AwTs5X59uw5Z0HQDHM6KRHUXhVLTyiwnhtOISU8/kfYQNigcis6kGvgBGLajoxyHXhEiKjFwpp6ZaeGLDXJR+HA7SM6/I08ehBNw1+CwdzbtfEYldLOm9HJKWEcRg5EhrfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125715; c=relaxed/simple;
	bh=IRDBklKokVrxIJWgP3cNp+cQqYoCCFC1419AdZuqIVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PayFCwkCKVU2RKUJYJRPThaZEy6bNlUyvk3CPG0r4p6NrvXRYu2tW1sXpsjOnA26SD9ENyD43zWNM3MycwGTs50NMimZ2QxS9mP1JapN+uOxSsSMSAiyU6+GBBVknwwb2eycDT9vlJTU6Qbdz9GsgZFXqhewhINLVfYoRGFYq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mlm+B7aE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMM2Cf020811
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15n6L+jgRmpWfdGPkRrYhdr4AzVdCA1CkGjZd9TinAk=; b=Mlm+B7aEgb/H2H/S
	oDv3YBRw/IDZV4u3YHPb4tiivbTejs8GPnkna/krIBRVh/pIFY4rUu4grVJHgqxI
	tyCk0xEe68+QpSiwZR/H93am6LkwTqizlc+IEMSmKTiw9CGfi4+oPMpZNlYMTDcC
	pd+mGYXTRSEumRe9sesQrsP+thI5f9LQcAEfnWR9zB+3AfrBZEkCZ+pOFWCblIXy
	KxHuGb2xwXHhuyFQmi/B8WSAq6nFS3P7E0aX6RdXF2OKpv9pIt8PMhFouaO200NX
	oAuun39iIAzL4kWzThwUwVS9FFDlPiqdQ5Z7LtRvinBXV4kvryspzZ432NYi0cJe
	6Ud24g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9swqtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e87031ae5cso8754685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125707; x=1755730507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15n6L+jgRmpWfdGPkRrYhdr4AzVdCA1CkGjZd9TinAk=;
        b=pHWr82DlWAni9kk9dGUEdjUZfzEkXiPV5OB6qaOYDoVYXvPa4EapmCibeYIRtAMxoz
         5SODuODOiYjzH2R2YhuiYfGyFR8JM321i5I8vrMWvCcAwhocu97I2+AUpo0KHKhbIZ78
         dljpIJ0UmX9yXWzbffj27Tjzaj/gqTIxyo9q3+vwvEGWQBkvD/xwHIWo2tf7zwPlh1VR
         SBE4WEPIDhnVVI1kQyCMnwjybsGmKMh012LchbrG091gKvoYWRXo4OC2tEUqJS5VMjDi
         FM5/HILVW3M0+D21H4DPpt6P4j4Ots4LoAygxqSuLMf0NWllXGkSSoQncHr7RLqaEm+F
         eOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0rvUBieQC5xTZkhWn555lkVTeF9QDJR7wj85q1ZM0TYryQ95RkOIE9by8ERS/79UXkBmP/rWW1Gfmo90@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1PHd7RJO6DCBkuYiD+0KeqUlb9sL4gNQ/Xh67WppEkWvg6R3U
	EdhhHX/mBfJral6Bu3bJWWX+yw46nGID8kkDwJODquOvVKKmAm8phAR5DZVIObkk7qmb77BNb/S
	nx9SxJI+VZL6aEYhLmbfFcBwiBXovRN61HgaQD+GWM+RM+lkDiSC32Hrpn2GEQZh7pggh
X-Gm-Gg: ASbGncvm/h9el4vgW6rqYPIWcr7+ARiN4k6XJjs7Q8dDWiogJ1+dJ1wMVdOGJAZHudu
	VTjsS17jr/P+dw3qRNQJ8UWRDB1u+A1yy3B1Ueui1tMOwn66W9cc5FX2+cidOlDjz2KH3Ag5gY9
	6hR5bAdV4UR5gcZ0fXjxkecMytpZ4NaBiR7y+deycIaQYiMCKQa45BjSP6M1U2JHb5VEPc+A8Iq
	s3Eymql9CqTcXCvd9ppKDj4mzdU3zcb7RprqvOlJPWdoOcOSlB09K/pZELmPi5+n3FwaG63TKxA
	blGvgvXABOsbxnadHpK7P0Avf7RTTCP72aWQrAVqruB1RK3WmpSCRnYAdjs7/a3FiSoLN6Hhvpv
	eXxFO3k3dszgCbBXr5w==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr341648885a.5.1755125707352;
        Wed, 13 Aug 2025 15:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+JE0kMKFEu4kSodVCBMSDyNOEdDfPuoTQBCZSYXiPZDVvx1jvbqJkcBjR+WKF+Ba2gnIkA==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr341646185a.5.1755125706781;
        Wed, 13 Aug 2025 15:55:06 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3cecsm2470000066b.53.2025.08.13.15.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:55:06 -0700 (PDT)
Message-ID: <cd2ded3a-ab91-4199-9edf-8acc8d6d11ba@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] media: iris: Allow substate transition to load
 resources during output streaming
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
 <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d17d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rixuZvB9KV6YaslLPPsA:9
 a=QEXdDO2ut3YA:10 a=1R1Xb7_w0-cA:10 a=OREKyDgYLcYA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 5ez9bd-WJwkQ81mz98mxzYErraqoxxlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxShgQFUVt+9I
 2iNGdxUiOycu1dUSoJUgivdU3Q9YI16u8+QXnqm03zM6IaVMVaRUJaL/PQuuWhTiPoS5EV77q+w
 5SHE/HzHZKLkd47oRE//++cO8XFPfxhgkfl5EwaV0zhFry1tv1HBLFIJDEYGDPQSYppkLai4nbH
 4p1bSGZ+nL5kvoibGJ4VJzBDFVRScK1bJGSvV4+vtG0MPqR2oysiW4GoUBiQCT3iAbHuVAJvbRY
 OPnHNI/lZlJg2O9plYI5ojWFP1qlNuZvdLsGcos/FP9TpiibOfcbI66Hnufe5L9P/e7ixvXPvxh
 VjgeM7W6aUrRoMR8jgAQbTV9EqT0MutPVSySDiDk7FwjSLdaeR7PjT0cuYPaJ+Jv6sPTTiIA5Vj
 3vVxnmIR
X-Proofpoint-GUID: 5ez9bd-WJwkQ81mz98mxzYErraqoxxlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On 8/13/25 11:51 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>> However, now after removing that restriction, the instance state can be
>> OUTPUT_STREAMING when firmware start is triggered and substate needs to
>> be moved to LOAD_RESOURCES.
>>
>> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
> 
> If a restriction has been removed, has that restriction been marked as a 
> Fixes: ?
> 
> If not then we can't actually backport this fix as the dependency - the 
> restriction removal has not been marked for backport.

Please stop confusing fixes and backports..

If you're really paranoid about this commit getting autoselected, see
'noautosel' under this section:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Konrad

> 
> Please evaluate if the necessary change you have stipulated here has 
> been marked for backport with Fixes: and if so mention the appropriate 
> commit SHA in your commit log.
> 
> If you are referring to the commit immediately preceding this patch "Fix 
> buffer count reporting in internal buffer check" then again you should 
> mention that in the log so _which_ dependency you mean is clear.
> 
> If I were trying to follow this series on some kind of -stable kernel, I 
> don't think this commit log would reasonably tell me which depends I 
> need as an antecedent.
> 
> ---
> bod
> 
> 

