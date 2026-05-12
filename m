Return-Path: <linux-arm-msm+bounces-107019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEmvGfOBAmpDtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:27:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B85725183DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEAF43015E0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 01:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E5C26A1C4;
	Tue, 12 May 2026 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPYVHwrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdLGf+61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388172618
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549068; cv=none; b=YvhOKh8VjFeZPA+6ZfRvngt5gZyOzNoHdR1FMls8a+H/wOBnhQMeh/OXr6NH8zoceejYfzkQPNHUI6u7sQYrNPCRzGvgq2ZifBJWW9F+9AnIgIb8hrYDyCJUqqQSbXcHqB4pCcmHrxiAtDNiN/h15NDhFdsxDiXwC/ZMDk2vTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549068; c=relaxed/simple;
	bh=/HY/3EXO1dot9m4fKKPMYAyghvHdtEvWg2sxr+fL9BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ9S9btC8DWCceqbIuWQ0CLkhmU+6iQtUbHdyR840QjTlQ16esZgybA9ncfcy7in5VmrHnqnIMnFyy14Q3+lmJQ/Dh7uxm6CA1NDohxx4pLAQTtS6rfY+wrcy54YEhZ3FWyZDO98MqgMpw7jq+a6QXXa11iw/pfX+QiNKKBu0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPYVHwrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdLGf+61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6kPY2574040
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UX9uGTJZqignWW15iG2/KEx2
	xOEStYHCdjhj8vGHywU=; b=BPYVHwrlYnVFlCqJwzmueX7H/uaSmd4KkjKJLVYO
	2lHOYlOu9e49t7eXy87BeHns8LxRmPGE6e+RUSJJ3Nq3cJOJvfAVGj+aEddqppjh
	v+2kIspTg/i9GYLQVrUxf33kUs8jMu0IRx6NPFla/wW01yl1u9etbIKNXfb78xbv
	2PAbKeT10q6apSSRbuRVE1hstX2dUuV61HPS3x0k78xn9XWvt4BdNb+RlBv3NL3d
	3D+396MHZZ9PvqcXIZSKqb5WwwnAkoMQC1djiCmzVuzqi32l9uE+wMniEh8EQlDk
	1iVSyCboA/XUtMMBsyg+0V3d4CUVDnDlc+f3M0lOjROVgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28w41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:24:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef37c3f773so6014520eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778549066; x=1779153866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UX9uGTJZqignWW15iG2/KEx2xOEStYHCdjhj8vGHywU=;
        b=KdLGf+61XxTp/6yFURdvD+gLgVH7UzrBGfO0xI5RElYGHAv+1tgNs/xujm73ZR7U+P
         fmATKcSPiPva5UphFAt7mkSsv0qkHBnfPz3rWL/6DrVfVtidQIadUXDBoNgPepw+mWUM
         NMm5hJ/1Fe7oWpY2eVvWvY7w5Py66m3r1X3lnS8PX1F1iDB/5VijGBx6ifCgIpd74nJt
         UW1j0jhx35F6Rg2STNUs+S8nzifA3HkUyRkSVvJ/kJD9nyTjBdKPVYq8Gw92Vbxho4+M
         ffABom6DpC05eNBHC2tq2XW1j5L5RaC3tfM/GhyD47InGLY3/u12g2J1I9V6+AM1WHaF
         C1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549066; x=1779153866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UX9uGTJZqignWW15iG2/KEx2xOEStYHCdjhj8vGHywU=;
        b=YcoukQwWl5JQnni008dxa7Ich/bF2/fFviZ2Su94zToW3JqZ8x7ZL7IV9iEZRrcXYm
         af3ox1ay72gMmwa01ai7f02MadIN1pX7rtnYZOninq3OHBaE2SlX1oVASEIxAa/rqpF7
         KkPNvhQ/cpHOnOgV3yPTgo5zB9rVN0qz2NE8FKdW0aNh9lfVvMQvxhR3x/2OLybBAsDy
         wErcui3Nmgu+DGWYeaw5NQJ1I74qXNqTzXP6IBhHpr2gIdwYfgmwLBJjXNngs30HJz0q
         hYuM8SsCLr5irLzBrpo4Wemdy4QH0XMPuP2q4bvbltxTtnSLfPTy3z5H/gbKOv1t3CWP
         QxHQ==
