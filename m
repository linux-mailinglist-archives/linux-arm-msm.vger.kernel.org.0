Return-Path: <linux-arm-msm+bounces-113605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UlViAuN+Mmpw0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:02:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96263698C55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:02:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lth+AvOz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TqkNxUr2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEC3E303F724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB703C9EE5;
	Wed, 17 Jun 2026 10:57:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B34838E10C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693836; cv=none; b=lqUSYyW3WCHLgdQhgZzGdyDQ7n4uONcB5kiTlqgH5lXWalkTT+yOkdanIXfnZke0/8jfjq3dxQ/WFVQbJ8lBqpxRnf/dfOU4gDJq/RLcqMDq++sSPxWrjjNro9VHYiMSSgc096qAPU2g7thHRKzscDBnIyhtk9V98Tsp7vYALWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693836; c=relaxed/simple;
	bh=kDkKS67hN3RnVTeB7mYSl6BC188BCbO+mJkU8ds4bNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVk+YYc475HST4/TXw6eZkIj2k+R+P5k+nOMqhtyMBsEilB09LcCLDrm0I5RKDXHJJvXe20Ky7GMwHVurAlhe+CMmgTXIzxBJaG91gsH+5QMfRIb4tA6MjgvGCj9QJA3PDCvKBOpwgO2i1VPEZBbgsK0oOyhp3VDliBc1nPZF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lth+AvOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqkNxUr2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V7SN2291400
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7KjoRg8s50uo75jYibfLq42V4xZVCBOHimACuml5Pk=; b=Lth+AvOz/tqHY0bb
	AiWakXPKnSdnUlJHJKPAoylcUytC8X/a3+st6cUSuYrdUPTBDBjs2meJ4baJM/d9
	v0dSD7x37n95NEX99DKGVrxCtWxLDTqtebFxWQ4EUQMmZVrOayrrYiUkBUxQSQgI
	3GcHf/S+Y5PgUIzJrGbK7/zXyZXKngCT+mUssA8swzSuQpGa+EquhasrdtesSiez
	9yU8Am5GWm3GNhqv/Aq4HfZ23p930GKaQ9Sw5CuMXWHkihWNHx9nN//16AQFkAuo
	RVxWXad/la5Bs+vYZpBSLHCVZqU97M724tiryZCbgeqWDoziuDFbBSljlbv5bmlh
	X4nfng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjtfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:57:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915976b2dffso45114185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693832; x=1782298632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7KjoRg8s50uo75jYibfLq42V4xZVCBOHimACuml5Pk=;
        b=TqkNxUr2X0toUDwJOo+tuyoAp0InoLyXR9Dlz83jy9FIIFbcT7jISSQ2NE7wk4tUO/
         LR3R0LbHdTS+zeHbzYqEZNRjzpyWWXDqrHc+sdjANO4jAgcGh+RYVk4juI+PeDT2E7Tp
         7tWv8Y5o4bLh/jWfha9FoEn/KR+SxoDdcY3x46pDBg10dWKifwzKSVmJQG8Pd2Bgm3Mg
         xn7ex9OrIzLu3jvukxXt8fVvTuFcp3ESGV0sCXh0bNNZxDrSeCfJ0j3ZcfHJS7HOxxPh
         V6ivAZ5Va1T0iJuOkJTPXX0+CkL8VL3rpcvrDQUEfl5bT8Kv3TxGtbNLbqsHEIi2Dl6Z
         lSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693832; x=1782298632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7KjoRg8s50uo75jYibfLq42V4xZVCBOHimACuml5Pk=;
        b=It+Q883etH00m8uH4GFBmblrfpxJ6ZXJAoQp22t9Qg/SrdPuPlupCD1zF4N3ZePI9P
         4si9zE7JLbM11YjkeK//BSszNDQui26TkMWO4pKJ95oVbeGyc4pAN0c6jEg68HvCC6Is
         SKIRCLouKUpPHjV3PuCvZKKE4mQ6sWqJuHCzWpKHkJwvAaa/Gc7MUz7hlLETba9QrmRV
         ZheZ/9YOcx3HuxeRUu5DwZvPdWnpuYXHfc752NjX4S168L/5xMB6NulyiVMLEBcR9G5i
         ChUkkwOm8K1F0uO6EoZZ0VLP4CF1U5+PjG6UsA71PHl2z0yJXCIA8SY3EOh6gyCLMYVk
         mPGQ==
