Return-Path: <linux-arm-msm+bounces-115176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJ3LDfKJQmql9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:06:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF46DC72B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:06:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UWnyyYQY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PQFmAdkZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B03DA30440FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78235426D17;
	Mon, 29 Jun 2026 14:44:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BB4266A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744270; cv=none; b=N1UdgRFfJwpA9Ey9xZWLPUi3/517NmNKnjgQpMug7FK8zE+bhgKjOGtgNn49DBysTy6YVB5cX6gkiUlNLEPHjdbaa/A9Z/mn/MsnnVSGud0LGXmhT19tVBrpgS2e/vrRiLh7I7ypXktlNW6sHCnxC7IL1MXYbt+KXR38D1tsmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744270; c=relaxed/simple;
	bh=VY4WrvcbVg3c9j4t0PvvlgL3gXNchz1NJrdvaXZQ730=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N39wYhsZhF8f1kvh9A1n7RVHHEwNLnDFCoJwWCSKwpVjok2xCT6sboHcjBbtSsw6AccXURJxJfxB2xCNwp45ej7Nf+HVajgjMssgbUU44AwDw8jxMDzYbWqFvIxBUi50hyH5YBJXtaA6tRErDV7d0p0JD3GtSWtFQ6P/Uhpz8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWnyyYQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQFmAdkZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5jTl2729668
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=; b=UWnyyYQY7TtlIZbO
	6PTSnY/amyftL+fqPbu9JwET3kbTcnwZftcwKuHJ/n/mvNajjje4E9otmBfpKLrb
	00qlKSo3u5KfgcmwUIuYKIJsK0HOnrHaOtdXhsTRvDRA1CaD4D5veaeLWw97aVz8
	z0reNb2DvbkJLq26P8GVGW+m0Fv3r+HSKzNWd2x/7hMRjjLBRNcQRZZ8aM+VjcD9
	yAOZgtPhRIcuTx5Ms/IviqlNmixzJqCPS0UKc0sgXjD/AAGG1ettGxqgpa2Jeei1
	0Wgnap5DdmvScQraDT914U9fJTtNOd1GHE/Kb4rGUKxBUdLVm0P9GElB2pCeQWEk
	voYZqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8u4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:44:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso138879685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744264; x=1783349064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=PQFmAdkZrcy/bRcxRvhUbngoZ9hk2n4b7wiZ2fcaw48RIeTCx7C4fSSJIk+FyiLk73
         hoaEypcruTr5HiZ/kFlJ7nyCh2ZQDHSWlzrIc0CP1U9pmPL19U91vQK5PV6P5W5GmqnG
         Si5JYv5qaWVCU4A6ru0OXtgKRHoUZp/ZhFgjtQ8wYhZ+7zLngo/bNUAF7fp71ztJz0A+
         DbQXiGQd1k5qtZ84mI+mBq3ytFy5SXFN/U00sJPXzyg1H1JMRnMwvZovzssuXOKEP4dG
         d2tCslp+N7ACjg5ZLP9qOYIJlLMXctYS9nKec9g6N/xBKSuW7bWGYQ86Kd/EslRBFyWY
         eTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744264; x=1783349064;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=HZypL9wr4cHEvGYAWjMjBAe9HVaU4nlhvTeKoqLX6gaR/ANgaVqstsNDBcnjFn6iKx
         ChoLYvYPLWDeJyiyIsG9+qrMxYkEXm3Rt1SimDnwjmu4TpnpJRoAZKh3QzIRTAbAD95y
         zJl3Z5TWBvQsWOVSYmqIZofynVUBMqKPmuEiUH7GQzX0zmfjCEj2ZFtdXe0HWZC7KacR
         U0yeViW5BX7458APnCWyi3rVdpMScQXiQGXVmx2hJ/byMJnmNJM2Hggco/XHpyR1RYHC
         eFNvA8E5+DW5mjnTTGLblRwNIg2/WWJVzMm1DDU6Vgep6IWu4bBo3xfVdOOuPfJCklLH
         FmcA==
