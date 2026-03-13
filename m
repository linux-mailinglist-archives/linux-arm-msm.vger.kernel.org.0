Return-Path: <linux-arm-msm+bounces-97322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOB7GqSxs2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:41:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E227E412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E63B304F33E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FA7239E60;
	Fri, 13 Mar 2026 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWtPM5Yp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpNsff3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC42E1C63
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384089; cv=none; b=NlFv1EjQ/pIdz+sqG26exOkN0e+EEck5vhxTjvj2OLXP3BVsj4upVWfUAD4IJg3KZw8sbkGlXjnoUReulxN7XDLEBdmKm1sFpACdm8r0mMFJG7ACAXLPbyFnU3VtXHzgJqmUmeC3m3lFSHlehOXuXEzEDkuh5nkrsDbncZoiGF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384089; c=relaxed/simple;
	bh=J+MZmNAtVunpM3afd5gP0yBCjkR44M/3Bz0bP0QrtQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a20YMX999UpaGXnm65p/L0AH4jP4Ah7ba2j1v44PdzWyXrC4CQwE/vgqHBufcxW7HEYrpAPozhEAJZ2gtgE0qLsXWsuDPbrRY4jf9k7nhbuNW6uOHX4v2D4v4WbABMHbEgp87CloXaWJhWskRdU5qKQVNFXgWhpSVTksovYoETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWtPM5Yp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpNsff3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tau54140706
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7QXdJ7tj6E3iksFvgUS1D03C6SBD6m7C+J8f7QOP1g=; b=kWtPM5YpcsE7Z8lc
	voXZXHq0pORew4G2cHj1nXA1X3vl/tcvhzCzimYzPIlodM+UvKue1aM6wUP8YwTe
	w0aFHuSHcLaYJbleqG/Mp3/TDzlercXEXzEo24IXo/oi49BkQPj3ZLgvRfghVCX7
	clntxB3ZoL0NO3cBhp1TUQ51ejRjBwkuLlL6J8WSrBa36LU1p8+9iZi0lR1bsyDZ
	5MCguRU12LsZlycT0dndSaCcwo7J+s7ZeohyYHhQnFhqGgTIK7l2fUP4Dl2mZe51
	0FS4WPX5+5YtN/qJe8KwtuBn0rm/6d9bkhvSPBn4zNA43olwv5XII0/NBj0eCWSp
	PDSvow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn28bf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:41:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a203038c8so883474a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384082; x=1773988882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7QXdJ7tj6E3iksFvgUS1D03C6SBD6m7C+J8f7QOP1g=;
        b=dpNsff3KcwmE5vAxR5dMY86wnmuPaiMbLoUaO2tFvYX0YhSPa3PMrKwFfwUGkcRrkI
         gbgCAU+5dTSEWmbK05LsWnfLadxWaBwiOGKOYeY4FxJqXVohEj4wwvP497/ezYZ6e5gq
         VhWioV7we5I5WjtfUEx1kshbaGgzj16BibevxHPIAHTdvOdy/nfuZyypFJztc0LL6+1u
         fam1q2jAAKYshXtIrVawm5WTQSl7NvD5tgh4puFGMPxUshDJ8r0/BYePzlFekB5Ia4G3
         5YL6Y+6rruwj1I+Tz2HkDypcwKhezbaOpuM9Y/884JzANLGOeznLLwtPptHRGGnJDQwl
         fZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384082; x=1773988882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7QXdJ7tj6E3iksFvgUS1D03C6SBD6m7C+J8f7QOP1g=;
        b=nlLdxCEeQ6WP86gFpotsw4rBxtT/k2GewjFub+ymRAlJHMWkRbA2hYDkj9Th6Qblji
         xGkpoFmNMzAFv3GkmGpiwiU1RzR0838C06Fjbw6BNUoEZLn7X952/2+ni/8AxQXB4Lzs
         H2jd+/O/zaV1drVBnrhCBw60nj7Mm7vdXsMuDI9EhHqYrh0oOfNhzWaW7xc5sk4vUJq1
         RL6iyrJXs+4tiwCNDHydmB1aIXUflK8HIXb+our/g+zz51nI7Y2bH3pqjg3yJWltdb/6
         5OnK5Q/s8HPkMm417yER/tCDDymvve6NqyhoRwvrMpaG/ivFOS+z4xNy3feDJeGKr78Q
         jB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgmlIQNHOvzHRa02wWzq31cZk4PtuMzGox0I5DopDfhAtoMfVgcDDoP5KrZkI71AvHw62+U5yyWmqBBJmm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjpUGT8M7yPV5xWNAdqIwFx6qvxXBtHkuwk8zrxQJTmEqijbvm
	EmY8T4r5QQRIIjaZxTAWtnEZ1PUGsWs6YyDSwHPKzGDJhPp6UN1tkNGCc4PbIGsrAE0trKQzEtO
	rTmfoIxsMyVEjpc4bJoJap/FALAYVYEb7VOBXSV/PhGHFXqnEAVptCujulAWEuHlbsN/I
