Return-Path: <linux-arm-msm+bounces-99648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGauAr+HwmkAegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:46:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE8308919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281D430C333C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54F9241665;
	Tue, 24 Mar 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVbe/GZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFachAZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A61DF980
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355780; cv=none; b=niJTZP1fw+s8IsYusLAcYnEmpJi3AiPi4l4Kh2HCVUwyUkfxm5BhoWJPLQO0M6ok3xoB9JGwVT4nqZjooT8CiuneO7lBhlNRRIFv5oe7+jenROBcFnh7UqZlKAd9wo3N4Gj0yoMFU8t4z+A5jjF+1FTUgZVQpwvAKY6QFJO8Iug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355780; c=relaxed/simple;
	bh=kjtJIQPhYH2cQ2o+skD3gjjGR1zxaLcRezoe9/0zXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2pdCV9D8amdU8AOa/NxtyjwunbTylGmC3tbPoL0zhZUvMXAPBCsNNlO/BNsIcv/eaznK29Ei3gmEx3FFuBd1l0Dt4NScOUeGd7ihiZ4Scbj1pPgRL5eF0dSjwh1N7YjRDQziikZWFjmXRyYiw30kWh9l6TDZU+7WgcZqSpd050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVbe/GZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFachAZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7RA9L2371344
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=; b=HVbe/GZ9/QeJGaLj
	EzPA7g/PgnIxKZIOvwa+XpTlhyld2+ZxSQMEpnhbizuE6iH2lOPWMMqp8iPWSrIe
	MM/Yz4kxksvDgFcPh+XP/8Ahq+/W4wV1CqvV0tFldJifKmfiCbVPdK5O8p0HiRrt
	ruVNId3+0CecWtCY0EB/GeSlkPLU9Aqqm/6Mkh0Zl+nUmgAYoyDkPjN+30WrUBFG
	xajwqAsanpGWzE1MfLFYy66R3xOoiBn36QMJ9TaN7jm2JDjq6FnRaDi8WfpxEMkY
	o16y7MY+GW6wvJoxFIGKyoktS5wuPJfVdwCr1orthceIAKoQ/n9V//+JdAJ+9w7u
	Z2fLag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p83145e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so42017571cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355757; x=1774960557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=;
        b=iFachAZu1gTB37NltxgdqTkN4EFilgxwta1lmuqs9EcO+kWZIq7FD3QOjMVUHuQz5O
         SPgdX4iKDd9z2k1OABDJo0yMb++36W/gTYmIarPL6ZzBkdRKRfuWRJLw5FuNK7G2lsMu
         2PwlmpUwQjjml0ZNZ/qjiNypkyqrxBM3Fyjqc2amGYXBb9ta3gBP82SINCotD+mEHNSX
         DsIk17sAf1gulpwj2rhDob5uWQ7T2aMiiZWb7E4wWLjbMBfbnja89X+o+1qq5AlGB9C1
         ewvAH/4DdE06ALl4PRODsKxp8KRjC+1ClIhSSh4QeJQeqwrM7cTSTRtXkxKha/zngx80
         av8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355757; x=1774960557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGeBu2OX7O50NzFcmUWCo5UG5InLHDqjYeoLwXPwQyA=;
        b=TQvEblLciD0i55lhlLDcHpaRCYR33DOY/7DNATekuN2Aj3nwSWEAtr03jtnTOIE3/b
         72MC5+Ww7SVDhz0Vf4nVRY57lUF7jwnNrOjFghYX5MAlYzuIs5or0bwsz1E5Kk+4WGWd
         d5CEov2qFP5wlG7Z8udpitQr/0ObxTMcYnVeLFfDeR2Y0DbN38JSBpuU8/oSqKjKy5FK
         +o8LAYM/i+zuMGX5jb7cp0VpqVReIySE+KayLx9kob3XsTwEZ3krrTcfvMzLhUvy7vlh
         N6ahrGUjhPBcc2BFrsaI+vjd14JsNbF1IkLisZaCCDHbNWUf7VzIEpASj1eYfuntxiz9
         77FQ==
