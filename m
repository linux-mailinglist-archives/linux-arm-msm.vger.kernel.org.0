Return-Path: <linux-arm-msm+bounces-114485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qwI+LjL0PGrDuwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AC6C433D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cxmVHzLV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BP4AcaJH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B5D43003BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9D9383998;
	Thu, 25 Jun 2026 09:25:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E038238C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379551; cv=none; b=cKSDFX2zKlsTspKJSO1OsANDKhr3Vms4AB9JGvfOFs0/CtscpfhgQU4W212DPGzqLEAIEw8zx3g/iInM+gMD6fDow09wls17uKSvNigd9AwtWMAbs3Inauqj5uGdQ+kMTdTDSTUT0YgCmDzwD1xBe4s08veFAzsk8dXYip0ipXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379551; c=relaxed/simple;
	bh=mpqs54Wb5shBS/1MAClimQNQaHc1nhhYLU/Xl3JOkHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XndhTeZ/TjCmKjaqpAlU860vjgHxBg+EcD/hMMNwfPmnSSOTxzpNg3LLgUYiHn8zWw0dYoehKuQPYMlkJ1c3t5pIstJJ+qp8k/dGALMsIbbgrrHtuxmivGV1EJ+vg3QSaANfKKP6UY3hSq3VLRF73Y9g9K/x+fdzd2egoHisMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxmVHzLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP4AcaJH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p6PD1920910
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=; b=cxmVHzLVbVxqv9SR
	pOrcNXMSMu8tEkW7VVjQAV0cvIvv37VromLCMWh6LStSx/pj0xAlVShzuP/wQqJh
	nDTrhMI2EjO2Hy1HVezp+hGA87fwipXtiK5Szx8TZB0/5w/haZvevd9GeWdMf3sS
	BxY1mzVI70cgtu3hcwolVfioew2ZekyarHUtaDL10CTZOtVR1i/93ap2towlLhee
	qDnLY6KK15UumKr9b/8fPtggtoDTEVxC0XZ1WilxvF8C0Jjyw2CwXFeRy932QKdG
	SzoOycVYNqMCbKi/hVHB7Jjk72JGcOBA+6u6TfWxtEKL8s21uzAmatMvhJp5ynhO
	KLKXTg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhch3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:25:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c90101fb3deso1308684a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379548; x=1782984348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=;
        b=BP4AcaJHPAXNZphiqPzXbG1X5Jd0PMTgLmvbTDKPitGNRsVZxHyZSUujxBs8VezvcC
         fLgV3lCORCW6ej2A0F6D4/uvvnYgNo+RebdVFOl/BtDYzD+OIIgxLtkGYEzv5vZIXecP
         H4ohY4p1CLyEcjnkupuxe2L5tep29QfwCD3T18vvDnIgMV6xp+zH+PECD9+iLbnyVpNa
         Se7eXdRpy8aV3CHPGb3fEpTiCA9lwaLkmOC+qzKhWeTSfMxvNUiF3fIc8BnoaRznhV4k
         gi3CZMamWDgzAEvjiUI6CDJR/O78Pvqk4qE/D5e9qptcc+vtJUja2/GZxNmSge7nKEtV
         3lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379548; x=1782984348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=;
        b=NfowxA6kZg4uAUSGb+K5elVHtqL5a374NF7BAZPkQQwfXhCsZtAT++kkrf0R6cBga2
         oTX2ve9pqlp7KYn6MrR5qV5cTw3zIaiTCbOzBQfaJtZksTSzZWFbOwM/A8AR3Bixwrqw
         OKRG4byObXoisc2c3RS811iaQlFnxLsr4HIqPBxmNLcg14lEqrEuhtkXQCUWkQLvKQ80
         JZ+TrqqWD0xdY2qLviba2s5qPJSFboN0YnpiEa7oITwP3iNPMQf2jQCFRYYUGMMEFWir
         rztfqzxgLpAfPIQfm/+FM2TpfIMHt0sdjcmq8FZaCo9Ss50JCQoamxC3fkyAJHqAmV3r
         kd/g==
