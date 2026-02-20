Return-Path: <linux-arm-msm+bounces-93476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNYtDjgsmGlqBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:41:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8BF16656F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC5E300E70D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ACE32142E;
	Fri, 20 Feb 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/mzWkJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvgTEi+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA731AAAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580469; cv=none; b=hwxmWR5bASJSYDiv2FWOSybbQcJivt8ho++/3vQCECXxrfkEafkfGLa58g88fH5LgGc7Lnwa5NMQp47/ILW3kV02O22N8UfQ7xSR22C4lY2MDB6SO1Zsdgna9DuU/3/HgRG5AkwUh4O5MCOKaDpCXPEvtXFeLY88yZGhBWbLeNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580469; c=relaxed/simple;
	bh=qbUXmwR570rq9nrHQF/Vyqde3e9v1pwrpQxkM4HhG9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIlvhX0FJpitMUbj09U4nXdRbmmlOdPq5hiAfZF01irvRiC+WXRZ59wPi0gbOKC17y/kNYL2DZzM5EQ2kNXJtDrpgupTXS6FdVUig97vSQgmN4tJPZsgW5T5MJPQgwyd7kU3NCUF5IVQSe0zTr2Z3saSqBfkpTAa4NK32pWdIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/mzWkJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvgTEi+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rmow2506126
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WbDl17tScfovQZkpgbjXLkoJh1qbl/GssicBwPPp/E=; b=S/mzWkJkxoukhdiu
	E0yaKqgLVUxL603LW37J8vD5BFI1HL76AGAHXa2yqYrCntyJM4bHarLYuaiAG+t2
	f3pMd3t16eBB/DiZb5rKUObi4QnVw3HXNhiuFjeX6bUj0UbLBUpqXAw+EODC7uTY
	nZf26SAJShocxG2Z+hfH+//JcCppu2atmkdpbdQHc0YAl+836keJlDjjNjwhotf7
	HD5MDHzgA2+VDzEbFD6mXrcqbXdclOv0ThMoPMNrnOYoB2v0bMhGiAMcrjryev2R
	XtQlQSzTcg3cDcg8qeKDXAyrcyuOcDDEPm7AyCiqbyrHplFm0kVdEB0czeuv+2/g
	S9NPkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cee2s93qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:41:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38a5dc3cso185482685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771580466; x=1772185266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WbDl17tScfovQZkpgbjXLkoJh1qbl/GssicBwPPp/E=;
        b=RvgTEi+1Q5uS2kJPMQZAq7radfdFf8MUB/7qRWYKTbFTVw7VaOVNfhR9tSdvliyFGQ
         eNxNCz8LY2HJ+sgJhy+/mfX9oULmGndey8Qdnl/p8VT7IYP322RXXwx9GfcoolllCvOh
         ANmTjBzb1QsxMtfI51KjGM9DaAI39h91cjA/UG/MophrkDxU9BGbTAeaLlGxtxwk5yp8
         ycjvPmbBHIFeOyNNTq7NFdm0Pb5lBAW8WDZcynZHYLsnvZXlPiidGK75QncQUhon0Xpu
         vMHALN8frm5soBQmH8qecB8xxZhOgfypXzhf6MM+GU0MwH8RrIWawLl2cT1SrZVWGw70
         cn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580466; x=1772185266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WbDl17tScfovQZkpgbjXLkoJh1qbl/GssicBwPPp/E=;
        b=gd6bT3FMMHE/8M5Zx9kNgov1mZJpZ3Vs30SfbJzC1EFe9Blwyj/s+Xf8ixVI2hScXm
         o9lQXoPHYrXtDY8gLSxGfIhfCs8UAQId6pHMiR5GIYbnjT8w+hgmjGsKmpMYPmwVwaqt
         ueYUOTLBlKh1eAWO2jSQf0GPCdf89DBeRtEJLat/IzUNYDFf4+usXG4EqBqe/R8t9iYi
         +ZiLO0o10ZkaWPwTv0FSPPPPGzKupYBdpr47QxGf1rY1gFJSp1nhdcJa1yMHXjLNLySC
         RJcRSrUQwz1BlaPs7rLG7zabQympUYbdn8kZPzI8NdhL7aNOvBzJwGvcfgelPnaYbBCi
         ohRg==
X-Gm-Message-State: AOJu0YxGHJUxOAQk45GZu+tqH2UenAQ400ovontlMqxN7oNb2Vs+oDaw
	r0L8InbbPYXQz/NOeU3E+bAEynEvSH3NYpqvBXVEG7o47L12LY1H+B8wj4td1gay8RCW0rGqVo0
	B1zRUMjjz3ZAjCbpewnhi1yR68vVdh9kbw+jBTgoR+9pVnilxrmyaqV47O66ai2WGlKUq
