Return-Path: <linux-arm-msm+bounces-103154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Oz0DDNW3mmsqgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:58:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8D3FB8A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F6A30048D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798C33E8C59;
	Tue, 14 Apr 2026 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxGN6TGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8b5V2B6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A73E8675
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178711; cv=none; b=LfusFqGypwpS6EugnacwWmBl/CGmpldnH8fH5E0+2HSh4lQJ47Vf3eQT7gMMiIbsICx0zNDw00vNGTVUdvwQ0CYlOO7asETxRG7EEsuYg8VInCoHS9ZMh0CXuy/HZ3foq4vsDayQV1ev1JyVPhRjr/nLKH6D8s6eAu0R2efvDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178711; c=relaxed/simple;
	bh=i1Csr8ki+y8cyROepemokKn/ngdpl0aL4/C6QWLBpto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jncFB6BWM4RQO1X5wmyyrDQzRC7fr5SXmqkLemay/GRugZh10QUGld9xfsfOsfGEe1b7Rb+ta8q9OZV3Xk8Glpv4XnvlFEtTKH39NctZ30TQ+1pZXWdZqcoC5WHfLcGW6k/qjpql5t6kxko0coL/eIXN3gp6gy4JIfZPx/6fo/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxGN6TGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8b5V2B6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBU9Gj1479154
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tkoSZb3kvTNlmZwPdIvijyts
	raxI/vhZjNBxJnA5UZI=; b=NxGN6TGbHvZAjSwkDzGILJ/R5FCJy3KP8MW4WmRW
	TsD7mkNyxyCcYVy4OEBVkdJqrUiFzIoRjGuOU8QGxuxk7n4PtlWIR72yKmmDmlWs
	m6uK7zlrP9DTa/bccYj18y0K8SyPrxL2u/+MC2Ysy+Nn+7LYXY8dFAeq8u2ipkZG
	O1WWMgwUJSwXbGRxp64MPCcPPNeB7mSRNzleL8gvQIf99ZGY4VpQsRfbtLFfZPXO
	jVZZ9v6WcxRuoVCI7smxN1RthA1HAhdNVcF8eSSLmv6WC2AYi5U+AWfNGFY/3D6K
	vB4HeXYN6TrTeZCJWYA3EVFAcYp9LLMo8G/0AxGyk+0a/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j38ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50dd17a71f6so72524271cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178708; x=1776783508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkoSZb3kvTNlmZwPdIvijytsraxI/vhZjNBxJnA5UZI=;
        b=J8b5V2B61JQtQC6yPspuORBGciqVp2JAWVp/RvJ57MjD9QJUUH7WmgrnpEH/ghY+XZ
         cpdnzc5JG8Vi6/DfsbKTyMUiPvd33CkPKXwmhefJvlrrZHH0OCYP857FV/J7KACwIL3t
         YfS0+rhFNPzk1+JZUTES92Xw5/e+tV2NQGTYhSxwuo3PAyoykrHGrsn8Bf8iy4hRTa7t
         PW9KsZ45phcTfCuemkS229U2dqt3KvUWJEBCF+GEsju/yiKQolm9ZEHO/mJJcpZZ4h4c
         o76ca9lx6Z4GbGD2nV8NGH7vjMf78qK7r5l6LK0ffyr/8MzTLPbjpOxj9/R1+DSUZ9tA
         yTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178708; x=1776783508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkoSZb3kvTNlmZwPdIvijytsraxI/vhZjNBxJnA5UZI=;
        b=NHo4u5f6MVnuFbjADIj+bwsobU7DJj4dOCRHVlQvw/4Nl7N7mMsStrA25mabFqw7UM
         kqcUVmGOHxJI4Dg9yxEcKy7cHSrrInbQhPQ8u/9UaSE3R1CuKFbEWgpULxJm3PggAmci
         Qhqe2QEQGNfjdEihCVbZp8wF6gU13fcWLtP80oqYn8m10QRSZu9e73A/GQkaU2n9vGTp
         CNcQCCXEWm2yYjgUrM29MFcZC3IwGDHsMqm7qjCldBSl7vJu6+WmyjC310Fegl9aEM5s
         T3c2NSHgI+n2Tjp9BYzI3TiU4Lnv9KeYwDyPGimSfDZJi7fzMbKfVDvdZdRdAuj1cClj
         WEGw==
