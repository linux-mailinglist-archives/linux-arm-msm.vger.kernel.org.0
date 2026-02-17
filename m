Return-Path: <linux-arm-msm+bounces-93178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPChJuZnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A314C5F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4A48300753C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A2335A928;
	Tue, 17 Feb 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg2j5Faj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEq+Buc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B435A924
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333604; cv=none; b=cr7f6t++/7EqjQxfa/0mofZ0S21py2mduEyaij89l4At07iLIZTBfJzhYwLbfled+RQbC9ZS7JXAxEWNvDcouZ9T7urzLbej0ar+KnE3/3bW4b8NmcNswt12GBIhnSwU/JCdSU1kWbLP8pdtLc9DCuNqnb4QmBCeJDvbf2j5gy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333604; c=relaxed/simple;
	bh=XGDYv8+ChssJeftiwtVClAwzyktY4ZH7V/vRcYP5oVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QNz7VRldyMmltYlZdqDf/pLxfjYHDzz+E5frwsIKHLsf+XRZqAOU2ApE58PVqN3TLSSGVT98c27plKATrp1V5jCDOpb3be3iavaV5LNDONb1jaFn2tgj2uOwIMXJh4zfe/cw3A0wvEOXYh/x7HmERhXTJxe44tv8dfufq2+KhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg2j5Faj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEq+Buc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCSYN910827
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=; b=Yg2j5FajEkyzhS/n
	+2ph6RNeY1ywq/V78j8DaUgd/yFVMoXmEcRlISNXYKvdQl6s7jBImNMmjy5sGBi/
	Jcgzb5Z1U3RfKV+V1h11LbeGdK3ZmSOqOpYcZYkjojdD5udjCDrnVCUM5CjCzXuZ
	Q0PrVayx+sE+PotecvOVIHL/vHJMvREgFZQhnI/f9Ayaz/QWqWufh7CrUNBghRJI
	QdgOTEVjn4sPlCJciGGdHk6y4AwKIMO5NVQiFw6KNsudJa05kI85KYUm0mRZDtgy
	iZuPmA5G/3DIQVsyUF0EjSahjWmEhbM1oMttUxPiPuD4CKEZU0SCKkvmPI3uUmzi
	xctIvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9tfb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:06:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so311749485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333602; x=1771938402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=;
        b=MEq+Buc9j0EccU5+q8/tKwfqpp3P/WUKuhe7lazsbPBS8Qb/SprV8oDNE+v3Ql7pW/
         8VE7QxG7VHxmTKm+kcaN6BLoP0oMc1Ke2PfBJxnuLYewt8F/GJINAjgv5blBfBTb8+Zi
         ri84xFVeRRWJHiBgQ7dzEJL3R9EOsYiZwA28ZQBDF+Etcpulja5ARxFhliLM5qTsCQ8D
         hI0nebjIA9Ajgefw96m5jH96G9axaAo4KY3TYVeiPQL0YJGcRPtzyQcsFgvI9c7eYEWf
         UgCpPw9qisTn/fpbyJ1eNr6D4f/4nNnhgMasXie79F+GUIEtu8I8P85k8oNSPFaSJWjf
         qHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333602; x=1771938402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=;
        b=hpAs9uBy6aTivxS07axgThkFh8lfEkc0N5c47F6JzG3KwKU6GWl3DYAx4g9NYRgwMo
         93dfNI/lVQXfsiJ5vVKwjlPjNimZ0iyxmnx18bHiOGA/H+xvBoFGfaZv50tfBnIrQNmn
         RiNsonrdRZk240xhg/LX3qfmp6yFKaDr/cMo9P4ZXYWURuxKRx3VdzIAVy6b052clGw9
         N2B1ulBHe5h+5gb7v1J1RuaAubROw38S8ixcPP04lBkC//QGE0ZOW3UYulfPaTywSKxH
         jGLs09yRli8eVwcIepjIQ0wT3xrnbUunrMd0UI3JYlS6GJrdY/OhRUYSq1DvPKMsEork
         IPtA==
