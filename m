Return-Path: <linux-arm-msm+bounces-99292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKx9CX5NwWmhSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:26:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A11282F474C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10E81304E191
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C323AEF5C;
	Mon, 23 Mar 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg0cPY+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGS8M++W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871413A0B3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275013; cv=none; b=QGQM7blnwK39MJlCmt1Uf+0/1fsWH4G0nbmGyFEITqaYt45YZPtsongyQd0R+vdDlkMJLIcqRJNxbO3Fg9c2dLzvy9ebwnjD7Xs0eeEcPdx9lbNNhFhTl0K9F33SJJEepP2qHYODhQ91ipFe81s9KsOyw4YO7nOkiEBtDTjXxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275013; c=relaxed/simple;
	bh=/+8Pfdqc6upZMjla3MU63qTOyWzedUQ/xh2n2DP0KbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVoG1wu8spkZs8O07o2hUrHiDFeR+pVAWm42wzc2xBMO5+2ngEwRLG5W7yHaQ3RG4kvsSfwEc5fDNJlHKZR7wIgbc2J+Eiqekoe0F6frh+A4IJ9+LZd3E5KmfvUH5tVrl6OAbnK6zfi8tkh01Dqog6ATlCsTfeCicun1WHv6ilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg0cPY+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGS8M++W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCehNm2475988
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=; b=Qg0cPY+9DNYfFr6z
	jW1mNu3s2p1ojFea36dB8V6DKV0nwl/ZmqyphOoi3IobuwVI2/Bm4IPT/tFX8iXG
	A/OVUasPCpNlRRQZTItATS9C1xHrJE7uI3s1dO1ugvNqphFM3zDpA+gqDHdrj5gI
	IvTZsVspRhk76LoAAvDA/hDpv9CvbRLZ/YYWDibEyShRX4c9WA5o36ogzI2DWSDB
	rWTmcdQHeHQeYnHX5mFjr0iUL4rE3E2SUiZYx8bK5knkrMJvxuDGvxYXBIlKVJOI
	yo9ITlxxcy3zEywx6BcRJMbhuwhTv8tO9u7X+E2yv+NyOlySMNymOItCA/wi1pw7
	VMz0Ww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20af4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:10:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c867b7d6fso25007536d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275011; x=1774879811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=;
        b=YGS8M++WZ36GFrpDyQYPp1qTvqgiywWGHme0WOxjFU/zwu2SV1LTFstVw5CrTejMV8
         lzMr2ArxvaOeZu6/2bJoOKR+QgiSj487SM5KaPv9aq1C27QNApCYl23IBCc730wU31JZ
         FfHeXuXAB/Koag1wPBW6bAV0QqEQfmY9+dI0e0++b8xi93eIJgV4gZSoTbXTxPrB5Fkj
         hTcSweM9QJZtgfFRiYMPykaVMPBP0YaM59+cGRfZBW+GMKLPXkCM38CfnSWDkHoDFhhD
         36e9sVEnE2gVuzChljj5LJGRDhoOolQlyA/MobAPt1p+4b/ie19nl9pJEqiFwOk/2mVT
         TQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275011; x=1774879811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=;
        b=h82fS/wHxUGOG098Lr81HnmSELgJN4ePqqgbu0EIreNx3QB6eX12r0PWiYpUfmqz6t
         lHbhf8PTBi7uxGlg/weDkvN6/8FTZ0IdOxdXUM9IqXZCSh2Ae6rMXBqXJ014IYS3kFaO
         jAjMmINMjQ/n71nMbSdm12ZymvMuIQZ3x+K0vDX/5S4NL2NvDJS1uuCUlaZG2IoKihLl
         9jnncjwrnjQQ5eoC/fUqFDjvHk3fh4xKuFO/CRCVmE3tBGxe3X1O7VrRJIeBxUAiA9iE
         CmB/ZriHn0aNH+MAc0OIs8QawMGaYSyQRyGXxJyZkv0WTnWx0eWjpzIDo0djuOkgNIEl
         izEA==
X-Forwarded-Encrypted: i=1; AJvYcCUFRLTdc8wjJWPLEo9Wu75zNcD04gxWmE7dtbju72P/gPWl/A4vIa1G7f/nhhFRkgYSILkj37/Y3TJ1NytF@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTceBRrk5Ve7cOzyfA+etqDqAal6qRKUEhstI8ZTIyJdb2FC2
	PVM+v3+ophYSShenOiELB8lk2k93bSLW3WhiMSvFtaFhYrMI4ctLbUdkf3Rd9GaIAIw7AuLHOrq
	z8E7T7DN24MM2icjcPvKy1FQvnusO3RxnnvIDsAJo4BFPDGg/JsjL0fF8x6t/RzZHQ02Z
X-Gm-Gg: ATEYQzycT0pkem+SeoM2eX8/zDDWg6/hCgcsACGz3spE4jZIF1+HiPfIWJwhxeWQOAE
	e3ogbw04zOlqJOCn6cxuZBucA9gPiNSWvMfqy5XT0vTPpnYJp73QbDeOqhyBLWyfGPUkJX7vvh6
	BnM6x+hihtM+ow7OwpRS5zKM3xplmZJSqIrsHbC71frGHP2I1DX430/v2cWz07mRJGIxH32HJcR
	bETI6098XINIVlmnj1rYwp1IJeHosNiOrqdxBDo8xRsvd6c48kdFxEiW09SKYwvg4ReZGsLL33b
	yCSFOi7ft/xP8cZqGk0j6qUb/3aXaT3QodgQfFaZkQKWhpiY7jW0U3HcDzii/bjUXxuEkdVeydA
	3L2gyhVLe35VjrzP94NM4lsQc7f1OYYmf9Y/slq7/l7odP4ATP+2xYIdYmToJnYHj2QKcJUqajN
	wKMAE=
