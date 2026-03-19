Return-Path: <linux-arm-msm+bounces-98616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N7KA6B9u2k2kwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:37:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 616862C5EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12BBD302A6AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A59835B63A;
	Thu, 19 Mar 2026 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lclRnoxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxr7WSla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB628030E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773895069; cv=none; b=Y0zP9KNaRXFEfZsCuTlFidEVmLNQWLyRLSXXG4MzuzlPpXbSJvmShRwmv3pkIxylAA5GevLJbn2D2bOe5n7BjqgGa0YGxEYIc3SJNBsPZMaySm8pSIy34rbjmLx+9wgRO2rzll1YEWVIq7N1tu80jtXGDGX3/EEePHoSTGhUr1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773895069; c=relaxed/simple;
	bh=cmMSZeDXqRan3ei9vzz6JIOlqcGgmceZeu86SUGwXMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsJIUXvSHcjScelqSCbonCMQMLyiSKvWVQBEZOPx7PkwqQDE3gMxNBo4Z1fOvQxSA+ScH7/XhFT05p9elnQOcDULe9AvSAHjhC3V8dp55zu5o/+6UfFDupHeqfQYhwN7uYdm0oUbaNaxA1UAJMzLv2zbv2otBV2/oS1kmkOZNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lclRnoxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxr7WSla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J1rtYx004984
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=; b=lclRnoxXVTOj6Tkr
	2FCrK3KP7gwihK3aZfuvqHKc6l1cx8zQuSkj+CuI98dUg+3MgC340O0yN9lqVDUn
	/ofhgPZkhSF//GgEiMFsjKMPw9F+sj3iHS1gmA8mwxFVu+hQuIgXGtG1X0qFLQI8
	ioxi6xjmoyg3+sIWIF0a/umrHO01mBK1zLVy9hFY5NdNfwCJ2R3Yy0mx32M+vmd6
	15CTj1oVNT9qgoGDo95I7ck3ej5iWGINg3q4tIlQ5moRo+ZmYoK+wsoxBeYonULy
	aH2cQs9JIoZbqv2rTEbRcZQT0hpIalHd1rUBLEp1y9oXLNuQbp8fab/qcFhdfjzT
	z9QUkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhga1h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:37:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso8920905ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773895067; x=1774499867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=;
        b=bxr7WSla8rYsIeYLrXTflXAeeip4XnmGZNyUkPmt7aS+fM44Gf6FdM8mEsen7fLb4D
         9T6IuvUTgLhsYsuT4nFSPDkjQXdIXpoZoDTDLFcmd0BHMIL1ujEw2gmSv6i45iVM8f4Y
         3Q+YRpwf9AsoyucXzhYcY24tGSNY8DjKJ/imyp4ls2lRYF8UnuNmRl0UGH3A84hnsUkB
         4U3TqQeXXTGNx01TaMm7zlniGToYXVu6ItkSg3JDTfEAplusH6cw623jOtYGn/sVp5+J
         LsU1Vb8E8rLGZfQoJ85FhpgvqWC8T5OuSo1Ng00XERDxWCg2uXJiDLIWtzcsHYLFSRL0
         P5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895067; x=1774499867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=;
        b=QhbEfUmvo0Qji2voO8l3DohVc1svismTaH3L6T0AwKQSS3O+CwDqpsMu54XPq21y3x
         M1v26Q19+VnM3OwkKcdqmPRKI6QTcUlN1d+E8fZVzawUUXZJQKulIo6ZICx2ve1EKR9s
         oJvk/oSsNH0cHuTTnLaarOIQ767bVdV+xy8eyEN0KeT7pK+/Q99Yxt4ctR3Ci2XmmUPJ
         KOhvCyMSuB4C+FLocGx0XeXiqQNo0qbyRtsX02WMBKE5R1LvIupCpNUPKffbVg88aHfO
         qq1efj4NK6b4I6j3PdSmq6Au/efEBhptJ3flhDlXkACOyytSdN42UUbLT5B2LXYTnnGS
         wlXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOvvl8tM+WcqIJwYEsWmVuzwe35ngnSS0/J47t2Dq8GnykGKiczZzGIRnjAw830en8EFg8RlICVnmxWgwM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UW+QZGalP3NwBaPyL75tVc2HE4RMfIsr6xYhd/Dito9IPUjc
	zE0agBh5vR84HNAMinYyyl44vGHZ/kFi9jQdg6oGC31XsYT6gzI+djfd5QAM1w4EiWy6ZQv87Of
	Yz29bua0YF0oKuGSFPn3vtYMJqYxSIGwurqBSnmf2j1lNL383oF1Q+yzy+MjK19mxy6Uh
