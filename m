Return-Path: <linux-arm-msm+bounces-97819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBu+Crxtt2l+RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:41:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C703529431C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1279F301174A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658F730ACE3;
	Mon, 16 Mar 2026 02:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMy8wOos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI3q7bKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A127FD76
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628838; cv=none; b=kHkeMAiOFggQF8dOfWsbl40hKdRI8qNlGiq1smh7opB25KKZMara6W76WcybmPClAhrauSiqhYcig9klNPvqv7ZjlmkUp1AZHclPTgq3hVMkPnQj56u3rDzAH5+vE6sdWUgEBEfVh1xYsthjdDiCOfMVWY3k8HE9ut4xgJe8jJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628838; c=relaxed/simple;
	bh=vPO92Ia/yLV+3oDlLavvw7vih1R9AqXGrqeb7MQfF2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVaysSi5M1LFyyju4UaMig6kxFwLxIN7Yh15RqULTz0xxX18oY6w/6U8Er89mSbpG6Dp/wJRaZlyq/AXblm5D60+mFyUyzFq78gzQameoMOSGbdRwPIrgA4WfBs2PiDX4TV5qUTC+TkV2fzmhc9qvyY+87Z/P6lscDQhw2LTCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMy8wOos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI3q7bKO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FKakwK1482054
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cooflrjk5WASfitMN7XwdGXE
	Z+8BtZFRRkGUiUr4HJ8=; b=TMy8wOoskUcY/01XjbFPE7gI3zE4pCn0igJcZlIs
	WtkKVbNYYdJQ4mppdWiNC4hhg8+mqmE0sDqOmQCp8H42t0hZ/WNEQh4amgxbVv5l
	sQ8rT2kbXUavwvEpIdfLYHtIjqfKkFXA89FTHQIjkHaD193azRUR4Wwcb6DLMA96
	qdlfEFbaO8MZ9H2IpG1K8HRSkcGchpvpDxQXJ1/vGvm/pK84RuWIJw5fjYRXdTJ2
	cPvb75KNjz8lWN1b4XZyCqn41sXZ61jKO85AAWnHMGwOeFW+wJYIJ9lufkOvSRck
	+dlb+vL7dVl5DC0nNSwmwEpireoWO0MDiddy+SmZxeFCDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xkw64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:40:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso3295405985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773628835; x=1774233635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=KI3q7bKOuBoLnbC40I2/3ufloUGkWp6qEAAbAZx6RfyFl4p/krX6fujmuaU5v0/H0B
         R5GZbnRlgwZLoNdcGhvk2TV5K9TTW+0l+YE+vze13O0dqAou4ISOKv+q8TEg6H7wUf1g
         x1IO34i4g4a6WvtaGIGVNcoCPklZLLLil/TnopeZG/+reL1kngRdAfl12RCp8yICD3G6
         dlxNmWGpOxnX1fo1e9t32jWAiSIaUfJ/dP47SYOsZXXbBeotNSoieZTkfOM4TjiYoHap
         xaql/LQF9R703r74tBnfO0qa+4M5/lIzLdErh3FM+xVPDWfZWsx0Drb7k7bd6mWertqK
         yxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628835; x=1774233635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=sgY9uvVwZNEWz/3Cx43vCVsAu1utIsV0NJ8QL0Kbtr9fbLO/RzY9JNH/fCsTaDXAri
         hpJGF2dBJ3ykZ8LGFO38bTNOyI/mrYO7jdgxhtx2pilwvDnr1+AfOmL9CcsYc3Bzesy7
         krVdPaEhdTlFKLy2wb5gTgEFxTwcSi+/YuRYdro4XIAvpEX60GFusvNnjlwjlpLm+mk5
         Qm0HORNbL6xzWceFEzf6jKFo0YVfvje/82iFYfE3IbXThrSPYafw/o0aeSMmnKjAP55t
         H6iw9wIWOIwADsv3KQOR+U2WbngWSuMszTsZVkqhFpwWszdhs9DWvPSAqOklEXyfF1lt
         li1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7yyZ7cQcsAClgzV7LiPJOcRnl7y67A9TFS9idacBLTgUg8R6oqaIdFNnjs0Rkn3POwSlAro73NKDyai9g@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvPiBWYcHnwu8T2dw8AtEU2eBIAJ51U3dmWV86bx0sjGtUn7+
	8jEc1bhOpNdChZEsse6xV2iU82LuFPzHOlm6BvntLDUJFO8nEH4Gz6QuC67Ps2EajnUK64kWk76
	4ixt/glFKrUgsPc6iw9hfuwWBFvYqwwpvqDpUP7P3bQHRyOvxPPYJeyWZXm0KphKr03Xi
