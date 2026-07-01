Return-Path: <linux-arm-msm+bounces-115694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vGcbGEr8RGpM4goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:38:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0206ECE4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RBssWh6d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Uk/XGZE0";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9661303E224
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21CA40681D;
	Wed,  1 Jul 2026 11:38:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895C86334
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:38:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905900; cv=none; b=XhTxg6hdDLnW2SdGrPsBhH51clO0sZbmImqrG0X3hXRysgKH5+b6zBfhjRlUdlPcunBKciSH7CEkrlUTJSIlbxODeqaZsnWy5/diYUgSuONyDf+HBZDaeI75Km3VNnNw8tcOYpbcDigoxrAyYInRrnv4mVeeY0bdou0IrE2Usbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905900; c=relaxed/simple;
	bh=is6ARwVtdt2qH6o7wrGQSf++Qa8KCC79NEFAFUTZbbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGaHGVnybSkVyg5uYgYZlO634I5nuv5kwRGF4+rw9XmXKpUVpKUHjATRFQKcbYaVecfdpwRhy6aVVF2RRpR6t7VC/qZISnDrpbSwxG6XPus3BD6rLr3u0YF5F6FUXuKpuGknnI1eKGhgeOJ+bMTVZCznbaf/H3UP+QMHN1HbQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBssWh6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uk/XGZE0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8orn762976
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=; b=RBssWh6dz0rhDH9q
	NuVQSARMkh9mgAXUpPHQlP5M6Nm0cH9iPfdfJI6U5BX1tVQKRdMTGB/mdRwRsbS8
	6+Ve2ifGjFsRbMO2ZP1QaD7uwQ0x7eE9IaZEmmkjMCydiq/TzLSUkt9tVkC8MCOy
	6PWendMh6zk4XLxEMaEw96RicWBB2fqwSagvcwI/oaAKCf/y8iRNfWInZI6cKkc/
	c0omdeHY2sXF6aBnFiGbWDCU6ljmVlx9lr7Qt0mPvu/OgXdnLMh4M1D6Jx+AMlxt
	U/oLH/DMShTjkIYFEeFTROapeTuo+tZcEc1DAMbWCVY0mIpMtQuRVgV6puf6Ygkd
	gf9hxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbwy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:38:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so1081011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905898; x=1783510698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=;
        b=Uk/XGZE0H70pTFyjRHC3iSnmOyzOiIbAL87/V5wtRQ1krg9VLdZwZXPksUfiFFqh7w
         Ak6K3uF7E8Jl/f5REJraBe9ZhM0mCl72JX1V59hVLhN1M4ZNAi5mMhNqMT+i0agZV4oC
         t/tHnTWx4lwpeVkNYqjz1+x7+yild/DnIB0cmLXxebdT46NWBl+Wdc1/PeSvQreskAyG
         wJKVv/XXgRk4ifbgiG6kp6liK8Rr2jIPF7G8ta1CO8fA+q8JN/k6FnmtlZ0PDwCqmKcp
         zmyUD7bdyd4jyo8rplg0ClFqg3H5CA3HPwTvG5zT2Ig59YMCTjnMz8PqTaOipTVFSU1N
         85Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905898; x=1783510698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=;
        b=AMKRfPPaOrpspzIA8TKUHtSrqJtVVG5ztUId0UJmUhybhpEN2g/DIzZF8fNZpFSW0T
         4KuPFcFzfWKu6Fq04dxyxZUCwgaQgwh99ZaNDFksBlGu9QAsSTmtkw6lzuwTXwnEEBmw
         cZJs/+Azl0Bh0vWEIlmvCcArMhr2j/H59ufMTNZPjvjaQt90+hUXbhH09qV1OhDIP7Q/
         jVXGMUoRwpzIlg7fYeSKjzaZHixQa9h51/Jw807blciLJVWCp6DNTRYG5HnSVoHrSi/Z
         QWmzEo2rQAT9gcZLgc95PZmdii4Svx2hURTxj2jZO7rUH3Jz1IQygJ0QcSqOEKNxNh1b
         xnJQ==
