Return-Path: <linux-arm-msm+bounces-105660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJYRFDlU+GnSswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A94B9EB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E85F302882C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C443D313E15;
	Mon,  4 May 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQbqz4u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eN3as5Td"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70984314B95
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881885; cv=none; b=ZrHmK+26HuIxpwWateL5jX9rBQFadUKK/fN5eFl4Ww9Z3c/dobWz0ccQ2Ujh/ZhXqOfuWz61M1l6OMA+FOAvKkpnrL5VCsAUMMMmxD4KGCvEMnfnkgdplajJ23W15A9Frq7eRSdZ9Yzp6iTiPyPDSagElkzOigT0FuM+QwaAybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881885; c=relaxed/simple;
	bh=0VBCOzp9/xdIM0amtibq05EWqR4To8uxZSZ/8rjaIEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLjdfH4l7TrMhhWwBFETGRW8+pDVC2LGzwz7F53Bv0LmoJy6Xb1BY9+ERZ894ml06TFVcF2E6cC7y8fd9AGoQYKtlrUelAqQoEkviQPDXX5buytRiiigT/fTPqlcKe/Q4bOL7uli73AVBhtyfJs4idSWYcndX+U+IcZh8IjkNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQbqz4u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eN3as5Td; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D6sa483416
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=; b=MQbqz4u5JxY+aVXl
	Pt/vh9VLpd+zvAjHMPN1P+S2xYjgriKScigRCNyf0+sQugwS9VyTLpBMVISi8iAu
	mSGqlAzTPixlWrJRdapssCtG0jgS8s9dYsps03TOv+j1FKaJTH+DIngIsTfRI1oo
	AyN/MQaurl2qqPAMs7g80Ivm4wy0OnaSFliHCqq4t2CMcC/jIxMYmtlM3NcVZ7Cf
	G3bR7PzNpLdGJWl7fZycgQ4BcRDCGoRKxyNT4SHOwhanTJL9B3f9yQlshgOdU04z
	h5eVWvcrcQ4uKslF2AGwbprfxr/RpzAXElyFsqgyo8rHToX9+DNP9IpajcrsICr8
	QeBf5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87sd0cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:04:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5c781193so8080281cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881883; x=1778486683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=;
        b=eN3as5TdrvlmQOWgYbt5klvjqwzMJqT+SI9WgGm6dKoWLoGwcwjCkyoGPFjRaf/prl
         hstYak3wzXGzklAmVcvVhyoFq3ujntyb8ftMjpd8E0RQoaQzk2qYIeJvouXHsjPrfhPg
         5zgHmXeLJzlpzd+iP4ezfEVfUgssLvVnNBq8okVNpEW2alBimEms/TVT05VJ+AHFwLwG
         3fbY+hEuyTQhA3ghBdDTlONtGvtdk9PNf3ElivW3c+W+eWi4JMRhcewPUvSY2RJ7U3HI
         cp94mVNfPTnPlrXWyqtraVZwTpDR15Wa3zQizv23af3I5XhevIDGdYaLfRSYM73bH/Pj
         wkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881883; x=1778486683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=;
        b=S5PFXKbcmSz0gaNL/2VepnRSebjZf/TioCbj15HRiqcGbFekM2UbDYt1KuK44nzFHU
         Q55oQAnAjUs7dAoVhdH/Vo9i3gU0vrdSWq/wcKqskp3ou/VmlTZ8HlSuQ9cklEp2WWVI
         Luv1+sycJA5lc02ioTJUS7IEeU+USkzM6caJZH6HssbN4/j/LlIa766gdYP2VBVpHYyB
         LHlFyO2dKgLu+wlrTqLLhAvkPTynfB7sgx4h+uQyRuoX3gPdx5sMsDq+knwIAFBLcLe7
         WCmunGNq9oRptiwZjvUlNcUITtZy7U5wkuRvgy1b1Nfc3SDN/0XPtzj9+Bfi5J2HKIAr
         baTg==
