Return-Path: <linux-arm-msm+bounces-98215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL2kGktvuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:12:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C3B2ACBBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 861843063AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01263EAC8B;
	Tue, 17 Mar 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVzRsgYt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhaMXh96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953CF3E1203
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760015; cv=none; b=SgEAzdUHEDwxPakieniP9yFh3f6atjn5yyk99yuRN6B9KMrXfu3qx26pgsMEBZ8z4fPvN0DnuUnivyQ5swK79EHzc6ezDHKGoUsSBrEca2Cj1puN6QnBYMnCJpqvS4ttOsnxr6nwH1xYqa1aAA64JHX07pgJOK2AVBoMwSIvBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760015; c=relaxed/simple;
	bh=eSmMrMrnVMKz1nRXC4PqL+mXVL4uTd82t9e0KsNYTdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnnpPLZ+oJ/+SPYqnSuZQUZfSYmJyxJtUArlPGzdEyBucNTX+WAjHJ8IvnbH2JcBqO+QUMocijskcNAgdB5FSMa9dWRtgJTRd4hJDOGCmjX/pBnuEtD2wPTIEZ03U9193lDk9mzvd/Kd0vaac2XTcOOJT0B6YZBjmc2QRUsg95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVzRsgYt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhaMXh96; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDcN4l2906159
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viuuphi5xmv4GBJcFw1fL3vLWW/8NotINZPLyUiZJJE=; b=TVzRsgYtpC7W2UrY
	9sz8p/VU6fwdgPdLOeJPyWrSxewZWANWaFkneIHohYj+G6/D/8gyXzePS3N5qiC6
	TeniPNu62TlEme+6oiqvHb3VVRmiqdpBDGkiQxc5vFXKckdVG6VF/uZarcyg9TN6
	xONOqaa0MK3ro5cOJ8g2lvXxBoJRmtkyJ8iUKV0qq8jw/KgheQAMpMZHn53+H+Er
	iUwvxPTgTLnnCwO10oedgBjpt6oOcJsATPvURlDUXO0ZcshVPmtOm+N7bVIA3LfL
	A5ZBydTXLSc45UofS8ZYNS9a0gd+nItse5u0Xzg3n53hb5UrSGd2jTbv0dK+Y6Td
	kIraNQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxhpq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:06:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60274569cf9so111080137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773760013; x=1774364813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viuuphi5xmv4GBJcFw1fL3vLWW/8NotINZPLyUiZJJE=;
        b=YhaMXh96KIxxOfHDWlfuv3x/6S4G2bRZXqD3THEbb2vFuAZUa7Zeq+YPF070OBt2N0
         M4YKJHM+38UI4uLxU/fYmKryefl6Uw/EAmkZ/ZhhvAH3uaExQJjMkWFciMw8fsTvdVHO
         QfZH+I5pXP29+ga00vloLQxb+Z1ftQ0yYEta9rPj20P6KHTO30QnwA3T6SHvuQIEoutX
         Os28rFq4MIhT2J/IupkGOzOnWtb2xp+z8yqPsjssojFxCCs3CHMCIDpvy/+eRslP9/dK
         39ZoxKMgX+eSvEO8Z2T3TJV5/SKarVbPBMjviOo+xdWn7GfEOvC/a3AMUcl6J4WklXAM
         JawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760013; x=1774364813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viuuphi5xmv4GBJcFw1fL3vLWW/8NotINZPLyUiZJJE=;
        b=IY5f+KznOtSmTCIciZshyi08bUX2/IodTuqrkQscFfKrypAsketnafGviDm+hUBn0b
         wtBrjTtCkLaLwKCc61V/zzWA6ihrfeN3MPjXmAnq01w6ZKx9GLXZXNIMuTnJkXivoAh6
         JwHWy7k8fyUVpAlCzj/ZBZ/RHRjafhWhnULdQl5AgghP4teasC55eAcICq5/2kU+O7NG
         2VUj3jLAxLNc8KnGuHSKARlJG4IpZ3kUa+Rwe2jcwKBEpo+OQfLSwNktBlUDM3MLPd65
         1rzKhH04i7h93MB6QhS4MZOqYE0gSFwsjTqOP9t2/iCpSg8cdVdPoeVXJ20BeTVAq6pV
         wd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSFfLEqgJSXhUPmOReZvU7IuR57jQGAMv3gT/HoKR+gD2aqHFnfTF6ZUNvy60CXF1zTV8sJlnqjKPIR4Fc@vger.kernel.org