X-Gm-Message-State: AOJu0YyrD36ux2jRYZI3GnqztFsfpWd0Art6m0mh+WYuthiDSEtIxUgJ
	rJrxaPXvPtkb4IAO7qeUQ7/OPh7Dh7Y2utiYKM+FpuAgPF/rPUQzIusNF9BN8/ecDVSbIp5wZaV
	o3bxxkCElYRYCFbHc5fx8sT2XlhySiJlsYyRuV9fH7GKS1KFk3gqS4/7kAAbcJidCyfFq
X-Gm-Gg: AfdE7cngy4W2EBU8OGDkpTgrsPJ3TdHSTmls5tl4c02IX/+WyLqz0bhvMol/jWFc6/F
	SmuI6Zf/9aPTC/vBfOiRVsAH1h5dH6M62oHih8HwFVlkCBX2z4n3HzHQ9iFWqK1gw353miug6JN
	GhU5A2Mw3uC/7jzXXgh5wtwMx69wrLnsbH70tsAEYLU9o/yEnGNq48qoedgDfY6XBr7GryfrPHZ
	djIUKOynZrnHYHGeeegtZcJyvLDRRI1sOc75wQ795cvmajj0uM95YAR/zLD7t62o+xk+wsmQBdH
	Wd2RnU1DyCcoOSqfh21MJonT6T/AcamycqywAK0PlJN5ybng757/HuaZNCYzfpTvlhmaBWMV8SF
	0/DrFIYrEXO5ZKEJ+uFs+LOsikkDSXE7AzBE=
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr10261811cf.0.1782905897824;
        Wed, 01 Jul 2026 04:38:17 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr10261531cf.0.1782905897416;
        Wed, 01 Jul 2026 04:38:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b6526sm2656719a12.8.2026.07.01.04.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:38:15 -0700 (PDT)
Message-ID: <f5b75410-cf75-4bfb-872b-81b6180e386e@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:38:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMyBTYWx0ZWRfX6TVRd2awdLqb
 AyotoFKn9hpUU1TWp5A6hWMj475xPEeLYUa8HChk/ToO2udWrPOjpzgZQzMhenQRlAkxb/uJ4ya
 h2kZYMOxcOvF9mx71cPM17WUJdvJ/9E=
X-Proofpoint-GUID: -viOQDfH0OdwZImeILkdp5_Y__m6FcXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMyBTYWx0ZWRfX8sc/XSt20tsy
 w/6OaZOpSCUZWnWIiqAvampOOT3OGT5ZVK8hq9j2jMW52J09GdvJBI8wfL0obkrkYmCi9X38pmP
 ZylqLNjya+rgJ7dykm3hI3xtbvyFohzYa9aSRJ7H2Y07YmjV5eWCkEqogvfcQEKE6NyvLqF5Id6
 CePIw8g/pYIoesGJ7YtA6i+0amSipbAC5+4mP9gNdaBdG6NqA2sca+J0WTUlZAnZL/+tr6wKCVo
 oB882WMInCUibWEMDvW3bFeGyY8da5LUah2Th3k3wD6sSFhMaP9Ddt0vf3eX9m5lSiUysRdlmMI
 SE4fHMt79oUj6T7YfGJ9jz2mE5/AHQW6s6CJ6Cg9/UfSWW4FY/awSVNPJVqJg5QKWozXkq2Oki9
 P5dFqUQ3BZOkm6cyjtMuwRaHRuIuCycJLalLtUYBxjwgvIAy4KJPCQQzvgRTwEGtKz31Js84UZr
 v+SN4AMrq7ay597zpgw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44fc2a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pnqc_4j3uO5S_kuVk7YA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -viOQDfH0OdwZImeILkdp5_Y__m6FcXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010123
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
	TAGGED_FROM(0.00)[bounces-115694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: BE0206ECE4A

On 6/30/26 6:57 PM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++

Move the commonalities to evk.dtsi and only override regulator
in the board files, please

Konrad