X-Gm-Message-State: AOJu0YzQJMilaDWr4ZoDaNsCHrxms9XAV+Mou0/ZDNroTUF4MiskRWF6
	q2ZcYoDSLsOUwMp/sqgvYplNkwLt70ac+cSN4k/IsyVJloIKYNdBsolMhajSQwwPVf2ubR1Cox3
	1j+XODFT9CejQpzsf/aYfxWdBjK7xQwM4OAevoviKuQ8C8lU5MbZYTxNkfz4A1OGANC7G
X-Gm-Gg: ATEYQzw1GkpSqLay+MWfWkEolCeO20/C38r8bCWDrDxXhxhZDjlQJWW1fGTbOAhbZCe
	vmfUP0NEKgRYUU+5yD64VSKFO9eqFeAGC/l9DGxtgLQ3TJtgWlKlNG87licAEtoxu2jJiWMLf4t
	tHvHes/xR9jkCiAMDAZGYSaEZn9vWnYibvT3BChwHW+bxfkg6Vq/4MV8WE9yREGsuKaWoiAIB+o
	/cBf8Qmc2zKtJl04jAVQGEKQx87QAU8DQCNkymfLyLXIiTiFCgw5aZBKbo+FtnO8ME9OOkpvYd3
	LefoH+DjdnFeci0e595hz1DjlRF1JhiVT72s2hXi0OmLS45t/QUKkUClB69s5oh7rJfsXpEAhic
	CFWCG/LANcdCA9684m9VUUkImnYTutUrAu+oWyrBdrFyiiVHX96xRmXEosJQiHR0xzugYgshF4I
	gEIp0=
X-Received: by 2002:ac8:5f47:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b37439490mr175805841cf.3.1774355756893;
        Tue, 24 Mar 2026 05:35:56 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b37439490mr175805571cf.3.1774355756338;
        Tue, 24 Mar 2026 05:35:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm532130066b.31.2026.03.24.05.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:35:55 -0700 (PDT)
Message-ID: <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfXxe4mRBWILt4z
 Nhw8C16gfL5FhSCZ5nBpS32sRGQeAHs3ta+gHNUT7ucstQf0XzvrWUOOYMCe+k5mO9fwFm4kcMD
 KMoZZb8ob8NWFaGvyDb0lqx8waNJoC9tSKJysLBG1IE1tlv9WLIiplsCqHSqTHctDedYqBzNIEf
 +it486ekeOUCFdhU+kt0p4YvvToZMmAbtAf6JjvMU9mhDTRRuFMKz79j5YP0H3X8bE2fuv8BqCW
 8o8Y2Npm/yOoj3u+Ty+8laWbROIdpE+p46s0Hia975sxHUmcbh4N8PXZlyPEx2OWBkCH8xzYNvi
 9K1jTwQG1q26G9TjHdh0SKxbQgH3YADVqK59fLnfOCWE+ocUMFcgoFD0lXYLfsyJvcKwVQNOFSL
 BkjWO5vWBTLLp6L2SKbjVMm44y2VAxulkAldCMDPjs5bdoxCa4MOiWKhOl3p2kAULWCerwpl/5K
 lQ2PH+0dWEYriQIqy+Q==
X-Proofpoint-ORIG-GUID: sXs3gFVY3XknWBAf-wD36AWlzevuOFpy
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c28542 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sXs3gFVY3XknWBAf-wD36AWlzevuOFpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100
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
	TAGGED_FROM(0.00)[bounces-99648-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sobir.in:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: A2AE8308919
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
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

> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		pinctrl-0 = <&lpi_i2s3_active>;
> +		pinctrl-names = "default";
> +
> +		model = "AYN-Odin2";

Is this enough of a distinction? Do you need to make any changes to the
one with a HDMI bridge to get HDMI audio?

Konrad

