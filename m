Return-Path: <linux-arm-msm+bounces-91157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FE2Bck+e2l+CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:04:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62942AF5DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57704302DB63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0287438553F;
	Thu, 29 Jan 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FN8j6a5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMRoWACq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC737F73D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684450; cv=none; b=TbxijawCAq9TZtOX55IdyKhLLKeU1vbYpX06JrdA5mdhv6VH3c6NKGCPmvZi5V8XzysAcVhTCoi83HQgpp04s5BrGo96sXGT/kRy5eXQpnEkpVZStXoFjPsv2BYu7QUvz9kUoBT48Aq16k6GIHgNDnMZKP4BtHjG2aSxNrApD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684450; c=relaxed/simple;
	bh=zuNjuEaPvKtiaTpnpi3GGSBMmU9WnejUGF/JPe46hnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PV5UAAX4kys4QwpBZCzGsSkWvo37Fi/ktq9ympM6mrGZ2W31zgl2RuYaCoiz0JdsrwXJJoJX3+zWRPuBxZy9BWOzr5JZQV1EcSv4ILncG4advZVqww7xNh/3TRdn3L7jW0BlbkLnbLCrgO+oGza8en92/pucPUa1n6yDklxJmE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FN8j6a5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMRoWACq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAHDfM2033220
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiAulGuQCTWxTDk/cPpKKBufD0fNTEL28yCBfrxiQQE=; b=FN8j6a5by0/x7FGL
	b93ITjwAI/WSq3dRZyY5Fi9XtBas3SyEGwKQTheFf1nlDKo0nGcCX30ixT/FdDlc
	1MKmvPk+Sf879kMXLwF7K4AoMxoPujMTUkCEUV8N/vlXyGYaqhGrnxNR0dBDLp8A
	8fXSD4vMtzvP9b3m+88BWNaerLTiKINGEobWSi30yFs5C7ymQom0ZSL3wiR309UQ
	+ljmFDU4pJkHIi7Mhren4tuQGaydCD1cXp9wF2hDaEub3Z6SHkoJ2BGbxhArJDLW
	7QLgaSJRFrrowXp3+DhmgS9rfC67ErAPeWpPu7I+beiVB+jv0hhalqlfZTnEYYMV
	SyQHag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy26k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:00:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c709a3a56dso30826285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684447; x=1770289247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiAulGuQCTWxTDk/cPpKKBufD0fNTEL28yCBfrxiQQE=;
        b=LMRoWACqLCj+xJPH7P8Llu/74IrSkplnEJUm8XAi6s4PAXNCrvpoXqil/MCB2A3qFU
         BFY6BF8X1jaIH+mMW9z3lXRMYKzaAzCivWpsHvMXercxZc9ovhzmhKYmxxRUTU/kg3wm
         qLqZW74SwNN//47vj5cGKVtt8/zpXjcnFhMzHQnrbhQepnQMVV0kBOqvB/UxSa8DaouE
         03lfXwiNV3jdjX3WZsywOwZdG67G+i93b6XCg+0fQCYlRZVumd0q1ciihDzsYZ+0cfF9
         CWAQ1tMWnku8psaPY+9x1BnCCgHe/iGSpb9t2Nt7umOU4PVUfNShhHBXf+7jULoLpTmz
         5csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684447; x=1770289247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiAulGuQCTWxTDk/cPpKKBufD0fNTEL28yCBfrxiQQE=;
        b=xQ7Kbh6tCkbcCY2UF9u6Uw+awF5yQRzV4yUurGw5maIlCDEjq4LasWkoM8ES4Cbpjr
         zxPlKdwG9D9LhDPNgzSyl3lUa8F4+7dNgGbULmvQyCeCQfMIxEdUmyyGs/gfmDFAem9p
         rlLkpXPfxuXbhdztxV9d18pWPhNHoNkWP+6FQLNeof2ES5HylHb1c0bt36O0DcHOdiwk
         3BJ4Hx4iLNPPYnFdFZG0bUqcvx458IUwRO8+w5Fif8+U1Sz4Fh7J7pLyEo5yvFG0fCyD
         oYeLZ+n7SlAR6nDxGjwZb3rbbsG7T4UVr9xq0dZaEXusMX8flN/MlZRg+BBUKZOFIRW+
         J8CQ==