X-Gm-Gg: ATEYQzx9eOugtEXcT7rw2TFf/ekaOwWwaIxbigg6nlNK2ot6L/EBck19v/Ig4Sd+FCO
	XXyYlXsr+jm659OnszQe7TXmp8sdSC2f7Jw1Xu5K7cgNCWfMZHhUYBnxvR8B+2URfwgvr0R+Vp+
	bn2M8+q+94X6z2Zs/MuRkOdJjvVMglvz6PUOaNUltrb454pmBdSoxVnyMrEdAwcSSA9zEyHdQZv
	Nj0JO7ifBNmKQWmaQcJuhmRcBo4+SScQuosI3rn7fkVvwuPli6LoIE8Q6DRxZI8EcZWB+Y+Q6up
	JDxPVsAJ1gpwRif4JglDcNR6oV2w+1oMirrexcaIt6JPnwhf5wVwK8k/juW7F0xTD6WRhfB+nWT
	kjepaXrBE/WW/i2tUis3vSbL9WP0TiJ16QilvmSE7uSQJ/XcrzZ1MVyjzfnNhOkEoyaM7M48KMD
	WCQhEjPiYQRu6YIQLP
X-Received: by 2002:a17:903:18b:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b06e323679mr61201345ad.5.1773895066819;
        Wed, 18 Mar 2026 21:37:46 -0700 (PDT)
X-Received: by 2002:a17:903:18b:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b06e323679mr61200995ad.5.1773895066311;
        Wed, 18 Mar 2026 21:37:46 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e627132sm45911235ad.74.2026.03.18.21.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:37:45 -0700 (PDT)
Message-ID: <e7d29f1e-a5de-4e5c-a94b-2248a83c5451@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:37:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
 <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX+3l0atM1zHwz
 6IHQt1GyPWovxab+wTMShpheoleQGRAM4bqz1ujKInBK+lxMF+F1LhbSSWwmnCU5UHZw1a88axp
 Goif+5C0vU8sdXzBrpZ3iaTLKiTU9WfbauUCJ8EO/joh+n38JXBRw8U5lbkluUA6zzuSy4fW2KG
 eSEtsH3oVbrjMTRsudbUxa9wPCtJ6uIl4+VAvwEdCOxDguoni38K8GwV6yb+T41Pr5ouMNEJUSU
 21IDHnHVYSgbuCmgnQtt9M17XUFBJaAPOUbxvJdPpFmfSPnM2OgKq0yN8JOowp6ephJZwWnekfB
 LQySNviMZ54TCY6ycJRasjiiAoHqSRo+SMHMrljItlM/wb/MquOUedaQSU+7TGInJjdwXNlpuIt
 h/ZvFeeUMWUNc/HsfHhVlLcii61CqgHxuWFIUduOfAkKDiHVZ3NiT4iA5mijs/0AAOQn0t51BTY
 VKdKrJxxtN5p/IB36VQ==
X-Proofpoint-ORIG-GUID: 8ePOnmSXX8cB7HCvl5GVSZq1vGMUk2rG
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb7d9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zgz-R09rLuGx3neTn8MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8ePOnmSXX8cB7HCvl5GVSZq1vGMUk2rG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98616-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 616862C5EBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:38 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 03:03:18AM -0700, Jingyi Wang wrote:
>> Move interrupts and interrupt-names list out of pas-common since they
>> will be redefined differently for Kaanapali SoCCP.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
>>   .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
>>   .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
>>   .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
>>   14 files changed, 226 insertions(+), 26 deletions(-)
>>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index 66b455d0a8e3..cb0a61fc301d 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -48,6 +48,26 @@ properties:
>>       maxItems: 1
>>       description: Firmware name for the Hexagon core
>>   
>> +  interrupts:
>> +    minItems: 5

Hi Dmitry,

> 
> Initially I stumled upon this (and dropped a note in the other email
> that I noticed a problem with the series). This minItems looked like the
> underspecified property, buf after checking it seems that this schema is
> written in a way that covers DSPs having both 5 and 6 interrupts.
> 
> So... most likely the schemas for DSPs might be reworked / optimized to
> cover modems separately from the other DSPs, but it's a separate topic.
> Let's settle on the SoCCP topic first.
> 

Per my understanding, we can continue with the current change for soccp binding?

Thanks,
Jingyi

>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +      - description: Shutdown acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    minItems: 5
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +      - const: shutdown-ack
>> +
>>   required:
>>     - compatible
>>     - reg
> 


