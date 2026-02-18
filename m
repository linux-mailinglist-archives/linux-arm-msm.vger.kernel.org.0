Return-Path: <linux-arm-msm+bounces-93315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCGcJBMClmlHYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:16:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E2158A20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A57D4304F20C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4733346AC0;
	Wed, 18 Feb 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTLTC/7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcfuAgsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71E33C50A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438376; cv=none; b=n/A7I45GHD+OsYg3VATewzeQwl/8juW3uha3ZyoeUTURqWEUIB1brnecl0ESQi2slctHAFD0FXlB9e/wM+kEd9Uqd0+5lBEWL17sSFKGQAvyv1X9DolYtfDvRCCPNn2HjKnjWmmnOWr+DJBvdHnRNILKqppPox1HFdhFLi+I2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438376; c=relaxed/simple;
	bh=EGCHzAodjFoZy8zwIYBG26zhK2m8hl6yb7/jmJpKo5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBQqfgM8yKQUXrKX9wlCKE4lTF5Ru9albMZRar70ONxJZtnS8sQBKXXfg7QEeR8HGvsqrz31jnJVDLsQzWHBRiALDahphYenwY9Ca3jilM5REJrOXvkSBt83w+wrKnpq3JV8CE3tzNa/duc8EDpk5/XjeESjSRKI3Iq/jgUOAm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTLTC/7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcfuAgsp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBg2W4413442
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=; b=gTLTC/7fQg/PpnEg
	r4+FYne+wtNRoFdRMRBBrB8WmbJQXoxjckho7MPclKtEVybhzONWam5DnUD8tvo6
	oaeK9MtZd6//hb0M0GRm42Ew6gvIINmJbn0BaWIgtr+iUmY6gE/RwkfK9guh/WiB
	k0y2RcyZtBCaJ4oG4QIVqAM8F+zBZRrfaIx/6UtA5yNN5gW+3E+2lPqUPZyTmvO1
	G5jwPEenrFxgZrCOfFila1OG3wRsga0EertXx5Hr4Ai5wPhf/tDKEgA2Pi103lwF
	xqxWD6J23IEJonr4Jh59jde69iE+BBera4+oicBkR0FM8ZuEYEJjsVytEAku8L4v
	/+vqUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6tpde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:12:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so47720a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771438374; x=1772043174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=;
        b=VcfuAgspV7dauuXX0eUbQDF9Z9IpN3gpDqXDWjmzmkGgVP1BiVo5IhPE/twkEowLJX
         fzNUBi7oxaGCRx7opzmm+WSvgKQ53hjZzAiiUJMGcIjRH/LjYI7O7lRVMgk3KaGUUGJn
         jOtitTdS63timTR4MGQ2zklqKBRKp2D34zg9NvMaVvcaUfPa0WQWWnuR4nUNWVzC6AVL
         Xe+zuN9hlnJ1xGxLcx9u/v4NAgC0vltQO6qiqGmaT2e3xj7mOnUIR7J8yNheSY7JRr/o
         iDuNNSPuva1DA42+E/ZnFDuW12C4BSswvL3q1qixku9aIokOQqlVMrKxJ/N1OfPw5OkP
         JBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438374; x=1772043174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=;
        b=FxIc7IQG6gA/KkLKcvRVlRX360sSHe7lecMzHDCyn+jkaG0eGLSm5RcPcY1hcAo4hx
         KhxpTyztepagoMopjl9KTJnXtixuNwuEnkg3aeJkHJLfSkiGYajAPn/jM0XYJQ86s1Bd
         GzhMG1iedOWxaZohrXoYZuvuKdU/HXUPXNsSMiLDYYzY1Cm5p/u+Xr7xIQsGhhd1WnjO
         Ro5g2luSx3lFvRdGEPg31XBOhM7sCN8itMUrO3EzqwrDIXx+559QJGZ6cDoVdPzlGgu5
         2LCVBgskK2LnG9ui6WNdwiy/qjLUQliEexM/D/k0e26Gb7NsNUFE6L+LY+KqMbM88ZNB
         KmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxi8P03GZiXLbV58GfAaRRh/2ejxHikaN2kd5lwL8swZM+ZC8aMXqHIxSyeNE/8zb3XcmUGZ7ZHLzM9eSh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyie442ixfDGkjkFujxuVRAYbpNm4pxSfFHWF5mNTe8kHQF1YdQ
	Ma5+nUvRsqvKcr4tn/SGUxUcirdHdlz8vOgW6BnTBcztuL7xh9fFtbpFI0S0PlfI9fhTjli8+3A
	AboKRau+LXsDY888hraImLI05ZdKJECln92IfFtbbFttT1XZYW5SVqfP/VOnAw61ZrDlR
