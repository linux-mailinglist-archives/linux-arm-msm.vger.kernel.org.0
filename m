Return-Path: <linux-arm-msm+bounces-113671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /oc1J3TJMmr85QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA369B57A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f0pnPqch;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V8c+z2KC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4720300D9D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754F14A13A4;
	Wed, 17 Jun 2026 16:21:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155E3BB66B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713262; cv=none; b=or413xVXDAl4Av00wJCPEWmMtqcTFQKcjaDwz6dJRV6YnH5Q5afBIbZQdLVtZGFWka7+db5K8qSC/TPxpwSQawpN/8NYbJJhAeiPAK3L9lm6c063JDU1nyYKPz03IdV9UlCJjGwcDCC71gS/+WK+N62lElcg0otXKCoDRErlzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713262; c=relaxed/simple;
	bh=mQL3uNLDtBiRA6dMV1diarsQjL8zJFnVODKJvmajvLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0VOijOOpSTUirkUIO3NiedB2J3suT7vZomjd67IJrvapiuQFbKTIeJAq5twADOMVnjhDUl2xnSrGyao2bVrMWPIHg6bv5lHk+zUdoWjInY0TMMAS7E1uLkCUL2QOI8Bhw/EXszmWNrSsj1sZ6DQQOhpFw1xbGf2n5CKmRJV3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0pnPqch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8c+z2KC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFr15U3048722
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=; b=f0pnPqchVoogz6/I
	7qY7Zy0N0sPnMYAGbR3Ni/JchJirqBjSIf0FEFAGrYXGHNjJDUNQRXY0O3dxxlhQ
	D9z2LPFkwQ75jW7TKH7X/a4KRNXTk21TLCie/tBmkJje5mJ3rh5h+M+DcdSHQF7A
	GWW7VIoEFiwWZmNkOh2Ac6+PTZUCyartF6XC6T2WyDcCihAFjk/0X1hFnV3lG1jw
	vzQuTOws47CjxLE6DjewKykJIS0BM+YLdvWiQCRvgceZZFIuzESEqck+e6T6a5Qt
	m3DViBp3zGi6TpHjVU4DD06jY6agaXMxoPFb55efKjd6inBTF/fmZtNcvqrJGXCC
	5z+5HA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesc6bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:20:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85c530ddebso4309a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713256; x=1782318056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=V8c+z2KCg2Yrh/TuBFbToOplxHKqWXZ/K11bwAlZQCVtA6Dn50YA8QTpNjgUmBJMHX
         kgvcYLylsVHaHbXowQOSO4XhxbKU/cSl9uxW1mqprHleAgp7S+sz8/p4Ul4DC0Ve4UD+
         R/j+3hb3s9VOdBuMk/1Dd1szSwaQM3smhin4Lp4HPkX76FiYZekzPkbOXPZtfNr6DLl8
         GOqriccTtDvpZ21hySGykryfolocqirqPfqXHDVvPYWuAS61vhXUGaswIihL3OZOK8bN
         gRsDRyubYXXuGV3bRW7zd8kZ4cn9cpa2CGjt8w97ycQF13pVdo/zCsZAz2udi3rsYZEf
         N3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713256; x=1782318056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=NyJr8M4tDVc6InNFD+x9zrnNV568vHHRt3bEt3U69NspE3B+ON4LXZ6JF9ntaBiu27
         v/SON5FTUGxV9vC+UH2fYvAmd/LQ07NOkWKxW6eGpJu8oWaY06EbhGB2PW7K4VSNcW/Y
         rJU1kNXtLw+Pd05XPuhDtCn4R96OIuPzNb2r1OfHOcF1wchjz5rml67H7EIqUasszglo
         eBUHnKtX7qOcFkzEqFLAUs4vPuf4YQ8X3x+FWkMViZ6Wn/94ZihlluOfPvEkC8UeQFQs
         B6YDhHRjBHRhcTq3FCEIe+K6xQnkT1LBnuPNAUCqbTBMvEQYfoVdlgjJtCB7MOe9+LBW
         P3pg==
X-Forwarded-Encrypted: i=1; AFNElJ88xfC82ef1sloI0z+20SLv1ubR2djlBfoEj6Zq4JJv/rl9nlc+MC5iBNjVb+IiSFdE0HbyKhEYwSyv5Vee@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2uKQw22CGZ9ZFhG2rlSXi2SmTjOA40bdz/EIABOFYNgBR/vB
	H7fFpAXeHIx11RHN1iMKMNnRybixfI5Gu94U5rBI2Bq37XlziGSTBFDkL0fAzAPZOAcWWZMjv0f
	NRsTn3oxr63Nz/C+QKG9WCeF8wiL+SrqjAzDG3gQj7JYlKNxKxeKoFRzSR3kq9LT1CIdd
