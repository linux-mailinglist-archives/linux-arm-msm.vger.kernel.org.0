Return-Path: <linux-arm-msm+bounces-90306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ic3Oww/c2kztgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:27:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50318734B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A625D301CCC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EC0353ED7;
	Fri, 23 Jan 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfAXlj21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsmyerfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D1346AC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160375; cv=none; b=h2va8PLyXYGM8IutqWmQZJybgtoNtSPwfHljDV9JAt3N6ets2qWDpRsfx7Jm/sDNY3+Vt2iWW7xCPnApm9Fb12/G+mFGTDOLOX4dz2D0g98I0t0OesvKtliICg/HnRVaSHTuTzNvxx9kzHPM5cDJjGLtDi5eK6HhIq/qHiUzFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160375; c=relaxed/simple;
	bh=ZymD45HnA1Wj/EjCUHn4EAtDCmuZZ40XWkQeZWRpHuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4+uHH6YZ19RQU1sHeoGbNH2Xu5IJHv6mSEBwo9IagWMGlnZ/t9C+PAbqR4o0G7L6vKibaOkijXduY1kk5CcGbyuN0ZVEwBgz7F5NMzLcqR8OYRk2aWDPapqSzty88NfXDj2qMOrMBb/fWOFzyyDYfplX00HoYt30EkHVJoW3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfAXlj21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsmyerfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N8F9nC3649502
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szx+1GRX6XbUl0ZWii2s6yevGzmPsLcdlC5e68ikQgY=; b=gfAXlj21SyBBq/Xe
	rcFWjQVcNHGGa3F7SuhqZaQ+A+A556dyYev/qE5/Zu3DlQxGHy80QnvYyWL8WOeK
	DnV/7uXk5P8ordqyGnzEYjVOTxtEjJk/m51BZMBhzLQuqwFg8o1cgPn92jsPC5vG
	Lh3Ef55aGrmTCsGqKumopMgBJGGcc5q+hDrOavekJvfVHxZjZDpOFFvbsjqLeGzy
	+yS7nrtpo1iJqRcbfe0TzDazpF71Y/t98j25gL6eoOCuvTC1UfS0hvmw/atrVx9d
	NBAK6zYOeNteUNjTeUynDRqJGOKC6GrrGremvgDscdsAAZPCp5wgfqqQDNiAzwxN
	UScdOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nsmux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:26:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so48807785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769160368; x=1769765168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szx+1GRX6XbUl0ZWii2s6yevGzmPsLcdlC5e68ikQgY=;
        b=gsmyerfTCwLIn5RjDJZdKdX9yMmKw1onRVejvy/xhHy3U1BjA5Eiw56p1DUR5ieQak
         06b45mRPLlm/d/LDd8bbI6jkWw8y5SUYfcnA4OH6dc831jlsznQeHaGGSJ0eAvRIKMcg
         mMQi8mf1UhE96mDLvmxftpeGM3ygUUhjgZWwIdh/OKnc1HkLfecYy+I6kGToST32+NxK
         w0DQu+enLDhgLJPRoyupoEWPjGzapWZWKN1erzip8G8DNcyVXUwlh7mgSMZIbQNIxeTB
         N33c9/8Upq6gcK1ZlU35A+jveFccALrRrnjlWnPnEnZnVmGCDQLKVscft50S2xYJjzkq
         HedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160368; x=1769765168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szx+1GRX6XbUl0ZWii2s6yevGzmPsLcdlC5e68ikQgY=;
        b=H3QQjELY8th0Z8LnZuBbxnAOZSixducWQd5VQRASOdFzKP/U05tnbbBfR7yFYht9Ln
         bte4TI+WxDVtaE/9EJQ7m00Gc7lqwBUnOauais/8Cds7b2pf1tGFwPP9kQB0l/FmaujR
         n077WC1yc8EPFTNI4C6sVi1flD37m99zbp+GWYbTko7kYNiJD8w6tpY9LlEjTI8aVfus
         Fjbk59rZMDLZifwOJrGl9uXgLLxN0IyZlqwPfwnzjDuPfSWExJpRJhi3oYkbUWM1eh8F
         J9eQboLrlDJBsU1nqnxiXmmTBZT/MH4dCFfeBdbxUOQAsQ2xt4QapHwc9kMtoaTBZIlz
         qstg==
X-Forwarded-Encrypted: i=1; AJvYcCXPkFEcDKxV9d4vYptdUPPxaGEh1Z0MeR1ciNF4DI5PWNt0Y76dRjG6UmL89bhRMxuCvXoYUiNCcICWUO8n@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSI3r/SCMsc0VXMqoauu53z4AfDG0iMdRwrWdcL8wlNCvE84I
	8U1ZWNnJ/VU+ab+upbZrxmlSC1ZN//d9fC3bVhOpd8Nq0hfRBApudBfpgGatbF4oFh/6w/LQzLw
	mPfzxs4vNVXQ7YTeibsOCTrNgyys0JBhxRveVVhHiyXzdlKEn3Sp3kDnOx/zLkFN9gnXf
