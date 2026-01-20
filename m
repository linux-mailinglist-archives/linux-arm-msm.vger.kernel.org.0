Return-Path: <linux-arm-msm+bounces-89812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLAfAdcScGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:42:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D74DFDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7BC95EA0C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C33410D2A;
	Tue, 20 Jan 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLWGENni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsvFBj7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07D32939A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907014; cv=none; b=WhtsASS2VEb+r66xFF4IlZU4vDcjC4AbX8FRlsjCXMQ4BdkJk5lifrKwg+SeLBLdGUolVtwHX99nwhCHApqXS8qEFN1zspWZiLJuFOObA8Npz+ZU9bEYmmlXY8QsrVPPCngyz1Xqxk+tpdxzGNSLRtWk2scZBdCvVImeywLEi6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907014; c=relaxed/simple;
	bh=mtsPTsLVD96QSs7WS2fzwTcLKDOpeQY5sktuXGChUH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSdwwMYbfA64MK9FIR1go/I3/S4T5Ks6ZVVnprZUR/+bKm8mcfrUsduyuOmTWw3eW5+qZTHzFY5ex5a8Mpn2+5lZpNEKJbuCEhFIRT7E9TKYWSx17FMWpQpZnnFCRXUcEqFeFD0FhtfRmDXnKA+Sjdz0VlTZncrrK+yaSkoX/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLWGENni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EsvFBj7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6ik0p3154291
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyA1fH2htzdyzQNcxYwhjEsKldEhukBQeTM4OwMWwXA=; b=ZLWGENniSDL5KkvB
	gIl17NgV/3KgkolMtNR+QRNJfBamwuET86OHqF578h1yy1+IeJJSG9erPZZ33qoD
	B7fAeY+ckfOCBXsP6HGW2MIDBHXuR2erGJpEEANMp6XqLvyaJ58iA0ZpHkmnQMzp
	PHMRjg0AeCuZLLIKYMjTU0CGJBB/V3IY2X1c5CMxFxF82i/sglEiffCSmU3Zpb3/
	4t1fYxQbfmfaEr4d9Km5mgKReq1BLnDxf7pyOVHpU8pKoGiqjObRe4RcerHx9hKP
	vf7VH86d1tf4LCDdPCiZTJuLtL3pvc1jhih3ao/mw6cwfVXqZsPLQkx/nXdsE0EL
	taWCuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q50sun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:03:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b137e066so42301985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768907010; x=1769511810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyA1fH2htzdyzQNcxYwhjEsKldEhukBQeTM4OwMWwXA=;
        b=EsvFBj7l8PFMz47rSaIbGg9H2LX5R90uV+viJ/wAsr8ahUQC9l/xLjh2RtFwBBSgdX
         C15uJiRe+mZDSdkGDtye9gnPMif2dsSdmRVXVbq5q3cJuNUrdzg83CViFNzeQVospQuT
         PJvTJhzroPGZj7pg5pWcAajNF5XQea7IRvk0v1/RKrK8xAXppCXYwmbfd/wIzzDwFlz0
         cOeySbvDWaClM3xswYArD5J9RI7UAQAoGYYXmbdBHAiHLZtn3On7vdM1vDjoqdAL3Sq0
         SjfOVqKIy1Zpd3EFRDzkX5jAarmA4iva6XUxqWe59xhmk1S1Pe3LF5H7yNWrjNnqnrMk
         OOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907010; x=1769511810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyA1fH2htzdyzQNcxYwhjEsKldEhukBQeTM4OwMWwXA=;
        b=e0GazAtcLcZxqS6MeW0PFbFqXC46ADlrP0eT+Quuc8Ef5rqzDtNoUfQ7ObxQS2D5my
         dDWZuU/bRhPFDDDVPmmJBE1AIDs7e9aG2nCBjrxH1LapAo+trb7K+3bbahQn7nE43DGg
         nNnv4hfWnGOHfsbZN2JHVe9UrUPB6Q8l/QZY3iJyNVU8tajhm7dA0y4wjEIYtZeg3qjH
         BEOgE24jgwiVSI+UwfvUgpt/lfXFRNr69XCkIHGQR007fZ1Z1r2T+hdKnUS2f3K/Z92n
         DWGkeCpOl8qEXdOtR/u0ea0KlSo3Z7AF/YaiCb8LMnaGkthz769ggJgZXvDX5Mrpq99W
         hTMw==
