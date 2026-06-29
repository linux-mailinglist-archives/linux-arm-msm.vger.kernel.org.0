Return-Path: <linux-arm-msm+bounces-115020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ltgOL1fQmrd5gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:06:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EF6D9CB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:06:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KWJ/OGHO";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MgoJWQ0+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33B273000BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7EC3FC5A8;
	Mon, 29 Jun 2026 11:54:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55443EBF18
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:54:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734072; cv=none; b=aoow/kqoMBfvvfiK+M5ImBmqHKqsCfkqqiliY9FQ/wqqjMN//R4SAPCnB11VtgoS2iZI6qlWZ9nE9SEdS2RuO0Xpd78F2GWKdxCwqr2RmhlJqxWTWZLehJufcJECsmlkl66ziUuxFLKwwQN1n2ciUpdNAOVBqhbUMUsH1gJY1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734072; c=relaxed/simple;
	bh=eCoQyVtCq78WJx8EhlxIzy5RU6WrPRoRkxI1UymA5i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD5yPMVaCS5cBQzTf3cpi7fgbrLV62tNQJwWHluUfbuo2imSf70xkriHtwF+SygHONBPmdNSwT44Zw0VWxN2jMQQpZN9r3l+heT9Ydiw48/hIbOGG9FajQBdToePE0zeG8FsMi5XNrg8SKLbdokjk0LxsgNv117cd/HhgkB75Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWJ/OGHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgoJWQ0+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATXME2628519
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mClBGsqoWOU5Y6dPYAFiYMzKLsWSBIwtM2ZQ9wxOdWc=; b=KWJ/OGHOy3hAcNo9
	UzU4CokIPrcBqZ60217gZPnWujuY3+qXs70XY30HzJRUE9zVsvYUORn2N+kDRkIN
	3I4Vlv4qxlqb2xDhvVLIlLjVs71QZhehLMkvgipgJUg+DL29M1tqjS8SsFV4am5t
	Zzln5ZA/5DGr0ZO4L2u0a6/a9GuL4PorjzMZvayJkIyShECec9Rq9XqRdpQcGLih
	Gcn7vaNwMFK0D2n8tyFg/ZrUtKkVN5F/tZDgaeoxXLIMRTuFz2sl/bXqsx2bFT6D
	FHNejihq41bXZLtBqnnm6jzwXqJNrtLb34XJfW4u25vzypcqmA/oXgSgY0RgacXt
	75H0eA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrq73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:54:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969312a613fso64829241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734070; x=1783338870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mClBGsqoWOU5Y6dPYAFiYMzKLsWSBIwtM2ZQ9wxOdWc=;
        b=MgoJWQ0+Tzwt1MoqsgPha1hpsxMSLt5uOhTTB8M0Wg9o7D7fA1QUSVSEWZIjJK7AiQ
         z0IHbU0oAEEAOkEHwvHms2I/jkRQG91OJ8BAyC5yk0U9xqkROPWhEr7TeArccVzcBJRA
         BtjFQOPZc72quxzwAWPWQn9Iy260yGYPhDQDzk5vFBLOg8f2cuGG4llswjnJgNxcX1xy
         w21XX4L6qKEYEyUCqtSMHgl1Plu7y9DHZaqf2mx4z0gLoajB1iUELJJhrymiU51jVwa+
         ycwmNdRMAmyayr65Wz0MI80YyvPqW9sgObRw3IIA+rJA9827HDqT/0SVAtgC9FeDprh5
         5lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734070; x=1783338870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mClBGsqoWOU5Y6dPYAFiYMzKLsWSBIwtM2ZQ9wxOdWc=;
        b=LkekMj3WseWHDYFFUM4tcdnG0D5nAY2UgYzAtVKF71FpEoO18nC8LTg8HCzGj54Bji
         iefQ4vcBLlFHfDy/0aiQ3fZZHcIx3/6ZRvSyfTz6VM3ZB6sI0FWibjYEjI+D/dzhnctX
         wmPGhix4IioJF75wGFL/qIEJIiAS7bav4Ocz4Mv4kUy6efknsT6qxxzCLR57mA/eZInp
         5yUVIHqWr8azCoxfBIbwflFKpDD4W7TC/EHeMGZroSWSYBXOS9824bBJb3Ybnqs9ts5H
         ExvG7ght87L67CaVImvCP0v3Qjwo6VWS0/ugbgC6qAN19AS7vnU7V0Fe60usP5PpP0hC
         +Dxw==
