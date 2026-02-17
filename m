Return-Path: <linux-arm-msm+bounces-93170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIqIFlBnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:04:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56E14C51F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B2630751BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37FD356A34;
	Tue, 17 Feb 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nt89/vMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMfR/zxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB527472
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333243; cv=none; b=on2rmFz09CQbs4bjYNkX/eNzN73usxbPa0hqlKm5CQviPVGBB7J9+lOPRAd7n7h1kPz00Je2YhjOMxNSty2hNOw71S/vZuaVKxRoAJ49e7mlFdxD/SS/YAyYtM0FpRagnnzv+EMcTEwhS3NDoszhDTpawqAGEGZjrAEDhbckkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333243; c=relaxed/simple;
	bh=a3LA7KzDIpTO8bLxJ01/V5j/cFjtuX/mBy5cEZ+Zucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q+XsnFIYjyDFP94KSd3Gig4oPYrBju+Ygfz8X7od5hvIJafBvebS6Q5xwUYAndGZxFPteIQXydLx4KU+rQ/1Xph05a7E3jJySmM9yI4/Vp2xVmMb2FI1EmXcu6eH1Vlr6rWWYTINczR3ag0id++DI+3xsfkisT9u3ijd1ozNPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nt89/vMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMfR/zxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8qneB048727
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=; b=nt89/vMgDchtZL/z
	sPXyTzwQ8skhxBET7h/4qle+11mjrtq/bNt8XQ1aWHfMqw7feNOWQpOY4ZHA1x2B
	Yz6+Ic4bOLnBAeWINpX4Z4jUaBw62u55jUXTqcypdR4oSqXBwC8QnUKMN/CT4Vsj
	CNqjFl0yIaFgqGBxisnHfE2a36kPhpUlSAnCuJ6EMLjzWYWpwdaL9cEPcWbh0Fd5
	1eAqMBLHPjXHQlqIz4NHHk+vUYdmyAakv4DQ0IDRF/ckJec2PWKBpB2WiiJqtQ6c
	VjkzKVRYhe0JmXlA8SzNqSBRb535k1zn1HVqs6ZuGfUs1YNhd/TsoyOlHVNPo5HW
	/DUxCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82egv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38346fdbso339157385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333241; x=1771938041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=;
        b=QMfR/zxm7yCVsVfmiCWuC7IeU8Mc7Hk0qzE33r4CIEyyVy2apgBPqQGdK7w7cGlNfg
         1Cb2k/TDoI9mQsm5DHOBZeBvzu0cSaN93dbbribL4Nzxp6WWujv8J6SSH3ypqR/5BcCE
         Fe97fSwEHN6jEHfNGBnyO/eADLBDVrkfYOSAgSCWFl3yLzEQmx0PZSG1AbGljFq6Lsfe
         aZtr2qScpEJ2JBM0VR/33T9sr8va0Fu9vDKRMHdNZ98wsaI1Lp3KSt4AaLFMbapxtm50
         cLOEJdcCfJqBiFwWT+/R8E/IPEDtD3myGjz98BklGqBcETM5VMbusv0Ux9B36z8IExh8
         jtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333241; x=1771938041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=;
        b=G+IPhxF1sjwi20s2G7iYtJJZsmtm/BBxM0myJ/raBZpOtIiArzi80V/PFsWtWI+EqJ
         rhWKYBMgEtKlBzFm2gr5NwRXaO0gb+j4+cE24gGcovRiuGHrv/h8KqBOiDQ0idS5QtO1
         AM8V8JgQ2e5rleMT3xUY3itjllsUEicF8+Fl0lPT5/qqLTvVz4WJFvKI/0zcqvKuLm7w
         Ilk8UULE/ioba/iIJq9mffvYaidN3amFLPFPXWABM2nAwvL0oJQxW2zjH2ocEK3HNk8o
         kCGsKZKsSsBVZ93K11SgGfpEuwEgK2aEk1/lBrwb9cTKRjgDwGxruThs5SU8kmQwdViD
         mUyA==
