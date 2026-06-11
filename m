Return-Path: <linux-arm-msm+bounces-112814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id daiaNzIaK2rS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:27:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191B67522F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EtjZFCi+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F+wFUiCo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 359D530FAA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99753AB269;
	Thu, 11 Jun 2026 20:27:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75633A963D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209637; cv=none; b=OVJoEECVw69/h4MYP8wb5ZzaLHsapRYkfmKejEep0zVlewK5G0fWUpVVN6RXeekjB2vc6vlVTMF7q7I4aYnRJhnL8lQlYgV6z0j9zji+P4d8MTbL6hOMCSX0EwFuEvhNj6TXWjQAW0RVSrMfqv2poAbxdJY9UyhJ7Ed0iGsHXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209637; c=relaxed/simple;
	bh=SNKhpV4UsCOuxobndaMzPRySz5cmpw3LpqlDlwJPfWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf4QHhniOexISZht5/nx83kGTIeEs0vr4OHl/T5OurefJmyhG3QoqWsP3tdVo2GTaAU1EB+RU6em+os0yh4MqjGj5fd4fgQcwayUwiUqe2HPo3aHx1rTGXF5S9puLa2zrOywlShVZQHdnMBEqOBbUUo60nJlHnds0YTmMUUIGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtjZFCi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+wFUiCo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Mfp1499385
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQBF4pKHDzaZb4PUrojp9IHT
	+Wtkkpm3p6FxhUuFZnI=; b=EtjZFCi+YDAbkqtaTOokqjuQgy2XDfvNcDZTasiU
	3lOPPTwDS5nVY8Ci83Tg6GGSApiU0OLe5zNaPZbrNa+TgZgcMtOX15yKPw4hCUAe
	v76QobYwRu/cWg7E/My26Bu5Uqhsryy/yJAuCNLtR8TrnytcKAHQHcEdCaBjj/JE
	con9MGR0r2YbqXXwAjFQlQaxaiVDZoZg2HZpMI0js8Bu69dqO+ImeRziy7QNf5te
	HSfQ2RW6LXfks2guTxX5Os/k3QRto67iGzE1yv/zAJ0ApMlcz/HnD/q3t/Blk1nj
	FW5CuHR/8Lp7ug9XeUFBlYkg7glZwGlBOIlKYApVwVNwzw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r70bdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c89de84f33so228665137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209634; x=1781814434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=F+wFUiCoCX+7pzWaK5AKHb3dh9WarrdlkgGofjSvd039fZcyrmIZPjEyoIxbzpGPHb
         YDmKpmAI3e5iju5hQmTVO11Ov5laFtICsHn+p/uqzHX/Ptc2VVgJWnPHV6YIOh3cZmTw
         qiJ4vxHqReL/7AdB/PvGf3Bhy5/50/qWodM2qC+jyj/HOul3UPLXFRD1bPmnnIK77Yzs
         Ew6HM5Cm2GguRHcLpIj+w9c+xJ4D9njr0lsIWR2akflj0KPkUrmEZiy6kIdwjIV8fjE2
         XWJ+ebHBT1JK9sWLRinRaNFmiopely3AW4k7fqLT9/VMxOaI1jt40LsxOt3JvWJtzwJT
         uKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209634; x=1781814434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=oftHgYQW8iyIlLG6vMQl0xgzMhaMAFKtPjpHbte10atEEIbVRLaswj+icno9ChjZdo
         suyMLIXiIgm9tTYL2fcvASMs6ibnPryNQgUN/dguyrtA/cv9OduqUncNOZa4Ho6ye7o2
         gn/dSzi38/1cicwX/gMQ0pJ3kCIog4SyAccVBVtAfKh6Q782Qi1JKG4rz+FBu8VmQxQB
         MmZdzGocrMzt7ibZTL1aiUF9TjRSvZWJgJADwLF5s89qpUnAluraEE4iUR/T9ull982i
         szwHdDT2A3yCrxcg8TNMb036Axj4evguu77WD98oGEOJRA7KprYH1qcQ2RM12GwVnmhj
         GF6w==
