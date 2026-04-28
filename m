Return-Path: <linux-arm-msm+bounces-104935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGFOHb5+8GlSUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:32:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18B4817A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 785183075F1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4C529CE9;
	Tue, 28 Apr 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7sYQKUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7wwG2/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C61E8320
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368279; cv=none; b=OmvwgkoZxuM46TyT9OymhRG1osXrBvwNRj4MUHZxp9+jrss60xltHk7L5VjRB2/y2tD/tdDQjJ4ky5gw0gWkhO99tKLBZ7wSEONE2KAkNwKbHeb8BXqPrs7VqLT4JQHs3rmg7ckc5YGE/xYOHX2DJnSQSEq4OU+G7SWlCFf5V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368279; c=relaxed/simple;
	bh=K02qgo8d1fMESxrOvwX721ppxGuFk5m9mQZgyzySaZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSPedmqp/G0uuQqs6wTeoBpvqEBnOBn+Rdfp2WH1omMrvKn6crNAAbJHncuGjYTr9k2UELlBMDoXW/BrIXijai032OWVQWKUX1B+CyJCt+rbhgVCamxK4yirwEu1Jg/iYq+u1eBaVh7kUI0iyt2Jl+WPMyTpajKGdOLjp4oaQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7sYQKUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7wwG2/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S5RSaD2383530
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=; b=p7sYQKUBdf1X+ho7
	HxABY69Nkef6k6+GAkXfJmqqTjcOLrmBOSQQFI4Acc24DJhcwtTbqfGIlZKKVb0D
	m9c2VO30FwH31UVD46AXfK9Z/unSGkJNpXGbL8dBhm8Zt8GHiUEVUoivJC4TAIui
	M17OrTRRkNFhF+hPv1PX2jg0JCXpEdFRmTPu8JEUjME5T7Xo8tyg5MIn0WGN30xY
	KiFb9HQ26ldrqIWVhPH5OA1MYB5ZXbGqByjLqvrh8cC6xNBA6EdiMtyt0WuOAJfC
	Tt6bFKXgzVdaI4+8fBZm++NT7LBrARVLesACys8dITNDq/dALI3dmHRhGFxXXH+b
	Ju6+pQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xvaau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:24:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb530174f0so237238985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368276; x=1777973076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=;
        b=M7wwG2/P5qBzdeQ2JFdKkJRHfeHHB/0M+W2Frhzn3Aja0g5NK8H/Ty61nxcQp/Ga9v
         sagQdRfZSr/QCrLuMc1A1/fVSW7146Ua+yUtxsR9OgBFr3fLmrUnKW3SDC9ZGNZ6aVr7
         dx/BPqUIEzgDkGYrjPXO70QPqdLvo5ktwLSaf12C22GkztVZHSdZ383sqfSkyrnQEv6j
         th2g0vR1coKnnV72VBfYY27xTxJFT3Yps+uJTPET6OdhEJkvT2Qd9wyP9pjF4sYNSbyu
         LA+Yy53KKzBm5BBTYcMO075uINX/7eQVGv8LcWjcw81ldr4p96Cfcfij9hSSn5xhDqHZ
         W5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368276; x=1777973076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=;
        b=BowFHF2of8O1j+o7a5ijjLHu6/2V0BLM528VDzTnYt4MOTrqlO5FQfGAFsaAGYP9iZ
         P3kSjBgDNJkAhjNBo56N50rRFLRSQaJ0RswHRpWcOpmJzj8jU+TkxBgA4pPxQRJi7zyW
         FvJ0XkTkH5jUOtiSFwvgr0/QTrZR5hqfdN/bedG6rUfqZRi3nXB5xW3OATb8rARN5aMr
         tyyk6Myz7UHNYA6MYhyaq4uPCqlfoNGUgzY5k6xs0QNn/gCzfzhht/YKEbh4997dA0J5
         GBVK3KphWVEDfsiRecr0qdP3K/MxqKXMAR201OR1TVkKr7UNxy4ZccC+6uBS1gR1go0e
         cbPw==
X-Forwarded-Encrypted: i=1; AFNElJ9n6NwZyMlrDkPkCnbkS0UgzIXgo/VPqFPUD2EUAxFKBMJ5JjN3AFV974scdQ6sBRaUdpZCWNCSnb/RmNFr@vger.kernel.org
X-Gm-Message-State: AOJu0YwFO04lc/bFhdOeYbHrC+xG1l69Fi53YbkkB/MLj5t6UmUfsK5t
	jOaJ++rNqzZRETQQvdLZGnwBI9q+SWCYvVXcXwZlHwrnhgnpAe1X6KnUMJCQDIx9bbbTLmhE63H
	DGEuYsQnHxImAs+9DJ1v0mHidgeTeCfk712DZmy2xJ7+6N47EtXVfI3Rj+woxVtSlEX1g
