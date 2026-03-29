Return-Path: <linux-arm-msm+bounces-100596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGuxMb39yGmUtAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F9E3518DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D939300A3AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F2230CD89;
	Sun, 29 Mar 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrqDP9dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgy9dpW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DE306D3F
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779801; cv=none; b=GMBIdqFTGsVRlj9s3adS5RgSJbOkuEvjMiHLA9BaBTiGHypVT8juPr/RTvWy1HqiTMbeo6CqY1FeoqlGWt8HTSbjGh1CtYr8bpkzK97ZuhDO5+raQwH9yEOH7CtBawdW5BHQKRRkuodQJCjGOyYhjuINMAbcqPORxQxrb9dpr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779801; c=relaxed/simple;
	bh=6LLYaMCidoB7CqFTQvxDu+VpiXQrRhc/XlHQWMmOBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIlvePWk7SoM15lpz1k5zn+MPFgp0RwDU9Rby7qsaJu1gD+045oB7wXpBt8l+ARsVurbnHo7K3NC2Nxlh09919QSRX0o4en/HC58nxdloPr4Vi/N6MVt/E3JCuPVEKn1gYl1r9/8RrQmp2ejol8f8ISxBIIAKbfXaQy5KrASGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrqDP9dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgy9dpW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T1L54f3939180
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mK/kfH4F5IH4Sq2t/puumD2k
	dvUB6BnYA74BB3PmJz0=; b=MrqDP9dz6Ovx1i4/NejBwEUz9O+yK0iqBVu6qmiL
	d1uFBxE1nJKSeV4JpbM89RuD+XFOPxPm+LCkDoxjRD2IuvKeNC4eTZ74EOb2Y6ey
	Vw/8IwvgBB08BOQA67VFuyYRlFidtAdJXxIeHfzRHlvRR+omftAnUN+AmK2p04Qo
	Q+pop0v90KCbdYK+uStZJWzJ0qMYK4ACPnectr8beRIY39hqwJDxAsxCN9sVEIKM
	35I5sWUITUxG+GTeuYX2hzZLgn6/WfFtGcoH6fjLbP+jpHB5uGl86RYsx3ajxYHW
	iUpwkTlrq17ATV2St+Dl6JE9lNegcvyqCoq8X4klffeRMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hafa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so84854501cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779799; x=1775384599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mK/kfH4F5IH4Sq2t/puumD2kdvUB6BnYA74BB3PmJz0=;
        b=hgy9dpW5u/06DzrjJqDSszIqlDjhlQL0J36BWqXrTbAwZ/Mw21BM+XWsXxlYIEKKUm
         hzGUZm1uP7d7qGxgoriuxQdUYaQg0Yyq2I41NNZ1xHHjoT+PvXR9729UcKTLRKgJ9Wkp
         OUtxWKQLlKoYOr7NhLrx7z8OMP1PipXB+pjhpGSrugY4HhgVFRtLjSr1m7gVE6fgGWLX
         JRhTMAaPZA+c6IsyvBp0ITfRiGwx1WrVWWXbG2AoTyFcj/g2fJQlknamcVvARfalBUpe
         q27Y8sFVw8MLCcILlSMXq4FJFVnjnaL1iWDKvVs7G7+a6tu20dAWkme0+4uwjOVt4/LW
         cOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779799; x=1775384599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK/kfH4F5IH4Sq2t/puumD2kdvUB6BnYA74BB3PmJz0=;
        b=hdRBir4GarIyr+7GmSKzAUteggwqHQWXN73t28HgkTy5Sef1WTTde+fH7USegBr1N1
         yQ7bIWo0tBalOAF1zasFpHfQoB4YFU7FHbCdMTv7L7eMfFY3/m4ktsLPI9DzrOCHvjds
         otlylddbiauvHV+wFYh2BSArEYGJSNtw+bHsQ5B/UP4m0o75OPP58WNyEJdi307UeYgr
         6gGzSeg4J0biQFIpaTV7Z+irTSMOvdCQP5pm3RVIXPlikjXGPwvzVb3nA4DMebFapQtj
         GpRGaliVdapOeRINYkmspPL4Y6UuM9KI09noOPlbpSDki+nCz6QFzz7QjPonX7bZJyji
         EWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBqTPdpTlVMTYeMXgjLzujf8/NQX1t6o5JPejr7EF1DHRAL+mwoko+AVEx15CycaBJeY2Os1cQCJ1gq8JI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy682x/4z+Vlnm1Z+XDXuLFd7IKvOMyZhN+t5dsCUH8io+FhD4i
	Sx0DTAKRpxvLRvWYO5cqw0VBgs3IHrDddu6fSPmmfkyurdmqrzD8zjFt/4+et4IyF5LloICqv9L
	Idx8/iWGcbuS87dfSIQff328DNz9gZEkEnYo4IDgRA9HNpGbsTRMf973n7nU8SmD+4tGT