X-Gm-Gg: ATEYQzxp1YOeNTLTHB7mY9dbf7ZYq/uTP6yM2hJCvDXHKX/1HEOXyCbN1S655Kb0J67
	+rByBzy7hntpULy62TcHO09gkaK1N8Pt5MOQMcRLZ6+RglqV6r3fFMp24KqRZNbiTDsmkcgUuqk
	P1ZDsL8u/JmgOYwgVqgUD9iqbBcbIMlmo5vFS0RFtkg9sifLywXSNUW34RlXO2Uh3/3DU/NRdqX
	Ht2EuogQdAtv/HehdCYQ44p7GVnfNpY3bXp3TMOpFJQ6k5adShjescN/MlONpY9zl1vaSfV1fJ2
	/uJtE6pu0wl/6qA/vHPFucVVaormav+5BNOIz9UKjBZ8IGhgQbfhNPbGytoTmNFulVJDQRXBt5s
	eZdY1t7IGq2G2NaZPvzg/aCMCdhACocPIsj+RUrCBRw8B7H9Dq+c=
X-Received: by 2002:a17:90b:5284:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35a22003d20mr1794111a91.22.1773384082478;
        Thu, 12 Mar 2026 23:41:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35a22003d20mr1794098a91.22.1773384082022;
        Thu, 12 Mar 2026 23:41:22 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fc97356dsm8652522a91.8.2026.03.12.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:41:21 -0700 (PDT)
Message-ID: <7f834a73-b482-425f-a1ff-f4ee7415c927@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:11:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
 <5iego6aoed32zjkbs67tfyi4df6almzain7fxcgll374maazyy@w6icqysf7oft>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <5iego6aoed32zjkbs67tfyi4df6almzain7fxcgll374maazyy@w6icqysf7oft>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VW-oov7E1lVSPX2Eg7dD2oewcHxlQMKJ
X-Proofpoint-GUID: VW-oov7E1lVSPX2Eg7dD2oewcHxlQMKJ
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3b193 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=XrqnnphpdDpjlOXJA1IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MiBTYWx0ZWRfX/vGJ/yo3tanE
 VrOrQuLqNAwI4W0CNep7YDyPZ1P0+OUWw4Qk9KcAUYPgA5a78bx6sqKq+1wabUKqweIVkyTCL7z
 76nt9j3nNlGu+WAeDYENWQRa2rKHoSpLCavYYvdyP3v7YR4jDgsrBgMciu6KC6tbi6EhwZEuFny
 VYCoDZ0TsS/VUW4Qx1C2dRnWHv+lyjRNLRxWq1aZHHdO6AfNs8IAvk2cWYxgGIkcARsKQcwFsdI
 7mMcMkwGUIl+pcC3CBdUrUcD7sIUtC+QSuHIjP3zTkfBULt2oP2mlITo8p3+8hkC3ACc5nYBQHF
 j/gCvDkgLEB0q2z7zCBRtgUI0XuQa9bNFshGEeDHv1x2P02UquAj1uXQ9yTYKBK5ZoZ2xtCCJTG
 ErJf8WXroeEhPLs8aTkQMYK8q6LMk3yFjPoNtooXilNTyESofRhi55kjh2LLdjjhpw5IHT0XY1V
 YBFJr9KgBAaMfDRHQuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97322-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D78E227E412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 8:00 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:

>> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
>> -
>> +			reg = <0 0x0b220000 0 0x30000>,
> 
> As you are touching these lines, 0x0 instead of just 0, please.

Sure, Will update in v2.

Thanks,
Maulik

