Return-Path: <linux-arm-msm+bounces-104239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOzaKBTl6WkGmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598444F5F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB0F30C8510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A863E4C84;
	Thu, 23 Apr 2026 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0Z3idkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkQhyTj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15323E3DA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935977; cv=none; b=neayp9IF4o7JucjsTWa4Sqdmd9azFt0IH40iplIsMr8JXpoAnlrMA+MIETcpC0fdLuHmfFcI8HZywuK96ParAUjdTIYkeTRFCLt2cuv3YtxzFIHnKJ8pdaDYilgZIYsAs52mIFBaV1Jxdq/JLBKRgO+XSJADpb0dcHK5Q6uQ0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935977; c=relaxed/simple;
	bh=3/bqvRZ8gHm78dMBJuuMnLOpRfzMQhb4Upi3jL7tjzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLg2k5ZHp5Ez+lVtsTiF/uR1vXxDFH4ohQ38g/Sudk6ubAFjJBfEEVY2iIwOtuisURoc2OWhyOwb4GPljHr+GZYY/FrHtIhGb7L1hUtQtxy6E+SKRbk73xiV2BUvP7NvhC56ujDkYstTR/+jFEGM4FbTAxK3UxzEs+j+Zq/tJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0Z3idkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkQhyTj8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFEC3295144
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=; b=g0Z3idkGEercl/jh
	Mp3ubY0VeWCQHAKorCBt1kBMMkN7obmd2EcioPDTvDKQs2FZ295fOjvm9994WHto
	ubmzx4xsLuB6kaqC6Ov5EO6qT6mdhBjLFyqrshdUPYJPKUEKwdoIGpVVDom8OnHS
	ByDca94SQ5hqeI3zGAccjwyYFxGo6cNOeKp2Vukqg4FYU2GZ3igjEhhQZzv3vkHl
	39nSMrwIdb1F/XSJcprJf/v9nkGUpg2nfwZo74A990fte0RS4Maz7Ca970Y4dsAL
	wlEsJslKrE+jb2KzcRLJYonKaNI/Gn8noCDlTM6fQkg16pn9WrnR3yr+LDFk/5X6
	FeO+rw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282u1gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:19:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so7053537a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935974; x=1777540774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=;
        b=WkQhyTj8ILE+qzCjWr7a/5dZ/a5KVIFIm8Hcr1Cd5++U3r1Po1JDhQuGpArZVLRsvk
         ngcTnpPusl1QYOv8agdl+FA90l2cmVWSqsP204cyJsg3vemxtmOQU3wGjQB62eu/Pgkm
         boR5xPfIxkDEMPa9dskJjyLwN1MOiCq1pqgrhwcR9R9U0pD0gqfUGfV0I0kXPnDHGC28
         Z1Rub3INkNl9JBLspZBHsyurXL0phuciyefuffNkEYm+LdwwClkV/1dNOw22h3TcUISJ
         oWjRYw3u/tilQLga22z2+1TqsJhQIzYUm2JoCThGHkYJ/EbFwJhREEht0fmXRGkA8W+0
         UE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935974; x=1777540774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=;
        b=huGnzUxleCYV6nmw+mC64A/evtL6RRZEvE/SMHf5DtIacJWBU328IBubXkK8TqSsH0
         Kg4WO9rwuKNObCPzW1wYG/a4dcyqo8jcTHgsEWKwRB6mqLdYB/frQQPeZf+zkuDu0dLk
         e1kQM2u1abP3lLUoDwH2sFwzDp1v6onxm9q4uBanXI0V9ml1O6pYeEJ3boeXPMzoo77F
         wj+b2C8KS6UGsS7B72uyjWO9LvPtqGz/WBjKPkJ8PZOz0fFtxcnxAkKXHERZlmzqH+72
         iXRwUedg1dAhVf0TZdJpMkqV0c0v4EVJQRyESNeSdBMleZL3H7Fi/5mohG+eceL0o5XC
         CHlw==
X-Gm-Message-State: AOJu0YxVpy4+y79Q2oL0EUozeGvXckKVtPEK0hmhDg1Gv0X//CxfFYAw
	TcSnM8eYCJ9tzV0w3TDLfApOBgwihrp0HKJCM1UWyvHIgLIuKGmiePjnKxYx1BpTRx0QGTkEkRz
	+BGgIcn7NDRtg5vi28fBLmF4fovidafhTG3QPJgYNz7IAtn4/kivu8I2lZwcRu+7weAp6mzu9nj
	Emsl4=
