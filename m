Return-Path: <linux-arm-msm+bounces-110569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGXAOPtsHWphagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:28:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93661E541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE236301111F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EFC277C88;
	Mon,  1 Jun 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGfffAwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuM9Nhmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E953A1CF3
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313053; cv=none; b=b85mxoy+uX/nAwI2cKHog/HTWUfXupJi1PmwKeXuiwXDxcam54qqJ53AfYhVEllGXzV1JZV9q3FhAE2Vvi5FS+ViVA3F7JW7IJJcO2E6x+KCoaiDWfa9KS2VRphem0WwvuKadln0/UZ3tlyhXFU13bBv/sAdUaJZyY+AukoFv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313053; c=relaxed/simple;
	bh=qF0Ufo/CjIRzKBzBQQtd19XCtcP1aSRWrtVrk1k3Gg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z78p+IR5DjonW8RP4PF3G673bXgCUMS10hHb5V8RmotROEn2anwkxbh2Nhdz9PIF5MDP0Vne1ZjJ8TpGvNoBYg9qvkmSr7KMtk14DmbcQQalDriIM5XoNirDKs/voevWG1jJB/KE4gOeVpGYJR16o2R0BzLGwjMpnxpaYLTFawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGfffAwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuM9Nhmj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fl0L4066038
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ArCUJSu0p5Rr7kXoBPCR6AQJ
	dxQ3plRaRNA21LoO2vQ=; b=kGfffAweEuFI61ksMVOgeMQXVInhen1UNYG1849B
	gwrE6W77PzXJ55F0VIo/G6QE4UFr4VkNBqcNCgraI/1O9owetKwsDe+zvxq7xoQR
	JYDcjuMt1IauhlADNOZsoSQaXTCXxeXtFXSOXr4Yig5qYSbSkYDYlSiSl+IYoTrg
	jMrVGCQesGyfSSSgReb1/L0IAgdQvm2ohB2TTzFN5ulheYqsCVycPI5x19OlXZUJ
	5dN3mHud3khZdJe/Co/J2rlGF+fRWBWFwcVan5WhgZDEXoXgvhzRgN+zGj3ljH6k
	x9rhNv4aGp3tYB5iT8vrovY39fBM4dC0tMc5/RiBrRS8bQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swrnd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:24:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751c50552dso3570976137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313050; x=1780917850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArCUJSu0p5Rr7kXoBPCR6AQJdxQ3plRaRNA21LoO2vQ=;
        b=UuM9NhmjQwFH0QXyrNFau22D62X8VV6XPvsz0TbQXI444ON8Yb+JXzSemBat1rTFwV
         k3nDhRL0+dfSVirRraP8G4nh5o0z9VlGA2BhMSXGLatpkbFMR2XGoFIoFnr1EvOMdP/l
         +Jt+ZZSnWo1MsqL7uhFWByNFQGLfh+TC2jBLIq2c6hPELkItmYxN2/dDs83YTts1htQl
         /ZwwmekKx26Qv0ZkRK2HMVG/WXmYodAb7jZb37MBRJNiK979I+nOtr3kQPHMzf99EEyt
         JhxT8WSVpX0NdUtPW4PneWZP1jBrAoPRdd96+u8aGaHQoLpbuH3gbg2yXG8ug76aYcmt
         QJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313050; x=1780917850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArCUJSu0p5Rr7kXoBPCR6AQJdxQ3plRaRNA21LoO2vQ=;
        b=qGyWPepEIU9416DZYBCSWt1tHKAJhpNXa5v35N5ru+oNXqGYKhMrdrCASe3rVVee5j
         wJ5E1bBKEjO+E4FooIdpkTh7ULqCxf+Mz2Lrb2Kj49LI2C/HucvPICEO4rN850BmxVZN
         j6vVkldcjFy8OQvz9mwRefy0INYoh90r7kbJcOmgJMdsKbGOcsOXnBO9u1CnaUBt2LPf
         wm/M47Pj3fXa/y2VVNuHHzGVawPw4RI0+sorQX4bqTfsRb83vK/6DHeE2bQAx4+XmB9M
         gt18IJDNsRROOnvi59HTJ74KT9woPiuXiLaKnMtLUpvekr18UyvHtq7yVfoCxACQ4JXk
         V9DA==
