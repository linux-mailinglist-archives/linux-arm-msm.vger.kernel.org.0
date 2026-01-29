Return-Path: <linux-arm-msm+bounces-91176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKn/ADJRe2meDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:23:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FFB008C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECDE8300251B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2533876A2;
	Thu, 29 Jan 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RENB0jQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ic4+Xhgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A407385524
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689387; cv=none; b=pg2XHYT2nuz/ohWWKFQ0xgqExp6SQnfvB9AuDBt+OzTYOYRqacQA8fBZZrVNHqinEO7WkpgDXibNRufLxmYl1gy8cXisyF/7cG/aePLZXMEPkIOguzmwAHKXcU3H0R2qerX2T3yFVu9HwkM5ih5PaxA/MC7lrYdIn45eMBp4bZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689387; c=relaxed/simple;
	bh=jdbH00HnNju74dBpAsXf7ufwLvO5prtWz5fSqnJYxcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf/w3SNPaGmCfKoesnWUUVvsV00VAgsLg1KZ/kjQXzwkdT/RLKsicbixKuucbFqBzZhU0BgFKJOmKqCcpN/CCBNvIY4tzmgwPRqyGb/T7cQjgStEjNOo26hUgo4VA3FtSTaz150pdXTStHm4Fwwyv8Z1/Re4dk7C75E62d3A044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RENB0jQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ic4+Xhgw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAmGQ12953995
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLts6ISuue4uiGMT8/YFzy9kgsEvBZLokoaOLt1tYBg=; b=RENB0jQNan7XNKgf
	eyF8aSZ01hBaxySmx8WIC2trIEL/ATD7/lVY5PJhFqE0XWRXw3bxCWJ1IzA6QxNj
	WleBXxBEuRVsencj8XsgiHekt5wkvfMeNfPds2ljHp3Y4Xt2Jd1sGkxZlA9rwab/
	QNpG2rFdAQA1RUwMKOsieLyw7o3SGYoJBV0y2FcZ7dw/UtSy9It8CpMcnisYEk+K
	u0H2jhvpg3BEcshgiRg3jUtM1W85ykxmBsES6qbMclW58rOKXDIDzAxs8UtJIbqZ
	m/tzXb7RPsNS7b70I5UrpmdI3bAbF5HzcQT/LhfFAb8ydNqtfDBSbdgMbZFaJrsV
	B7mjbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c064208hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:23:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c7177d4ab4so22912285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769689384; x=1770294184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLts6ISuue4uiGMT8/YFzy9kgsEvBZLokoaOLt1tYBg=;
        b=ic4+XhgwgQ3p/wLT8van2jgqwGmKQ8qCFLwadh6Ysfhh9/afmkuD7flMSlfoD80ygl
         f2+hakyjK5AJ0ipk0+LbwUKw84Mh4ZvVLa5wjgU2VWvtvnZt1oIgKiq54PUpC5vVCkCw
         yT6ifoaPgrb1kli1U2SEZrdypLRSH9vGVsssYQ3DdEGYPTfr+bLP00v9RMNlTd08ZADb
         EvMSvrKhkHnt+j6/3ASXxrJ2qvvvOC1Kh0GCH+4Tf+iPXZ2/8AFIQs7015yhSmUBzk4D
         jgBXdvbSishE4NKvKKQIndFoqHBudZCV76UmL9mebythvATqpEVS2gJD1tP512KMuHuB
         /PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769689384; x=1770294184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLts6ISuue4uiGMT8/YFzy9kgsEvBZLokoaOLt1tYBg=;
        b=YOnX+KlMaIHhOFiWLq3v6AoLu9oYwOoD1QSVxqmmsv5Wj/QbXtDobA7AEMyBT7VA7I
         1s1j9eFrweeKfrdGkagbJ9q5sGQDgmaK2pvkCkva44oprVh0caurQJ3I5zoidadYLCwl
         8FShCpEI2zwQjr/2Gq//ElUJ9PYoW8gigvSRLT5XvZ70LZ5YIPOhvnTs1SKiMmqrTb4y
         VdPQUEBsUFjkBbjHYD03UHZNjHW6TXOR4GReB3UjLfud5IQbXeC6509ThupHHraAofkv
         +LY/ndgfpw0NFpG8QhncFpaFQ+EulUWbwO1pDxHUfkAvIc5ekesbdbexpqkkfdFifFDs
         /jlg==