X-Gm-Message-State: AOJu0YylEkKoYqJ+0uHSFt3YAOKx5PZDDp9YYcIngFVb6K1UExB4uDqt
	kcL0ovHI9/MgyVKbFTPSkrF37+E/m+bUUZtJhNXNWH2OOD/l8TD5j+luuFT44SK4LxDlWa1y+ae
	5ATjW0OrdDRamiAHMvLE0m8gXBQtVjOHpN5HTChIHpEVBNLH/zMRBlSYzlj1ynBjmGGDu
X-Gm-Gg: Acq92OGH+RUaz1arCiX6sLk/DrWXMB+PP83bZls/DHNG4+ZFXAwLLDDej9yTDw4Lbr4
	cQlCDuRU5LRnIbgHWBCva2D2f+wak+Eq5D46luSxafTAX9z2es6sjv4HiqSnBUjGZeX/kZiEoy9
	ZplSyTeScVQt2Llg75YUCXBKTh6GdnjM6iwt+IM0pO/cknhXRClHRvKWg1WMcM77mPz93x0nQgO
	rzpQiVhg6Mspv7aE3X5nWd/gFbckR7IWxUQ6i3pE0F/eR37F3UzZiGYWxKljaRYc4G59VMnBasV
	xrpf65rKDxLmhqOoKBWZL+gMtuT1Oj+jnn72SwyG1IeMu6CDZa9CuLwEtRPFmCmNl/QXITcVMj8
	bVCQrG6jTSLs1sZ9BTGkarMwITAtpvoqStEg=
X-Received: by 2002:a05:620a:f01:b0:915:7d6a:4f99 with SMTP id af79cd13be357-91d8d5b295fmr353260785a.5.1781693831883;
        Wed, 17 Jun 2026 03:57:11 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:915:7d6a:4f99 with SMTP id af79cd13be357-91d8d5b295fmr353258885a.5.1781693831507;
        Wed, 17 Jun 2026 03:57:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01d667f63asm507620366b.19.2026.06.17.03.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:57:10 -0700 (PDT)
Message-ID: <8a4cbd27-6a91-409b-b6b1-047becb57480@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-2-43984eac4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-2-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfXy/T+KKdCpJrP
 o6r6JxFdx5eekVk4mxXFAhT+jUosfgGgr4+OOkESFhbM6fYaS2OQ1yf+RtC34iGKDwHgUkJgkGa
 HrQ0tBiErwy5TiWazgGIy+kqdZjie59tVle4Va/4c+EALHcSZWRpI2y2MOnb30U5zuDCxQ8UMXj
 WlTrAjG9CkglnmkbIzIKxpuEsCeMwzaXWTjjGO7JyFwjQ+J8VIkguTd6YlTznXi4b3hKnonCUfH
 RuE9vDmwzF+dH94xBsPbcBcCLM3WEuBbPrqwaYu0wHppwwUpDB9/+7mAmK8HBv5+nD2xklcg/bI
 yH+7xGSmQKg7p4b47JUOj76EbGS7b3dPJdmkp7emWpTaKqmpsBF9sK/7eYvMy2C0TZn022kXn7O
 iCp8b8o8wubc/BE56cdRzvJsBDJR7md3/x32Dt71RQtf/uyDXHrDxY9lB/S6VYWH596o3U7+4+M
 hHzJHklv8haMTNjekaA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a327d88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=G_i3bwEB9gotEOBRcW0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PmZD5F44Iio1F2AzzikRJbIM6YV3hGTY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX11aqbxQo85iD
 FMvBAa968If3Ei9SbbwqyFI1dnnGiLMATY7sYKrVLrNX8p6OKT78cstcmNw6ejmbGRVm95CYRVh
 hy7sAfwbRhViVJdf9c6bhcJYxrlck4I=
X-Proofpoint-ORIG-GUID: PmZD5F44Iio1F2AzzikRJbIM6YV3hGTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113605-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96263698C55

On 6/4/26 8:50 AM, Praveen Talari wrote:
> Replace resources initialization such as clocks, ICC path and OPP with the
> common geni_se_resources_init() function to avoid code duplication across
> all drivers.
> 
> The geni_se_resources_init() function handles all these resources
> internally, reducing code duplication and ensuring consistent resource
> management across GENI SE drivers.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

