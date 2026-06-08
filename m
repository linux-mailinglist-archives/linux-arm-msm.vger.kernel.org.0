Return-Path: <linux-arm-msm+bounces-111953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixr4ACwNJ2pXqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:42:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03906659CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:42:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pi1s6WYU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OCKIRF3P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73EFC3017CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5AF3E1CEF;
	Mon,  8 Jun 2026 18:34:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9BC3E1200
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:34:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943660; cv=none; b=VygcA0pfJvolC+U+iDxCh8Jg2tqaf1Voys+l2oLKDwSXxn9eZZy/ciWeAPyI2SPNniRSGHQJ5CiDW+PWx1jAnKx95zf/64WMfiBcvE60ICr8WruA4rx9qfau3ZA2moWiLHBfCJWDwleFXzqqqFGHsNICKl7arX94ikMK2fbwAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943660; c=relaxed/simple;
	bh=cszapqqMzVR8qQzqB4p1slVbfHkfNBq0dwgcvnu7A/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alZEq+JI2cK1n+M8QVnPANd8H3u4R4GmCkmLS2gukowfbezxqbrTAaE4V4wFRHl31KQkZGeb6guiRlVEp4i7mx5yv+xpdmNfqGKBIZcyAS9u5SgKT15hqT9KqJPsShbteOw8mQduH7gmks1Eiz5jC+uGWo1hIKzeFUUzwjhMmLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi1s6WYU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCKIRF3P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFYAW3588465
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6lHqDrILk6ZwFJEJhfYqYQU
	sLI6VPS4IzZmvPLMpNY=; b=pi1s6WYUFJuy40kVzbe7ItAz3WzN4C7UDEXXKdXf
	gHb76uYtbBrAemhMM9t6bna6AHCEMKkYqdi0c3EyImISeDMhFG7QvhnQdqhFtNyf
	0YtM/9qeZYpJcrESDatooJXyDwxDFxa1lvkT6uaO2PPrpuASKwKBndWWQ08zgIBk
	K+LSs9SVqr3mo7Iq73Cv0OJRqIZBNhQMwhUNmbDuio6EFQaLsTAirsp1fWULlYcl
	kYe2s5N+g64NbAPkTzXu2h7Sst9/JeqXxcW5fgJ4K0qQ0NVOzB0SJaowP2WfDsJK
	IPZdS9WnQvLK3kapXQOTeeqFkrhF1XErNEr7RVoWYzgcLA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun42cy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:34:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6798c46f723so2562169137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943657; x=1781548457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6lHqDrILk6ZwFJEJhfYqYQUsLI6VPS4IzZmvPLMpNY=;
        b=OCKIRF3PUO6DeZNE5gyXb5k6T+roWktK3B/OZKZWKtQs7iYyMfzEdikdEBY052f0ia
         UcF1l/hAhCiZ5D2e5Sk5fNkMrF5zYm7lJONldb6jFyl5CkpVEtdA2HiiZijGi1fTJt9G
         eDM+2xvwziext1z8h7jkVCz9e+k2yLfH9LD5uOTh4tQwbqOtbjUUlEVmYTdd6tnD1DJI
         eetsdgAMB0qfSuYnxWb1oAJqpKTkTIi4eDLcc7hxu9gTp4BNaGyksM+VWebmaTq2NLqh
         xshkqNA18/zYFL0YrC3+wXhV9qyNGzRKVd+qzOnPCMUZrAxxXxipbnaJZAXLu2O9pkMq
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943657; x=1781548457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6lHqDrILk6ZwFJEJhfYqYQUsLI6VPS4IzZmvPLMpNY=;
        b=tXmgyablz34Gi2WtRoJjz7TwIWv6ix/PdSS89vCnS/rcT3fbjDDQ8bbKBvvpAlMbvB
         P07IEAaJQQpSTxAijw7E+4mR8cl4YE1eSJ8Fw9MM9isA5mKNKXPzAaZttPfSqCXC1haO
         Ccl5JcKLCuD4T2Xg30n1tN48073yNDESK7UgcEiwCb5B/hqmae7LQOExGpbPSBxl6nfv
         0cHKmTjDtTFzBkBp5iz9eLz8863bc9q5qr31PJkqPKKjxHUqEgjGAILnLCjqPX7absPf
         skfbNDTKyKXkBL8aP4TkGIgY9yXF6h7LSd4Ja1kvN4QzfvLFiAMq6WVXDIqC4jfyCwYp
         Dq4w==
