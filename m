Return-Path: <linux-arm-msm+bounces-103962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNv4G1OJ52kU9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:27:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CEB43C006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81EEE300C5B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17153D810C;
	Tue, 21 Apr 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9da4ljZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vnbvudwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E063D88E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781288; cv=none; b=gCHp7qt/XQ02LS5pZdR34WTYpeDXwA6JrgjVQ86LiQRNFHlhs8AL9lOqWuTTfUWzV9UO/Kh+Lk8xGRvj1rvHvlnwWNeCp4uNyx4kIKNX+sEYmBipdF94SjxmgXSQWFAxqS+d+3JCJQkdAv9gbQUNWuuMbNZq0FH+CFogrP9o0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781288; c=relaxed/simple;
	bh=z8PzaU6bY7TH/c0wyyo//4ybwJ/DxeyN/fS1XeL04yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5cuPt/fsxQ6WabYvIEtqSg6wEpjfsxMMJaf578wN//iCzj02QUa4gxqotKT91gnxDg4ntPYiL7bc8r3emV9LhCvoN1F9C+m2xe/EI0+/lnOCoKGhdznPUzCpnHsjQ1TBTeczu65NA92oz1B4n4j/jhekprFXqLaOy2KZWs7k2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9da4ljZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vnbvudwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LDvF0x1127145
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s0NMdQ2DrLhseriLRz9nQIWn
	rOasVL8N+B6zKaatBKc=; b=k9da4ljZcjJ46lc4QS7K3H9LOjJpVdyFJEmYC9pv
	0mkHCbeGO6WHgJzjTcPDUTW9k030PkYa9xLk4f2csW7i4MhHIJjmCZaz6hO0joWR
	HXdg7166mtutIRt0D1KmmgudLt2AWgTJTDwJtV9D9tHtYdGHNEhVLbgQ8GgF5JLN
	QC3aTB2toQLIhOEtfjF1HMvRg0ITeNR3vbgwYijykRdlmkJJk2e+D0lj4umIXP9X
	BH/gMYQZxvfm5CXUmPVSAQkSvRVe9r2UQS9Veot0A7t4HO1OExE4yGRoPbyCfa4B
	ACDuVSjzPjLKLsSsfRIr/xp0geVOIXhzmKHmq1FZS9XB+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68ty3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:21:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so5662826eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776781284; x=1777386084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0NMdQ2DrLhseriLRz9nQIWnrOasVL8N+B6zKaatBKc=;
        b=VnbvudwqbVdmKarc81puB1sZ/YEKUauSeVbWSACL5pGdcGSLzD4q3hM+aWVuPEL1p5
         2zkYTGRYdP/ItUgsK5YubUnHX+2lBNC0Xo7tsTky2wAeYuqfTfDIgM++EbShvmZuv1fx
         yaJt4YOqPRrSCRrGe60YQzyHl5oQeXvyXuIIalMKwcYLabxDcG2HxkmvEbtJif8b962p
         EiFcPmkx9UkWsHsN89yp9GiS74yz71/16KKwx/YzCBcL0wOGyve4LgYAWRvAjALtFpS3
         pJiOL0VnZQTvRSRo5iNxtlupmGycirJN7ePfeAHWEz//0Y/57XA0WEDb88DvZ5xaWJAx
         2PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781284; x=1777386084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0NMdQ2DrLhseriLRz9nQIWnrOasVL8N+B6zKaatBKc=;
        b=nUGiUCkaKLsGZuzAKnonSzE2XymZ7y7WTporE/AxlWAtYPfN2AwcI+5WkFazPa3gFc
         DWD93yWaUPO3qrmWR1pPCsHkOjzJnqURBCeOKkwYUrYR/9o5OJdVMFRUzYsbTzAbCHd9
         Y3GZSBITcmjqBcd1itZXn7FV3ilvdIKsqycEGELvMb665jhjYAvL3xpqdL2DK849WevV
         Zi6j4lbl05jqWR5+TSAJS6rtH2qWhbfnDwaK7a7MSx/63fPLF8POQqGfvHzn6bEkL6n2
         Iw6oTYTfMYlvude7wNuYsXqECumplnvJrWf9kMO6tHyU4xYSXY3hW7tH0tFrqXWPNn4U
         HnuA==
