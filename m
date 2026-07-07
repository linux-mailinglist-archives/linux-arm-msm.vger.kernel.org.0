Return-Path: <linux-arm-msm+bounces-117299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +iTXD07jTGpRrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:30:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9571AF25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bHpQ2wBx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dWReKGle;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117299-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117299-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E6AF313F855
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583623F788A;
	Tue,  7 Jul 2026 11:21:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E23D8900
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423266; cv=none; b=GEzlz477fpclRyQhunbR8BEyDjkOoHUHeKWRdPflZUYf6Yjt8D1uXU1jaOfryOVaQpbmsVXEuwjMFz3ZZyAwFzbctCcnJbjYjyAfu4ro2ZTDB+4vh41al4DXBePdwhfiFJTj4hHOsMeDkqFfNIXyeSyhvemLDh6atAJ5aWPDGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423266; c=relaxed/simple;
	bh=JYUvzuuWw5E0wa6omHT2KRUpq8F3kApiUn9R/rynl50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=SQxQi6s0UWmtEFlXo+Zkn9cQgOa4+1yhrqlYgnNnsxKtWDlf0utHhtneBSkx7wf2t0+8+JF/eVl5vemHa5i/7tj5axevN1VQ6wJjA38yWilebCiCo3n+T+BYV1zmr7sQw4NCRbnbaXZWW3QInPr5OIdTaNcst5aZTPQLw7cVkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHpQ2wBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWReKGle; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DisK3243253
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 11:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nq1QLoA0VSvOC8P3D7v4RJn736LoYibRkgnYt4FncB8=; b=bHpQ2wBxXoD70CUH
	/Pnbk+IatHQNXB1+7Rl0nbAo3o9SF6FtiXPp5oePUlfdMLNfB5j1ZVVQaIEM7Q2p
	nTkFH8fOEE9VaeuD/+Jo3GZym4t/tCpxO34CV9ZmZF+/obVCoOhCOCZKSyb6w09f
	Zo/h0bx1kueLdh8a3PUNM+zFLbKqJiIWjaSuVhHqUvcxNJkptFQt6WLgITJNRD7v
	kRJfUtUq8+vJ104T0XqU4FBDsPIYo4UTm+/NQRbn3SyYmBx7z4M8V6ZaNTNVBkEf
	0lm2WJKDz1/ifQwxMsEqkcSXKKtsRUc9bmN4AendxR++BFrTK4MnHp0fBt+ZBaxR
	Gv0BLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rxen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:21:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso6096466b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783423262; x=1784028062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nq1QLoA0VSvOC8P3D7v4RJn736LoYibRkgnYt4FncB8=;
        b=dWReKGleGPIHRaMF+bwnJV00lzo+aqDaSXYK4JXA9yHLOLYbOwjDL0z+s03aNvkiF0
         PQIQCixalfGR68LxVAmaPWNVR+aP2qiDLk4mfyTAAlbUgNv/W3ZH0nCs5nnyrfJeoTNE
         v/VEplBzdFfl1s4ESE8yAYrPsZ7dI1U3iSildeYljpJSrN63wXgQN9bl/S8rWVIq2Ubh
         DFTi+7OOpPblk2zujRizsVYE0/VUtZzhXUiNFO4mzLqrWMa+Ris+CzFmtFrdLiALnXUV
         f9mFsi8mut7+g6hxcGv9OOKooTHHRUOaU54/bEB50wKMbMoNTdk/VoZtHo1u7u4bzbXi
         bQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423262; x=1784028062;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq1QLoA0VSvOC8P3D7v4RJn736LoYibRkgnYt4FncB8=;
        b=MUshhWSbTxayDiEDTb7aykg2rH6/Vet9/B5GFAo7rEMSaIBYvenFtyRM6I0yqi+V8p
         0EVcP6/wGZ5xzJjfEl0KmpGLlPtbSJEkhCM2VtUcYcdreKJA+wr/z4o8IuJi6ZL0CFHm
         B4BSxOWRQOpHtB1sgE61DCq0/ekPuvbw8vCwOp0BygWS5sCWXWJo69LhOtfTFQKlLiWI
         8YaUP6QVnRsA7CrgpqpYQmsJrbnuUGPU7sGNdAm9qqMnIEKjQKJ77UHMvbJCUx5sHHyc
         SW2wzN9BOoXu83sRP0ZrmBnBwaqKxTH9bgogpoCaTGx70gHxpMyw2bPhtsvSDGWiGNZk
         ltMA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7aFELPrAWJx01xUFo5ou7Eh3s0jcm42HiJocfRO0kSD6NkBhST5sMBobzjrL8Uh062RS56lc7diFw9qK1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ftkY9UliLJkZ8AgQ07gJQMKOegpfnHbsk6pCLT8Y94eMJ/u7
	aZXq8b5KbctRyfx3OZju9Im8aH61mus3Mk17PzUMK7Bau1i5abQmUPOuFtpJebQctIL4pVTtGDs
	iL/43G1FK9mxot8z3glirePNeksvzLCy7sWRk3Yx1g1V9dX6WgrXRk2DTHBYen6zv8QGJ
