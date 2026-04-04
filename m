Return-Path: <linux-arm-msm+bounces-101797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEB2BkVp0Wk+JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:40:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6339C478
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A23300A8FA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68572342146;
	Sat,  4 Apr 2026 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyoWOpPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP33qkPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309661D88D7
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331649; cv=none; b=Kxk62WYsaIt0HLjXQgNAcGQ3GFl5scrtJL5bsKnfI3gbNax3RkJoJ9YmTV0QdASh0+aE94ERjGJzaoQtWhRv6kNyPJU6KYdoW5MGjWmDJAufJ8QfWI7G2Y4qB8SmEQFU2u91i5Nw7r/nMENIcSvXYKeypPxL7Qa/F67AXUG57PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331649; c=relaxed/simple;
	bh=XL3RUXAze7rDI++61/KSU79UhwsGdCSyd1MURMoHOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/6NE/lhXzPI4ODirVlG6fNfgKVQJQImChZ3Bxis8ueIJh5n3UDRafrEt+VNhrku6+nrmlPBm/9qrmb+qQIFXHxkoDCNnFMSwmc5rDzykv652pNuzcYED6O/NIKrJMqf5jyUJy/ZDCntj8d7RDTKPJwC2k/MnlClzc94khUHT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyoWOpPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP33qkPV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jUnY2867027
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qrq8HRbFClCmcNR55C+dTrNw
	+/gWvKkKtrLHgMw4W4g=; b=kyoWOpPLLiG/GeG7FOfe+p1p/1aQx8u4YNEjp39K
	cswz2M21S+lDjPBG08X077BO8UUlO3/uqYE8gxMgYZ7GkwtZg/QhaXVkLOkuQNZY
	c3gfLnX6Z0xvoa0KG3LDRGbJNIkNL+gRvGGtm9ITWArJYTrZjuk0l2zmqIEt3j/Y
	RgLrbqNHu9sTQ1mAz+neR8K9vt8CW4XNzw3dN55zLGhdd1RuB44Ffie7iEuErRRv
	5JxvgW4BkhMg5LbW2noqvJVa4wW0uulTUsxPPyLwYoo/6Iz9IUqOPLF+QBZPOFdm
	M8SsYDe00BC764D+LgJ2E1T+xQju+aaAAYFOtOxjf+9P3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sbcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:40:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d68dbb77bso5422841cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331647; x=1775936447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrq8HRbFClCmcNR55C+dTrNw+/gWvKkKtrLHgMw4W4g=;
        b=MP33qkPVCmrYztv9X9HTgndN9kOBL7/RWgqQCdplBn+q+9+9NkPu0KGYcG2FobHwaq
         dcekUqSYrdwVyaMq0Qh6ZtmVrg1Idq4D+1/x4VrkQVxe5RbWg/uS0rFDyCBtmIBuIaft
         iZ2Bi8rRvObm8TtTmrig4kfK7sNy2Grw72fmoAMtl083cwlvcY00SViymrFFmnIR+c/Y
         G9cyKAF5GnN3+GdypPqN2jxUx9rdXj9YB2QTfj/0NOOgJ1QD/Ik7iiDtPExkybvHgpzn
         cyqq8WXEAWc/Gb2a6R5dCOg6qKfZxxtF/61rf5Bve5zxWjiuW1pKFIo1spZHMY5U4Srg
         WN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331647; x=1775936447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrq8HRbFClCmcNR55C+dTrNw+/gWvKkKtrLHgMw4W4g=;
        b=BH7vlDNlewX22qBPHagkiHAoscklt9ac6x3RgsTzBWCGRJlsA8H/z8xLM5t04+EQY4
         GqJ29arzF9paIFDEdNKOvIYYZ9g0sdOi8w/CLVanNQrgCLGOumSmhRJNFx3I9AIFKZhw
         vSHz+3RFS7u2mhqXubK2mMq8bFIaLZa4xdeAe5WXPWemcWxgyX0Tjifubd+1kx8qXUrZ
         7J2MW1UsxGEwtBxBu/FfOEbyKqR61vJ0dcdWHrTFTXr9oDVZbeCt2sglYy/pfu8fGmMy
         JvLD3ahgBs/0cmwxNwpkvESagvNu73P8dl097hvDy3jzSzu4A74S2KHkhmRdhKNavB9h
         KSJg==
