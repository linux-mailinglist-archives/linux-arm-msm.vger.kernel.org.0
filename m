Return-Path: <linux-arm-msm+bounces-93263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K7jFeqdlWkZSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:09:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D063155CD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED1AB3002B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8813090C2;
	Wed, 18 Feb 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZ36kwrc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBOiGTbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A7307ACC
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412965; cv=none; b=g05Pvlh85Ii/covFQbF52tw7FdYLHVXOnFHZQoEzGR/gF3WR6dtqCEVNJ14uZRBFM+669G/or+wPVbUU56lTd6EJfM58yX2nGUDHn3W9qGn3HVjDHbI0xWQa+krgJErQ3d88nhW4GgeEPMAtEscc87Svg6kUpJ79od/zaiDpNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412965; c=relaxed/simple;
	bh=M5TS719ShjnoGlGE4o9lLeYSGLkGU/VsMAspaU/e/Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE5tTW3v15XZrsfo8p1+Pf5NSHQJfkPJYBFNvmLSrURtX1dXB0ysrUxxfq2uDZkNtExB+7l2ufD1E8SLe9rN31+/XSd4vWByjzdsP6n9HwvNu2geq8AXGwKYI4EUHF748CBeZkBC0/wyLn+Zgx+IzcyKhtIztdm+ObXr4mbUKSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZ36kwrc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBOiGTbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HMOkYV1029729
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFKwn2tw5gq7RUXblk/Smr3uWLo2wbqAaHJAze9yViA=; b=WZ36kwrc+0gwTJJX
	fRT21HBn2StZqniux7tvLGn6nO+bO8yOCte8aqsgGkyOduneMwfvXnb+wE0omFQO
	0Jme1k8r537et6T5fLhGR4+xKYNVA61U5KlYbMj8l/yCcfzWChSwwW3h37iS2ZJl
	ic1fWN28aHkSG5UfpTi29VhyzFpaU5qixW05w1HanVpI5p7RvrwbGgzW61QkGA3e
	mBajRTlNC709rbgwoie0GRYn/pGoFz26L4HLNzVHoc6TB2mnbMV4NzqdRzPkzRIL
	Gxhb79EUU2rIAjSqMYTrZBKnmYlfusDQJgTYwyENfLOUWzHTVZDV+XY0yno1KvUv
	blr0tA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd13rsmun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:09:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89547ddf32bso40108206d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771412962; x=1772017762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFKwn2tw5gq7RUXblk/Smr3uWLo2wbqAaHJAze9yViA=;
        b=LBOiGTbS/fxoa7hQnsXSlKU4q1RVdbGSTYyUOtgS8GX3KkocrdzYz+96bnMiKmINMT
         3E1ocz2pMxW5Ow67Pqv9I+ev2ItfajJ2VkRpwGjbpXpu96ZGndsR4SFv0/k/IcP+cxLx
         AimCkfEphxT2CKYgDtKuYwdF2DE5yEVYDa3qgL1ey2m6t6tkWBX4Hj9hTyVxbP9AJDfQ
         L7mvUP52qDJIvdpJ4Nj26YgmX+2b2G1Yl+6CdzZtR9J6wJbJmLwEFPtVwvQ+DVRcexSw
         0Fck1Xd2HUQDpd8FqIewxMnot9wyaW+BKVJVKRl6wRJs4aGG40mmY/rLM+x15mNGtdlJ
         z+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412962; x=1772017762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFKwn2tw5gq7RUXblk/Smr3uWLo2wbqAaHJAze9yViA=;
        b=BspQvY9VuSWoLccUNM1W1AmffZOC9yvNhcojqdmrTE+fBELC+u3xO7WfMG4lriIdLO
         mkoqbWcwc1i2+UN0p7LXB+SDvauSKqO8sm/3BHuyzZLtKq46JjIbHz8u62fTGo/5JJ9N
         Zg0YeTYzBE2EbS39aIZNARwERsFR6wEnWhoYB++Xt3Ym/Oc0QCLiozSOnN9iH4fNGoUf
         4vvSeMBz7AHT9aTTgBYIfGpHCx7ImbPc8WMNrFtSA/GlcD6p78WFnXEntJrc+6ydXWeE
         ZPvmkY/xGmmDWS9a3td056xpwhlYREbUjq1+HWLBJ8I2oMlD0D+at5x7+7J5M9m3/deU
         bbTg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFK9yNMJBNAEd9dZqvnHPGBB5y84y9cIWsw/4kwFABSQNimL2O34kvTJQKYEzWovbXxTSO59S47MqFPi+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KnkGjghbhhvoUob973kCdMj1H36bncPZmNQJxdzryCZfK64r
	mAHZnug8ToN0O2r8sfzulZsgj/IkU2XG4RmlcF7ihDM21Hq+kTcXKWsmwUIADPLjKgyUo5zEu/K
	CcCs2eXCtZaye/NT+urmA2YeJJNkeHPWERWuQO2ky6iVPBVLo+Odoc6UvcjqmJZa8KlE5
