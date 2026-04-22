Return-Path: <linux-arm-msm+bounces-104079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO5pAxGs6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:08:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 636014451FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B201301F315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0C23CF05A;
	Wed, 22 Apr 2026 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER5b1eBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXKvqWyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C127FB05
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856075; cv=none; b=n6mvm3/Bix5JztBCmCoG0eXt6DQ08R9F8GO5DCjbJKJmiKm6ysojVzvDnqR/txA8BpQ1YBz0C8Y8HPCd4NaPuA3P1+dWSF2Cm92PwEHmOzEpcXmFpFOtMoU3CG6acBaanpgqUMGxRF3/55S1R/cdkPhvFiGRgnujroqqfpOBxhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856075; c=relaxed/simple;
	bh=GvkqJN1YthsBywTxjCiEzmsztbM6hId164sRjCpat0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5pv5oZGAw8aC5ow47sNTi1OneWdjjKwGHEV2niAPLnQaRW1Kk+SgfGXZw3g5qsuf8yIFIf3s9POPGHeISvwyw+fZ5P0kNRYKKyL9viVBYe5I1FwEjl8S0iCA1qqgeqI5A6bzJp72ogYXIAoW9ZPFpZ+LaUFbDl1nRRkmbuA7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER5b1eBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXKvqWyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96En9664102
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=; b=ER5b1eBqYqMigAei
	yiiRlw0lYkLzdbUTF7XtVd4aXOEQgLyUXxeSCikXKOaNp8aBFJ1mD9nQa8yVUhfg
	Fg85nGccoPnHpH/KpflnfUzCGWmBxirvwwa0CMOR8Q6AMQ2HWP/KnUPC10UGIMHJ
	A04Bpbniaipb8OaMae3yhkzzPVcIKJWvlUoEDYPWbdj3aKz1erlW6nCe+QDT6liB
	W5x1rJvIArCKCSXLUguIoYLXYxNiXDC67xShNaxbxn0Z3W8y3jNKy10S65/shx5y
	+rthp20A815ccwt2SLGqiTQfRpfXpcYaiisZoA3y8fl498qS9zyZcFEAWIDGc0tr
	cJLHSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgresx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:07:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5d7f4b63so9880871cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856070; x=1777460870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=;
        b=iXKvqWyVDtFBPn0NpTn4wbwB8zEVrWY0uTKwumCGMpZ67pxAfcTB1SGv54Mtto+6x6
         hXMKSlCrVD62weRPY+uqPgIQzq3O0UGfFcSkJCNdaTyMgqFSudvtKbrGfvpZgRUeXGcz
         eXqtRZBS45wrrxCJZ3PovTdFxetXPSsA3PFmpcWvX4/lW1Qib8M6j7bkpb7mB+eCZJNi
         m3Hp1baD/voFEWPAICANw8Rs3AEH3mvXsk39qgjnkWwj+WiJsmxa+jMTOwlmhb/bh+dG
         Occ7B4X8SleYiroNOMGRNqWiKVZX2CV3zew5L6A54Xu330LkxqTcpkxHh5rDnqHgEJdN
         /sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856070; x=1777460870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=;
        b=QxZDN5Fa1pYAyD1bbW7T+hvDutBk84sP/d+LZECL0J/ChK9jMOcSP/L1b6T78aUvRS
         aKqOK09tC6EPt4MTUw/bRBBdv/ycyo8/CpeemEaKnvtD6hcm6VipPCVdpou8Lu07/nQL
         sSKQFwvLR4m1L+2wSBQ1UEuRoMOKWeY+wONn7U06XJD+VuxrW0KVzs3+xiHlyUChlth4
         wh8AyMeN8ZNO1ovuH1mIOw9JSXkazyrv7YGT42JnjwwWHQNUN3ymrM4paRnbNNyuy6oL
         LAfsfD5uI7lL88Fhk97Jflu82n+SpieZsDnrx98+87L/Q3TgDuVMZk8DACi3JAJrPZAy
         Nksw==
