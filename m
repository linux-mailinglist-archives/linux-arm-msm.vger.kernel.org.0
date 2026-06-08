Return-Path: <linux-arm-msm+bounces-111785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bkicJk+QJmoyYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:50:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C76654BE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:50:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eP3/BhXl";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZLEBJ1XO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CBE73014135
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBFB3B14A7;
	Mon,  8 Jun 2026 09:50:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79C34D91F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912205; cv=none; b=UazdsRPWwKAJCf/YXAPxf4MdsXcWTmGmQibAQ4liNrljjpw6z9ho6TyDfDlS8VmPLklm4N0GM3ucHZXgonu9WZGppnTNPbHP5F9z0xtMqjy+D/01E/v8dD5QpfaJcPeiSeTv8avSsFbO6Rc0K/77B8efgoMFnWJ490cVNR2HNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912205; c=relaxed/simple;
	bh=WdGkYj1iMir25SymT1Zkxa2jedNiiwUmRZyq/YzJTKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thRT4InG+Lebh3keufAEV64GJCTDLwnrMmKuaJbF8dt4zTBy6V93FuOxRbIeSAggXLclk2DthoZVU7Wi3LfIdKAqYY4N/4oK7/hFxWO/q5yS0JL2LE+ONv9wGN//IVui2+MAnnI8H2lM5OgdH+vJ2anQM1hYkUkP/XG8OkiTN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eP3/BhXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLEBJ1XO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892KMS2677806
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=; b=eP3/BhXlTh1U/2Dk
	VYCfaccSUsrkdgAjLx7JC5cAfFWAn2OAJV9lsz89JAzS1jjpRgXuF+ao0Xb/WLTg
	6FQiW+Z5T2qW6pzayQbEWlNi6nuQxx4j3MyppO1Gw6zMZfplm864aDThMSPO9U9G
	iJGuL1/IZyBli1BOA6oeWR8YVURZQu410MqdmaZ3BulCaDNuKOp1kTLAYJE5LyWN
	mgQRy3Pxnd/2PrjBL5c7+g/jd/LOZ0OeWAnRBpO2b7Qm6/Nyu1nhuQXMaaHVqyQn
	U/KchKf0P/3IBM8xyzjy+hpQ8mH5qXSd4hJ3IUOspqeP58Ephc3chRF/y7orQiUY
	4e48+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkr76n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:50:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so4591676d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912201; x=1781517001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=ZLEBJ1XOMuYQFzo2bCDgYwiI5vDJ+7kDHumjKJj5nGZQc9WDlFsrNMmtl+0nGnqhDa
         HjPlNEejn49s/H6VFOgquD9gK6IS7pUzz/dc4LfwptdMxpADsMM+PXy0tXxSEHiTSjdp
         OZ03YBuVd5lX3UPUr+4jW/ObcbT7VWfSPH9JeTBm1vKuSoH2MN1o88NDirNt3/Ls2Akp
         NxdAjG3tKi2rXiD3dmYsxArzTd6MncOzAsN/T6QEaEVY8b1sO2VG7C86Kl4vzGunMyRe
         dD4qkr/JJ5MaVp2VvSWR1uhV25BSpJaPdihJ47c0m+5jB+i6rBuAi0fkyxeNrjXWgams
         0FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912201; x=1781517001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=rYQFeIv/XaX5t9MhYicA8y3atskjSJn7f86yvcpULSZ9jgJ0EATNKYXYFw5B9L30oo
         7JO3chGPB2q/mmDbAUMp2dahJBNQg6h4RP3dCm851SV3stbPrAtlYKTfyDQ5ncyNkOmy
         Z4da3hDYUQCcfnaXcQQQ0FGLgf8KClrBlYBudzQk6nr350ixJvguoaJgWYx4s4q+OVMP
         O2jdsslW3g60599Y/bwuiwea1Foz3Mmc1yGOItgR66GXWlGK9Wf5ME1fdCDab0PzzCX5
         Txe2andZajSDANTTfJkzsoQLqWTDBS6l+FepZnwd0Rog30Qb/GZnZEZDVB5jAnerlD3A
         zzcA==
