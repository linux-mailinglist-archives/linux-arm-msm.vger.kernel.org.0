Return-Path: <linux-arm-msm+bounces-90331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIdgCZVYc2nruwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:16:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40574E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C084304700C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C49335095;
	Fri, 23 Jan 2026 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPrZt5PR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9SQW14+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6F3090CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166765; cv=none; b=DpC0jDZ0I0KWJkU3hlKQYUCDwlSGqM936M3BkhGq7q3oCqhda/B/LFJHOq7NI5J3x6M7YyZq3yf/7HK03lVQ5gSjk57uhYKszsyr3T4mgJRA1ZeZWsCmL5lbHiFBfLTnSAs+mPSAwpRsF/LE4LoJwz3ITePjsh9C3+1AROdY1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166765; c=relaxed/simple;
	bh=/vQrAR8IIWYATC8t1GPOamnvHOLe0v2fmber6Pveos4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luPqiKXDWedz4xmxTP/WkumkoEJaLC5Pa+NcRaljTHAJr9WvtCseTWfIFARFBz6z5+WKhXaHCwghBjwPmWEFaKS+25ewTj0YY1l0GbdLZWbxVhKwMhvExeM9LnE2Q0EGfqF5Y0OfVe7q70yue36C+MQMFSnIL+5zRlLirHAHiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPrZt5PR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9SQW14+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6xhtD2916995
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIkkP09EIHDNC88Vrq4ePjY6fipJQ9pcI6Pl65HLPD4=; b=lPrZt5PRXs2D2S1L
	N7U5SKB4omvMYQZUYIKeaCNkn8cTvizPHnTzdWWKpTSnZ1wEsw9nidWVvtYPsaVU
	pqwLhF4Bbl+hrtXroUWb9naoquWV06i9H9vmMV4waNNUWavPC3JOMOQardxWoP5C
	xtA/6wy/yjOnK5BGyn6FTHqUV/mldhZncMijribiqfpWMg4VaDGsnsl/SCG7ZmxS
	3D552Fv8Eu1B/+WcV/bqQzlEa6QiEa93Esae4A2vxsco3S8pp+3Z+XebQMRDZbTV
	zocwUCV38rNU3RxUe6lNr/RvdDPFs6ZFtn4HTPflAx9oXOM9jV6usA4z0QVUCg/L
	LzLjpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1tdmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:12:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82181ef69ceso1035492b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769166762; x=1769771562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIkkP09EIHDNC88Vrq4ePjY6fipJQ9pcI6Pl65HLPD4=;
        b=U9SQW14+zOu9BPFKl3qg4grTR+Rw04DemsAdMmgJcFQJTTvt0G8B94hOV5wqR9AjE7
         JpzET0/pY0i6XL2oPiBfmEFYLiX8LiSa2Pbx1akBXVz592N85KMm+uwZNkqFH7ZSRlYH
         zJZdTgYr8iYHfn7R6mH3xrzw4/5omlBv+pfyMq4W8gRr8zb+yBO6DVtXFkJ7wqH2qZfX
         kxKbEwo7aBrN7oLj1rff51DAoOpScJ0eUjzgjJYiFOEVf3+92uTeD9TZMC1xXPwSPxTc
         uzePVPowHlXN+Fj+G5nVeOgPIUQPewx+HZz8ug8/cMl1G4FKNF6bolRL+osiY63bXa6z
         RSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769166762; x=1769771562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIkkP09EIHDNC88Vrq4ePjY6fipJQ9pcI6Pl65HLPD4=;
        b=ahzEaemQLD0AhgsX4lZf3o4PijeWR/7CU3xzCDlYv3JCX8uV59dAMyCvn2qpSmJaK2
         /EnO02k+aOPiVC9wl3hHFyZBp78SB4P1TGpvDI3suVbwif2DIUneagG4Xqsrd+/b1r1N
         b28RJU/blPhxPWlUTSKS3z3MYp8X/3BkrzItVv9yyaHhMy7kHahyrz+QySupRB+EP0Ll
         PJ0tDjpdimS4Kgy2VpZy/i8lLuHZrH+DxfFg3mbs0DzaqQLRMiwDO5AiIQnC/3RxDNVp
         X719qoSKNU4es9qt2fA1kvyU8aLH1Bvvtv2tIyF+XMvEcCxcPMoFwl1Lf0AC32QQYOIB
         rc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqM0z7TyRSianCthJHaqUZr1xLHqkvsKBvrhWOa0LaoH4hdXcRVKMXnaX2uxAwi9CLctIy3YZ44j6sEltO@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnGFcoh0JhTJ5owQVk7NIWuR9kyunam+z/jpL1wfr4rYthhgB
	9IVQYPn64QwVm3Vuh8DMkNWe778crAEvOurrVT7AKq/Q50c6Q9m2gswS1hewNBisACpJFsxNbOi
	oTuQH1ktROcWOp/hZMuSVNim0LvT7WIezgdIwW5FcKA6REPToGHh0SnaHc9+yiYuWt3IW
