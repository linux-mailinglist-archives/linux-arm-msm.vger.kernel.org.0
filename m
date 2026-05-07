Return-Path: <linux-arm-msm+bounces-106344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH4gOg16/GkQQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:39:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1784E797F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6EC6301A2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE693ED5BD;
	Thu,  7 May 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp96ixLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRTVtsf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1B3F0743
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153863; cv=none; b=fP62+mqbRuBy80NdBcVCphVANhqgaFK02ic3/hEFc6LWuplR5/UcUGNqYB88uZxlDUQ7FeQENQBKf7G8dWz3J0swonrs/jONv/N0li+hUdP6yezWXLM6ti6PMSqR/E9/v1zJ9QL1x3zUwk7DMj5t5O5V4Y2RZwgYOqPavG504w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153863; c=relaxed/simple;
	bh=3gg+UCEeVjs3UJN89XpJE+k4ALwbAA0e4Q3aE7tCYsk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MxHqmkaE+3PBHyHDUqn5cAhBs4NZGff6qu33jKOnRQiRAZoPuTmyVHJM4ZAxRjB6YeKIOpdHtJdoDmrFlh2CnpPhYEG9KupvXbZp0wELv3SURuTIpgaC0++cNR9jVrk2V0HZMXh8K44JOt3rBoJRRWSIjCn7pEQ/HcDLoRgI0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp96ixLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRTVtsf1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479TXII258775
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=; b=Zp96ixLFcPDZ8D4w
	ZUhgkINhacK9H8tgGL5YGvpe4aEFevF7MT87dGI3ECo84BJk55K6+X3LOj1CgdYT
	FQRAOg4wkDPiDotJfoQwz0DTD8DtsxpWsLBtV+1kzHeFI9Pp6htdJ5rnwuPeiILP
	lrVPpJmpg1+IfqBUcwdTHY9d4oihyMp/qg1fzlSzAhJMr486JXFtcOfb8UwWlmRn
	vqDNGbYnvwRZy+wgDUWBpb+rFdwoVFgI5wI8onJ7u0rJzJmi8WJ5J937Wg8IGmE7
	C5f4fHKQ81oykMCgY9is1OyCeFzQ94GRiQmd4EPghAZvCgezouqRnu0NFTS90KYi
	AFCnWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8sxg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:37:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso506808b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153861; x=1778758661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=;
        b=RRTVtsf1a3JgcywwHSDtV25K7SohUQbWlPmMcJux2ERVtTJI/neQTbRzOTV60gSz4O
         DY7rNEIoYkNVAjt/KSDqCzQwXSZORuMi789KPrjBr/S5wKf5gx+MYIykcsn2Y1adbtnr
         ZJ44iaMo7qES1xt//zvAcYmct14ig0iLmPbiZ9u1uyTkfxwEvPdISwP162WL2VLjPDcJ
         tHZ6/kX8D6z8aLHQRREoVQA8kbWoAgF7TEdffSXZTkXaKLfCL0KEDzW9JtAg8r3dZTqM
         QYzFxw3Sw9yKMOclC2JHSRjVmPtrsZsjZOGa1zKy3birIpMxZrEYP9GgqbI6syzUVS0T
         dzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153861; x=1778758661;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JnRlnTWGXxyb1HgHFAalzj22t+riOMBzLLstI6x+Uo=;
        b=FDoZz8HSM957RFefBA7+Fsf7d0got88XQeYcaBowKR/8dP9qp2yifM5KjqAB9hn4EX
         Gx8T+8hNo8KUw+vH/WDRB6qOYdf3eR/1e8rMism+zHqi5FJDLmV1GgxI60erSy0t2kRX
         yiN57HdjAjh66d2bjUHbEViz5+PWr+bsvL/5kAEjviH4oKZ1kGB2pU+hr8Eg1BIcCwCi
         2sJX4ndrfR6hoalYknbW2OoY3CK8shGkIa8kKSdrCBogWiSGPJVFWYVin86GmA7Ls7V/
         V617/tS3lsoDJI//GdCx/EKsWUrTlMWuRz/i/MXx1jN+UTkXkXSMV3XqrCONQtLLeU/c
         akGw==
X-Forwarded-Encrypted: i=1; AFNElJ/fbV8PIAvLuVeFjXWGd0fdxSWc5U1CtUYVO1xAJc0PObYq6NphMJi0jb8qZhao3Y450h3BhP0DtXzl/1K1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Llf4cbUh+SRHarLg/cS0YksrWTCXG646XA7ViB/7vnoV3t0R
	kQkrbAOHDJChAvSPNZr9bR/Ce3UEne/tZqMIEuc+OaUQ5sdgxbZ8NjSOqVW/RZe9t8Kfh7+hU+a
	ok8lI36Dk08tOKURZgHKMk3Ykf0mmwD7hmQThKLvSU0znNMDI5sdIwGnZQw4O3KAEXryZ