X-Gm-Gg: AfdE7cm6gr5AC8UlZdZWWbQxf4Bg6r4mBUkK/DOw2cSQaQhjU22pnqW+TQTootThh7E
	2Njbt5v3ABbDYgway7XZp58JN5GWeFiXX9zMyMavAVvpdZiRiponbxuwpdP3qY1tj/oTSRDc4pv
	Tts5/K6TbKBqS8txx2Oq2n81NDyutThrliDAuXVACaRJd45g3cbzqm2C4hvdhrT7pWkfcvBJ4HO
	y92dMDRBZ5YNR1G3q1bOpg6GKH15wXCpWaiX4KlYIQ/Qrasaach5D4iQkDoiRdT20OWFNGKnQxt
	aCcto7WB72jHqzqEi/iUMmY117f08ld1rVhSJBgdf4nh/cjaCeYbxAyzrtMLK12K8E+rchbeaHs
	SzNO6BMrEh9GnWgIRyeZEX2otQjG9p9xK1NoZm2TcAvH3gxovOCOab2a5uawOzGSHhPvmo3buvA
	d19hCi+A==
X-Received: by 2002:a05:6a00:12d3:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-84826d6944fmr4511778b3a.41.1783423262286;
        Tue, 07 Jul 2026 04:21:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d3:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-84826d6944fmr4511737b3a.41.1783423261662;
        Tue, 07 Jul 2026 04:21:01 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b609b8sm5301243b3a.5.2026.07.07.04.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:21:01 -0700 (PDT)
Message-ID: <b1aac20f-0f12-4870-b224-eb6dea43df96@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:20:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
References: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
 <6de7ec43-5757-43f0-b8d8-34a692a36d1b@kernel.org>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <6de7ec43-5757-43f0-b8d8-34a692a36d1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4ce11f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TyUosIf-LwrC6SAVHe0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0-p6mQxu7mEnNa_cY5v6TtFV1P810rml
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfX9aolyBrWLBlX
 5LeRdAz5wA2JXnq9jIFY+JlywQ7yz1WY8E9FCoGkVxS5cuwAPiJmpzaO5pjXHq5XYvQ75jQgv1T
 Y1gWTYVanisbMlCsJZJertNbv/nWKNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfX1Txk4kQqMPiZ
 zOu3pe2vpXx0Q/N6BAVFiGfcwGUjnCp9m+d9dreIjykfZq0F1hUGSVmqiDW/38TLaUvvvQkp1SC
 eAJ11H9fnk84p7QJSUFDF12qhSl5c1wDu+OEL8h7jCXChy6nUR9itjNBLdw9DrzPtOuWZApl/2m
 J4SLehgx1BtvBZK0I//AfPJfyxwlXWz5uCjMOzdDDffN2KyIGqZHXNZ5xKnI7gBIKuM8i5+uc8T
 PEJsj9swZRs/D4SxarskZao5c5LdOtvKVKtET7mzzgoFQLXOSwE2x+8HVyiUlYDjvbGgiI+Guuh
 NmSofXZlzFWgnCXfixd4hG3n9JvzbpI9HCfZiItujOsaNqVRGGz9HdmUfeKPlvUcvBbaYSrN2Bp
 gnuVTl3tTYUcouWp9DOWAu8KA5+MflG2/1APfJ90lMk84FmxvaTqMd9ZPK1FssCxtf+nZuNnYrF
 tQ1Ryu4r/At3EmnbVkg==
X-Proofpoint-ORIG-GUID: 0-p6mQxu7mEnNa_cY5v6TtFV1P810rml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117299-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DB9571AF25


