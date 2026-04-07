Return-Path: <linux-arm-msm+bounces-102152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2qp0DrLs1Gm3ywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:38:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0F3ADCFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02B80301725F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D483AE1B9;
	Tue,  7 Apr 2026 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEWboJXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvkdBxrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5653AE6F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561873; cv=none; b=Z1yHO0vH+tGiGVhQfIh/HzaD+TWcREyjYTsyW9tcYf1HU88lvTUEx7AiG2oDBL2VbCt/apEcX0k9V7l/K3F0NaykosNwNinSShJbg9Wsk9+MpjGzxT9I4XnBF9i9QvjILZugVtb2fQ/pCZ8L6Z62+ga7F0pJFp3ejTWSrP3AnrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561873; c=relaxed/simple;
	bh=AAUWU3T40RCermjXyQnc0ic39PRqAOSXpaPxtOW5EnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkNchwUjR3q/Rcm32k9mPmcgsDjueDxSRUBjjH3R8t5zbAg2/Y4xTh3bMBiPExH6qFTWOjQsL80RMx5PCFqEoq6vW4paIyJUmCjjPfVrVaU0YkMahY1ocRlvrQyH0EjqGzLvFlnQ6C59ch/XewkmQHivsO3TDu/It3xqHWbvV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEWboJXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvkdBxrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gd8t2580241
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=; b=WEWboJXZaglsNzZ+
	5DmB8RrFoRDVyoHh8FtQHBaJ7PHhfV1/CTHqUwGOmglV4gdxs6Y8JvxM6w2FxxPL
	8H6QpQ0yQvSThHXGUxO6xywHSUf/rwLliPLfnz8P2rYiRQDOfxMsVA0ovoJXr/xa
	rBth0jsgWSMCobJZmspEI5lWAEM5X/oYiomy0wTbAId/+dNPpUHLw4S+fSlxyAAU
	k/RmZTjId/15Fsi1kxiXwlV5eQGzoKhUaGVAihcRcba8Vv8aOS/p5wwZvbebj9dc
	PPfKV27lKdhew1jQSnRw862XxB1Dm0hr69awQ5XEyeHdG6pO4z0E6swgipb3TTkj
	HMLULw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2ha2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:37:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfd003bfe2so132265185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561871; x=1776166671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=;
        b=TvkdBxrA34+g7t4wTPunndN0JYYDY0wp7qumo24Dyc8vRpsKa+1LHeENgv8TpANCgg
         GjN7Me3+6WM8ZVxNpY3FZifaymAA4cB9oV7UMU5Xj7XzNgJZao3kcWOyx9yUvrfQBRyk
         GBW9ec2TsHi9FUNHXd2I+F47fWDDdIMxo+seu+O0Jcpcl4B0ugt9fsBfC5vkC5FA5mYE
         nl6gPmpeou95EzgF2sM2/dKTPwkb2kDk8Y2lqgZjKCxOiQT+sh9UsXGoddLaLP04WwFu
         WUUIwXnWsfIVhvh7eNxxoc6bIyCvkCOlbf/1i3e9GAIFfd0qrVbbClmUpzLw4Si61wQn
         Ma9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561871; x=1776166671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=;
        b=l99Kk3uBrx1aADpxT6OJn+Em7/yyUxji7ySfoZibmD+pQ6UuLyR3ld7BCdNjCiDCSd
         tSdBhXJXEnwNcDQSbg4/3eoeyfWH+js9guZc8At1U/D/xBXNnSIbtwC9emxUowFLp9iS
         DRcsE6QW8P63Giqare6G+DWiY7x1f8NB/QBR0P/nuK8vklTdKrKeU6viGTujgWRdqy4V
         kS4s8cWffUYbyL8AuXql3SQ1kV0TdU2QEPQomd7KsyP3xl+WQ6EHQRlvg2LIDHPrrUCF
         CZjycgwud8zwTKyujYAC8InnMym3ViLGZK75moi9/SMuuOkMEyhP/x0n3DALo/x022T1
         PUWg==
X-Gm-Message-State: AOJu0YxTpHwl0jUj9JtgOFVN/4WgPaDcqsuKiI422urwafgs/q1tI3pq
	WVTbXi1uBWCv27JS59PLCg7RG3wV4BKlTrrFr59HtnLqAK522PZsgtP045YsK0Wyn4AkdyzChk+
	+AwZ+zEirulVrHxnOn+1fmY8KxXtEjdLWxfw6Yq4dsKLKSS4mki0Nk9uoHr5eJP1umE8d
