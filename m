Return-Path: <linux-arm-msm+bounces-93199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAlYC72KlGnTFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:35:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0D14D987
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F09E303500C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D40E254B18;
	Tue, 17 Feb 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hybi/tIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6Xem/dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EBA281368
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342506; cv=none; b=Qct0voDQx2xW7e5/xGUxyqQ73ROWSHn4QSwZmUraIlGlG4K8eBq9wF4/NmFGbaG+DAmsXPcXV1BPzUdO1pNqMDlN2TWxEnG8MWbMdk8OgqTn9Y0eeBVCMr37Z9ElVEgoOqOPlySX9M+eUUYlpRBK3v3lU1H1zIn5Gj4ePLt+5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342506; c=relaxed/simple;
	bh=s/UCEVRgEYfNEzZ71RHuEOGWTZxbw6VaGhQmxYLphh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcj1HL2nHB9CrfrtJQbAAJ5z+dAfjfVpHl1pPwCMiTOT4AFR7iIZdSZP22yjnMp7BZmtkqxFLBtKWDLZxWO0kOWWfF/OAsZ1VREiYa6qpB+mn17+n+kBlv9gVszgds59+8LyP0pI6AJU5Y14rr1vem4cbqczT5NJuUca1DbB4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hybi/tIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6Xem/dh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBmIEI2331800
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=; b=Hybi/tIycvdrFtRe
	JPN8ykQ6yHimUGhtFFiwCOnQrnL/QvPtZ/TOLBbpyqdclDhFzLVSimibcODdq9iq
	oGBrxzck4lJ0m60b+FQR3iPhAB9PvKsuyamZpsMZq1nCVmNCEfrRJylllcOhtR8K
	QH/tBKDGA3MmNCIs3W0UnaR/AR9Doun/5/3yFW1mtOQBvjSXgwNlVKPkas/P0Mqi
	q+GBL4ccEZ3P15ZeWP3R8YTR+Nsvism6YGSEK891jvhsiCQnd0y3l3jh/VLu0NJK
	/3FNs5eACEComL8+ARRFfNNype6qGVjxGRwMTHWcpCyETw5t0kzboQBpoLzDeVQB
	hvfC6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmassd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:35:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a784b2234dso241232785ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771342502; x=1771947302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=;
        b=E6Xem/dhfbF87d8LbkpyKRMSEe/qdrdT/7qOuqXpZcs4P//p3pRMWIq49APHsTvTUV
         S71xeWfEfE2e3FmdIUcOm/yXVrB1Ad2wFKUUyzoCmdTZcA5u/Di9NPJTm3862DBk3ZyA
         igUIKVyXV+U4CwX7T7TJd7iKID6TVp1qgld+cU6PRaWNMnpLqnKq8oXgP6KVJe15dB//
         b4kW+PhK1MOqBHXpW6hDF3TSeysbwkFrzJspvV3XISPz141Ag3cmHUoqPfj8pN21dZq1
         QZVyXegX++muALh7hLrkJ6xe7mLZtW8pyHGB54eZlPpeLGQ1yiPdF0Yh3F4NzJmGiLCt
         V/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342502; x=1771947302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iSuBcgCjBQ+kBQhdKe5EhYzO4nkXBajZ+4DR5vCa/w=;
        b=fsfv5raAbj80JHvR9Uo0du91L+wFC3vqK9752Ix/48SJET4i8w50qsfHDlXsom+gDz
         MQ79IknKK2gRTXTfLCmMMriWK4+XRbrIiaFJDsXYJZralnkS2yLLWJi87qQu42/wE8v9
         yWctkDCL4Jhvr1yGm5GP2Uf2ztmrP2HdyrF6ABwssjPricPwedTpnsetrLHyJGcQNmfU
         vucFuShHyMFH06XzVAuv+sOaXiDMEiw+YVkzg0RhfrXEud/mt3dyRX0OmhHVTspRy8rF
         gkOqvnCnDkPGsfoWpX3tdMOPA9Xun0vaBnU4M48ro51mjfyZCC9CAfjGXO1QZHSMaHYT
         OWyw==
X-Forwarded-Encrypted: i=1; AJvYcCVA6fHHMPqBrXMpfYES4MEEhpV2CEUur6B7BNs86IpECYrtpgZ3IT5mZ6VJBskgN7sQ0CiHPzYQPSN8YIv0@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFxUWiIGwGRc/Xj1849MKMnS5tCBmoCIHuao80ml64lyxTDHK
	uP4VfF7lhrohSWgGhlUi0ZaNvzVrQ3uG9fdwHyC//JK+Kd187GMHMbUVipd5I9qfi190TjibBGh
	YW5qY03XiWh4RhWdwY0YqQ9bYHFPxIE/+l2ReaTzzcw+bTEANDuV8EEm72vE4hA8z8nsb
