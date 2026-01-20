Return-Path: <linux-arm-msm+bounces-89886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKW+EuX1b2m+UQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:38:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B54C644
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1115A920FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59C444D005;
	Tue, 20 Jan 2026 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAswq+tY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnnUGnzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036793D4130
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942466; cv=none; b=fPL6UTJeV14Dbx96bXFe5ApYL0CQYcDpsKkwjgTEke3h+ls7XR790ddLnsJC48UGobkk4y3JF4iwBPBv0cWFd1QRKB4VJNC2SMfmsVXBBwFLHQA24REic4Ovtgwc9L2AsGVTlPLTWPPreOtBl/PEYGnhz+csyKcVv34/k/36bhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942466; c=relaxed/simple;
	bh=di2UtMSFxkeMsf0mut0g+itskPkjNXYXT2MPFmZplWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+ELY86DAgWEP4t9Nuun17w5BPTx7n7GSC/txqL6Udw5WtmSuCNi/HpVxUXEbkBTor32vrA9wvc6QjPvU8wDpZkN/F7ykC4pI5JFEl/LqsU6K36h6jmfDAtC+JztrCOuwk9o3Iqf3N9nKLAGAj/bPQurNe1sOLn1yrBq+rqyPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAswq+tY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnnUGnzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEUC5L429026
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 20:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7syF+dAMQlqjw/9cp2Nj5PaS2FPxml9SqHdBjZhgXs=; b=OAswq+tYi9cWtl87
	1rDoq2GdfznSWiYxWJr35+05MPp6kbngqpTPbZwXSF1omxTKIxMTFH1vlCbD0lDX
	MkwN9fzjTLLab4QJw/zx5PjYbVDVvVALcPUJ5MlkLGViT0C1RPNhzTdS2rdVAzv7
	peQqitAEeMttO4d16DKf+zmc2dRrvGJCzwD2gVm6moq6Ka1IX14tVw/xoDuA/n5P
	ZbLnph5KCIHzGJ9WXOlB4DjQl2JA17HeKrNynW31cI32mezUpnOKyWWxQE4RS1qG
	mqocQb4YYLTnoKTGOMlNdP71dWz0JVMkmrhaYlustk1PEk4//1Ry9JqrM6DwV0vf
	t+BeBw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps2p2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 20:54:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3f3af760so10020162b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768942462; x=1769547262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7syF+dAMQlqjw/9cp2Nj5PaS2FPxml9SqHdBjZhgXs=;
        b=VnnUGnzFgpMNDGNfeGRBElhaXYQpS0YrbRo+aEkPPT2mQCsmjv67IgairNmodsz+1x
         Qbyl03mRH6hrS8LNYytX7JQcGTJFzvNM3+aozf/pnOIpdHs+nMSGr8gC0h9XRPPCQnQW
         K/brN2nLwCBqCKQnX1gvN1NZQ5YLSRW/OVTgjX6BA69jUy3WSETNJ/o5TiGtdpaOPbSO
         KTLCJEVuDKvNqLjZXY5zIIe9s39xDj30IC2HaiX87wc4QdCniMXmzvThtPBfgsCM+Fdt
         bYb90l/xuPMjN0f00GKYiJUE8lk1C2FLCGa22nuJFGXLxo8/JrmeJUIKEirBqjb1tcQe
         +dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768942462; x=1769547262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7syF+dAMQlqjw/9cp2Nj5PaS2FPxml9SqHdBjZhgXs=;
        b=JEsNKxXqSTFzko8HfKa7gNWkyMsNuWprgJikUGRdLCB0M6R43v+tHYHz9ebnrYcg8l
         9Fj1B4jsUrssuCT7KKup4gKIsgu0YlbZrZUawRoXfAELxuIp2brGxsC+5gQQVT07kX4p
         MrosMMrgcknojnMaaOZUk0tLQR8AQdWl+cb5MtTZrDarRW8gk9hA6JIrMjOpZyp5LC8Q
         cNqfeTX7zUSmmIHKx9T3DCjCWcGQslwB7ayHx002Ehejw7uVdvg8v9d/YP5/WsdSWzPi
         d0uhe7u8a49orM5md74GpJJFxgq5ZW/+OT17HmFni4VWTlOe0KNZhwXOYfe9vjtt5w2h
         Ue3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0WqaQWf900AGUFrUodm1otK3WT1OWe8DSn66mtPBwqhRLqwLH1ldqDN+D0n1soC4OAxFRq1xmRNYvD6Xx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kgrkS8vELkFwniOab3WPfQvqYE2lKH65/nSYZoUj3ptNE5DV
	n4v+IQ/DA2hob1IRln6li8mrKXDl1e5DsdeTA9t6Gn/Y0LcZpj6t2ihS9/FTNEsCINnQVqQLo+Q
	2DuujI7jk8G+PjU1XfoXzUZnROTEFLufYOqmFlyG0wjw9aEdqUAAkiMVfMl7U5uUu5lU9
X-Gm-Gg: AZuq6aIHriyBK5Mc4kGwX5A+l/XxTjzPMJl23RuiiWkuDNC+QuoCsuyQPNj3Hsz9pM8
	2jtIhf5xM/Gi6rm49SQLAmTk2YkcRTRZRy4+65zqSzh2UQjMseGO8eHTea6uvQwv4eBVs5WIgte
	NW9Xg16EHnoYM2Xr1SexDyZf4fiBmnjTYpH0KWOUkYJfqNJ1nnWGSsRHeqq0SAWEj1GL/oia9Vk
	3ghHOxh2smQ4s1xGU7kb+M90oIHnndMis8d8lvwLRfIkM/7Ih9snPIp2nXirFbIZKLlTakRgmga
	wV5OyBfsOz3IqenrqBjC0AFjd7NWEvBLDBMUJ+BZAaGWHgIjWOQDTPguReag4RqedyOibcpF5Ww
	vNEN7IrcVEHKD3c6T2EdTW9BQShWVPsI=