X-Forwarded-Encrypted: i=1; AFNElJ+IQnOcl7NnYSztNZbiqXPSwAfDgtJbSze4d9E6g5+Suf4Cm9PI2DAAURqdPr19M0yZIpmyru9yDbca543z@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5dvyvvBn5uKiv30kyZ1U5wVyIXXVITKNBgsKdjaC+3sQldxn
	Eq7LTeXx8HXxvXyYfQO7tA5iuuXXiMDcHl2QjcqbSt1PYY0b8rVrbxsSkA5qCgwFzwpZkfzjLgU
	6vr6ZySSBxTvt314dEF6G5OMOxiK5HvCwZpQCHfQooA2esK/sW1e2kW/YCJv9gcTyjgnx
X-Gm-Gg: Acq92OF6DTLUOSQEIe9dngkr09i77O72zGfNiMRAac7lCLtXgAmC7+rq8dk7eUnCClf
	eWMeMXQ3dq9Z+U4FAQYVItfhoDjjPLORuTK9tpGtL2FPseVHuPRi9RLtoyjEx4Qwm9shnfgKA7I
	N9JZg2SjqyFRRkWE15f7Yq6BTpfSA9TsSFlQlclbSfaN11iREEW/bEB6SFumx8DvHhgsetAJZIv
	v5hUMpEXn95lM/RyelwK31S6e2O/BGssl8ru08PcG7/XsZaq8X7H5DxPT7RBlMLmrYEL3y/+2XR
	T1g4pvzmKP/kFPTdx8blQKACDEAbytFUXgUXveYWEwriHkSkuPf/HBIJtOvQbKQOnw4rShurbMd
	wBk8MxZpR+jo0yDtw3jOmjQaooxE5RFvVNC4+Jm+u6lulKX+t3TYXgggf5+HIBhNqyGO2hW13xn
	ht1TsUg9CRbRuVJMdeL31yMdKcl7viGg5bjV9rzLvZyA2Xgg==
X-Received: by 2002:a05:6102:5049:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6c6976d1327mr2867655137.24.1780313050078;
        Mon, 01 Jun 2026 04:24:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5049:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6c6976d1327mr2867647137.24.1780313049688;
        Mon, 01 Jun 2026 04:24:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa70b75865sm182056e87.18.2026.06.01.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:24:08 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
Message-ID: <5fdcnv3k7w2r5at3oun4eldgbmh2o25rmb234urksy72le7an5@ddl4aapbjexg>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
 <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1d6bda cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=YcgPmG4jwsFezTXk2NgA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: MnKjdjpW69pZRz8A8-9gB7G2-hjKOcbC
X-Proofpoint-ORIG-GUID: MnKjdjpW69pZRz8A8-9gB7G2-hjKOcbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNCBTYWx0ZWRfX42Lo26lnNSjv
 qDTsvPeqYoitY9keH9cy9Ip1FCqOgbywwzDxkNJhdKao2L2F9h2rWfVCsihvmDK0sIB0gIXRhjK
 Y+c3hoS2qjIcPwzw++0/l5t2LHMJJjrWUUeyP8nCn91VuABDllOoyOF6l4Q+rc5bZG1MuZHGvRJ
 5lS54zLRzLC5PK4rsGSDja1C/UFaH2YIsk6zuKJziZvm9c9mmCEqJWmrjo/FR8YOuUIvwcv2vRg
 A6gvXYI+6jl/4Vc5Ut8EPM9NLXe70JXazzBz9Bu5Is+DJP7vLNGmgEEWbdeKtgJuntCGP/55MR0
 MtswdKPrLNIwC1vTM1JAK+d+ev4u3OdQV3hyfUFUga3ogStX3XDzi7SlE///eRCirtWelUJkFaQ
 /wGbjtHjCTz3eCPE9IDTg5fAdMz0GBlzOzXVtpP0lQqX0W0qwdsbEJn7oflZJz1fV6MZ/mnOKdB
 tbXc57NIzCAvVuZ+iLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110569-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B93661E541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 04:07:38PM +0100, Bryan O'Donoghue wrote:
> On 29/05/2026 15:37, Vikram Sharma wrote:
> > +
> > +  vdd-csiphy-0p8-supply:
> > +    description:
> > +      Phandle to 0.8V regulator supply to CSI PHYs.
> > +
> > +  vdd-csiphy-1p2-supply:
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> > +
> 
> To be brutally honest, I'd rather see effort and buy-in from qcom engineers
> in converting to CSIPHY as a distinct sub-node.
> 
> Pushing patches to hit your own internal deadlines to the detriment of
> upstream quality is not OK.

Can we please get an update of the the CSI PHY series? I think they were
some time ago, they received some comments and there were no updates on them.

> 
> This binding should be predicated on separate CSIPHY nodes. I've
> published... three perhaps four versions of that patch to radio silence on
> your side.
> 
> ---
> bod

-- 
With best wishes
Dmitry