X-Gm-Gg: ATEYQzykOSsbUELAIjUgRzrKhn1nowk75pvX6fWzTOJZrdDf8OTbsX59WRW3toXnx6r
	KwX1J9wHg/eQz4yDz3LHopi+iiSaft2KljN3eTpFShUnD9SIP+WOtRpsBZIuOaCnr38PwRKqNRz
	7JjlEqV+sZZ2hfm4zsRv7WhVY8ej2P1F57sM/+w0yMa270Ff9OKW0HjSi747a7caNiwKLd4J67j
	wa6A2D1ff68SB1An5yyybg3ryJ7o6PgHKb/KjU12v5GN9E9zBWWFnyE4Bl7C0bqSj59Mzy/J4oJ
	u5qBQ/rWHxEh0MRilaxPbd4ROCNJpeo+3zHGpQuqsKEF2BwdzTP6e20We9lQqS3Hx//I4n27Bh0
	AihnKvfFkHlcXAYNT56d2iL6gnwau+07ZKxo1CKDSuT4Zy2sKxPPFszJQ2YedU5TskCuvQT0htJ
	Db7TwHrb/6ur6dUgjgzkVAHsdh5YuIyh4Qfv4=
X-Received: by 2002:a05:622a:407:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50ba38b226cmr118374331cf.34.1774779799013;
        Sun, 29 Mar 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a05:622a:407:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50ba38b226cmr118374121cf.34.1774779798593;
        Sun, 29 Mar 2026 03:23:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145eff6sm959406e87.76.2026.03.29.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:23:17 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:23:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: drop redundant zap-shader
 memory-region
Message-ID: <s7dptfslnmvngl4ocmc5vngg63tdjjspnkybmo6d43webucn4q@qstcolvexhss>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
 <20260328-zap-v1-2-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-zap-v1-2-f6810b9b4930@canonical.com>
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c8fd97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=DfNHnWVPAAAA:8
 a=EUspDBNiAAAA:8 a=5UJbzWUa9Ju5Vw7BQqEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MCBTYWx0ZWRfX4XA+IVAgpAPz
 STnmE/WY+OwlUHxI3dX09VKDJByWrvkLqKsu2V3CwIR+YC7TBzgdmndRmPV9tT8JOhRoUOQI0na
 oOEHfJ2e9rI6poMkrNmdR3qHRGGz5iX+LlJZ3ERObocdTDAvRlLFMGb1fWRX6I5siMTtAeGUFVP
 2WbvFS6OZkB8L0+fV2bmAVvyHGshkPbLIVCFmZHUMoW9rH8VY9Abr8xSIzh5wEmSTYPd54BtkZm
 kv9h3rsfM4VFtCnlY3pph2oHiVKDxC3x8SSCldGdI89mClSCH5WjiFBUEuDggh/M+o7AVxEq78T
 lloje+px7WE2TpCx0b9jSLhXpo//dJ+86+zRiYaaA9KhlUP8kvjXobpubfHIcXESLnPt9SDYlmD
 DtvKt5mXL5Klgnfd4qGeJTiXVPpYaCzNTWj+E1iz+MRzXFrpjKYwM9z7SNAtL8MnihvjTiIpRyH
 fvVZc/l6xHzbEx1HJtw==
X-Proofpoint-ORIG-GUID: uq6L5qS0DViBr41K3CpzzPp_NP3CqiWK
X-Proofpoint-GUID: uq6L5qS0DViBr41K3CpzzPp_NP3CqiWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290080
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100596-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,canonical.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26F9E3518DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 04:49:22PM +0100, Tobias Heider wrote:
> This is already defined in the gpu_zap_shader node in hamoa.dtsi,
> there is no need to redefine it.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi        | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