X-Received: by 2002:a05:6a00:3020:b0:81f:4319:6a0c with SMTP id d2e1a72fcca58-81fa03a1fbfmr13263093b3a.51.1768942462392;
        Tue, 20 Jan 2026 12:54:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3020:b0:81f:4319:6a0c with SMTP id d2e1a72fcca58-81fa03a1fbfmr13263071b3a.51.1768942461924;
        Tue, 20 Jan 2026 12:54:21 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm12851073b3a.65.2026.01.20.12.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 12:54:21 -0800 (PST)
Message-ID: <996f47de-5900-4a3a-9372-e5ea3ae31c8b@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 02:24:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
 <d8c24f26-3ee7-4966-a11b-1e2afcad93cd@oss.qualcomm.com>
 <908b64f1-f6ac-4c5e-9c72-1174cba62017@oss.qualcomm.com>
 <f10ade51-b29f-45cc-9895-d66a319ab26c@oss.qualcomm.com>
 <99796cc0-f29b-40d0-b8bb-ebcbcc950b23@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <99796cc0-f29b-40d0-b8bb-ebcbcc950b23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bxoUQTKN60UeinQo_IaGD7-R4z5K6ZJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE3NSBTYWx0ZWRfX46acDiRPbWvq
 VJtZgi+1rKqJtdpWVBiurI6jcpO+sFDc8yrrkfM8hyPRoeHQmqLCHyP6Jktmj2o63AnoS6urGbv
 NiS2Wll7WClJmBi1JHF0lAffE1vuwjKpyILoCA6UIKAhvTiNQ12bkb9KCYXaCug64UMdCbn3J58
 B2nX7ka0LqvoADxSQ8GCS5XLPnJMZqdFXkSFjPDGnd8TYW6WT5Camu10axgZ/AvLEhYm5L7+F8y
 yw8k5FKRxjx9LO/JdeFFLAptj9olOx1Nts8mycDCJmk3b+FHHGeMAoctAVbIE4owuEN30gOtgel
 S7T+KlGqLgdXEIlRmF9kwXLuNhB3veCjov/FaOA+dyWHvx1Elu+sqVAD5ym2xPr9m0bqB0ioOw1
 nbn8yAYcoPvzSEV4xaAsNLNsaaGnMuOyM39Ze6GV9T6hBh3cuHCZs6AhLABKShmUKWBGJTlxCKE
 weB682EGKLNZ3HBZEsQ==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696feb7f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=dP73N8aTmtjQGoAWXS14bA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t2XMIitdhs3okelATYgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bxoUQTKN60UeinQo_IaGD7-R4z5K6ZJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200175
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89886-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE9B54C644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/2026 8:13 PM, Konrad Dybcio wrote:
> On 1/20/26 12:25 PM, Akhil P Oommen wrote:
>> On 1/20/2026 3:44 PM, Konrad Dybcio wrote:
>>> On 1/19/26 8:00 PM, Akhil P Oommen wrote:
>>>> On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
>>>>> Add the cpucp mailbox, sram and SCMI nodes required to enable
>>>>> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>>>>>
>>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>>
>>>> Just curious, does this patch enable thermal mitigation for CPU clusters
>>>> too?
>>>
>>> If nothing changed, we have lets-not-explode type mitigations via LMH,
>>> but lets-not-burn-the-user would require a skin temp sensor to be
>>> wired up, which then could be used to enable some cooling action
>>
>> In some chipsets, I have noticed that the gpu cooling device throttles
>> GPU to the lowest OPP even with not-so-heavy GPU workloads, making it
>> unusable-ly slow. My hypothesis was that it was due to unmitigated CPU
>> temperature tripping up GPU Tsens.
>>
>> So, I am wondering if there are any additional CPU cooling related
>> changes required to get a reasonable overall performance under thermal
>> constraints.
> 
> Yes, something like the aforementioned skin-temp sensor at least..

I suppose this sensor is off-chip and slow to react.

> 
> Today Linux will not throttle the CPUs at all (they're not even declared
> as cooling devices) and we sorta agreed that in general it's a good thing
> (tm), because otherwise we'd be coding in a cooling profile into the SoC
> DTSI without taking into account the cooling capabilities of a given end
> device (i.e. in an extreme case, a PC with SM8650 with a cooler that's
> 3kg of aluminium vs a Steam Frame headset where the SoC is centimeters
> away from your face)
> 
> Currently, we have cooling policies for devices with fans and the only
> other action is based on a skin temperature sensor (sc8280xp + x13s).
> Everything else is left up to the LMH defaults. AFAIK work is ongoing to
> create a more informed solution, that would have to (quite obviously)
> live in userland.

I can understand that the skin-temp based mitigation is influenced by
various design decision outside of the SoC die. But I think there should
an on-chip sensor based mitigation which is fast and usually for a short
duration which helps to avoid extreme temperature or violating the
maximum operating point of the chipset. I guess it should depend only on
the SoC characteristics as it is a last resort. It may be implemented in
SW (like cooling device for Adreno GPU) or in HW. Probably the LMH
hardware you mentioned offers this functionality for CPU clusters. I
have no clue. :(

I am hoping that if this on-chip mitigation is enabled and wired up
correctly for CPU clusters (probably DDR too), it would reduce the
unnecessary thermal trips on GPU Tsens and help to reach a performance
equilibrium which is reasonably good.

-Akhil.

> 
> Konrad


