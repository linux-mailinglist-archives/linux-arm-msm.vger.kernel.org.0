Return-Path: <linux-arm-msm+bounces-91014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHuJF70Bemn31QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:31:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71294A1485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C18630028C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6458634F24D;
	Wed, 28 Jan 2026 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnC5nSJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsdCp/J1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296922E8B98
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603511; cv=none; b=SsfbG12DtvhicZVUitATSCxgeeR7vPQEHoRowXNabUFVlueDsTu6b1hTORSkulu01Hphbx4iUGjW0z6U8MgEOC/UmP9FMaQdpRQohxztGZfHBPeyzULPgbdFHmJgZT1+JS3SLnx2+iZ3l739tbpXQakqWDcy7LnlRQKQZNxFIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603511; c=relaxed/simple;
	bh=tYo9u5QXjBzdVOM3n8bZ3egw7knCKbpodAuAnu7Q7GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3aQBgNnEDDhllRQF8YrFG0qz34tPwgi5ZEfsofFaJzmdIFF+iyKEL4EwaJ6aI5oUImIfduB1cgOMMeu7sfFrtPtwkSWZrJ510P81n5gaHVJYojoSu2+94uU6NpshY7Felib8yvzmPktaZwlvRxgLBD2guyu/3kduXthyyKnLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnC5nSJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsdCp/J1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92XwE4008452
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka7Tv0bzP3IlquIu30uTYsQNXrdKO9r+dm+vThfXYg=; b=DnC5nSJ8xHw3Ls6l
	sXORxqrp+LryKufJnflxjHf2BqkJQApT0yFGEkOc2TgNgaCFKBBiB+RmnPh+vFfr
	m8QNZpu3fw3m1q4D5tTdW7ZdhREilMz8ygBx5D41jxRPfFjDPh5OlCEA4nuy1Tno
	K+b/fFKK5w+jqx8JmwHQ+0CT54OsFu9J3QkP8S0uOuVnYzeqasm2GWYrRxOFqpg2
	cPSETPHXQqNGrw1fv4Ooz1JAs3in+f9Waad5FOuJ+H63yCm94mXyfF1mZ3EzMlwV
	IHAf4z43fNvgrxaQmfcrCiDn98nG8Rfo9MUYAMFRRO+S9/PsRy/7xHBDqDBf3aHp
	aSAXrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx3fk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:31:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so56153185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603508; x=1770208308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aka7Tv0bzP3IlquIu30uTYsQNXrdKO9r+dm+vThfXYg=;
        b=TsdCp/J1GaVDWihLD8YrFUgb6PLITj0CbdhuCZZzDCuT5Zplo7ZTN/eyjbNvEjqqal
         K0u8JdjIBLvWmfGwkTzK5H7O6un/sviu4hYUxMNoIqa9wZyjXAoeu/nLEAVLTq4RUFZY
         8HUPxA0qVYOMLg7U4qO1iU5KPuv/CM5Up//eg9XUa76aNadOwLVDL9AplbLtfiX02kCJ
         PNVLIzofODf+QlQBaWOWwkqkbQIiQPjXdfWjB3gdKemQzw8sPeWJEC2m04DG+GfJAmkb
         80SSIHcFpt8g+IIJ/9IPtKrmemXMvpNExW6x6Gas7NiHn9YJqHrjj4FVVqg8NGmmCD2V
         Dc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603508; x=1770208308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aka7Tv0bzP3IlquIu30uTYsQNXrdKO9r+dm+vThfXYg=;
        b=bHRvZme3140T14digJReVZM5NrxSB4HlzrdUIdGbgwqxtwi6RRuy+MTOnw4P4mLljn
         R3wD6+T5XY5vu9SSfgPPHuPw5Ylfu+YwjaTbzrbxG11LGA60IJwsH+O/iUdlU1rmTSsU
         gf4OkYGOfu42qE249pun5mpQlSLYw9hxCOEcY+yVFYy0V35dxHgCpLR8aWfNt3pwgQCm
         fTa0M+uKLavSArqI2PSiXVswV96kIaWnfF+Gpp7UTRphmkgCOdRz6IXD9D0d4Fbe7D7f
         ov2wo12kxBhojXbUwQJow38EmJKMUpdhGtjsEBRSBKGA2L87tJvLdof4fbJogOaon/Or
         9PEQ==
