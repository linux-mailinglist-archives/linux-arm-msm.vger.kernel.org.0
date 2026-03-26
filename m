Return-Path: <linux-arm-msm+bounces-99998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN79OnOlxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:18:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656332EAFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60941302DA28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA0034FF49;
	Thu, 26 Mar 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJa48s39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/48IWJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366316F288
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774494840; cv=none; b=hxcmh51FpCdc+/+yLyrVgtiJ1QNWKPimzw4y/QaiaTz1GeM3wiuMjeAoDu5b6odLSxUgxWtR32KaExoYATIDheJcJqDygFA0kC3hZWiGGDhw96R2lgq+boexDvSos/rdOsViw6L5g6u63metgaALjnSMX+wJYMblyhhEVEGr/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774494840; c=relaxed/simple;
	bh=+2h7xWvh95GDC9boir3Ubc4wLhswNtcV82FRru8dmH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMfjTyMCE/VAlRVMeU06D5iFlLHk/tQn4eM+KY1jWUp1tKVhqBM1NmOKX3QMga/NVY80aFrTVmc5AZY20/8hN+UU5JiRSqTQ1VmN2skxk2HSjKWwnYtPUCTj4TViN0OFSjtHRf9s74Olenvec8VW48ubi21pEilrKpPWPNFK4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJa48s39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/48IWJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPMbg1062113
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vi6Tf08P+tXFbv5eab90jwB9
	/3Anqv76V84Jd1wJbWE=; b=YJa48s39ic9J+VAlX1GXMEt1YiOdJkRt/OUbS7hp
	pEqOuL7sbyO5lK56boHO+xyjV/uWNgSu8TiSpPzazI8lXuUonQ9iHQpDvDNe/ApT
	IG9xA7UstqJ54fpb2yuk+OMlcIe5a0ifwMnnzhII2+W0kbnlJTk5JDT0qLdoUy4o
	kJK5Q7DH7nYfGUGS3CvKSl4r6f88GXieM5T8GG6LdH6g3QfaqVhT/jNvoNh0EqiD
	jRNCoZj9pB/i1sEiq/7cOzMtCDLyB15s7STAcif0RHrQobISBylO+8Jx+I3mZjed
	cU7SFjcRHYyfqrGHkBjNLPQZwhYyoUCqC2nzbA+N/UPFzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksruad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:13:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b878a8c07so20711441cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774494835; x=1775099635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi6Tf08P+tXFbv5eab90jwB9/3Anqv76V84Jd1wJbWE=;
        b=O/48IWJ9Hor8njEql9dXWn+lDJMldUpMNVbTBADwodjKLgqaDjPHamb7zKCtTq0WF8
         2K8o81DfAWBw90Nkp4SY/v18VAKJLW3CULQLHm2DiaGa5+SzPYrhD5cuB4I/sN1ue2Xj
         +wwB8mIeIwg8RWC7XEX92m1tkeuXS00EmVbmfz1+oDpILmJUxkSGvh+qqMF57g446oPV
         80Y9yYwlj4vGthbDxcePWsxr2NTqiODc8UX07Pv0QcWVrpa1Rl/riMUN8BskSfEssPoC
         IBDH/qWsZOO5IJk+rjYcKjeyb6/TptL9MANWZyPJsJ1xJFASBP4Vs7K3KrXP8Rbizf1I
         aV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774494835; x=1775099635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi6Tf08P+tXFbv5eab90jwB9/3Anqv76V84Jd1wJbWE=;
        b=TSrwFdIpA8G56u4zGvgCLL6S5GSXSax0ErrOX9pJKK46HiM82oD5xYMRlld3dkmqVl
         9csvW8ZliiAOcWpWLvPtMQ93L2X3oYTUCXwzJ6Sk6PZAeb9av1io8C2kZG12bfI++Rpb
         W12meMlSW9DkmNaI7hK3/0MqmqLbN1SeSs65LCu3/KZRU9b14/BxDQcWTyq8lkLbFxYT
         LKo7MrQDsdWtffC5RcBYiYbhh91fd+j8U5GJRqs2pDosETsuwAioN8eKvhvWwOoWK9X9
         yKabf0RVs7I8RIxF7bPtEtunvr/6OAp7emXm5tsTOZ5xtuvQI4NqkDOBizaXG2tsFlLJ
         7F7g==