X-Gm-Message-State: AOJu0YzlEbjLP5X1HzXtOoxTsYhQ5HKzSKhMkKOWYnwlPVpcziz9LF3n
	h53APe52NMPJdh3rvQvIqh6LrmbmqsEzsgiaPQKa5kyrM7cnynaZsr6F/N9tUp1uLZ0bYw1g5IM
	TSYniLdKq+zPVMyK5G5S4gYdpCQXXywQayJSokU+18QIHFuecZRZ+puJtCZtJFaLiI6hh
X-Gm-Gg: AZuq6aLIYgzMJhraMImBpX0mxu+wCCl7ikiN2lIkY9WLlqOkljT2VvboYrOcIbiFfQ6
	YLgfaWp/MNEatgo6JlIPrx8cM+RzE0Y2lNPJs9pEWG0ZYwS4y36HvPAj5Pt/Z0ec/yLQx1/y0Rd
	T3Vz7BaZEuzHfHTuFkKX9mw4PKlPwGmT888YJ06K3vQ16LfkfdY9Vt1HA08wc35jycB9kmqW5lS
	FbQ+K8VsEX1urxHg5qNz9eluj+6aKif7pWPHOCmYIXq8UKda0HuMkX4TSufsqpIgmlnA0NOyz4i
	2x+ZdYKxvTmkZjGQamcEWyh3qWW6owU2kbQHZ3l2Knl12JDh9qedZUDOMj7G+QDGp75D1cWFICt
	j3jWLr2GD7Zau69tiXKTr10g5lG4kgoTVnD3EseouhuFIT89LHJG9+38bhS9bkmi6zUk=
X-Received: by 2002:a05:620a:1997:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8c71ae4c755mr331471685a.11.1769684447048;
        Thu, 29 Jan 2026 03:00:47 -0800 (PST)
X-Received: by 2002:a05:620a:1997:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8c71ae4c755mr331464485a.11.1769684446335;
        Thu, 29 Jan 2026 03:00:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256322sm2867275a12.7.2026.01.29.03.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:00:45 -0800 (PST)
Message-ID: <fec5907a-5619-4997-9e8f-034efdd31993@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:00:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MyBTYWx0ZWRfXxQ0NtA+FMhSK
 NUnfo0o1yAxdKgx9Bt79l9EcasBF5QraVSs7pwVDxQR6mNkp1FXertWEhpKxJSrXYkkJu5QeQqI
 8NmPtpp7v6eBgcy2FGPDtDUCMRRttMxQOnmMW7BJPVAGa/Q+Efkf7q8J5b/PKkiI7LCG1g8hnDI
 pO+5fbq3egGxzhVteW8lbc5AvGByn3VqEiZdxNPmzKKOcOSrDsp0+fF1j9+up/9PN4tnpA1u24R
 50r9Kin8uUlocxoBQlHWmf/h/DY/MaISAWMYAwQixFA4o5XY8kdOTpfJ2Ei0VFqacyloTKH9f50
 WbDTRYV2dVfySHCWxtQUmAAp1MZ6PKgmUo2muuM+QJavCEjrzrgkA7+RFBG5DoGr9LBsqfMNbuf
 axxutv+8y6s+g68eHYXLMh9oQboiLeJFsHTV30bDMDuAx0aHf0ElvJwngj9YVToqyJphxqY+L9O
 7gyZXD1Oa9XHusIit6g==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697b3ddf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=w0eI_ImC2IWBDziolGQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PD12YQObyIjDRNfy3TGaTyvWcHYXS3JS
X-Proofpoint-GUID: PD12YQObyIjDRNfy3TGaTyvWcHYXS3JS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-91157-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.1.44:email,0.0.0.0:email,0.0.0.100:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,arm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.1.244:email,0.0.0.200:email,0.0.1.144:email,0.0.2.88:email,0.0.2.188:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62942AF5DC
X-Rspamd-Action: no action

On 1/28/26 8:11 PM, Aaron Kling via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> The original values provided by Qualcomm appear to be quite
> inaccurate. Specifically, some heavy gaming tasks could be
> improperly assigned to the A510 cores by the scheduler, resulting
> in a CPU bottleneck. This update to the EAS properties aims to
> enhance the user experience across various scenarios.
> 
> The power numbers were obtained using a Type-C power meter, which
> was directly connected to the battery connector on the AYN Odin 2
> motherboard, acting as a fake battery.
> 
> It should be noted that the A715 cores seem less efficient than the
> A710 cores. Therefore, an average value has been assigned to them,
> considering that the A715 and A710 cores share a single cpufreq
> domain.