On 7/7/2026 3:23 PM, Srinivas Kandagatla wrote:
>
> On 7/7/26 7:17 AM, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Add explicit validation for remote_heap presence and size before sending
>> the memory to DSP, and fail early if the reserved-memory region is
>> missing or incomplete.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 119 +++++++++++++++++++++++------------------
>>   1 file changed, 66 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d86e79134c68..1ec37e6c68a2 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1344,15 +1346,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_init_create_static init;
>>   	struct fastrpc_invoke_args *args;
>>   	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>>   		u32 pageslen;
>>   	} inbuf;
>>   	u32 sc;
>> +	unsigned long flags;
>> +
>> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
>> +	    !cctx->remote_heap->size) {
> if remote heap is a mandatory for ADSP or SDSP then this should be
> enforced at binding level and even at driver probe level.

Agreed. In v10 I will:

   - Move the enforcement into fastrpc_rpmsg_probe(): if
     of_reserved_mem_region_to_resource() fails for an ADSP
     node, probe fails up-front instead of deferring the error to the
     user-space attach path.
   - Drop this runtime check in fastrpc_init_create_static_process()
     entirely, since the invariant is now established at probe time.

>
>> +		err = -ENOMEM;
>> +		dev_err(fl->sctx->dev,
>> +			"remote heap memory region is not added\n");
>> +		return err;
>> +	}
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>> @@ -1376,31 +1387,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	inbuf.client_id = fl->client_id;
>>   	inbuf.namelen = init.namelen;
>>   	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>   
>>   	fl->pd = USER_PD;
>>   
>> @@ -1412,8 +1398,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	/*
>> +	 * Audio PD is a static PD and retains the remote heap
>> +	 * information across daemon restarts. Therefore only
>> +	 * the first attach should provide heap information to
>> +	 * DSP. Subsequent attaches reuse the previously
>> +	 * initialized memory pool.
>> +	 */
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!cctx->audio_init_mem) {
>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>> +		pages[0].size = cctx->remote_heap->size;
>> +		cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1431,27 +1433,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   	return 0;
>>   err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> -	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -	fl->cctx->remote_heap = NULL;
>> -err_name:
>> +	cctx->audio_init_mem = false;
> You are ignoring my comments that I have provided in the last version.

Apologies for the delay in addressing this — you're right, the 
unconditional reset is buggy. The concrete failure mode is: 1. First 
invoke sends pages=(phys, size) and succeeds. DSP now owns the heap, 
audio_init_mem = true. 2. Second invoke sees the flag set, sends 
pages=(0, 0), and fails. Because no pages were added in this call, the 
DSP does not drop the region on its side. 3. Current code resets 
audio_init_mem to false unconditionally, so the third invoke re-sends 
(phys, size) and the same region gets registered with the DSP twice. 
Fixed in v10 by only clearing the flag when this invocation was the one 
that actually carried the heap information: err_invoke: if 
(pages[0].addr) cctx->audio_init_mem = false; That is: - first invoke 
failed -> pages[0].addr != 0 -> clear the flag, allow a retry to re-send 
the region. - later invoke failed with (0, 0) -> pages[0].addr == 0 -> 
leave the flag as-is, so we don't re-register the same region. Please 
let me know if you'd prefer a stronger scheme.

>
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2418,12 +2400,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>>   		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap =
>> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>> +				if (!data->remote_heap) {
>> +					err = -ENOMEM;
>> +					goto err_free_data;
>> +				}
>> +
>> +				data->remote_heap->dma_addr = res.start;
>> +				data->remote_heap->size = resource_size(&res);
>> +			}
>>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> @@ -2431,7 +2424,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   			if (err)
>>   				goto err_free_data;
>>   		}
>> -
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2490,6 +2482,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		misc_deregister(&data->secure_fdevice->miscdev);
>>   
>>   err_free_data:
>> +	kfree(data->remote_heap);
>>   	kfree(data);
>>   	return err;
>>   }
>> @@ -2512,6 +2505,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2529,8 +2523,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap && cctx->vmcount) {
>> +		u64 src_perms = 0;
>> +		struct qcom_scm_vmperm dst_perms;
>> +
>> +		for (u32 i = 0; i < cctx->vmcount; i++)
>> +			src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +					  cctx->remote_heap->size, &src_perms,
>> +					  &dst_perms, 1);
>> +		if (err)
>> +			dev_err(&rpdev->dev,
>> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	}
>> +
>> +	kfree(cctx->remote_heap);
>> +	cctx->remote_heap = NULL;
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   