X-Forwarded-Encrypted: i=1; AFNElJ/el/+oCghmdQH1BpywRyBlg6rYEZrWZn4flLCLwBudcDSMOyTZ7j9aTKE7jpbl+ETSSeMg9ZhsjiWV0Kg1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/NX9ou2rJkPpjhLwVd9pCGbzutNUWftv4Fx7bek9UFqSi1iU
	Rbbm6ezL4oxyhHJjczufF+BQJ5GeOf1bA4uOzAKJq0xQ/R908NMAFdwRi8ezbQLheB+POKVVAcO
	Vkt7sG/73g9bxpdS5cnCIsXR7focBt8oh5rDuzEV/s7siAd8NH7oL8zZZt043IiL4ManW
X-Gm-Gg: Acq92OEIN9/2TiWR9CstL4c7Cj7VEifsOKHa9ltVOaqEY2tKgK3HTUMWeRoBf9NVJDV
	7unLn8RIZYfNLUDt4iGTfF9tFUzl2S6B5A6sZ41Z9GLr4nsVlkeYrLHXXxQYm1OImisgbJnE2jX
	0JT/CIZkadEYPiyA0Wd32hXLRdaEYvf3gxWALgpC9ElziHI835DcCeeLzAkbrA4mbNQOZfFpeXH
	vUxRxtPbMpVRfOjL5lqzlHbD2ml17zXPuv7i1Zs1WFw8lao3QMxw8Ki8JV6VzKYYQJSuSZLWyxB
	tdpTf5hLUeL0Gf1dAcweyYWjtmkiGGg6+z4en+ebw9P6wvc+w74uQEf77AdzfspVqgWOHepgvwU
	2/crlG33w9sYgEBolPbyKckQ5zsy76CYzr3U0s5uAMX/D7c6JL9D/llybZnp6tvkTTIvT3hnQiN
	keOnBDAmS9OWyIGdtcEsnkTEO35mf7LWLhbIo=
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089277137.20.1781209634111;
        Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089259137.20.1781209633698;
        Thu, 11 Jun 2026 13:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c2ba89sm300791fa.5.2026.06.11.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add
 ina232 power sensor
Message-ID: <dtees6izgdfuiwkfhc36h7h5ybjyuajumsysaig4yucsijtqw2@b3wo3yys5uq5>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GW07vFuTvo3Sv0Oo5iv3xbgrRFmO986O
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2b1a23 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: GW07vFuTvo3Sv0Oo5iv3xbgrRFmO986O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX0M2NJdRHBT2o
 y/kzUSz3tCaC+5nLQ2/Iugn9+qlRz2U94STmEDRaVvR7r4lT2sleWYKzudSoeAihhySpZtHOMuW
 cJNfrCff8lozIBCmwDhPRxWxxW+MM1cUwQaUwMZxkpTFUcYDzjleVHEbSS66ZSSYaRfJonmjtt1
 yX6gUMzoiQSaA84CWE6ven6T4Jrh0OS1TzxqsN1c9POthARl9vc7Nz0eERTghbHWGYw5qvwZPsj
 DVxcoL5aUKtFTWfwsrv7GspjIPffq+XCwO7UGQ5rRLVawZpXK5XdCf4P56IMmL+IV1gu8aFEuOH
 CKaNxObAq5gcQN0kanW/PJZpuNcbq7F8vHTSZQFGc8YlOqMUx9EJece+/yeFSYGupV2UA2oX5s1
 JZH1vbNitsCymefGANHiXeJdCvUz99zwWFlRTaYGxLnNwjf8Og+APWF0SxIl/415ZKSxqMg7kiU
 K+W2Lp52StiFuqNL3iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX/3zvb2JHKpiC
 gc+5IeV50CeiaBplXM6nPM3/FoDGx8t6PZ4Yt0dPxGrZPTcUOIsUtlC03+qx6X+FDeTbl1GpKIC
 /F+ZkcPLmGzsuQatL5IR0raOJPz/3ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112814-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b3wo3yys5uq5:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5191B67522F

On Thu, Jun 11, 2026 at 04:05:26PM +0200, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