X-Forwarded-Encrypted: i=1; AFNElJ++s+PaYIi/78zTfkJWRWnNGnRGFGE0vxgUvGJiBzl9HJn9Scz40wzBez0HqBeNJt8EHOHrbxq7f1R/uX5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzoxyZoxFIa8aSkaJJzBZx3QNjs7J1gENwiOnkC3LU4D6Td89Tv
	ha1J7DdNvvuE3NWy7HkxX3Ywy/HK+B0WCQ27hlPSejbgvwfIERhbb5igwoEdOvxMOAmAFXZijtV
	2s9emb5Rrxz+bK7NO37J1g0qTjNz+q6J+N2fjdACzI3eqS04CbrYvqGl8OyTgeCJQDIis
X-Gm-Gg: Acq92OGwYhBHcXs8lokz26hO30wMk7W2rHiqh/d2LKA6Tj4jL3zesYtCdRmEGw+J+Se
	c5P+RIgjTpzO8OclN4IDNS0bZ3+nsvq1/fegbMo8Hs2ZNn2PPaHKKlPNLJCBoGhAUveOmMrDDVy
	VlfgOFznkaW3+Ew/Xx9MR6b9Uq9iQL9gz77f6UY2dg0le/NpU5LgucaAzsqeQmJg2CmgvoG8t9l
	BENSuK4RNmGPHRkA2J7UZsKItTNthu4a1cEYk+bPab4KT5Vta31NVOXtSDnGbQRQq/lNbaOSSi0
	CpSbrFzUuAuFvNhhjAOM9hE6Wj3N/SpKzCSTLii8k0VPSY2q0FEDw+BEFbYXPlE4D59oowD2EmI
	5WRqaJtv/GhDrT+sTNMxFt6xEoQobG0G+tyeDevQGzw1dy5gmwFVY3qXAl8rIS7hW
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr482917eec.13.1778549065871;
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr482904eec.13.1778549065320;
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm19204916eec.21.2026.05.11.18.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
Date: Tue, 12 May 2026 09:24:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agJ-Qc71PloUM1pI@baldur>
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02814a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xjU7Otet6xYI0sZ-r80A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: iSfpWsah3B7vaZfslBZF8EcsH9tDgKQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxMCBTYWx0ZWRfX2SzlhEtJItBJ
 +uZFvu8JLiP9PGPRWhhLxTWi/+JCQP83GnezGRJmw2c3npzDkmlLVO9Fl33RkJZ+oy2AFnnGOGr
 12JFi9PyHX889367txdw5sejo3nuxPUuYpwWxnY1YeSHQC9lWOJZxR+SjP+A22NxxRa3ztSGdhC
 M4aZfgS9FH6BCFvwubyVPJCO4Jsx7XooMRBLeZEJI9XGYqEkA+wGO5/2FCF9Ssoubnjyh8t74LR
 jlr9UA/SL/9xoVK6f37TIiYxNcjPzGEIp9b41kQ1IyCwCUw6dndpeHqLc7PMaAAT6cxwfBkmZXE
 tevqtIPHZ3OrDLz1lhZKr/strzdTRwG7Z8rxFfBZ7+/4UmwM+pkwXTCNcsVsQP7DOjtgp6A2w52
 C+j4DGl63Jv0MhmssWyFoxGoqs4IwI874G5yqoLGIuhbkH4AiATcdmxrH8nwYHNokyVV7MV/RY5
 /eQN1bHbO7NExV/WLfg==
X-Proofpoint-ORIG-GUID: iSfpWsah3B7vaZfslBZF8EcsH9tDgKQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120010
X-Rspamd-Queue-Id: B85725183DB
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107019-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > ...
> > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> [..]
> > > >> +			compatible = "qcom,oryon-1-5";
> > > > 
> > > > I asked you to send this binding WITH the user, because they go via
> > > > the same tree. I see the user, but no binding for it in the patchset.
> > > 
> > > And few others like SCM are also missing. I am talking about this many
> > > times already, to multiple vendors, and I am still surprised why people
> > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > my work, but if you ever wonder why your patches are not applied for
> > > longer time, that could be one of the reasons.
> > 
> > Yes, I should have sent all those bindings targeting Bjorn as part of
> > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > change is one of them, as I'm sending it to Rob.
> > 
> 
> Not sure if you have settled this by now, but I can merge such binding
> change together with the dts change.

Thank you for the offering, Bjorn!

I will include it into dts series if Rob hasn't picked it up when v2
of dts is ready for posting.

Shawn

