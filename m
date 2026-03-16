Return-Path: <linux-arm-msm+bounces-97980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNBoBLUfuGlYZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:20:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B629C29E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38203304A844
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84C93A0E80;
	Mon, 16 Mar 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7j/Oj7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtPvDpJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235719ADB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674149; cv=none; b=hDe8vjeyQv84XDDZ45DskJYbCpVEbOaJSEZaq5XmdFNW5ZEDTuEJ1qLB4bIMDs5DBiXaTAox2tYiT8SpjDfE+RbjyDwZvIQCk997R2dbtnlizaRuogG6fo1UajIiERf1MaIXn2J0q9w9fF4X3B1CZ/FEshL7onH+KAuoldHO8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674149; c=relaxed/simple;
	bh=8AubT9zETLO3J0yhalp2EoKWnXlbZ0igEmByf+LsasI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWCHbDA9+E4pUYtK6DiycUUF/aRui3NjfXSscunCc2SVwltWo345+6dYY6shYOMxyrLqQACebO/f9x2G4breC/OcBjohXLgCUUK5tl+GYWXmgyawju5IAG+WgrDIsZbHmbYZngzQhJQMsz6ylZACBoY6ygGPoS2oStXrYJ42Dsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7j/Oj7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtPvDpJ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjO9N1724715
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dtgclFV0NdJiTfOLgw6vPOoHOLrS1waSp0036mEAgQ=; b=T7j/Oj7HDDC0+1dm
	EVimfT6urucrPqiV3MnkwGRRArh+qgN76mU09Tf1pb/RNf82o/0YXyR3Z55mj+Lr
	/47cyenKgG+L4rdd6AYfRaRZlrxe4GjhYe+x2lEV3LOfPkFZhZR734UAX/PxzpI3
	/VfzWX5r6M9ITUXqt8Z0GOwNUoD7yAdLMpGa0oQkVqjOS3acBfHTkTJbf5+ZjuNA
	zfw1aBkX+5RHufK8ZX5NV+SZacJIIrRedE6F98NzpIBnBS0v/1j0tWTNRtJBlBoU
	YQaijVtxQNBxw8xHnkzJntnWrqcwSagkC64ve2XQpZOYmPJG5QPR/aXEIEGfjrEV
	tW83nA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udp7vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:15:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffc46c792cso1110895137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773674146; x=1774278946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dtgclFV0NdJiTfOLgw6vPOoHOLrS1waSp0036mEAgQ=;
        b=PtPvDpJ5+I3jVFfUa3vqBNOT4cl79QJbSkylTQGUd1meWlgMHimZe9IQUoWc2kguds
         bUOC/e3FYz1JpIQ0dJpwxo1xe6SpOoPbk4AElcKZHV+rVkNfgFjaVV2jY9t/8H4krZIi
         0R/af3yrpGrxqQRW2RqzD0ZcWP16vJNK+mShQG6BsP1pifVB21dKqIZlkZrNwoeWX4br
         HWr3W8gzLtrTNLRuhFfkFGfJMopPmL9ASKUkY1ptgjC4UVADZwJu12t3koZNMU9AxclI
         LJnD8c5dscNatKNms5DxaQlVc+RUZUz8JfTdUYxeR6V+Sqn9UjTgGEiQlB3ZJSJLuwx9
         Vk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674146; x=1774278946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dtgclFV0NdJiTfOLgw6vPOoHOLrS1waSp0036mEAgQ=;
        b=UWd7/+wfeq3ZD83yPUOspFYjZH7NwkwY1+lnAqB92jD63vDimpWvMctX7obe+qmo/l
         T4gOSWIm4Z7U2ojELKLiJpl2MhC9TLcXT4UWidyh+zvazOrehA+VlsHMkmeNm02ZF3eE
         ESKDbLSFDyLp49x6tjPKTD5SI/imZacgIB+3dcLO7IssYHmep6pkhwNQ/G3gNQ6sYiHf
         oyvFM690A2C905EHDb5pJKB2ez+IjFeWYVrfw6FZejaZLu/ep0HyKx7l00mkphyf+ice
         wZNZTJJFvZwMxZwIBZJNuJMXyD/yoR3eq0DF+w1/JETaqZtfZ4bUvw2Sqo8B6ZlLVlPs
         fvMA==
X-Forwarded-Encrypted: i=1; AJvYcCXGUCYCHOXffOAPW2E8bIiQCa2QnU01vw+vjkc4Ydd/UgNWF9tRru+CQg+QEw4KV9iHFwdiSuKlUlo23uRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QU7+HY2eVft4v9frOpamPF2psvyB0rvD1miYxfUWb/1Lq3id
	uKeOOOIYFdJT/anFIqBr3wZJ4etS+XpCgZndib4Ji1NF2afFJ+Hp+9lCbaGgZqmgbkR6UoHyPiu
	l45rAPM0fktsuTDykJds/gXB+N6ZjpZ6Reu5ofoQmVN6mbkhE10SVMsXWbOTx9ZzD8dgs