X-Forwarded-Encrypted: i=1; AJvYcCWZCf9r5aIlQXQ+KzbECuknCK473u3i6VJzXuh7avshGtexUUl76Zs/FYc9K/ZFiuy9oMY0YRDziA6SUr0M@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDPU9i3Uc0j1qZ6X+U23k++pm7QiNbJZzSTDu822uoDidWfda
	NIfCP1jnTipz76h7g7iZBh2/rShRYyIxUt5L/zSsAcz7mjspDcKb3QaJUhprZtXgy/0HCsFsrHh
	Nnx7cxU7ExJzYLjEXhP2TKiJweWc6ova6Pb4ASfMHiOLysS6Ri2YfY3yLeLRPFNBz5D8T
X-Gm-Gg: ATEYQzyjwOD0J3RiJ0ltkBBfuVTasz3m41JAQAmtd6iZYbv/PlFV+vEe0eqF7nO8vwY
	8NgpHC0qejOc7sfQ/3C3QdybshPkJd+LzwHuG8kG6ofk0seA4Z+vvMzxmQeBmCavCaBb1+QxT9h
	AoG+i13ZIHxAdjtZein8Zgyq+h/IacShdqBicFzLtRG51+wMdsJV0WvsKyG0+JaUp3OxMe860s5
	IRh2Xy5NkOkwRPx3I0h/2/XjkcrbqilkjFPkPISaCCFDEXCev6ltO8OfeE7Q93S973bwHai07gq
	DSULYkF6uCFGaAAQBDcewnLXmcP+JRO31uzF88yf/+NJ8GCLhAbjhOdRRdTXSH2icmLQ7FVgjbP
	XFSaqK7U9pMfSDJNM/AjzOQy8CMnuChrcZOdFEPlI77Tw7LrwaCUnGenWIABcHgSySvF3jwtVvJ
	xyUgpYYDk=
X-Received: by 2002:ac8:7c4e:0:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50b80c9bd5dmr87042031cf.14.1774494835381;
        Wed, 25 Mar 2026 20:13:55 -0700 (PDT)
X-Received: by 2002:ac8:7c4e:0:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50b80c9bd5dmr87041791cf.14.1774494834903;
        Wed, 25 Mar 2026 20:13:54 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b923a7a82sm14173301cf.25.2026.03.25.20.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 20:13:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:13:46 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI
 devices
Message-ID: <acSkaneJtwLwNgiA@yuanjiey.ap.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
 <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAyMiBTYWx0ZWRfX9O5F3BEm8pow
 ZuzAktEblLEugfXQ+iR2HK4DNCvbHtJ1Ea9sRrxaiZftlEe/syGUm4boCid6u6Sl6XCUcwuo17q
 YKov1W5c+RVOluAyYFVJea2h9MH7DKnokq/YGBZ659H4x3Vw9zkXnwNDkGTIoJMDjpGDpo90C32
 JYv2Jyo5bu2e4knLZ4xq5+IrG+8rPsoVUFDZFBrTGrMg1AKsmF6mSCaoDZYnRZxFvIkYoZHgHf1
 nO/asMlhNlY5fBfmEu4GOT35a18EA7YJMFGwx4cF2/pkj76tB4QNL5n28/9ZUZYcPMrhGsDO3YT
 wCJhq7ao7B8TEtVwcPXtYonY+uTQSdhZaS0PGq9sXalHRceqBSmfrODkGxmYCXX/9nS7Fh2SinI
 oyCr7oxJ4u8hZUNCmRMkF8d4h7BluXnS1ONvrV4IqnioDHXOfW+5zPvW0eoLuedYJNiPPCMXrVP
 Hap5G6usPIJSYUc51PQ==