X-Gm-Gg: AZuq6aLzW9rhy4ZIHP0fLJQdznt6ZMoyJoS4nmVglCrdV+d5viUWXrCvJ8IRDbeNHYS
	LbqRs7ok+xP5N5aIE9rVfC9Dqh+1b4WMQ0O1BnZlSHuV0aE2jPpMSbhTKiV9M1JXf+L5ry0fOXn
	IjpWPcJEbYVqtNmUbCifh1z0n8RG9fSbdi9TEr/Y74l2kz7PjT2S0+Yb7uF5eb7lvTlZaZds4zi
	NvhiPfahseuKmFunHB0zLM4RBjmC5zqUQINwz/1Q37lB3l5tau2uIhTd8rsPIrj6Xb2gMYWE6tu
	TlP173IupqY4xfLW/FszC8MyhP4EvM+AIHO8DSK85d5xBJZy4Xex34vLQrkJhwQ7KyXGqCi+mf3
	YuZZOjhlj3Atumw4F5lC8jywAxsTQo96vsKojrjqqhGPCtpCDZvz9YP81KCVd7cooHRVNo4PfjZ
	tciB0=
X-Received: by 2002:a05:6214:800a:b0:894:9309:a2b with SMTP id 6a1803df08f44-897347065cemr190070766d6.1.1771412962361;
        Wed, 18 Feb 2026 03:09:22 -0800 (PST)
X-Received: by 2002:a05:6214:800a:b0:894:9309:a2b with SMTP id 6a1803df08f44-897347065cemr190070466d6.1.1771412961898;
        Wed, 18 Feb 2026 03:09:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29df12sm3148201a12.14.2026.02.18.03.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:09:21 -0800 (PST)
Message-ID: <2a348e2a-d065-4e87-9921-8a327c9a2b81@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:09:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with DDR,
 LLCC & L3 bandwidths
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com>
 <2c2a4e27-fea6-46f5-8d8f-b5869e8dc54b@oss.qualcomm.com>
 <CALHNRZ98kp_uymSrjAGyCSus17tP9iGMYZ6T5HaAecEFyrw3mg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ98kp_uymSrjAGyCSus17tP9iGMYZ6T5HaAecEFyrw3mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -l6AH5gyOfxW1HqNDydJA5ZHRuLXGiS0
X-Proofpoint-ORIG-GUID: -l6AH5gyOfxW1HqNDydJA5ZHRuLXGiS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5OSBTYWx0ZWRfX/nvWMp1WC+0R
 /ffin8LMeiYz3VyjQfYcpBRy3rzqVCVmw+6i9R4TsYTsOvb8SDJ1pHKG3OobaEr5IJIC2CW2TNL
 kqHqGfRLh0nQeVwQRpJjKEzCmI4U/sq/SFqi2hUbxVy4o3k1sph5ll/f4vg+Y47XdoKRIr3XyEo
 jAlkDHQ44B/PpZiSaZbCgvMMzeKNw2aPrVE6X175cbiP3EQ3V76P894ESnagznZuXevZIrJnAQe
 tgH6/3GDjFgXOmscD6GLz7MsFhLQgwO4zy7vEx7RGJNluMwLfxM3WRwys/GO9fNjPguJ9lgjpXP
 hbVLFfJljH3MvYbVO8pQAcxSsDiXhMbn07s28RAblBh/wt93cMVRrt/xCmbRwgSdKEnRY9IgIv+
 lDtbKWQFPavvntexDzGcEN/u9UQxBgC7Bvz/aLjVUdTrpMca9bKwMdpmDO4b/7c9EHUQ447cNHa
 PYYCSCpLuCYXmewbX7w==
X-Authority-Analysis: v=2.4 cv=Q8rfIo2a c=1 sm=1 tr=0 ts=69959de2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=TkC-nBORnc63XJkIFZEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93263-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D063155CD4
X-Rspamd-Action: no action

On 2/18/26 3:06 AM, Aaron Kling wrote:
> On Thu, Feb 12, 2026 at 5:59 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/8/26 2:28 AM, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
>>> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
>>> frequency by aggregating bandwidth requests of all CPU core with referenc
>>> to the current OPP they are configured in by the LMH/EPSS hardware.
>>>
>>> The effect is a proper caches & DDR frequency scaling when CPU cores
>>> changes frequency.
>>>
>>> The OPP tables were built using the downstream memlat ddr, llcc & l3
>>> tables for each cluster types with the actual EPSS cpufreq LUT tables
>>> from running a QCS8550 device.
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +     cpu0_opp_table: opp-table-cpu0 {
>>> +             compatible = "operating-points-v2";
>>> +             opp-shared;
>>> +
>>> +             opp-307200000 {
>>> +                     opp-hz = /bits/ 64 <307200000>;
>>> +                     opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
>>
>> I think that entries below the first in that memlat table should use the lowest
>> frequency (i.e. if (freq > tbl_entry.min_freq) { vote_for(tbl_entry.bw) }), etc.
> 
> Let me make sure I understand what you're saying. Given the following
> example from the downstream dt:
> 
>         silver {
>             qcom,cpufreq-memfreq-tbl =
>                 < 1113600  547000 >,
>                 < 1555200  768000 >,
>                 < 2016000 1555000 >;
>         };
> 
> you're saying that everything up to but not including 1555200 should
> using 547000? So in effect, round down instead of round up like I did?

Yes, that's my reading of what downstream does (msm-5.10 snippet):

static u32 cpufreq_to_memfreq(struct memlat_mon *mon, u32 cpu_mhz)
{
	struct cpufreq_memfreq_map *map = mon->freq_map;
	u32 mem_khz = 0;

	if (!map)
		goto out;

	while (map->cpufreq_mhz && map->cpufreq_mhz < cpu_mhz)
		map++;
	if (!map->cpufreq_mhz)
		map--;
	mem_khz = map->memfreq_khz;

out:
	return mem_khz;
}

Konrad