X-Gm-Message-State: AOJu0YwolbVWGYfFJzUhphLRJet6jp7E+Sok0zi/8hnLqiRA1NCRjFx0
	Iwy1jWmsO5fzDP6ahBoN1Et0d5rWucVcoUGt4i1nndRJ4lktwBI5dWtIsApiZExTHDW9l1UTnDP
	lQmuxUGKrpvHL2UA3zaBzr2wkZlqWE+WM0PQ3Yy0NSW8nwjjd0Nuq0jzL5kzZ+BvLqQ3a
X-Gm-Gg: ATEYQzyjc7mMPxBeempNvtwgNrL6NYEfU1Em3VGDWLh0ZjUJCBX0R3hZsCg5IuXnFTr
	ty+IRvEsbYIasBqOqCuwgV/JT6+lGoW52Srlmcinzz7rCHx8W5K8eNtdXD9QoDkXndGKqpk1ruU
	r0l4SZthXyuAspWzygd0tQk0QoCBe1lhjTz++uMJC8pi7dVI2Wa2NWHOP/47YJVGg5gKeO8uj84
	YR6NXkFifHaLVSh0jjbUMLSdO/LxKglUClUPveSR38VRzODK55mY31CyKPcy8sKuVNOihaqUaJ2
	LDVcAupTTUokZ+Ulin47cQIzgdQ6oP2yat1x+6vqfwmP265AzRYVqr0qAOMc112/sMdmzFip+Bz
	3WnU/G9lGyBl2amLp6ldOMFQVTBBlkmmzHBy6SpCGSsYFPxbs3I+l0AEUh22vH8fcYtiO50Hx9s
	sz/H4=
X-Received: by 2002:a05:6102:3049:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-6020e68ae24mr3172908137.6.1773760012629;
        Tue, 17 Mar 2026 08:06:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3049:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-6020e68ae24mr3172873137.6.1773760012132;
        Tue, 17 Mar 2026 08:06:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbe63fsm42292a12.4.2026.03.17.08.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:06:51 -0700 (PDT)
Message-ID: <ed3fdccf-d8b5-4f57-871c-8a9cb8676606@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 16:06:48 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3dpnhUhvS-WwUPm8HlOeT4_bbZKWxOR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMyBTYWx0ZWRfXw9apQCamVWpC
 iShwl2+Yt8jZUmK7MqZOJhjNr01drYLsNzCzoMBXIR6KS8Bktu3vl9wDYsdbpR4MpKTgeoe+Ud4
 DL2xtCMRHJva+tGQLWaQnZhZglDesCRrK2hUzvxvt6Vzl16CmsGOweEZXiT5OD6U1KMHG7w1IZz
 liIwsZ91L/F7Q66MFvAwnkrbBv+jVyLCfKgfVdPpv6aX7H8bW9SgKmHBoan99zlsqeTQHc9DGFW
 aHlgtxRkpelX8PqBJB1UBuhAVbm3wGyG5E0uXy0LEqN7zgr1RfQIhbxjM2VlzZOVVo9WXr33eRo
 E98LIVeU/EpdhzT/OxQNdEbWgouNe9HkWdaDyns+Zbx5Ivi3niE4RMezSZBPgzYxTQ5U1bn59uM
 WqEUfbBBgKzx/keUzW97SRUqkwL3b2Joo6/X49YGUMNEqE5UdFaXPLI+Uf33mNA0MZgvlHPiB2+
 2KrGaKRzNql7g4U8veg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b96e0d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=i3U1ZhqbavsoaJQYhn0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 3dpnhUhvS-WwUPm8HlOeT4_bbZKWxOR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-98215-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8C3B2ACBBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 6:39 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
>> On 3/9/26 3:44 PM, Abel Vesa wrote:
>>> According to internal documentation, the corners specific for each rate
>>> from the DP link clock are:
>>>  - LOWSVS_D1 -> 19.2 MHz
>>>  - LOWSVS    -> 270 MHz
>>>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>>
>> This discrepancy sounds a little odd.. can we get some confirmation
>> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
>> FWIW DP3 is not USB4- or MST-capable so it may as well be
> 
> DP3 link_clock is sourced from the eDP PHY. I assume there might some 
> 
>>
>>>  - SVS_L1    -> 594 MHz
>>>  - NOM       -> 810 MHz
>>>  - NOM_L1    -> 810 MHz
>>>  - TURBO     -> 810 MHz
>>>
>>> So fix all tables for each of the four controllers according to the
>>> documentation.
>>
>> It sounds like a good move to instead keep only a single table for
>> DP012 and a separate one for DP3 if it's really different

Please do this and resend

Konrad

