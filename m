Return-Path: <linux-arm-msm+bounces-107442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAJVMuvKBGo3PAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323553980D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D362B30C980F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E573AC0EB;
	Wed, 13 May 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2qNgidR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A35ToDrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93D3B3BE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698512; cv=none; b=owIwrEvSiLAQ56dd+j4Ug8Lm9clO7wjQ2B2i1cPkxNkVtfU8sSQfaBSmS/M7FXHWsE62n0K7ARXDN4WAzspUJSsYRIUGglSKRj/oHPc4xFZyYLkyyr/MlD0Tv5vsNdZ2kNid/uUpJ0Af3xz5I9on/0IoZSUg928gZq8d+47yFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698512; c=relaxed/simple;
	bh=f90icsStwuTiYS+TRLmFbYa1N1i/jNkMOXo1pnh14Tc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HhQjZkit1ZKmB+uDN2y4EUxnbsYb453khmcnw+vpxVutlSiCr8w35zfLBxrGBZDumaihq/FnL3uD46Jdmzk+O+VI6iX1nVrCktMnwm48/ELvaWcW1Fn6Ensih736VY2fLDBtzA42LC450HD55m0Oq3D1luMCEBA5Ser6WtGKsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2qNgidR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A35ToDrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEpIsS3474926
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=; b=m2qNgidRHRM0A8j/
	+n/C0hJC9eU7xSpqpD95nrTfbpCyv7rz+zRZyMcqR3/tQXm9UgAFXKVv5juLUuzp
	w7NtVF0mdyHgbx+5GJf4LgnhpW39Bv29OXGoC+42DEN+GKQQRaEQ4eMb/n/t5MVN
	5SDHKv4ooYkTwJsOCB9Sune4jtfZ0KxbxTlftorB4AjCNfbMTztOaSOxIb+P6rHw
	XRouq2vpIVRa6TjSAYjd3Qwcwblpw9SCmUp69Nxz9e2tohvHCAhSkWhr4X7KL7Eg
	UYwJLJ7LjKmtqPrSatwcwYAIp5eRdV/7pDqtPrh9ebba7/P+bWJ72eRfy4H9rJfe
	gbJkcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41aedp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so3937210a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698508; x=1779303308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=;
        b=A35ToDrHOZH5nkkoRds73wXDwT+3hLbAhnhEimfx7RTlbJWanckcAz0m5kpclzHxoj
         naiJnEqISn2exwKod0MY5MyUbSQgYYW8oKSWhIgUa6Z6cEN2YRHtkuX5T1Nj5Fu4ZdEo
         swYxnqdRFmGHjBs884azkD0x6KhqEWWPzBAP+1ehQm5ipzyu2UbshGIOOmihYSoOAxI6
         zJHAuDGP7AsUyBTZOQEa+b1ehra6UJmXKeyH0Ez0SsEkmyy4cVSdmmj63Khw/90VSkoo
         s2uNM0rxsVkBgJMIdSrPrtjBg8W1FBj6gk/Qnnz6BH9wOPF8+ay099MMLRLUV34vRDwR
         mrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698508; x=1779303308;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdDYhB3ETGgG2OyYi3uG6KABgHH6zfI8kJ8591RPyfI=;
        b=isg3dEw8RBQtZ3SmxTaDWpM6flospG4HVu4WuzXn+p1FN8zr+ZaTtAkqWZ90g4t/Ch
         eRkC2bBoudzvoSi490Tfe5nm/X29zqXOlv/4V8/Ss5PEGH5gTQU/rl+Kjy7aRJiNzWeN
         MZmhQIaRqSsUCELEHJNhUgYPJRVhsYG8klFctXESnSyZvYBSk7K82HvW73F1JjxZLrbp
         WjxZ83yyCWkwUaQ1nmc4iJvYRgtxtzeUqoGM5g/fzQ7Ush6DngpO+ogeOl4MbDkdWCkL
         1fdAMddxwzcdB5nMPxzOZYKFUa/h4g7U1YT6c3lgM8BV16tac4B9vwC827/LoothQ5hO
         UnAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jRKDAEQl9iYOMQMbX+/gei+mSAByjdPktMzcexd+zPKS01FHstjGOEnE/9sRJ1eSjNKMzBURk7pWWpF0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwVawoQqdiIY66oGb3L2PTrnSzJUBwV1DKK0p3zIXnASmm9Gc5i
	7bPaGL0KsaWQ3CzqHkiEBC2TuVOFlyJJBe5Ov7lzEXtyBXnh7CoW4dTsv1Z0ZX4fnjQ9c/g/Sf5
	V7HECaONdORoG1BZ2ojXXsCArDPtpnV8GK2uH4l4LfOaBW3FnVCUnp7Lu4HBbGDdVH/N8
