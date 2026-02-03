Return-Path: <linux-arm-msm+bounces-91668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO1CILLmgWl0LwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:14:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FCBD8DDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51717305F7FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0033D6CD;
	Tue,  3 Feb 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVMwo7JK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL6/xAEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0933D6DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120562; cv=none; b=gSBPsMVbTEueOYCgzTCH9MYFkLA/qM/dyGdCd9XbqlxLDKNtmsmeF9hGla0qN2ZfLsh2d2RUzqt3NpJ0umlnCsjVRfIOaP5iaaAxP+KBK0VatehKLAxmeHUPIpViL0rtL8uHa686BPVdSswEq4HwVz6bl8PDbBrf3qvWslzOjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120562; c=relaxed/simple;
	bh=LhX4W4966WbA5RsY6vvGNAKLc5ZklFBLRf+iIcs0fLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZgL8QDA46Uf1lenLjUXojcrYium91r/c2/7uJb7wlUKuoF07Pa+Yycu6DlUVvl4NRteVpp0I9c3D2XrLHT8UJGpYoTSK8zYTElJ1UwBLbJ7YJHTjrTAn15CfHriUoMOm+Lh2xZxSd8vU/0PgwpwxpWaz752BAxrJtGdItSmDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVMwo7JK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL6/xAEa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6139ZVKg930809
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=; b=UVMwo7JKrp0aSnNN
	MzC2V3Hmrn578A+I4RYHamWF/NMEGQ/mq+YgWorxlsvVa4nyNC34yODoazIpGE/D
	l/uScc8h0Z+z03Jb8FfyWWHYXoX0iHbUMjJRBksxjeKqLkzoMHHmpnEUoxD/jBJr
	cpTYWe48Ax5Xfz+FkvNxaAtBg/UrCEsJNJSA3die0nfn01Ve5TLbD9uKhLTfy3UT
	KKHSFYa8Dkomk+vWB6WzdFI4jUsxRYXHGaRwGMWZ8LhycRdfwal/ebDJ37WddCgq
	Jl9bur7MaXtwQmfzqKahXvqqI4uksSam3v9bpGfPan610lrDDQoq8C7iAZV9o9OQ
	ElB+4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu1h77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:09:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c522c44febso131492885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120559; x=1770725359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=YL6/xAEahDazUv6MUYDt9id15vAv0h9hkg2jpyDMdsFaI/mOBC+JM6f/DLDAnqBkX+
         CJcLVzHueWPOJfUZVK0WG9E2Cz0M4926hgoAryK9UuvgiTKQsJFosztpnYT59+eGxMgm
         4Oc9UfNOt+2vO4b/ed8Vyp07MtNo80Ao2ltgnpALrQigmmkdVwKcN5r47WvHq6ov2M/i
         ze6TVRGhNOyjc95m6V3HtvaTZ2/TynPv5OtB4kqPsjkvYHVQ+ut1zXf2IQIL1piyc5LM
         krtuqVpqHW/aZT7DcT7xCXvR26QPEUmwjX5Y2n9HeNtQMBANKT9dBJYMG59PcCj+SZAa
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120559; x=1770725359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=UR1noTjjxoeT02+tMAYAYPr2UXCA42CjlYhgMvf2rIVWM3rqU1QCalqeHkzJtybqoQ
         qxDLjqDNfUI9/Wzv0U4FOaRIqjudhzt0cRtTfp1S6hppWrrpOVsTcXf0PspHjy/2UjeF
         vjcyMQTeJKNMionXWdFVb3LlBIzurrCUv/gddLadES6tfpFIsCh7tWstTg11snO8pjIL
         dESosYH9jfmrAXWg/png3wQ7VP9qdMk0NM6NPA/RL3gaGhgw+XxDIHploWWfZcdhh/Ic
         70A5QVBEKOBL4MsUKNSMoCFj04Z8Bu3rZC8DuIlM7tjV9X1Oumws+CV1/bW6znATKyzN
         O5ug==
X-Forwarded-Encrypted: i=1; AJvYcCXfzwoWwrbaOiQ0kduNiHoeM4kFUPZN7J+Dc6nM58KZ7iWo+f/FEphvpUdFSRE4f6J01fQiTc8YovFZsP5k@vger.kernel.org
X-Gm-Message-State: AOJu0YxYciTX6XCZ+pdkULsyWWQbsAZoiosTa6LVgERI0h/jC1ak/wXp
	LK2J3m6aH182DOta5+8eoJtEZWXU3OqWMo8kdJtlY8tCN5ZAMYkCa8M9EbwTs3ZFjhIbQ0MEltf
	OhO/SiMe/BJLEsRO2DcvNPlxltZ7g4b4BXOcfFwRjrhYpr2wH8lKXT2pl/V1R1Wj0gk8R