X-Gm-Gg: AeBDiesSOxS8JFG2hagGOza93OjHIL3OJqX1FZ2x2Ko00CHdjajHCDwuaPaSfsdxmBz
	4C/nYPZTMI2UQHBs8b9jNf8EI/Zf8OhP/jxiXe9tUL6lQwH49CLhqNGQ9otKafBlMHrcBoREwXf
	G8oZr2zB8hIDZBWUa1kPpfUXjn2vwtNGgj42HSquMAPxaYClSu6MXGsxS/sCxpzggIGoBY7P+Bc
	LpzF9ao8sN2MSIMI7NWEZRQ/6rFMYojNVDMbrTgVi/Wo8GcnCDEhEZB2K3pODEgLQSEHQgY95X6
	etiCHq6JYhV0CRxssReG1+iwUZPA3dCs+zNiODgCuH8V0T2CuJi3ygbymVBDhMEk2bkBj7lEHRa
	xrSDj4X1F0AJgarcyYlDgpnC/nTCIyqKCiLMlE1k6MRBv/SNKBYRgaziFB/Y37Yju5Gqoh93+ef
	ZgLcc=
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195756586d6.1.1775561870901;
        Tue, 07 Apr 2026 04:37:50 -0700 (PDT)
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195756216d6.1.1775561870430;
        Tue, 07 Apr 2026 04:37:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d02885esm547639566b.60.2026.04.07.04.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:37:49 -0700 (PDT)
Message-ID: <05bdf5ec-ec0a-4a47-b03a-39a89039e7ee@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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
 <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfXx5Hs4oWCUJIl
 IhS+mq0vxoIEBAYBZchD93BYCqylxSj8y3CbEVIn2p3u0HIAhBYuUmuBPxAyajYkjjjqn6dvjts
 iJssbLcR18mXaXOCI0ADVxYppLZ9mZNjR6lYyv6BF+g7TVNjNsIIWgkjjnrNJg/TdoUTxVotzGx
 nlsB1PBj+hjE/i8jYxF0CWt9K5WCzuUETsPAUe3MDedrQv9OyFQZaAR3FskXwwMuHEo/azUGj4M
 8llMe3AlGTZU1yGraY2Tri3yk7LPkOD849iW0djLYHamyHhZt3//hrc/lmkSI+xH9HhF2l7wN3G
 dw2ekM9QIEEKj/ZirSclUufFKA28HKivpB2b1Z6YQQdr+ptW4ELSyYd/s5ZrLz3Qo3Oo9lieXv5
 XWYUhpcL1dO6rYi7J4NT+GZIoi1hJXwAHukGY0fxYY9OFqNjVyoEoQbk2bDPDOdba7C22soTKPw
 2rXcehLaF4xgVeRzY4w==
X-Proofpoint-ORIG-GUID: oTSYF14r9zBj0eR7anBpgHMqDFaNCULN
X-Proofpoint-GUID: oTSYF14r9zBj0eR7anBpgHMqDFaNCULN
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4ec8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P3oJegwuExavWH9XlUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-102152-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EB0F3ADCFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:52 PM, Krishna Kurapati wrote:
> 
> 
> On 3/30/2026 2:48 PM, Konrad Dybcio wrote:
>> On 3/29/26 7:52 PM, Krishna Kurapati wrote:
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>> (rev. v8) and M31 eUSB2 PHY.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        usb: usb@a600000 {
>>> +            compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
>>> +            reg = <0x0 0x0a600000 0x0 0xfc100>;
>>
>> Following the woes on Hamoa, can the platform suspend and wake up
>> succesfully with the flattened DT node?
>>
> 
> There is a crash on resume when I tested but it comes up even without my changes:
> 
> [   65.263890] Call trace:
> [   65.266489]  kthreads_update_affinity+0x94/0x158 (P)
> [   65.271664]  kthreads_online_cpu+0x14/0x84
> [   65.275951]  cpuhp_invoke_callback+0xdc/0x1dc
> [   65.280514]  cpuhp_thread_fun+0x11c/0x168
> [   65.284717]  smpboot_thread_fn+0x1e4/0x24c
> [   65.289019]  kthread+0x104/0x124
> [   65.292411]  ret_from_fork+0x10/0x20
> [   65.296156] Code: f94002f7 eb1602ff 540003a0 f85f82e8 (b9402d09)
> [   65.302490] ---[ end trace 0000000000000000 ]---
> 
> Hence I believe my changes are not causing any crash.

Oh.. that's.. not good.. I was hoping someone tested that..

+Maria, Jingyi for awareness

Konrad

