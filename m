Return-Path: <linux-arm-msm+bounces-96251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLOfIIG7rmmxIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:22:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE5238B80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58B7230AC241
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4890B3A785A;
	Mon,  9 Mar 2026 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM8Vm27w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaIhA9b0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7943A4F2C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058190; cv=none; b=I3YJzQYzJP6QsthdJh0mcgZZkGtTvdVCDGwoydb4pDhme2uAbHqwsX5I5rb+CZ2CJq0c7zzGocG0TkAmR8dC8owso+qdc3XeL5fIndwhEiGxsKlFn0qxmatVV+lN4IEsCm1OLT61W5XXMimoEyRfYtlWsK3aHG/k53x5+bI97SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058190; c=relaxed/simple;
	bh=JwOxq0pFoxiQTlNl0toNq+EGO6No5r7lL6YqkNe8BeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3jwno0c8Ah0z28icCD1UMD9KK5O/lXZoe/beuGDGFl2h8A0oVXGpLdyhGp517KLsPW0kHyIzip7hAfJZxGKUoXxv5IaJO5dxbjFD8btUaYbFOABBzIxt9HT9Gv2PT6xRvnWtNGY6kBln6mqa6lqwskhhtEChwnYc8Oxn4P5cCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM8Vm27w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaIhA9b0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AC7jK1128815
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FHnNc+U6HKMwPEIKj5LiXghp
	YCkex9c2mFBJTAIbIok=; b=bM8Vm27wx2lWU4bhbbatg6JSoJhpQLc6H+CSYc9y
	27aqvZPe6zF7u7boJzrXzfEc3hoDuiIeH1RZ9bSpePdH6LT5u2cMsIiFeinMbOi1
	sqrnkl7pvqE7NKm998LtMuvtZ8Khf+0H3irnwr5Fwkd8eg7JdKvW3xApCVCF9sX2
	RfgPmWWtd7619EaXqDCJhTYR4BEVzu40b+fhzyyMLNYy95CiBg/mw6aKuH28JRgo
	XzDnKI1TXs0GM9702uYWg5kUyMNy3XYD+3AZwhUFa1S8eAWVxKKUg5ppBr17F2jL
	fu6JYnB03QDpd73gJaXzBcqPM1M/nJ4PtM72x/GsPHsXAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8d8c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:09:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81ce6fdcso1360144985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058187; x=1773662987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FHnNc+U6HKMwPEIKj5LiXghpYCkex9c2mFBJTAIbIok=;
        b=OaIhA9b0iMIsVl3v6v3wVoq6vMrvkMVClwAcvun/e+N6WJtRRX5oFGCJ6Oo2ud6UXV
         yi4ELASmebz6wxzJf+yWuk8Fys8EgSE1SCcJEsKEdjSOvUfDfBxQo/mBgeNRiWghMYYV
         aVsdG6ocU0EWq6SB5Uuh+4RnWuaEt3CUMeD3Aqv19u5udlAQUtbNKxtjFJnkhBmdPy6W
         2no9+rPDPBT/tRh6pPROgr8EcruumANcg/g/WPNHYTIeWDJVP5HZkcBw2kriOc+n5DDI
         MibUPCnDq0Pp7XDZQV+UCD+e7OH6E4bxXncaSh3FgI6Xq8c8qhprMVwcojqdq8KQMAhQ
         7JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058187; x=1773662987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHnNc+U6HKMwPEIKj5LiXghpYCkex9c2mFBJTAIbIok=;
        b=LzDMJNp6K7oz8JFRALRLhWzlofL1IXPYWoalhOwzG1/aROj63zY/uypN1f6Wit2JW5
         GAFOHS2KN2U/ivOARNGJipgchPAxi2gWcyDJnEcE2TlBKOHXRYg1nJQUTzZVURKnM+5S
         XJKqwbC5acPiTgdQLLlxUFtdfhLHbn9gW7ooErIM4iOs9gAhz8CIoSdGuMMrIAIVkqNa
         eaxAvA5Nt5ga1HUGPbi3Q/+zMFWhvXKxLYCpLbJCvYpkqQlSopx5cx6KuGUEMTXk+KFX
         WINWTPUcARTBKvY+otxoqS9JNPNFqu97Sai559AsdWo6Yv25xmWAD0q6gCVTZIusA8Bj
         8JdA==
