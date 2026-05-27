Return-Path: <linux-arm-msm+bounces-110000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKsnIfv3FmrUywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:56:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D732C5E5675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E29ED300951B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2803C9891;
	Wed, 27 May 2026 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrGw6F0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAw2SYaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78073D47C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889910; cv=none; b=TrWnS99FJtBieFoeheJPlUdEjuXyS5dEcbDzYohmslI2Jd58WdrhPZ6kpl3ViB67EE3gpdNc9pqU5MsBulZSIwJ8MHegxkI3HNgxgAzD1LWNGFiG29dnW/qSY28o8QrxLL6nD2Qo5maNOcdNVLZgcjOzLj6K2ED1wc91bV3MCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889910; c=relaxed/simple;
	bh=r0aT+QTWj1B7a2o03LnJE8w5zsP80m9ExwvT1Og5Mnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed++Hb/yV21MI037zzEoM+0r9tTYJ72CV3FwHuiah9+OuKBGY2RVq2f/XoqT3WLygDm78pTKmgU86KUzLmGE27maCLNKsC5TfdTiPFgosewpADeSdnWvQ2g7mUQhSqYoJOw9yMTAmrXnPI0kt0Fq0S9Q/Nf//QxA4bDtGpIOk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrGw6F0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAw2SYaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mSKv879299
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=; b=XrGw6F0/2xToLL1h
	h3AZWF6ktGDptzqrljIuR1E6Q5QFZAhdyn3fyBVhlUA3vVUz+PQniHIR5ZrnYr0/
	Ns0T5uJAzrcpdtaWOBqMlsWyT1TDgme1cVjI8yqucZ2msNOpqnXAxzcBYv6HQuRC
	AKN0DkMxoxez4Pn0d+PUr/Ym3Vue5u7LYxKNmVAzLxL3/wr3xt0zt3P52HDf84ac
	9GQLSDXdk7zpmr4qrPhqNtWUYgU8hAOG/ga6BH5f82+/XgO6wOwi2fSTqKuFSUgd
	FqLxKbwwBVQfg9+1MXN7ItiDZZFUltQYtysCq24EnpY80WEr842h7tpV4Wvuq80N
	29JHPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqs8cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:51:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so129916735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779889907; x=1780494707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=;
        b=EAw2SYaACTTJ12iy7fnemSQwvwB1zyzDbK1BAef5r+43OAI5RsBJKHUpMZenIaNiqH
         KSJed6VMukM0mWLQ6T/ISe5NRJ4Wfzxd4SLQJpt6BgVFxw081k/bNto6K5YJVw3yPtRm
         tcMUi7/IPgNsuSxNsIM+Svve5opU16rzvuzdWfuyDty5JHZPKutBcM4dn5yNHxcyIVNJ
         Z9a04Nb4smUg9UkrHKkDW6pC5iTD/k5gH6KSc2oAYOBA8jwEy3az2RSjrO23rquMu1+i
         KulGPmH8NnhU66v2eHlhfty0ba7F5rfTZZVWvOJWbz31764MvK+bWO5dgoqvn3cy/xDf
         ArMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889907; x=1780494707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=;
        b=d4ENsmcQUWDrwild6t3CYHUWMIOI9MJ8JYu3QBat/2k1OfrtyYmCQbhTcyzdsmc0j/
         oDNPCB6t2IJjCrsQF10D894jr2+yFh2wy2dxBJQq9pYYc9KSzUeJ2blW0JKPfVDaQ25Y
         zE5AS5AFHbJv7focwoJeY/+voa4LF3+yPKtMrDhehXQqs2F8Euj7+GmVhgtmfHsRmDUE
         11mnWhJMDqM4zhKAc0zqyP//gutS7PwHX6X3dak/tkrWaG4k/w+M/umIKuFGDG+BiR/D
         zw9J1sn65924YNWckN+nOnupK47CN0cSJZJrzVu+Ju1tdEDgpEm9K6KP9DAyk66LSpgy
         1qHg==
X-Gm-Message-State: AOJu0Yz9azSeCcUKhoLS18Ia1zn9vKIAIXLptkROtRD4KTgiIdmeA6G2
	Ykr0pyVPnQWUPROIPG9jv71OUNkGJbqBBSZA2r6RtCwCFJKFjsqEUdTpVSb+UUHtnFvOKgO2P0f
	JV2HncY7Y/JqkYg7OC4gBzndbxwWeO8EZv9r1QWpulLzDXPHrPsn/YXU0kIhXgVLv77YN