X-Gm-Gg: ATEYQzyS+bifBQkA8fQ9rEVFZuJq143m/tuiXYUz6BN2PYItfJFKFib8Q5TYZluN0gv
	RPsqIMMskHi5kZBQuoeZzEY8GdJZAmmYYs3MiSfGE76gVUDas1bvIW65DzNqYMrJ/Ppbi2xREaI
	NkG5GKkG8X6m0abyNxKeaFJpXmz5x+aR7eEoA2SRdsO2bSrVH0bHGCovRD3C6mcVR9IXmpjQj2h
	tNzBboEcGT9yskjXMxTXcuC1vqdDmI30LJc1fyd5Jj4lzkLo+si/xv8vYw2Zxm/J0mWeaq9kdmj
	U32lVitmzyAF81Xa9vS8drr8CCZVoXkZSQOMo6ghjDXjm7KbHSfsg2t0s3N/2VdDfPljIgLQhYo
	Z1dnRXpYwEkw8S3EFMSh2vKsDurixHnEKVGCYSzZAqtHzbqOLXpwXRUn6xEHWf903elPOIbnoS5
	pEeIXGX0ZTn11ocphUQ88Tmq5YjpOOJX5Uv6o=
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476165885a.43.1773628835391;
        Sun, 15 Mar 2026 19:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476163585a.43.1773628834787;
        Sun, 15 Mar 2026 19:40:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366676sm3137356e87.71.2026.03.15.19.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:40:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <jfaaykvuueentwpyq6c7rzu7uza7daz5tyf54zobximpflcude@6uhpcdl3emjm>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMCBTYWx0ZWRfX2UGtFwuIy0wC
 XejxJG+g5qg1FE1h0/P7HqhHnq0Eu1rOBEHZlsgUosy5i6MTegRXcRxpziF90Yd8HpYrUA1IOPf
 ysjlnBCKuHpzRBY/u9XdBtp31ehyaznDUM+HJmmLGLX1+9vryucx/x/flmkaIDHvhhPdwRacYmD
 cMD0lp0P8f/UpNZrEyV8D8A/Us6c1q9ns6pySaFqQlzSa46Ma7dsvoOMDC8Dll+MogLAandRTJ+
 qdDrOdjTSdbPR0Kfawy/eCbk0tYG0GrdTGg8dn1DY0v81Kx+AUgYKW7Hea0fL+wFa641W0C1UJy
 T9MyIfDs4X0S95b/ASUv1Qj+BgrqynKc08K0cuAzZ76p78Q+CdB2Z2I7k52OdJ7E8c/4TBotTve
 au1+MxTdupRFso5PGLyAnLf6vHqtTHRlrmzzUIhCv8KRhHWsJk0W9wfagC40Vkck1IcTR2M1JGW
 91fwc3h5vvcVahCJo9g==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b76da4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=fU1sBuitqkfhUO8brV4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QmWZ-UPXg5yUoap0h3b_p0nMa4AG-FRg
X-Proofpoint-GUID: QmWZ-UPXg5yUoap0h3b_p0nMa4AG-FRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97819-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C703529431C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:07:43AM +0200, Vladimir Zapolskiy wrote:
> On 3/16/26 03:02, Bryan O'Donoghue wrote:
> > Add optional PHY handle definitions. This will allow for supporting both
> > legacy PHY definitions as well as supporting the optional new handle based
> > approach.
> > 
> > Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> > its own individual rails. The old binding is still valid but with
> > individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> The new proposed CSIPHY device tree nodes should be outside of CAMSS
> device tree node.

Why?

> 
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
> >   1 file changed, 31 insertions(+), 2 deletions(-)
> > 
-- 
With best wishes
Dmitry

