Return-Path: <linux-arm-msm+bounces-109264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJV/JJA5EGoaVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:10:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB165B2C0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD7DC3025A43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CC53C4540;
	Fri, 22 May 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZDpURRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY+L9z2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5F3C1F31
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448088; cv=none; b=EwFm1HzZuqfPdoUo281WFWmtZrAD/5yET5RPu5sgLHVWdicigW7nQ/aF5pEmuGoqye5ykzE+ANUXg6NhMx/DKyOx6/rdlJlpCbsOH2yQYvJi6qlf5AwaMfj4/d/+9PuhW5/qqU/RDjvUPoaaK+7rOxNT12BdHmYc5A+p94VeGt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448088; c=relaxed/simple;
	bh=IwDmK6EMEISyJ7rPprzuuUy4PSuSQemBVEhPrWba4BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9j7a7z/S/VJSrC0OAAHa5RuLUKDHKDwYb6Q36YH1Ws+vauVwqOF7URuY43fCkD65qKve8ECYLPOz8WrCOf1KSr6O87OoD/xjiJjGGlEPFjoYNAl4ZgJUwyu44I39Yttd0uX9weD8XdOsA9v/pdkylSjvIq5LInwE/VMcdjWvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZDpURRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY+L9z2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8o9TT1816077
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=; b=XZDpURRVwZyX0uRb
	PfRQd+e8bEfNQtWGvN46P7i/ndzEuGw4PMUGnyXMfkjSVlwOAZc0wBsDNZcwXlr1
	irNZ5g9NpW+jr+EawFagL52LYVFgkIqbvNg/uuCx2oTDkYMMuOliE+L63XQT/yhi
	E2OcTjr01D0Kvmow6Bu+HPGCrt8Q4tebIxGnjgg1XgHlPtzMmx5WaFksD7uRcwdM
	iQscoA01Ib7XVFeX6uqAgVSLmzwN66uPvRklA56P0Ny2ohhOdieNEhygdbwIOWJD
	Bhn3iUXQo4TZPxzBpwWK5f9KZtqviCwqQPDYCIEU1Et3l8VlZVK8KyiV8u8gMjbb
	YuyxCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1nu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:08:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b9d0162aso12724985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448085; x=1780052885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=;
        b=NY+L9z2FUyozCiGwn5M7nUul3CkAGjUnWS7kV1fcbYc5fJ2lYjbVTpStC0TSlINDap
         +hho6bO/+MLA9aXj81g+DHoaL66PtM3xSZ0yCzKg5zZGXU4zyygL9wv1XWPKA1ETOeY0
         wtXhvpk5mcDELL3BwTAzVSG/m2xdR4BWx2vrljwCkpDOQDxZ4mOLTzoIwT2v6EZI0Qgt
         NCrr3N+0lrP4VXJxxcXfj3dpmV+YAF3wWgmnTWIHCORWvJG4SyvMREIG5oe5TnZ5Go5d
         ETFqwcyKnFYxi2zn5aDo2HK1ZJuxJNZXA+HJvEaLqCYU0LTosaMjBd4B7/EK+F0/NcOj
         sp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448085; x=1780052885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=;
        b=rcdv4UCEiJvfgRqL5KEnDYKy8XJHSMIfdqq7vW9WUFPMWBKPRe86i7YXKxJQmf4Ihw
         YShdsmswgl148ExgS6jjxYLOdG3TnQw2SqEoZobZSLjzGo1Hr/EsOGpztH8RtywsJ8ww
         8UzQ4Diesj29OybCqmeS9YqZ5IBu3PxmPm/AqmecSAngGn1vRvIwwsziVpByiZ1UCyiQ
         J8T0jr2w1Vde7XY16kPm/g5A5M0sIswhap3F8w6cYVyhB8UO8cn8RK9X/s6inYbmz49R
         jIDyK23YxI06Pywycl4Eq8q5t7iMgKHgylEL+5H+89XwYP9qwWrBAHiD5STNLm9T8BQK
         Cs6Q==