X-Gm-Gg: ATEYQzx4fwzJ+uD/r1yYqx9f1/ZycMBhfxQR1f28cmQIfMtLKcL2oKQU52iIlPzRKXQ
	6Om3UTbmeiZ5X1SL5UrqVGDRDA1om0BqKpkn4TcODsiP67XxXSN9UrUpolGNzqMpZjbuK/OGK1f
	SXrkadBxVtThf16XtRpihoqiSFlMg/feXljkQQSi6jzy06Ozh67efzIdTpLJdNUMvONiPVc0gA/
	GgqntQKcVsutvBrl4j1gj0IoHGDKLCXHkWuMOmr38s8bPxikdVls60DiI2QXJcLLiFqtG+rknlS
	LW3KSy/LlHuatQU6HtuNFE3Fp6APVJ2cZTDFQ2PcAJCi9ulndLyeQu9yYD6dGC0zXtRWxVQ5/vW
	KQgwhCRvUzekfmFcwYoqJvEeQ6reBoIGeNbaoAp1NbMtOcaxQd2/brZV841b1E6hiovajz7JEVq
	Wc/b4=
X-Received: by 2002:a05:6102:548f:b0:5ff:dabc:db57 with SMTP id ada2fe7eead31-6020e67699amr2409065137.7.1773674145869;
        Mon, 16 Mar 2026 08:15:45 -0700 (PDT)
X-Received: by 2002:a05:6102:548f:b0:5ff:dabc:db57 with SMTP id ada2fe7eead31-6020e67699amr2409030137.7.1773674145396;
        Mon, 16 Mar 2026 08:15:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9791c30cf3sm455238266b.2.2026.03.16.08.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:15:42 -0700 (PDT)
Message-ID: <87a103cf-d066-4319-ab68-bea3463c0fa2@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:15:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
 <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
 <7d8211c5-7b12-4349-a329-cfb51a918a1c@oss.qualcomm.com>
 <6qhpiiroqnpzg44i2j5rgmlw7uaffw4t5z6gv2kgubfoqpktpd@r7h75knlv5a2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6qhpiiroqnpzg44i2j5rgmlw7uaffw4t5z6gv2kgubfoqpktpd@r7h75knlv5a2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b81ea3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qqbVkrzGGpSu_KmFPysA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 4McKdlkhph5GMsU27fSumaKKolsRw5YQ
X-Proofpoint-ORIG-GUID: 4McKdlkhph5GMsU27fSumaKKolsRw5YQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExNSBTYWx0ZWRfX+RN74Lctq/mt
 gOglRxersmDbVnJsFlrVA9rSThRn13H6rvCwct78g4igV+qTATvTAKtoVvgorXg+qQx8mRbC6zu
 L6VWyZ8C3+ilsL2m5V2k5oIKyxBjgSp/lLzwBIzYxdX1ki84uUfAsACZXST5Vh/3W/7Z3+HuwYW
 OVJI4yZHRVq3rLfaiVeMzZEpr9Q/6RYE5/6RyOm3pbtM8vrUZ50i9bfY1hN/lzoHPM0RAh/PYKY
 dPH5sjMCirLVXHybHx6OtiMxhH4mfZPZ3fkGZjd4jVnDQv6crZ+CajLcclOKCgaijP8H6vPBRUG
 vFv5vLuZnhSSVDTaLtmWe8buUgSY6XTzevBIwbP8pc9DqzMuBHRAUTMtaaqKt/HD7PoXcq0M56r
 6uDQYxiukW2V8Cj8yH54Q3IbsXkzxzq0Qs82H2aOlvyMAGIwSIYnhtfOW39Mh8BxCb79DbGkcFJ
 otIwkRz3LHBkegJiISw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-97980-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F1B629C29E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:27 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:27:11AM +0100, Konrad Dybcio wrote:
>> On 3/13/26 6:39 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
>>>> On 3/9/26 3:44 PM, Abel Vesa wrote:
>>>>> According to internal documentation, the corners specific for each rate
>>>>> from the DP link clock are:
>>>>>  - LOWSVS_D1 -> 19.2 MHz
>>>>>  - LOWSVS    -> 270 MHz
>>>>>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>>>>
>>>> This discrepancy sounds a little odd.. can we get some confirmation
>>>> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
>>>> FWIW DP3 is not USB4- or MST-capable so it may as well be
>>>
>>> DP3 link_clock is sourced from the eDP PHY. I assume there might some 
>>>
>>>>
>>>>>  - SVS_L1    -> 594 MHz
>>>>>  - NOM       -> 810 MHz
>>>>>  - NOM_L1    -> 810 MHz
>>>>>  - TURBO     -> 810 MHz
>>>>>
>>>>> So fix all tables for each of the four controllers according to the
>>>>> documentation.
>>>>
>>>> It sounds like a good move to instead keep only a single table for
>>>> DP012 and a separate one for DP3 if it's really different
>>>>
>>>>> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
>>>>> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
>>>>> in that case.
>>>>
>>>> Even though the Linux OPP framework agrees with that sentiment today (it
>>>> will set the correct rate via clk APIs and the correct rpmh vote for a rate
>>>> that's >= 162), I have mixed feelings about relying on that
>>>
>>> Why? 19.2 isn't an actual working frequency, as far as I can understand
>>> anything. Or is it a working OPP for running "shared" clocks?
>>
>> No, I meant removing the 162 case and relying on OPP to pick up the
>> required-opps value from the next entry
> 
> Isn't it a documented way how the OPP tables work?

yes/no, there's a mention in dev_pm_opp_set_rate():

"""
An OPP entry specifies the highest frequency at which other
of the OPP entry apply. [...]
"""

if you insist, we can rely on it..

Konrad

