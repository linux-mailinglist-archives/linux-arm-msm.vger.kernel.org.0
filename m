Return-Path: <linux-arm-msm+bounces-91482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHr+DPOCgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:56:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF7CB4DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF7933013038
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36C35C192;
	Mon,  2 Feb 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlSP/4XY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U71+b/f5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13434D3AA
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029804; cv=none; b=Z8Ky+YSGbZRQMw8M+X5m+/+CrlrFNKMbPl2Yf2QGLzOv2FI8CLQIEENWHXHg8RlSnRXx6AmXCtp4etExcMy9nyIHWqx/iyvYMQsOkbNzdo6y/w1d/Fc4ttiu/QPNzamqAC9ueY5la6Yuo7/AWoUFdx/NpIxUcl3iIV+HUUrgyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029804; c=relaxed/simple;
	bh=q66RPD2oOJwfCVDjgotrvDTzNwrnipJAVBK9XKsirOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYvXptBiMomvnlTPrvLuV+svCLurapFH+aFhVRSysNUIOmTC4/Nhnrt3fDUNxXXfl5z3iIrfx+IqHh3SxA0xoUcFM6O+Wi4O++voI/CQm4+URbett3PW5Et+GGlKJS9snkUcIFIn8wWNZw1lvvICXM7VxGyQxg4xf/tcLGDrIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlSP/4XY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U71+b/f5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127peXc689487
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=; b=UlSP/4XYPoQ9fx5v
	0AvNG533wA+WA3Ye78zPpERxE0ShGNyad7qnrA/W0pFr5MEUVzvMsoitzhRfbL27
	NcpUEq7sczlohdSbVIfOLo1qWNtbz5egH+csgU+5kRBNmEmOX30WMvsdhxIgHCwC
	9JvEP5U6edT2Erure7Jlcjcri1knST/85JNU565yFeaONVSY0rOcYHbkqUD4kEKh
	n4bhfwFO8/42oC0zhn47geVyi/kAn6Fo2HQyaiD6bqQ0exR7EILFEE13JRjxp3FN
	g8y0uro5E7Vua7cEO4epR5jahs99y3TqNeeG5s7oPDNGjs0BOq1sCENFDD2SedGT
	0Jbclw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx52m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:56:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a784b2234dso121141235ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029801; x=1770634601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=;
        b=U71+b/f589sFQeECUjyknHKaHe7FbkfFZJLq3FbCLMxpKxPi7ojkwfcLGcc05x0uXp
         DHwvIKARmuKUwTkM8RfQwxXvkzLSIyM6aBVM0Qkp2c2GOs62rWTGh0CTM4wRZkdUu8j7
         Sm44DXXBZoPzjucqH84hvKSwX99YP6TpEA34Eb7w5tswlZXnEJVAGPhJT4pqr8s45naw
         ixw4usjwLG413AHACO5aB4dOT0ByGpuTrGRNvQE5ZS7RQFVJT/EDJnTz8z5z3qQeO28K
         FRBhRrZf0SKZguyJtpzNGftG127kheZ3VmLlEhD+hikonamczAxPJFZRQjAidmD4m2zf
         JhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029801; x=1770634601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7w2p63ZPTwKUNcs0zkPpFjjBdO4n5Is3TFmtV2iGM3w=;
        b=jQ/KloOy+U0gAbSKViD7ixHPTv94dAXvTBeC+auy6yCmDn+BWjMo+WZiQIOSZVPVLb
         PaT1kGfJPPexYp6hjHzBn7Ytgm4okPsrEGxfZkBuf/VqLyUMUtvL0DBV+aVjEqDDdrWB
         HyOHi12lQJq96Ml5WxTb16cJ++zEty7cSHgKo2Itx/2aKUhJA7m1rHHA6AGXgmZqIY+J
         K/YXeQMTbw+Sv090TP33t0oK8938XtwBrRJ21lJGpMd/dyhQxz41mfPPa40o2nX+7eZY
         WoGsGLdqMSm7/aPWzNmBuVA6wIYtVe6xP8qBDD9tRtPyCQ/FaEROJ27W8lEj4cXQJ1QP
         BpIg==
X-Forwarded-Encrypted: i=1; AJvYcCW80QZ2hK6LJC1bmAChUbETSSgVn+X+qJiY1DzijK6aF+tmn42E2X0suwUC1Db0CDVAZ/oUOa2U0chfuoaP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5uoRWP1U3Vfx9G2AemmRTMbhR34ikmz8vMJYtfL3J/M7dvENv
	+5bQPbdSEPSMkI+LnP591t3WRlUZpJsSn6v9YTMw6G6mB3UEC4WVMtA0TIyQl7vOMw22nAqiq+7
	5suMJSekbLqjaJlsRZcpn4xwIOoh09P8ABty5PU1F/LhM5n/RrHZNWTk/YvrwFqAuGyvn