X-Forwarded-Encrypted: i=1; AJvYcCVx6k37OPkh6g6sBk4HnS6IY2ZTpK3Z4l33vA+u1TMoVuELQ7lfRxtJxUVgZen+rmKFtNFqBV4AwB+ZSmDl@vger.kernel.org
X-Gm-Message-State: AOJu0YwclVQSLgjXouFTqPIfydauh4ZD7m0iUk7JDGQGlz0DJLGMi1gW
	mVTMJvA0lUHo3i2sKSARShbnskwLB3YQ8mrcQerFtQuuN5v4uCXxTqxJV2AT9HTvLM9JfFqK+rb
	dXusmMKjfry1yq4kWb1u6G1jwvT5araNI/oeyUIp1fa1koiTVUwr/K1TZaiX6MHfoIkZx
X-Gm-Gg: AeBDietHxBnL2pyI1nCi6uchNEAidoS3XW/B744ocYyiutLD7lm52s8R8ErIJ4KQv0n
	YMdXipJpaM0XEGf/B5Wi8iAP5e9tPfIR80pFGqVX1a8kywvTLTwJ8WcbWtAIE9Z+HwdioO8X9L1
	zuotsJ9LqtCL+9dCnRiCmv3FlOMoesWcFypaWa7zo8tSmXaS06cXrZbpmjIq6FNR6gRxsyJh2K+
	4tRjCUG8rXFcGWHBFLhov+MBscQkbV8xnT6FpF3CInO7KBUE/PvlTaJcD2GAEVaSiOVt/i9f4NF
	7vTYyTQn42h/r/SFoZTtIsHVfsCjp1iOKMayeqITkmYA9S52XTEMczSp7v/lEeG1XDidra768NB
	/oiLzGXoJiIFDosvNw4x5KcvPxgPRLJY2nZZaQlt9Ydr1JzUUcdo2WdEbpXPXQutBgZZWAEJiOb
	XwmVk70EYW2EeKrv57GItEMAes2MvFcmYQg5E=
X-Received: by 2002:a05:622a:544a:b0:50b:4c27:9c29 with SMTP id d75a77b69052e-50d62cc0327mr115302911cf.42.1775331646675;
        Sat, 04 Apr 2026 12:40:46 -0700 (PDT)
X-Received: by 2002:a05:622a:544a:b0:50b:4c27:9c29 with SMTP id d75a77b69052e-50d62cc0327mr115302501cf.42.1775331646229;
        Sat, 04 Apr 2026 12:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc607asm2347208e87.54.2026.04.04.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:40:45 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:40:43 +0300
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports
 unit_address_vs_reg warning
Message-ID: <mn33xnzyf6qodyi6hlli4w46wzgamm2jqaryqpr25gxqbhy6gr@x5iqzh55yreq>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfXw8/jpVsf120I
 gTmGoMId5HaZ7GPHDq0WT4jw+DBBx0OIAZIHUUQLMLBOBUAlwtoUSaavbYhWvvG0ePHsj1ptLNq
 P29qnUXFD+xMFWndF0D3R12hHir6bFedg44xe/1KO4a1Vo4G6bNoycKxX2h0b1nWeZ74V0tFOGp
 8CigJt8PEMQy7wYVrJ1W5vdfDTkqycLZ+nAvLrYsQVEvU3Y1eptPSnVzZTgUjHJFuo99T5FFpFm
 MCwfI9rlri/61ePrtndnKvPPQaN+D5aXwf4mj6AXvcZgDdZ7UO8nZyWKaeyB1JwbrZlAPgNTLzn
 0OSTfz2JToIMs4AFrrcVTsYocF42xGQtWWaeFtBvMrr4SolVP5nAhVViaxTr1mBWZPovLZMvVSL
 Jnvr8v7s0hU4Tjl8YCVnklNB5vHq8sAkv3gSmS0NrmTtUo9vUtgLifh96/HaFxp2LkziRrGRLf9
 s9wWmQ2eCLlRslqpUPw==
X-Proofpoint-ORIG-GUID: 3i2xjdZ7C5U5IFOZ8_7rNNOMHPfUpdzV
X-Proofpoint-GUID: 3i2xjdZ7C5U5IFOZ8_7rNNOMHPfUpdzV
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d1693f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=V9vMjfhfzPYCBo78LHUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AF6339C478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 11:51:04AM +0200, Krzysztof Kozlowski wrote:
> Add necessary properties for ports node in SDM845 DB845c Navigation
> mezzanine overlay to fix W=1 DTC warning:
> 
> sdm845-db845c-navigation-mezzanine.dtso:19.10-24.5: Warning (unit_address_vs_reg): /fragment@0/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> 
> Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

