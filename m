Return-Path: <linux-arm-msm+bounces-103579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLzAJAXF4mnD+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:40:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDA41F35E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F821302794A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89F337D124;
	Fri, 17 Apr 2026 23:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IR8r4Cnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2x6Wxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93834DB7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469247; cv=none; b=TpsikBB4eTQzC75Fs8U1+bOV20Z57U6pGXBbwYbbuAmXnhV3S1SA8hlTxg7xT29EDvD7C2aQkNcaOz8zc04WCAsoVvcb1eB/OU1jlLRH776PnzWZ4w/hwY9MdTgnyeDcnZsM7lJ+g5/Q6CCfnbHGdflft/8Y+wzLFtSxxUyJOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469247; c=relaxed/simple;
	bh=QLwLIyybGbuhb41Lgyr1BzNXP2BvhlqRdi9W1FpKYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6gEbBDmFYGjbKPARcJieaubrPYA7XTEu0/9rwFRb+NZUg1FBc3y4H2hGog4y2wZsdiF1g39alPrOBnWQwf5a4U192ZWcKz7pdvhJQcWOmHVQhcvcmJcL2fP6zqLdBrg+N86Gf1liPI/ckY6NsN40vQf6xAYWt69xMfuTIFVs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IR8r4Cnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2x6Wxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4LPR4044742
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqsleupIiijc5MZBwUfkwuWc
	PF7CundACXwuw1EL1BU=; b=IR8r4Cnhs/pt4yc9JuNn9TtnARDPergZKPLO8E26
	zk5f6A8g0IkEw65cHK8KVBWDYsdXjtwqW5NUqu2xpeDXoCC31IriX6D3rSCxziXq
	/6zWA1Jiqm53KpxBSp6HXSOt75Ni5C5k5GUjB81WWydrtq153+Be7IOwibzm+edV
	K8gZgXjPnaCxN06hMv4CF4eBf43Pgwy3iAdjcZsvQ7r6zv9IiJEXK6UmUoTtbToU
	Z4sqT+09V9r7VS3CLUCX36k5M1WZvBEIdhxG+RlfiEJFb0JoiNEHrWEUqfz04iHl
	37x/FvYuP3uw4UERu+JATakFw6cxDxXn3mh1uupCAWM6AQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqumh71m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so33903771cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469245; x=1777074045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=EG2x6WxmY8+h1xq3/34/Igd6BhET1LB9A2JrlBei59S1377NOHky4oqUxX9olyYhB+
         eiFFSxnaPWoiTK+k6F3jwiT/6H1RHoZsxzTtxu0V1ImhtKRRJTHhPGjdpvdoLgfIS0x8
         EjgEKmss2ZqlSC749kdTV4/MuTv/z4nO//kkCt+HqzoYSKXNQbzdRPm5kJ3+I+WGPexp
         km+JrxW7Ym2cQV5f5wiHeitx362pyZFc+z4Ve911jMhnbI3fZTZM+J9MmLeLrFbfztLM
         lxPtfTZ0RosgUDYl0LEme8vdNprfwcRAIpE857WIMdhuNihA3+ch1DxE1n2P+4KrSMKD
         8A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469245; x=1777074045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=aTjCxKYeFKOIu/VBf5ijTyecAS2q/eqg5iQFjfzS7fWb4HprBNN76JSPbRknFw3FOY
         BzQMrUQXAJR48qeGyXXeOZSogL0BEZAUJMmrrCNV0HVQGGOs8KWvXILQKmFcHL0L9Jvm
         fRRMfnRWV3EBMyzX8fDAPTYd56lQ4SUlRQXBHbBJiY3k60hy68HiisZEZaiVSZiVA/9N
         tgr1PeFuKzkqJWoYJEjJTa37OgFp5+Iwf7fKzhSfVE8w2ZWe/EfXAwHytzV52x55aUYr
         FWwwwMIj7nUN3L/viMS5CW4+05rnont1FPw8iE34TijaNjCQfRX1TX9bJttIuOO21K7F
         vOZw==
