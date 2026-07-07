Return-Path: <linux-arm-msm+bounces-117379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id trmHE1BBTWqRxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:11:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02071E816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:11:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nP2wUiVg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TaGkb2xT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117379-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117379-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839F63024536
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBB943C7A9;
	Tue,  7 Jul 2026 18:11:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712A2E718B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783447885; cv=none; b=I9RXOsKIcpwbsAyYyPWVGsBr6VeP1nK+TivcmlvaMtx6hmgcjI4Obz7mtDpy8/o+kPWkeF4paQKS9jDR8iG05eUPTcH+GBmeQU8RSaEYvBwoTnf+c6WnlsI3mfsP5R7xnSo16FXKMyzwi07htxQYJPpkaOUPEZZ+7iwStVr8U6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783447885; c=relaxed/simple;
	bh=/PqkFVL3V1e5zqzVDMWl75F6A6rAoKuhxRurfkV/b/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm07H6nnn6rIKhhGErYbroL0LH5UiQ/3mu4jvu+RW7AL83Kq2DHLCcSLnAoAfKnVy1Mj0lnj6lSNDokC1Vk9JtswAa2eAFKSf4PcJY+6uXrS8GVdtsf5EOXEwBZYLbHC2pUurQDTs7qBkr9tbK0UFy5GjFE5zRLmEHaagKwqzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP2wUiVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaGkb2xT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT8ix4045134
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uizMv5rndZaKnMSeq/RzfiTV
	y/30IGGT9SfZu/MIkEw=; b=nP2wUiVg3+z6Po18v0V7Igbx/yzDxHgnB6zSd/nP
	uhG27KgWsvpnWSUQ0Io8vyUHIsRzlGIh4inAtzTLFqVlg0eP7b3pziK/VrkOKKTP
	xjpOdKRaQoOOdKFfLSzF+dxYjGweMDvNPPGduz5y0esUNEdDCmTYBc8Ps+pRhoXq
	MpUB3eKNwFsHt3DqJPk92194i5CZVlt0blPMqHnm65lpEuSakY6Y2vnzM8nl6CnZ
	68NNKOy3vU/XbkNFfvkGZGKPqjNzduil1jJc9UxxbFFs7oNTD42O4363INzHKQMF
	5UlK2y7n+1sZ/gIfalMLyQgW0GBC78xd824agFKsTC9ORA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2uaqyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:11:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9692595fe97so1348144241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783447882; x=1784052682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uizMv5rndZaKnMSeq/RzfiTVy/30IGGT9SfZu/MIkEw=;
        b=TaGkb2xT1wGlk7OYKBNuxBOiug2nD5IX1OciQsnxr0g70QSz1KbQQykywMsPh4BcQK
         J/p/Pnpo4lrtj/IYOn8os1G2QLnRSNaW9QHPCGmECEMjSqKjNPOfn3PM1LCXNBIvI8lG
         uxOgbXdNX+NCmYdCqRVzbCyKoUYoUUEqwpObwB1U6F/VWE2YTVC2IIpNoWOB9kAw/IEb
         jo13Z1VKU1nh9s13ZRb6zlaPNkz5Z2WZUY+1FoHOJivzPOToGPEJewM6/6TL6JToOMPm
         X7oYxzK3W1G190EDBhtSdr7P+OeEwUFt+NyK55uk3c30QQcJgGaUwF0k9vxPYEtu+Shx
         IeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783447882; x=1784052682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uizMv5rndZaKnMSeq/RzfiTVy/30IGGT9SfZu/MIkEw=;
        b=ILkvfBe4O7AY90/sJ4vLQCYbicb84lR2oUEgol79/q+3B56HUPLiz/Me9h8gETg8sV
         ZIYCDMGCx3f4XCpZ+XSVAbojjUAQXfijOOQgz6V99IeCb16quIhCM3x1MWCioG0Y/YOh
         5cAiLakWHm1rJTLFzYor4bND8SsEiO6FheyLA3Jawi3M9Ivc2zt22skuvozvmz8WjgGV
         YZvzPvo59pGsfZoT3HabmdlLm1SS41RjEOYSmv3zuId+1MI97yh1PQK0pmPaR3nyohNl
         v1QXkd/CeJjvpvw6rO8cMGlzBvtM6ghA8YKPBIkJ54PfpUFEPhmNbRKa+uucPzwvWJV7
         +VHg==
