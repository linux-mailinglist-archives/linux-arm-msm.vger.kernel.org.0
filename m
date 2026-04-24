Return-Path: <linux-arm-msm+bounces-104461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEGZGIZe62lGLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:13:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8C45E41F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0354F301DBB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094273B9D84;
	Fri, 24 Apr 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJKIkNls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbj95eLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4C2139C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032770; cv=none; b=LMpE6nGhKugDCRPEf6KLxiXo46DuT+W5KhaajnYFvYvS43/CF892LUBklPXbzgjUcqCutXa+/ee2z+yo9FhvlHFXq24kQ19cXMU/IESNsz5BK6vRyQ9aZVp3EE7vgzajfhZEFEOXeA5ocJP2qQtrhtY/T9RivajGsuCFEaaocZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032770; c=relaxed/simple;
	bh=6bVEhxDPL/ZWx1/XX7ho824LJzK+ojKXWO7M3Xs0DvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqUaCvFBUgakO2/AcjcBQEGX1vK3jt2AAMCOqUnnKPNyivl5bIyn9dvi5pUFFfe0RL2NXAsGv5PqqqgY108cQ+CQJKWXnvq7XfDeT350se9sqaJGMv+S3582N/obtnPARf/+JksX2gHaY05Yzzt1f4X3g1MWe9Ezwqlf9Eq6kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJKIkNls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbj95eLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HuAu756696
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=; b=YJKIkNlsV+6BbCK0
	njsoYlhr57NAcstghLD43m3zyCi+cS+uHT34wT3/dWlOmXGrgXy26Om28Xgi1VhQ
	MoJSMl6kawvgEOWAgJiAV78eBoB9ocivF8HTweOTCmir83k+ysEA9BrOBM1mURLv
	4B986ze67MLC6T1XyBWSJiOeCNY9K4ncvLXBjDdLcAup7h8JZvAY6zkAPkQXRLP+
	1mxLodqlGahJ+KicTaD379w9+2Nv6Z71RMxrV4q1e+uITO21QOFANXtm3l8f57Gz
	Uq7je0fHhwy6aMyvFTE7eEPYSqqvHH0XaanFtYQPxH41+ko0HZF7hr7nMyUHGLeG
	x54QWQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bm1u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:12:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-612ef4e6c54so12785350137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032767; x=1777637567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=;
        b=Lbj95eLpQpfjnFqghApC9pfLQN7XlPRZ/KZLFPT9wDSwNNRXVNBpmvFL884d+gF2Rx
         ZKOnoXFMMj4VvETYwfzuSIIkOWJ8ODIJcKlZkhIwUW0Fmzhr5KJcp0UAtXnqXPiyIK7+
         PKP0hr6VpocxssdZ3U7Lbpz5KRjHQYUdZv5N1Ce/JFusGigEb/y7VAPRZRhq3nSXQoBu
         IOXP3iZzqB40RcOrdBcJTIXLRArmlhPi15lnUUtbFxgfCSQzGEOjJh01M3yNj8gwILqd
         GcjCgke1R9KfkGLtfz4QzQmRFUWxWqkqBQWsq2CJ9BbqWnoAcKaoqSID8NQ28XRgQ+vD
         Tf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032767; x=1777637567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=;
        b=iui3PHcgaIV7WceZ+xfzbRJcMOgIftbltmzwBmbgGxCQhDGT9KQp4iWvoo75oLyB6K
         4YYRpG9owI8W81CX2Fjk/ubVPQVM4E6SyO9PAQ2A1aWyhI3m3LU6aMA+t45vYXdK4WFg
         POgRQGfh8cYfCidhE5I+As0SwedlmnMD8Exrpw3qgrY/IEFfG/LXuFW0hm0ekO+gQ410
         VGUg06VK+l8u+M3A+wSmjG91A6PAaRsamI5fj/QTVcbAamGiHue+v9mk6k/8NhpbzCnA
         egVFfmsWa4SQ37yQuJ5UbTR0xpfZp/kvSu2RYvAKB5AdNbWOPiasbivUvSo5ILCP1kZY
         tiTA==