X-Forwarded-Encrypted: i=1; AJvYcCUyCXr8fpa5XeYURDooMUcqqvdFaEWy394LMtJkW5gtUgTHM1UiS8Koolk8OAGHdiFC3xWuJv0LHqiRGTe7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KxNWCgyhfJsvXnX+H/Cslptt958uyAUPpQ5zDA12wmYgDxkP
	DdQ9y+Sz0Rl8VcQ35Ht4CBT/YcphT/P/4kDbIKhMAIX9Xi92k3pt0utKrWtJtJtChlQAbgygvrv
	Y+trpxYjdTmHH98pGdaMjeGy352HK3DdjbS/NONyPsH7erVn1VEVl257jlujQWwEsuVEg
X-Gm-Gg: AY/fxX7Tsq4bnAwTZKJ5WTcc/g3PwvGSXCkJeeO1NcQFi1JbWDpo1WdQXGQ1EoX3C97
	UorexmWt0FOpYoQFvilVdWn2z4bpY+HYRL2lMwN2Ee0TMelkdRmvceU1+7r2LJxuWw/gV3zYA8c
	LqWQzZgZAR4AuLRzhq6gi5DwCLyALL1rf90QF3HcjDR44OtGAxVKY4EDwrSsz7LPt74D8rIOayO
	z9uUCkugT02G/7+By8+b7BIDMYdyCCrwesu9klgLqPp2CIBbXagrfLaPLHpHoywAWUBNKYLooWZ
	iE8RJXisw0w21W58uom3AKH2yaiqnUY7HOe1hvtU9s8h+zqUPRI5tooK8uLm3GnUARVZtS7iFhJ
	sL20qoPEiSGTDl/YA5f0/1JaRzchKoIQiK+Is1k4wDi9quhJGvS+AvAZhxurPfh7ToqQ=
X-Received: by 2002:a05:620a:28cd:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c6a6783a3dmr1456076885a.7.1768907010025;
        Tue, 20 Jan 2026 03:03:30 -0800 (PST)
X-Received: by 2002:a05:620a:28cd:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c6a6783a3dmr1456073685a.7.1768907009425;
        Tue, 20 Jan 2026 03:03:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795169dd6sm1450793866b.27.2026.01.20.03.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:03:28 -0800 (PST)
Message-ID: <6ad1855a-acf9-43e9-a8ab-303f553eae77@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:03:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color
 sensor driver
To: petr.hodina@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
 <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX9RBaVx9wl151
 4MtAgaHSRxoPCh5fFBJbBjvgRZ/7o24Yz3heADdpiCfAaR6dcwjN37NbQvb00x40GJO159Pv2in
 CCRSWfHcU2scddWIbD0uMIonTmf79ZlF1yhTPVi0AB5eTrc9J6YP6qnl8jHjAADYkvCxupvsTDd
 NrSEqBEkm3kwcSAVAxaYmeTqsFV0BvXYfRwXYaF+TvJ5umZ7DF99e08TbDXLGf/l4iEYPsM8bit
 imsCF0hyww4hpt7HV29MHH94Li/w2Q88qVrQ522zXE16qtLbSulN60wuNQazadOnJoLC35XjlZ4
 a2Me7Z+IA6pCIKy/zHaHhypN9e0IT2V02RidNs+k2NB0PijxqOxbhOasATD4zEbx1EHbZJggDMN
 5h6Xb1lyEctQZ7Ycg59hBIiVc0bLS0o0XjA9CtwRMrGZWPCOJOhFBpoD1rKUmel6tNFu84FqlK5
 iqwSCQSUEjvSIS2xYtA==
X-Proofpoint-GUID: qRFKOdqioh900O_otpkcpWTv9E3NjPcY
X-Proofpoint-ORIG-GUID: qRFKOdqioh900O_otpkcpWTv9E3NjPcY
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696f6102 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OQN141zOAAAA:20 a=lLZmtIKjAAAA:8 a=sfOm8-O8AAAA:8
 a=5smShmgdzqjJoumddFwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=q5Nj8NTjyn2D8kUwajRn:22 a=TvTJqdcANYtsRzA46cdi:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200091
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-89812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org,baylibre.com,analog.com,ixit.cz];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,protonmail.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C9D74DFDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/19/26 6:19 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for the AMS TCS3400 I2C color light-to-digital converter.
> The driver supports RGBC and RGB-IR modes, programmable integration
> time, optional interrupt-driven buffered capture, and regulator-based
> power control.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---

FYI this is the driver that shipped on Sony phones:

https://github.com/LineageOS/android_kernel_sony_sdm845/blob/lineage-23.0/drivers/misc/tcs3490.c

And it seems there's a datasheet available:

https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/897/TCS3490.pdf

Konrad