X-Forwarded-Encrypted: i=1; AHgh+RoPyoWV3t7bKlO2gPUosTGxzfmdbMIZi3pE8YyGr+VHLbdklNoeEGg03QR1pcV8kRdonB0Of4qozMevvDsA@vger.kernel.org
X-Gm-Message-State: AOJu0YxMS1oEzbyV/qDyYOJuEIC0dz793vq2glbcUk4YmhTbXDOZx+fV
	i/z9PzI8HdY/UqIQFrvULaqgfPh7tgshk+INj53jS+3SR7e8S8oKtSYIm5YFWuWG0Wi/l+v+YW4
	8hTS15Qey+OdKuOAWVabTQ9JknZN6p9JRR4W79Uyif5IqkfUZyuB+E1iiQyR6GrmN34bN
X-Gm-Gg: AfdE7ckn9KsuTC4iESI1k8aEarpY8lMDlyzfcucmcOiHVPwU0nCLhXlURX7KU1XyZzz
	k865KXsJpkS/oln7seF5xcGMjLRfecD61x8clHRZS1EYVIS7BXYtGFWSko7goPSPnDWwyDhkBU6
	k7X57BvEPpBW0IzlKJJ7Z4PlN9+kNfAUWPF6CcSmyulJZM4lJmO4kA5htf/5CjcZCep9yKej71U
	cAIwSyYTf85VzHGNwDLtMIqdZ0K2mA4a0yzxMttKoYXsRPSqc44f2c4RcF013Y/jhqU1jyPPnWA
	DkgT6TmJ3mTMTxyABeZU6XKfzAScyH+L+OpQK1q70rHrWbSYl+EXbwgxg8sJEQ/ISdZt3E+pXMB
	my2BiUyRjlFP/cbgyoeeyy00to4H5M0jwkl+WjzfIYUh0StQIV0zKZiulqhtdKYvFzXzvNUUJDP
	HbYkMe4L2kK+fz+PF/uNtltHK9
X-Received: by 2002:a05:6102:80a5:b0:738:20f:10de with SMTP id ada2fe7eead31-744b7bb68e9mr4020110137.17.1783447882655;
        Tue, 07 Jul 2026 11:11:22 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:738:20f:10de with SMTP id ada2fe7eead31-744b7bb68e9mr4020091137.17.1783447882195;
        Tue, 07 Jul 2026 11:11:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1bdbasm30377771fa.5.2026.07.07.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:11:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:11:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
Message-ID: <4mhsors3ueu5hreokmeqirr6fz3gd7lk2rcisyjppchwu6gwut@5lf53jpzlc7u>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OCBTYWx0ZWRfX3dunY0MFBWRJ
 Dm9LZXB93+l1HL5RcXL0BvSOxrFpXt7un0kXMpAIp7o3aM3k82lt77rfmpRCb5uNge2Okvphp0d
 x9X0wY0wJ5iBNKoQtTufuTpNS+9uhbc=
X-Proofpoint-GUID: Ytbr_eq7dRnTUK8FPNJtWuarJGVD2IjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OCBTYWx0ZWRfX7kDkQNHoRgD8
 hXJNRllPSAxGrEqLkWuMwO2S3jgyOC9ocYhA8QwhF+yXgdkhDePWpuozV3qNZGcgaUozUAVq/tU
 MSK/MJXpE4pK+oJInalVc5LgvOpmkatmAc+DDLlRczguw7UGsSQOqAsED3PXm0OYM71mwN9dFtz
 VXvHazKq5vZVAfT6DPh097YDuQE41O97DXxLUzDGa7WaytPa3m7tJvmUpZHd+pcQqW3QQOsjqht
 nnfpRoV/Y3GbKP4AvTTBky9x870AmFtlgqjlq+94DArqYa0CiIrdxKwEGRbMUHrGVQRpqyFOMyJ
 sjTWJBSqdZ8CBJOtMAS1jGvpFewnwQNXdDNEdbfdQzyOD5SXKYpoJK7Qx1H6J12r4x8gG/5gcG9
 v4JohMUrC9O7WUPl8EokUK9a2UI8Ak7or9OF/A4nlE3IVCo0HqCVMXSk+t71hif4y68dZjECtA7
 mzI4qopiEebwTycOwpA==
X-Proofpoint-ORIG-GUID: Ytbr_eq7dRnTUK8FPNJtWuarJGVD2IjG
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d414b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=txcygE_ixo86pFOgItcA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,5lf53jpzlc7u:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD02071E816

On Tue, Jul 07, 2026 at 05:37:01PM +0100, Srinivas Kandagatla wrote:
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

