Return-Path: <linux-arm-msm+bounces-93338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH5KIB+zlmmRjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C047915C817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 884783013856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E5A32570E;
	Thu, 19 Feb 2026 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGGYO8M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzKy/CRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE22320CB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483932; cv=none; b=jPU9ZT6Xn3aewgnhpUcMefc7Vo/cI4TNALXN9abNt+/vHCyiw6TESbxIDO4HJtgTTO1o+CtghhynN7h61gE8OSmLs+BI67hwfqr0Qlk4kxqrbw0ITig2OlCWcGkMpZxFg3uU8UuhhwZKOlCBHWYqSo/vj+QNXKawTgo5pa8B7/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483932; c=relaxed/simple;
	bh=vRhg+wVXoigFw1YPKGKdLKSrgzXM/4zani63yma/a5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiAKzfx2VU1ZoNwjHlFOfTvl7Ypx53Ih+NGz9dwUAWfGqSNeKh88aucDTM2uSdyV8EsMOH7EL+kBRu1kwGQi45yLN+VFyZb4aIOHWJ/WCchnEC2dIcE6uMGQqWxDdrayZZ1tupMWWi8rnEfeo9g6JW+4EwtnOlKmMRgn2vh2Ujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGGYO8M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzKy/CRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J53h5u421978
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBjwtjUZT3umaRaksTB/vG4y
	DYBJhDwDvwsTz3K0Ktw=; b=PGGYO8M6/Sx/nw5NXGwzcuM+jkd89mdxOFqv3xyG
	21lErMadVN1YLE0g7v4lkKpf51MF+WECoS7ftQ1p/o+kgM0nIkGpDMXvLxL7wsnM
	+wDOUqixClrp4h9xDyH5+m9uAX9r5EmIsLtqG3EweC/31NlMD/2FvprthUxwYw3E
	AZHvVR+ylauFU6W3qypeuuyz5TDjncoiYPSRn1neRfhQjJxmOFN3pk9XD9S1VDjt
	Z0YoRLkNyA1VQKjoh/OnlZsHZVFb/Yof4aEBhPXjEqtzQjviw9yXQU4DRploTHtr
	OZTvvSMxbkk8i9lF9z48WWrxDoqW3n6+mN+XBI/78/u9jQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e3k0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:52:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f4dcef67so71256766d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771483924; x=1772088724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBjwtjUZT3umaRaksTB/vG4yDYBJhDwDvwsTz3K0Ktw=;
        b=TzKy/CRdp1+lepJH/ycM4pfOfejF03qdfiIRjTK9o4CV7gTYZcz+JxKcYHsBnBuxPT
         avCqfoPw9Vnbj6HxNwkWo53WkGqdmdOnOj/Fp3Z4ObZBA4ixHiwyWaJ61lGAtJeQ/sSL
         VVrsq8Y+5pbDwQQngv0B8TQrlb55KgdkqRlnNtt3kSaL/7UNaMrJbnhidUxSMMwilMDK
         4ClL07iMiiJxW8sveSFnp0KmErkqjpypfNdcf67fq8FkBZ3EGSI7XCR9J9P9tnZqa9N2
         HAjNIFM0OxCJbgQ75vwAUE0eZe3yng9kQYFrFGeJh/otfQCgOe+5yHn/fGIn6kbQrOZ4
         AxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483924; x=1772088724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBjwtjUZT3umaRaksTB/vG4yDYBJhDwDvwsTz3K0Ktw=;
        b=JmzsJB3l6cCf3ocJYlU3cQw3WaqbcKt77cfIpYSPEWQgsd9JHc/gz4WQtvJ+lQaTK7
         H8ee4UORCkXlYUDhW0EqzU8+jmV407SdJigwOUQgLrCwDQagPrLpNh6z2Lt4rxU5d1zd
         /c/ZVSM2x2ApFPCkUgwwNuL94LaBZkvpIpdCoyeAmFYdLWWS6VV11yWUkDzknujcqa+m
         gzZrk822HKQLGJGK3xAVE2gi37LQVGuVq/DiqnI7l0NvU+G0RpiISPZUOKLb3kBigaCy
         pRBVhobi/MsgBTE6gpXPF3Avk5c9aAllBMbHdaiOz9q46JlmNmaMHhTBi90MYuWbwHP5
         rlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsGnhYSBy/DJiQstpBQXXuOWEDm7QHd5emhnLi5+bqBMDlDujG8A6f1ra/0/xY+8gib33PqRzw1hDPxVgN@vger.kernel.org
