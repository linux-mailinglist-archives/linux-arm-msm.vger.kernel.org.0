Return-Path: <linux-arm-msm+bounces-114585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLprBgzePWou7QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 04:03:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E906C9A47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 04:03:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XymeawGh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RSL3CRgf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114585-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114585-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 156CD303F055
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 02:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5744425F984;
	Fri, 26 Jun 2026 02:03:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDA870809
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 02:03:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439433; cv=none; b=EHmjwtLYrPt9FfJYw8vn2gTeTtXrmrdvwemsh38xuJmdOz8xHWQ+p3kJT9QOjTNuIc2zhPzTEukWMzVYxksdbYekNt7LbcLTXeAmMMxLUjz4Ot0DKHPLTscBZpeUSNIbex04beTtzs2ryzlFfU4WlLSivPAm13CQBAahJ2MQsiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439433; c=relaxed/simple;
	bh=RVsfiJ/p1QOSvJO42EhNCyE++k3dWTEWvNXh7/stvMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeYLerqCoVNT2s0ykoF65kO4jrVo1Ofd9VgwTtz1kD5NkGOJF60jeIaDTDp2NbdkEBfPjcXl3xBGVyx7EUrR0dwjRmHN67icDsn3NWAAZEjISz06cNonou2nMH55r/BjhRMARbAvrnhZY9B7G+NY4pwCaqiauRkttXtEdxw+xG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XymeawGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSL3CRgf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PMZTLN3080558
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 02:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=; b=XymeawGhpcsDSqSg
	l/SiQg5HzhqXg+aGThmSRpAqJ38b3ZwY5lSRI/Fi/D9F9VakXrzsmiZzdkiUaNS9
	LvTNgHOxwdYRvZuUnii/m4sV/F8n7I88g2nEZjIfbyWQTJSFpKet28i5lcehlBJ2
	yODzKN4Mx/2UfbdNBcRgqhs9g/pFD5ygR1SdQ+caOmB2IT5R5NDSm+KA27eylngB
	Ux9kBQ9Pi4ke11Hut1RUGC2MiJz6Itll5q5lbLEFLT0qzd9HWyUTt+tWMQwjG3uG
	xLEWQVdk3Ald1BeC0Q1EhEF4HSUUC9NYRzD6mR3C9M8SYndHmxSdrc4IRBmc7Iq+
	CTp6UA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv48wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 02:03:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8bad49b171so260684a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782439430; x=1783044230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=RSL3CRgfNzqNhgn1opLvLvPPZTpQcPNcWxss6UQcBoE3XJrY6yb5aMUTHfrizmVwKo
         +p9SJU0fHDYD2y6yQbCwAC1t9GvDnrjnZz3oJiCD0H29M77DlFMFrm4zpANo5YKAUJ1N
         E5QvkbdaEjlOxxOtoBSE5Sf+KBKdoKwDkA9J5efyYh2GtSlc5fGoDoj6WyRwj5hIVVNA
         Csuiaa8A4fEuVWt9qEbP0QYYrV3SuxkYZPCr/I6BN9dzWe7n4moSZG4SmnNxiES/8zsq
         3wbu5nMaywILNOSyrme5O6LhEZLRHL5Io+3yfGG6Rw1sHdCVYnvF3x3rH91V+QnbOzEg
         LLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782439430; x=1783044230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=qRhYCpy8K5sgFjb5k5CrxM9tChFpcuIIu4fBFDTS5GcVhqwFVoEAMUM/pWethoFcMp
         1wdV80eVKNhetU2d+vze8nzcL8BhxH8Eu4EiZELgmZwDSunUmaP2jdGV+YzMjEvoGiGM
         1mJvf/Kx5YQRdkCFYI8zYqAeo+dbO8VRN5V6yUncuYSN6wLrru5u+EOJLvLM9jhf3L++
         YbH/pcw/zob07/5tv3iL6tUtLY8iWlHBx8jFj1GOXUrQKgIk3m2MQldw2zeiie4dseki
         Qrb4jWxVA131qZQQh71MAgpnIDX8tyY+jnjw7OXp+FSZl6tP1K62YJ3dv3mQx63oJVvM
         ig4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+QDoGlnqLu7GStUliA5VVoJBOVOShCDSSvw72gCxXcw3h/MxkqeShOCKMGnEkNOAAM4diRmI/2NsL10/aV@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmrRxgZO1kdWDnwO1Y0TvX1LZJSmWEliG9gf+UuVABp2/HGFP
	QzHwnqqLEaTZ0gadDIxTWB/7Zs2qbBqE/jN2GLSg9ktbQgSRezNceO8wYNF/V0b0H638eQYatUQ
	DhpPWmzuJaqaHqV5nok6UFkYC+6lbNUq8FYpFlP2jemOnbFbz8kQaofYMYJ3/TVK0kn/7
