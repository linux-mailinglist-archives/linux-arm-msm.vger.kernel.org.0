Return-Path: <linux-arm-msm+bounces-109743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEZpGpBQFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D775D1E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1C3B30095E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266C93CC7CA;
	Tue, 26 May 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+EDbxL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtVPzkVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7928640C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781766; cv=none; b=SIVaEEOfRCrtK8lF7Lj89rba8RmraL8ItUD5rNHvlOmv9Mc+lFNOLuiW/7obhbyrywBxJUy9HvVz+rqg0txSaJMPePt0yFDiircKm81jDeCmEUwtr7ELF8H+ZEQWOli37MtMRfit8XkUQ+5uNb7bF72EZ/nceo/oOJmFjOvzkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781766; c=relaxed/simple;
	bh=dgyik6Nac5Zyj4S60k8sYpqDxz8bAfLXVWeCZ5FZtuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNubsFcZunJTV83RQJolwKnZ+20swJcRxWmgHBJv/u4Zl+3hxd76Q3UMgjrWEKaJw7qUNq4zlx0mVN85ohiL89k7JXk8LwcH+SQekozQg01o7StFVxiDYjsuQLtmC70B1m60LsmR2keaTnuTAFtEvfNZaFl7LW3jLVO+/htqk1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+EDbxL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtVPzkVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5B8KQ1802781
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=; b=Z+EDbxL3/aqPqMSH
	cOWTz8l6A/WYDW2/T5LOyzOondOOUAkySONvwI/TyrTf1c+Qu4eumtKRAv2BnnNl
	qn/rRGdSHrDVTbOtrFBBD/l81xj93bvhvSoU5/Syjo/3fFp1kzYn7Zhp6MKiysWZ
	Wvc0+1YBpYzNQR9US1OoEfkOFyZalm/Va+aqnq0P2hMV8QiPVTyytvNah12DOZLq
	53ydDWwVZhgTwu6kH8Nx8GTk+2CHpi4gNNdk/kxwFl3Kdc0wLZxDYcCigqQMlno8
	NWLAqyHaTCmLJN57iXcFZtUgDW+tFqktDx7BL8iMMV2XaC0DXbCCi8A6tyfgFltG
	IoCBHQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqkm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827adbf00cso4546515a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781762; x=1780386562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=;
        b=EtVPzkVdkjHqJZcL9bbF28omAGA53HbhNP0yPnkA/zmHd6Eb3LdPt1cxaWyO9slGBz
         2uPSrcyFWle29P+SLOnFzp24+IO9Lirvniu0VC19NoFmGRExzuU5y8FXYU/ew3b8S9uh
         gt9HhVT1Ws14jlNRjAeZyK+WNSoDSI1Z+j7B5TEjAhDXpX3H03631l0V2s3YXxm1Z7KP
         GyBRr0MZVhNVEbz+Uge8swf0U4IdKVpJ9SDN0NX1Y05JGhTBs8U8Dg+kTLAyG+ZHuXbB
         GmZ7DPGihbEep6pZqgJJvRXagv3zGQDpQefmbz7Qx5psskKeYd9vTAslvEjgigShi/ui
         xZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781762; x=1780386562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=;
        b=q91Hwt+OJ8syeGG1xDuqbYCUoL5DUmIxkFM0FvBlO6iplFJzn0jNhw+X/pFFnMo9HF
         vdge4BbqNcJrAY3xZ4viNw2RjvpAnWs7eMBLjSt10TudzfR93zRZ8os0nHfWg1VzXQcQ
         EcceHqhqtdQHVDsZOQo3tW1w+EF7T3P2QssxHf4eO4NzGls79ujtdr/YsNiqKGWwH467
         5DZ8+chvNBykzuhX05Qhd69tpK5pst2NGbwqGs23+giiCx+sm9C8BpbPmbbVeHk5cGBb
         k5gnDrFUdtjQBHS6t8SjFn6VEQJ9wVFYR0dhZJhA6iPxtEczO4CBJ3OvrpfxGiuRmfkj
         TKOw==
X-Forwarded-Encrypted: i=1; AFNElJ/A2/Hm3pk5pxUOzQ32t0vPgLGweY/g1epK2bD/2iZCrrpB5WeWpskx3BGfZQn59IdPIdPuYbvYnw4tuZBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QjK1UuZRTt7CjWzgDsa/nRuZvVb2/wM63SbbSn2+UE0Ezr3w
	n1biwooHzxsiHTrP4ZEGsxx6ynItmD3v4vuERobLSYM/OTOS9O+6sJsPg+E1ul74XzJj+8fKkxJ
	LLNCnknvrmdgkMqZtLrKqp7PQeFP8Z4t+z/pKWsoPNDCf9fhmf9XW7FAYa73xuTvDWcjO
