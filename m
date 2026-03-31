Return-Path: <linux-arm-msm+bounces-100968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHSvLFKGy2l4IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5E366296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC56D30E1241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAA93DE436;
	Tue, 31 Mar 2026 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+7bvyny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZt+Wazc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE583DE454
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945383; cv=none; b=ZIejVyqTTruhpfd9+foLWLJ+1gdLPdu8TVtNZdGtqvxtrKn3av9h1ah5vncvoihzeBzf35b3vExlRNtgxFbm/vGNcGhRg+uWH1TGeA6j7gQP16SxjUokevSBvVB7Cg6xIp7yRS+VXiCtMx6xWliLh56pPrDpnSQ1D3w7UaO6Ppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945383; c=relaxed/simple;
	bh=8v+A7AQmb92O7SlStoMr11gQAb7+5U+SMRxrab0XdMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axzXq/2MX1An5mi6Jf/8gcEzwY6D6z8e4CD5LDe7oXNfT4aDOv2pelKr74nY1pmvVzLOofkUA3BIqgIffUqXggeUwBNIQsoXt008DNEKw3tSHFBAW79QlJGiF5jMvNbW2cs+8AIQ00VOkzA6CZdsNsokShBaeU6cH7qMwbbzUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+7bvyny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZt+Wazc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5l1iB1842388
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ty9ajhQdOOIwc79Wf8xk5txDu2PvCUdpTXfca71qAjU=; b=F+7bvynyr19IUZqn
	bG9LLBFKsQWN+ClFKtNxECjQmi2H3DaVvZOZn9uH6ocEmFgJNqKALpkOPFAFUWRs
	bSucBFqvewzjj+ZRjxRt1ki/mh76TVAwvLtShNuWwVIPSyNm9xtXMNzcdYP+pDvL
	GMGAiJKXlJbjgGyKU/sAWLyyz5X+cPLFkWrA76d19hY5BsAr/RvtafD9ACpdR5GR
	P+Evy/Fx8b5zF8u0iCHfMg0PpNkhV/haoVtgtaea/BopGnE9P2Z9DcSHik07pOjd
	KIbFqbVLEIK4xfHeM2Bg9GKNcaEyoJ4pL73IAMrorwK+Pa97R5GQ3K9uNcuuAWWd
	lVOc0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj3ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:22:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccb129547so19016516d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945376; x=1775550176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ty9ajhQdOOIwc79Wf8xk5txDu2PvCUdpTXfca71qAjU=;
        b=cZt+Wazc6vzjIwxV03myxQakKVM1NZsnmEwARj+dOQc+BAZPw9UsJkTe/UxvtiDr/V
         57UYitRA78qis3NYEwZObpgK9WrNzkW+bblwHTWOoSn91nk3E/cAVPQP4ZXDo0UiR2Rv
         j12dp1I8dXoJ5DKQLK8ZppHe/UReyJe4Ff/qEPX+fFYDU5ji3/xnrnf2rkMyIhhOlOd3
         WO0bVlsDGYDhtOUjxaXzETNeOZ+K3dtDNwcCfkS+q7Q28zTjLnsqIobFDnQwZYrna1vX
         Ko3X+4VBKK5lswcobE8+Fa07ACeZCJZcub3lfQ1dSmFE7zeWY4TxO7/ibPNnbe7JaX5X
         3lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945376; x=1775550176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty9ajhQdOOIwc79Wf8xk5txDu2PvCUdpTXfca71qAjU=;
        b=iEqLVMx0tFY7zalUSFSO8nUQX2u3HQaBT7zUKu6Ntc9VO7tdDthsWqhuqAD6tlocx0
         7NH9/zjzDLoe9z8rZfARBA/lx7eeiokZT+aYLrGp8qxOEq/hOEpkWX+wMa5rkO4qqM3n
         K1fb8O08Hmb6PwQoPJDL1NHgs4hhIWgDmOuM3Q2qgbvAtxqwhZ9iHXji5KTM4dx+XC/u
         68XP3w9mXkJIucvBrZJIAtBaLiSr/az49xDua1XsvHqmYNNYZwFzgEtcGgxl9XZS30Wk
         NRGMc7PC+CrZW9S+tpyLV+dz+eojgPw5Vm/c3lihlImJvllxkrM0X3FaThdsSO4YrY4z
         Uy3w==
X-Gm-Message-State: AOJu0Yx+a7+/gYqV0VO8FcpPyhlTGUEXnMU8PRwiQXJceboqVbo6+e9x
	lZsf45wIkMMO5OzUbt6foJLf2FXk9hYtEl49gG9J9wzjVzs995k6m9g/BCjuA+StLlb/szvcIqa
	3dJ57SwJGL2Up46BHMMGhB5cJ21MNO7Pv9B2kJPwDpCLWwBv/IthMJPoujNABkTQe/luD
