Return-Path: <linux-arm-msm+bounces-53007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C97A78A23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574131892981
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C325323536E;
	Wed,  2 Apr 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXlwdO1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4D234989
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583140; cv=none; b=fS5vIVSHoa1cRogAjaSVU8gLZbJAFMZhubnwqQ6WG5KAuCS3wkvzene0wK8spaUXmGiD9pJDEVIKsQgHJNEeeGVXb3d3H1xU2ApmYjX/kD6TSE+PEngeA5ok0urMZl/7dMd/jLRxvZgIwh1HSGcf/h9n/t5CXqSyf9lc9feEJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583140; c=relaxed/simple;
	bh=GXqn91oM87dfs6ORjh1DbmH5yqUbfVcBo3QmJoJCJ5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1YUHct1XQ1TeL5TX9y6vkum6zdPXH3cU4htRTHb7NU0O5jp2tH/b0Sr/HVPK7e5DFsQMuO2pv4kDO9niJ3BvMjC5q5kBZ490czk2OYgVxznDZrn44e3/xSzHJvvY51zaSUui0VKoDwbNixDVfIhEmVrPzT2sdbGeIuSQ8EQQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXlwdO1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324XZ4p023742
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 08:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXqn91oM87dfs6ORjh1DbmH5yqUbfVcBo3QmJoJCJ5E=; b=IXlwdO1mKEyHcZRa
	8XSR1STQl06bFOaPLdH9iaSGLzlA9YfEP6OuEh+Z2fr0jaVqR7WlSSsYxnxDuW/l
	lKp8Il1cNNRE8ogH3Op9dQpHjk/cEWzrlRgH4tpW/ICDPoy8OwKxgjMmmUlZq+m6
	qKtTB6gtGPcEx10ZwJDThTxQUC60vmOLe2OwcVMqhywt+bx5MjeQfDmRqQV1lFEw
	pwUp1s1HvcI4RdmCX6mw6T9wQh4rntseYmAdYeuCPf8fUv8tZ1QOVarBldiebvEi
	Sej2G+1ZFD9lrDE7kAoWY5Tz/0+TNsbytrhyjUv7OUhEuJpSGVNLmGqLYiPPkRUa
	iqqXng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxaprmmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 08:38:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff82dd6de0so9246864a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 01:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583136; x=1744187936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXqn91oM87dfs6ORjh1DbmH5yqUbfVcBo3QmJoJCJ5E=;
        b=dFz8g7KD/95+GrBOYl6Ksc3T51ZTGa0ra30p5Zxp70Q6GW8AW908R5RWAEon9xgBD9
         RtdtI4OyIxMRRuXVRmQ7tdQXAdmX4tmg/K8jBl4P3jFqwowZNcnZ74T/0Xk+yVDM3AED
         RTYnrbAI7rBfVJyPEMhnE6j6cNP0PL9gMDyIU0vqqcN7a2EPu55ynSM/1t6o1Dra+1Nc
         Q9+t1Ovk7dfMps9IPxLrcb4M3ZBYY0L2U+cygwRzzb1xOYwPTDi9jzaEXr1L/vpDX79e
         vbgqSYLvOB803STy+TVbEunZLoUjQnNv1iseBp8Owyif73erhGOO+P7uQBoJ53A9D4PG
         MLTg==
X-Forwarded-Encrypted: i=1; AJvYcCUA5RZsDA09VFWoBbpwD8cAJqYZU4q9A7Ipl2nCmpYG0UdebTkvT3RNl3SWdTwiesCJoSfBSFc9VmcIEmfe@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSuC1GJkQkvYfpmlbPbvOo92QEY3wZXLbW5yvr8ovpZPJNGIN
	hKhskYtmiJ+oATXDpqc9xXcFqC8KLCEZrBi0fqdrFZuj03yF/G8HJONGmG+6Jf9PGXz8nmS3Zbb
	bXPDAfPSiOpSiH2TyZuTK1TKzmkuRbS3GjGotEe/M0Wb5vRmvet/g9m6OnDT/w498
