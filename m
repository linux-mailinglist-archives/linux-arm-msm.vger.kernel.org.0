Return-Path: <linux-arm-msm+bounces-116191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2dTEatjR2pTXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:24:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B86FF837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:24:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aOysZMOf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IeUh3DJK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 798E630072B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E43349CD2;
	Fri,  3 Jul 2026 07:24:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383033F5A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:24:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063460; cv=none; b=aenzxTy2IF0NF0BYbT7V1D2J9ERsuo8CVsUA0PxFHD4FHT1Eb6piLXNkSHitGgXZcI3RBaQyujyKsmCoo/ArW7JEjnMBrasJtXqZLIrnWSwAsD9ikqvbd/N7tidqVHAGUvM4TI8EDrvdk7jRmRDFbw4u81Q6u61aQ2hMrwyajP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063460; c=relaxed/simple;
	bh=Q0fDnW//0DVjhRM9DnpeSvIyrLriPP4Imkgl9WHWCEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjYsLXhyNKI855lePnQGBKTRuv41qKjcz3Jizgl+C8+BD+a5vV35Hz9jriLwggTCvQrz1zJxeeMcXcbLXjIukxuXKAl4LYIRwpr8O94X1p9GLwrgXO6GISjN57MO8/Av0ZmqcrLEMw6Kf8CfrK97kT2hIhUKCMYiqfCqM3bIV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOysZMOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeUh3DJK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rc003129091
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=; b=aOysZMOf/mPAnkQL
	r1+E5CpZcy7Q0BUihO48v4O8OAe8BgI+B8mdfbFs/zAJdGnauqFvPn2dV/9zu5c8
	LBKZI4LSNRvnLh8q5k1DjB1bpDe2HUG8yvnEk8uVXNOw7GIkBIGOwrqp2hFh5V52
	2WZp9vKDwT7X9ISXVA1pjYdFicNy7usTJcIt4ThMaeLeW3sfXtUQbxv8HY5/LYDm
	15aUssN6BlXXiRbYzdORLvtyrFgHwMV8jrplwO+ma31siohhwWIGguBVUfv/6Geu
	PeMVvHzmviiNX0dmvmtHJ5dYuevQ7yOxlreUEc03PNVCubETk2HrWxEml0dfkKSy
	2bwgpw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4ea0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:24:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f3951a6d76so573246d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063458; x=1783668258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=;
        b=IeUh3DJKu0PpWCa8tPEf4Pyoz2Bp5iDDhxsFYCRsRqG4bJroqyB52oOZwvTU9DzX/E
         Siwo+xYKx07esd32ZuqW5uh7mBlGHAIictoAbMOxEusnyOi3FTZSQzZqA30Du1jG+P26
         JlFtXsIYGcE8X+hY0318X8N2FuqFDlrFa++8+wC2G+u750gNxRh3xbwx/a6EObv1IsyG
         py4aJAr76NckH8qahlVwIqK6GIeL0BO+Yng8eghFJxrmMbAofY4/vBRR4o4nMmzZfima
         itY76cxbtuYs3iGpj2CtTG4RgDwpB8hBwVwxySKcOJ4mHidkYg2VPWn1m5vvxRfvNytU
         WkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063458; x=1783668258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=;
        b=Kv08TcQxIeFhjnyUL23Tra/N+mZoHzc3cjoILJOuRLy9/PsbzSdxI4QysDXcv9g3KJ
         4XsDxDQ6Fw9tydKRoe0/2vHQ3//VV3YTEOM1ZwPYlqvYeVsiPysHIe1IvgGjXYEUQIj8
         HCCqIYzCL9cg02Adc2L9VL1Hi7AU99y05hBLm/pH7ofRgZoGeh7BK3hZAA2z+yXTgSyI
         2UCpoPoc9XFvA+cxhhtA39ROP3Ai/O11URe6ZW+D/tGqsG+BbwBohAr+U0P16krB15Wr
         1l6dMh7O/M/scqq6CqfdvwoMhuaQk/PsODNP5z9sDFMPVMHN9ZppaXsgjojQnpjeoMbC
         YzlA==