X-Forwarded-Encrypted: i=1; AJvYcCUI9obiG4rV0rpJFFNItC4DEeEq3tZjGTNAZ2FoSQh2d1LRKi1Qh5dMn+S+mux4dV9H+x8HU/6HBZmMZ1jL@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0hQN7ALo1j5+G4xNlFtqc1jWV+6iR9mEOg1EsR/9CRTggFCD
	miLEKswC02fckfvbbgSwP8QzslD1N5wWQg54G3dQLFonXRKy5S+ujYG0e5pszGxjkn6vnWrgHJT
	/d6RXfQGZ4lsncZ/spY6y8/aM4JW+oXItZL2+ybTDfjFK3JY2N+gUtMSjQ7hF3nq+hNWu
X-Gm-Gg: ATEYQzxCIEH+6m1G95wQq7isHqYggzC3iA0v34ZLLg2owaa2YtRmOh0/p8AidGIML4M
	ZgvPHskx8BnjA5vqk3yt7Q6Iu3fxFqvgfwdI7VsqBmRPwkzYiLvaI3YzvFrjlewSqf8JOdPQX2m
	SXiY0b50HWPXfoEiZTTU4gQ8gDYHJseezyqts/fa/TTbGpP/vJzm+k7bpNc/+lv8IhoX3Gf/q4p
	7Xsf5Fq5vE8CeuzP5RZc6PykqDV1vMKzuTwcDQ1t/vPfNsUo6rzcvBhjYFqw1TQETVnHUKoaloo
	a7IhsAr3nVr0GsDz+5y+gYJVUv20NBPgXqx7qvW/aBppVLlw0JszTsObwZvz4Y9+B5gjfnCQbJ0
	zVWL4x2tpTDBmsliNybJvqC9PzCaYUflu9A2T
X-Received: by 2002:a05:620a:4093:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cd6d4b4efamr1372445685a.38.1773058187259;
        Mon, 09 Mar 2026 05:09:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4093:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cd6d4b4efamr1372437785a.38.1773058186689;
        Mon, 09 Mar 2026 05:09:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d840sm28998040f8f.8.2026.03.09.05.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:09:45 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:09:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Tie up the CX power domain
 to GCC
Message-ID: <zvje6upzpskxzzq7f22oastrfw5jkbdyzwwexsvppvmrlgxhke@sp7g6hbn3l6v>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
 <fa8ff125-8680-44c1-b516-66d06eda7b91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa8ff125-8680-44c1-b516-66d06eda7b91@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BLsJr5-W_sDcNKorqeqr-aL-UFzixd5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfX+KuLyZhB1wBB
 Ap9xp56NzG999DS7UKob28pDw0eihzjLq53jgr0TAcZv1e/ufSckEjBQt2jWictf18S2Dc9vAty
 ukXHURuNRgLJAa3DhxjzOOQLWJ+gUfMdCM4tAv65i1VlCStTvn/EJsVsqFRfbZxRDx4srDW8D6f
 D/C9yimlpCXcHHvW9GiTVsAXLdhQrFlTrRN+tsjoUN1N4UfaUoVfY+Ursb3kGvZX7xRoxXs9Ndx
 TXdDdc4J6dDKrfbfp1esS/JVAPec8lt0DT69IQPWzC6a9ePvRtuy3tiyPgLbA7s3tbHCo6wuZAE
 VAAvyu53Cu0uUqm/UMimHp2TCLdn4sYCm0SEsjVuvuB97yvcKCyUn42MkF1BwUsjW0G0Q4DKN3C
 916OtxDIao3KPJNjvOYfTbfZJ4B9cuCE8NKpB55Nh7vP1cwpySVHzL10aDhyW97uJ5V6g0Jd4x3
 AEM/BLf4FH5cFzxSCbw==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aeb88b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_0VSbVN14Kq7ih5JQgEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BLsJr5-W_sDcNKorqeqr-aL-UFzixd5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090111
X-Rspamd-Queue-Id: 7FAE5238B80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96251-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-09 12:17:18, Konrad Dybcio wrote:
> On 3/9/26 11:06 AM, Abel Vesa wrote:
> > It has been concluded off-list that the Global Clock Controller needs to
> > scale the RPMh CX power domain, otherwise some of the subsystems might
> > crash or be unstable. So adding the RPMh CX power domain to the clock
> > controller which will result in all GDSCs being parented by CX. This way,
> > the vote from the consumers of each GDSC will trickle all the way to CX.
> > 
> > So add the power domain and Make sure the required OPP is nominal.
> > 
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index e269cec7942c..2d1ffbf53730 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -764,6 +764,8 @@ gcc: clock-controller@100000 {
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			required-opps = <&rpmhpd_opp_nom>;
> 
> Let's not keep the system at close-to-full power all the time.
> Please drop required-opps.

Did in v2.

Thanks for reviewing.

