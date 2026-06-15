Return-Path: <linux-arm-msm+bounces-113185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BGCiKWj9L2qHLQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 992AE686BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cBOata2h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VCIEG+W5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113185-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113185-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9293A3000BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6B633BBA2;
	Mon, 15 Jun 2026 13:25:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844D3DB647
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:25:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529954; cv=none; b=WnndVTKJU7wov/pFjW4cg9fcuzZWm7Op6D59KIpgtbd9b8dMbbWqRDpJBMtco4FOdSE31yIsYGau2AkmJkg+oSzaRZ8I5FTHgLyICS/pQZnNE2l+WvaUpE6xMiWBG3Js35BCG9cBlTvsq6yFeq0j7dzdoKsEFEpYDCpApR9m6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529954; c=relaxed/simple;
	bh=3xhHWlD8RQco2IA1KAQxhlJoKB5DW/j70I2e9jXDPe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYmbddBuVVvpcUaSg/Su+7xh7k/Aune3iFdOm4tjvb47yXvbRlF5CRYwvkCLkU7kPBG6h2zM88BO/5o8g1cf0a7mtVH+wx8knMqMcOKdHVv70A1NetilUU43RQGywpGB7fWPR7uP/desN7VcDTyo1GaCgt6rHS10FxBcHWZMwMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBOata2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCIEG+W5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZSwr2712888
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=; b=cBOata2ha3mzT2r4
	NpDWj8zrLNGSUg7IPgZNw0ZxMh6wdFvQ7Lpe2wW1dtVrVuOcnrGTF5DNORb2qj/j
	lhPgBcWvfKnVCNo09tuDB+QlOgNwJrQAAzAQGP+g2S/KIwJG0vrCDRdRterxoSce
	mu6gVgODNhntvCsNyxS7jFeGUw6Nw9UXl38pF5VViGcRYReqGyFK0eVvKw+NXluv
	Sl2VTpTp9xCRqpeWxRA+wz/w/6qg/RVbsihsQNPoCs00flPzB0mwsP/k4kTCV1Sl
	D6eV97jg4mA3A9eQGroeGpbgluG/ftmNzsq0XH0JusyxxIvLkAaj1P39+HjaJ5ns
	NHD68A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete9810xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:25:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so43358395ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781529951; x=1782134751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=VCIEG+W5dFBU7zILN0BbwUBRubesRG8hW/eStifBc02V+f1glW1/wY3LVHytnivR43
         5qmA7EIGVpjMPjBMzlFo4RQVaYyM2WOsw93iaDoPVMfdJKo8EpVxw1MuyhfE0o4Q+1FW
         C5W/7Moy2tnePNnkTGWiTekDAjgL3TeteQq+0A+Su/0rwTVlLl4VTMqoaTbo5qESXpRu
         oIQe/qUGp7Y17ehso7FL0p6OSCHMpdBhdqbIoxlXTq16jy1+dXQU/Yv+bWMPec0Yd7eE
         tCPRVai2AHGJC37pZrA59NLqX8kInfnKR+TxR7FAIA1K1I2i8J+8BHjYjXtlu6PZzqFq
         w5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529951; x=1782134751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=KaM7BOeCOxDHZRr6lHeWRXdD56Be967JM4Jnzuhe+dywyKNsFAM5qsy9mYElQO4wV2
         LuanDhT5Vmng4NQAQQXpRYzFNjUGS2pA98FlW35qsAuEMn4u6RKUl/SexltCsbsWnYGN
         cNbDfosxRTxg1oj2MEyY+4v8gk5c3UDseVv+o/S2tijyekhtXYzj2YOBiuHpIucYSXaU
         PCmpCNtTl261hUqXNsQU5y1oaBS5dw6HzLJT1dXQWghD3aeLJYs9uJnfJxOWUe92/9iv
         CNYsCBwZdjutOruZ35kQCuEHT7UUaxV2hgoQwOb7G28jubi7cMQsXZvioCc/NjONAtNN
         oLAA==
X-Forwarded-Encrypted: i=1; AFNElJ/E5cOhp7MBydcbRcatQdyPnZKD9xlHtBBcbO/Arw/mgsyjHPIlRuDQfi1sawH78bgqjjZQR9S9Tm4K6euG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyh+PpPJIPa8JXntLYHYQ9ReR48ldGHsz4FqFoLATe2kw9EC3Y
	pL21VVBR1qOfK3dx4Yb4ph4gToPIfrASLaV9Fp9G1gIZdnONwvrBzXBhp+h33BxT5MP6oUjTGgg
	T4bwqax3SJNp5NrFofKJ+VVgSJ1JbDDV3crxuzzFZ9EjxByfqYujbPlHavlN7RRz48FI0