X-Forwarded-Encrypted: i=1; AFNElJ+pc/7lusle9N8yoIxugXJNxNHaWJYHxM12ypkQAY1bE4YHiqzpPDIyUwHFbMnTRVawCGzrdyzDfeJaIbo/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rgV1FLu6fRpaCI91qR4f6rMWIp2oVBDkAbyN/D03UXE0+a++
	H3wKyh0wLqTGq98dSNGwf38u4PqctCimWmuOgYyONycqUjsasw/IH8U17TYCgbcsg2ig/wXdzLq
	tHAN86tlm4OtvhYwa1J2ksXYZZXdus/AudIacHP7OBYoNkjv92xgUnvgIrlDqIofKAlNzlmU3D8
	Zc
X-Gm-Gg: AeBDieth9NVVVfIv/q9i1rNwsUH5Nzm7Y7a2GfAipAX7X2D0DcckoDz5GeClR+B6vfm
	GrB9Q2IYnUv7ncmEjojs59eRcfOc+afG7ZtWWHOt5i8kjDSD93PP8pPzbaOcT4HAxRwDLmf6bVs
	n+5V2uqibQccBi72Ka0QQwVSkZtgZ4Y1kxA14wifQ/SBbwOflUsjQ5FWVj91WDJaqPoRwnvCXdc
	WObYhTNweodtJ7f+td5nlm2dV5Z80ofUbXQHuLrD84xSepK5xo5xkKRg6D4ii7TgHQpDEvNGf98
	o2q1w0ik+PzCZvoLHY02bGgfVlZPt3XXc0A1gJvHExYmPgKdpxf48h1R7SdP646dky7/xDiG4dP
	ePkBiL1HAmjOg7tbi/kGUdL3hL7DgQ3qFtZ8Csnh3+KWHnkUR91mSTXnpQZzzL6cXMZHdQ//LdJ
	SUNdZj7rBWMYmqREVZ9iwURwjHk51LD/4d0KpEegERcRv7Sg==
X-Received: by 2002:a05:622a:130c:b0:50d:a8f5:fa94 with SMTP id d75a77b69052e-50dc1acd87emr301738221cf.21.1776178708436;
        Tue, 14 Apr 2026 07:58:28 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:50d:a8f5:fa94 with SMTP id d75a77b69052e-50dc1acd87emr301737861cf.21.1776178707976;
        Tue, 14 Apr 2026 07:58:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49545b48sm28069341fa.22.2026.04.14.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:58:26 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Enable audio over HDMI and
Message-ID: <eeqwsvie5j4b52ufbxy6bfddlgsw5fswbcx2omzwi2ik7hdzhr@ku4ga7eeklaa>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
X-Proofpoint-GUID: sPFGQkGqpQfrLHqGSmEFqJOFHJ4ymBkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfXzPA9srX+G2rd
 pG5JvDjn64/jII4Yhj7Veh92YA/I8t8iiiurlIpWmtBp5P3tObCBhzYdp7tjZEHAmJ008rFlikt
 BPJdIFSKsnHzPsUrMEID2APF1zPmNb638m8M7Qeh9i70G2LFmZ2GJduoLF6Vkebe1CQ2pjdctFk
 Hwt7X73V8c3Kpt5uCgsWi7cVaX8AxntQCG3/Z/NfgauQhmKOTDQvZpQa3U8Y+mh4mjoj55uK9qu
 LlDXNg/OmDsTxlgxRsUHVKtIoUimOQ4rFYiwPKDqawAJ+bg9aSGisu7GQgjvTWm5ZQde89hQhG4
 JccaFnjcodjit3KCvX3pqW4DArPX41OOQZg950qkzTZNgTpxKNGQRPZ8imX6GttGgniwynRrQto
 boJb95AKQFKLfVZQqqgQ7/oxDgQxyUQ6P7LyH/I07/XBgpMtxPCDOUR0KYv7bVLMIR5hgW9QaSs
 b3KvuRAyBqGpdbzmf/g==
X-Proofpoint-ORIG-GUID: sPFGQkGqpQfrLHqGSmEFqJOFHJ4ymBkh
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de5615 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ZbuxZ4Ij7ejS0DuN_rYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140140
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103154-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87F8D3FB8A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 02:19:33AM -0700, Kumar Anurag wrote:
> This series adds the dt and driver changes for enabling 
> audio over HDMI and Displayport. 

Do we need topology changes or UCM changes for these to work?

> 
> Kumar Anurag (4):
>   arm64: dts: qcom: Enable secondary mi2s
>   arm64: dts: qcom: qcs6490: Enable DP audio
>   ASoC: qcom: q6dsp: Update bit format support for secondary i2s
>   ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 59 ++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |  7 ++-
>  sound/soc/qcom/sc8280xp.c                    |  2 -
>  4 files changed, 69 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