FWIW the A715s each have 512 kiB of L2, compared to the 256 on the
A710s, which definitely contributes to the power draw. The X core
has 1MiB.
But we have to take that into account, given if the core is online,
so is its cache.

Regarding the CPUFreq domain shared across cores with different power
characteristics, I think we shouldn't be lying to the OS, rather Linux
should be able to deal with it, somehow.

Maybe +CPUFreq/EM maintainers know whether it can do so today

Konrad

> 
> Cortex-A510 cores:
> 441 kHz, 564 mV, 43 mW, 350 Cx
> 556 kHz, 580 mV, 59 mW, 346 Cx
> 672 kHz, 592 mV, 71 mW, 312 Cx
> 787 kHz, 604 mV, 83 mW, 290 Cx
> 902 kHz, 608 mV, 96 mW, 288 Cx
> 1017 kHz, 624 mV, 107 mW, 264 Cx
> 1113 kHz, 636 mV, 117 mW, 252 Cx
> 1228 kHz, 652 mV, 130 mW, 240 Cx
> 1344 kHz, 668 mV, 146 mW, 235 Cx
> 1459 kHz, 688 mV, 155 mW, 214 Cx
> 1555 kHz, 704 mV, 166 mW, 205 Cx
> 1670 kHz, 724 mV, 178 mW, 192 Cx
> 1785 kHz, 744 mV, 197 mW, 189 Cx
> 1900 kHz, 764 mV, 221 mW, 190 Cx
> 2016 kHz, 784 mV, 243 mW, 188 Cx
> Your dynamic-power-coefficient for cpu 1: 251
> 
> Cortex-A715 cores:
> 614 kHz, 572 mV, 97 mW, 470 Cx
> 729 kHz, 592 mV, 123 mW, 473 Cx
> 844 kHz, 608 mV, 152 mW, 486 Cx
> 940 kHz, 624 mV, 178 mW, 485 Cx
> 1056 kHz, 644 mV, 207 mW, 465 Cx
> 1171 kHz, 656 mV, 243 mW, 480 Cx
> 1286 kHz, 672 mV, 271 mW, 459 Cx
> 1401 kHz, 692 mV, 310 mW, 454 Cx
> 1536 kHz, 716 mV, 368 mW, 462 Cx
> 1651 kHz, 740 mV, 416 mW, 454 Cx
> 1785 kHz, 760 mV, 492 mW, 475 Cx
> 1920 kHz, 784 mV, 544 mW, 457 Cx
> 2054 kHz, 804 mV, 613 mW, 458 Cx
> 2188 kHz, 828 mV, 702 mW, 465 Cx
> 2323 kHz, 852 mV, 782 mW, 461 Cx
> 2457 kHz, 876 mV, 895 mW, 473 Cx
> 2592 kHz, 896 mV, 1020 mW, 490 Cx
> 2707 kHz, 920 mV, 1140 mW, 498 Cx
> 2803 kHz, 940 mV, 1215 mW, 490 Cx
> Your dynamic-power-coefficient for cpu 3: 472
> 
> Cortex-A710 cores:
> 614 kHz, 572 mV, 91 mW, 388 Cx
> 729 kHz, 592 mV, 116 mW, 424 Cx
> 844 kHz, 608 mV, 143 mW, 443 Cx
> 940 kHz, 624 mV, 165 mW, 434 Cx
> 1056 kHz, 644 mV, 195 mW, 430 Cx
> 1171 kHz, 656 mV, 218 mW, 414 Cx
> 1286 kHz, 672 mV, 250 mW, 415 Cx
> 1401 kHz, 692 mV, 286 mW, 412 Cx
> 1536 kHz, 716 mV, 331 mW, 407 Cx
> 1651 kHz, 740 mV, 374 mW, 401 Cx
> 1785 kHz, 760 mV, 439 mW, 417 Cx
> 1920 kHz, 784 mV, 495 mW, 411 Cx
> 2054 kHz, 804 mV, 557 mW, 412 Cx
> 2188 kHz, 828 mV, 632 mW, 415 Cx
> 2323 kHz, 852 mV, 721 mW, 422 Cx
> 2457 kHz, 876 mV, 813 mW, 427 Cx
> 2592 kHz, 896 mV, 912 mW, 435 Cx
> 2707 kHz, 920 mV, 1019 mW, 442 Cx
> 2803 kHz, 940 mV, 1087 mW, 436 Cx
> Your dynamic-power-coefficient for cpu 5: 421
> 
> Cortex-X3 core:
> 729 kHz, 568 mV, 252 mW, 1110 Cx
> 864 kHz, 580 mV, 312 mW, 1097 Cx
> 998 kHz, 592 mV, 379 mW, 1109 Cx
> 1132 kHz, 608 mV, 453 mW, 1099 Cx
> 1248 kHz, 624 mV, 517 mW, 1067 Cx
> 1363 kHz, 636 mV, 587 mW, 1067 Cx
> 1478 kHz, 648 mV, 657 mW, 1058 Cx
> 1593 kHz, 664 mV, 739 mW, 1049 Cx
> 1708 kHz, 680 mV, 813 mW, 1020 Cx
> 1843 kHz, 704 mV, 940 mW, 1021 Cx
> 1977 kHz, 724 mV, 1054 mW, 1007 Cx
> 2092 kHz, 740 mV, 1201 mW, 1045 Cx
> 2227 kHz, 768 mV, 1358 mW, 1029 Cx
> 2342 kHz, 788 mV, 1486 mW, 1016 Cx
> 2476 kHz, 812 mV, 1711 mW, 1046 Cx
> 2592 kHz, 836 mV, 1846 mW, 1014 Cx
> 2726 kHz, 856 mV, 2046 mW, 1020 Cx
> 2841 kHz, 880 mV, 2266 mW, 1027 Cx
> 2956 kHz, 908 mV, 2616 mW, 1074 Cx
> 3187 kHz, 956 mV, 3326 mW, 1147 Cx
> Your dynamic-power-coefficient for cpu 7: 1057
> 
> 7-zip benchmark single-core MIPS:
> 2128   4416   4632   6686
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..7bbbf3109bc2c6e2e6445207cc86c401be482a73 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -76,8 +76,8 @@ cpu0: cpu@0 {
>  			power-domains = <&cpu_pd0>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>  			#cooling-cells = <2>;
>  			l2_0: l2-cache {
>  				compatible = "cache";
> @@ -102,8 +102,8 @@ cpu1: cpu@100 {
>  			power-domains = <&cpu_pd1>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>  			#cooling-cells = <2>;
>  			l2_100: l2-cache {
>  				compatible = "cache";
> @@ -123,8 +123,8 @@ cpu2: cpu@200 {
>  			power-domains = <&cpu_pd2>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>  			#cooling-cells = <2>;
>  			l2_200: l2-cache {
>  				compatible = "cache";
> @@ -144,8 +144,8 @@ cpu3: cpu@300 {
>  			power-domains = <&cpu_pd3>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>  			#cooling-cells = <2>;
>  			l2_300: l2-cache {
>  				compatible = "cache";
> @@ -165,8 +165,8 @@ cpu4: cpu@400 {
>  			power-domains = <&cpu_pd4>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>  			#cooling-cells = <2>;
>  			l2_400: l2-cache {
>  				compatible = "cache";
> @@ -186,8 +186,8 @@ cpu5: cpu@500 {
>  			power-domains = <&cpu_pd5>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>  			#cooling-cells = <2>;
>  			l2_500: l2-cache {
>  				compatible = "cache";
> @@ -207,8 +207,8 @@ cpu6: cpu@600 {
>  			power-domains = <&cpu_pd6>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>  			#cooling-cells = <2>;
>  			l2_600: l2-cache {
>  				compatible = "cache";
> @@ -228,8 +228,8 @@ cpu7: cpu@700 {
>  			power-domains = <&cpu_pd7>;
>  			power-domain-names = "psci";
>  			qcom,freq-domain = <&cpufreq_hw 2>;
> -			capacity-dmips-mhz = <1894>;
> -			dynamic-power-coefficient = <588>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <1057>;
>  			#cooling-cells = <2>;
>  			l2_700: l2-cache {
>  				compatible = "cache";
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20260128-sm8550-eas-cdaffda7f779
> 
> Best regards,