X-Gm-Gg: Acq92OHTVoBWrfMrf0slqo+9pmUoPuI1+x3CSh2lIqSkcvWnDroadvgDawIuZK3aMm2
	v0eAYY7+yUR2qz1qsJSGKFCbXoHDkeXtZR+t8GmveRKHbVTVX+2+JZPd1UY9v3YfM2muPkTDN4t
	55cNPh5S/NDgXKAfnLoyvpCTRDOWWUeB7dJ/AkdJMizCmDsGQcb4oPpDzo0MgIG4nPgIm83zXPL
	Vdmbvcwu29k19KcS8+SGGBNoRdhI5FusBLG/m60JljKZIiMM2LU9Asp0o25rLqL3B/5/H+BZLky
	EFBJCLfdvrDg/hV8Q5Ol8z+dWvCTa5soUD7dnlDJQCa17v1twVSmKOXdBZQ0aPrfQOCJmwyoV3K
	TC8UKcQniVTgDlKyNafAVp8agnF7unIV0LV8pkD/n8IAHfaVIQEzjU6AwP3g=
X-Received: by 2002:a17:903:354b:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2beb0735023mr265126555ad.11.1779889906586;
        Wed, 27 May 2026 06:51:46 -0700 (PDT)
X-Received: by 2002:a17:903:354b:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2beb0735023mr265125955ad.11.1779889906099;
        Wed, 27 May 2026 06:51:46 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm205407535ad.36.2026.05.27.06.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:51:45 -0700 (PDT)
Message-ID: <68027ef8-6182-479e-ade4-9c19b048b337@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:21:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzNiBTYWx0ZWRfX4Ex7DMuSHykv
 87u2ol4KL26aKYbhbwbWgPRwwPBhKZ3QzSI8BXDUktuUoVWv4M+aZJOkwtUvS46dYgWEwrNeolg
 naTPy3hAl46Irm9QzXwv6THpMHSW24kF69GtL3hyv61vl3jbTu59LWJUlJDZpY7dlFif/oWYQBJ
 6YvVJwVZpJ8aG5u3pZSMHPaI9uCgV23gzwPxzvCwFYKYIC+4V4W5qoMBtiu1P7LOCmeWGuvgu2e
 TeDdDeLFyAZfZg1KfJZUSs0dFFWsKyoTf3ZHGOvIMy4OwghryxQYaamocgWtOm7AlMIerAY7TT/
 tVbrb/NyS+Wdl2Bc+hxuelAHkUCfDHMYf3Kq0+w/Njt6OMVJipV5ZqOAVAqVLKfcPegHvm5EPBu
 hfXOB4Ur7ut+p73CHjTavBC3Ptrk9EZeU0xtcnhDQIXpiGMGl2PN76eekSjrmzLcy1Yed1/n/QO
 sekOa/V9RKzUs8Cg80A==
X-Proofpoint-GUID: pJrheIaf8R4KgN4yAsh2z94BJmw0UHdX
X-Proofpoint-ORIG-GUID: pJrheIaf8R4KgN4yAsh2z94BJmw0UHdX
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16f6f3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ov8QOwxTnn4yD7v_06kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270136
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110000-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D732C5E5675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/2026 6:44 PM, Konrad Dybcio wrote:
> On 5/22/26 8:02 PM, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC.
>> Shikra ships in a SoM form factor; this series covers the CQ2390M,
>> CQ2390S and IQ2390S SoM variants and their EVK boards.
>> The series adds:
>> - dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
>> - SoC base DTSI
>> - CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
>> - IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
>> - EVK DTS files enabling UART and eMMC on the carrier board
>>
>> Note: USB support is intentionally dropped from this series. It will be
>> sent separately once the USB driver changes for Shikra are concluded.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> ---
>> Changes in v3:
>> - Drop USB nodes from this series; will be sent separately pending
>>    conclusion of USB driver changes for Shikra
>> - Fix CPU3 reg address (0x300 -> 0x10000)
> This part seems to not have gone through (have you verified it at runtime,
> e.g. via reading the MPIDR_EL1 register?

Thanks for pointing out this, I missed to update the cover letter, the 
value is still unchanged.
(Core3  bootup failed with reg address 0x10000) [1].

>
>> and memory base (0xa0000000 -> 0x80000000) (sashiko-bot)> - Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
>> - Fix MPM interrupt number for ss_phy_irq (8 -> 9) (sashiko-bot)
> Hm? I don't see a 8 or a 9 in either this or previous revisions

This is a miss from my side while updating the cover.  It's interrupt 
controller's interrupt vector  instead of MPM interrupt vector[1].
Will review and fix all the cover contents in next revision.

[1]: 
https://lore.kernel.org/all/af80ccf3-b26b-48f7-ba94-0830c0730a94@oss.qualcomm.com/

Thanks
Komal