X-Gm-Gg: Acq92OGjsXEeEOzNgSIGjgkt71j1e6qMT45yv8mNcWcS3ZCLKLHE/GB1DqnDMJ7G/7M
	g/xMuTkfIvHEEclJ/XrUBR0uRlkXVjorJZFBA/pG6nku3D6oF9PeMuVzhFZd1yHKt/tPi96ZumX
	/yEYdBkKkm2nscoBGndvEJ463pyly+mRImsJ8G07GLx5mVbQvMBek+yErT1faixlpiZoaIMQO6w
	zCZfoYM0lmXc+MSQf6PSSGWCWl22kLGn12L+oIBqs76wdFWbxqGJMx/os2HHgyuOfGovSFYkxv9
	ArM0VmWwy8sPbFPJQnbbm3WqY6pNlQ1h2PBEtXVZkhkW43IJTHcRdCIeRh9pZw40n+iPASqwOXm
	CJfIYLrG4MO5kF0m4+zN46AhOn75mEwm4e1taVqmjoV/CDWY3HA==
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158666345ad.30.1781529951474;
        Mon, 15 Jun 2026 06:25:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158665745ad.30.1781529950823;
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm104350545ad.23.2026.06.15.06.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Message-ID: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:55:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2ffd60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=he2KC8_JSkmjwAK-aeQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zxfQFlJwxprc5SbjR6doskS8fI4YiTfG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX8pUfLxkjZGO6
 kVkMXDEY+V1HBGpIKHNGt/7EJSpkN4KLBfvhlhDti3QTB0tVxvVGW681RKRceX3c8vECN+XvhPg
 n880LUhQEDE9JAJ/wKnZzGcvTa6j074=
X-Proofpoint-ORIG-GUID: zxfQFlJwxprc5SbjR6doskS8fI4YiTfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX0jvon4lK6k0E
 hq7Rzrf74czhK8h/rNgxfx+Y7zdjtRbkLr+yQDxX8bzzEU6J1ZfEtufRWbDg+nlUGrFD2KUiPbA
 /uUHrGoGIWOkjmphhIv7Fs52offbkpVCTbgSApAJXC8Gx+MjCFH5/ZW6w7XGa3uQNsRKO3Bdc57
 Qvdicim+cl+hNbdo5T3j9bluNM8hgU2hWpPiW4fOIjPohEzCRTouhUrvE+PCpGWJPhT/RCChAWi
 tLBkWR8BVMpVug1CH4oOcBAVWUz6ppONUy4LcAKK01Vk+FjbsIzxY/iAs9MI+MiAGt06zsXD/Kp
 FkCKt4E4U9CqjdE3XY2kYGjQjZR1SlLE4D+4hs2BoDAfYmgkNYEYnE8JiFd2sQq2CO5GnO+CXwL
 t1zjipcfOOxl+xHSzIRdk6RwflVa703p5Eh38NJgy3aDsU72ek4Uzk7EWSK07AfWlJqeX8hgn+t
 9ky7CcBq0lpjFapLvBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113185-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 992AE686BB4



On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>> On some SoCs the SMMU registers require an active interconnect
>> bandwidth vote to be accessible. While other clients typically
>> satisfy this requirement implicitly, certain corner cases (e.g.
>> during sleep/wakeup transitions) can leave the SMMU without a
>> vote, causing intermittent register access failures.
>>
>> Add support for an optional interconnect path to the arm-smmu
>> driver and vote for bandwidth while the SMMU is active. The path
>> is acquired from DT if present and ignored otherwise.
>>
>> The bandwidth vote is enabled before accessing SMMU registers
>> during probe and runtime resume, and released during runtime
>> suspend and on error paths.
>>
>> Generally, from an architectural perspective, GEM_NOC and DDR are
>> expected to have an active vote whenever the adreno_smmu block is
>> powered on. In most common use cases, this requirement is implicitly
>> satisfied because other GPU-related clients (for example, the GMU
>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>
>> However, there are certain corner cases, such as during sleep/wakeup
>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>> is powered down. If adreno_smmu is then accessed while the interconnect
>> vote is missing, it can lead to the observed failures. Because of the
>> precise ordering involved, this scenario is difficult to reproduce
>> consistently.
>> (also GDSC is involved in adreno usecases can have an independent vote)
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -53,6 +53,11 @@
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>>   
>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>> +#define ARM_SMMU_ICC_AVG_BW		0
>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> 
> totally random numbers, which might be different for non-Qualcomm platform.
> 
>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>> +
>>   static int force_stage;
>>   module_param(force_stage, int, S_IRUGO);
>>   MODULE_PARM_DESC(force_stage,
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> 
> Is there always only one bus / path in question?
> 

<Apologies, missed to respond to this query>
Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
while accessing the DDR in downstream path (client->TCU->DDR), which we 
are addressing here.
Hence it's only one icc path in question here.

Thanks & regards,
Bibek

>> +	if (IS_ERR(smmu->icc_path)) {
> 
> if (!IS_ERR(smmu->icc_path))
> 	return 0;
> 
> int err = PTR_ERR();
> if (err == -ENODEV) {
> 	icc_path = NULL;
> 	return 0;
> }
> 
> return dev_err_probe();
> 
> 
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODEV) {
>> +			smmu->icc_path = NULL;
>> +			return 0;
>> +		}
>> +		return dev_err_probe(smmu->dev, err,
>> +				     "failed to get interconnect path\n");
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> 
> WARN_ON_ONCE()?
> 
> Pass the error to the caller.
> 
> 
>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> 
> Pass the error to the caller.
> 
>> +}
>> +
>>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>   {
>>   	/*
>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	/*
>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>> +	 */
>> +	err = arm_smmu_icc_get(smmu);
>> +	if (err) {
>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +		return err;
>> +	}
>> +	arm_smmu_icc_enable(smmu);
> 
> Handle the error.
> 
>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		arm_smmu_icc_disable(smmu);
> 
> Handle the error.
> 
> etc.
> 
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
> 


