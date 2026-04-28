Return-Path: <linux-arm-msm+bounces-104936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJBKNSGH8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:08:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12848240A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9AA731C4BFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A66238AC9E;
	Tue, 28 Apr 2026 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk/a7l16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIIkcAmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526E38239B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368391; cv=none; b=ZplskbvplPnGKl1LZW1ydr7Gn1huyxHuU0VkKbn5QrpWB9qMLsQ/xShyBBgAbzPYWfD+/gwZ9NQgY8vm3TaaMGsLpeMbtYXPA6FG+3Kr5cdpQ3hzZyOvFak3x9P0C2wllw0LrikVMoIlY5yA8v/vrlVX2V/r8kUw9M8m7BArbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368391; c=relaxed/simple;
	bh=Eg2lG43N/VHS8i6b4DH8RIP6IFimeVpvYdXi48F8ha0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6hSyMCYChMLTGAPQh3pKc591lsbFOyI6oiPGmKZ7z8X3ZRABPdNXu5/J1Z9O+sB1CsRgnH5MQbgh5FhQ2zX0UU7kM4vS0E3Puc06P5X1JURO/i3MOvJYUYc5/HOqlb/MTJr268tHbvO+Vufn846o2T1ADqXmMeea6boXLKCK8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk/a7l16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIIkcAmp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42uSe1329549
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=; b=gk/a7l16EoEIiRgL
	MX6732IgjT2uh3l2g/Rcq745tAhNNFgijEci5wJwesFXDTA6/2kePrBknSIblB5r
	i51PEd7qPU7LDR4c4FCbts6UnksdxAt494l5VcbALSXS5kAQykIPPQmEKkV2dLWM
	0S/3Exa4342O9OGbFlKOEZ1Wr64TQVBUBZaC1YAccdCLmt8L+pTo2Aiu6eJrkEg8
	a/6yYL0qMFQURtgpX7ss6iAZ2GsCvfmLJ1qdEMs0z/iyWu3hba/e3RuQh4plBYH/
	o6wPdIwbltzmSKUw9iEQCUHAyczwBnEOoHoCxCk0Y8Dor8QvbhCSRlQbN9iP5Fx/
	3sqaGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhah5gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:26:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d076d88so21066761cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368384; x=1777973184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=;
        b=DIIkcAmp9OMShlg9STvMq8JqsKAorpeEaW75U3z9M6IT4JmXUurOKTJbbYbNEwuUce
         rnUQMdeXDetTZFGpXW9D6ZpU7xI6wkP6jG+fPCjyZj65nE2RqIt9ZKDhs0c1dEHIcgAh
         x8DJZXpUfG+ZP2tXbAVaSPe/wO4K0nuLu3PdOq6n7ub3f9itmR4J9JlPTSeHGu6LiOtD
         sSztvRLslGpFM6Jx218eKbMXIZjgAWIRWrhcHhjvmGy/HMrmQuWHMwUG8grZBVPS8Gk+
         ew6rhCX8zj9Hh2VGFoIGvx5psmDVXRUZ9gBujj2Q/uclY/SOT/7zaohaMXcgCW9YFpFQ
         HvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368384; x=1777973184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=;
        b=o/hkaG/nOPkZcrheEqBiDR7NJffQuNEeHq1eqzb/16ZAe2HObL6R5Nx3QQXbUs5Ts2
         R0gyLm5Afk/LuuLP3/qOSxZyf+B/OZZspBRHOVmy4FiJnmYMHYxZOdHmdknPZkkuB0Mk
         znEam0R0NhlTdx/+18AVWitFTuKi31b//zO3LiVgCVgMF657O0R8rglqt2gnaBSXbq2c
         jjp4SSrRWrgwl6UfuoO5F/QeGDd7c1ZNezPacpFyGiL7FZbs13F1sZ2gCp2R2bBjZ6Tw
         T64Xhxg90LrFXPULSlq2H6w4ekvCUPqniyB6VrUGs2EGTfXtj0J0et6BW38neMPY5Amo
         wjrw==