X-Gm-Gg: AZuq6aLMmCGxfxwYGomnUgBu0ocRKtMG18hvtlW/bSbB8bEaf1B0o8EbBd6pHEkIRnS
	x3MkqZUV9NaUVSvt9wqZbQg7jzvehEfWyoA18Iwbt6bkfJ2mhSb3Vu6Nv8hbWpFD22wa9WkDgoS
	+taUKBhqXEo1aEd6K9/wtZPA2pHmKZjaLh/t3tKTqnQX3XemHyFQNJXhRJU/W9J6NDG0Nd3IpwP
	H6PJOFjol8Ev//NSnc90XqGbN9bcbOgvHlI2ASlvjQLb8SIxsHxL1amPoiGuXQbgFdCX5xzH0AW
	Km/gKZmbOhqeRnzKB0Z92h5GHErk7lakj05G21cpu75TMm8IxWjzt9srj5RzvG5bW+g/UthdTyy
	Sn/nR53zm/FvoWNl6shsudDsZA3ECk7E4StGl5Xd2d0yjRGfwcwkSxoadstOWkin0fDu9D0D7fY
	ZENf0=
X-Received: by 2002:a05:620a:46a6:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8cb408c87ccmr2346576385a.6.1771580466580;
        Fri, 20 Feb 2026 01:41:06 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8cb408c87ccmr2346574385a.6.1771580466205;
        Fri, 20 Feb 2026 01:41:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e3538sm4771046a12.20.2026.02.20.01.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:41:05 -0800 (PST)
Message-ID: <8e670f28-9a2e-4495-9b84-8b1d9c0542ba@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: fix idle exit latency
To: Daniel J Blueman <daniel@quora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260220070204.101672-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220070204.101672-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bEDiCdpC1VNGxbPypAinmrWQrlaL1MSP
X-Proofpoint-GUID: bEDiCdpC1VNGxbPypAinmrWQrlaL1MSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NCBTYWx0ZWRfXyc3fhlkH0FAD
 98MnnSd3gowWDoXNF2AwXbv8sDKxqkbh9m6H9942uo8+Zm/1zorltZ7ZsePotdMY3k4nwUZYw37
 HGAusAhCkFLrqQBkNCqzTqLz83WlscOb1JxUtwUhgpyA+FvzJ8ZOQJi+lOi49TkxFbhIlG479sR
 0Ie5KweNcIcoyU4RM78MFd32QhvBQTCPXpvAz8WQUW+EwsRxx4kBbSA+D1cHikhBlGXbBYfi3TJ
 XSh90CpCe4Ivs/XXaRJaHM6/NkrYAHQFUaSqUGwssxKPsu9bfJLCMWqTlpqtdQa6CAL3LRwOJI7
 WkGMzZlBnwi75qhxkrze0b6xt9lknehEYRvVbRgfRm1rMWw49b54pqiQelSIcjXb9a1NbLA9Bd+
 tH2cH9FQ4cWieAkLSyZdjoYQD7AatdsULL2Y+vHvPjhwnMAabOPy3qwJCbTEyG2xWHJ9OXVESeT
 6N84rTAwtBsh7Z56+Tg==
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=69982c33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t9ty7G3lAAAA:8 a=CtgGTwNqbZ-k40dbDgUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quora.org:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93476-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F8BF16656F
X-Rspamd-Action: no action

On 2/20/26 8:02 AM, Daniel J Blueman wrote:
> Designs based on the Qualcomm X1 Hamoa reference platform report:
> driver: Idle state 1 target residency too low
> 
> This is because the declared X1 idle entry plus exit latency of 680us
> exceeds the declared minimum 600us residency time:
>   entry-latency-us = <180>;
>   exit-latency-us = <500>;
>   min-residency-us = <600>;
> 
> As 500us idle exit latency is overly conservative, fix this to be a more
> realistic 200us, in range of similar silicon. Tested on a Lenovo Yoga Slim
> 7x with Qualcomm X1E-80-100.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..b870f4dc9c42 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -269,7 +269,7 @@ cluster_c4: cpu-sleep-0 {
>  				idle-state-name = "ret";
>  				arm,psci-suspend-param = <0x00000004>;
>  				entry-latency-us = <180>;
> -				exit-latency-us = <500>;
> +				exit-latency-us = <200>;
>  				min-residency-us = <600>;

+Maulik?

Konrad