X-Gm-Gg: AZuq6aJtpa+sGPNEDomaDyPMaQS+rlWRPuYCCq+V2q4rMNpP90u//AaSV4EJs0KGrky
	BbC+z8TnIUoTJvobx6e9/pJjmrdemYg/oy1hUfXnnvb+gXyqC4K62O1mr8l7jYtUU/g9RXN4z/+
	GnfIXddzXC+1o6cnkDyWQgD2ay3vWxRK3IcfURQMVpmZtznYg2blvGiblL5VxJDu9JnmC9w4y3s
	tGV+CDTfzLJu/I8REeO1QJhtybjUhTxjDzElUHiAzG2Sg+pq/Fe5cmo8h+MnkLaTEHCrjmtcFU2
	JCiSMqbxyV83jjbiBfMX421pScmkBRxBScoTOWPREVATQR8DOJgwg2hdjrgQ+6DRmhJk5NbXvrV
	uPq/kBhjCWMHFFiDcoF6/pq3mghztWQmueO9ipns=
X-Received: by 2002:a05:6a00:138c:b0:821:a7b6:10a2 with SMTP id d2e1a72fcca58-82317ed4ab9mr2271441b3a.62.1769166761844;
        Fri, 23 Jan 2026 03:12:41 -0800 (PST)
X-Received: by 2002:a05:6a00:138c:b0:821:a7b6:10a2 with SMTP id d2e1a72fcca58-82317ed4ab9mr2271421b3a.62.1769166761337;
        Fri, 23 Jan 2026 03:12:41 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318648ff0sm1952126b3a.11.2026.01.23.03.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:12:40 -0800 (PST)
Message-ID: <82a6ba61-94a4-48bc-a012-d09152b32781@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <7da1727a-c1cd-466d-88fc-e140b2e7fe5d@kernel.org>
 <54bf72b6-6397-4655-9c30-680b1374400b@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <54bf72b6-6397-4655-9c30-680b1374400b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U-n8wyYc3TSHDUc9PbMKp_PSmo1C0n0j
X-Proofpoint-ORIG-GUID: U-n8wyYc3TSHDUc9PbMKp_PSmo1C0n0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5MSBTYWx0ZWRfX9tN64uogOjon
 86BsxyvrV5xF8hH1G+l1G6eAkFKyNyMZokjbXUvOlvfQYHcb143bPI1DX8miq5Zu8V0OCH66kiO
 opRZwL525XiMLKZ2qAlBUL4IRuGHBW5CXdhMK+oGmxSYKXImz5C8UJdAhhzIkEm+Ufz/GNhynZ9
 ztgtER7JTKxi6NfdzFt01qOen/9pZv/XjE/7dwkzSKJLEULk0JOAJqyWsFXpHB9ySojMrKMIEEt
 Kp5R8EQ/+N44TIpBN0uYzxNlOklk4Hb51QdV37x+8xRA+jd+3wAdFyV4M+4uS63x3AdJHurEccQ
 mBaVGHJyj9RTKLvdj7hWPtOcMC0qcs3k8ziiMoKqikQ4fQx9QCw8ng4gtThR6IH4oiIMrlz9epd
 2lUBnuPeZRjI4vdjMaNLXfEukGjlyWtEsZ0HB/+vZuHXxx1ZXZcFV6md4e+Ck50h2bWcIZKZCPl
 +Gtp6gizMgcOTPQGjwA==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=697357aa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MQ79kWv7XlEYy8UUk9gA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90331-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF40574E8E
X-Rspamd-Action: no action

Hi Krzysztof,

On 1/23/2026 4:27 PM, Krzysztof Kozlowski wrote:
> On 23/01/2026 09:58, Krzysztof Kozlowski wrote:
>>>  
>>>  	return 0;
>>> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>  	if (IS_ERR(engine->core_clk))
>>>  		return ERR_CAST(engine->core_clk);
>>>  
>>> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
>>> +	if (IS_ERR(engine->iface_clk))
>>> +		return ERR_CAST(engine->iface_clk);
>>
>> And here actual breakage of ALL in-tree and out-of-tree DTS.
>>
>> NAK.
>>
>> Please read internal guideline.
> 
> Internal docs are pretty scattered and messy so I failed to find this
> there, which is surprising because this was frequent feedback. Therefore
> please update Kernel Upstreaming internal page with following:
> 
> With few exceptions, it is not allowed to break the ABI, by making
> bindings or driver changes, where the existing or out of tree DTS would
> fail to boot. Updating in-tree DTS does not matter here, because DTS
> goes via different branch, thus driver branch would be always broken.
> This is explicitly documented in DT rules and explained also in
> maintainer-soc profile.
> 
> You need to either provide strong justification for ABI break or make
> the changes backwards compatible.
> 

Ack and understood. Let me write this in a way that makes it backward
compatible by using devm_clk_get_optional_enabled(). Like I explained, for
Linux distros where CONFIG_SCSI_UFS_QCOM is override set to 'y'. This
clock vote isn't really needed during probe.

In qcom_ice_suspend/resume(). I'll only prepare/un-prepare this clock
if it was found during probe.

Hope this sounds good from DT perspective.

> Best regards,
> Krzysztof

Thanks,
Harshal