X-Gm-Gg: ATEYQzx9X2FNuceWHVECONVJ06FLwXgvSCQgzXbA44n75+/TOrUc7c+DSWRqpQYJWsV
	cICgqWIT8XPE/I7Mm30f5FBow4lhT+fv9oisoN64ioggiOZqVr6+BVq8pBZyt+8RuscTEpWuBkR
	58iOaxpsNsQ4tDk+g0ZN7QA+GLx7B+II0tcM3D927aVgnjgk9NY56+7ORJRW7jbKK+TEk6SL7Wf
	brkYs8WKtZZctiNsLEvd1StgNc+44HmVqLm4ZbBW9pD1/0Vy0xn9xIXO7ecMssn/T3JhqbEKhZe
	GLulFw3z+q0qETS9hBgwIjqnWdaT6ro4chAgFxPcUG+1w2njrmWsBVFpsd23AIs7WAmaKaup9PR
	Umg+TCyf3Bspe4Qeym2IjMaUQxqGKgi9Yvd/2bReFDo7Ix4ui9+cTphXlfVeXvlJKUSo+7Xyq8k
	PY1IE=
X-Received: by 2002:a05:6214:766:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89ce8b8423dmr160477606d6.0.1774945376397;
        Tue, 31 Mar 2026 01:22:56 -0700 (PDT)
X-Received: by 2002:a05:6214:766:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89ce8b8423dmr160477306d6.0.1774945375960;
        Tue, 31 Mar 2026 01:22:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae522d4sm387153766b.22.2026.03.31.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:22:54 -0700 (PDT)
Message-ID: <2108dfe4-bbe9-48b8-b77f-e7d2904f18b4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:22:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] drm/msm/a6xx: Update HFI definitions
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-10-2b53c38d2101@oss.qualcomm.com>
 <3465929e-262f-407e-bc3d-7564787bce3d@oss.qualcomm.com>
 <67cca0c6-669c-4dcf-be3f-76fc46d1e59f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67cca0c6-669c-4dcf-be3f-76fc46d1e59f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6oUIpjTTj0l4HrqHnQDeS8eSo4FDPV2g
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb8460 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xmSHU_qjkZn9DgC3Z3sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 6oUIpjTTj0l4HrqHnQDeS8eSo4FDPV2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfX5k5vTCkze9zo
 dCVCYqOUHNih2URSIwM/DvqSe4w3HO89c+8oeNjziFmkWOK/+zpKfy1WtlCMNHoNNde5LJMsJtY
 EiYcKyW4Uv+wDhc7Sa4gAITKPZqmiiBRXlz3D86MyNXG5IYFK6eYJrAAft393YoFSwmJhGpjOq6
 SpW6oB4pmWSX6I2i+UX16Nc/GZQ0o25TEzCixCG9XiWr/nS2ct1e45mD38kJ3DyGAV2iluHaac9
 SAXovnpV4cJLNM0lIjlLYlun+K4C/Cp8beQTiZIgfcI0bBB/6wRDhJGOfCZ2lLpg5PeIFkXzw+A
 FtzpAmc62gMq3nhfRUUgE2T5IVXfoMYlLKOFTa7sLdC2kgwdbaIf1Hsv/GWOKQvFh04Eu/c7Khc
 CrkcA8B6OGNVJ1xFZ58Zg1Aw/oP9d8GCAIveVHfFL4zKuIYLEZyqh28253tRwABRO7DBbWr1fiP
 t/nXPd43Z1oGyQ+CIQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14C5E366296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 10:27 PM, Akhil P Oommen wrote:
> On 3/30/2026 4:45 PM, Konrad Dybcio wrote:
>> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>>> Update the HFI definitions to support additional GMU based power
>>> features.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> Whether you want to proceed with bitfields or not:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks. I still feel it is bitfield layout is a 'bit' complicated.
> 
> I did an experiment:
> 
> #include <stdio.h>
> #include <stdint.h>
> #include <stddef.h>
> 
> struct packed_u8 {
>         uint16_t mitigation_time;
>         uint8_t current_rating    : 6;
>         uint8_t num_phases        : 6;
>         uint8_t path_notification : 1;
>         uint8_t extra_features    : 3;
> } __packed;
> 
> 
> void main() {
> 
>         struct packed_u8 data = {
>                  .mitigation_time  = 0xffff,
>                  .current_rating   = 0x3f,  /* all 6 bits set */
>                  .num_phases       = 0x3f,
>                  .path_notification = 1,
>                  .extra_features   = 0x7,
>          };
> 
>         printf("Akhil 0x%x\n", *((uint32_t *) &data));
> }
> 
> The output I got in Kaanapali is: Akhil 0x7f3fffff
> 
> This means that the compiler inserted a padding between current_rating
> and num_phases.

That's because __packed doesn't work outside the kernel - you're just
creating a variable named __packed, so this is effectively the same as:

struct foo {
        int a;
        int b;
        unsigned char c : 2;
} __hotdog;

int main () {
        printf("Akhil 0x%x\n", *((uint32_t *) &__hotdog));
}

Outside the kernel tree, you need to use the full annoying __attribute__((foo))
syntax:

include/linux/compiler_attributes.h:#define __packed                        __attribute__((__packed__))

with that changed, we get:

Akhil 0xffffffff

which is the expected behavior

Konrad

