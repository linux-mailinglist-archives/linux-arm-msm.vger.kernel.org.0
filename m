Return-Path: <linux-arm-msm+bounces-92485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MCjHRASi2nSPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:10:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AA11A001
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62FBD301E227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E987334CFBB;
	Tue, 10 Feb 2026 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZnNimaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaKd6ZTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6733D509
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721805; cv=none; b=Bawot5fNJ8wG5I9O3CYp5k1nfodIS6qxpwxIWIQQQazU1yRK3URoDpqKuSSOQBvLr9WICbQIpiPj36v4SBCqLywVaT1YHMJOxxaETegHX8O8dg3UALYoNIG+c34V5qgXQcpeT4yIPLpBmOK/NrbFFKFAmM/iyk5YMa9Y6hOzFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721805; c=relaxed/simple;
	bh=1w8xc8VCus6Qr0Wfc6mOnjPJ5XW3KYBH6lwESXiLGzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hah3r5Od+aeqLSJ4qIxy0Vw7+QYeiZ5a/SLSoPbLAmnGqUa+WnAfV9GPkW67DV7M9wnYVxLu7T+iGGFyR93UVAKnqNsJDYA9AwjhT04NyHiyiAVYHjtOWuTO06RrB6vbWuHuifmA8FdBE/yB5E4XAB9JWIKGrmAUDSXVapkftpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZnNimaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaKd6ZTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z4W72169285
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 11:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=; b=fZnNimaSKkGrjM+X
	Gnc4PGcLsrm8DHUPlSFUV0qwPyDXk7f6PPirnHgGqnfP2SD2x5YMkuRx7VIA9GBR
	OlkaSRO3lNHD0wNrCOBB4vFSs8IC7x+e7YGSy8nVmHJtCMRypxNJ6MEBMCap+5PR
	NDJtny7fF+sAf4Bv5Pqt2lv4Kb7QD4yByniRjC9nC7f/i80iWcMq8cz9YZ2MiQc+
	np+J6/vHvu5RtO7/SGu2wC1IQu2ls6hTZV5CT40k7ULgU/VayzkZbikDnmYnCFZQ
	Gjfbz7+MgHAWaqdmMkjS+2ImOWlP8a7+VQzw656j/LBuMOeLS4lwV43l6jmaokdu
	RMk3fw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrq6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 11:10:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a79164b686so10026465ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 03:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770721803; x=1771326603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=;
        b=IaKd6ZTk0Qt/uMybUBA10asWaBNb2DhNKSt3DRdtBeNpz1mc32u7gasaPAd5CuQFY/
         zIAgpM3FcwDQ+VqALHTaRWFmS0qwh2NSuOJR0k8QAoAacvYSdWlZnq2b1bpYiM1aWnQi
         6Hbg+F7Ty7367XXkc+WXw0W7n+lKqdGd60n1/ppC1u5S1G2Jwob2ESLU1HKe+WuiQRWl
         d62DyySnm2fKVdnAzQS2MaGcGjBP6oZzkaIbiUXvn037wE1UkO5qEiOxWEFQtLawCTAA
         6lxEbU789PKTcuGLXYDhZQVKK4QWVYEwvbtJl4kF8TfiURqRoPglwrw8Ux5AnkhkYZrE
         IlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770721803; x=1771326603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=;
        b=Xt/O+h98OATJqw3kg13w32OcCtZ9XIyktNgB57c+BP9z8lxdm5/wPY+Nni5zROAesk
         oMCmAt9CGwX34DbKC+k0IDOKgvL7F9XroMsCpVkA3wURds1JZi1/NfcaAmy7iVcHZNR2
         vKPLYqY9RV6/8xMO6evSa58mILoxAt5kXPvssEQkDxs9GkYVzWHFWzf6HgrQppm0nkLQ
         nowhJg0TZt5Y38mnpi0CeTHL2AruSk07Mr6KVQVxCix7iPPyR45RF6gD0+EbFdFIPWZK
         HKKQncI8P29F5tfehRcmvSY0L42KZaziHfB3U9ud/Esdbil1HbfzZjLESlxtPR35zJhf
         SgPg==
X-Forwarded-Encrypted: i=1; AJvYcCV6APj9Eb2fAmEqSfOz18X1sFna2J3HaCDRJ0TRmlqKqlVDxExo329fXW/vJ/vNvR53FzSFRgNi8neZkw+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WGml0o29B/DF4FqXJvSx5kMjq8P9Aq3aLLKPTlJ/emtDxd8O
	TYTs9vdqbGID/gUAwzRn2U1Ojh3dE07bai2TvPa2iPRYf58eJ1BG+bk3YhV19Bv3dJsDWYQBGNN
	wj2N7J2zu1vTEC2lbNl6zHCWW/jA3ROURqn+89l5CRs1/WDxkCu0Fjn6ghhloHR49brZdmvcpHG
	XW
