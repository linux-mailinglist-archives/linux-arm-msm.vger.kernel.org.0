Return-Path: <linux-arm-msm+bounces-107535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JI3LoZwBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:49:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5853E835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20A183022971
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A8E3A4F5C;
	Thu, 14 May 2026 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxFwvY9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avVTcypT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16553A4F51
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741288; cv=none; b=pkCjoUHXMXWpiiYigo7zxpOkJslkR7A9vU3PV+8SLy+JGiJO2bPRcZyxn0GKpEp+vzE6JfIRFFfkiRULNQUJxXZi8TV6QnvxDsRkjsCbNCT1XZNR81CWW5vtPfzwOCpggwg1u98xcMddqi/r6494fCcNP+CjGUsJdV/yZ0cM5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741288; c=relaxed/simple;
	bh=qpYInB19+KWB5dpwoxZNhko/ryAESkSZ2TXgzDKRXSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxO7oJLvHLQ23yBd+W8Kb2gaLIPl7F+1mVaVelY3ro0vnJwF68rVpyey26HURmuuf2ebqJ+TQga8z4iRS0mn/vBa0kr4fr3P13e5OwMJQpGxM17eusKhWDDEDNw9nClqOyKptekvcMs1KhKwOwrk4UGcbC5Drhah+3Ci1uRQkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxFwvY9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avVTcypT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E5SBvL2003931
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=; b=BxFwvY9dmeolgFNT
	rxtfCdlUKx0M67AilD/55CfJDr/7/jIa/LJgMnmnuiUC3HdG1PbTeFJVsq1ej0F4
	v0r6Joo67UxwLAsVyF9vrnBnwahlb4+QJ3a4T9UX9k0Jz4BhoB3Skk4UdGmNIaVm
	llflerEmcXADzX7fiTolPXIkHPmWE72n/uA9RtOzI66mcaP2lws9fTQEiDbsw2nH
	WjctpSSSDZ6x+gXfPJ0wS56FreTRM9USM4ZoGFnvhPn+qVQyr6ypsNaId1O/oIab
	Z8u2UpDSIqz9F8cIPRvIQaNrDu1ne316JJtUCP98BIqP5yRbhs1DW7FnNiLhhXsz
	EPQ41g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899r82s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:48:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8292e18166so2395798a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741285; x=1779346085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=avVTcypTd2k3brioJDqSVx+mvA7VyzCNvvgss/MohQxQcsdnInXJEHIIzgDUfJAtZt
         pUN9hssXVlkEXjdsOPGnih16P0irYJdYg7AfzYzw677/3lpem2+3HNqKpCAciVSVgppv
         J0xRH8EIC+erEq8H5lhxfQ9/7O8SzNOsJ0BYfkvWcAGiV/NMd1UYu9U8azZepDgX417k
         y6xt6hhrRqIo/cbGnnsPNr9nt6/sot3cpjbeurVDS8S2VgY4t8y3tKoobgPeRESspxLu
         XFM8nCQsxncj5YaNQQae1C0Z0ajW6BSXWYUouSffRS6wAGXulQS5jjKK6iNKtHxw4Nuo
         Xmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741285; x=1779346085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=iNaP6hPgzWxC0nXLBUXm6xaIEATV9UzRGB1fxe3P9zAM5YeEJcd82LU50Yli+YHFBu
         NyYolFj1nTSlcvHYXxaqTMSYPsMb/lC+PIOnITEZfgnIzKdyMfA2zmukzIRtQ91kTAdm
         idfeaR+h79x0mC3ol0R4xZLKe/AIgonzmrHhQWB+LScplzKoZDzhNZV9ukClJM6PdjCl
         HEJA/kR2zFouDGAX4bWs1M0MjUCOn6Xm9a7+OIr+zPzkJ4bZeV3q+r9315wf7Z5Ilhot
         bcWjujzVWv0OhO0N0kiVC1KlJzivqeI1nLGBSHkZDyYgQZcTtpWAe1L27Ai8soIyy3f2
         IGbw==