X-Forwarded-Encrypted: i=1; AJvYcCWxB/sIQNL947HhgfD66Y1iqo2pcwnFdsTuQWAGt/ck01zq4j+2IFTDhZsdbzJqZ4mzETGjy8n7wGz7VCBo@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDi0Yuppm6l6vyPw5h+MHKwQnuOiJ3N+xLNT1MWSqPP1+nkFw
	tP2437mhABKN2eoKqadjMxyJfyrmaTcTXqm7FbIdeOE10TY2IzVwecEIYb5qwCliSRiU4Twyc00
	yUCXyOOoPsQMTAdaekdTxyx2brIBJzYlV3SEK5GKvVQCt8oiFTfVvzwTAeSD6PHY/vbIb
X-Gm-Gg: AZuq6aJrS78xgRmywWF+dhBe0TTmXJL9qCkX5JE1gFowGnvkkXfkrP817vC2XU5hnl6
	wqYjo0oejh6Dyzp+nwlNHC5DDyV5Xq1pF+mVv0Nd82HXASr1jUyD+EuO+8BlEdXTQAytK40QikY
	yyfThQFHFJLDgaMnDqI+cmL9RM2UbrBn0iTGw05j0dOso1GgNbjGJFXtZ1Rk7HUHOC48wH0SMlv
	+kYNlihKvkjYD0hePTLV8J7qmm7eDKhPPZ1zZPaiWNYAVywp/8dgsWkIIu5nkFiGix8EXw19ZAE
	npV5x5kSHxyuAqXwIS1s8zuIf7nEsRGkoltVYKwxlhi83vp5SXY2m0V/o+851eDKat0T8YHOrta
	ADVzBklwphtMSKDhviDWLVmX/u2/xLmrRfHXBVHbDMMXo1lHSusasUHCDGxQSdfJmKxw=
X-Received: by 2002:a05:620a:700b:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c71ac32e95mr362599885a.1.1769689384250;
        Thu, 29 Jan 2026 04:23:04 -0800 (PST)
X-Received: by 2002:a05:620a:700b:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c71ac32e95mr362596885a.1.1769689383816;
        Thu, 29 Jan 2026 04:23:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a35sm2829564a12.1.2026.01.29.04.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:23:03 -0800 (PST)
Message-ID: <c67b801b-c2a7-4546-bd31-c3291b690ba1@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 13:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq9574: Add gpio details for
 eMMC
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260129062825.666457-2-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129062825.666457-2-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NCBTYWx0ZWRfX97/88B3bjSaE
 55Q5xpwckewsLicVna3JtuMr9VgqAViPQm2br6AitMth42/FIaUwaoepHzaIRhSNz8bCoiHxtxy
 Z2kK7Enf4+qLqRRbk1Vk5/lfAAOAWxEpvIX7OvJEqfxuqpBeuSkhiDj8ADsf12cJkHXFtfvDreR
 n31sPPIQXIwdANlR04YDwf9HSrTQXNcIjIfjFjxQrZRJMhjc4aJ3m3aI3jcbRvcZ9Ln1wPcQoAz
 Rwr0DizhZvcWBt7tzuEfTfciugSZlA+MnfAlrAOgbexeLb+0fNY3DDb0ugPeh3u6lrlzGuuU6yx
 saK1pyQt5Sj+ciwz3l3sdlbtxgeZmeAAul2heRcXhNiHOVbIEHB67wyXw6qa7YEqyJH5c9TYQpK
 ME7Ono6pM/LvCy55eCAtRo86KF6VYpP0OdpS6nBJ4TuSyYq6W57ozAnVSVMCgnt98IUq3ISl53e
 tq+eNqsgmzH80ehZ2oQ==
X-Proofpoint-GUID: mHaNlW0tB4VpfNzK1YELBWLVaIbdv-0P
X-Proofpoint-ORIG-GUID: mHaNlW0tB4VpfNzK1YELBWLVaIbdv-0P
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b5129 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aDU20HDKTo6PiRKR8JcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91176-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 112FFB008C
X-Rspamd-Action: no action

On 1/29/26 7:28 AM, Varadarajan Narayanan wrote:
> The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
> supported. To enable support for eMMC variant, add the relevant GPIO
> related information.
> 
> Do not enable NAND by default here. Enable it in board specific DTS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
>     Add 'Reviewed-by: Konrad Dybcio'
> ---

[...]

>  &qpic_bam {
> @@ -179,7 +211,7 @@ &qpic_nand {
>  	pinctrl-0 = <&qpic_snand_default_state>;
>  	pinctrl-names = "default";
>  
> -	status = "okay";
> +	status = "disabled";

This part should apply to the second patch, since you now broke NAND
for every board that had it running previously by disabling it in the
common DTSI and not immediately overriding it back.

This must not happen, since it impacts bisectability of the kernel tree

The solution is to squash this hunk above (not the addition of eMMC GPIOs)
with patch 3.

You can also drop the status=disabled in common.dtsi, since it's already
disabled in the SoC dtsi.

Konrad