X-Gm-Gg: Acq92OF46fIAALummSh+3AXIcYI0g5AzWqgWFlmzq5ZEvadfjj72WKwRDsu4JXnuTw3
	0codc/1DgFgprRWHutoynFr6ZPA9bIfmfkrSJDzsOPBtH+eLpiD6RL7wUU61FYu2yO+1PmTVFW3
	pnHmYvNvi6+4LOMGitGkU7DET+2+RwM8OplRTdKFefu4Xac06gaJUijdcwtCu11aNymig4UoH3t
	zYHBh0T9yAN91MW/sKlBVhtUsdQK/7/X6wAxzGlWD9vqEiAPRheBHAgj3+28O3U7fu3uHuU7Zfj
	tDnHpjpqUEFwKQP/FNl5LNsecNpRy6/LU2n88Zp6rDXea9I5nVjnY3OesWGkIgWUBa5jyDG5ZaJ
	/Nj/PZfB6WHw3lVakqi5ill+yitqw+GUivLz6nkI=
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231203637.19.1781713256327;
        Wed, 17 Jun 2026 09:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231159637.19.1781713255883;
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5b207sm15074358a12.5.2026.06.17.09.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Message-ID: <1bf2708a-bd2a-46a9-97ea-8c1ad96e7ac3@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 21:50:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
 <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfX50UI+vz4ZcWV
 hFNTkoDkOhR0837Tfyh/CXNYxs2/PlrP3sj6NxO72zoGxJf/yLq5k5HSB7eH/t9hnJh3WZ1gbhq
 CQ1Ho8uqKylFtSOpqej+VmLTaXWghvg=
X-Proofpoint-ORIG-GUID: XKdPUq38V1YW4yXVOFJBH7gM0o3K-W1F
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a32c969 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Rg3GaRgnNXoUDx2UCPMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: XKdPUq38V1YW4yXVOFJBH7gM0o3K-W1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfX84ijGdKgP+1X
 wSrKXJ3pAKayc9d7VqqKWp3kv06FGeRdYxmatnMUwoRItZSWQszqu4/HNFa6cYvz4TH35HVQ1GX
 4ox5cDOfqN+VJ+lP+BrUZOMkdDO5pllQuKqH9n4+XsxyLXWmNEGdGcytFqgZOKobS2E61ExG/4W
 YnqMTJCFaIWIGR3N19TkSoKlHdG1xYmgDEAtuvN8bVniq4PMzhejBpj9HpnB1cgh9fAHdRmOXhd
 +mkwcFETmk0R1goG67S3bwHAQgEb/GtSWRVdq4sdHbLpJy/J687xG0iFWT+JrIAIAWOgc3YM/55
 B7SgZMFB0Mmw6mIZohJ1GPg7JoJhfrMsjHQ4MFjejuxItMYEPAeUMUaY0GZK1Dpsl19w+kgzUf6
 zaKuzyMFl9oV/E6yNWwGLMXONWhNWr2SkTAbVr4sYy2Vw/m/n5S/rBcItoTfk0t70bfRdG1uJQz
 op346s+sb2HPcSWJtTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113671-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00CA369B57A



On 6/16/2026 5:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>
>>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>>> be voting on other interconnects too? I guess so, because currently I
>>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>>> vote on the power domains?
>>>
>>
>> This race mainly occurs in GPU SMMU, where the GDSC can have an
>> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
>> already have been removed by the GPU (or any consumer of adreno_smmu,
>> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
>> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
>> errors.
>>
>> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
>> moves to slumber/suspend state before adreno_smmu powers down
>> and the later doesn't have explicit interconnect voting).
>>
>> In the case of APPS SMMU, such a race is not expected for any known
>> use case. APPS SMMU is part of a shared infrastructure block, and its
>> power is typically kept enabled as long as attached master devices are
>> active. Therefore, explicit power-domain voting from APPS SMMU may not
>> be required.
> 
> This looks like a good part of the commit message. Please add it where
> it belongs.
> 

Ack, thanks for this suggestion. It seems like i haven't explained this 
specific info in any of the patches in this series.
Will take care of this in the next revision.

Thanks & regards,
Bibek

>>
>> Thanks,
>> Bibek
>>
>>
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