X-Forwarded-Encrypted: i=1; AJvYcCVARPyuGx5kwFV/ZD6UvenP4aaNxkqFZHUmyirM+5JKSWk4vWgiQ8ZzjdMazX9vUH7BHxetSkhAxBkKJZK2@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+vV1u8IhHr+bkzDeXrGg+i01jtLmpeizWsIA69Y7WRMH3/DH
	k+2qkIHBEjjw9y1iz4r3D4yU5QeKbxiBXoRNAndegXVD1YBLEbkVAw1enVCL+22P0UpXhLzxBoo
	xQlY87nbQ8TOWd0y2uWQopAULuhMYEMFF7kLEVIO/hk9r3HM6MnE1ckNyuP7zn7x7/Ysg
X-Gm-Gg: AZuq6aKm+m7kl7f48/GSOiSMe1U8P9U6BIBRatTTleP7IugOjljdkEnwBLvRPucAGm7
	P9VgyMDfuc+A/2yY0ygOXJceaM5/UDnLUpyzHM/aSP8Fu6jGmdlnboRzTwHZRbzeQ8UW9GSkNv2
	9TRBsq6XWuBXgB5fehbXky2neMDZpj3TWT42VUkfJWkMzFbc1JNFDQJs/Ken00KOw36GfScql4S
	qzJI9H04xxvilT7JD/D1XRyqZJRT9YkePqDmfzHnmZEaKuGjljrVDwVDKOiOwNZ8W6KCKN5ph2g
	93H1GN3tNciHGDCGCOdYFmMmBWbZ/SvT61/w087RzY5+pjH7mc4iJcdMlHLp0hP4UoRwdkHJhOY
	G8gTLLSI/xGmBQu1QEDN/2vK1iMjWw5NWNUxFYXyrHVES/qkBhjX5W51UKR8C0lyzTxgoYoLt5p
	slbmE=
X-Received: by 2002:a05:620a:318b:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb4084bae8mr1330434385a.4.1771333240997;
        Tue, 17 Feb 2026 05:00:40 -0800 (PST)
X-Received: by 2002:a05:620a:318b:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb4084bae8mr1330423385a.4.1771333239929;
        Tue, 17 Feb 2026 05:00:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76b2580sm345885466b.64.2026.02.17.05.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:39 -0800 (PST)
Message-ID: <b9bebfed-ad9f-4079-aaa7-7333df5bc946@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994667a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfXzhuOTUSBwLF4
 Kt66NmLMiRnPJdGxr1hECZ/fKBC7vphMMguzhooDpDzUoQAOsvefzasGgPbm2rnAPCNlkxgx1CA
 gN0T2/xyEM4+dopal2sIrYIk8nQa7bpJkL9ixAO+fN8wbNDTE/uPfd5+3euTarXUKyiv2zHxORY
 JwXtzo0+82/cs/sb0W1WttNX/RxuBlkyCogqJayoOKFZKfxxfLnoTnBkLmCWWltabDXtMwM+bvz
 qHEAii6oYXgp3/GkydvEfraGRQ4oPUESeXgljfdxCZXprJSB8376hKcSNm7qnGCVemApPvV2exI
 Rg1yeV1h54c5OqXLz1Wg6WgAb1eGe1fxdD8aIxDCZkcZYh4ISDk62eSFLNcEj2cLEFFttZuthUV
 gHbBaEta31EbbWH1jI3kOdYpx68JLYjCjcWK/G233+VXYjYVeCijtEytqmCik+uPhZt91JsbO8Q
 VjXGsun1KKzMOiMEfbA==
X-Proofpoint-GUID: 2jfz8Ep73xF0r-GYgbYK5U60nWQ9Zm_F
X-Proofpoint-ORIG-GUID: 2jfz8Ep73xF0r-GYgbYK5U60nWQ9Zm_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93170-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA56E14C51F
X-Rspamd-Action: no action

On 2/17/26 1:57 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

