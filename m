Return-Path: <linux-arm-msm+bounces-55159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E4A98EC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B41460D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAF827FD60;
	Wed, 23 Apr 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvTunfoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E0281529
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420243; cv=none; b=goANteraRR24g1dHdERgwZq2xkS/Y1MJ7VQhaMvOar87UUpB+LuZd54DjAfs4ySwcLsGriWFupFnlxHIAfZE6IEHv7DZxuunWG5aHWAU4Db20o5Mr0mvRF+UdxFOZCbTfehOQv2CVx2JT4OuM6YZcm59SGpnWSSnNc0ad7u673g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420243; c=relaxed/simple;
	bh=48oi0bMYSWCsrjjCcocriFjUmnSTwf74bn6dRV0xbTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7M3DXrKHNvhyXj7o/eQPLFjb9gGZnlV3l5gCLe3H7y90ybI7GuDi2tBXIs5tc51Sw9HEG45Iah4hU5t6pVAUe2TZXie8s/3FSzudwegWRa7um3J0z97hvGiR1IJc1eVSY7JHo3eR7waSOzf3s8cRSSgSO8qylTRBKYZRhyge/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvTunfoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAqBSx011871
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=; b=nvTunfoHTEC8X1zn
	QR3LnOD5QTP/KHCQnZIJv82ptdIsFjV36ZOl9IqTjeni4mcK0UCSfuaHotPOtdnQ
	LRFlVnVToEzL/RCq+yzS+kr2blw2jFwvXFhdz1hQQ/9qt9Dc8OfwsgqoVeFmd8P0
	gdLz0Oo7Hce459E4OKdZUpawGnoL2D7NN+k6qIvtAUU7P1Zk2tvJTYcj5JxUl8FF
	s6nOSZToJuSFP7JaE6GVZcAVym+2VVsadr+VQe2maYe42hf6PQ18LWVglfEwW+4z
	vV5t2kd+cJL4Fylk9oegXYXAfP5TBW0weF6VZQeubaNApbLei7NRMQv+xJ0veAhj
	Ll0R6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1jgx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:57:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53d5f85c9so137140785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420238; x=1746025038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=;
        b=Kh4JYhND4hHcYzmYumpdcY+6ANd1s5eqe/Vu+3j2d9JWVGJ0RnPIx4dyhSvUecwNFe
         GMT1kzmjxrR9xPy99tlfbm3I83iayKDSVF6Nw9y2GIss70VUfMxh1xQx5GH2Q6IVxjQ4
         7+44SCTxClf2DsmkwlZnQfXfDQe2lsnHhk+zXoRLNAQcNFKu/06HRshnx0wOu5Fh7P1X
         9cFJWR4NnJR5ljiB6qBMvZhCHKZUxivbddMS81fScKyMHB6oTNgfyhzposqeqDREPZ6b
         WSUQL1IDhHwIaObl5aPc2Jo/GZW62oQgYVDUkQjnf0Q00BbICO4wx/7Oy52jbCNbNNHF
         6nvw==
X-Forwarded-Encrypted: i=1; AJvYcCWNtnxMQLCWNR5kWyIosigGNRmmBv8phG+3rM9Nwt0LvGLpyqHOkECaQf2MJqG0QoZDtoAoQ0MpWTG4IGEk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo8uY4djkQFQP8mRUZ/fI7N21i7vNCZMfh2gnvAV95V5ztZXJ5
	8Wpf2OdShMkFAWYtg1Uu6jk5BqlWIT6lxpHV01vA8LL9xfhL/bX6NzEBCGBxXER6HbTdxweE0nc
	PXzTUMnWIxDWgPN5/75Y0tSIRe92Q2PnPqUWdFiwsM2Zm8t1p7Xz2tuJS/Jr84Ag6
X-Gm-Gg: ASbGncs8GNiVvVPn3IXDC0+K6mv4wG7TpvXfXiYyYGfeq+JiRKrtBijASad421MUFEw
	m3Y7yhQjbW6Tj9JFx4rwWZ5EdYiQM5AMEZyriNWCL/+vkQO5BEPCkcLafkvkoX72sOe+j7VgJNS
	KUnd5BKGAW5Xj3WUUQjmBPa39aegowbnGTc8F4kHg6/Xg6NV5qlUw3rmGVcWbcyK15h/E7Eb/Ei
	IX/+JjqRYfgA6Q3h/u02rxojmH7KGaec1LAFNSlP0UtFrQm0SsiEH8VuLPT5/EdO0LV3uYlEfwS
	Kxrn7X20pZ9iw6hjZW32+gDXq16A+tpVEwXSKTU16FWbZXX96Ys3DlQwxwy5dS+6aN0=
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c94d298995mr245300285a.8.1745420238248;
        Wed, 23 Apr 2025 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7NASz5S114ThP0dvyExe5F00+leMGaZwFVeXLrWh9p/BkVwDIsMC0C1e5A37iHj6HGPixnA==
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c94d298995mr245297785a.8.1745420237855;
        Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62594985bsm7594334a12.74.2025.04.23.07.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Message-ID: <4b1f9228-2600-4d97-a60e-9099878b3f2a@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        dri-devel
 <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tl611F5Lhg-22LR95OIK8B26WLfYyavh
X-Proofpoint-ORIG-GUID: Tl611F5Lhg-22LR95OIK8B26WLfYyavh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNSBTYWx0ZWRfX34HAYaCIOYQQ Qu1s9GA4WeMfi4v97RfJoMCWxFHzeWVntzgBRS8pi5VHmh+PsvyuzeZ9E7a6hNclR9DZPsfQefC Oietp3Z9mT8x7qUdQxaLf0IccKolzibBJ4XPDF5p78o/PiI4Iqz+hceApvUwuy0SxEu/eplxlRW
 gfzd0b2x8/i9joSICVSXBM2F+Rmz/oLy/GAhlCtfg3iHguqvZvwGFA0+cTFfLHCEIxeZ9N0zgpF 2JWql29yQRcgPMOy+PkqcZ0fonwvxQcyxB8g49uFOIgrKMVGKYjXPlHkIxrOGFs6ZieivRKXMg1 Kiv1+GSWGrsaqxVI0PHxpq0vqYctnbmfVkMfW4JYIDepthwTaREDgkEAD7vEJ7BseSlK5vyIcxD
 Ypovfqg1vb3ME/zLZbfE3WSRhPf6mae8SWdIRx5bL3hVoREqNY1pCP0jKSaB9q2p/RVCfAHT
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808ffcf cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=INHOtyMNgn4pQtdJY3IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230105

On 4/23/25 4:55 PM, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>
>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>  {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>       }
>>>>>>>>> +
>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>> +     if (hbb < 0)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>
>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>
>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>> here.
>>>>>>
>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>> is unused in production.
>>>>>
>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>> clear up any confusion about Mesa.
>>>>>
>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>> memory type... do you know what source that used?
>>>>
>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>> to detect ddrtype and calculates the HBB value based on that.
>>>
>>> Would it be reasonable to use the smem value, but if we find the
>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>
>>> That would at least give some confidence, or justified un-confidence
>>> about the smem values
>>
>> The aforementioned value is populated based on the data that this
>> driver reads out, and only on the same range of platforms that this
>> driver happens to cater to
> 
> Did I understand that correctly to mean that the dt property is based
> on the same smem value that you are using?

Yes, abl reads it out and modifies the FDT based on what's in there

Konrad

>  In that case, there should
> be no argument against using the smem value as the source of truth.
> 
> BR,
> -R

