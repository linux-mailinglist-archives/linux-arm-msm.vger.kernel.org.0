Return-Path: <linux-arm-msm+bounces-101796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG9PDzFp0Wk+JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:40:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D398239C470
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3D73010B85
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C79342511;
	Sat,  4 Apr 2026 19:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOesOBMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhxjyY7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA351D88D7
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331605; cv=none; b=DxqIYnBXsrYRM4+3RwXYIZ8owXK2TfzXd89pC4zCEXlpzQDWwmKo8bFwNXSVOJiBJSlWj8mYSoRIMt9vCHLuxVVIzBh0yl9fUZYX7idweI/ED3HsMutmF7tadTwB/tdAzdDvjxnWR9Ao0ILV72hmYJ3n+F2t6DRcyUAx4AiGHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331605; c=relaxed/simple;
	bh=p2OfzzG4G8KLwtyNQkO96oL7pLRWUkBiDbP6JOfz9PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRjLJ7gF2mwlAAPo++4yOoLpdMkS0swkbYkV5ZzOpiRpnz91EJd7W/l9v1o/E1R/s96qX+ged48lA/0Yn28eD8u3tl5TWr+VvXkvVZKVp5BcSlGyX6gEaz7BKrhxpmq026uh8gT7gmrB6kP2XxepXZ7o6ILSCluV4yks8uGP1k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOesOBMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhxjyY7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342XagF3989112
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Y6sw1A3WFhL+VkvUlWOCSa1
	jxqngojoEzA2TO7osGU=; b=LOesOBMDdO4ohdP6woHJWtkzkIUaGMVs3B/bbVs0
	RToNL52FSs3JAdaIGIxzXjFsBVYHJb47YVfFwkb0NqrSl+eEV4D8jdX9IpXm1Nqd
	Zyz9ok2rk+fAes5iBbnwRSIQTBuSLXD6vIFuvqqzjJlnEnJmkkydGXODJziN0ic3
	lgt0Z7qYToJXTR9rXorUa4cdibfc+4r76gX/Zpeh4dfbmXXgXJaHpzFvY6kOcbMz
	v/gD86vsD4Q6jCni3OhXGestmL6T4r2LVkm+ofIWI3a4JAuHg8ZG4x1a+bcd2TSY
	W0a9ceRIExC0+LuM5Qws1T+W9UHJ8PalqgooU8KILxgvMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfher9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:40:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso86385101cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331601; x=1775936401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y6sw1A3WFhL+VkvUlWOCSa1jxqngojoEzA2TO7osGU=;
        b=bhxjyY7C7e9JX4P328FRxL/QKuV/5sTyFAULL9+PuWczrS3ndDa7cCmJefZWSEs6C9
         bmtKRZeREEUM782PfjQq+sNKxOCzXBZa6S8UZVHGzDNZWZVEZxfcR4uU9+cHN8ZIekDy
         BDCqpUZY0RbhKPam09g6H8rr7FhHH0E/r8N6ZbonMZtqZpX0T7UPtKWD6t00qA1u3RMs
         iNgOaANKOpI+ibbNheJJX6OAov/7emcvUXCOOjFJbWsqHGo8kenQvyWwQhrKSjhI7+p5
         qhcN8/meWUnuLtYul3+1rpOni0g45HZw0JSaRJDjQAh/C1dajPnlC1tKAz6FywY6qqiQ
         SIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331601; x=1775936401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y6sw1A3WFhL+VkvUlWOCSa1jxqngojoEzA2TO7osGU=;
        b=IeVec/2ZBzn2lVykLt6iCSBnI3U+gkDFkWuXq8gmFFIKA0mOGG9y59xRc2xNaLWGW/
         D9zSwWh4w6iqtpsNfmN9djVGDfxHGdjXVJXEFK8Wrrjrcd0CoEqSR1ZJqztNpzsFYlAu
         vlSJb7/9IEUR6dYlCCSARefy2j6P+EMTZKmhMw0Z+qfCIxbEK3jDstfJGidHfxMZQkgs
         U3us9TB3fEq1h1cYJmByLFd5eF1BOGum72ajKdoYL2/oYqxavo7yKrNmL02GSW40MJCF
         WKYHv7G2rOfUlb66mCEYN1Qrzks0j2VhFt9zVUXvVCqTq4lfjF5TfkL58xBsgK1omk6o
         1+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX9bhJPdNjC1SISax4sY/m2GbCLCsxCg/b7dHteAxXVxLiHXnP+UL/CxApWYTKT2PRW8G/a5zvfipG4ApDA@vger.kernel.org