X-Gm-Message-State: AOJu0YzI4pXdLgOCOM7sJ/zNVNs2RQoRGl8v5rGqBTDs6zDVff7RYsQ9
	kfed9Uhjjn+eyMeouNSBE4htxkmZzsMd3NKgl393x/4q56gOX6OgrZLtgvPHJUSX0gsVStcgbsl
	mZm7i89akYhcxyumFwjP4wx55NoLrPqd561Hl2fyrbO/0+8kxDBWW4wLEcGxNi4phWkCb0pyI3m
	Qj
X-Gm-Gg: Acq92OH+VSDhvoliaHh/XJbB3pDreprYt3IoVHuH6wAMlxAWxGZK/p/qWDI7zYwOikt
	fRR00TfXGUD2bwGFTrqVeNeqjrgATfUhsJzqLXm2hBFNjyRlqs98pkqw6CUp0XNkAAY/zbGYxEK
	ix0ItDapUMwwJIE8EUys4m1WhZKceo4I54WluV2v6jQh0aa9Fb4lbSUxzKinz1a8XP/hHV3g1zU
	US5YoNL4Gv5xn3xd7/ezwYLca8ZAYpLsOsbWEaxqa+A8FqYCXZmPLE6aaLgXFhO8TupyqN51CUY
	dxE48pcTcJyTJtNnzRcnjhcOmRMtXePip9FEek5gC+gKzCbZTWi4NM75qkGLDh7aukD5EenG0SJ
	c+Wl1iPylD0mEgyWEYVb12XkyDRN1UwoHAwzM/qT3CocASQ==
X-Received: by 2002:a05:620a:2a08:b0:911:dfb8:37c9 with SMTP id af79cd13be357-914b4957a47mr303970885a.3.1779448084953;
        Fri, 22 May 2026 04:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:911:dfb8:37c9 with SMTP id af79cd13be357-914b4957a47mr303968485a.3.1779448084556;
        Fri, 22 May 2026 04:08:04 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d2e3sm545503a12.4.2026.05.22.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:08:03 -0700 (PDT)
Message-ID: <1c6ccea3-59ad-42a9-bc7d-edda17814b8e@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: kodiak: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: npaMUJS_epzH7lScFsZqBP01JwkkRE_B
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a103915 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3fF2GDuCYiqyphel07QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfXwqufvQYzLN74
 WXcT3a/zDnC7vMRpt+GpHwGeIESBPTYRVxBquWnDfBpW/iBmHDEmEpgxsUUbseW30SG7FjsR3IX
 Dnj/HInwFfCwgU3hXDSszbK/i5UEhP34ZOeVYkXCUgLGjlyz0rlJsllQbgI8qSHu37z3z+myekA
 yXZKrRdBE2pQlSC3IKH8fk9W2mzjsak62O5VF5CA7fBX26dUeJNVE2DUAZJt+VDskz1CJ777Y87
 KMGaWBMjNhYe50n0Oeu8xNIU8vjeJ0pPqyTXHoWibWB+nZ2vAafCacaMpA91bjHM/OyskfGnZ4e
 VTSTY7zVVioeLztnf50XMvlwwLxftgI1gZpkV4sPfpRr3j59/1ptjH5WzQDKcK/9tgLrGvkPang
 04EFdRfFP96P8BbpGZqWz7hVcdLBN+j8ad7yQn6qZDSD75MLUtFUWC2eKVU85KRXQfPPEl3CiKt
 joudpW9RdilgHchptQA==
X-Proofpoint-GUID: npaMUJS_epzH7lScFsZqBP01JwkkRE_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-109264-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EB165B2C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file. The herobrine
> has special software configuration, so delete the memory-region property
> which wasn't set for it beforehand. Also delete the property for several
> IoT devices, which don't enable IPA memory at this point (and don't
> seem to have IPA supported by the modem firmware).
> 
> Co-developed-by: Stanislav Zaikin <zstaseg@gmail.com>
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -504,6 +504,10 @@ &i2c13 {
>  	status = "okay";
>  };
>  
> +&ipa {
> +	/delete-property/ memory-region;
> +};

On QC*S* parts, wouldn't IPA be disabled anyway?

That's what downstream did historically on APQ-ish SoCs, anyway

Konrad