X-Forwarded-Encrypted: i=1; AFNElJ9u358JLUpqjqYL3NuZgB6Wa1Pdc8AszQd4RoGDkBv9fZuGax0mNyVp/CYI+Xv38iVEQP8LMpHAsqPRKzhs@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEI0NRga5mMpRI73PGqy4VG0bIVfY2UgeNn3lXB4kwsz1rZcO
	imWOSWlFG7WroQ71R/MFl+xt1PdzYa9bXkQ37QcSyUKXBoQwSN9Vbq2X8/6puzy8JXXQ2q1iHKN
	dw1B+EZDj4TcAY/60abxxkCWwpRw/86n6GUoAc/f+ToR/KS2jXMDikcbxWakQWr6yNXfk
X-Gm-Gg: AeBDies+TMzFAl3sg6kBNCL6Xvl9RuFfMf2h3ze/gP+EjHfMLbuh/lkCBRmOedbxHeH
	ecl3sXWBFpoztyNA6ayNkSJ34/KkTfj85DyQyB2qDpVhC0yDyhZipOLQLxw4K0e1dU9gnX5TQep
	arwVBIi6Z53dqx+auZjT6e/XJAEcfYvKxhBRUW0wVxDrGER8bG/sLUshqS1WDSw6fGhPcqSoVcg
	ZfSH+6Y1RB/3BcK8983lVX+1L/tazIQtCVJnCZmRMf1aiHJ7F66F+b4h258ZHA+xA28S9OmdLfp
	wZqfLb9SB4Vaym2sO1kMPQpneGg62bYxdfjOadg4b8SoFhcVwt8fXxKjcfEQ5xbmoEN7rntv5Tw
	0vIOZraNEQAZOjpx8nWUdkdsUO7JDu0yOp6ZfLwG8wRpsBRDolBO16jOkV4pYZPI6JjDRPXIGHc
	s=
X-Received: by 2002:a05:693c:2b12:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2e478a3370fmr8908010eec.23.1776781284076;
        Tue, 21 Apr 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a05:693c:2b12:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2e478a3370fmr8907987eec.23.1776781283528;
        Tue, 21 Apr 2026 07:21:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm18953991eec.21.2026.04.21.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:21:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:21:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord
 SA8797P
Message-ID: <aeeH3SzQif2c1pM-@QCOM-aGQu4IUr3Y>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
 <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
 <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: E7S9Q4CZVUo8gBYhtSomvR89y4DsCFCR
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e787e5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UVN0y-JDDWVLCD1R_84A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0MyBTYWx0ZWRfXycXVrH62jznC
 Jj6vOEIjAwJ4D8b8AtcNDMD4eZ0alv9i4VUtNHr/pqOadT45h0bzxZqKAmdzH2gBfZKfWVjhGUJ
 PUcOGrPD03p02qs1OWloldv6IxcMr9/e3ppp9DeS7HDxp1qSZkkpO7vDiPFilLBxh8qhSYpxYem
 Q8VQfPcg53TTufVNoaBNBAt84eEb0Lqt+VtcQb3JR6XjutXGmQiXKSnxeOqQedHAYEJOXf5W9dG
 WxztaLKAartZ5diTndIrsmqbR5qdr/sHsB1vEvkQK6HhIjL7hOz1iLvGLYd8gp63Z7MEypCW27m
 aQQlM3XywREnzWpbWJ7mLQJFWGSokv+2h0JSTnKlMUb4YE9jBjBgtDCnEGy5CPwR3qopPsEOn0f
 xTT0CtrpzBXwkRIsJHOcIQivCr1Gbl6NiUI43WZ0PLXyrzcYMCWTn7CGxPbkCENky0Ro9Hpnwzn
 VezY06OGKR0q4exo1zQ==
X-Proofpoint-GUID: E7S9Q4CZVUo8gBYhtSomvR89y4DsCFCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210143
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103962-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19CEB43C006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:19:39PM +0800, Jingyi Wang wrote:
> 
> 
> On 4/21/2026 12:02 PM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Nord is a SoC family from Qualcomm designed as the next generation of
> > Lemans series.  SA8797P is the automotive variant of Nord, where
> 
> Nitpick: extra space. Ditto for patch2

Hi Jingyi,

Thanks for looking at the patches!

I have been doing "double space" (after a period/sentence) for decades.
I do not want to start a debate on this, so will start changing my typing
habit. But I'm not going to send a new version just for this. Hope that's
okay for you.

Shawn

