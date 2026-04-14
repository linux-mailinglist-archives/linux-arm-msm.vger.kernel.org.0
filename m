Return-Path: <linux-arm-msm+bounces-103196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHfXNNV/3mnkFAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:56:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE73FD584
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D089C3022B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC2731A065;
	Tue, 14 Apr 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDhoyDl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfnJezc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CB305057
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189379; cv=none; b=c4MAAriLyLggmGsdvowazOCp4hXX3hTlJStJHSMMVFz8TKAbGqbTcfCLvtOC3GFDoZp9G0L6BLuu4yG1A24kHcbJCaDdrJE04RwiyOcRwXnO4Byb0/woFcxKG5NWy96Hjr8Mzz9J84xvHATHwdHcHxxuS30xQq128V7Z2RcaJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189379; c=relaxed/simple;
	bh=sujtAKk+T7XyzLJV3sWvURJUp2YcVbTYukhr8ZVBGLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdqkxaBB3Seb4YOWoDBYz/bsenN8yCQ8c/6i3Xn2AXy9xrJ9jGeqBSpxhCBt5+evDbSz+PnMp8+0JvCXEjDwie61qw5lERgq6pg0nWugIDrusuDCZjB62a7fYbpcbs+i28GVn5zfT9O7TUdtPNhXyWOlEeOltR0hSqAqyK/ESF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDhoyDl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfnJezc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC6sJn280834
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92cOdrzkvy2wsq8U5FBiGJgp
	keDCiW3kVyU8oL/89W0=; b=DDhoyDl+Gnd0V94q/SKUb78vAwArOWUEga0HVkuH
	FyBUpbMlZ6Qed3/fJPFVohzFqmAdK3mDwXS+02G/Z/urDdnj+SRhhEnKErZGNR6f
	sFBoS6MR48zWPZstEeONDvK+b6Ib/2KVAzgj9GOXPyAE5tF5QVzqh1BvGcEpNmYE
	WmlYKFQOBWm7EcVkeT+pFqCvxSFLnMa4QYShJYCYENV9vFwBsz1uRNYKNIITUfFD
	k4iKjDXkQtCgdxK+kPO3hcEoZaZ3KKJOpGHGJsGRKwDa/Y1ahsvsuIxK9/mU/ro0
	1kxM+g2TUAhCfuHR58KCwW6WkEK/KnAVKU80HiB45sj9wQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkxuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d63962d83so138198671cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189375; x=1776794175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92cOdrzkvy2wsq8U5FBiGJgpkeDCiW3kVyU8oL/89W0=;
        b=CfnJezc9q8x4bKzSKojtYj5fD2z16W9SYxKcy60w4M01yjri/axSinwRP4i9wh1PAx
         QcWAX6BN7JXHP96VYvp+Kvgnz4lQqxV7m8pZnXfSkrsi5aPp0931UXzb4jlN4eP4sa5C
         EtUh8LRVelej2/iXXGjtObIs655YMXvd6caDWK+EqQrDUhIXlnrSSdVtHkSxlPvpQERY
         RgaMhJpK7EcnlYl6U2ZQ4FIetdqNw1WXfQ0PlYO0gRJowYPE44I/KnMb+rKBtJqBmS1G
         wryvRpFdcdLTwfi74jV4gwZcZYWi5alVqYeYzznN4FnKOlYX+6Ts0Q9td7Lbu8VAL2DI
         bsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189375; x=1776794175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92cOdrzkvy2wsq8U5FBiGJgpkeDCiW3kVyU8oL/89W0=;
        b=kZ6uTHJajdmliAkvh3Wr9CTK1E6DLtKIfnP/FxshhVtqj4R8QTyV70S883rE69PnDK
         exgTucnAmwqd72bHEDjlg+KZ+yczklvoaZOuzIrZUCo0ExZkPgLPH0DXHESPbQk56mU1
         KLleA3oko2FK8qcWioX1iGu5/Qb15HVuYA17tx1q30KNazzJIcvnqaiYlMFZhfLzad5U
         17EIiwboy5sh117gxO2YO0dI1KMdTGdXuek48qebpBdIHrmQpjhCMuhgm3HjUuFGy1Js
         fEAUq5chQSumHDcLYcpDLaX9gWjTHL7f64YfeBm2OCrDxgNPfWdA3rJZral8F25VV3UH
         Wiog==
