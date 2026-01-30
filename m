Return-Path: <linux-arm-msm+bounces-91298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II4LLcWcfGn2NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:57:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA5BA415
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB66830086EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A015286416;
	Fri, 30 Jan 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBsZJa06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RG9UJZf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C5220F2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774265; cv=none; b=htFzYtDHZirGH55cE4kxdsZKHuHHrwdieWeo97Yihwp+uHpRi778B8xHGwQr3Jd7P9qgBQG5qyqDHuMTCnr5rWrDsepQcg0njPHntAeAfuDwHBnh/YW+NrpsDzLk6F1HA34e4goDi7IE0EJDcX05ea/69T0Hg22Yzy9FmZbZsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774265; c=relaxed/simple;
	bh=G2rV932q4SPE5ovdyXodes8U9OvCPmJBv/MOS4B4cTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6PMqIckv+bHLgvQesqVYeiJ2kjfsbhqvSkLb1pi8/x5a3H4O1LkMYKVl/vXgb3syvF2F3Q3RtVydxpZbS5HONCvYCfg8iHu1C2kbetW7ZLXuKgJaogQyAlK4H108reCCdXxFMFhyed9rLLhHi16G3Uz6fKcdNYC4mscDMkzqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBsZJa06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RG9UJZf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAZqgW1022153
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=; b=kBsZJa065k+BbQho
	EbFYJ+sHWRg7Y6/HMUyRq1f+eVjZ9As0oSIY7XRuLQDA7qcukZ2amYzI4CkPCsOf
	elCZCSxMO4ci2dQhB+b54MiaFTXZdMG1sHM2zaYdMt5eg1Jft5hKUG/9sgvjm4FP
	SwG47WdKWCeLaRK++8AVOKuf576RGxShnCOhUS1Wwr8Z9yEYFywmEMKoaisrg9dH
	4KDuPVMRUNns5GTSYVvVYPg5jiH6Ty0L96wAA05vq+v4GHO0ce+ikZHDHPjQ+dpV
	7eOkKyuwZM0/icTpnUHGSYDjP3ADx60w3qrXTR4aETKxkpTtz6RDx+SpVfJY+X7p
	+NSkGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3kaenr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:57:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so2048743a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774262; x=1770379062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=;
        b=RG9UJZf0AUTxniKBsMHaHwYzDTX1Drm9RCmCADmunc7Km2RSB11fZphRyCRIkUtfCl
         ECmJs9LNKKDxVgwB/fzvLbKRR4ZtCRG+pWVqo2e8eQumuYMcYzsXnY1AkR+QrHX/wDxx
         m5CqzrwNLHNc6gFwfPS6MZBB7i4oSTq8oGDMkM5yRAbgU/hti0NzSvXFD0Sn/AKtoXiZ
         KqeN0fJh/IuV5wple/xScl92LDT51FcVgX0bDzz6s0qUaP4blsmYRuRqz5pte+T8Pcyo
         EAl8CLDk0xZU6PpweK/rn1OF21fGZIS4fsF8hjV87pqOGtx8sLsG6tylk4wkH40xQlg0
         uoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774262; x=1770379062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=;
        b=iVAMBIeyYtz1Bik5HhFcyaiQ5o6TgYyAkmLPqtLO4XFFp4Aa1MWhcI1M+jA2GO0vMr
         DHB/XmZuLBQa4bSmwST4OPY/thlQhLdcshfAzt30OX1v8DjFQbgl0/e7zog1uGhhfY5Y
         W2QNJsUPfrOlPSjrG7uZ9wM635TuvNaCSq4UlMgx8Kxh3vmzjPxMa3eDRFtpJMuOcymX
         TjUoBswueho7QDFhSHo20kVxHBDeHo2EQLkrro8ncBzrnwJ3Yh7P6FnpDbEd0tTg0kwT
         KwatZN0pU374GXiQM+ek06vGEA6REyKwjpVSQfks3B0/abrBT3IobMxpL6rjg0RdQhQZ
         X5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXaCEDaZEdepZojeoo/24oRHpFGDPH4clI97JL/r4w8PLyDOP2F/m2BZomm4g2sMqSEMRr3S9gfvF7Fhf/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tyz8aI5GeIYZe+rZuOemwnhFP5lequweDVVZdphqPCPHl0U6
	LZR3WZ0umKLV18rNKSinljVltETrxtSndn1LHDbXyL3Sk9TBG9pszGceExwjW60yKS4viWoFsU0
	VIc2W2Two5SXEnclYC+zrWxxwRlagMsX0OuWMH74WSQRD2cGgTbY/BSUmp7EUXpzQIi/a
