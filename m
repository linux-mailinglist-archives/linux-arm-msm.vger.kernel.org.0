Return-Path: <linux-arm-msm+bounces-114336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JpTFCk7JO2p9dAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:10:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AE6BE012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:10:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dbvSMr29;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VQXefoTq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8661305B499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D43E364953;
	Wed, 24 Jun 2026 12:07:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8430DEB8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:07:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302845; cv=none; b=FpD3g5XtHqmYTuROCWt6Bp1ivOfrKxcCO6tYduJl/XzT2WwdME1kahmXvuUwwh+EAYjGDUnlfEXU+CdXmcrQhIb5Chs1tplsPfHP+4Xf2cNhi9m5ZeIlEHk07c6KQREGu/Gz48k/T2vYMhR2xyZnZxh7AAteQ0lL7Ig+eOOUIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302845; c=relaxed/simple;
	bh=5BT6+KwpAbR8LD7ehgy1GxNxSo9j2Iyzz+1xtPCPeJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcfcN3zUh+Az7fxObKxkXFyLZmuZcUIujfIjBa/W9IHvfi78EzN6u7UA8sk5dxdccDax7Qp9V9ighKSzEKcebbZh3IpyqlqM1qaiW0YmwsmpzDfuQlnNvhWtM+3p5PG8EOFO90EcFRYWWSAfrZEybcw0M7/AYpdeEbkKNu+mmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbvSMr29; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQXefoTq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANZ0F2869042
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=; b=dbvSMr29FP9CJiXz
	0xlHHMrrLtQWkPnQgcYBgmLogFu2kWKipTapa/bgxCZoehdxCvgG47tHGXxALHC/
	J86EFM75WfGZRxu+7p6I2hbYEUvJOJowaOa6I5N4IHt8siOeMqyfc/AAAgShQOZW
	+M+ZhdP9mRhYdgRbPptFODe7eq+yCsmc0pam5XEbDiKkpExCl01F4jZSTQ0Fx37n
	GjpUsrw8f40YP/3V3KPAmRZw++N6wtwI4swXRd2kFNZ4M8jH+uHx0XMPVLQEIAxs
	gdYa9IRnTkGVAYcgOKAeG/MPAF/2N2wRPMnnYQYxBgVFyfl2UsMdFQXu7PqbDNwJ
	qXS58w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq12bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:07:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbca8dd925so21259e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302842; x=1782907642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=;
        b=VQXefoTqL/9EFGasU+D4vkQK+Fd2VXq6bYrOhSwCuEUC6nqmkc/TYtumGIm+i/SSCF
         T8Qc9CCo6NZIDeO/OSFrRYnhzogXu/V4sgKH/uqde5qs0AY0YtIA+fM4yqAs1XTjTaE6
         O9swb2tA43um2ddfqUnhSElGhEqwZxHebrH9Z9Y5jAC6bxYOGZwuE30rAu9YPKPq6cha
         I02whxSosGL8cSHe55MxD5TOQec+zJWiC59aiZAOIZ2uv1RH1e3JjbaT7luj7ghPlLR4
         3LLeocB2DQY8qnBVVevZm8Two/yI5yMjV2yp6iOU9E+03PPM20qpl+kWebKU/Yu0oGy0
         /A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302842; x=1782907642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVf27dYT2ztufkmqcB0sEI22fPVNpZBH2UoCxL/YMMA=;
        b=rGi2fqYU8zHDzYEW0CROVYJBeaVVJhw6xy5RMaWBgVpwZhsLlMiNc4vb4eLv6QLcLM
         xg/xFEbPAPaeoVj4gNO78hI6lYHOPvUPmzBBBEWVhu246LrVA32kVL9WLuHhhrT4SI3V
         HtN5owmx2MJnr0czJYneCjPmWnYyVY4Y6OwddFAxMrWc9EckuI4PyD4tkXUbw8PiPuO/
         M1KiAM8a0J0EKxYKLSySxKR1TCJH5bfbycMJkoR4tiScaq6UQuF8Nn3OBSINoqRvn5tu
         RIwbnTQkAJlzeleKTW+O+/ywbdqV78JmNPQL31GSV2pQ+c116WSM2x2oeLNoyLsO4VhL
         NTbw==