X-Gm-Message-State: AOJu0YxLIvHArPXSbYPxa6d9pvkSAhb/ma7/9TzaY+tgzudQgCVlvqv+
	4Pao6dixk7o80RSfpD50HIgeVEyMQgBL4R7UFxK0hhBx0ENcis0Zqv7d32IX0kLP2G8W+SVJ5sy
	L84hGLdQPLLUNNNGNGIOu5ovGdv/dz3T8gTD3j9GPJcYBDYiNMpLrbx3R0g/Oq8jDcmOk
X-Gm-Gg: AZuq6aLcr0S72icTjPrRhFiOaC8ZSm5E2TbSEBnoLP2CPNrTY6g9OdhIGPPyU3Kr3LY
	u7b66mbsqCqd2M8KE0wl2ve1VvVoCLVCJCKLKYSEZMasQ2Wqq2gMBHMkF3hOMCjxtQUv5m/F24M
	J2yuKcGl5g9/57m1Q+VBtUab3Lz4r8F45UArAL0Gx85qozmQ+/ZunH3ECo3lpTmOVktjvHrDSZr
	XF3u48ODMsjYC7cKH6BX8fkYYzsFlKtc6vL1PNtV0vqR/QpikIhZQz8DManjD22hptp/UPFdw7g
	VMqYOH0G9IPULuCJruVh+hFu6Jb54ta6ZuJcz4wACh4wIGXJXGGCdLKgojBJllTmOPoA/WkOO39
	1QTYPbdXpw6MPX32HlBo196RxMQmMSGityGpKpTQhfFpCfES7da4Ia6xMqDaxaJ+Gs7Wsnr63zf
	hZyN4U2ch/Xq3qjGjQDhj3GKYw6MjRW/j8Zqg=
X-Received: by 2002:a05:620a:28d6:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb740ea9c9mr493857985a.65.1771483924223;
        Wed, 18 Feb 2026 22:52:04 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb740ea9c9mr493856585a.65.1771483923802;
        Wed, 18 Feb 2026 22:52:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ba17dsm5020256e87.90.2026.02.18.22.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:52:03 -0800 (PST)
Date: Thu, 19 Feb 2026 08:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845-axolotl: Drop redundant
 VSYNC pin state
Message-ID: <okqsroaklw6xopjbavsx2czn6cmvurtjz67oafni2cl5lgniyo@czmoerfzob5x>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-3-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-3-2799b8a4184e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996b315 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NMe5sQuIffPLTvoV0ecA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MSBTYWx0ZWRfX1+u40N+r7sqs
 yVfRuHLlIAHtwTpfUhev6tTkAqDvW8Ivy7y6ms6BmNI9fTYKwSV3aieo+CfLmca1vUJHLn9bDpC
 buLD50s19HDhoYWGY6fm2C4+LjX1wW5snwxFBZid1sRFnxEOTxLAIJxBm9EvjLg2dsfJECbrzVx
 yc4srQ6418HmRqBKptyIFmaxr2CG119KNVMCoY2UJQRYtCzxne0mNFChDBlU3Vgsu1AfMZMkY2f
 NNN1w1FwsgEgzxM3vUQC+PWsEsuxO0pUjDqYEQtPK+JTvKidgVgBl8jrz1M26cQspk6mXZne3XA
 gKbC1FLvsVhesfMJwyvKs14Uc/1gqNotLLK4cFLa/fo6n5CXZ7qcYB/NHejlJxQHDZ8TwZXV+9M
 EWpDDHCyrWq2j2EU65TwGPsXYRjcvWu/LC3kNW59Mnp3YYQx909+HIt5U+MkArs/+zN/0Kw4Lig
 MW+xhPGuEHZLeF2SW/A==
X-Proofpoint-GUID: 9XYPPM29E7yMvY_NJPnT0DdLx-Cd06GY
X-Proofpoint-ORIG-GUID: 9XYPPM29E7yMvY_NJPnT0DdLx-Cd06GY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190061
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93338-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C047915C817
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:24:25PM +0100, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