X-Gm-Gg: AeBDievzAslToafsncA8wlWP7JmVerWoG1TwEz/56MB8Mjv0yKQLCbMZ9t2fS7au0vi
	4Jf2Mv4DmFFVKilGcqNOyF9gKTndUBCmXKcAun9cGBlFYChKFh15ebI4Yp1iAeLq5w5fYBgxhei
	Q6vaUA+x81xtXFQzXG48EmbXZcMd0ywQMffi9EljA+XlR6YZlLgkZrFThE0UGDN+LW2EKb5MJ8g
	DfelkEJYrHDhBLuLJb6+AhL2RQG9l4hIUJ7ICMzqy358hMNv5M0wIwbg28oVseZfDuIm/Df8Km7
	NVVpdsJqPQson6r4R+oyHPOObCnENJL/aZvuVCMc5TAX51sWaCPzscauTQ5mwFZgsufNb5qwB4F
	IBBSlN0yU4ev1NioqE7nEahOAZ5bcg/PRL66S4p2vvYpGnmGJXkc3+CKeSm1n7w0k6hbhEdIbbz
	tnb/anYRafoDGEno0D9lP/CRqu
X-Received: by 2002:aa7:88d6:0:b0:82a:6852:559e with SMTP id d2e1a72fcca58-83a5b8d8905mr7194230b3a.12.1778153860790;
        Thu, 07 May 2026 04:37:40 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:82a:6852:559e with SMTP id d2e1a72fcca58-83a5b8d8905mr7194187b3a.12.1778153860232;
        Thu, 07 May 2026 04:37:40 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm7936426b3a.24.2026.05.07.04.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 04:37:39 -0700 (PDT)
Message-ID: <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
Date: Thu, 7 May 2026 17:07:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
Content-Language: en-US
In-Reply-To: <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z_cmZkFtvBgykd6nOlmzxSUg5oiRjSGf
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc7985 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ivPPdQWlR8-s9s951hMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: z_cmZkFtvBgykd6nOlmzxSUg5oiRjSGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExNSBTYWx0ZWRfX9/T9tlkjWtu+
 Q1BuKmie+9cI3g33pdJvyq79eox+PAmxI2xNzUz4j0JwLmW7AXAjXnJHrA4LtveT1jnPd3mXNhl
 qI4lXXK20LVxH/P2SVQqsdbrplXaZH8kYIg+INbg2yf6wxKh+pXHGVz/2wh5VoxR062PXEbDqG8
 NYNd/5ju2S7TC73l0neHD9DoW2BqcslVlo+5t9ujjD4uFJiilQkPG3BRM6BrX5m7p2BoaQI/3a7
 VRUTcpEVyJbfzomYA7hb300WjCMWxKpxIFirjwsFZsK/VY0ZGcnwjhUTa1xFcL3O7tBrad66LQD
 RWbJMYB9nc2TONO9c2+RZMO6X85/OOVbbci9SN3MRT68VWVa4w8/JCScFlgjQwmRfCr1oIgIJez
 lBueMC8z15pVqlMk3DbvZcD4RCURtKJ7RTXa7PQZC99nij0pDEzH2T0hyevcbIf/Emfxf90UMQr
 1pHhGfCTXDq8/nW7LTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070115
X-Rspamd-Queue-Id: DF1784E797F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106344-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>
>>
>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>
>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>> compatible. If not, explain what is not compatible.
>>>>>
>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>
>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>
>>>> Hence, I didn't use a fallback compatible.
>>>
>>> This still explains nothing. How different clock makes interface for SW
>>> incompatible exactly?
>>>
>> So I went by the naming. AUX vs COM_AUX.
> 
> The naming does not matter. If the clock is called
> "no_one_expects_spanish_inquisition", does that make software
> incompatible? Why would the name itself matter?
> 
>>
>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>> clock-names mentioning "aux" ?
> 
> I don't know, I asked what is different in software interface.
> 

Hi Krzysztof,

  I checked with the hw team here and found out two things.

  1. Shikra is a spinoff of Agatti and its sw interface (clocks used and 
regulators used) is the same as agatti.

  2. I thought we could use qcm2290 as a fallback since the phy register 
init sequence is the same for Talos/Shikra/Agatti. The difference 
between Talos and agatti when checked in the driver was the init load 
settings. I checked with the hw team and they suggested using the init 
load settings which talos was using.

  Hence both these compatibles (qcm2290 and qcs615) cannot be used as 
fallback for Shikra.

Regards,
Krishna,

