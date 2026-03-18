Return-Path: <linux-arm-msm+bounces-98397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPX1CQ9/ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:31:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE42B9E6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 451D8300D6B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EA53793AA;
	Wed, 18 Mar 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGFxY/8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQ/AZI8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4167E36C58C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829888; cv=none; b=dFeN/gXHK24QPdtdJdX7S/pt0zH/aoqQwr9DlkhNY8P+cXVoylG/WZW/Yd+Dbz7bO8ypf3jvT0zgp6dJvN5UnmbYVB4mhpuKdZBBlhZKHqkDNjD1wrpf8Er3k+2Ip5VpQ2tz082l6CsiVTxW74PMCaQh7vN+76+64SD/jorvt/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829888; c=relaxed/simple;
	bh=SHdcvjN1TdUibYARofA+CHLFRh4yZAA+Sf+ctDBUp1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emcH1Gp+amQRhaj+6h38nl04ZO93WtVo0x0yi1xHeUM/033n/5JmsxgJAuk301jN2a9qqe4fE3w9bHWxsEP5KvZs3Lzt91ZHaxGaZUA0ov3mbofFWOJu8Z9XwZ77yj876jbrA34zJ4tRSqvojdqd5miuY2LQ3wmQN1CkvKlbxmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGFxY/8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ/AZI8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8spP62730120
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Spa5wHlziLMkSl4f1KWDnSpE
	6bUgad+mSLWgpSQfhJ8=; b=TGFxY/8TNlM3RD3JXz5VqDdAdgJiUy/AEtZrUDDC
	3cRviAxRvZ7bCoIFsDySfSIoAHPSBmU8kbBXsdDRe26y86icd0ZWBt36mTbJWLsw
	+HpWWzs8y/+tO/nCRaS/aAmYgFDd8Rq9uDC9tqBAxAJb/pqi9mhBiyK/hpY2OZMk
	NOqxOYaEJ3P4mRvLfKzSMiQHRdWeXSBQq2oEvtyvbLKtFVKqbCTJBL/w1IFRGq75
	EvwehnMTDR687GLc1ev7bJ3HV5SIfMxW2npl39ncuCMyqbpau56R5U5jRyXtbUQP
	vhqM6dFPtuz1dyeRca6UFh7Vqo4kpOLpOagmytDCPLz3Cw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvcx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:31:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f934f736d4so758417137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829886; x=1774434686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Spa5wHlziLMkSl4f1KWDnSpE6bUgad+mSLWgpSQfhJ8=;
        b=LQ/AZI8AQ6gUWilRrsMTw8mZCK+D1ooNLGYHJ29hdp2+Y6yPCBQsv5lzuAM157Q6V5
         MAn/Rb6odF9OrkEP+0rQgwtFRLOmRe+lc5b946v/S9cTOe1Ul5ksK5OFvEYE3l6eP2Qw
         OKuMNJPb5HvPdJrbmhiaES5oIklypSZs3HUVZU4Th2MymoscSIya0NTvheKNHFoVmVZx
         BvxMn/Q+N/ZoDGfk4Ir7m6um9ItyDuCB15XqlyZqjCc8PyOC67UvsFGhGoeVh4n6PX5S
         yuEeu0zxK5RdsO3TA5E2Emgliq8VbI8vCMsJXM+QIFOTfBAVRxayk9I+Xm+qFMa5ayBd
         UFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829886; x=1774434686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Spa5wHlziLMkSl4f1KWDnSpE6bUgad+mSLWgpSQfhJ8=;
        b=R4BrcUDmV8PZhDnWUj6V8Z1j+KJ9tHFClMObCpOLrRk72t9GduMfReSUR12dw7EBXh
         MpLvIcsO2DVxk4n/AQea6T1Bm0JWu5OGDRtZLYayhIPwPJ3nRiq/39IzYE1G2h6VO72Y
         AanDu0NZLzeakE3s0PZe3blbUo5phJe5loWinajPJIsr+ad1h3p6Jt27HIVH07UYzvM7
         CvAMFrr8FiQiTS8rZHprDwRZGbVqz/xjcb40JWohbHIgNnF873Ntye/o6uf/9RilSVdO
         HLJ86oBkoH7eAhXywx6yzkUO2/9bInnwC+rwT1ewAa4y2xuaPSnTtja5i/tmA+sTcsuX
         mtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDleUTKa5n80PFuSKATyf/heZ1+eZiLx/Ri2ySVqevCpdabCCM6xs03S0gxFXJOsNe27bie5vzubMMHuqX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhlwi8kdlpWxmly6ln+F2voY1pWct4/ndd5bN44zgAtWABEzIB
	2MFYT6PJ1ZQvmGEdSEqBEdu/iPED1WgFcVAajmbCybsUel6Q7NFw98bzxBen/DCkAYyShiqDK79
	QOM/IDEKljGBIiImcZusT6ybrHxkKAGpwY2FW5TZAaDZ3U95Nj0h8ECZ2abrcxMaT8ZvU