X-Gm-Gg: AeBDies9Khl0lGcc0o3kOWW6HufXbpAYlpyRxxZNcIHNeGYxxdNpoDrt60ZkoX47Cmf
	0jdeHBCk0I7GDoAnWYyqZBWU9UTEzDAOqprWCD/zU1RbXPdOEvgbEqSOoZkacwAs4iMnLz8sWJ4
	w9C3BARxA/SvPxbbayhWrUTlPDbYtCr2JVlJoJsSEgHsFfTd/rqb4Hz2sgyjI83wEm9dqPFkNln
	Oiivy2TkNODf0k4C5/lrXDJZ4F5fpvWO6D80zrQsYeBGVTqn3gDqUWv/1FdQXTsZOZf0UIQvbHa
	dzR/RbVdm6tMgaPlurnN4isbQeBK5pSoH52utZvIZZltUm9jSmVIqCmNGbIlokhuDCKTnUj9MJ3
	Ooho0A5RssSPZAjvzhyZyCb2UTRF3MsCTYInH8irWkIYXY0pOZ/BqpsGRRnls
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24806256a91.14.1776935974016;
        Thu, 23 Apr 2026 02:19:34 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24806229a91.14.1776935973530;
        Thu, 23 Apr 2026 02:19:33 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9dfc8sm16450651a12.12.2026.04.23.02.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:19:32 -0700 (PDT)
Message-ID: <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:49:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MCBTYWx0ZWRfX0g09dMdtJIor
 50qn2HG1m6EpMK+QEwQFeLAwuYLg+KbDWsNZPVzj1zgLdbw6NXPFWquqIJXZbXUlp5O2ke0Pn9h
 3XXYsM1p0+cQySqubzZBLGk8zbUKWY5OmsJ4o29LcRJi9cyJhBKJtTGWvRDlC9ozk7zwacGL1KV
 o5zLSXzBkAVmb5/xPq58v/UwegLYpf3eygnchhojKMdK+kOsh9D/EXrcwD23CU7Dob8SqWS+RXy
 h+uNA88IcY8JTJWT9RwlrEvpUXwE/dDN3qYUCV0Xu7l1dxQU+iE/Przapvyn00ISaW8GcndgkSB
 nhsfIOSn/zxZ4zc61cq38vAkVrLM7U5DQ/S2QAH0zO2qJHtdWJZuYxWQL580DvL/sg1OV3UrzWv
 K0Fu2WSr3xkGfmutQUPGTZgIy8TYQWLIUXJaHT5mzJPdUw70e10c8FH3uq3Jq1GWmNORMNeXRCm
 3k8y3w5sJbo/aH7Dvmw==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9e427 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hjYmQKKNbgHO1xYbCvYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Kh_JiHEs4tHlySFvBIFBC0HpwoP9DkPX
X-Proofpoint-ORIG-GUID: Kh_JiHEs4tHlySFvBIFBC0HpwoP9DkPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,9cb80000:email,9c900000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104239-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1598444F5F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23-04-2026 14:20, Konrad Dybcio wrote:
> On 4/23/26 8:35 AM, Jianping Li wrote:
>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>> runtime). The kernel then reports failure to reserve the region and
>> subsequent EFI runtime activity may trigger aborts.
>>
>> The remote heap node was described as a fixed "no-map" region, which
>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>> reserved memory region with reusable CMA-backed allocation, specifying
>> alignment and size.
>>
>> This avoids hard carveouts and reduces the chance of conflicting with
>> firmware memory maps while keeping an explicit pool for ADSP remote
>> heap usage.
>>
>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 988ca5f7c8a0..420219823496 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>  		};
>>  
>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>> -			no-map;
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>> +			compatible = "shared-dma-pool";
>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> Since DRAM starts at 0x8000_0000, is it intended to only allow this
> region to be in the lower 2 gigs?
> 
> (it may very well be for some historical reasons)
yes, this is intentional. ADSP supports 32-bit address.
> 
> Konrad
> 


