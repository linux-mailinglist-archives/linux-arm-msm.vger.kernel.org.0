Return-Path: <linux-arm-msm+bounces-103252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMO5JIxW32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD5402625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CA5B30DD10F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF64329E6A;
	Wed, 15 Apr 2026 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgDWS1O3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPpCziYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CB26ED41
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244285; cv=none; b=t9aNOEZqtcmWbbhg5T1rYbEvJMQOReQsashqYn98VpzXIv7svBynpUoCpc8Dz7P2Pmt0W4COMLCbNOj7gAtnr9+AWZaAFAVPS6HK+52lW1gb63BgRTuw3ltfJ+h6ii8qfJP2jmgyqhu4WM2GLiZaJcmqK+oVPRB9knYzTL22YHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244285; c=relaxed/simple;
	bh=dB71cS02rGaAgGn28B8tA4wNBVV9+p9/5LSguSgT/04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qe6RGr0S2CEcp/MpIuOrZe5YabA+HBmYFGGwymRQ+llqbpuV9cdLjMMu0t6Q8Pckezexb4gXIEFkIoRbMQtwWEQ8PLou7IXc//WKpfg4tZMMK0k3h5AS+XMpE4tFomXAZrrue4usLR/fZxdc4m/uvQzp6KUZTwVeShioppYG+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgDWS1O3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPpCziYA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tZrq764384
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=; b=XgDWS1O3tacqbPWg
	AzmbYyVieoFFJT56jRs7AxuOnS37mZT8DynU5g/C4mLIP7gVjYoE+fZPMrnia8hu
	ASMtmf+R3N5CHMdVYyzErWSy/ylJcGNC/gGW+8bnsLYZf72vbUNC52Awvz0uLnu7
	k9DlpWwgLw8LDYQWDNlA/GNM8t/p/Gc4XT+ZeBRsUbCHsBqowV70jDEYJHKIiKjJ
	CiltXJRXcM0sv1lgNM5iAHbYFSqochCBhQnwOA4F1pLASvHWKRyfkQloPGJ6WiNd
	wI6TNeJrEO4t6/ndLrFT9L/ekdP9Rv4Fd1H1++w13veDWeFTw5H0k618+7AxG3Z4
	k3Q2TQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7raq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca8a79f42so7607296d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244282; x=1776849082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=;
        b=XPpCziYAjlv7pQ9rzM9BOLyV6hMaSZ1/x8FEkK+umOSqXOFIDsdreWffm9CGZX/Tb5
         BU6dE4Oebj5Eqg9618O8XJQmzul3xdHRxee7kYcmpjqsp32FzdlvhA2NJuktShGjV8IR
         DqvhfrsqWZ5PK4/kFWe2fhpX14B4aM2eqaGQxdjsqCUpntGSoHM+0eZSczpnSfvrUm+K
         H4MfBe+byEy0HRxoYTlY30dvJMB2xUg+ZBiHBzMd/dGXBEKj15wgYJPA3D63Ad1h3wNe
         bh0j5Oc2cnAJNMvcB35VhG0pvaSxUKnLoQ1dUOeKb7paQl3AoF/5uEAN320sXsjeuCVd
         /JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244282; x=1776849082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=;
        b=KnvGPXyZLTBJNcKw7m7KQ+AMAKO4aLQ393GyIZfqRHcV3eKE3EVpwWTbjv47gfbuC3
         0G0+fBZh8Cgt6v4cPDYa2QdSYS+MhsAJ9LdmdeO/wFStihPsZ1uc44Bv1+dyfsDsQIuV
         mkwh9ymr6IgLsmHDK8GXQOUvZeP4SHuZ2htfJ5nN+dmf65gKalugk1/JfZdp7IP/LVFs
         CSR6LjLkfTwv8yxS8DSP//74tcG99FVAdZ9OEjWpTJXDxKMB8DajtabrKdArfTkl59SI
         CG+t9BEKQv0Oh8xelM4ocVTy3D3tL4IBTypTi3MvQ6IU5orFcj1whVsqJtNkmLDtvO9H
         Ey8w==
X-Gm-Message-State: AOJu0YyW2tsisaOc8L7iHsy0x9FpHCiiRRIGVEmOTQ6YytHesjx9CfOt
	vABebMbEbVy0brVUyqfs3HCTJzb37YIIkD3cakh4yr9+UsV/fBhoQLU11KeYr3xOpA5bshK+5km
	ahX5/rRtyph5D3C9ja3jqUeqKqDMb4zdhJxd58AySIeyRXCMDlDyvZ7p6H8UIoc8lIJxl
X-Gm-Gg: AeBDievYy0gtokUA7Ldbd4Fay8vkehx8hLW4eZmlOF5++0axhDMzEtIQmA4urneyCv3
	2LPaI1lfqYsGORwxm5z6l7WDKug3yDugHDE5rC+ymlmN/vGtGhIbJ4jGa9B0guVadNGz6OHBjZU
	DIw2tl2vJLU0VPqaMSX+nGLFEDsQRjnvjlhsrvJMuQYrPkcB1tvchXEAcbroqNCJ68XCiTzbv9/
	UZzjxpX0i8/nADrSn5kh4e/6PZgZWd6t5p/m1++WlkgyWHLn1qp6B9pdipK5hpJNl7r8UbRkewM
	o4VLkKDVetTiC+pMaOjkYDIYB5vENl/fYsgVRD5vGNMYdF+sSad+6DfUcSvCT07jowKHFxfE/6j
	U8Mq7PWhHikqM15EbU5SwZOuMoXrBX7+S/6u3M7qkpFil0WrZZ6dHXw1/kN+Ca5kRFfjQBC+i9u
	dV+npLuflq813Lgg==
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr19120656d6.4.1776244282070;
        Wed, 15 Apr 2026 02:11:22 -0700 (PDT)
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr19120396d6.4.1776244281562;
        Wed, 15 Apr 2026 02:11:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177dd36a5sm35601466b.54.2026.04.15.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:11:20 -0700 (PDT)
Message-ID: <2144514b-6b0d-4d2d-815b-8d785ecb941b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
 <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df563b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nUGnURic63cDoyuK1-8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: AwI2UzyTJdKmLVYxvk2C5DUXORKvJ2mT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfX3267Ojc5rfyl
 p+A9FZqoc6LK9d77UohA5aHjXESZgF4bD4cRVAEhJpzmK9RxPkArcefOYhqhC+wMUEo5TJ+zfXV
 ikS8IZe1ICcRKlckoRgUa68F8t+fNV0wNUvnCr8X2kd9LM5h27VjSzYkat0ixRyTrP+NMR1/pEU
 wHBrz4G6zn48vhy5sJwModEsukr3S8VfDTXl+Ltyhe8GNuXmpmOu5li7/H7A5c+sgh8rMRmsXFx
 OyElbMZrntngamMsIN3QSmlesdcC5yleZFOVFEqcruo4T9Mmi3ZBNzUxGJPm6Dtfb3u1rcalX7m
 tbwMxL6nqNWc3MWFiLe6r2bOP/1jr/h1lbmP1QiWgE6coqNGfxQau/hRbSXw8nuUwfGrq82aNgc
 QWCsvbOov+da3zmhM3r5XwAKTfLK7Dg7az9S1h0rYG+pJULLFPSASGgg/ub0w3uYICflgkpKwqQ
 M6ujNKrhgyC0w7gx4yA==
X-Proofpoint-ORIG-GUID: AwI2UzyTJdKmLVYxvk2C5DUXORKvJ2mT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103252-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05AD5402625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 1:36 PM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the sm8750 device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