X-Gm-Gg: ATEYQzwvZnoqVj6XQYTXNchwm8+ENwtl16SvmbFDbQStijdUatEmmPoxEed1nV/2/4O
	P4X/hCyWrKz1WFZ06UVSk1hKwkAptTDPlLRGcf26IC1h0r/BWNVJfkLhoJYZoxJElrwUtp9MEsw
	ClvgsN+S0101Zq0G6iISgQK3dt9fTIVnMEpfAyRxvnVkiQLrGtdgK/eSzSUAzAj759pGlFGnIi4
	DmFFioWve1KXDyz1tATLJLz67R5t3+vck5dbtWNLsJRS4fBrjOn/JgL8rlI+Y/t1B86Ou11RrY9
	B1+KyD4BTohYSAVgFQR+mtCEMd4J8NvWiowsKXoW41P0QirtSYyDWQxkLtzU1qdymVJEBwSWOwb
	frCHfm66hk+I7DkH6hOKcUHmIKsAGMd9ntvjjU8RK8hJpaKgFX04yQHLibPPU1Om5dYWNZ/E6lg
	tOxu241DvGUCiARulzitwscRt8CT5p26eHftc=
X-Received: by 2002:a05:6102:c48:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-6027d3c69c5mr1195011137.32.1773829885574;
        Wed, 18 Mar 2026 03:31:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c48:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-6027d3c69c5mr1194999137.32.1773829884990;
        Wed, 18 Mar 2026 03:31:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54dbf75sm4808711fa.37.2026.03.18.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:31:23 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:31:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Message-ID: <cdf4xbcxlw4qpgyqughpz5a534wrvcqea6dkpzk4gioc4stft2@oa4fcud7dwe4>
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
 <20260318-eliza-base-dt-v3-3-8a50bd2201ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-eliza-base-dt-v3-3-8a50bd2201ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX6IRrNqPzq21g
 40VnN1W2XX9uVYfSKAx+24kAdEaUZx2/WkUOzCRLuv86okOTe7fQP8LOYQZU9hOKXTaZNni/MrO
 U7gfRBCNRHHT6A7xWI27Eil75JMedwlpGLQ1qxXhgVdvE2HS/G/bQ4bbghCA8ZnDBOmrDGi8WpV
 n+LNyAIYwWWClKC8yGSIZ00ZKmPR8xm7lIaOyy97H/nkv9Pcbrg+ZR7PKFxGk0CF7CmNQKzchFl
 /mzb03FDAJlHzvWBon6UMnWcmC0rrz0nEOBeG3BQH7Zq6GDkNjPg9URcBHk82NOiyDyrXaidhqc
 GTfs3PIBTd1m8KFWR3QviwhHSvxVRZa+BkVUs3uEEyxBG6reDE3xi4AU/Qw6/ku0ZDw2vBHycEc
 Ua+ffD+fR0hF4AdZwfotEmQpO+DranhaIPsrMfxl88yChp8tHnbRFwcPF69S5nViPW9NejqoYMb
 81qaYyK3FYyLhE554mA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba7efe cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dn1uUJcRrVR9k03n-jwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: sXQXtEUe-OC1udoPjGGmEpFtNJSGPJe-
X-Proofpoint-GUID: sXQXtEUe-OC1udoPjGGmEpFtNJSGPJe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98397-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1FE42B9E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:19:34PM +0200, Abel Vesa wrote:
> The MTP is a one of the boards that comes with the Eliza SoC.
> So add dedicated board dts for it.
> 
> The initial support enables:
> - UART debug console
> - Ob-board UFS storage
> - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> - board specific clocks & reserved GPIO ranges
> 
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile      |   1 +
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 407 +++++++++++++++++++++++++++++++++
>  2 files changed, 408 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