X-Gm-Message-State: AOJu0Ywz8Ryhze3TZ4lD9oe/xodhWM8s9nMqhRrGbtkpx+9Peq2pYJ5A
	t1/fcAH2DUIvUsdak3RfcTZJbAjrkO62mfb0YUJG1zv6zCLtoJZ73ljw/Vn7lS+EjFTr/Q1HZev
	C5H8IBi33Oxcq3R/SKaiUm6+QqEQBZi9IXFZi/hrDo4demwHeL1BRIQYG6hILrQcyDVZy
X-Gm-Gg: AeBDiese++uA+8xu8EunlqJhJeK3b2nTIJCrdf3ORpF9FQoouaOt44EtrbdpPVdr6wZ
	q0kTUfFDJnWOjRr/TznGBpxpkdrobV7j6K+oJCIfquxLMCQaBL/QCIyB9vVL1JwxJyUiHFEgdpp
	KVjKjNTIKsNKRi1QuGxIpdix2Sl+4hB+4TL71IRoABMZ5mUCmgLvQVxXt1k3BuM0/jGdRNA/9MP
	VeN44Cqs9CLFkLD938F6zEDXG0nvdu83I6rOaHrOLCNEhnxf3mK52TSsUZHOEAf4Mkj+LbDd1jI
	Fsq072RIuz7L/vdP57Y7UKGe0vtHE6Prl2ftsxV2F/N2Wyrv6y6jI2H2bHIgnVCozDYu3Dn3H6e
	6gYTN4M++WRUgYK15eKtUoPP7xGYAg2SBAvAm5N/yBBXMtd9mfQ6nyyWRlFPGws0wFT9BM4JCG3
	RAWSRLE8bASiRLOA==
X-Received: by 2002:a05:620a:4724:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8fd1776c534mr903146985a.4.1777881882812;
        Mon, 04 May 2026 01:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8fd1776c534mr903144285a.4.1777881882226;
        Mon, 04 May 2026 01:04:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88a4d99esm3109690a12.31.2026.05.04.01.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:04:41 -0700 (PDT)
Message-ID: <fe3e74fa-c874-4be1-843a-009da37937fa@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -CzSmqnTkgBvxQ3Ha68ffAfd0ROGA888
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfX+c4WCDtiZtXa
 S2DsAFD/bwHYHn9SkXIMz+0b6PnGpUIjF0W8mdgpCL9p/D05QRb7x/lH4CQeNaDgpS2p2ifKKEx
 1fwP3yawNqZXvukFztGcqKP6xTKyv2JOOZLzKhP46Rf4y0WagSZIkHzO4kv8tjdoTZTRVy0Znmr
 wryN8iKJK6YjPAtiTSMLOYZ6CtU5Df36M9Uf0hB7zct7Le7m4yiT/Qk07CEcCL/krcwZ6ugEr62
 0/qBwoszuJBzJ6VmtAH9gqcFRJ0gfyAaHKAbJhSk1OnSrNt7ZEo4rzUba/qYhXQvWoQUswRRygi
 OmYDFlAZMTdxaKddff9pUebVsRLfIQvQCjmTJcKH5eiNp1BFux3IujpDkOw2iJdYJcLoqkHJmbU
 UwHzGnoYAEdU9Oc0ZqGzFihEW+bqsQ==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f8531b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=VL2iTB8cqDA4uMkxVQgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: -CzSmqnTkgBvxQ3Ha68ffAfd0ROGA888
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040086
X-Rspamd-Queue-Id: A28A94B9EB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oldschoolsolutions.biz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105660-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

On 5/1/26 11:11 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the RTC driver probes.
> 
> Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
> stored in a UEFI variable so that the OS can determine whether to wait
> for it to become available.
> 
> [1]: https://lore.kernel.org/r/20250423075143.11157-4-johan+linaro@kernel.org
> 
> Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023")
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

