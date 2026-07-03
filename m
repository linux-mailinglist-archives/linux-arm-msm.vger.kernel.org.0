Return-Path: <linux-arm-msm+bounces-116208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I21TKhltR2pxYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:04:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4676FFDCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:04:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WOOADg8B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DowyvV+u;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116208-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116208-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A7F130A33C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BC736F8E1;
	Fri,  3 Jul 2026 07:53:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA82D12EE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:53:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065204; cv=none; b=qNVULqNQUpgyCT6xvqP9AO84YGE62Kqab0qW8t3723cMY7HEAeOPlw6psfqdu8IoWtCuDFaidf6jtjSFVeHV6z24kH1iPRn6SJefYz2ttmpQhVuWFh7ZUK8hSYOmEIgfqcg8NNuREE/3s4PvTvI61BC4862X0HeMUxjJxQL4T18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065204; c=relaxed/simple;
	bh=4GDXcUWg0RJJB35LWW58Z24XSFPlDFhzDi0gE68NIGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdlgRGcjlGMkgnf2u4pch0qgvkSfo2+6PhVWPgEqli1YBCHDWfcdHDz8X0B4RofLcCzu45HS5EWQRvslR0zH+SeXx9J3roKEj3OsflMvo7HsHicFIwnk/02uGE7SxNVOky8ivBYWHTYxvs0rQz33F9gy3ffsh/BT3/X+ic6R+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOOADg8B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DowyvV+u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368B8o3053832
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	my5LxqpeZJrLYDspU5PJadi/aHSgKZJwjD5QvHa1qxA=; b=WOOADg8B0zZOnxbe
	/L1k1s5BKYj8MsloinIr+OYMOpUNny3YPAg4pcqsGtJOLByl7w5qntAdsEImCmqv
	ftrsCMwrw9JCLEwOZcDvkWAr1ifbAReYE3vJJ1UDric3+S6UcXl41DOAmMFZ6EKa
	6tj3mOuhvphKimTBpx6BSnt3XseGprUK6h7E9R8KfV7TXKpe/xRbDzWClg46gIFP
	CAAMbITW2YRqqrCdAzUwFJU7gw3rIln5iCn8CobHLXYv8Yo4rvdawmrjr2Lm6aY4
	dtEDKzMCTlF7wvKUTmF11mtt8oTTYrZ+26NuLFA27ve5P2JfEDzwISkgHUCCzYgB
	/bY1JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:53:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6b97afe7so9650585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783065200; x=1783670000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=my5LxqpeZJrLYDspU5PJadi/aHSgKZJwjD5QvHa1qxA=;
        b=DowyvV+ufcJaK8iKAN6GxzmOUobiePUdySL00jQ99EJzEMjJmNS20qELILKdEt4k5c
         ltVOtP4NtfeI0YI+NfWirhDdgV2UB1Q9qEGB0pSiqkQbuoJo9+WphEerb31onTVh5czx
         zo0HolRQ3sl4b7tD/V8XLl2T79R7JYOOmJGhzvxlh3wp/PoIEwytUUFWaHV63fL9LKEm
         TsGARkcJLYiWH3oHdNbSNS1a9k+DIj1+kNFi6FyR5Z6cuBnjnmCobFcnZaF2sWdFMGKR
         sO9RtM0UGvISfznfAUo7MSl+Qn6/mj1oTgeuntB+9PkTG9zqbEuIpBPWnnHK7b7KZncs
         tDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065200; x=1783670000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my5LxqpeZJrLYDspU5PJadi/aHSgKZJwjD5QvHa1qxA=;
        b=J9f4koa4zK+gDmlXuz8IcJwRQwrG50IxuRzVZ4rJhLBD7ekt7Xmg004g/WCzvZhn9r
         4vDKMZo8yW/TaZCmQfNOtdasLnu8uLs8vvHO1Efyg+fv7vTM+lBv+GLgHj1GUas+yRu5
         K5La2U+gRYnXVLswRpBwKskAwGSBhY7EyqMn6TQRHwmRjz7QeoUjydB8ppBWkrY1MAR4
         R7j2eTegBReS/EXjp1+gjsFJ0ub95nQDBAO4J9ikvFiamR4QQuSaKts5Xsbwc3OAq7Uy
         WNpTUKIoVqN8v7hscNNZUFPjHTkbHL6cuChYCXJwBdJYAvG1FU0Tm3LqDymqvcB6qqHX
         mxRQ==
X-Gm-Message-State: AOJu0YyMqGtkjslUMZhCFUEmaKZQTJJXqzEUiP9ywKjGgnLNgac4C/U3
	bG6mfce5h2Yn2ysR3i7R5l+1JjNvqdTiYyHtg7olNY9HWodVzFilUVqU9UwhHUN+bkt6OsPUIij
	sxkAX4Kyesu/QbwzH+KNt2h4hILAGwdg/dPviQliJBbW4i8dCh66sGLLtXCFJO4pssQUE