X-Forwarded-Encrypted: i=1; AFNElJ/yVS556DERXb7wLQB6NzNECbiqHVEffPCfqCdiHopvmK3swIO4JA7wE392kMFlDKONAQUsuyl8/zPydzdC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1aookd3h5Ud9EKIi7+cftEK6S5Ps5WrpBrTZbiwdhdHSlHtre
	7Ww+uUpNk2uX2cgiZHaOpvZhW4PdB2gKHuFSAAumy2qovPZQ3hjr7iSlM6a83NF9QoYkwp6fRR5
	8Lf1DHBYFDM9K6r0VpA2bOJ58DCeZ0zC0iJ79gZrDMeyG4afRk/tZF1l92LA1BNnRHTRp
X-Gm-Gg: Acq92OHVMSN1R7IJduFfC0Q3nOYFu63a7fEykUqaWIg7ynTkp+y4VgCHXMVW7vFkWvZ
	96WKdow3SiuKhEuINULZqmlNKSmh9coUjX3xM2RxoYe9O4M4VXBhUbBDgiTp83XFeB1keNPD4VJ
	rqaopv3V08NNe2epiq6QzDsSnBk2PjM5eN0gw5ngErTOKAxHc589GUqqn9YePa5PtLNqglmV6XQ
	78qoyLtRwrHMy9CK1Ydz9nyXsLgbj+rKWNaNC9Fclqt+Q/co/y/wbcLq8MEqmqd6hDsQdAQ40+/
	jAEydg67m0jWXOKe9JqWkjmpKCqb1PvH1df1h88Z2DGjvDqKGJKlhPOoCyinqwm7Z9T4u4AQXLd
	ZZAoTAxETOZcbEev8W+tayKVDsW44DN9OARXAQmvixbUShifQW8g=
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7390024637.18.1778741284439;
        Wed, 13 May 2026 23:48:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7389962637.18.1778741283620;
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660f9sm1952912b3a.10.2026.05.13.23.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Message-ID: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:17:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfXySQeKkYwc8c+
 V5icZuuYx20h8a1aJaPvWrx6JYU0xW/Auelo7IamjJ/QXsNJgLTA8TAC54qerPPwTkwTTroIjpA
 0bYDLGKDB8w0I2OIMARlxv8OMhV1HO0boPK8F5no9Jr6HV9gLcNhOV08TzID/zL+UKMKKucLvWi
 7HVHHgf0Tg8S6vu+kyUCTZylpAapNlnP+7XkJrCSPU+X6zYBeewZB867n4DGOE4iLVn5BroWI5R
 D42Gp1SMA8vSFKMxFfk2ZelVQKjrBjdgVtwrQDkYWi6T+A3lgtouXVndfRD6I9S02juRMaSNqC0
 aB0TuHRXs4sY3mOAsnDMFUnycSCCVCA8pQrK3xeKN5sJz1nDw3quFeMGvl/TG0uwWVv/GMwuqbI
 eDgAXWP8DOQuXx2A6pDjm19l0SZuov7HaNmlfj+eirwaIB85SIWPCR3ATLZXhuuj/r31wP8RMvz
 Szqo0XCVpdZWUbMiQrg==
X-Proofpoint-ORIG-GUID: p0ZN03nBprKDMAHO4p3k2gmsJ_xPF8Oi
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a057025 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oeV5rHmN1k-fxemBOLwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: p0ZN03nBprKDMAHO4p3k2gmsJ_xPF8Oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065
X-Rspamd-Queue-Id: 4EB5853E835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-107535-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 105°C.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>   1 file changed, 135 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index c57aea44218e..5089416ec32c 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -26,6 +26,7 @@
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>   
>>   #include "kaanapali-ipcc.h"
>>   
>> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>>   		};
>>   
>>   		gpuss-0-thermal {
>> +			polling-delay-passive = <200>;
> 
> Other DT files use 10 for GPU thermal zones polling interval.
> 

Sure, let me update.

>> +
>>   			thermal-sensors = <&tsens5 0>;
>>   
>>   			trips {
>> -				gpuss-0-hot {
>> -					temperature = <120000>;
>> +				gpuss_0_alert0: gpuss-0-alert0 {
>> +					temperature = <105000>;
>>   					hysteresis = <5000>;
>> -					type = "hot";
>> +					type = "passive";
>>   				};
> 
> Why don't we keep both passive and hot trip points?
> 

Need guidance here, we are keeping passive at low temp so still hot trip 
is needed for such cases.

>>   
>>   				gpuss-0-critical {
>>
> 


