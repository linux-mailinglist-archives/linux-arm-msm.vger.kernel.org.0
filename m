Return-Path: <linux-arm-msm+bounces-118434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 284RHdi+UWrmIAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 05:56:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4B7403C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 05:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MeFZfVra;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FijEtiKd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC796302EAA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 03:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DAE2DB789;
	Sat, 11 Jul 2026 03:56:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7EA284662
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:56:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742164; cv=none; b=KV0sjtJu9axNY/8I6pM5V4vrdFpA9msYWZpAWwnnjczrYQOtjpoVqDm9Rin0qxQLeuGhTLafvdE1G55ihdzBY7v4SnMtxzvI4cFF9kN5P3IxBZWAVHt59HDZ7w13yVy+WWJQj6UWBNWBYbVJwa4iuCyFQ66ueGgZWK587lHn4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742164; c=relaxed/simple;
	bh=x9Pa4CWmIaRLB3MyBULfiCaneJwv7lLfh8snhiBC/Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqE3V3WlHZ/hJtOYpwk493BvPXWs14dFJvU2dcZMQBR1MJXuDUSrJtfT3ocmu5u7eQmCTfnjP/szaRDqwNtYli297vzmeTOk92mzglwbxIJuZGJ5dGHdoLGlsCoO+ZgMOU9m9cfa3xQjtbgsEWiwi0hwNs0U2DcPLB2m6cvC498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeFZfVra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FijEtiKd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3tGuC2809327
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=; b=MeFZfVraUDHGstkM
	CuFXGdbiYvfqSJssyG5L/0FOToDtzJfODvzVn4PbjCY9NoKSARTP0RsVwal7oxLI
	W3IeByHz+iBxkt/hMCQ2Bwf023Ic121gHjr7d7Dz5CJvYlUtzbEbz6Ucj7J7+9Hv
	NNqPP6cPfR8W53D4WLwnnqhWYpRz3jfRl1q7ssn7GJpnajDz/JK+OYA4JcdmUg10
	mOdfJYt/gSDNKCHp5vIPOanU0+JuCfVhol8agTF6hJ5mK4ByNdAWBZTUTxqJ1qPe
	I868Zpa1EyftndfHnlpY8LP8oAkUljasFxz4iY1C0OLuCLRr2+T5SW4oTAdU+ibv
	rfpn9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr001m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:56:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1535977a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 20:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783742161; x=1784346961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=;
        b=FijEtiKdUse/UBxRNkRAFVVSW/9IpdKMTRqrn5s2Blf0iWg9ftEB8BxmEgJHFwJF7X
         LmeSMzASAY3ghvCay8zZQPTsjFc2BZ2civBVt5wQKpg7nIGD6y4jqP4WIlApGfv6y4Iw
         SubIESgPNpDlYO2qbN4lOfRQfwvuc3oAAjjzoX9vfmT3oo5l9MQpG7osAHrGsSGw7hq9
         MM9QOCndc4+9sdVWsVTmETBsLEozM4cPcN0nPxVQKyod71ZBDbL9oLODwm7dymgTDovc
         GISW9xBXWG9j9Q5pYIT+bxe2zwHlCsj3bepZzZIB9FgdkeWFnsQg/O70mVci+W1USHJp
         DxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783742161; x=1784346961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJBGuOWmLf6hP0jureBA7oAb8Q7pc962h6NOyjWbd6Q=;
        b=mTU9SuEb2b69jfHv+F3iwKJqVLLf6X9G2fexFf/YNHHlpWUrYGp+pdI8JTEVTKVu0+
         pM2X9t/VX4WolLiHmxEXqDCXHRFSG5T1hdmyi+5y7KFLBL0CdqAjuta9VTz0+vPkIGk9
         ffXvsI1bwEbmgjeeS05PiMJ8m8bP6TmYTw09TN7swGr5Hkdk+gVg4p+NxUvGFRrQFD0G
         7lkZ0nFwW+4xGybnn6m3ud2T3TDitlvSqjrIu5uGlq01ab/QenrGfb2oHahqev3fi50b
         rVGDSlsPeF2qdt8c96lxzQYzyNx6zGg6VK7g8+/Ob5+WwCWG3f1Fv1owEKUmKQarW7Ht
         jHpg==
X-Forwarded-Encrypted: i=1; AHgh+RpOnLpD1ech7pvW5zBKDkLWi8hRbiglWjvEgIqXRzwZsHHCU0BEeyTWevByhCfpvM51vba2aHZFMzxFS+Lt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkEaAU9O83QSBgtfIxMoRxd+cLpimV7T/rr+jF/YtDY/Tx/Zr
	DEZVyMa42bjhTQaduOQjkrGLR3zevcSRZ22Hvjzos+u1mYtplZK8xY5SA2XukaulUy0tl9nNMBc
	rDmG7oVjjaGR08FAB7PyUtloBcP8nAaAyTBXQOMIgkv6YKHy6zVVAlz694JpkwutOjxZuMBRJb5
	O0
X-Gm-Gg: AfdE7cmmkd7Z4x4SiO5NjMOcW1+EVGnWV0RQ15aHCb/qvXFZs1caYEcP1XTEzVzz+BU
	5C2R/yBxeB4vHHw4O8V20j0dpiy+158a1QIQ0/H1DXD8V7PJl7Uu6Y17+talwKdCFlCK94MBzoz
	+NgHeAXkqR5Rxio9TOmpGz3y2Lkg5gRkXJBd1n7iWu8oNvfRWc9vgLskwDaam+muv9EsTYJqR/D
	P7u0OzKKo51wDZnltfaqw7B8G7bHrzOLa+ROptMgNWUj/zDrv0km7Lej5b5ppEddK++16OXmPQF
	EjXEbreJHXqByjAm85uS6pTV6LBUIH1rdU0YEz4brm4ZE/4ArIQ8uc4vUdD7rqQa+PzlnkrBmb9
	XlR08vQPPFUGHD2gV9FXO6hnOvs+5CuIaBHAPfscIO4e+puk=