X-Forwarded-Encrypted: i=1; AJvYcCXbLaFdxbHiWTaGnZtnFXXgcaggdJtwobGVnJatghP9mYZK130uB7i6gPsTuhrYtV1iV2ffTyhfr9psovLT@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXQGEtCcH7tmnKG4FqJa5We1vt4H1cs/axJTGFiszxwSbqbUn
	cEioDdJ6T1rfGyj/yf8HUMnho5Ttl5CmKLV7d2c1omKCHFBDp03LvtfDAekQ7rHi/K2MHAFrYl/
	j1qzlZjN4sgMVwcxjH3k05jfNx00tRodpR/n/X7Ly4UagoBu/0SelqjAwvnxVUD1nOY6h
X-Gm-Gg: AZuq6aL34wMq0i37dZKLdMLb3CGqcy++upH7neGiTPy2PMO4fXIJIAOD1lqCGMBhpPd
	BBhz3TDGYvZVBvk2QzNTMmVv9RA7q+s6O0n0QySKz0GHy4Pj+FL5k5DD3AJA2yYZCuZzX0Fr6lG
	PnRry7Oy9rmjFB6EN3+9pIxvfr770mdyRx8b9fRV3IZBLEIyfEnrmaQo5NjD2u06meceShIukMY
	Pbh6Xb0USeBrSVz21wP+LPtzudRRv75Q+SjRG3uhXGkb7PF3ZTteOSlG8m6Qc31U6AuFzqF7ZCb
	B/eVKCjLsjM2tfrWGHnPMjJd57S1L5uYhR9WPMl6lg7eNCgkSctXrFhF37A/U3k01KeVFQXNi86
	ZlCuBUL+AZI+iXf2saxa1tdBPvH17Xn0gATEjYuybHUgQoYdob/mHGIhe/877lYumzty/V/MUMJ
	/KK8s=
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1339104085a.0.1771333601806;
        Tue, 17 Feb 2026 05:06:41 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1339100185a.0.1771333601372;
        Tue, 17 Feb 2026 05:06:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm2497219a12.0.2026.02.17.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:06:40 -0800 (PST)
Message-ID: <1658ebc4-e8a2-4fd3-b587-918884181d49@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX7bZQwdqGObZZ
 G28jIOb52j7RjE5VXM+XAjSRXRY9efA1+D2HC3ZeHdPimhBMTGdyaJSVBqiWQXEeTmotTEcVZLO
 w8bi/SbpbCKj0hYP50vX+ow/AgmqoQYAIXk8TDNSDT58rFN2uiio/+N2oZOdFtEP98PGVyUzMh1
 UX6d/rJYSjmMSmcnvrto2Et6krd3B6n9xGWgWt5oBUMV7+IkLqcN015XYhAOBLyaMjv2Z0g3h85
 RX1TikajBRyOA8UTsDZ5CmWSEHKbyl/HRUhffVRrJ5ZAusenkAe6jrX+/zFLk7+G02FB5awZ7/O
 wrhHDU2tquWc+fG/WVGddrigt7bgVQb7RBWDlcppWZIX2OukvAJfMB9hHYUinHoNH2dP4ndtIZP
 one9r8sCerwcimeES2y6DKBk/flnRKs6sAiDaLauMYT1v9d7PIaQyTo7uTfN5rhMsCwoy8Kiuid
 obblIZ1W5mpy4MKMe+g==
X-Proofpoint-GUID: g0QHfnLhOT1zu3qLltZAvZBoIqtD85qL
X-Proofpoint-ORIG-GUID: g0QHfnLhOT1zu3qLltZAvZBoIqtD85qL
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699467e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93178-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 441A314C5F3
X-Rspamd-Action: no action

On 2/17/26 2:00 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

