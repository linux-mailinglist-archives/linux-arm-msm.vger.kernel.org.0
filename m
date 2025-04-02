Return-Path: <linux-arm-msm+bounces-53008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2BA78A33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4293A3B5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E268C23535F;
	Wed,  2 Apr 2025 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTvHY+K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28E234973
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583344; cv=none; b=osiLPUfWrJRXLDvKF8kJzTkU4ssz2SoZa7A0UH5+5+9WfyfNXP/hOu75ZgME7ECCI91YSR7TNprpt9rw2zjQ0rIA06WVAeDOsSlfspD43myu83lGoqeAaF33Sos/b7UZiS3I3MAtpOuIAUUiT8C9Z41vMpItAn89c42plBgP4Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583344; c=relaxed/simple;
	bh=K2bw+1KeHp81EuZFnQjbluDFd1uJMgLd3nwq4NNYKUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCzRe4m44Dthob7OcM+P5NKzdCrqB1fR7yotdwqIaVVCjSJT03yTmR4oo7peIPgdDTcT5nOuwCyndtDrnd2nmb+sgq3VnjTX3+C0Dg57PbHHIf425gMWBxp8ZPq5yC3TQiM+pC+7pqqi/Au0b/vLONNE8mWktmTLdIQwevV761c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTvHY+K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324KKu3024541
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 08:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfO7/bGre+6kk4wzIfdSX7eLLfl7DhFr+sFCeDK2cj8=; b=hTvHY+K7d6pykXFm
	1mPPA03izIeGRhE7Ryb0ZFt0gnO6DLnQT0p5YmbX40/G8+wK+sCeMt/cfCBi3uxR
	RKqYqL1wSQr+EJTja4/1dtxXfFGZhIPlDYrV3dT24GCdZLLI8wn1vjQ/417/4+Ry
	iyAQHDlDf/mQ5xYTKC/cO4S3UBmsuOaT1/kKWkX/kgUPgkPmJZFMG/z6e5Y9zoaF
	579hrjSys7eA0cxZj1pnu0SwB0Jqwi//Ary0rP/FhG3FFQ3fgRpH3pNZAPGTgdjD
	2++GsvN/xY5+jDJvKVua7oP4SCWYBYyLUevp/YRCghI88+lUWdv3fKpkFBYZ44Pa
	7aDCGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyusx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 08:42:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54a6b0c70so607807885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 01:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583341; x=1744188141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfO7/bGre+6kk4wzIfdSX7eLLfl7DhFr+sFCeDK2cj8=;
        b=I5P494nKZmgiN7NhObS5iY4qkknS7pgJZiubnoew/w/2DmXLs9woUt2Np8Z5TTsELO
         amnMXnhhMZe0d+T2CUPfnAAxmx24g48Y8HKT9CKbCbECFLhtTqaNUMPwIcIshVvn7ZVg
         CF41WIlrlCoFJK2s99g4wZwcUGd8w1kYf4CQtNazEsQbjb9VjA5Npg+XEROQDcU1PpGi
         9J+zwe48VlltbY/3ypHIcNatOLt72r9arUXgt3cGf/Rb2PJqLfkmYxWqdNt+UGKBJR3O
         4iUT06uPI9pNMY2GU/JsQzPv3Nawo6C2myLc5P97D49vuFoE8Au9pO5HPc2U2lHPzkkl
         88NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG2vDYr7pogvuhlL8RaSAD/Yb7dJmy0jXSSwFc07HNSgGpLr7Lq6Z+jFMIUuXatnv4BvA0d/BC8Ru4ffQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kf4fTDIB1bBr1HjDHEe6bkEe+YuhSm2W7UA1VpjHm1eT0zNi
	2+UTOuGh1oxJ0SL0GXJ6Irk8AgFeDeCXHMGiDMDg50Fqy4vy9QVaPqE1bWjtefmoUaFW69zhdD/
	1/jjHRmb6Crc2cJ9X3Zrw2lTwAIZxV4KQJfTtGAkp14BGWpoA7hVFKnrCgzz7jQMO
X-Gm-Gg: ASbGncsgVKj8w1PV752QDrkp/uMAtHXan36nEn85dmIqE9TukDPKBO9vdcXii/vtYUZ
	QGEJrjCneAK/wSSBTNFgadf9oEz5GHHZyPqKlC3OpslB0a56iapdfk1QRiexm0dHObCLPc9NTbv
	7SKoQUPBYbNo6izM7hGkFEoJRj8FFE1G4kR3kmsu+lyhDiyCNEPWAIds3GPLaa85fk5VCZxkbuv
	fsCYPYDbYNDauxKJbZd5Rshd1p1iByyzI17NYoJqXc79wdQzEeGOtTVNzf1XdSGVzGLGwryvr37
	elEb1OOnwKNdBli6farTnpygznc39YqBnEp99gRQaLE17ljwp3rF+K2MmMftuumuV8EC8P36wBp
	er0U+qoJAnNRSlYm7NcKaoeud6UMPRALAQvptKg9Krd7jIgtNMD/Iqm8Q8RaZldiVcEeiY18u