X-Forwarded-Encrypted: i=1; AFNElJ9r4P9DogWkPMzZCD5tLdz/ZVcJKCnCDtVPMu3ScKkEkPSJXo9vVyG18Z1v8XQNDKz9OEhjRLT0mz5Td1D1@vger.kernel.org
X-Gm-Message-State: AOJu0YzqaJL+cosDQE6Q61pjQp94J2p3+cYFxXCWHxdqi01/BhdrhrK8
	aqGza36CY7h8D1HzXFdkEUH2LkxOD1cltTIaVboAcBubHhrNFRIgb6C/y0mccPfGYeXY8RoNgoM
	/Wv22pintIuImV3kJjyKmgGFwt9QQtxB+AbEUhOW/ibHlKwuklYCptrODK/zZqMz+rVxX
X-Gm-Gg: AeBDiesnSolYCuLNtG4qXypskScHTaCk0GY3edzj0wV8FsvyEeYOX7iXAj9e/Wdlr67
	42msFXZrcQOs67ha7hGWtNMypI04bzKO9A3QE3nJ7pMZZSJQ1Z7SihvZnjgqtOtE28pokq6SloU
	YbIRpkV0dLK6guHgY8cEhlh+hAZOLSPPohXGHFsYr8g3AH3NopqdfTjuNCQBqCrySdVVfGQ3Jp2
	3k2PcpdY5z1fyukgGxT1TfC7XV/P+ggB14Esu9Xlq2/2FszJMS1BGc70hD/ZQ+DseUlH6RmWY6X
	WeSc6ieFc72ZySk1beACWkVlAjV3jKb8OwlWoDEDmmz0xXW0fg5UysvO2esfAZ2EWz3SN7pBbRL
	IkgOweuL1U9Mfh3l7fxCSvPpht45FFUvoRHNKxEiut+1Ds6E0rXAz8MlGXdmQDSBTnZ9Qrkp6rs
	2L+6AmgDhlwHrbP/6uzY4=
X-Received: by 2002:a67:e718:0:b0:5ff:cd6e:85fe with SMTP id ada2fe7eead31-616f58ac93dmr16827054137.12.1777032767309;
        Fri, 24 Apr 2026 05:12:47 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:5ff:cd6e:85fe with SMTP id ada2fe7eead31-616f58ac93dmr16827035137.12.1777032766920;
        Fri, 24 Apr 2026 05:12:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd? ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bba6276sm183047835e9.0.2026.04.24.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:12:46 -0700 (PDT)
Message-ID: <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX8qKsVWiMH4Od
 TDSkV2CTgCxKgb087njWn+y4CFisq236c2nWWrkgDS15wVazVDDfbFkKGIHrr2BLewtHm76hAJk
 wrFp8IZzrq2zvvYrPDIniPu1lkczO6CYJRjVVxrwLtaIaUI0ueJSMcSp+cvIXkPosFfq2ysf7tn
 6vtaFDz9qJxDc++0kLSJHeKedrPn3zgnXXzoX8EZoNKnlmP30If99o4ALz73g43wF12xqfYvLbO
 hHRhg1J8TWxg/cUF37RQiHpioJgL1ynmOfnbTFtQshSrPBxDB357C+cNhAcofa446gqYFmZTfFX
 frMHq/qen6GRIuKpSeVcV1B9imce44leFw7o8YZORDRri0YWChn0SFesw1BYuOmk+sne8ab7QWv
 BbcOjptchhITJ9z+YkOttJ2sR8MjV9NAg+4r2e0CEALXTRueHRtolYTlhAXV0tyah1Mkk03hXSt
 THjAWlNaZrTo+T+qrKg==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb5e3f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mK3fh9KgnU1kiJb0dKkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: XZchScouWjF6GbTfHmd8BKkCATqGE6ab
X-Proofpoint-GUID: XZchScouWjF6GbTfHmd8BKkCATqGE6ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240116
X-Rspamd-Queue-Id: B0A8C45E41F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104461-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/20/26 11:19, Pankaj Patil wrote:
> On 4/20/2026 12:24 PM, Shawn Guo wrote:
>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>
>> Add compatible for Temperature Sensor (TSENS) of Nord SoC with
>> a fallback on qcom,tsens-v2.
>>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 
>> ---

Krzystof,

are you ok with this change ?

