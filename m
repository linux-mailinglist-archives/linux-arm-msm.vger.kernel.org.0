Return-Path: <linux-arm-msm+bounces-103448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFvfEyn+4GnzoAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:20:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9B41088C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7ECD315214F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668B23E3175;
	Thu, 16 Apr 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXJkIBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2hmzzmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73753E314C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352657; cv=none; b=AgrjANRiYHn748bkcBExKTxm5XSl9imcA/8O4IygOUFnUW/dQn/6s742UiVvVEEWXlhm+T6Vc6+tnrLlusIYLljIwXX3Z9ZRKURx7Rz0kpqhT7fhjjhA42vb3Ax1Au7SRaGhSAtp9j4eGeApk2vhS33zBNEzH9Xy67d9PY6QWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352657; c=relaxed/simple;
	bh=Y9LX7R9+xvJZFxNo9WMoAQ1JYWTg+bkpYQnvouL0PCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXCK6YgPcwG4c+qfpmcPVTem+KPDX77Uzk36RNa6aDIrvmkO1p4nUp7X/XJ/D9Bx1QfaW6Kd1wm5pqPJSdpzwyWxY7DPRpfhncU10PZsyQNQHzc/y37r3QIyKHTevDJK3X2/7BrGuHe4CiX+TKRF65PSz2ja0mKtjh2z2wGz4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXJkIBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2hmzzmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GDqpMY2596390
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=; b=GwXJkIBnO8vEVG58
	EgVKlZQPL3fZjXcXGGeqWrdyqQHf2PSvtNTeBzBHcI6xJEpXstE6TNM1WZM3+xfp
	wL+98aKkeHZEmFrFtrdE37/VXOwdt2v6HHdGW4e21JkYYhGIOzPmjf//pNP7zihi
	11BuPlNvvaVOFRr8Vb6V63Xyzrur8/5Cl4OM32WChWxXxraoeg3w8+jmENmQach6
	zJy4IhqWBQWLYkrxPEXb4LKnsMZa4jhJb53upzSfB1QiUvLl1DfN6qY/GWsfIa+Q
	p0QOURpAj5f9mbKHB/gOhwuIkOroh6tfM+trwOj1tlONyZQjCJZY3RcIFvQ46yR8
	Uhi+lA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk11r8as5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-611bf61a809so309997137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352654; x=1776957454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=I2hmzzmb0c5tUeklxalLFQJgkHKlP5H+NLomFBqSww0HYwHLUWtHnW7u8/Z/8OrFw0
         TBsNqRwAeBR/z8HXUhdnKJbD4HpNPNWO3chp+vhDGmOgf47ns4ceBbEiEuVaEg1DCsQk
         Cck4edpeHexXYWOvGuq9AAM86SyCW13ry7Xoz9X48VNFj0qefZhYCT0GIe97kZJx2QrA
         i+LOmIgVQ+NiUudnipJvqp24iNxPiD8yixO591tVChDf3i2dpJHOE4IbbYtRk6Pc4fSc
         lfBYI/kwyYxR8oXVU+DIqN3Mk9JFPhsh64fw4iJrjjji7TKOoRICbMmVi5EqTDQNKgW4
         VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352654; x=1776957454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=eNyAkeh7VLDR/GrIxtFcQBgsoJX0Oo6YpsjqqA8W84HS28mtcsz/UmJYHrZmRLXkBr
         vYPTk1s56RaD4c1HdQ75Qylo9upUmpx8gsvLq4HsbNlATCkoGNVi9EyPLy0wi8hQhpDW
         NeTN+VxvoGxGiGGfNLM556pt0fnzuHX5bfMI8xyg4qNJfpeQd6n9GXmbaW1yhVkCsW7g
         2VG3etmD9fNt1vOp9t+IoKJBdvGwqiO4R90D4e0sVgERiN16C2lw45SCBTpWlwdL/EGO
         sIo5e0OjEKEMo5FxZtdMDRAD/Ct2ae93RtQ6oIFmywVvXHSKO+/Um0lEMc2VtWrzGO3Q
         R+bA==