X-Gm-Message-State: AOJu0YzPUtz/PYVvr0lAFjvbdyPxhrbUcN/kUgNyM2OXPD8WmgItBjy0
	ouqvi4geHf1Th39MM2bEY1+6KdGxRLAL31WupGl/sRidK3oVD70ZIgF5hW046618+IR664OOFR7
	AyAKBNLbLrIT1Bo6kiQAD+8hOHfoUKs5KtH8y48+gx0xEORZZYpQPJe/gzlBrWk/wygS2T5NtRR
	o2
X-Gm-Gg: AfdE7cne8bRGF/Y/EQYpseIF/5XO7EoDFY76U440yzP30AMv/Dqbk2TzG3CPm+f4d59
	30sWV74p4ec09f4Fmh7z68GvKbIMtx1kP0OOVIGcLpRLKY9RVHnrncAJ3zKXuyu0SOK0mLayzjG
	/tVVrf0ee/KHONlzcN2VA/cH6PtKnn0Ou76cJkmBlHtgjPj1cTqwLpnUKji5fLqeclLd7MkNdW2
	EMfLjlVagyUpG6SazBHMiEDYGNdfIueXdNO9IE5d+IZdmvAtlebFvZ6WkRyF+/on5hoXCgjVeh8
	KU81AizRLiNAY6GUEKuAwU3P6jjNZQRCdHiJlmIfoxXK7HAnEzfjycvJ/Jo/NMHoVClUbcdw/QJ
	pQRcndHz/a6mbuajHrvfmFChdCiaOeAyI9sE=
X-Received: by 2002:a05:6102:4b01:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-72f3a37df96mr2210347137.4.1782302841976;
        Wed, 24 Jun 2026 05:07:21 -0700 (PDT)
X-Received: by 2002:a05:6102:4b01:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-72f3a37df96mr2210299137.4.1782302839645;
        Wed, 24 Jun 2026 05:07:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm642093766b.4.2026.06.24.05.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:07:18 -0700 (PDT)
Message-ID: <5b3559ba-7c69-4418-a0a4-c5fa614830c4@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260620175210.19563-1-mail@etehtsea.me>
 <20260620175210.19563-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620175210.19563-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfXyJWjsD9BaWkM
 ssQYmSKA2+1byCeWSrf2USkKBYsyx48qeNIsmTQpcqVfqPotm40nG/1Y/WBRJrVp3KGDd1ZLmrz
 HR8AkJ6SFPeXsry2vn0Df6BO/Hk5mlo=
X-Proofpoint-GUID: KRMcH5LNn93s4yvsd5kfQshGALxQ6E1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX2L2fFxoztDHF
 4zS6vjIqn7lMcPHP1mTx2Dx+kRSAoVwnayRICAZXIpUD32MXuocysUp104F01/fELo7hZ2HQ64U
 Y3wTcn4zUcn9eFucFmW0qu6rpWaQ7gDvN/Xzpl9WseHQ0N2jR3tobvb1URUXpOSVXwfFcr6ulT/
 sLnlLGgLVHf1oy3OpJAbXhw9ooq4odIqhwzx23HD8rwqRliJpRpFykd0jeog/PksexF7kBfNkR8
 wBIfnzvqhmQwbVk0JtG4PRo/eidMNSTNHanIjJmPAZ7tKxCiNpa7Tmkp8cPTO5PNFyeMR904BVl
 V43WONR4aEwJNHA+0c8pJTxksCUj4FYSYctmdmr2r0FuPR6apLyzjRNxfALaqQp5Onri4UzsW7U
 neVJRxM7WMD16uVGKQSMCKyvhLhh3Q==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bc87a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=M-mfNm6K6QyoT37rDngA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: KRMcH5LNn93s4yvsd5kfQshGALxQ6E1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 755AE6BE012

On 6/20/26 7:51 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */
> +&usb_mp {
> +	/* Limit to single port */
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";
> +
> +	status = "okay";
> +};

It's fine to keep the other one enabled, if only to make sure that
it's powered off sanely

Konrad