X-Gm-Gg: AZuq6aIAuLfRBy1bGCP6kdOwE8aPN+QLiVxLogAsBWDTlueJGFOHe02TIaJNqdx/lKE
	08VQaXAQMgud5s2fXf+ZezHzCnNA5nIssQbF43JV8ZWMfUR5wqRjnJxE4CQaMKosEINsis/5LN7
	FvHB+V9amGphHttbEAFExWhg/1XrzSAVsyjYITgYZF5Vd794OUppJNfyGKrO8uEgBl6YUya3XrV
	hI3iLNs2a8OKZ61fxc+fvPpY6Sb0VNshyNGUDz80kdTSvv9KfkbR6F5j+ANCOZFsM5FDmGFrXIr
	yx3keAjSOYcox7aQmbag3GdJ8DnGUUdjKQgK/VrCUC1SwTrtWT5AkLFA6pMm73I7EXe6vQbt5By
	mn7QxzQX5bnkVFMJqaHz3nGEpZNJcEMARzUJpcRKn+WC7LktK4TvoBVvsqyoCavBlfag=
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529517985a.11.1770120559096;
        Tue, 03 Feb 2026 04:09:19 -0800 (PST)
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529515085a.11.1770120558684;
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-659390c08ddsm751708a12.11.2026.02.03.04.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Message-ID: <006f6c19-d923-47c8-9890-c7431c8c1e77@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] Fix TCSR representation on SM8750
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NiBTYWx0ZWRfX28WIcLMLC1dd
 35SppIVRLW1aPtYztyP9u3Mhh9vqZGL+fwHhXNSw92nkGZijRzAgNJ42e3z6lkNDL2yp50mWd1M
 O1kbYzWm6R/jJe4NbyM5Th+lQnrjvW8xWpisfUkmR9Upv9oMf+eSeDRJF4o2xwAPyCeF7uxMw07
 a9gY46y060Ay2//JGd+Xb771ExA+tMi6MMU66Q1U9ushAZwODuBxsBw2pgcfuE/X8helgTnRt5I
 OsrzUMTw5Y1JlsAfPCGINZyFGUAth5yrkimME1SxXQ1fjnFMxUXPr//73ZkGMfGNWyg0ZXmSeXU
 JWGMWN8NHfqcKnnTAmzAiwh6UjmOdgfgG79vQiULivK8AQMXvAzG4oa/mOHgZHipLZAWhh6W1E+
 IjVrc4V1wHCQwDZv7cTV6H6Egv+P4ZiEsVFYcCRI00O1U0K27hVhtR6mkkuA91o/AECisGwUU3O
 Hu9+Ln5AzJxitHaQPsw==
X-Proofpoint-ORIG-GUID: 6pBdXCj5a7YtiRtJUXfw-DVeCi1ynUYS
X-Proofpoint-GUID: 6pBdXCj5a7YtiRtJUXfw-DVeCi1ynUYS
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981e570 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mv6jPIj4YeSnJgRhVR4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030096
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91668-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,noautosel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28FCBD8DDE
X-Rspamd-Action: no action

On 2/2/26 7:19 PM, Mukesh Ojha wrote:
> On Mon, Feb 02, 2026 at 03:57:32PM +0100, Konrad Dybcio wrote:
>> As sparked by this thread:
>> <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
>>
>> The current representation of TCSR is wrong.
>>
>> On platforms post and including SM8550, the TCSR had a sub-block in it,
>> containing gate clocks used for distributing the XO output to various
>> consumers. This is what we refer to as TCSR_CC upstream.
>>
>> SM8750 however, is notably different. That same set of tunables had
>> been moved to the TLMM register space. This is made worse, as the
>> sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.
>>
>> This hardware change had been undone with the generation following
>> 8750.
>>
>> This series attempts to unwind that. It's difficult to merge, both for
>> bindings and functional reasons..
>>
>> I think it goes without saying this breaks backwards compatibility, but
>> it has to be done to represent TCSR at all. The patches are ordered in
>> a least-destructive order..
>>
>> I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
>> still works, but more testing would be greatly appreciated.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks Konrad for taking this forward, while I was also working on your
> suggestion to make tlmm a clock provider.

I was under the impression you abandoned that patch, but indeed I
should have asked first. My intention wasn't to beat you to it, but
to unblock it. Please accept my apologies.

Konrad