X-Gm-Gg: AfdE7ckOdU92Y0jZ+6Db83AAN0jt+mzn0eOoV3lzw1cjXAjUrHhSBpIL12ATQQYikXW
	tRQv3cgxCQPf/0RwoGD0rupDjai/MEpxsqALCulz2tP4nm9rekg29L6zipxCmZWw78GwiL/d5Gd
	j2UfZFZCB1Wikh0yzmTac9USiJsInjKPMtlqHcbvuXezWiX34erTwhzKYS4PW+lThe9RlRAdGSo
	/slSQ6dI8T5qyrj74YF8i9h1gsamkJ7dEJ99igyW/0fKaVZBHIqg+U452QrxxNzqSdJVswKyy+r
	a+fZVw36lL5G+OF0wzXY8rKgWUxmaz+XuFHxDSBkbQT4bMA4rz/as2PdwqG3fxl9aK2WkNdgIz1
	9nr0tG2ukyaGC3dCzjBax8yvgzNO5jNY=
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588781637.25.1782439430521;
        Thu, 25 Jun 2026 19:03:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588728637.25.1782439429938;
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm2535896a12.31.2026.06.25.19.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Message-ID: <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 10:03:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625085643.GD575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3dde07 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bmbh54CRVxo00WvuETkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfXzmmz7VRscG5S
 Jrx+lD9wtpG/e1vq9uUlBIaQsa4FKNPvL+ML5dtKi2XpwobnHlFR8kZ8b2yYSLbvRrmdL0Go2Wk
 ZZpyH4Ye6UdDKQymwCzhPB9wTT2JquA=
X-Proofpoint-ORIG-GUID: yhjrgDlas34K5tZopwfymFBnZpNhXvfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfXzwAC38E13RCP
 ZkUpQrqIkF9tlh7o4CwE31xV8T6hvlN46hzT91TOxYS5LjKYGar2NWEgZiIz5P2AVlQQM0md+l8
 XFMpamTVa6qbNuCacdhksLRQRAz4stZkg8RTh/8g7HsZa94WYbP8TWsp0kBrMWbazVBwTCtvX+F
 1rYxd8n8d22gk9Ya4o6rYE182KQciZ7GkmmhUofeKf5ILFY+quIaNYg6I+PscAi2la9V2jOh5jJ
 vpi+ZzhUuP0XTAiOKor0Vb/Ck3tLjCWuBuvnzHn99QBjmoBwqhXUQZVzBnajf7iIPtEYO+SJBEz
 SgYuL7zaH/0iR8EEvfwy71557p5lJGrNf4N2fSSHVZ4YaCeoUvGD4vHpVZYDTrQdcAkWh7FdepH
 ADa2KB+0nMVvPbSEnzT+0LYkllrmz9ankNYGNQkraH1wHdeTBs+9atPagBvAFGCeq2J3x2NTG8L
 wuCsa+TQVM6TXhzgJkA==
X-Proofpoint-GUID: yhjrgDlas34K5tZopwfymFBnZpNhXvfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260014
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114585-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:suzuki.poulose@arm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60E906C9A47



On 6/25/2026 4:56 PM, Leo Yan wrote:
> On Thu, Jun 25, 2026 at 09:01:18AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>>>> and the issue can be fixed with this way.
>>>
>>> I think so.
>>
>> Hi Suzuki/Leo
>>
>> Which solution do you prefer to address the issue?
> 
> I will leave this to Suzuki.
> 
>> The interconnect traceNoC platform driver is intended for the itnoc device,
>> implying that no TPDM devices are connected to it. So, if I modify it to
>> allocate an ATID, I think it would be better to rename the “itnoc” node
>> accordingly? Or it's ok to leave it as-is?
>>
>> BTW, the traceNoC device definitely is an AMBA device with CID/PID
>> registers.
> 
> Just to share a bit thoughts on the driver's design.
> 
> I think it would be better to keep the probe function generic. The AMBA
> probe should not be specific to TraceNoC, and the platform probe should
> not be only dedicated to the interconnect TraceNoC. The probe function
> should simply handle a device that appears on either the AMBA bus or the
> platform bus.
> 
> So the question is: if allocat an ATID for all traceNoC devices, do you
> still need to distinguish TraceNoC types? If no, then the code can be
> unified.
> 

Hi Leo,

To be honest, I would prefer not to modify the interconnect platform 
driver. On some Qualcomm platforms, multiple itnoc devices reside within 
small blocks(one or more than one for each block) and are connected to a 
dummy source. In such cases, two ATIDs are allocated for a path (the 
dummy source and the itnoc), which is inefficient. This is why the itnoc 
platform driver created to avoid this waste.

The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which 
connected to multiple source and link devices, aggregating data from all 
source devices into a single output path.

This device is implemented as an AMBA device but lacks proper hardware 
configuration. As a result, it must be handled in the driver as a 
workaround, which unfortunately breaks the original design intent.

Thanks,
Jie

> Thanks,
> Leo