X-Gm-Message-State: AOJu0YwEz65OXUIUgl3cU00jC9bdOri6T0JZAdXuQVBvcCL1t4E63nV4
	NJd8FP+YvTHGEW8mObDJ1YsVxCQS0vQriPD49qov/xZptz1PAvi+RPOkSjDmcqOhJAxhL2Vb8LF
	yQ0uGVSZaHNwbbMSy2KB92J4cxCyF7ZC9bxe5E5femP1hah41wHp8QP9lpxGabjJIM5ge
X-Gm-Gg: AeBDiet8xmSpbmajySu6uoDFtxd0Vb3zUG/Lp+mtOzY7w8mOStGAuC5GI0DDvHYMMqR
	f2IAaBf+UravytzAR8y0/hktkaEHyy18rrqWl09c1nv34yVsZPXBnc9ah935jVs2UJqBGc5p0Rr
	5aM4hdpju+W4w1aXwyhmC8Mu3AqoLF+VA8tyeF0+azuLtLDXWvT0lR2cdjRjCSApbKUeLDMjUNT
	9aOH08uH4HpmBO4BmOTo2X/Fk3L3AO07Xzs2afNrKqbm8w7TSIqZNQlYQTqLYjpN+Kv0SKm3y/s
	D7/riceBtT0FBS7fq3fkQS1/cgPDfHjHwJM5gjoe8cH0TxSQbRVUGMTZxWG40eRsYhdLk8qlaWS
	RGYwx+JGiOvsB/44+NRPrhGaml/4p8PkD9NFN7zunw/uufNWfT/LuJT/8EBadrxPPKszh/GvHaO
	E4qzgvv28ySrk3jFDtWRbbw7eNPm8ws3hwVZ4=
X-Received: by 2002:a05:622a:17c6:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50d628b8b00mr126201041cf.27.1775331600961;
        Sat, 04 Apr 2026 12:40:00 -0700 (PDT)
X-Received: by 2002:a05:622a:17c6:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50d628b8b00mr126200751cf.27.1775331600525;
        Sat, 04 Apr 2026 12:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd31afsm2273992e87.71.2026.04.04.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:39:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warning
Message-ID: <ydu3ammavu4phhd2x4vayivgeelgmbrmm3dqz7elvs2m655lm3@fb64yvkr5rz4>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-1-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-1-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfX3hPQ4/ixy1Ai
 psDI0HKCk/g7pMNI8/U3NBZF/fnqWpA1Mri29jJ9oIJhRBrM3TpWfGlRuzil5neG9ehtmonV4s2
 B+aJ1jCzzynW8CLCdW/ulhSs35vKfjQdysu5rT4ajoFQoMiZwS6mW6onnsSrIdcwA8PdHBuHK8k
 T50q0dO+48D3jsMu3emk7LYA8opCZMTZWYYMfm1fY+92fDgYJ2wfiFHg9rAlQ6huM8b68iW8YJ+
 vEYF1w62DcfhzU2HMYDQtud1YnyfhhjtcNkTWghCZfD3AEhaylnbhmUZ/AVdZ8fzeOvj3CYtjci
 hkW/Wwxg4FxuEjb7RlH1BpsBiFMaIwcp4kZhmcdTsSEo2ge9YucXdEVr9PKVn6aJZbEPcuX+Bqm
 rETnjIY+5kPgJU+PjiHWxbF13JemXp11oLRcA17G6xHtKpjtiU6Y5hYkHvuWqTmM9RGa0t6iyOq
 D31VXcK0F0HHMffkbWg==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d16911 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XHkm8BA-63ghdt9qD3EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Mi_dHGVm8y_tqUHfc6zuFCarvfHXKcGO
X-Proofpoint-GUID: Mi_dHGVm8y_tqUHfc6zuFCarvfHXKcGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187
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
	TAGGED_FROM(0.00)[bounces-101796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.0.0.0:email,a2f8800:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D398239C470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 11:51:00AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of USB node in Qualcomm Glymur SoC DTSI to fix
> W=1 DTC warning:
> 
>   glymur.dtsi:4027.23-4093.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