X-Gm-Message-State: AOJu0YwMEG7dxX6Ppi4yVMBbpah37so2Z1T3UcGd/3mVDl5MdGGN5rqO
	3vP8VrJKqjxDolcxQSWh+AW8nNCgWOy3LwqmQExVpjf6E/W3jlT4jGXvjSxn2RT/6cPcAoWLkIx
	c6cJN/FQdMBv8dxO/YBFddX1E6jXmC6bqKnTLHB9OniyAUJNYPiBF/C6TuwlNaVzSvh8V
X-Gm-Gg: Acq92OHu2pwV8bFFT6Kdmywf2VSKX2h4o+ZpO/CxUJGtHelRtqUNVfzpM3u4j0qpOpw
	+Z8Xg7hFxtfUrE1sE+WmE7zMAeMn1NnymtjAwoxXZqbSjmchSUbIUSUh8tBv86NPV/CW8wCb4Jr
	SjelsiIoNjz3xMKmG4+Ytv2p4ZBsGNWVwRrn78D4luGR1SVu3IMmZcbAFYFS0U5caWTXq6MM5FD
	4e6SsRxmO+C7l4naUfSib8C51P/gAr++NXVjmKcXzX1pFXRItkmKJXJG3ELeIhFz213bEjUHJ9R
	KaZyr+LajXtE5s3m1IoLAG5SPL8SSSHiBArcRzyi6Chj4o0uQ9Rf4i74eY18ASKw7mIHhSPlh50
	Iz+LHNWmMGqrqJiEBMt6IN9jKpBEt9ed8WWTa1c0q/HMnECumV6AngGHX
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418290285a.2.1780912201588;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418288385a.2.1780912201114;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm839231466b.33.2026.06.08.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:50:00 -0700 (PDT)
Message-ID: <cad0f559-8c1c-43ac-a923-e4d26143b572@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:49:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
 <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nPvk6v0MIv5nmMLwd0bNDEH6C1ZeaNMt
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26904a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CQAop9hJs7bg5q8h2RUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nPvk6v0MIv5nmMLwd0bNDEH6C1ZeaNMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfXyOkSmn34b5Dt
 Lkm0sZC8Rw0zIdq94UDf+Itcl217naGuQd/DzO/BUsqiEZpT2zbSSGRkG27SXKN6/mEj/1+Upw0
 mxVxaRi4m6uFdaNgwPtNCLZCwF5Z5y8oKIviDYb0J0BOJUtop2B7QNcjEqpEdULf0+aMU/UA/TU
 dhaYVrf1IIWhWilNuJq3rZjgTCNYBbwOarM9F3gqSO9O0sEGic+TSw59rcT96sE7ws/Lki7eIcB
 7Pbj4cwlkShnBSAXQV4dCtxVno+6iCKYIDcZKiXsN77nnQlSUk5qIsbZrCB+4bUmb3xr68uPZhd
 pVp5jEiemxyn0lJqk/ldJ33CTwszR/d5yM+dDt5CGx7PCtNkb/JvzDrfjr8SZNOfXfWe4EVV7Ig
 B+y9ksa3SC9Y9zhiG+IU41C3VH8/a2hr2E8V47M7HGsGt6VsBuxdztGjb5Gub+U3UkRttGvmHSg
 W7med0ElhpP7CJtAYXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111785-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31C76654BE3

On 6/3/26 5:48 PM, Erikas Bitovtas wrote:
> Add device tree for Sony Xperia M2 (sony-eagle) smartphone
> based on the Qualcomm MSM8926 SoC.
> 
> Initial features:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Magnetometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - USB/Charger
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

[...]

> +	gpio-keys {

You should define a pinctrl state for each button, to presumably
configure pull-ups as necessary

[...]


> +	accelerometer@f {
> +		compatible = "kionix,kxtj21009";
> +		reg = <0x0f>;
> +
> +		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8226_l19>;
> +		vddio-supply = <&pm8226_lvs1>;
> +
> +		mount-matrix = "0", "1", "0",
> +			      "-1", "0", "0",
> +			      "0", "0", "1";

nit: please align the "s

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

