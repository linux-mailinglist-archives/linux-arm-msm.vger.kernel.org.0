Return-Path: <linux-arm-msm+bounces-101991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEO5Ou3y02lxoQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:52:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A633A5EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6785E3009E2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 17:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770033932F8;
	Mon,  6 Apr 2026 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izQVTWum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7idTJ0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4839183A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497950; cv=none; b=QJvnkJevyTeucLCl9knH9YTPuPNbfWKDJFiM3SDenk5E5R88vtQKQ3Hn0dop7pwj7XFBhz5BDPJP7XMhlra6r8nqh7Eb7lz2psQPPslXr/9URuo6+EXW9l6Ya1GADLMLYNyo1qEJbCWVdizHIVVyVmmqK9KsejAvpgp5Q72+x0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497950; c=relaxed/simple;
	bh=hIbqKg4yrPEGCshx9GZ61exuGLbFwyRCpftV9f4Z0ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAUVwSlhi/wtQqQwXRCjVttqeFmA38LZNlTZvggqNskkZPbR4I6TJ3EZNoZb+otAfGc+qVQpxUTTNJYrJpDKIMpex4wUEpfSFwODMcp5b+bahzK72AwX9dXkU0j02kRqIbArIPQ5I4/OLC1aP3xkXN9a2mDSCj8TXSzyXnzR7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izQVTWum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7idTJ0I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636EwBYV1719181
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 17:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=; b=izQVTWumwzqY2DvQ
	Iux0qVUSdTukZHbg+lZITMclkWZ6/+iHuInY2TEN/u1ypcT0t157sZI6vtMRVr1o
	T0u6cyYAegROmruIrL8nauqTbmEDQFmxIxCBzwcdcgyDUPqpRmb6nQ916D2wJwSl
	PgPoN87HIMY+AIToeEx6m8NiA820WRrfnd/wHFppBEg3xdzaNRS2mlRSiU2d+Stk
	KR2DIBLAF716ab281fTl+51f32Ao8plEljjxkuKMPFq1syhKVLDEFCv2yXYbAHea
	mi1r/1cqMfQF25PxuJxmrHg+8K7XUMi77VclvDdHA5lDo9S6RcBAxMwsbpeGure4
	mjp6vw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf2arkp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 17:52:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c895e7de52so17360911eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497948; x=1776102748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=;
        b=S7idTJ0IrYYqMODCP40ypIc1zLgC6xybuhN1M7Ul5VnMr3bXN2o3I0u04QlZOJ7xuj
         S330VQhXE6ih/yoDPkG1iEn6tIlY/2xwwYG8MFrQgX7aMJlYAeHyDzXzn05JOB1/jllv
         t5X9xfDF9rndA+xjD2071S+BVQWBD4SQClxew+fVwepKbrUGA/QNImWBWVME/m3Rc+V5
         +w1jFhP+DyrSyTsHb3F0fntK9+w57tWQ6ELohOKW6PVKK2t4KbWgHISfE2TaeXTrYbNX
         /sdQhoyC4WUnHTLx4pqgdFe4abL8ZWH91jFkTSyV93TQyBFrUOJGsoCuTA+bFGNsZhXk
         Q5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497948; x=1776102748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=;
        b=WR4lUH/VE10KtU0Ocr3Z/f+YamdnKZQPFGBADtzp4jaR7w3bcQz41tN9ffcLD9QNF6
         OMmv4so+FmE7nU6wm18/fn8ANRmTjTfH5tAducRIxjKpBbiUF9TmFQWUIDYr7NlRD/l8
         Vav34hWuZ7FAygbnxVZX93DvMfqAeEGqTJXSuW0NvxdYSsOcg23LHu7et8+ccsOGhHbB
         Kj3yIcV+dpNh/lL49DiuMGCZ1PbhtlGjyzHJCt86ozn3HrdEYlRTTESwXNPUTKBIF4xR
         hh6CeWM3oWUkQ40oOJuV/NgYFnCPoVQKscjNde0whwRykWGCWOiokLzwmJqrHleC1L61
         ULwQ==
X-Gm-Message-State: AOJu0Yz1KAEZAEd4lkt0tyR5hNi26M/KgGP2ypCBjt7KEc2XisFHLXXC
	F+2uwi/reJhKAi+pPN5EvqSrfvY8Visy2tJHIcbo+QfJ/+By5gZlYAKtGknWjVEG3i8gt0VmMAD
	/LY997euoeJjo0fgwjAWj+Bgk2NEbqqdmcNpDBLPYCwChm/srcctMJo0ClJjd8+s0xigb