X-Gm-Gg: AZuq6aKfn+UF5WcZ+Pyz8kwSED00pUlYG5Ynn8jU8Y1BGvd7olft+V2Wm/Y5inrqKsB
	cDq0PrY7+1YXz2t4/6Il+YdZqCQQF7qrf63EJ058h9LtZl8ni/3RKb0EY4cI3JbaxupaGECWNzO
	cMc6L4L//U/ad4qfHqokXiHyB34wIrZ1ZVxlqeyF1QaR6gEI5nWFWK1rpxbuaqP1f49foeE5sTq
	01MbrPDvTFyZgDo+U5Jsvo6m88Qge53hm7WiH3xpAIZ6gq+yT1lSIqMJFlFitWffL2PsqpllnHL
	6ckK3Ekyh/uD8dfLPEfijNhDyYStlJVZUjjOzOVJmXB0xt110DVWem3U0khr8ElbND17nnvMjga
	p8mOkovjcn2z5bOfjbcFX9GdZqOran3988fcmt5ByvQSjuwN9gUldQ3T+csS20n/BnsU=
X-Received: by 2002:a05:620a:45a2:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6e2e1d328mr200642985a.6.1769160368429;
        Fri, 23 Jan 2026 01:26:08 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6e2e1d328mr200641885a.6.1769160367935;
        Fri, 23 Jan 2026 01:26:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b954d3dsm759623a12.23.2026.01.23.01.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 01:26:06 -0800 (PST)
Message-ID: <f8097212-6388-4c4c-8f5d-a91df99a18c5@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-4-morf3089@gmail.com>
 <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
 <ac83f41e-08ad-4ffe-9f0e-02f8256af65c@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ac83f41e-08ad-4ffe-9f0e-02f8256af65c@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8x0U0VLmdEMU-iTIuEPxBRGXz_ig3QX4
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69733eb1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FKD-OoraEu4ia8LkOS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8x0U0VLmdEMU-iTIuEPxBRGXz_ig3QX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3NCBTYWx0ZWRfXwjBJcixRBElK
 5/qLddSOVFu2RP5JlgYRf+s0KDStTzGh/SCRpEBFhgnV9LWZQ5Cu824yhEoEFvCD7vjLcxDY6sd
 9KeHe5z4o6kYMa18+PN9SRPbf8lw1dP4+0E06MvB5PxyY887W5tAM0sgidk65mh29yL4mV1YTiK
 8ml2gl3wMDeV6a1Oq+y3bpFhIw+2QqbTwed7klLJBBJe3O0FX4caDz4BNGl8IIWc2fSa641t8Dh
 m6r2m5X8h7etwPLFdBxoKlrsj5g5wRPut+Z75JIYYwFuJUSO2GCg/IDXgNu4LoEXIeodpTl9MxM
 vMRij2CEBpT/uwqZk8uUh+mwx8RkvvtI2YmSz5i2mYdWT9qa6Nt0uGeX9v1SWz4Y/SxqB8NIBmY
 rc458NCFCDA9N61I/FM+BTzz3/mt8O6JYgyiREUQh7e6h18oZVevXnGQg53tDDUfVCuBi267IVA
 f/hvIwlaLtnLaykPZaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[minlexx.ru,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-90306-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50318734B5
X-Rspamd-Action: no action

On 1/22/26 5:44 PM, Alexey Minnekhanov wrote:
> On 21.01.2026 14:27, Konrad Dybcio wrote:
>> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
>>> Fix regulator configurations to ensure stable operation:
>>> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
>>>    PLL operation
>>
>> The driver needs to be fixed instead, as it should perform a
>> regulator_set_load()
> 
> 
> Also change done by me in [1] with more detailed explanation:
> 
> Since the commit f05ab10 ("arm64: dts: qcom: sdm660-lavender:
> Add missing USB phy supply") previously untouched by Linux regulator
> l10a is now used, but it exposed a bug from initial porting: when
> booting with USB cable inserted, or booting without cable and
> inserting it later, board reboots.

FYI this shouldn't be required with the upstream driver, I don't think
the core calls .set_load(0) and RPM isn't notified of a current
requirement change unless that happens (qcom_smd-regulator.c)

In the power grid, I see (current values representing the peak):

-- USB2
VDDA (3.1 V - vdda-phy-dpdm-supply) - 60mA
VDDA (1.8 V - vdda-pll-supply) - 30mA

VDD (?) - 11.4 mA
VDDA_DVDD (?) - 35 mA

-- USB3
VDDA (1.8 V) - 14 mA
VDDA_CORE - 68.6 mA

+Dmitry poked at 660 in the past

Konrad