X-Received: by 2002:a05:6a21:d88:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c0f0ae84bbmr7014171637.19.1783742160694;
        Fri, 10 Jul 2026 20:56:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:d88:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c0f0ae84bbmr7014136637.19.1783742160202;
        Fri, 10 Jul 2026 20:56:00 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm43281978c88.0.2026.07.10.20.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 20:55:59 -0700 (PDT)
Message-ID: <a0ab70ff-ef62-42a0-b83d-be41ce8f64f2@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:25:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
 <airpBYZ2pRdNaE1v@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <airpBYZ2pRdNaE1v@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfX8CrTYstd8E6d
 cxeIVjoLQ55iFr9kR8lSYMQvH2b1iJ13N13HIA4oEMtv1Gj2fAIu6aw+t8nY8l89f8LlC/NpC/W
 UYHK/AZlvx4z+FDzFbXgomJkZxiwkPc=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a51bed1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhpSxh-dhdghoZIDTE8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: AtYHMMYTGxtAtwXCW6wyB2mEnV-ovUaX
X-Proofpoint-ORIG-GUID: AtYHMMYTGxtAtwXCW6wyB2mEnV-ovUaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfX5ETCpau+gZsd
 lxRly04bjgWXGeiXQuos6FkTfLmJoy+ktGpm9nK0qBQDboONE8f5GI9U9+gOAvG76qCI3OdAz3T
 qG+/LUhvzGiQJrAx7+seZEkh1kLyjw6eZLvhPZfBOrf5Aedsfk+GtJKJQ2oz9YLpExSGZgrK9yd
 uVwUr6oLe4JAU+d5cX4RdmmwHWiDSmYz+9HMc296koGnn0SFeXdHvB5foKRpGElqPqu5KVxh+j+
 cBoB5hbDaReHydPMPCy/4QjY6dZaMzIQOxqwgGmjLl6koqikKurrOXC0UgWplZsxrJSFbFKJfsv
 KbuYHeBloPTQCTTsVJXKrdvpF4DEofWrH9Ds2jp8cmOiuj4JINY3vDaGNqzIOMR9aca6wQXoNHU
 K5FsafzShH97CLA3++Lmyr6oJBIcNcYJOzNoOYHR1Eir7es2/z9Ed5bYjSx3c7uR92NqQeJxusn
 DFhlphOAc7bqXMH1Zrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110034
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFB4B7403C1


On 11-06-2026 10:27 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 09:31:06PM +0530, Vishnu Santhosh wrote:
>> On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
>>> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>>>> +	bam_dmux: bam-dmux {
>>>> +		compatible = "qcom,bam-dmux";
>>>> +
>>>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>>>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>>>> +		interrupt-names = "pc",
>>>> +				  "pc-ack";
>>>> +
>>>> +		qcom,smem-states = <&apps_smsm 1>,
>>>> +				   <&apps_smsm 11>;
>>>> +		qcom,smem-state-names = "pc",
>>>> +					"pc-ack";
>>>> +
>>>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>>>> +		dma-names = "tx", "rx";
>>>> +	};
>>> This should be a child node of the modem remoteproc. See msm8916.dtsi
>>> for example.
>> Thanks for the context! We actually referenced msm8916.dtsi during bring-up
>> and initially placed bam-dmux as a
>> remoteproc child. We then hit the issue that the driver was not probing at
>> all. After some digging, we realized
>> that qcom_q6v5_mss.c (used by msm8916) explicitly calls
>> of_platform_device_create() for its qcom,bam-dmux child,
>> but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform
>> device was never created.
>>
>> There was a prior attempt to fix this generically by adding
>> of_platform_populate() to qcom_q6v5.c
>> (https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/),
>> but it was blocked
>> because GLINK/SMD edge child nodes would also get spurious platform devices
>> registered for them.
>> That series remains unresolved at v1.
>>
>> Since your driver already manages modem lifecycle independently via SMSM
>> state bits without remoteproc dependency,
>> we moved it to the root level where of_platform_populate() picks it up at
>> boot, and everything worked.
>>
>> Would love to get your suggestion on whether this approach is welcomed,
>> since it needs zero driver changes.
>>
> Adding the bam-dmux node top-level makes it impossible for userspace to
> associate it with a remoteproc (for this purpose: the "modem"). If you
> add it below the remoteproc the udev/sysfs path will include the
> remoteproc and you can tell that the network interfaces exposed by
> bam_dmux belong to that remoteproc.
>
> As you noticed, having a generic of_platform_populate() for remoteproc
> nodes is problematic, because usually subnodes are remoteproc subdevs.
> Also, the cooling device use case in the thread you linked doesn't have
> any resources attached, so the root complaint there was that you don't
> need a separate subnode at all.
>
> I would just replicate the special qcom,bam-dmux logic inside
> qcom_q6v5_pas.c. I think the motivation for BAM-DMUX explained in commit
> 59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform device for
> BAM-DMUX") is still valid. Conceptually, BAM-DMUX is a subdevice of the
> modem remoteproc, since the remoteproc is responsible for powering the
> BAM-DMUX hardware on and off. The fact that BAM-DMUX is not a remoteproc
> subdev in Linux is more an implementation detail of the current Linux
> driver. This is independent from the model in the device tree.
>
> Thanks,
> Stephan

Thanks for the guidance. This makes sense. I'm preparing an update to
incorporate the DT changes and replicate the BAM-DMUX platform device
creation logic in qcom_q6v5_pas.c as suggested.

Thanks,
Vishnu