X-Forwarded-Encrypted: i=1; AFNElJ//oIA3ed1CYZBdrPNounO0l4hMCRHqUhqQIUbJa2myD++LRIU2vd4uFpCjEz1OoEHeceCN3dMR+iqeuv9P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/9mKBkPhxvFdzk1YGpuU/r7imITnY/1CeoLsgZHTn5NS1/5s
	EP5y8/ZtTc/dzKySa1/td//kkZoTplgoMYHvFy/lqb5jYcw90vpImMLaOw+QMvzCQDRhxx2JoJS
	a6d/SudnU/Vl9o8iVgo2oScxLypfX4iWPlilZND853Ka0Aapc1jXSXelnW5kF03ug6f93
X-Gm-Gg: AfdE7ckPYPLPuIgGBQVFWKNviCKDt5u5KMc1KxXhrzBxJ9fjsCJgy72qDFHhwUh71pS
	OBfcFZxLNMVC9tCHwGUth73pKB6aPgiZWw8SYua6XNT7C0/rH/07NZUqzJzWDcDWgMrgFh4mrtG
	JHPBLHr6+3xq0lpoo2zAf2JoeMHrvswkCLUEkSTrFEjBuEWSYkFYxozXf8JhiQR1VwdH+CCV9GU
	jxvNYi7CWeOmJ2oTGLjQ/Lof4PqGokz3MkD7gulTFtggsB2zEuE+r09/wy7fHWij2aGWjBgBU8E
	Y05GlKwrdQdetVtKoAzU7C2Ojt3RlGZ9EkesxSztB/HeGCHxcmeWGtjiJzx0HNmXHptNFUfpis9
	nflgh9YiCmP2gfc1UqZG8LdmdV9antl6nYWk=
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr83017491cf.0.1783063457748;
        Fri, 03 Jul 2026 00:24:17 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr83017291cf.0.1783063457360;
        Fri, 03 Jul 2026 00:24:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16064sm1967767a12.2.2026.07.03.00.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:24:15 -0700 (PDT)
Message-ID: <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DN1dfppZHKTY58hhZotYoNFObfVqOeMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX+XjZ6c98l6AT
 8JSNYSpCDthKhIOeqOrVP8EGpfeAzQLqUtvx2yXc47LjfJup9botJly85AgK3N6DO0fwaGDG5ZH
 6nY8xmcuOoxjcxGxblV0IVb4GmbpfronF6OV5flmtrp6INEp4Sy4IkeCAB7Ro+H9Zz9GTo/Z+sl
 6MvJbpjbqota7kaFacmn1YoiKF6GDSZLjM1VP0wJb1QdNBOaT5t+gcp9aEJmnFzErkfvLLkehqX
 DFgGAldpWRsWu+pgDHnt0zbn/Ym5k0vF/fHx6BgogPPyLc+EUp89uFQVz3OxOtPOW+ghUmCWeJz
 1ddClpScMF6mjsvdrwJMwE1TnjFoJQ1+9g5A/ZKlyugCx8ieF4lPC6Z4bqbYTbgOrkBz68dKak/
 nBAu/lGW/dsOggxIQzc4E7bAG9o8OuEK4CvQYh9WebPMyCZjoO+Oy5OC72OtEcKTQ/2EF2Qkigb
 OK3TspJEOQeAqKwIFvw==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a4763a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PukIAH8WhZ6bR1PtwjsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: DN1dfppZHKTY58hhZotYoNFObfVqOeMU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX2cYk1Kxo9tsw
 957WQsfYW1HDg9Ben3WXB1mTefP0/jD85zn5yyB+WCI2CbXVbrL2PFM1GNkcf4gvC3DM4OhSkSc
 0UUfHoqsNUmtdJnhonR05q76YoodCYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116191-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489B86FF837

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
> switch the GDSC HW and SW modes at runtime.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,

No other dispcc driver sets this (other than kaanapali). Downstream uses
this for when DISP RSC (which agatti doesn't have [1]) is supposed to
idle

Konrad

[1] (well maybe it does but there's no RPMH so essentially it's not there)