X-Received: by 2002:a05:620a:4484:b0:7c5:5fa0:45f8 with SMTP id af79cd13be357-7c69071d9camr2031704285a.17.1743583340906;
        Wed, 02 Apr 2025 01:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2MsXpi9YoQbrkM+I2ZTcI04QtJYTcA45hj7d6mFakfAdQJGJ6n7LSqt3GRBFrZGPDPSf6Vw==
X-Received: by 2002:a05:620a:4484:b0:7c5:5fa0:45f8 with SMTP id af79cd13be357-7c69071d9camr2031700585a.17.1743583340459;
        Wed, 02 Apr 2025 01:42:20 -0700 (PDT)
Received: from ?IPV6:2001:14bb:673:ef86:ad54:6866:66aa:2ae6? (2001-14bb-673-ef86-ad54-6866-66aa-2ae6.rev.dnainternet.fi. [2001:14bb:673:ef86:ad54:6866:66aa:2ae6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a034esm1574317e87.216.2025.04.02.01.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:42:19 -0700 (PDT)
Message-ID: <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 11:42:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
 <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: djBQ-q5PDSic0GLnVeCEQaHxv5i-t_9Q
X-Proofpoint-ORIG-GUID: djBQ-q5PDSic0GLnVeCEQaHxv5i-t_9Q
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ecf86e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kzd5r9BBUjDB0T0qikoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020054

On 02/04/2025 11:38, Ekansh Gupta wrote:
> 
> 
> On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>> GPDSP remoteprocs.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>>> ---
>>>>>     drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>> --- a/drivers/misc/fastrpc.c
>>>>> +++ b/drivers/misc/fastrpc.c
>>>>> @@ -28,7 +28,9 @@
>>>>>     #define SDSP_DOMAIN_ID (2)
>>>>>     #define CDSP_DOMAIN_ID (3)
>>>>>     #define CDSP1_DOMAIN_ID (4)
>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>
>>>> We have already made the driver look silly here, Lets not add domain ids for
>>>> each instance, which is not a scalable.
>>>>
>>>> Domain ids are strictly for a domain not each instance.
>>>
>>> Then CDSP1 should also be gone, correct?
>> Its already gone as part of the patch that I shared in this discussion.
>>
>> I will send a proper patch to list once Ling/Ekansh has agree with it.
>>
> Thanks, Srini, for sharing this clean-up patch. It looks proper to
> me, but I was thinking if we could remove the domain_id dependency
> from the fastrpc driver. The addition of any new DSP will frequently
> require changes in the driver. Currently, its usage is for creating
> different types of device nodes and transferring memory ownership to
> SLPI when a memory region is added.
> 
> The actual intention behind different types of device nodes can be
> defined as follows:
> 
> fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
> fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.
> 
> The reason for this constraint is to prevent any untrusted process
> from communicating with any privileged PD on DSP, which poses a security risk.
> The access to different device nodes can be provided/restricted based on UID/GID
> (still need to check more on this; on Android-like systems, this is controlled by
> SELinux).
> 
> There is already a qcom,non-secure-domain device tree property[1] which doesn't
> have a proper definition as of today. The actual way to differentiate between
> secure and non-secure DSP should be based on its ability to support unsigned PD.
> 
> One way to remove the domain_id dependency that I can think of is to use this
> property to create different types of device nodes. Essentially, if unsigned PD
> is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
> both types of device nodes based on this. Otherwise, only the secure device node
> is created.

This sounds like breaking backwards compatibility on the userspace side. 
You can not do that.

> 
> This raises the question of backward compatibility, but I see that on most older
> platform DTs, this property is already added, so both device nodes will be created
> there, and applications will work as expected. If any old DT DSP node lacks this
> property, we can add it there as well.
> 
> Going forward, the qcom-non-secure-property should be added only if unsigned PD
> is supported. This way, we can clean up the driver completely to remove the
> domain_id dependency.
> 
> If this sounds good, I can work on this design and send out a patch.
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml#n44
> 
> --Ekansh
> 
>> --srini
>>>
>>
> 


-- 
With best wishes
Dmitry