X-Gm-Gg: AZuq6aKSAWH2P0WeZ1zb9QYdGSgxrVrzh7rb7lqNsPpOhdD4qkGIrHcNCjtUnFkAKUW
	1zTbPugg97kq5lY40XqGzYIq4ZvWn2qkkbgAixyzKbrLAzYIW2NUvPGFIvpsF/2ioO/3nUmrcrw
	yie6hopxIIQqq7+LlTkTQU9ftN20rQy9A4NPxLQFSoFR40UAZ3rVcJr1i6MEFhk9i9WQwqZE6hz
	644TNIIzb8iAARZGtgX8tQRWkpIYUQBdT3FaVzez4Gg8HJCTv3uZnN4b+qP2hy+noZNHLVm78IA
	IIGkp4CkPfd7r8L45VWprFjP8pdbHz5Cr6PGHdJ+owluQe5vntsgtvoUUabuFZkjxQi75IABIz3
	qcPteh1+NZ+m4yFvLYK99UVucpRMPhNpOiQ50DBjdRwGSwRhaa1Pp
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr94582615ad.61.1770721802915;
        Tue, 10 Feb 2026 03:10:02 -0800 (PST)
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr94582105ad.61.1770721802081;
        Tue, 10 Feb 2026 03:10:02 -0800 (PST)
Received: from [10.219.57.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95dce24f0sm119367945ad.32.2026.02.10.03.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 03:10:01 -0800 (PST)
Message-ID: <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 16:39:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott
 <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com> <aYEFop8CJiLYzhLw@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <aYEFop8CJiLYzhLw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA5MiBTYWx0ZWRfXwqALmBNjWFur
 AA8ruTYq/ekGfoTHeqZW16LLdO2s9ucn5IZD+ipmoTzlU1nP9YzQwAmMM95YiRGGLvJ+3S2Zk6u
 a6KuTB4mVvYjoL5aWll9TgTzPTvR98/N8CmmPH03UgpPezPRWa0g1TYXuuv3JbGxVxJgrPyYfx9
 HERftxEk+wAgZqRW1Mp9erMqMMEf/VozHX24C3Ba54iNMrCUIfpvlqEUaKmIhE2ZrOGd/tBylHQ
 PzGlA4zhgFbfXtNsv387L9oTisTbQTBYqGtmXR0kGImiadwRfCrZdHyIrKoU+JNSKH2PSMwbBKS
 FUfNWrev2RiZfBmIu5IxB+9aNRcPXWxv84UTeNgYxtmH7LiWz25DRhtcbJ+Kk7rxjuo/tTkzQ0E
 b7Gtp5fyWP3JK+SCRwCEkwDJNOWZO4foB1sp5nullQMqX+oGsgGE7YlQuEB7aGUli5Hb+PLNfLX
 J+oFCvTQuRxFsb9SqfA==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b120c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=oqkVm95N0dxC-dYrnX4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: B41ApgYWQlypQiFAYKSKOFDH-Ko_uWop
X-Proofpoint-GUID: B41ApgYWQlypQiFAYKSKOFDH-Ko_uWop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92485-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prakash.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB6AA11A001
X-Rspamd-Action: no action



On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
>> [ +Pranjal as this might matter for v3 too... ]
>>
> 
> Hi Robin,
> 
> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> "can of worms" regarding power races by leaning on these differences:
> 
>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
>    event handlers are fully threaded. This allows us to call 
>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
>    the hardware to resume.
> 
>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
>    pending gerrors in the suspend callback before the SMMU actually
>    powers down. Any GERROR interrupts received while the device was
>    suspended are treated as spurious and ignored.
> 
> Thanks,
> Praan

[1] refer to case where SMMU state is not retained during smmu device
power down, this I think is equally applicable for both context and
global faults.

Since the ARM SMMU runtime resume triggers a device reset, any pending
faults would be cleared during resume. Here the solution can be to
handle both global and context faults before allowing the SMMU device to
suspend.
With this approach, any hard or threaded IRQ scheduled after the SMMU
device has suspended can be safely ignored.
One concern I see is iommu fault reporting to clients while handling
fault during smmu device suspend.

Thanks,
Prakash

[1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/