X-Gm-Message-State: AOJu0YwjzeGeKSbK8mtd2y79shPeCwPamGkjlCYO5jaZmBT8s4+4bs5p
	CvpsLsMNeZZbK+zn8XI84o9riHMTNBVri+YL7h8aTQwvdPn1rNndw+8IA9OhhtqB9I/sHNqIl23
	kyDPUjaaWuN+aMOCWhExX4EiDaKUR3AWvw96wL4USiWU5vKBeu/hVpQbOFG56cNNPTUXa
X-Gm-Gg: AZuq6aLMOPT3Z6SpoD303vQkrB3q52aQdleNe0AvOMZLSdePxmHHb2uuIQ5EH2RBlpq
	IDFzIbART8SCdWOKiIAOY8J+ikaaoACHmtgfJhbU7JSy6jW4peVLU2ceNNoINgrOjmH3YiaIhfk
	thLuBWzUbUQhOcc1aUpJtsXfzoUcYK615TUjga9BFdKy9GjsHvLMU2W5zysqccErPt5gbdAyD1N
	2/xdRjBrmz3C0OW7dhxiiwoKFhCbsJJJRwqu1Kj4MhxKZBrU2QBU7X18PXLqaqg4TdRC8+mVtej
	P1wAb0dsgxjslZC50cYhiOcMzc9Mi12nXFUZB7U/zQg0vOZ/x9O2l5APufaH9pLDH9pGlEFp32F
	r0FNJqhLOfBmVkOiTuqxH4nvaih81OBZRPLuNMtch4Y2deBCUhbNkIAj1NYimlDHr43s=
X-Received: by 2002:a05:620a:4508:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c714b440e8mr153438585a.2.1769603508300;
        Wed, 28 Jan 2026 04:31:48 -0800 (PST)
X-Received: by 2002:a05:620a:4508:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c714b440e8mr153435385a.2.1769603507851;
        Wed, 28 Jan 2026 04:31:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm117532566b.38.2026.01.28.04.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:31:46 -0800 (PST)
Message-ID: <30e971d3-90ea-4f08-bc5b-ff25030130b6@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:31:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zcl7148oPnjoLnnl3RZ2iL9IhlfmXg0S
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=697a01b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jU-KX4cHS3eJyRZ3RZEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMiBTYWx0ZWRfX5brxcO8+4i71
 fP64r5bppXOg1eDVIB23pp5PU6anfhfLpPv5b6Mh8js+6c8iiRwCeAbinQNH+E6lc/LVc70oYjB
 4yopRrGfMBBiPntH4y7YR/11sOIkHltKEix51PfE2GMSByppJdel/NkDFcJDlXhuvA/VROOvp9x
 oAW+dejKYci+am/+ograTPlbtxc9dm5NyYjukfNGGw3y/ifq5RiAl8qXcM0ygNv1p6bxgylsJj9
 DyVS2M3cfwrB1EZOA4tihik/r0Mg49LNcL5DoymOvGE9GYl+zFrIi759+uMt0vtoGRDo5PGkdYK
 BS3bjWdC/1BIGzLGPOMne7URycolRVcrOboJJxIDIYblesf1WCMKyNuBRJChg6YOGQgBaiC0qCo
 eRrAiiYHTSDBvbVrhT1U/oNRjVEw/kzv8WoDkjBu9Zu5cBHiYE2BKOuN4qeNHxB2Jr8aIBTyizB
 zT6aL24khYwDltNLfGA==
X-Proofpoint-GUID: zcl7148oPnjoLnnl3RZ2iL9IhlfmXg0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91014-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71294A1485
X-Rspamd-Action: no action

On 1/28/26 1:22 PM, Krishna Chaitanya Chundru wrote:
> Currently, the driver expects the devices to remain in D0 across system
> suspend, but the genpd framework may still power down the associated
> GDSC during suspend. When that happens, the PCIe link goes down and
> cannot be recovered on resume.
> 
> Prevent genpd from turning off the PCIe GDSC by using
> dev_pm_genpd_rpm_always_on() so that the power domain stays on while
> the controller is suspended. This preserves the link state across
> suspend/resume and avoids unrecoverable link failures.
> 
> Fixes: 82a823833f4e ("PCI: qcom: Add Qualcomm PCIe controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

How does this play along with your D3Cold series?

Is this patch supposed to be applied first?

Konrad

