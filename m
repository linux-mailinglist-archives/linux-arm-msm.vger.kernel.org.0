Return-Path: <linux-arm-msm+bounces-104460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAvcL01e62lGLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:13:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996245E406
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD2CC30315FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BCE363C75;
	Fri, 24 Apr 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPHph5Om";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hL8T1SJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362CEEBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032721; cv=none; b=KFDOY74CCTYoyyRlSdIWg2Rs/f5gGL5bJ6Kfb+RA8nHdYiEBYvSxTOLZlwCI2q6dZH0YfiBB6JzKLfPdn+/jBQIdkH7U6GOLIKWlJ+1wq+TBLfizl4PcSFyX5xxfik4WE/R2IV6izjLnD56ojVbmQQCl+qHbfRTUm9FUNekBLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032721; c=relaxed/simple;
	bh=H1Bq2JCd/loHLBUg6D2e8MYj9Z1jJAKfSptt326NEw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5rR9vALwg1E+ZpYOKbwY5i65DGnQEeLNgI+Yu0dHc/j/9aNHBIqq5sLfSWJ7rpmlAU/sW+3UEpHZf+sqUWTScfko6gZo9qpMyrofkaUypPnZb9yZyREW1AnM8U6KLLFmVPusSRUy5FnewiKCHVRIi1RrnYkjqubApIQTNZtEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPHph5Om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hL8T1SJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9IAlE2710406
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=; b=gPHph5Omzw4vLOGt
	bENFkCA2LJZ3qgd3kXQnydDzLRpg6Gj/afKiXPs/RjW5cSjPmKv6XQchB9gRjFS9
	uMFg0dkt/yFwZyNT8xbrDfjhnXvOXmj42m2KSrMaJ6BfnR5XE7oCINcRKgu47wOy
	FL5kO+hTeyF1gZsRjce3jZp5KZj6Rp5MFpZcFPOVGjB0OdsPlaYfW+3wdFeu0Zzk
	z1zTzjTawWOhDypgjGUN3/gvIOQVMoNN3zYKUcewx9GtJVbH+pCWwdKCSiK8IkiQ
	sht2KT5S1VhBl2QFJnsMWoqEk2gSwFQgCkGvk1+b3aZlMflf3wJ0Rf4nVXYTWYTo
	OBHHXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9v4xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:11:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso70427471cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032717; x=1777637517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=;
        b=hL8T1SJNuqgixFgsuHWy6H7gajkDStQSjkAW4fMFYcVOK4fcF3+tuzcVMJ/xoWSyUM
         z03W95A1wadgUy4ApasO/mHAUKzJvHgXK4q/QEXudkyivIFSLp42TlstDcX9Jhp6nBLE
         zCBaaI5Mvgl5sNl73v+tsxeckeE3WKR4kX2sUuLhhAH0JIUVcgO4wfuK5gVxBCDK+0ep
         e97QGQ9hTWjxPeEEN9504hbAqx6qB0hjFJ6Jtdfrj/+J3FEc3RYPX/rlwNe+zDfSd/8z
         IL6J5rovCTnQD0RvpZfWviXygoeIYoTKCxg2Cz6EF0DKGTEzOTvyF54aE/GWVmCbkJ5X
         XUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032717; x=1777637517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=;
        b=TXMlQoXCkHZd51LTlEnPJsUB5ZT0ksjuxfZSi5dNAMIQaK3LEF8hY3UazQEN9DI1+r
         Uag+cx1LZjNQOfVSpDhrh8/+GeHmMmIhxd7ktCdRuJTmRczawvv7mMloiF9d/ylxiPV3
         3Sb3A+RrMZtToQEFYyFKl/UdZbWIDOGr/EhpeLs6iDD9cFTv5/9V+E0B1OW20uxh9cAD
         6dLC7ylEXkEl1OovK7oMwo/35uYeNS0OKzp44lvGPQ3K9S80bM5/vKveQOfo/xTvEyxx
         fxPY0HFBIl3wxfo4jHB5w/j3v5kjk2WNVMF/QxpCcmRQM7BxCYNzsDe6A324+t1uJ0nD
         uanA==