X-Forwarded-Encrypted: i=1; AFNElJ/yIuCVrg6HPyl7y/26cTqzcyk9yFqzZL/gwBgBqMebTwjYXj7NDP10IpHvbwdSediHYHDW69wZ6vuJlt+w@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwyF1xghuDSIkTkK8Nfg6s23AWFdZTweqe7zqGYMw+MaMm9dX
	EDRayjgNKSUOgyNU4fZ9HxvC2JaahryO58HMEE7CuEDZ+a2mwiJQuubmuR0bfd+D6NPfJOM6rPo
	FP2wJZAxyzS0N/5vALOL/VW6wi9ZpJLV1RKHLlSsXfpRuQX03MMGMQ+71Cfxvb1MD5MR9
X-Gm-Gg: AeBDiev/M9XtHSNjQaoYIbuChTziAL0q1NIN5zdZ9U/3v9k8wKdg73yYHM38OMLfJ/x
	Xm0m/VrxJl38h5/sz/nioNLCboqg3KAfpFEZ2MfI6qicjVpyshu+74OWh1HgY/Y1DbFiGO83bKr
	HowsuwqcMMyGmpFRteEUPwujzSAbv2FLnQwu2Zm9E+BKz5pZ0LEGajB8KHfWUsbwpSgYCWLybUY
	M9FVexJNzn7HTu3JDNXpG3BQyf3UfkxiJfe68FotJ+/RdEMcH/Sc7RluO2tDHdo2P5Evqzla138
	Q+N1uGPfknqvALSwUBZ/wXKJAgZgz9r36nFV3Pn/JkaUaZAtnD3iHdeT7mr59bAh1IUOJbpaEen
	xTmU9+gHWjspnCGnKyc/I3BySoO6UT2MkFkH7vsW5XH1Lqbz3CqwfPju/mPRSK+Fk642nb2n1Kw
	SHF/ZOqsv/c6aj25wrIpluMXBxVys0CYtVmqQ3lKXPqbG+dw==
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423581cf.25.1776469244635;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423301cf.25.1776469244210;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10e6sm816761e87.40.2026.04.17.16.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:40:43 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:40:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
X-Proofpoint-ORIG-GUID: xh9OBdxNjRfBACW4YyVKY2YLNQAMkFR0
X-Proofpoint-GUID: xh9OBdxNjRfBACW4YyVKY2YLNQAMkFR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzOCBTYWx0ZWRfX0SFvmSFuMUys
 rb9OcUP5QwUi65kcRphm20ZDjmHltmodmpQMCve4A7BQ++K4SX6EUVilI3yo2JU8Gr4tyLZFw0P
 Ohc3sPAWNKB8NWwn9B3C8+5+Vuv2HdpDxisTlVQGvmYTc5ZdQpnhkQAGesFnZHxkQH4XLZM1YdP
 l1FXdAnTA4TAgW2G76fo6fYjvXzMYoDrHLg4GHINNSYJYHIcdloY91F+Hcy5gH0Ohmvb2e6JxHo
 MSV4ysWdAbBsJwfA2n3o2oR+reFqw+ZG5x9Zp9CE5PEUXCXH/TEeTBryyOwJJ98dnk4LotOInLj
 zeIVOXmzTxYR7ap6J8ouZh4SuOq6Fya9AubbsuDXsQ0ap5pmkGY0ZrEkiKO+PiDg3Z80YoMg3Kv
 bs7MB+4o65E3fM45KKlasHj8J/Aq4uzreGS9IrpxKXlM4FOYXqPpiL2YPGjuBz9hZRp/t6cBB1F
 ZZhBEmVsWQbcPwFWwow==
X-Authority-Analysis: v=2.4 cv=PKw/P/qC c=1 sm=1 tr=0 ts=69e2c4fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=OHVz5xcZLeuoOJp_SuAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170238
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103579-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4EDA41F35E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> >> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> >>
> >> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> index 90e966242720..231a3e9c1929 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> @@ -267,6 +267,14 @@ &usb_hs_phy {
> >>  	extcon = <&usb_id>;
> >>  };
> >>  
> >> +&venus {
> >> +	status = "okay";
> > 
> > You need a firmware path here
> 
> When I tested Venus on my device, it loaded without one specified -
> msm-firmware-loader creates a symbolic link from modem partition for
> firmware. Additionally, none of the MSM8916 devices seem to include a
> firmware name. Has something changed since then?

Us becoming more strict? Or more caring? The default file paths are
supposed to be used for unfused devices. So if they don't work with
yours (most likely they don't), please add firmware-name:

firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";

-- 
With best wishes
Dmitry