X-Gm-Gg: AfdE7ckqFVYyeLAGc1GQRnV3ARwLatIXb6j00NFD6PRw8J5q0qrbFJHVCWWQKOTVNEP
	I/qdOiY7w1hxXbx90Df59Y3ADN7n9x+Knx8zqpKEmgq2ciG8gyt0yN2ij5z8h6GHyZiDrJ4EMvC
	rEnb5rbjkUvDZ59rQNW1TXPA3HoIk0nFaq+bUBq5RlHEqnOxkl0jyn+qR1KLVmCCzwH4HzRM0Xu
	fNJSqiutwzsEz2QfA4Dq4LInj84tneHxTgRlW53xJrvO/LF3U6J/ug/9SZz6qVA5LHcVmv0nPwO
	AJBW6V1LJECXCnkbkBHMlE15LhLHbhCDU6EuqPuQmACJWAXeRGVstFyKutwwT7Vfd0PU0ZQrbwN
	XV4/tT4phHdiNNsYCgO8cmcjGaSCGfPh6N8Q=
X-Received: by 2002:a05:620a:19a9:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e782a7a3dmr728598785a.3.1783065200381;
        Fri, 03 Jul 2026 00:53:20 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e782a7a3dmr728596785a.3.1783065199915;
        Fri, 03 Jul 2026 00:53:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm244853566b.9.2026.07.03.00.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:53:19 -0700 (PDT)
Message-ID: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eFXJjnhQeT9BR87coXj1WSCbnnrCbFd1
X-Proofpoint-ORIG-GUID: eFXJjnhQeT9BR87coXj1WSCbnnrCbFd1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3NCBTYWx0ZWRfX7QldaotnTn5n
 VPI0KOCGcFfXZMqgd4vvu77wXtBFqDoIzlcQNcYUbWYvH6i6GqY1nq7SIf76ToC/icF7zRI5foU
 9QadxQGJkqrdI5TOlE1V/yTAYD+/y7s=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a476a71 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7t_v5s2nVLkGmMFP55oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3NCBTYWx0ZWRfX5HVOzLb9t0GA
 yMpsig/BxR2xPnHMbPZkZkeJ9CIuo/GHGno7iT/XVpoWxRhgz+fgpOE/GEeZE/mMeNuG0GIEDLi
 AzbCFsIN+o51U4aFnNB3ks0QsbccrzkpB1mV+rDqEgo2PXc6qB9iSBNjO9CFOkFqOdyGz9UBRPO
 WDzfnIjLv4Df1LhKijSX2TyZAavxBTqbWLvRrpocHC408LlYqmyj/3TPgk5pNb4UvKTmpEglPCz
 7zUvqW0YwEXKGq4cIxt1z4chXurhQhhg9J3TvldBypAAjZDOtfYsx1SYyKvNDnTGGFwJ11xDkbm
 qdowtz1yp3ui30EvTDOrn88qxJ1zoVYhg9C8w+vVj30Tiue/IWeigU/Gtx/MovB+0aLJApjxXsH
 cbQ42NJM+FcoASMHiCwI0q+e/6E+QM+puGIRXU49qiJ6Q4OBJoSYjgPGznLgtwh8qSKUaw1TLzX
 BhUDfd80YnR3C7Fkbfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E4676FFDCA

On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> Add Device Tree binding constants for Qualcomm Thermal Mitigation
> Device (TMD) types used by remoteproc-backed thermal cooling devices.
> 
> Qualcomm remote processors expose thermal mitigation endpoints
> through QMI. These endpoints can be registered with the thermal
> framework via the `#cooling-cells` property on the remoteproc node.
> 
> The QMI TMD protocol identifies devices using string names (for example,
> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> `#cooling-cells = <3>` requires numeric device id in the form:
> 
>   <&phandle device_id min_state max_state>
> 
> Define common TMD device index constants shared across currently
> supported platforms. If a future target requires a different mapping,
> additional target-specific constants can be introduced while preserving
> existing DT ABI.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  MAINTAINERS                                 |  1 +
>  include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57656ec0e9d5..ffd85fd1dd80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
>  F:	drivers/soc/qcom/
>  F:	drivers/watchdog/gunyah_wdt.c
>  F:	include/dt-bindings/arm/qcom,ids.h
> +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
>  F:	include/dt-bindings/firmware/qcom,scm.h
>  F:	include/dt-bindings/soc/qcom*
>  F:	include/linux/firmware/qcom
> diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> new file mode 100644
> index 000000000000..73efecef0f3c
> --- /dev/null
> +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
> + *
> + * These indices are used in device tree cooling-maps to reference
> + * specific TMD devices provided by remote processors via QMI.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> +
> +/* CDSP thermal mitigation device id */
> +#define QCOM_CDSP_TMD_CDSP_SW	0
> +
> +/* Modem thermal mitigation device id */
> +#define QCOM_MODEM_TMD_PA	0
> +#define QCOM_MODEM_TMD_MODEM	1

What about the dozens other ones that Dmitry's laptop reports?

https://lore.kernel.org/linux-arm-msm/4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k/

Konrad