X-Forwarded-Encrypted: i=1; AFNElJ9uzKCWTm49mxyaviKL4eZyAQbyjT35rM5eLen3otjHBTF+r1ELFxXH0MtQ5N459xAn4VaoVs75tOFm8Lru@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KHiISOt5jYAAkD1dnpN7aSn1dP1o9LZVBn+SAugT2ctfn9Ng
	/ehnM0F/igeF92Xd7TkoFThtzDnjMl0NlUrJcy0etAf+t26hbLmeRD19/5v6wQ19z8clGSbaSu0
	GOyaFBEtZ3Y3d5+qK3Nvh+rp9+pb1LU28APmFSv7WZTiH2CQ2/lSKsIafQqxadfeX1QXD
X-Gm-Gg: AeBDies8KN6+Qfs8Az1eFmKtVd/b5jzWJ026Wujs/B1rgUpGUn1kA9vS3RcbZrwX4ku
	y7Wh3xV3MwWkvst07ChQumrCoDD3Nt28qLfSw+z3bZqlxWcNzjuKr7rxTxT/6C/wePvy/9pr8pU
	FokBgrjc15w9PrlB2+5EsWVONXlh6P/RMxNgVt8+YjcIMerCNBxTH/qLO45WTDk4kcG5xJaHLpr
	S9ng0laXgWiWkQo9PT8sSiEVsP4uWl1srNR62Yi6RFi0LhKfgH6uoR2TRJbdyKn3ECAcHyEIRQF
	jsdb0Baugs+SAYfvXs1JWaKmBbqziADzYR1ZA0U+Twj1Z06aKIAzWVKrIjjnMquWsRxY4vDAfKD
	3iTVigDCyPgiuTFp56UChpm4CraGdTeTQ6NpD0dWfWhJkCDkuIQGj4o79NSyIJLS4CHll6arHR9
	FH+SQJ4ri66hp4U0pq5YXjLpatHsCQwz1sayzLPYvTWIvqAw==
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr288491941cf.6.1776189374811;
        Tue, 14 Apr 2026 10:56:14 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr288491291cf.6.1776189374332;
        Tue, 14 Apr 2026 10:56:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a400d8d33fsm1083112e87.28.2026.04.14.10.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:56:13 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:56:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Message-ID: <u2nfci7pul42sj65udak5liwpddqzrm23g5af56u3ancjixuf2@kwmxmiindqc4>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-GUID: TWUfi-TmghRrmPpbxLB0a1TgooYq6Hq-
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de7fbf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CipEwJKW4Sg1KE0sZiEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TWUfi-TmghRrmPpbxLB0a1TgooYq6Hq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfXzhg62wi+1fbf
 Ri2FUOeCGmexj9MwOhIVG6gUYytXFm9hPsz/aKsqGPF/BMzAdlqQYd3wKOJt7hEPi+i0Xnn7+j0
 clOpxJvym0tidYeaapwsqLd1goDsJYkBs3Sf7I6UQrlmEzMPLiwK+8rnzcClg9vuAxOQC45Lca9
 zj4/MWlEaU06GCaCAVzqNaK7XeneVLOupSaPMraa423HCO/fE82fE+7gKMcqu3R7QEc1blrvAH0
 1f+craO90N2AGym3sMu4k6GvU/Y7Zie5cBWJglpn83LVahCG62Val+41yt1yeK3BDzVwSZjUi7l
 pSDXS+u208wVpw97XVoyr5bp2u4ZFv0tnqZlLYUgoYjJNXMuCxaTTXFdzVkPhlOAU2chmzhIOnE
 8+3wiL3UZanY9WksDOODIyfkgUnASP/Gzl4WobLivLKsHlenV4sMGnCU3YVLZpwe8cQ6eJ66crZ
 arwJGWSbDCoQX4+9eAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0CE73FD584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:38:24PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