X-Received: by 2002:a05:6214:21ce:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89c85aa66eamr155034246d6.8.1774275010624;
        Mon, 23 Mar 2026 07:10:10 -0700 (PDT)
X-Received: by 2002:a05:6214:21ce:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89c85aa66eamr155033636d6.8.1774275009946;
        Mon, 23 Mar 2026 07:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972ba78sm26719611fa.5.2026.03.23.07.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:10:09 -0700 (PDT)
Message-ID: <128aafba-6045-46f2-a83a-be5706e67424@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
 <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
 <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
 <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
 <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
 <YUh0x0EbjEVDtKJ-osNM_rBJw1qSc6XM4CkS5w-rOewb_ZvsIlZ-sJXELcysAuPwmtx-M5CN08UfGJWUCqlWQJgxIPpQCU3PMNkD4d7NnVM=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <YUh0x0EbjEVDtKJ-osNM_rBJw1qSc6XM4CkS5w-rOewb_ZvsIlZ-sJXELcysAuPwmtx-M5CN08UfGJWUCqlWQJgxIPpQCU3PMNkD4d7NnVM=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c149c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ciyoaiUkMkNXAPyT_j4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QxVhiW3rea9gpxkdypijQHLzXyVaKiEj
X-Proofpoint-ORIG-GUID: QxVhiW3rea9gpxkdypijQHLzXyVaKiEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwNyBTYWx0ZWRfXzQOdhG8GyKSQ
 BZtUklHCMODIb+EmW87m6zrY40TSII6OQbH6M2KeHU0SgdPzbVf1U/PebQV44Oh3WRNzfh0zc7e
 2uOV5Q/Yw1ela5LCk6X0limR6m2NhFEtZADHEmYPegDH01zEhgrG01D/ienHPLiujzxnCH0i9Ul
 MFGPmhQv4t4XepCwQa2kkGWKcky1QwRA+pmIyQw3I6AhwmaAQa0DPnLnE2yJratPxc9WYYJvLhR
 qqTN7Uv3FzxCE0fiIaEMIHrLbZ6dtD8LHEp0UkkbiMfVX/X6IGNKq4RXJc92YXAIAayo2PGRC5V
 uMErYfkNAgrxes0Dw/asGG3UuxVNJVxVSiMnv7JMxxRmEIZcf/rbBwaczmPw+lHAYU9s9vn5tDt
 xhI51VgTe1MPCmPKIpcVpMWIXGXoKM//DMKjOOjX0Bjsl4GXFf1nZuL+GsgkclilKEPF+457Weq
 3ZtTYHssEeKxA96GAJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230107
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99292-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A11282F474C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:56 PM, Alexander Koskovich wrote:
> On Wednesday, March 18th, 2026 at 7:29 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>  
>>>>> +		source-pdos = <PDO_FIXED(5000, 900,
>>>>> +					 PDO_FIXED_DUAL_ROLE |
>>>>> +					 PDO_FIXED_USB_COMM |
>>>>> +					 PDO_FIXED_DATA_SWAP)>;
>>>>> +
>>>>> +		sink-pdos = <PDO_FIXED(5000, 3000,
>>>>> +				       PDO_FIXED_DUAL_ROLE |
>>>>> +				       PDO_FIXED_USB_COMM |
>>>>> +				       PDO_FIXED_DATA_SWAP)
>>>>> +			     PDO_FIXED(9000, 3000, 0)
>>>>> +			     PDO_FIXED(12000, 2250, 0)>;
>>>>
>>>> Both ports have the same PDOs - will this kaboom if you plug in two chargers?
>>>
>>> Good catch, from what I can see there is zero hardware isolation. Downstream
>>> prevents dual sink by only allowing one port to negotiate sink at a time (seems
>>> to always prefer usb_1 if both are plugged in, guessing because its used for
>>> the dock), but there is no upstream mechanism to handle this as far as I know
>>> (not sure if this could even be done cleanly as it'd require cooperation
>>> between pm8150b_typec and rt1715).
>>
>> Could you please remind me how the two were connected? Maybe we can work
>> something out. Sounds like it would make sense for the two to have *some*
>> sort of relationship described
>>
> 
> Both USB-C connectors have their own OVP chip, and both OVP outputs feed into
> the same USB_IN rail on the PM8150B, there's no switch or mux on the power path
> just the OVP chips that are always passing through. The GPIOs on the OVPs are
> just for notification of what one is providing VBUS into USB_IN.
> 
> Here's a diagram from my understanding of the power setup:
> ┌────────┐
> │ USB-C1 │
> └───┬────┘
>     │
> ┌───┴───┐
> │  OVP  ├──── vbus-detect (GPIO 60)
> └───┬───┘
>     │
>     ├──── PM8150B (USB_IN)
>     │
>     ├──── NXP PCA9468 (direct charger)
>     │
> ┌───┴───┐
> │  OVP  ├──── vbus-detect (GPIO 13)
> └───┬───┘
>     │
> ┌───┴────┐
> │ USB-C2 │
> └────────┘

Hmm.. from a DT standpoint, I think a fair representation would be to have
the battery node track the two possible power inputs, but I have no clue
whether this is something that Linux (or binings) supports today

Konrad

