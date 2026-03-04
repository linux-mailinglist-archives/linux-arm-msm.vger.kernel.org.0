Return-Path: <linux-arm-msm+bounces-95272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LZQFCT0p2mtmwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:58:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C41FD072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A0FB301020C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBAD390C98;
	Wed,  4 Mar 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk0rvhxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/YzFH8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848036D4F5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614684; cv=none; b=c7csmiSilzxrErmd6bX27xnOIr30z5omOOy6ksKU4QIr9HlSo3KVz4EFCX3o7gFH/b8Apwb+sRgYEntlAqLk2ohXRbUKHhOF8Xrn9cGxLlkidGQEkkJjB8BAhXDz9ypDC3aXmPmgt/hwN9lP8hy45krd3FUNApSGtIL0WoHSVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614684; c=relaxed/simple;
	bh=YNyzheyMXouN8Lf/ico2jv5x4+uFyMuodyQ++FAMW8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIBoEHTaVKCPs0PPV82/N4j0AHFJjJCz2pd3Mth+/U+PezhKXpqf4JLoLvIotjV8rtF5czEAcDVYNFyKU4Ldr9keGQKL5ZTYdAkPD+MAyZDb6QBe793dByHOrKjq0D16GZ+ynaYMKsDUIRV0PnpNRnfgrYKNl8pZUIOafAZXAm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uk0rvhxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/YzFH8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SrSa957847
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 08:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=; b=Uk0rvhxuuWKguEN2
	F5lDCz0rki4FrqwhkyE5Z7ESRTqyzzZl3naodJuBH98RNZtitzWyTC5JucEXC2Ul
	/GpGkxS7fPJU7Z5oI2g5g0rSbffff6oSI8rP+CwtoEoXRaGkAWc5+g1auXJKBjyy
	kWdh71oLAFD0AWTal03j2F/f+kIt/efFRqmAzBkvqoG6BTCdmvdD81QNlWMzeWHG
	vCWJXRuCyEC5U3p+NBsecVWLT6BzuAjmcEruLQ9poFn05lGcNBcCxPRCeJGdLDRU
	tpzU61KR7idevCJZFiICZIVo8J3bERB4SBu5USMWvwnLjz7+/nHC19atHZgqVSD4
	+jA8Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qga67q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:58:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cbdd1bf8b0so181137485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 00:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614682; x=1773219482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=;
        b=H/YzFH8CySbR9Oy+FW8IfFjTBUVU5R+9MUrhyuzBuMQn9i24IISXojHt4H+4WD5Ha8
         AbpN3ThWhS9/POFuoEHbdjHojXL2fl9BzR5LJFmiLQe2y4ORE0gu37/TkgkKp9HLmack
         fW5HWUbsRAelLszA3xA/3DwMT1EVMNIJRrnEryLOuSZTrq0XDtS09p6+Eaw8YEjAGaEi
         fa4go81HfpxduWSxPWhCgAGvZj9JS/3DhXYsFSCdSGo2jcKPKB6NFWwzB8WZnBZsB+9k
         V9lrxAPja7l5WLmxQBWhGRhwt6Vjtb07QtcIxtzh+6bAd0PAcoWjwqi3C30a6QUCvmT+
         X16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614682; x=1773219482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=;
        b=VLaiR7Qf2puWTFxbPrJZBwYU9ihke/OskBfMnIti4KerUoPRgE+6m2wBZAYQjExwW7
         gIvBva6dWoYfaJ9D+JsMBDXzNTp7cHac+PgnVab4jOtpjzrvoGZo1hWyB8n5PtnJxf3B
         v6h+VeKkoaeCKXaag6YnwsXMKv0Mt5VrvgQqtN45NnfmkJQBBqUaWHpbUH8oN9PZzLnN
         20pN43Du+xIKJrjhXzdLkkTIn/S8djcbKjQ/23wmWgDkGzsh5fDOXoqc+DKh3Kbl763j
         egG+onFx7mLkwOHuKC2PZYCW394nO2vJMXUi1OspiXizCjseKx3DGxFJtFR4tyn61hhL
         ACbg==
X-Gm-Message-State: AOJu0YzkakglT55hy32lkpdLjaJwOzEOGWOzzbDEPVzLx/uuYvfaILn+
	iTyX1QyA8hSBoxf9djfMMqkf5+J0/rxQVI1t1GSDy4puHHGk0BLk96okjDHDpQW3Qx8T54SWH0K
	BO2KzEFNnPVxQtFDYem3Zm2/3Y1jZcu6W4pAr0+kSMVcblVdujJkZIlrY2uZb36BrvbQ1