X-Proofpoint-ORIG-GUID: ojiJPAhgs2DUGs3NnhHflJMqOjXgG-aK
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4a474 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X_sqsiJlureHGJGUDFUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ojiJPAhgs2DUGs3NnhHflJMqOjXgG-aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99998-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yuanjiey.ap.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5656332EAFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 03:25:49AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:46PM -0700, Jingyi Wang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
> > board.
> > 
> > NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
> > 1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
> > 1.65V~1.8V.
> > 
> > pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
> > level shifters. Kaanapali need configure these pinctrl for panel
> > function.
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
> >  1 file changed, 117 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > index d0f3909621c9..07247dc98b70 100644
> > --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> > @@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
> >  
> >  		vreg_l12b_1p8: ldo12 {
> >  			regulator-name = "vreg_l12b_1p8";
> > -			regulator-min-microvolt = <1200000>;
> > +			regulator-min-microvolt = <1650000>;
> 
> Separate commit, Fixes tag.
> 
> >  			regulator-max-microvolt = <1800000>;
> >  			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> >  			regulator-allow-set-load;
> > @@ -873,6 +873,51 @@ &lpass_vamacro {
> >  	qcom,dmic-sample-rate = <4800000>;
> >  };
> >  
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0 {
> > +	vdda-supply = <&vreg_l1d_1p2>;
> > +	status = "okay";
> > +
> > +	panel@0 {
> > +		compatible = "novatek,nt37801";
> > +		reg = <0>;
> > +
> > +		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
> 
> Why is this esync0_suspend?

I check downstream sde_esync0_suspend and sde_esync0_active is same config in kaanapali,
maybe I need rename a proper name for these pinctrl.

 
> > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
> > +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> > +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> > +		pinctrl-names = "default", "sleep";
> > +
> > +		vci-supply = <&vreg_l13b_3p0>;
> > +		vdd-supply = <&vreg_l11b_1p0>;
> > +		vddio-supply = <&vreg_l12b_1p8>;
> > +
> > +		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
> > +
> > +		port {
> > +			panel0_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&panel0_in>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l3d_0p8>;
> > +
> > +	status = "okay";
> > +};
> > +
> >  &pcie0 {
> >  	pinctrl-0 = <&pcie0_default_state>;
> >  	pinctrl-names = "default";
> > @@ -970,6 +1015,42 @@ bt_default: bt-default-state {
> >  	};
> >  };
> >  
> > +&pmh0110_d_e0_gpios {
> > +	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
> 
> If these are level shifters, should they be configured as a hog? Or
> should they be modelled as regulators?
> 
> I'm not sure, how do we handle shifters and their supplies.

I think regulator-fixed is OK, but if change these pmh0110_d_e0_gpios
to regulator-fixed, means need to modify the panel driver to accept 
these changes, is that correct?

I see downstream also directly manipulates these paired GPIOs. 

> > +		pins = "gpio9";
> > +		function = "paired";
> > +		input-disable;
> > +		output-enable;
> > +		power-source = <2>; /* 1.2v */
> > +	};
> > +
> > +	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
> > +		pins = "gpio10";
> > +		function = "paired";
> > +		input-enable;
> > +		output-disable;
> > +		power-source = <1>; /* 1.8v */
> > +	};
> > +};
> > +
> > +&pmh0110_f_e0_gpios {
> > +	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
> 
> The same.
OK.
 
> > +		pins = "gpio9";
> > +		function = "paired";
> > +		input-enable;
> > +		output-disable;
> > +		power-source = <2>; /* 1.2v */
> > +	};
> > +
> > +	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
> > +		pins = "gpio10";
> > +		function = "paired";
> > +		input-disable;
> > +		output-enable;
> > +		power-source = <1>; /* 1.8v */
> > +	};
> > +};
> > +
> >  &pon_resin {
> >  	linux,code = <KEY_VOLUMEDOWN>;
> >  
> > @@ -1128,6 +1209,41 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> >  		bias-disable;
> >  	};
> >  
> > +	sde_te_active: sde-te-active-state {
> > +		pins = "gpio86";
> > +		function = "mdp_vsync";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> > +	sde_te_suspend: sde-te-suspend-state {
> > +		pins = "gpio86";
> > +		function = "mdp_vsync";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> 
> It's the same as _active. Merge them.
OK.

> > +
> > +	sde_esync0_suspend: sde-esync0-suspend-state {
> > +		pins = "gpio88";
> > +		function = "mdp_esync0_out";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> > +	sde_dsi_active: sde-dsi-active-state {
> 
> panel-reset-active-state

OK.
 
Thanks,
Yuanjie



> > +		pins = "gpio98";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	sde_dsi_suspend: sde-dsi-suspend-state {
> > +		pins = "gpio98";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> >  	key_vol_up_default: key-vol-up-default-state {
> >  		pins = "gpio101";
> >  		function = "gpio";
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> With best wishes
> Dmitry