X-Gm-Gg: Acq92OET0ZrnFiBgWbYGKGzPTDgeFRSPYb/1RHahrlPvpXIcV0fg0bDLqog/51O2aCc
	0VqBTQqk7LYpDkW97Bf1JszwIyJyNx22fWRq9tJvyY174+TzpYPVLsSUIZE/D6Yzq67nAiBxw0m
	tRQszkGtNcj9hR0XA4EcHTMq6XXoxcfgEzUl/v0g+zbCLFBqIomts2ecZNkxhb2ZljD95yJzUvH
	ahacmyfvcj4UsGzeMVzv8Q/+W2dxLNta/pEVvT/33ZKkhPwvrMJpIMf3q1o2vDCBhO8MjgGYlYh
	oTdHv2SdauyyYhiTDHYeQRhdMeJ20MObaCZnOYjf7OpqKcMY+BLW8I++J27rUGqQnvLj/3BdxnI
	iSgxiibT7QU9eFS8rhsZ8S62QGRJkYjkbp3sfEP1OFKk6TEt9coDendjvkNi0bq0=
X-Received: by 2002:a05:6a00:810:b0:837:42a6:589d with SMTP id d2e1a72fcca58-83f0568612amr4387535b3a.11.1778698507474;
        Wed, 13 May 2026 11:55:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:810:b0:837:42a6:589d with SMTP id d2e1a72fcca58-83f0568612amr4387489b3a.11.1778698506919;
        Wed, 13 May 2026 11:55:06 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197781c7sm240554b3a.18.2026.05.13.11.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:55:06 -0700 (PDT)
Message-ID: <905f5677-5daf-d6e9-437f-7b928036ea95@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:24:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
 <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
 <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
Content-Language: en-US
In-Reply-To: <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04c90c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B9MledX_AzLNtmQI4O4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX05EdBBniFdtT
 gE/NzAekX8Scj8DEfNoYlGlgdi1KtzY+azEIxk8bUfJIqeOvVuYxRO3yWROxeKSNfI0tor3qjet
 O7N8U5Nt9zxVMHnY/NLBdslNw4WsC6cckIruFF576pK/XmnnrBIQhWbc/5KAnRR9xgOfDGHi0dT
 K07iMD8wZdXLqM/WCbj5CsAOrWPDOBEqtqjuAilZxnsA4SErtByPtgrmAVHMRqjROtb6pXV81cY
 tAcFG5C0B0xtx9XVhIFxlbEw4aFOfpCwF8/6Z3quT6Cv8mtfmLkGJIMSiuajHRHZY488V0EO7Cp
 z01/KT91UrBLZ1owKmIemduQ8vNepHurEo6/VuKEJHAm2BFJBtON/W2+7f0OsG2LJ8qowd8DO9d
 BuKw11X8HjdRqYNloXkJ2fDh80UZzmIdtytgk6/nWaysvfvCK8jfHRUHsORzhYZ9SMpkQcVDOhM
 ZiZiD/FVS3AiNXAaGRw==
X-Proofpoint-GUID: 3n3pqXbdphMci5yC7F87H9IQM2j4pFZF
X-Proofpoint-ORIG-GUID: 3n3pqXbdphMci5yC7F87H9IQM2j4pFZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186
X-Rspamd-Queue-Id: 4323553980D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107442-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:12 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 01:31:04PM +0530, Mukesh Ojha wrote:
>> On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
>>>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>
>>>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>>>> or QHEE), which typically handles IOMMU configuration. This includes
>>>> mapping memory regions and device memory resources for remote processors
>>>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>>> No the calls to those functions are not intercepted. Doesn't hypervisor
>>> simply implement the SCM calls?
>> All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
>> and in most of the case the preparational work for the TZ like in case of
>> qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
>> so that the TZ can access the memory and then calls same SMC call to TZ for
>> authentication and once done it comes back does mapping the PIL region
>> and call bring up sequence of the co-processor.
> I see, thanks for the explanation.
>
>>     SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
>> HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 
>>
>>
>>>> later removed during teardown. Additionally, SHM bridge setup is required
>>>> to enable memory protection for both remoteproc metadata and its memory
>>>> regions.
>>>>
>>>> When the hypervisor is absent, the operating system must perform these
>>>> configurations instead.
>>>>
>>>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>>>> is now in place. Extend the Iris driver to enable this functionality on
>>>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>> I fail to identify, which changes correspond to this description. If
>>> it's about the PAS context creation, could you please be more specific?
>> I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
>> managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
>> part of [1] are in upstream.
> Ok... I'd say, this part of the commit message might need some
> polishing, but I can't give an exact advice here.
>
>> [1]
>> https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>>
>>>> Additionally, the Iris driver must map the firmware and its required
>>>> resources to the firmware SID, which is now specified via iommu-map in
>>>> the device tree.
>>> Why? You miss the most important part here.
>> Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
>> commit text ?
> Yes. Why are you using iommu-map instead of listing it in the main
> iommus entry?

Without hypervisor: iommu-map is populated, so the driver creates a firmware
device and handles the IOMMU mapping.

With Gunyah/QHEE: iommu-map is omitted, firmware device is NULL, and the driver
skips mapping since the hypervisor takes care of it.

The main iommus entry already holds other stream IDs (pixel, non-pixel, etc.)
and cannot be used to distinguish the firmware SID or infer hypervisor presence,
hence the use of a separate iommu-map property.

>>>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>>>>  2 files changed, 66 insertions(+), 10 deletions(-)
>>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>> -- 
>> -Mukesh Ojha