X-Forwarded-Encrypted: i=1; AFNElJ+V3x4DaZ235fAOroPGJ6fuw2JjUsnSiUo7YwUc/O2i9NWiGyjc2f6XknpVHorcVtJra+Y8qeShU2lcuu1D@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCl+yhrbbBxId2z+Q9RQtESkJSoKf4RqXztEVrO0qFN3SE11p
	leXehrbsWVw27mMXCyug8R6ISlL4xA4WFmUuShBAWbul8OSd4puIo6pmeCh2b1TcoRlIaB6auiF
	jyANFM/tyHykXwqVhVkLUHbdSUjjSeu6+j+PaheHkUvJ1Q+/XJjeXswlohnVhVRoYOJNG
X-Gm-Gg: AeBDievey8gXES+Du0vnfOxXL7PW53tx0QjdT9Ppp4j+RCs8kCjQTZ47nawbgZ1V+lm
	KgKIUXrf/IM4BA540D6mmjf9Lnkj/xPgQFiqddMYxCR+RR5EjBOd/jTYoZPVFmQjlhyiqOq82hp
	Fkzgvda+tGpEL9WsVYNVd/d3XrfI41Rm6FqWjgpwbX//IBcb2+oOk2chLKrDREcUW/l+HrVd7Hr
	5lxcQshUmIcy1XnByhxxehrF7/xmixIYrhUzFh5MViX2hbNRnpDXVWsl7BP3f+abK1VYSlgl7sb
	Yo0GlPcQypkXhg+U7QYww+5YSPkX7ZrEB0bGzd1C3PYCu1IrTsxbrQbVclwklACdTvYLGc0gMfL
	p1yCDh1jUqCaO3V6FOZbj/Vd2ld2UlJXx8f/Vd/o0+t9PNWZxVxYrrPEDhaMlqYVr0kOKNV44m7
	H0mRWnc1XpjrtUZQ==
X-Received: by 2002:a05:622a:1307:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50e36e9bf25mr214528441cf.8.1776856070295;
        Wed, 22 Apr 2026 04:07:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50e36e9bf25mr214528161cf.8.1776856069898;
        Wed, 22 Apr 2026 04:07:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm533244966b.3.2026.04.22.04.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:07:48 -0700 (PDT)
Message-ID: <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:07:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
 <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KA56Nf8W8vogCuFCe8TMr5FXdY_mdKqj
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8ac07 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=go9SmOXN6WSQs1UN5q4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KA56Nf8W8vogCuFCe8TMr5FXdY_mdKqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX1xvPFM2ei68N
 1/pTxurW72Pvp+jjqJlFn1o0yJZTtNtRq14F0uAq2saCAMGqtlofs8gbNsnephzLTOE6HkIKfyT
 lcbRkKbDdiiy6his/F0HhsPDIkTx1A1lTm7UJTDXcpHzKrqGjLHSh+6NB177rdHFwvlNjBbWfrp
 ptf+Z7ug8l7gFQRAV7V/dBkHxqR5bkTt5BbCMuHC13ERSeHHs+ikxVbYIbECPS4kJ2jC1T7J+NZ
 jz+rPCHNxsKpVqsq8pauROAu6AwPnXIayjdPhoPctzxf24AGbvkMwTu5hPLJCmghFCb8HKTFocP
 RaYJcaK77HCC4brORQAUJu5fKzIUi4JunbFWkWVwREyKZEeoN+R3ik3bL+Wq1ipE5B1TY1eAuYQ
 WvY/ohXCkg6FdeaC2DNK1XtMHghiDzpfpkchWhR3chOTJSuVe58xqJ6zSsAfIXm8UO/6qDwDYfN
 dkX2htQCbCR3n9EZrtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104079-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 636014451FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:47 AM, Ananthu C V wrote:
> Hi Konrad,
> 
> On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
>> On 3/27/26 11:24 AM, Ananthu C V wrote:
>>> Add an IMEM on glymur which falls back to mmio-sram and define the
>>> PIL relocation info region as its child, for post mortem tools to
>>> locate the loaded remoteprocs.
>>>
>>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index 4886e87ebd49..21ae05f0ee17 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -6457,6 +6457,22 @@ rx-pins {
>>>  			};
>>>  		};
>>>  
>>> +		sram@14680000 {
>>> +			compatible = "qcom,glymur-imem", "mmio-sram";
>>> +			reg = <0x0 0x14680000 0x0 0x1000>;
>>> +			ranges = <0 0 0x14680000 0x1000>;
>>
>> size=0x2c_000
> 
> on glymur the imem region is a 4kb region of size 0x1000.

No.. that's the "shared" slice of it

Konrad