X-Gm-Gg: AeBDieu5WCEz2S6Evf7ruQnG3yOEEM2+YhCHNUombxt+Cw6stVOVtYWe/bfVu+RYTqN
	Jhbh7oVGIMjaDcn72zu5KVLAfcizR/nK3j6V8DetiwOrIOgpPUqPnbmLMh4D8ibFhsaJGS1RZtN
	riAzwnT1zB5ctOE/WZbv5TsxxpmtbY4m9dQn1gC/6AqJhEjb3SAS9dWY/YaWIF2GAA/7tw/m2nM
	Ovz24xiCZ4UC5dCBIiYY4qtN7J8gj01v32pFiulFLc4eBHA1aL2qJAs2QjNGQUNXrYFPs6EIupg
	m+rMoOzVkch1avl7xoGe0D1sQjW7SaOV2o+0trF9wvdSHP5HUcYcscMYXbbSGMQnkSnCVkK2nv7
	l0l5knepO1SYIqukdmH9OcaiWpmmRpKqPgBVYX7Q8jpWkW3Oz4m3z5F8PxTMErZ8U5MOwj3wPu3
	anDtcVy+WoFE9alQ==
X-Received: by 2002:a05:620a:284a:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-8f7b5a9e599mr252556785a.8.1777368276227;
        Tue, 28 Apr 2026 02:24:36 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-8f7b5a9e599mr252555285a.8.1777368275737;
        Tue, 28 Apr 2026 02:24:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b685f5a9sm504990a12.26.2026.04.28.02.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:24:34 -0700 (PDT)
Message-ID: <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:24:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69f07cd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HraIJQmpyVBdKkQOmRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Xe-_bP3vLUKBX4FZ7TqgpIj-7FbXhHB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX8amk9dghIWyT
 1+wTkzcvKoB5yRMOExXE+axKtB2joJnNQwx8D0dObvZO0dJ0E5IVxHsP1m87g8hUVQ0AdMEBtp1
 +uH4+qhlKYLrmH4T1faj5No8lR0qmSbSAuqB0E19oDmPgOra8hBE+jYb/CojAGED+uakNjUQOAK
 ojkHkPvnehNhuzWIbnE+0TFSvF7hmlZLzNGOYnRqjkN3BZMHIYgrGin3pya6hqbBJV6OtLntxnR
 lVvbY14mX2Rg+r4jcusBq5qrA/B7oSsMTWCxoXDns52P4s1vm/oCE305rC1nR503w08J+vTsky1
 2TZy03ySBheozs/ldc+9msGxWZp+bPNJhoeH2TiH6xXdVEWMFPdg8n34xt4pshUxH5zGoaOPq3C
 gneCnehKffNnskltpzgSs8jW8Vjk0ksa+6VFFmaFCBOabW+dB+HnyB8DRZA6RK5wp35w7Dt6/Gs
 8wCigxC/OUM9x3mRdTg==
X-Proofpoint-GUID: Xe-_bP3vLUKBX4FZ7TqgpIj-7FbXhHB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082
X-Rspamd-Queue-Id: ED18B4817A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88e3000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104935-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>
>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>>>>
>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>>>>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +         usb_hsphy: phy@88e3000 {
>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
>>>>>> +                 #phy-cells = <0>;
>>>>>> +
>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>>>
>>>>> This is TCSR_USB2_CLKREF_EN
>>>>
>>>> Good point. Will fix.
>>>>
>>>>>
>>>>>
>>>>>> +         usb: usb@a600000 {
>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>>>>
>>>>> Does the device suspend and resume successfully?
>>>>
>>>> Well, tested with pm_test devices and it does suspend and resume
>>>> successfully, but there is this:
>>>>
>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
>>>>
>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
>>>> all platforms that have them.
>>>
>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
>>> Wesley would know more.
>>
>> + Wesley
>>
> 
> As per HPG and downstream, this is what needs to be done while entering suspend:
> 
> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY

In case that's related, most platforms (including this one), set
snps,dis_enblslpm_quirk which prevents the first bit from being set

Likewise, snps,dis_u2_susphy_quirk for the second one

(although it looks like setting these bits is currently
unconditional upon suspend in HOST mode?)


As for the sequence you mentioned, I believe the diff below should be
OK - although it _really_ just adds some delay vs the current state,
since the bits are cleared in the resume call

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..e7b1775b7207 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
+#include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
@@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
                return 0;
 
        for (i = 0; i < qcom->num_ports; i++) {
-               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
+               /* Wait for the PHYs to go into L2 */
+               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
+                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
+                                        10, 3 * USEC_PER_MSEC);
+
+               if (ret == -ETIMEDOUT)
                        dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
        }
+
+       /* Clear L2 event bit */
+       writel(PWR_EVNT_LPM_IN_L2_MASK, qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+
        clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
        ret = dwc3_qcom_interconnect_disable(qcom);
@@ -752,6 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
        bool wakeup = device_may_wakeup(dev);
        int ret;
 
+       /* Clear previous L2 events */
+       for (int i = 0; i < qcom->num_ports; i++) {
+               writel(PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK,
+                      qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+       }
+
        ret = dwc3_pm_suspend(&qcom->dwc);
        if (ret)
                return ret;


Konrad