X-Gm-Gg: AZuq6aLIs9tyuP3A8DPBVLwJTvtd6KHFEvxEi3FEsOB9loZlKIVz9/gAW+fUFLlRoDb
	X63tmzSGn524T8X3nzbcYnYxjvJbEp9f7VOO3L+agVVfzEj5o+Wk/QjBjhBdmfpGalHGhPCg/eJ
	WcjS9a7Y4lUQ/0/RRhnnUkfizpSkSl/p4TkpMm3puG2Yo1tvr3MdG8U+YReza2BXh5EKNzHH5td
	5iW6xlwsHWlp6ynxG2FkitTOEZRFEm16YTYn787civcD2WtK0iHHtFVtl0fHZayjHvdv1ISien+
	gt5shDjqbNSkprHtdUKSfBwzKq/bKZnHf6OKbVvGFjSqoT7W0ymyhyPIta/AVk5DRQUiJCdsnHj
	C4fqpX9naAqmsKLevZO2mCRT4PpVGb8wLN2zaW47hvtL+urqrwvY=
X-Received: by 2002:a17:90b:1348:b0:341:c964:126c with SMTP id 98e67ed59e1d1-3589380276emr130944a91.34.1771438374193;
        Wed, 18 Feb 2026 10:12:54 -0800 (PST)
X-Received: by 2002:a17:90b:1348:b0:341:c964:126c with SMTP id 98e67ed59e1d1-3589380276emr130915a91.34.1771438373715;
        Wed, 18 Feb 2026 10:12:53 -0800 (PST)
Received: from [192.168.29.32] ([49.43.224.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35887899158sm1783264a91.5.2026.02.18.10.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:12:53 -0800 (PST)
Message-ID: <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:42:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
 <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=69960126 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=8ET0PZbB28S/dExBzKx22g==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=BC0RzjFpySZ26J9PUKwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SCDbXB1iufGavQsMJciWwpCUrcN5PZZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1NSBTYWx0ZWRfX6i/hrgA655w4
 PfbwaJYtSRv+SOg0KfncXPeRZOIbWlgoaDKwZXm7EZTPEYrR81NEQMbC8+WPQoLSAtIvEQpJ6as
 5zWJN7G1eomlTk2fcFGK4muW8Sbce4wkR5Y6Rluq2vFVQngAhXgFq3LtdpJPGj/ZavegwwWNZug
 DqfZZzcjksG6OTsaHKKZtCaiC0LD75kuogzG/2Ln6yoR3pVEQwRfwQy30CzhhwN5FyTpxbZvYcE
 VVsfz30rRLyd5Vx8Nuo8U0ocquNRkJSI7LnC1Ep9+KP0fGNDpekZrRsmLuJWUn0y8eXYsrLVWHC
 rPTGa+fHW26FHtWS+dhCXtaftEFu0T+XErkRE31nxSjdOxyrAV5gn2PPzyJcwywLi8YLaIxv0nF
 U3V0W5Q+NAQ7XrFPnNvB16eJS3ojXbIJSRi3zlnZsvG7RpZdSk/oBA+UEi4KjowX9WEj4KZnM9V
 u+v4kRgEXUqYP514TFw==
X-Proofpoint-ORIG-GUID: SCDbXB1iufGavQsMJciWwpCUrcN5PZZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93315-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D15E2158A20
X-Rspamd-Action: no action



On 17-02-2026 05:31 pm, Konrad Dybcio wrote:
> On 2/17/26 12:56 PM, Imran Shaik wrote:
>>
>>
>> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>> SM6350 SoC.
>>>>
>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>> far as I can tell.
>>>>
>>>> Though when stopping the camera stream, the following clock warning
>>>> appears in dmesg. But it does not interfere with any functionality,
>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>> while the clock is on, and 'off' while it's off.
>>>>
>>>> Any suggestion how to fix this, is appreciated.
>>>>
>>>> [ 5738.590980] ------------[ cut here ]------------
>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>
>>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>>> and keep checking the hw state)
>>>
>>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>>
>>
>> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
>>
>> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.
> 
> This is very useful, thanks for the insight!
> 
> Is any of these solutions specifically preferred from your side?
> 
> Konrad

 From clock controllers side we can use the BRANCH_HALT_SKIP as this 
covers both enable/disable scenarios. But this needs to be checked 
further from consumer driver side as well to handle the NoC voting 
properly.

Thanks,
Imran