X-Gm-Gg: ASbGnctqsf7+2rvOSMnn5DVXRIXPM7SnZQoRyNplVKbPto7GFOoF5BDuQmr5uzwhtam
	dJgczrzlrwriP3/61W2eRPxHszRdNyzqs5ZO2ULarNhQM86wbwiaO9zU8Wqm0cV74fDINQmICQj
	9T+kQ0xVkHBnMWqm9wZ+ZLcZSsVQYwpe2BA/Ih77wW/C535gQXFuRrz0nQ06J/9ctyXhOL90Zg9
	KeTswC9bhw5iihKHUKaatqx/U/iMu5nwB+6lq3M1UtiC0j+DfAzA9i8yyEqq1pjIRWlGkcSMMUt
	aqK6v32OHywdW10AS1f3DG4rjuQmMHjj4QDu4OMZ
X-Received: by 2002:a17:90b:4c12:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-305320b95e3mr21253093a91.21.1743583136521;
        Wed, 02 Apr 2025 01:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpsxlI6jN778d4IK6ZYalPCibRjZVRcQJLRGaiqCKzoGfBMcE5UhmULWg6FxU234tpItMNQ==
X-Received: by 2002:a17:90b:4c12:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-305320b95e3mr21253061a91.21.1743583136052;
        Wed, 02 Apr 2025 01:38:56 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec52cbsm103025065ad.37.2025.04.02.01.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:38:55 -0700 (PDT)
Message-ID: <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 14:08:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ecf7a1 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=EjjHKn1hvHTiu-shZIMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yNvgOAW4nyj9H783jrcYTZOGuiBRkom9
X-Proofpoint-GUID: yNvgOAW4nyj9H783jrcYTZOGuiBRkom9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020054



On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>
>
> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>> GPDSP remoteprocs.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -28,7 +28,9 @@
>>>>    #define SDSP_DOMAIN_ID (2)
>>>>    #define CDSP_DOMAIN_ID (3)
>>>>    #define CDSP1_DOMAIN_ID (4)
>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>> +#define GDSP0_DOMAIN_ID (5)
>>>> +#define GDSP1_DOMAIN_ID (6)
>>>
>>> We have already made the driver look silly here, Lets not add domain ids for
>>> each instance, which is not a scalable.
>>>
>>> Domain ids are strictly for a domain not each instance.
>>
>> Then CDSP1 should also be gone, correct?
> Its already gone as part of the patch that I shared in this discussion.
>
> I will send a proper patch to list once Ling/Ekansh has agree with it.
>
Thanks, Srini, for sharing this clean-up patch. It looks proper to
me, but I was thinking if we could remove the domain_id dependency
from the fastrpc driver. The addition of any new DSP will frequently
require changes in the driver. Currently, its usage is for creating
different types of device nodes and transferring memory ownership to
SLPI when a memory region is added.

The actual intention behind different types of device nodes can be
defined as follows:

fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.

The reason for this constraint is to prevent any untrusted process
from communicating with any privileged PD on DSP, which poses a security risk.
The access to different device nodes can be provided/restricted based on UID/GID
(still need to check more on this; on Android-like systems, this is controlled by
SELinux).

There is already a qcom,non-secure-domain device tree property[1] which doesn't
have a proper definition as of today. The actual way to differentiate between
secure and non-secure DSP should be based on its ability to support unsigned PD.

One way to remove the domain_id dependency that I can think of is to use this
property to create different types of device nodes. Essentially, if unsigned PD
is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
both types of device nodes based on this. Otherwise, only the secure device node
is created.

This raises the question of backward compatibility, but I see that on most older
platform DTs, this property is already added, so both device nodes will be created
there, and applications will work as expected. If any old DT DSP node lacks this
property, we can add it there as well.

Going forward, the qcom-non-secure-property should be added only if unsigned PD
is supported. This way, we can clean up the driver completely to remove the
domain_id dependency.

If this sounds good, I can work on this design and send out a patch.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml#n44

--Ekansh

> --srini
>>
>