X-Forwarded-Encrypted: i=1; AFNElJ+k5OLFjjuPbcUyISzyNzCpX/DJr8CKECw6uLkqMQO46DVZbHsKTKywB0suSSoHkiaZVkxsiF08QfaqGxKH@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJSlq55kJvg2x2NP9M9broFLZYBGfw9UCZSYLsLZlAQjyM5a7
	IvZDsaT138zb0U0duhGgZHwQDZ9mKZufgmvCt9oeYE70bbbIP0WqXYrM6d64AA6unK7wUgxsLKM
	7fI1WugMSm3Xb14Ol2ilUd7+XbU3Za7uu6ymGXhI255jb4Gv0JP9eLjO3c2Tub6HTxTFQ
X-Gm-Gg: AeBDievY4u9Lb/5l3aEVolZ7Xz2wSujyRTZ5TxKa4Vpu4p9OtOmOf5AXSnBKl6ZO7OO
	vucTXjfa0AWO4y63UeLYTqlhvCYkWrDHRE0BBTmJ6QDPelqJwKQkkSqiyz898ahV7n31+WHKlz6
	hS2BE4hgxr3VIfEGBWgsilQhzH6jcAvppZQMM/3IMr88paY80gbnqJjmFMQfTO7veWAqI/iofIZ
	qY5ZcbJOaoqZmikYx3iHK59ePbRYktKbWJYlkNcQBZwJPMoX9gtosvkHlXM69OgFkkzTQVFVJWi
	Uh0hx/pdrzh3QXtIYrb2Nya1+diy+y0MRfzGG/Ax4xF/p4ti+DPQqHYOgKnd60s/f6/9ygnwRpB
	ty0PUXpGjkt+B9UieAdK4gRLEF//BwSw7qrR2W1dq+WIBrIQ4VMwBX76EFI91LCPzilKpmXIhn2
	eegebPttEJ/QRasw==
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280265137.0.1776352653993;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280216137.0.1776352653539;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c3ecasm181609466b.44.2026.04.16.08.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:32 -0700 (PDT)
Message-ID: <379806e6-f855-4960-922f-26e3380b4afa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX+ps8LqJ1i1o6
 wmsgz9uqkiowlfJDVD2Pzzn0UUrSyVYWZ0Fw3Qihrc3HcpqYYsK1FaT4+kop4gcVzErm/sM6t7w
 U4+vq0YFfwn4QREgrLiNNkC8AzBZwVncmFnAKH5NfqfGXO3wUYLkBGmayQi7ktFUKBzkyDZUK0I
 3gE4SZ0kT/pqOOB5XXxWKgct5y6YRwbb+syf106y15/RyJg4gudVwrThna9VFSkiaAPxx8M276h
 A6MbLYEgYrFr6Q3OLX/cHS0G7WR986TddoPBogfmsUPwwn4ffgTcYNfsPFGWB2hnIw4jaAMGhFQ
 LhTGzvTuFkspA/TTxL5lB3LxL5XtarWbHankbyW8jNRudCle+XcopDGHVwPZElswK3yg/kaKCv2
 VLwmExbKf/TSuE0cKFjVLfCIqffFS5MqzrF1WJtoi6XYje8HyCMDrm8VVL4hmoUNk0ST8DmsaaQ
 ebe5aQVNUtwRSOlXdhA==
X-Authority-Analysis: v=2.4 cv=ZPznX37b c=1 sm=1 tr=0 ts=69e0fd8e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HDjIzE35AAAA:8 a=PzOwlJsuetSFvmXlP_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: CrZRAtxa1HIiql5LjrvTtmVLfntO5B6R
X-Proofpoint-GUID: CrZRAtxa1HIiql5LjrvTtmVLfntO5B6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103448-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E3D9B41088C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> index 13422a19c26a..48514c3df718 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> @@ -314,6 +314,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

Likewise

Konrad