X-Gm-Gg: AeBDievtincm6sHoSBJ2SIUyoh7u4wy4kX3jXwmsoCxTci9dD7snw8I3eVnJSRunAhk
	WmtyorALPOn5bfoIJGfu8+MpN96+14etp3iBbbo0uOAk2IaTiqiw+JsZ5VCRsy51pnidwtxx6wL
	yzfLJUXJkUV4ooqEi2cRc/RtEtbypofNK6DzxtrxEi+AMlFRLHUjFUJaPiFZ8duBdzOc2LLFgbi
	cCygWN0P/7YZjCev+0BFIO1MlcZc4GNvAU/jgWPldQJG89hASmBSeNhqZMlx4nGg3FaFaRueyw3
	EH15MKz9pabiAz6UHKG8v8+YGKNUS7PeEZXi5CK6EXm/XmApHB9WlNO0B9kR8oGkhHSC0Ak5EGL
	S53mkQGz41SIgfyHviUmzWFqvWGvt6vxKF3PbR5AERpyhhC+cQkstw9c7
X-Received: by 2002:a05:7301:1003:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2cbf9afd5e5mr7343504eec.5.1775497947609;
        Mon, 06 Apr 2026 10:52:27 -0700 (PDT)
X-Received: by 2002:a05:7301:1003:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2cbf9afd5e5mr7343483eec.5.1775497947080;
        Mon, 06 Apr 2026 10:52:27 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.246.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d16d115c00sm33970eec.12.2026.04.06.10.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 10:52:25 -0700 (PDT)
Message-ID: <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 23:22:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
 <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KVcBV8ca32mIH39sfrrFOSSHPjg1b08I
X-Authority-Analysis: v=2.4 cv=A5Nh/qWG c=1 sm=1 tr=0 ts=69d3f2dc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Prc8aj0I33YhsXri9eX8YQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mCk1IhpG3LsN4YOb_UgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NSBTYWx0ZWRfX0C6UGEmSx/p0
 aEHmHHKLErj0VpvpJsr/61tlQ36MpRU12sEcnN6mYYLtdk8FoNAUhq4C49o0cmU2GhEjmXWvCek
 ok72YreGktrpHyNuLsZ5OYXGlwVfKJV6qCs/UpZr4yBgY/fbpCX8mb4WzfZAFZ4cEdiDvVEJWoE
 4RotdgrQtTmTtefshLp/1obgRvJzszuQwSj+pLgeSiCbyqW0Zo0i8JuHMll4mQxtoBK+d6hDd9f
 Nd2w+teEhLpQjiuaPux23TlSsiTQR6pAh0oRU44eBtjWyK831cqfhITdhSbVu3QxlKDyB5vQer6
 zlJCyhXqL4BDrteZZESn48QpEzal69ujEV7X5DCR14RzduJjNFMQHuUikyd/ewihiDYnZmEKQeH
 OOWb8klP87l1zK58eXpuc4kBIXVNZRRFzK+Xvq6MF4NrLMGyeoP51SkMY7rYAEgERM0eUenF6eP
 TCCs/VqcVw9iJxxKsiw==
X-Proofpoint-ORIG-GUID: KVcBV8ca32mIH39sfrrFOSSHPjg1b08I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060175
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101991-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01A633A5EC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 2:48 PM, Konrad Dybcio wrote:
> On 3/29/26 7:52 PM, Krishna Kurapati wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>> (rev. v8) and M31 eUSB2 PHY.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		usb: usb@a600000 {
>> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
>> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> 
> Following the woes on Hamoa, can the platform suspend and wake up
> succesfully with the flattened DT node?
> 

There is a crash on resume when I tested but it comes up even without my 
changes:

[   65.263890] Call trace:
[   65.266489]  kthreads_update_affinity+0x94/0x158 (P)
[   65.271664]  kthreads_online_cpu+0x14/0x84
[   65.275951]  cpuhp_invoke_callback+0xdc/0x1dc
[   65.280514]  cpuhp_thread_fun+0x11c/0x168
[   65.284717]  smpboot_thread_fn+0x1e4/0x24c
[   65.289019]  kthread+0x104/0x124
[   65.292411]  ret_from_fork+0x10/0x20
[   65.296156] Code: f94002f7 eb1602ff 540003a0 f85f82e8 (b9402d09)
[   65.302490] ---[ end trace 0000000000000000 ]---

Hence I believe my changes are not causing any crash.

Regards,
Krishna,