X-Forwarded-Encrypted: i=1; AFNElJ/6rVy+BLM7WUDGwSWWBI+Hx1zTFoMbwnTjDQfj+oTdhXLjC0OXHSBaVT3VTd6sF4Mt0dW0MCAMVaYFyPc9@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbwO/UJLWWOSPemAx8zi7KZhq7ScP7XkGK82kETYUYZbjF84W
	4ohOCjFyJqRZjD9/YXukpZDZFYkwU+VPlp+NPSE6FBYflLhux8M7tLa0nuVfI94w2qOQPnjigUY
	cEOx8WA1oWKETpYColCZ3CWHAqsYl94BLZQEYANZ8sgWQshQXms4GDoAmxdiklOPhAMWw
X-Gm-Gg: Acq92OEK112DBzF86wira8bBikemrgzrb0C3UeHt/ieDUABJ8cGRqqGMGa7etQwqCrH
	cSgiKRbeWLtaXdUAzjKq+nCaeHvmJVUlYk9OcyqwCDDCPC1i9+ThZE4TJ/Tv2/aI6EI0s11MTcI
	Tt9iOIx3fyXVsAibsSltrCsHYZN4B1FHAxU/DkvXRqu/p4+4hEGwKikOAv3tJBE7xS249juE5kk
	r0EB3xro2bnJZ7ZPR71MOT1Y046tNMoDkRfhLyJepUZhlrw0PRAX7TSOXYnTN2EH65FiH22Kkd0
	ewQhtmmcyB1LBqaHqZKgKhb0eegYKoD4ZUxyyrmiyTxZvOhsgGnI1qTF6Y/aXPHAww2SMwF8yTr
	gT3fJjHop7dH0RRskxlKgVMbztlReRkWsQ45O11x1vepPSmN8NJC/h8aHzUhXCC9+0Kz43ZyQuZ
	3NOzBqnPcnJ/469VlnFJndjRnvrEEn7d84gTSGySeSqtrv9Q==
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr8933006137.20.1780943657195;
        Mon, 08 Jun 2026 11:34:17 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr8932995137.20.1780943656825;
        Mon, 08 Jun 2026 11:34:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm50752961fa.22.2026.06.08.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:34:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
Message-ID: <5p2n4anii7nwrywh33did7rjedbzbum26bf45vigw6ilqyyfv6@jza2ja3fsg54>
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfX7Ms8Cl/zr6df
 k7lYCZfUM2hjLUxU7OUsSKi8uTdGt53uWcrYrbs/3IVY7hahND47rCyKfMracHARGODh1T0l7ZF
 CDt+LafVEJ1mQ43D8u+1QeK6WgYJRO6SJLm62wAIubUoHIJsFYJSdbH+POAZzXEQjfXBvU7rgU+
 KyRlEj6DtnrUaDNYG3JksYT+k/I3TZusdCq8Nzd2r2M9mV4tXtCQCNj7sdwIB9QNBZSN9goodip
 QoWUIKoB+A6rrMVa8CjZFCmRY6g67KZ8KaRiS+4LBeGTPrUrUQipHIaKAPjUrkU+btH3mM8gAE9
 26kjOSfodf9979jd72pyBc91lE+8xSUZsvm0Tf5stqXlC6ng/JXnfGJ1QU6V/uFn5Icfa09ZveT
 0CsGeOZ4hk+Rhp/hr/mAqOqGRXm0G29w7C8fJQiJadb1K63h0IlLSjYluJ4nrSCyA65vDsvLYHC
 x986QWDgweWU+NctiNA==
X-Proofpoint-ORIG-GUID: 2SmPsJoLYKL50JGPLB45fuG1qYHV1hQN
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a270b2a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PIJ3xH_xa6AsNK1UVp4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2SmPsJoLYKL50JGPLB45fuG1qYHV1hQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111953-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,jza2ja3fsg54:mid];
	FORGED_RECIPIENTS(0.00)[m:christopher.obbard@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03906659CF4

On Fri, May 08, 2026 at 03:30:06AM +0100, Christopher Obbard wrote:
> Add the blsp2_spi5 SPI controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v2:
> - Rebase onto qcom/for-next.
> - Rename node to blsp2_spi5 (Dmitry).
> - Move blsp2_spi5 node in alphabetical order after blsp2_i2c5 (Dmitry).
> - Rename pinctrl nodes for blsp2_spi5.
> - Move pinctrl nodes in alphabetical order after blsp2_i2c5_default.
> - Remove superfluous register property from blsp2_spi5.
> - Remove superfluous interrupt property from blsp2_spi5.
> - Add dmas & dma-names properties to blsp2_spi5.
> - Change blsp2_spi5_default cs-pins function to blsp_spi11.
> - Link to v1: https://lore.kernel.org/r/20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

