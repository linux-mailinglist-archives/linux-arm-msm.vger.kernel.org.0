Return-Path: <linux-arm-msm+bounces-117269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pL8THuPTTGq/qQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A92971A533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="f8/Lqifz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OsSRenYA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43000304E6E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BFB3E1D16;
	Tue,  7 Jul 2026 10:22:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E73DF019
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:22:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419744; cv=none; b=g4OxWBB22598FpAXMbHqor21EvEZ4PaU96xBR9ykbJshWZKTJudrTuUJFM2hDlzx66h6aAqd4HC6BM02WMA503zuVyP68I6G8VmwiaYJUrEhgPL86mSwfWkuw8U+6hPdA3aifOiFFJxy2cB5KG7TKq6VyMYwbVDyENZZOPi/W9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419744; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBVze0yvJ98ZNT/o1FxuRq5Ex2NrCRDtIIPLUNZ8sDUCBJlEQ/jjmsud5WDLQO0TV2kQekc29cL3r5aQ+twmpJ4kOSAfMJfZXlSJQnpiG6mJc7R5bqDbOKOOfHe1ygzOkBxWciqcIAbip3vCHZbH0L2RjFpwFlb+TVWpP0i3XPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8/Lqifz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsSRenYA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EBWj3231408
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=f8/Lqifz1/Y0hpVt
	j6lzMZBbpvGRZkMu5/LDZ7xaQYCc5LY5uWXBiwudLTshmobUB50Ciejn4lJn+Oce
	sNbglL364PX4X7E+PeecJTPa1p1PCjVw9/NGa3Z19jdLwbUA1LSQwbtzkv8Dqpg5
	oKH9Qqq2Q604F8zUDEuEJYfYO+K03Pp+ru+YcWcPMd6A2THtshIFITXzlAe4uR/S
	jCJ2nNDL2FDQZVuU58jeKGRlRqNgItjMSn51AhVgAGoCLgYHUCuFpGeHSTbAMUPz
	/6tkQMWlCO9jnzIpN2vc6027afhvndC+HkHURzNMerS/yFHPQDVAEjwKmcZaAnye
	zDsHsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79xka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:22:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e8e83314abso11574586d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419741; x=1784024541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=OsSRenYAfylfN5druYA16rXeHaEz1nQjRK+3VVuvM1C+X4x1Uq3kQ4N2AhvXs15cdr
         xEuNDmvpTi25wx8JOT8u/2DCcb6VdILdexHkpJaJEbVzCaDobtIZ7vHxPAf/fl5ytaLE
         wzY028RMJ77Rkl/HCOEwW29B9q9SGDUqDBD5aQ5nA/kgqJbhDZ69VfI+SxJMqB3cdUOK
         dSq2MHOyhfw3TGgEyHtk6yS2j6OWXWznT11pNnyyMwGKhm2lTVUGrUdF2s2BmWVLo4h7
         w7xLpdlmmtYBq13h+Heh0EnLzjVq6e/IOeO3flEDAgTsL9sjpqucH55v9YlY13bYxcd0
         qUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419741; x=1784024541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=ErAtbpRSwj5haBMm2JgGATe1IujiOVFO9nKO0rPsPOKzUORwAslfkHJrpe5iQOf9Xu
         FHKCcgSENwYin8GmgL+llPOGjNpTQwmHnwstZk3hT+fbCbBvZE/2KCPVnfkZ+sX/crex
         lChpGTcHqGzq9ncWhg8L3Ze0woCu46aXnTvZenk7MI+Z0Ti+eTI8rtgLt2u4nBlwuiso
         OPC2BS/UYLDhKTG7P/tWfdDqJEH/6pOzZzmSJUQW45Z9JlWATJuSLaiFfQ+iA/JyGzNJ
         2fhQO87iqONP+GAZqAzqnN4aoJoy8v0bFjWQFb+RSM2xEnsBK+PLhMvXzDLWTdRMqRhG
         A8oQ==
X-Gm-Message-State: AOJu0Yw63yry3sivTULJCIAdoYJTCNVZz0lHj0ozMmfMaw+gbkld6vum
	gx0ip63oQfReO97xlB5xOsybc1lBwGtbCbACkijYav9SgPK3pk+t3fSFxW/Q4xnG/jH2dO6ce5+
	gukvCEDierQ06neZZIVdbgzYvH1mCW1CHV78owyAl2i1lHGY4KdBYJGbvi5pD+Krq2NmQ
X-Gm-Gg: AfdE7cnhWW7hvHvtHxK+SDXZvJ8qShyzW9G15mcunXW07bhUTTw7VRs0QCzrIJMldee
	HDc7cAup2VURyPNwh3L/1JatPK/B+9Kbf7TtB7fBL5HEHZpJu8hPS7HRLhYkgfZvseceXbrKI1i
	+PYEOCrW084fj26bTWfXnwQ6zsq+zoOGI8z+UCMQJ4/UQOcrmSITmiinE4rOxm0tr21onH4igi/
	cKl3a/IV9IoqB7rQerelLu+0QMLQzCoO6q9xxpfzByShXXqZqNW1XfAapmrP53iwoPPvdUngnp4
	XaDmIqSIWhezDbnovSS5jfbW6M772WDJq4enhDe4ARSp5rJ5egcgivpg6vrCImKPSdDUxDlrQXl
	a0mXWGDk38RujsbR1BtCDllgWdrl6Nvl+oyA=
X-Received: by 2002:a05:6214:ac5:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fd3012fdd2mr19171396d6.4.1783419741290;
        Tue, 07 Jul 2026 03:22:21 -0700 (PDT)
X-Received: by 2002:a05:6214:ac5:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fd3012fdd2mr19171196d6.4.1783419740757;
        Tue, 07 Jul 2026 03:22:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm5816743a12.7.2026.07.07.03.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:22:19 -0700 (PDT)
Message-ID: <4f8e4082-3173-4462-beb0-079dbaeb1846@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TAEy2dusOmJPdbky9HeijMcE0PLiEQeR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX9BiCx030LSl0
 s9DjestcEBmrv/N91GOuhmXpIQEmRloAE0vvsJhZmZsjbb2gndIXv9oR/GcFNoHQq/bCxM+RuXe
 ApkXO+A9J8ln8m5DLW7Jt4rcSGi6IKDnTCm1Q1+S6wyAvfHsqLYI71SoU10gUYQp5DZb/pp0Xgc
 iKtk+xFe2e0jCOKCgAW4+WFMhqNHKWgVX1ZBiUP2Rnmfj+JEHTm3aFXYp5h7m7sIJ4J5lLTVoQz
 HeQrF7QQt4ndQlcVhdnQhweBr0BDTk8Md0Lh52w6G/4XSAdbYFJJxX7I6j8aRf3zOQGiyrDxfvB
 ZYKDjZMPTl3NfJhstSEkH9noaZYKKwjQZekJBo/yuQ4LhujZnh1k5uHlAu0rIq3b2SXR8X1e2Ow
 q4l6tDqiFC0wca+K65tY9e1ttAB0BZee/a1lOmdiiIB6LWl9f68YiVk9XZq+agR2nA+aI6NRifF
 CroILlyFenKIfax+byg==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cd35d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXzHGPyvoJFI/K
 9f+BT7UF44vX0KvwD6xEf+ypzCShOZRwlQz2UGc+vMrKLlejvIQWinsuAa0y3CKGpDijPNQpT5k
 SRgM+denZo7ebMJLRK131/JgJVCirrs=
X-Proofpoint-GUID: TAEy2dusOmJPdbky9HeijMcE0PLiEQeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117269-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A92971A533

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