X-Gm-Gg: ATEYQzwoZUfM4EU10sGhvusfhlu/L8WRf8wQ1paX8D9SW57fiBqRxWgvVRxe6CQ+EFU
	esDMhOqYA2748ZLWi7XBWnHm2L4qMPCmZ9hdq6eo9bGza6q0EnPcoQaSmhXwqMY2PaU4Dc5bpRi
	yLmU9VT7prqnu0FPmtGkPEtfyUcpJ/v2WOsEfKUr7SAK9iWdUR4RqYmVMYesJF+/bnjqEv4wot3
	VQdZQlevfhTdw3sue40DJneLKlZDpgw7OsSHIexgL+IW0n4Ouvs88agFAXMlR8uJ2HunWGHfywh
	fJ5AcnRF1wdwB6EzFG8tCioWC+OrCWoorqSNTLt6JIrzjhDBWBVkAty3d9xTMkFyJjijGxw1I4Q
	o/bjTDQxyaNPqEkROXJjMJDcUhzdYRV4iW41XIPx9xYdci4n8Gg0lMzORRpxEJZlknirRUlPYsh
	nrj6Q=
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cd5ad9dd70mr122029385a.0.1772614681670;
        Wed, 04 Mar 2026 00:58:01 -0800 (PST)
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cd5ad9dd70mr122026685a.0.1772614681264;
        Wed, 04 Mar 2026 00:58:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd46753sm5249417a12.8.2026.03.04.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:57:59 -0800 (PST)
Message-ID: <4a5be869-1b98-4b76-b483-4fa374bb36bb@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 09:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
 <6fe3a1a8-46c7-427c-abb5-2e7366a43392@oss.qualcomm.com>
 <164928f6-cd29-49e4-8b5e-365f5b0a70e5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <164928f6-cd29-49e4-8b5e-365f5b0a70e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX5ZpfJKu1dseM
 xlpBU1EzO2QzpF5BHucRyFh2jBrpXU7ZcoIoHHqiUpCdLOODn2HcVyn1hCZOfp1t7Y1LS1sDjTU
 2b8GIrp9ZHKST9RKwgbe57iu5zdJ9kbq9F++fvQbVsDKXcEnMq0Mez7Ma89VXQZ4quPZlGlNU4X
 40uD+NanNZOdYbWGsyRE3W8q+mJT4/NT4QTXtX3ux77Ix1ji977IxMFigsENdqJ6VPgxh0YHUDo
 PQ4R9d6jcncfpoufLxPK83oxTuLNMwZpsfQiVGEQSBj4StXDDp9wWYo2xo+Q+h+zXL9UU8YWUwE
 ur4nHly3+wW62SO1XEmWDl9otvcFImQTKYnu7p0K8rx5htymDjUx1ncB3kEMGtMI1gatbDPUfgR
 FFn580w1ohoK9xZ5B6HYq+FQ/Ys2DjZcUGjRrQUnDxPJfBh9NGP2EzLsiJsFBbu/n/obwMQIaA1
 5F5JM4ONFoWEGtBZarQ==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a7f41a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=b2WnVuVpUTZYNMXETCkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LAVmVATpm_DoZrK4F7IqteKabT0taBpI
X-Proofpoint-GUID: LAVmVATpm_DoZrK4F7IqteKabT0taBpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 5A1C41FD072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95272-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 7:15 PM, Vikash Garodia wrote:
> 
> 
> On 2/27/2026 10:19 PM, Konrad Dybcio wrote:
>> On 2/27/26 3:11 PM, Vikash Garodia wrote:
>>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>>> before firmware load and boot sequence. GDSC can be powered off, keeping
>>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>>> carry default (reset) values.
>>> Move the transition to HW mode after firmware load and boot sequence.
>>>
>>> The bug was exposed with driver configuring different stream ids to
>>> different devices via iommu-map. With registers carrying reset values,
>>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>>
>>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>>> the reset operation. Without reset, there are occassional issues of
>>> register corruption observed. Hence the vpu GDSC switch also involves
>>> the reset.
>>
>> Is that a characteristic of the hardware (e.g. also seen downstream), or
>> is that required with upstream iris only?
> 
> it was found lately with one of vpu4 variant SOC and applicable for all vpu4s.

Thanks

Konrad