X-Gm-Gg: AZuq6aL/8sTKaA8ZdbBQ+0UmU8X52xSYd/CoDOOo4mjmQJ5TNA9BIxXPL0rXOCm3NGd
	+lR6IPSLStQpgAGSiAr4C/ccnIpUyWqNElUWzKP18CnKCcmaNyCJXhSSe1VGnwgG9PrfrRDQNNc
	d6btLY5B6hCWGnZg8D16QzISiRCcPwVou9igTF9JPGE7cPZKWvOQJXNAFYjb8OfgDN8sOG8M/tY
	52ftKG1yDttedr1IsondbGJQSeHshvmyYej8oG5f+BBaJWGpKTDw5Agvoj69eEMCHDqHwatrWo9
	qvHujWNgB9+NKsLCdc1DNxazQ19c9rNuel+YL9b1cvSkU1l4U6lNw77q2iZQnnzjnkKWGOWP+uU
	pbEFI9LuToZF6CePKSepYuDlCyn/l640lKfiMuQ==
X-Received: by 2002:a17:90b:5404:b0:353:100:2f20 with SMTP id 98e67ed59e1d1-3543b3283ecmr2260471a91.10.1769774261966;
        Fri, 30 Jan 2026 03:57:41 -0800 (PST)
X-Received: by 2002:a17:90b:5404:b0:353:100:2f20 with SMTP id 98e67ed59e1d1-3543b3283ecmr2260453a91.10.1769774261498;
        Fri, 30 Jan 2026 03:57:41 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6206386sm11200479a91.15.2026.01.30.03.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:57:41 -0800 (PST)
Message-ID: <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:27:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c9cb7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7TOm-_SFLvYlJXCAKM4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HJKbXjegB1o6sg5K_0VfONzTwUVXg-aG
X-Proofpoint-ORIG-GUID: HJKbXjegB1o6sg5K_0VfONzTwUVXg-aG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NyBTYWx0ZWRfX+74HaPOpUtr+
 C8S7WQYEb1+Ab14sTIq9P+RZKF6HjBcwKE6AV9xJIyviruuR23wxw6ARGih/LiiBnSQCvMbDwSJ
 lg8sXHhBzZCLwtj1xadfycynh80YELhDWuzW4JjGDiCX4BfjnzMuGEjMDfXJysLn/gfwHzmHjNW
 1NZwoZVBgcfGdzhP0l2fj6RmTnezWGgxSXFOgMfrCZTMiQookhawXLOySd5wM5lVx/b4Jbwog00
 P4jbwd9RhbiNFfA6ip4CP0A6VQIQpavZzmZG3vFtZYiTpEYYmm7AQmfsLQ0hpFF7hGkAYeVDDmk
 +4bG3ELeCUUJS6ET+rNNtP/8ZDypxKLirw+GQF9S5gLNZqYo2Op2lxa4bc7HKLsbv/D6AWSfwTh
 CyVwmlwJcb2puSv2qI4/00ZmNG9ZDJnaRi6rG8zRqgWUyd1G7CUDXjDqcAJM1sBRfTgifXviKtj
 aG1Zxpv5GUCgZBLni5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91298-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18BA5BA415
X-Rspamd-Action: no action



On 1/30/2026 7:59 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
>>
>> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
>>>> Currently, FastRPC only supports mapping buffers allocated by the
>>>> kernel. This limits flexibility for applications that allocate memory
>>>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
>>> Hmm, for DMABUF we need _import_ support rather than support for mapping
>>> of userspace-allocated buffers.
>>>
>>>> Add support for mapping and unmapping userspace-allocated buffers to
>>>> the DSP through SMMU. This includes handling map requests for rpcmem
>>>> and DMABUF-backed memory and providing corresponding unmap
>>>> functionality.
>>> For me this definitely looks like a step back. For drm/accel we are
>>> going to have GEM-managed buffers only. Why do we need to handle
>>> userspace-allocated buffers here?
>> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
>> change is to enable routing of DSP logs to HLOS which is done by using a shared
>> buffer between userspace process and DSP PD. The buffer can be allocated from
>> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
>>
>> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
>> with this change.
> So, you have the DMA-BUF buffer. Instead of mapping it from userspace
> with unclean semantics, please import the buffer.
I'm assuming fastrpc_map_create is sort of importing the buffer by calling
dma_buf_map_attachment. Is this not the correct understanding? This assumption
is based on the existing part inside fastrpc_get_args, where fastrpc_map_create is
getting called for each of user passed DMA-BUF.

Moving to accel based driver is going to standardize this as the .gem_prime_import
implementation is going to handle this case.

//Ekansh

>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>>>