X-Gm-Gg: AZuq6aK295MtefmdKpMa7rzRIE109MBU9llQEzZSefxDqfG6y0FmmjnTOtit1Tj52bd
	TEEdHFLGb64veb6pwJwAfhiJBILkHzmpUB0Z/YSXTT4D5VVS5C++z9Ayrp8FmGgRVCfdbZ1tlsq
	BgihP6hvDtUiCK4tlP7hBGIdK+aOhwH659TCI2BCbxENMxlEHVxc7bbjODsdH0IQbSP4BQoXu1f
	7RAZ0xK7P7lQ6WoOt8HedyO4SaypWbUUwTh2Lwc8S923HI/wDtuJabb38FxsfPyRH9gpKxTbck9
	JEmfYfnmQcCDAaIRCFHdTva1hHaMtBZ0/Qo19B9ttj9cVR3j4YCkFFQge2AlXJgqLimaBWvrfAU
	OUaOLKGVDT7r3wjLmkbGChb/HKfvoeSGkrQxKk1aPLeai
X-Received: by 2002:a17:902:f78f:b0:2a9:410:2400 with SMTP id d9443c01a7336-2a90410270amr48497835ad.28.1770029801017;
        Mon, 02 Feb 2026 02:56:41 -0800 (PST)
X-Received: by 2002:a17:902:f78f:b0:2a9:410:2400 with SMTP id d9443c01a7336-2a90410270amr48497625ad.28.1770029800618;
        Mon, 02 Feb 2026 02:56:40 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b41390bsm141408555ad.23.2026.02.02.02.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:56:40 -0800 (PST)
Message-ID: <10ea031e-b803-4a4d-a0fb-c18a34b37e47@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
To: Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
 <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
 <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rxlBqxxINk2XCfkP4H5SEqdZG6nVU0Fa
X-Proofpoint-GUID: rxlBqxxINk2XCfkP4H5SEqdZG6nVU0Fa
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=698082ea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dOfmg-3FkkVntAroJ4EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX2p7Ab7k9UNvi
 UUfxfIsvR0E5u+L16TKB2bsWyIRKDu8aHiC3J5OpLRTAgHsej/4lEJzs/MNfJDf7x2kM85r/A2P
 uMv0ku28/TDLhcMaXOEy46SuwhyahuxpUrGDZJkjmy6RC9HL+mqGRqM7c5FsMWeCEptcTUnSgAQ
 QyT5l6Cf6xx79w8tOMnQPl5AQmR4cjRIEli1XXGv8FUwB2KiS2KXvkIYUCvTESOCMikSYucdU2M
 Nmzxg4skPr5Xej3THEW9PMZPMF+gRhWRdfJ7BITsZJW3siYRaj1GZUP4MO3U7knN9u192ixbgD3
 R8xBbkdV+8X9IKILuTLcwOH8wTyrOTsWhjucnS9KcrWkhGQ8XMxQa9SrfRSdLBBd7bAvqrWZiHg
 1Ga83Rvte8FoND1UnCq1N7+ioe3xCkJotr3IgQHvrZBJljYv7WC2sDn2WBtFET5S1hrMfmRadi9
 ilCgoQVmn2V9XcpHi/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088
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
	TAGGED_FROM(0.00)[bounces-91482-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4FF7CB4DE
X-Rspamd-Action: no action



On 1/27/2026 7:50 PM, Robin Murphy wrote:
> On 2026-01-27 11:45 am, Dmitry Baryshkov wrote:
>> On Mon, Jan 26, 2026 at 05:55:46PM +0530, Vikash Garodia wrote:
>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>
>>> When multiple mappings are present for an input id, linux matches just
>>> the first one. There is a usecase[1] where all the mappings are to be
>>> maintained in parallel for an iommu-map entry of a same input id.
>>
>> This contradicts the IOMMU idealogy (at least as far as I understood it
>> fom the maintainers): the device (driver) doesn't control which IOMMUs
>> are getting used. Instead _all_ defined entries should get used. For
>> iommu-map it means that if the map defines several entries for a single
>> function, then all entries should always get mapped.
> 
> Indeed there is no concept of "multi-map" - if a single input ID represents more than one thing then that notion of "input ID" is fundamentally wrong. A single *device* may have multiple IDs, as in the case of PCI bridge aliasing, but in that case there are multiple things to map.
> 

vpu hardware do have video decode and encode usecases that would generate multiple Stream ID's.
So, all these Stream ID's would need to be represented using single input id as mentioned
in dt binding.

Referring patch [1/7] in this series

iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
            <0x100 &apps_smmu 0x1a20 0x0 0x1>,
	    <0x100 &apps_smmu 0x1944 0x0 0x1>;
		
Here, IRIS_CB_NON_SECURE_NON_PIXEL [1] is the input id.

enum iris_iommu_map_function_id {
  IRIS_CB_NON_SECURE_NON_PIXEL  = 0x100,

[1] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com/ 

Thanks,
Vijay

> Thanks,
> Robin.