X-Gm-Message-State: AOJu0YwQEhIF3CN9Bd3cDyXAtl1ltamgsB0G/i8iLFdRotBkGr504hwl
	gu0RRDDiNfnIRaeWYU3xIqPAXytGVRclCYP5f+JW8j3udStAhx1GwzAENnX+UfZMi7lebdbwYTV
	PYQcn42ZYbULEPa0af/3OBX6Nx4ZYgJd1QRirmyipKnttB8x64s4NV4AeL/uVnqNygi8Y
X-Gm-Gg: AeBDietwfToHb4k7O8rTlFe1jxL+oeyMt6YhC1o1dq+mPqnlplZiBxtIdz26tfm0Elb
	BOEEgVhHMJ10ICVf5okSsT5N7je75Cr5kJfAv9rTHzJXsidrHFuE+7e25colWfUKJ27U4lejZcl
	XZBgino3EOFoJl9ZNZ0+2rw9tQW5l0xNR+W2lv154r6XbCf4lVbT1kc4tKMRDkVXw9GxXWTN9vC
	44u05hfCPe97mx8bdlVYQW26bGnBP30I8Ffm2WqtB3J3rIVug4By9NvlqUlJIvlin0kAiDqev0k
	aiRuNuA/59pfWDgMuRAngLpycQrh6s/4uZ+sv0mu0EJxOTpGK5N1wYMK8fMofg0IcSBWPcGRGMV
	apeX3AbAKcj9oKxtvCePON18ci5L6ogxryNnwLTxGPbLNUEGVS2zbeEd9kTEq4Z/y9rKFmLIBQY
	2T37W7hBv/ex4kpQ==
X-Received: by 2002:ac8:5905:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-5100ca28379mr28496971cf.8.1777368383851;
        Tue, 28 Apr 2026 02:26:23 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-5100ca28379mr28496821cf.8.1777368383440;
        Tue, 28 Apr 2026 02:26:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b8869a5sm72736166b.43.2026.04.28.02.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:26:22 -0700 (PDT)
Message-ID: <ff8abbc3-171e-4881-aea2-8a35ba32086d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfXx8srUSayP5GT
 XZEerwDPunhMFcUmYaPMPcRR38rWAHuX2FC0KECatxugVeUSjoWk1S/LHo6od7QbkdYhA+nwhHL
 zoNU9z4nDC8TzeKrD5YBea8/wC2m2066H7jj/lHFeL93N24O03jcvTd/OSu4NyCTnF5qHWvQo2j
 HrQcMrq1904awwB17oiCBaoZ/3uBoHGYmHx58Cyy7LYLqGMlzbp9ASLQ79Oe89Zc4tH2zFz/UTd
 y2jIYKtwJ7ElMi3WijTIN5QebfnFBnWjyuFySmwGI/JVXMNV/9ZWnFnbFRAOI17LpuzFP3vGhCA
 7soqXFjYZOB9oTB2I5RKWLTviFRt2P8AD2o335CZMWJDgEA7FDP+nPzbfEVl2M34wDqC1wxhdWf
 O3NPv9vC03Yzzq1o3pBWZTY6rLGhkqwc4Uze8ArgDBJMo/hwZoWPYxRi1caFpEarGalRRLCLjrc
 9HkjLMzYra5G3i5E/LA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f07d40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0F69lvgc4v-fuif56SoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Da8qeTCBoYi3o_Cw45TfXRi3DmYDwXxj
X-Proofpoint-ORIG-GUID: Da8qeTCBoYi3o_Cw45TfXRi3DmYDwXxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082
X-Rspamd-Queue-Id: 3B12848240A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104936-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On 4/28/26 7:54 AM, Jie Gan wrote:
> Fix the wrong connection for the qdss replicator device.
> 
> Fixes: 4f791e008807a ("arm64: dts: qcom: monaco: Add CTCU and ETR nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