X-Forwarded-Encrypted: i=1; AFNElJ9fr2dc5Ep7p1jvm/Oe19qTinGX46H3RTdmz5aYZwaDahJbmhHj1sBCygR7dyl/5USDJIehLaqjE5cZv3Dr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx658UeRQjNz5WcRFAfVcsaqaX9qWpKLh9hz4LsPIaQJFDvRE0D
	oMINuqnj6HW7lXpF6QCVxF/h3vrnO65rQr/2Q7lIIoHyzmaAlLBKXybj9VuDFNVYOGZ4/NSg3Jv
	wimZyxhs2I48prW/q48eLaDd6ITYQyQpfp31nw4XHuS3D3eg+zF9pz2kwS6y0ECni+U93
X-Gm-Gg: AfdE7cmVt8HdPlV1oJdbR2CkMIFAfMGlZmB12ySRbRM+CtcH1s91zBSBtwq9APUIB5W
	8F+aC2tAVOijHaTE/U/ed9QnkjKpuZmjuBYI2YJrUPBJ/AXB7HGtYJTZ/ALjlzJGxpI7C91SlBz
	vAxPo8MmQIWdCrzsquCspPaNIvkD7eWyRl+Cpba5xt+ipnTieHnJLQ5jskabyi02KtqqE1LpLzy
	uK6hJxUYAbIcPgai9pXB+saPT3l6mPtJku1i27nMtF5kwkmVeVK2DAcj9YLPZO+I1uQjewKT1xx
	V4m5/3UQz9psHR58mm4sz733TF53PoTDp6LYiolRoWi5r4nZZQPfMepCWmZpk9S31EgXWezvu1B
	XCLJmBcnpzd4ty0GP2aBS6TcpguVJDfj6R3fcBdrE
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161353585a.36.1782744264455;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161349385a.36.1782744264071;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c291489sm238997765e9.2.2026.06.29.07.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:44:23 -0700 (PDT)
Message-ID: <a4481b5c-e7fc-4619-8a43-ac6ffb29e2c0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: prksLrblSWnk8enDqSFbcY2GocoUYopf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX0nzNzjwisbNw
 PBDEvm6P/9lC7EhWHA7Gz+Gob8Q5kV6ojVjOMB0VnB4Eig14Nh6vI4z0WIlsnR6jPwNdQ4+qfoB
 O8psyqYVDn6crLRT6oBfbFVbYM+lAg6VIlW60v9rOhDFHJ8qthVIiaGEsBctPvc6/ARRXHaYvrr
 WXwixo81lRFNI9SQP07OpixTHy9nJAaYcM17WG3DnUl8yxizTiXBeocv/v38vL/2+4hA2s2imzu
 EjZpJ/M2Emq7CWj/oXclmoRJ8mg/U4wJ8fMAy6DcVlDN1B97Cjd8iulr78JqQ7vIr7NKbvJ+7eO
 RHDZN1L/jkrIwHGjfcSm6T+MSszzf720YzjO7XWZpaC4HPW0MaTUJTE9DUj9F9uoN6yRytH6VrP
 WwODlY71gjVF614J/QqNel445HjPtnMxTqEYx0QBVSnKtu6oQLNlIJGIEGtKg5rrCa4wqr+SCcp
 xRypu7Le07yP6yqYx0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfXxFt+04C7i3OJ
 EaaPeAAIr59eAfoEdH5usUIPY7KMMwiuSriF7jOKpoSPgm9XMjD4b1eLYhtv9nzmG392ka4IWdB
 1q8ZnaEceyAh978ZmJGg6u4olqfCkMg=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a4284c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QemOWJxP2g11TSFizz8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: prksLrblSWnk8enDqSFbcY2GocoUYopf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ECF46DC72B

On 12/06/2026 11:04, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
> same as PMK8550, thus compatible with it.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
>    previous version
> 
> Changes in v2:
> 1. Add fallback compatible.
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
>  1 file changed, 78 insertions(+), 73 deletions(-)


After some internal discussions, we concluded that it probably is the
same die as pmk8550, just fused differently, thus does not deserve
dedicated compatible and patch can be dropped.

Best regards,
Krzysztof