X-Gm-Message-State: AOJu0Yxxvj97u2Fcg5F3f/MkCjZ2B9Nixkm9ywCX6WFegfbGj8cz2amd
	1pAQJzj0t27qQ7AOcPXE5MylzljENIcfjUgRxzc2Iz+csXUZz6udDEqGKHb3zBByyvX5kVMeycb
	OAKlPpW956s19P8Q1ZmeDKoJIsqUopCSOZobaZQ2ACbTaBZuDjHmM0apoZASfnaFT/CSg
X-Gm-Gg: AeBDieu2W+HNKLSky8hJcuGNgveKW8uo/N/jLl11rVTUpw8EeWTcsp47Z3corgV859l
	1dFhFRUcb4YKdbqLNJasT9RejrXTFTIfs147m0zdMt4Ulw/kxTwDILzE/jlJ5kVlhKHEK3AFBJv
	yzKeKID1DkW9VouierukQJ1Y4zxd5lHELWa2Sp+PLu+nb33i8SavGULqL0yyUhJhQjzcdvLL2yd
	DJBDMshddQ9+YFjVrEb7EyE6nCE7HaedXvMJ1KyL3kF89TVt8r2I+gXLYAZsqtIu/IB/p6aHRQg
	AaGZQmk4UnSWA9Dpp8lYWdW0TsuhqgxSz35wg0SO5l3+QGhGAynbva2C8eGOT8/TI3gKT4TJK/V
	kVIG/dDYCA7otUQQI1EEgCsEjMeiD2Xw+/hOowAKGx42Hg34lX886SnefyfXcnJbGPWBwJKajCR
	4nt6nv8NxfEL/Xug==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr324193191cf.8.1777032717103;
        Fri, 24 Apr 2026 05:11:57 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr324192511cf.8.1777032716532;
        Fri, 24 Apr 2026 05:11:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6743fba7321sm4354260a12.0.2026.04.24.05.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:11:55 -0700 (PDT)
Message-ID: <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:11:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9s6DHKQDTbnRZYIleqWbcS2MjYY8gA1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX9G0j9M6YgHiH
 svd9pkTgfpGo6tPKNb8jjbCGz9zoxR7E9Hz+vIaOt7edHuprf3yso0Ti2zN9+R7TZugFY6zCCPE
 yRi+MUMWpzArBj8XJktre4vmNVqc5uFs1RYsq7p47U63GDWJVBZI0XA1lqJP3QoZTynAD3lRn3L
 jrGiwvZdRd6ug3IvOIeoqRZV1JY/VynIvsZKp7ufL1V9r8a5SWASNTsKFmL9ns8wvcVeP9mFa2q
 0cIOrfuSvnqm7s9cbFgfsBO8tSY2xqjPlf2iAvLRkwOy0rQZc+94Q8zUw9FFXU1HxSt/BJOInbT
 cEemWRnugawKs1DY2bh+5X4lzH4P7OdJjQugVU0SHHslRzZt0sk+XTcQZbemfppaYDKTSiQmhs9
 Yymn4ajfar7noR/mioIhbWL5v1JUaKtaC7QeuvRTM757ntGby7lCIbUNfmjbvMsKMyzmnU7dGzQ
 KupFwLDElQ0ITce1Y9g==
X-Proofpoint-ORIG-GUID: 9s6DHKQDTbnRZYIleqWbcS2MjYY8gA1h
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb5e0d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=ExZjEUzYGPi_yzd-oLQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240116
X-Rspamd-Queue-Id: 2996245E406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-104460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +	// The tzlog label is required by ABL to apply a dtbo, but it can be on any node

I don't know if the policy changed, but I think C-style (/* Foo */)
comments are still preferred

[...]


> +	// The arch_timer label is unused here, but is required by ABL to apply a dtbo
> +	arch_timer: timer { };

ditto

[...]

> +&pm8550_gpios {
> +	fan_pwm_active: fan-pwm-active-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +		output-low;

Looks like this should be a regulator then, probably?

[...]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio108";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

no need for this property

> +	};
> +
> +	fan_pwr_active: fan-pwr-active-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

likewise, especially since it's the opposite of the active state
defined in the vreg node

[...]

> +	usb0_sbu_default: usb0-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio140";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;

This is probably not required too.. unless there's a hw bug?

fwiw 16 mA is a very high drive-strength - does this come from vendor
sources?

Konrad

