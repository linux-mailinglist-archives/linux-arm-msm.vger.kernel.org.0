Return-Path: <linux-arm-msm+bounces-92763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +dZLJt3/jmkAHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:41:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7BF135303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A96305C8DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0681D353EE9;
	Fri, 13 Feb 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8wQiOUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsR9w/ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F012634FF44
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770979252; cv=none; b=SpFO1TNHg1M57fEF1sMdjNIqQLb8/HBJUB7oMGQMXwXotrSIJEMfG6pFoj6puy+x87KXkch+k3K84Y3sYuBUoTDlhoILHMxaOKWeBbfM7SDVebXLJN8ScV+y+XB7gkB19kFQUXUbbUVxif6KfL2mU3rAslg5MLvki0YwGFqZdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770979252; c=relaxed/simple;
	bh=5pXvfPimy+gE7qy5hwxOSF7BJUq8BbzgQwsiCbSXi3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjfrX/RxYZ+4+39FSAB3o1L3jXQ4FY3a7zRvIZPtP5U4NyiWu2vLwheDvi8pyiffg0d0nHLELbW5n/qsmhR8fbpRfO0XYgaQPbN4fBC7EWMHO0WjQR5HanK9bDPKAfAXLCr1jqCiyXV2v4QJulVVt0JAim7TQ4jx4xjJJcw/33c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8wQiOUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsR9w/ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7V93u652470
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thN46HB1IKejKhh/NXzM6XclQUWFKquWqcSHQXwsyvU=; b=S8wQiOUiLwGrnZoc
	xPhPOu3JzHJsvb6WGeEYylmnUR2d1+AZRVi3Y4RCxje/GXFsgweENypLyn80uzuB
	kGFRNckTZMN4QH9x/fhNxDFKOTMbHUgBJU6pxcgocM35L2fvL2tfMB5hdR5MSiCq
	r1meHEJcknigI8ofa0WeIXpm5EG4WCgLvyTApG8zdNrOR+Vltc8PxDlAEyHQKYvy
	UPID6q5bJObVuLWxYQLGp7v13NxnWstcPw4KT4KzbKj2hZWZxotknljoqXSwEGn9
	0Mx1FmvUB9/blDHoULeE629abG5Wm2bgImxI+jqbEkRr56JpMEdtln8lTRpixfDQ
	xE5uHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbm2pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:40:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso5519285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770979248; x=1771584048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thN46HB1IKejKhh/NXzM6XclQUWFKquWqcSHQXwsyvU=;
        b=XsR9w/olNJG3FimVJQoag1Tg6bGgf4wR/z7S6mFB0sum/Ib+8cs6ZtZ+Lfjv175u/X
         9ZEbDwDLWFHFUwFrNUE4l0OEytHZ86KNtLx0r4eNek8IxU+xvMgTgqbWxzMbeLo7WHC2
         tp3gw0rkXQUVCGHcC1SDtaquYVY8oa8vdZ/us7cCxPj6f220e6dsnZwMRyNdoop5UMR8
         yJ5cqIwHsbU6jja+sdzRSI3jPPwcdwL1xVH/zKVg0hzSoDYrtB78kaeS8cR8Q79wstqD
         SwLZhBi26btLiSSs3RE6+RL1hEZC6I4/zGg0X6OnhWLL9ihpn/VTql2A5om6mjYV4GxX
         DPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770979248; x=1771584048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thN46HB1IKejKhh/NXzM6XclQUWFKquWqcSHQXwsyvU=;
        b=YtTClvEC4+qIX33Sa54FVDLh/bx7WxfDMK2/TiBQ5kc7TvqRZltl80lvL5WIkNMTL7
         Ie/9Anxl24mokDVTp59prhet0zx0y86HzyKyUw27UmlzwNGbQuAJi9wGG2qBWheRawI1
         W7QVlXH2ySMuZTLnWW4AsyTyEGssw4ossJt2XRWLf325oULiKY+FN+yuDXazU1dyY8U4
         dZHE/31eY4KUjZj1SYNWNrKLJflR/XyQhCHtA3zsy771qp6vBgNNDkqSpflH1OM6C6pj
         IIWpeAybdaWZU3f0Mqfrk0Jiyhu5jIRpG2zh/jjc982hngsT6EHlC8yTeYQxWQoGrOO3
         EU0Q==