X-Gm-Gg: AZuq6aJdscVLYfyUxjYxQhz6u3SbtW8PSCgopvjc/kAPP/vfuwgKSOuJ1L/iuocikMs
	FjRaS9jGMw8ZDy0G7/Mwr6PpDEmUADEE4aM7uy/wmQL4jZ8M/2gq2xn6Zom5MU1NRuK4EZPyjog
	ADEl8jRA4KakW3fxh4kicFdvDTV8qHgBvIMZXvPGPd5NO4yZd7o4NDSc1+pc19G8UQsrhIDabgI
	6rd3u6JDEUaPBZMGei2zHqiUQEFo0ib0CLt2sRYUWDD+did+08lQcgwzss27SfymihsE8sTnMEj
	yLCTgst521DOfC1hlBkOTCKDTCXiu1xSSl88Yi9S1b2RPygZVMdFu13vDf4HnaI9iSSfUc0VUnS
	rQHn61vtq1WwiA8E8+8Lni7BeIqQ5YBpJ++tmb0Zk6x98+NZyDBB1TA==
X-Received: by 2002:a17:902:e787:b0:2aa:d11d:5c36 with SMTP id d9443c01a7336-2ab50598a38mr147079385ad.30.1771342501432;
        Tue, 17 Feb 2026 07:35:01 -0800 (PST)
X-Received: by 2002:a17:902:e787:b0:2aa:d11d:5c36 with SMTP id d9443c01a7336-2ab50598a38mr147078955ad.30.1771342500876;
        Tue, 17 Feb 2026 07:35:00 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm112400885ad.34.2026.02.17.07.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:35:00 -0800 (PST)
Message-ID: <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 21:04:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MUAzCXlaslmdJuEcD7CpsiH5QQSnTjzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyNSBTYWx0ZWRfX1qWVYteR45S7
 3Cmh8X5Yki0KDasROdNdjoD74P3ae8y+4xr/BQDPAJc+E6VqgCeQXkimkRNbXCt29kg3/J/mJ2j
 NKpHu4qZPfiAipadVW5UA7s6DmbhrKt5DC9zVegHM+1jnyZVbuAuLGXXmdIDLYJ38RHesxkpm/T
 iy9GIcEvxtBBSsFixP3K8BCyevq6UAuZdBNhlF00gGqb1eFipGK+S62G0Q3yTXL9Pg6XiKOpqd8
 GLhAsxQI+UCvnsRMIhxy7+qwbWeQ3hCHseBYyyF5il2p1KiIAZyYtdiOhc0a6BIMLEQ1Dy1lc00
 gYpu9xXpqmoQS5PqNEwCLIzi5CyrY2WWi8sZ88iu/9keFhJky3IE03QCE+PVeTZ9oG4Rs0NGWhJ
 dhFBbih/MK9ZFbIFwKyJa5xauU8S60x5ca6yY5oP+0MH3kygrmYhTz1TNiYEQdUJBmoliW6VGUQ
 6H6q22up5tazfsCCPOA==
X-Proofpoint-ORIG-GUID: MUAzCXlaslmdJuEcD7CpsiH5QQSnTjzR
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69948aa6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=FBmHkFZO9mc88S3EoQsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93199-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0D0D14D987
X-Rspamd-Action: no action


On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
>>
>> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>     (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> iommu-map include all the different stream-ids which can be possibly
>>>> generated by vpu4 hardware.
>>>
>>> It's not how it can be defined.
>>
>> Do you mean to elaborate the different entries within iommu-map or to
>> elaborate the different stream ids and how they are grouped into different
>> functions ?
> 
> The comment was sent three weeks ago.

yeah, if you could still recollect, you can comment.

> 
>>
>>>
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>>>    1 file changed, 234 insertions(+)
>>>>
>>>> +
>>>> +  iommu-map: true
>>>
>>> This is totally underspecifified.
>>
>> oneof would be a better approach describing the possible stream-ids.
> 
> oneOf of what? It is items with the definition of each item.

something like below,

properties:
   iommu-map:
     description: |
       List of IOMMU stream IDs corresponding to hardware function IDs.
       The number of entries depends on the SoC variant.
     type: array
     oneOf:
       - minItems: 8
         maxItems: 8
         items:
           type: integer
           description: IOMMU stream IDs

       - minItems: 9
         maxItems: 9
         items:
           type: integer
           description: IOMMU stream IDs
> 
>>
>>>
>>>> +
>>>> +  memory-region:
>>>> +    maxItems: 1
>>>> +
>>>
>>>> +
>>>> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
>>>> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
>>>> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
>>>> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
>>>> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
>>>> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
>>>> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
>>>> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
>>>> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
>>>
>>> #define the functions in the ABI, provide them in the bindings.
>>
>> Ack. will introduce a new header at [1] and define these functions
>>
>> [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
>>
>> Regards,
>> Vikash
>>
>>>
>>>> +
>>>
>>
> 