X-Gm-Message-State: AOJu0YwuLmbPsnfED9/EAQ53OBr3sKQXx8sJc6trCLX+Y0V86kKbIuo1
	aS4bXHFQeSuzaZ+PkSbp2shaJXvbgWarQrZsJwoprvXyE40dYQdHlD3ERYq4fiNiVCDVT1Bj+VA
	sJqaS/ek6oRp6+oEKTOhtyV7kv8cRCjsTcoTstgO47u1ESUnkIVqhIOUXkSEXenk3Zer7
X-Gm-Gg: AfdE7cnEFO+tVvrfL01PJBYY69KoJxHOqGNykrsZscxdJWnf+MK93KscKlLQnhEap3q
	f12/4Kp4+Npj1ecDSQJil9ZwQknI9xFJ43yBIj51NCurNItWGJjK9rnuBhC7w8iWCfvjVyYuO5T
	W8FsNHa5QeON7imXlo5aaHSIm4GiYYE35kfMvD26aohbCNQBWdZAN4vhdR5gMrLsq8zURMGsAlm
	HYVHRmxqcCZ81GClYSdLbJaTj0En6t64MZdzuRu3lSwxDX9ncJIerUvO4CdXO9729Lhx6+qvJv4
	wK+hBU9dHRrYpS8ZLoKeUZqqSfgvlzeSHMZi5KUnzhrGnJ63z/HoQFXnBKmwJkVSIm+nybwxc4E
	B2d1eaERuxyDkagspEmAYbBbp0inKCuFAQmo=
X-Received: by 2002:a05:6102:424c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-734360a22a8mr2291997137.3.1782734070177;
        Mon, 29 Jun 2026 04:54:30 -0700 (PDT)
X-Received: by 2002:a05:6102:424c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-734360a22a8mr2291987137.3.1782734069795;
        Mon, 29 Jun 2026 04:54:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac461csm6825877a12.6.2026.06.29.04.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:54:29 -0700 (PDT)
Message-ID: <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:54:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fI-6hfPYKEJ-LKrgbN-6NEKIk3M2fL1D
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a425cf6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YH5sNaOiGQQzhtlTIYYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfXxRMt3fR9/3ur
 hwMv5JbuwVNfVAOx8dT4aKugS/EwCFM2QqNfW7+wS2K4BrckEs2ivo8Q/AkHly8CjbIX/6wKZfV
 IL9r1qyT0EzVNPAlF0zVqM8kDN2h3IE=
X-Proofpoint-GUID: fI-6hfPYKEJ-LKrgbN-6NEKIk3M2fL1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfXzdAUtcxnPozE
 q44EplLAnb6QydTQm4Y2deYQIMIzdoURmLlbOXX1leeed52O6uwlB6Xt+j7UUsQKRiarbA2VD3t
 a9KuHrW6xUBq0fOoIN0un/4ee1t+TeLpUNjuplw07BwpmLSQDKHDItGnPhKASuhlkn5+O54+c6q
 N8u/wxSniFVZQitHmf+F/jImzl8yVBTfvxEHR/niGJWsXPftiXE87wgu1XMmmRiZDSre4ggxxuL
 X19chu9ZVHbXvk6KxBiiVwz/TlHRWByPUoIFMWyCb8htdkZMJ/tlFMyZfpQZ/5tbqmlVRmtZBXm
 ncL6J+U9PJ5DyCCo3T9Kfyfj+djUEtPos04St9ZSy78KboD+yz8jJLkir0uTTDLgYO9OWKUjI/8
 WwxFBZOxJPRor9qE98uHdwY/6hBb3PMUKovf/Q3dKEzpUJNva3IBDSIEZBYavCsv7DGYNTtCOWM
 FOQ3GaVjnMZzR5vb9Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115020-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D14EF6D9CB8

On 6/29/26 9:35 AM, Kuldeep Singh wrote:
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Add the dedicated ICE node for kodiak and reference it from the SDHC
> controller via qcom,ice.
> 
> Keep the ICE node disabled by default in kodiak.dtsi and enable it in
> board DTS files where the corresponding SDHC node is enabled.

Is there a reason to disable it in the first place?

Keeping it enabled it would ensure that the core is parked
if it was left on by the bootloader

Konrad