X-Gm-Gg: Acq92OHzSVmdezzYu9zk06h+CBsCbQr6tDPqs/Dag1EA6JavzE11Z7xWP+WGfOrToI6
	JvZc9zA9+bVnldLgP35xRnwsOXwGDhtmRjlol6jgFLv8rWt/6cHQdQAOpj2g6fkDWO115p2ckxg
	YOFlKrVcbEDeOkYaiFly74fMdybRNjKmbXKG3+5madlCLTASRvb+v+p0tzn53eWXAd2szX/W14d
	8qVY7F9HmX77kRh8Ty80aAzyutJsbPLcRQ3s0HIWF7i9rx0gE6gE3rXxCEiF5W604O9PXSu73uw
	NfJ/ONPMzsrLLNvdPrpR4Ero/f/02jDGLZycL09onoMtXkbHDK7k6jaKLrli5hLlNRSCzQQwIJk
	kYEKGALaQbNQeE7okw2d8X+/wO4EkV+eRe+hFI5PD1bE1vuvbL7Zfa5hslNfr+1YlN2mKzw==
X-Received: by 2002:a05:6a00:6c8e:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8415f5a63f9mr17116188b3a.30.1779781762366;
        Tue, 26 May 2026 00:49:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c8e:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8415f5a63f9mr17116150b3a.30.1779781761773;
        Tue, 26 May 2026 00:49:21 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm11934235b3a.41.2026.05.26.00.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:49:21 -0700 (PDT)
Message-ID: <75a9fec5-20b2-496f-a365-2b1201fcbd60@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:19:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CDSP Power Manangement Driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-precious-notorious-hyena-7ba95b@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-precious-notorious-hyena-7ba95b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a155083 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uzc-zwSIlv-cvvK2V8IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: riisEPnE8GXxfrrh1dhZS8p-6N268m1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfX09ZtdViRPpwc
 0kNB/JDuW0fHoytD/U/lRTG07OL+IomuW7PaDRJaiHBuTlBXXBK7gwQb+H3jy3QYPLMc0NOhlix
 ZF9JjnVEzXS/YzQye5AIxzAg2OPRmjx7WS/B3p3BKA+FaMzKul70KkAxepAEvBTuQmnSM2TkPbk
 H4Z7lk+DFVNd+7Y668GYL4F/rtNLVK/sMvY4dpzeLpvAZ0Mk+Zu9YHBl7UBZPcKNrWpM2I1krtb
 BhEp94teWitkU/dQjwcclN1FcfSkx+RWPKmTS2CmwEE5z228Qxs4nTtbeb16Ql15F9VfnzAI26C
 BRjUBAVDqaz++uIdWmPZQrRqZtCIjtPSKm9ggHVGAmlh2Vbhh9KnTjLxhpk4RTGU1GP5Vk2aOpT
 NG+KgmSzYmfJku+s8RABGFOJrPU7/go3M10uNYZ7Jkve9RRLfjdNlCF2T6J2RL8bpCE5lUg+LYD
 R9+sJIMF2GcfnxZwf9Q==
X-Proofpoint-GUID: riisEPnE8GXxfrrh1dhZS8p-6N268m1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109743-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61D775D1E7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 4:14 PM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 12:35:08AM +0530, Vignesh Viswanathan wrote:
>> On platforms like IPQ9650, the CDSP subsystem cannot manage its own power
>> rails and requires the APSS to handle power management on its behalf. Add a
>> platform driver to fulfill this role.
>>
>> Handle LPM (Low Power Mode) by executing hardware isolation and restoration
>> sequences via MPM register programming, coordinated with the NSP Q6 through
>> a handshake protocol. Support both FULL_PC (CX+MX collapse) and LONG_APCR
>> (CX-only) modes, detected dynamically at runtime.
>>
>> Handle DCVS (Dynamic Clock and Voltage Scaling) requests from the NSP Q6
>> received via a shared SMEM channel. Apply voltages via the regulator
>> framework and write responses back to SMEM.
>>
>> Expose virtual cdsp-vdd-cx and cdsp-vdd-mx regulators so that the PAS
>> remoteproc driver can control the NSP power rails through the standard
>> regulator framework.
>>
>> This driver functionally depends on [1] for bringing up the CDSP on
>> IPQ9650, but there is no compile time dependency.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
>>
>> ---
>> Praveenkumar I (1):
>>       soc: qcom: Add CDSP power management driver
> 
> Power management drivers CANNOT go to drivers/soc.

Ack.

> 
>>
>> Vignesh Viswanathan (1):
>>       dt-bindings: soc: qcom: Document CDSP Power Management
> 
> Neither to bindings soc.

Ack, As per Bjorn's review, this CDSP power management driver + standard PAS
driver will be a non-standard implementation and I'm looking at moving this
into a new remoteproc driver. Will address in next version.

Thanks,
Vignesh

> 
> Best regards,
> Krzysztof
> 