X-Gm-Message-State: AOJu0YxiO0dLGUwSqz1n9yD7EMUQyGAVhsFDcwMYLswroSfbryLGzap1
	Dmcvsw0MgkfJP0n+eqfIBLtETfytBjPc6fxG7UIEuDuVFbNoKZXl8sMEUju/SWFto8EFf2BG6hl
	h5LxkPyYJQ2RYQRTZVOTTyFUU2/EeXNdpiTEUfdosoJj12CTzs/YO22VGx3LQbhuEqukF
X-Gm-Gg: AfdE7cl+nf1oxZP10cTfwIfZSm0qPWI5py9pJdjmg2P5PUU5SbKOiN8HQIPrZ5xlfxT
	+F2JewJonTeFVlLRmRTVO4DqnU3yKuf7pa3jCZjmO5MABlU5N3UT3iokurI29BYWKnlYIQC6t7t
	MdeLGOt+VGRnHhGUeLJ6SpVGUnPiJd0FjJIAt4lSyYg5nc4rrVp+ouRXWlWVjH90HHTuvdh4ySA
	eavTe5ELu7VKjHi2U6NszigRJk940WTrn3Lf/CdxnpaP34SdcCN4yYtENopICgVGOV/vNrbDCOx
	rpwEAvUf0TeIrPBQo0TtiDdW6hNKv6S3sdeqoe9aYTkoHB+M9fIdd7rpq+vncQuVFrbANVubLgJ
	ziHrH05BWn5N6ZJ2xmT0gFU8hmeV/jeE3sH8jdw==
X-Received: by 2002:a05:6a21:700c:b0:3b5:6b5a:4f30 with SMTP id adf61e73a8af0-3bd4aee74acmr2233240637.6.1782379547884;
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:700c:b0:3b5:6b5a:4f30 with SMTP id adf61e73a8af0-3bd4aee74acmr2233205637.6.1782379547449;
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96eccf8sm1374242a12.3.2026.06.25.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
Message-ID: <ca904fc2-ed59-46bb-bf33-931868af0a9a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:55:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IVS8fD0gLVYpktgoldGSD9TwVjf6eyxj
X-Proofpoint-ORIG-GUID: IVS8fD0gLVYpktgoldGSD9TwVjf6eyxj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX7CBULwMvAnPK
 AQvsJH8k4U//hkuD+o0wyKGSF6gE6C1bAt02bMw/cNHWDpXEN5nzH9hx1irC3zjiGoWjJ0XAx9v
 3tzU9tuJAk8I/ZMONLD7kVEix3p3fsQ=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf41c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=i0GMp8VCEzuJnllDaPQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfXyMI0LYvJfGRh
 0zYtquVozq57NJcgW9ijVX6ad50vfxdBq4gHakt4TgTMmPUHbWYtkPdB9CTr7Ie778MUxifXWRi
 n+6aSYwzJXsJ7CcS37Ix1ekPeFjchi6kWL50W+VV4yEda4UylP9eAJmvdp71d8k/x82oJU82HAy
 TR2m2NjVOC0lx2RKqDa6wCyHPJiPciA+Q5Epwib4wEKm8sfQxEM8/TJ5jk7xxFvcbfuq3qcZ3Xf
 LWCFOAQJqjEn0hJF835hErn8ALr07HCgDb1L1S0PiyamG9PNssy4jInPzSSZeeKlx8Yjw3PfpT0
 Up+aU8n/hx7zCkpFJk8FBdTzG7cL3vrMg4up6555kWSWxxLLvPqT95RGkx9LKaUdHeAx3EfreWH
 2W9qIZn5DvzI2y2p7Sz8W0CCEY8gcPOVTjPnGSMW7x7PW4pzBaT6eG8/bGjQgdGiINjhG04B5v5
 F5HB4V5fcgs1PDuGmbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114485-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF8AC6C433D



On 6/18/2026 1:49 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:

[...]

>> +
>> +	if (pdc->version < PDC_VERSION_3_0)
>> +		return;
> 
> These version checks should be unnecessary now, given the function pointer
> is only assigned for hamoa
> 
> Konrad

Yes, they are now unnecessary. I will remove in v4.

Thanks,
Maulik