X-Gm-Message-State: AOJu0YwzI7dUSTLOvb+uwnWL+4Np1Jm0aRG9E4ZiQ/FPBBgAZoQw4Hht
	E1mr7C8j19EFr/vMPx0GdEaOp3WsO3zKK6nB1R2T7OxUYUa7JW4nBofmiD9gMqzl1r0ZsdnihDP
	ZLfjIKGxGoOj5UuUair4Q2aYSUEDLL4BO+gOj35Zg6P4QQPxOMADsPxUfSbvyCUJXSBLd
X-Gm-Gg: AZuq6aJcfAO7ICrevUIPcyeHHxerKsTbL9x1aIM+H679ViNo5oC73uRWRK7Eo+OjUyl
	H0sU7d6V57wAT6DmZeiuQvhRX/YyvJxjTasiZsadANbd3pnVULOvg3LywULVP64KaJFPy+nygnd
	oJwxxbLvwjiGKCbLJURfuHtBxNj6GMyC9ho6/un2/wz63zIAhg5eM8E7QOl9pT0BlE/MssQRkQE
	twTgw5cA8Ig6mQSDYJ4LcLpZ8TvimNfC8TIBuI7lc8QIlVBneCMW3maIrsQJmkThNa6a90WlQIy
	Ik2Wzrwhkk9RwGNk2xPikWBr4pEHCuApDtSe4ibIGXP64ocBDLYjviBgAycBRYTC/vvF4conRWG
	brZ1Ra4z5blAloJacA402hW8iDZ4BCmEuoG3dmz9QTc9KKjV5tamHGFAQV8unf+0C8vGJXi60oZ
	9DCOY=
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr188185185a.0.1770979247884;
        Fri, 13 Feb 2026 02:40:47 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr188183785a.0.1770979247419;
        Fri, 13 Feb 2026 02:40:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm558653a12.0.2026.02.13.02.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 02:40:46 -0800 (PST)
Message-ID: <6fab5c21-111e-4d47-8d89-bf26403de627@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: arduino-imola: fix faulty spidev
 node
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        srinivas.kandagatla@oss.qualcomm.com, m.facchin@arduino.cc,
        akucheri@qti.qualcomm.com, ndechesn@quicinc.com,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260213101002.105238-1-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213101002.105238-1-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MiBTYWx0ZWRfX4XUPwjgldbY7
 l1c6Vjq/VvGw9O/xNzAAhF5aCWD949zsHg2OPApdUex91rUNAj9qskg3budMLZAUJkssb5mwHeA
 E+J2txL79n1ZJ3DN5wIz2uZB8EKLubPwJxBZP9Gjqw3BnfzlCd60xsaf2PycukkE/SKnWA0FnXN
 7wFEMy/RYmptL5qc+yPdpoSM02PTHYMW8dprGH0dXNhcKibociLta17prmhdLh+6czAOPa08mgY
 O185MEmG7v+TXiwy9gwlMI054dJof+qUVr1PiQBlX6dLBxdkUUrtKFGDs0RU3VWeX2Yn4XDqj51
 nDrgC1xFfdX1xV9VsORPJus440zqecMglrlkAquVtfKYZIEz3x4mWnc4NFai5GfXTeO8UaxSS5E
 coDjD9BnPFzWsWuRtoovr29Ye+DTPGC6lu3AgWFRkgx5/iQLaNdjDAEEaxHB2BwSQe4E08jOmqZ
 eRxT0J+afIfzZS44okg==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698effb0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=3_et9svu4ZaDDkyybMUA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KIsnShNFUIrHAKTo7bkuPRqhhGtNxEPI
X-Proofpoint-ORIG-GUID: KIsnShNFUIrHAKTo7bkuPRqhhGtNxEPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92763-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B7BF135303
X-Rspamd-Action: no action

On 2/13/26 11:10 AM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> since that GPIO is already part of spi5 pinmuxing.
> 
> Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

