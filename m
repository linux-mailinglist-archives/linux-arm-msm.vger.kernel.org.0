Return-Path: <linux-arm-msm+bounces-93344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XDvGFwTAlmlGlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 08:47:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DB15CCA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 08:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 881D63007228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952B42FCBF5;
	Thu, 19 Feb 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7cf32EM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUCYBeIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCD2D948D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487225; cv=none; b=D47+Oq4aM35cHjjPyq9Bv2GymKsHDUJElmaVLA3Vsc7cL6047S0r/BCUoR6YQT2+iUkT++2qhvDxM8kVmHQVe2ho2WtQAC4ZM+Q4CstA8WIlDb+kgAQ0xhApMqG8YWHD5BcWNrIEaoeeO0WJxZdAuJWcMVKgt6NHFOGilYcG1iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487225; c=relaxed/simple;
	bh=HENVNu8zANQgOkGuXOuJ6QaqGD0pjBgxHlfPGi15+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9Rog0CMNjHgiV05KmA+N2pie+xW1YVyjBokFCBpycfjcnAYjUjAnZb9cgQRXnXZwYclX18l1bjdia3N1Oca8ozFHkmFF9bV5qWKEXp3N+4sNekRKd17S6uD9DeTmDM7nins+6e/WRSZzEEuKuR7BBTFDd2J49+e51xZO1ZPub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7cf32EM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUCYBeIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J2xoQm4025127
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Ey4wxIRsd6+dK0vuIpoKQE6
	m/rBwdi1/lYgk0pbYdQ=; b=A7cf32EMoqoZQKVEN/ITkmAcGECYyf/E+Al9GwQU
	lAEANcWFb8Su31s6fqrjruBdiv7LNZRjuMDnMxkBbatAANaiiFznNLbEh5ior2Mt
	I6L+qtOusbJ9v5f1SCMLmHN4co2ixauXC6DG+iDdjKCuZdN1TtUn4Od7hmeVIjzP
	IUSd/AQygas8rnYdNt3hJF4wpXasd0fR/xYS2X7yA6HSBZRO74OuulQChbzhaOvz
	KcgLf/Bj80ix+PTLfDEPCTWTwDiXJIuoilzaJX0GkdkCbgJAxDZclexTQv2GTmYe
	Gp4mUEPC3xh83MWwmp6HVFo/pIzEFfHmZDkXbw6U8095DQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c3p93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:47:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb37db8b79so891371085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771487222; x=1772092022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ey4wxIRsd6+dK0vuIpoKQE6m/rBwdi1/lYgk0pbYdQ=;
        b=jUCYBeIkSIq0RdQCrGr2DTLCHGbAUbJZB3nhkRUPN01dy+4oyBvc7jB1ciJD/7RG4w
         6XpUmGzvBJRH3i7jmYKDyla9SzWfEGPsmiMWTzIxfWV4TINkPUIuS4uGxhUVyuBDovh3
         UPjZVLONdQXLJ/2qsYLzd2dBatLQtH2OtPoxAytFLkF7OEmz04EUfysF76b3HWMCoPsY
         3lVCUHA2Pqa/bk2qQ48g/fGoYqaTrWuo/n38DSIctFar2y5KT4SfVu4M6SMzsmbIxzwW
         aK3dlYYwcxu//prlkWXVdAxnLs4hRjKqCMBEq/9Nx1o19PsA8dxkxybpJi902cH/vQxk
         CX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771487222; x=1772092022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ey4wxIRsd6+dK0vuIpoKQE6m/rBwdi1/lYgk0pbYdQ=;
        b=wZA+VKAhzpk+ysDWvnq+ouNwFhsS2RE1Qu2pTlkCwMxKLQt5M3YEfNzYGjg8zTX0X8
         sHPRkSCOZAf44Q594v5tB9ocQq/IADiXjZ0LnVAensQjorwuu4vwBydgbmpRbhqjTes9
         E/odturl3o3er71USfoNBPQK3Qm4aax/iZDgq32ReMBC556RKSXcZhH8U4H2mAbTIN2x
         +agGG0/1M/KuyowoXkeskwUZGmhOU4NhC0ILtzsRxpopKTRPQj2/d2znwzQiJsn1LTLQ
         0nf1cMLRBAghuqSrRpwdrtNQMw+AAUmWgapn/SN9deDvIriwtoKuDAw0Cyr73PyzrWEE
         RALQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWEEnNRnQ/OD2Q3NPGlaHN5JPkdzj5o2yugf+B6iRBabfnFo8jJMxXbzVbZtHLqNqTn+1P9x+pF3qt+p2i@vger.kernel.org
X-Gm-Message-State: AOJu0YxGLkbiprf3uw7PPP83q5qqqLE4dieWoW/mAsYh7a8xF+53iSuu
	6lm+ELryvBxZ6JEE3MjCs+d6P1KFUby141M0ZQlYN/b9nTPzg4pOOr0Wz/OGnZhEmNb7AQbnXbm
	+2N1wv2WpRT5b2uvevu+YKwIuhe1JvsvhU5Jpx9vIIgR2iAiKPPB/Vx1CvzEA5HJteQNO
X-Gm-Gg: AZuq6aI6WY54tfZbsb0RQ9bRArvOO89S/g4JLgS3Hhk9huZXFb4Kh6kL8EYesRLBWoa
	oJPV96ShGKT7qZuJujli9HymqK/0dUUsW1CE7DO1JhvCNC94MR/AqQ0LfeqWlJH1Beh47e40nY/
	2PMKMBvpoTPEo9t5j8dwK9BLrprxMOwrSVB4LujEvDzyh5qL7SpC6LV7U+yv4AV45agoAnoVYdK
	bsk2iUxTYvfAwoNby0Ty6pg2SAqnTnXPSyxY27SIqEMf/i3K6XYy0HMcV2nsqsFVB1kxVjJQkFq
	p/IV+GkYIrqq3rmMiZkze6+b03L+f++OdmPF7yvPLaf/Y8NAFjpo0Vs35Czm0nxEIydvHM9RyM+
	L0fwV9MSQ016pon+B2Q7gXG2oYjcbw41I0/1sQyJyTJzQsgJs8W5QPg5CclL8rQdFu7Sx9s4gTW
	mk5g7q9Tucb0nYRPMJKtgloahFwAFUPYZu+do=
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1685501785a.10.1771487222556;
        Wed, 18 Feb 2026 23:47:02 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1685501085a.10.1771487222126;
        Wed, 18 Feb 2026 23:47:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568dcfsm5227041e87.28.2026.02.18.23.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:47:01 -0800 (PST)
Date: Thu, 19 Feb 2026 09:46:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC pin
 state
Message-ID: <qet7nucpnt4q6htfzhzkinxnrkiavguxq4kaulvhbeiwhpckhl@3dmcpen4ijk6>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
 <cq7bdo3l4w7fi2aymo4ovafrj2y52k33dspeii2lvv75viujet@anvldr26j7to>
 <cc02215b-dcfe-47e7-bc16-0f467b6648c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc02215b-dcfe-47e7-bc16-0f467b6648c0@kernel.org>
X-Proofpoint-GUID: aR1k2HTiPNVADD3iqVZgX_RT0RIDYCEK
X-Proofpoint-ORIG-GUID: aR1k2HTiPNVADD3iqVZgX_RT0RIDYCEK
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6996bff7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=C06l6ZPG7BehnnCa1pIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA3MCBTYWx0ZWRfXw2dqWRgfUlhG
 AwVWrB4E1H5YdPa3mSQQWFDRZulG6xaXzRN2mZbbQ2bD/VcrzDfzxyZ5rS54LPudNJZqRnlcIaX
 sDuJNwfMC6AJcijszFOTDHWvnZ/0/CpmI8dyzX4LssCszwlvsodwnd3l9PfHP7F6UGXHTOORqsL
 h1au8thAGiPKax/JuN76+GvwIqvnb4B1K8kr9EBVxqAKqU4EQTpGHYfcq7SpJe91DpHb3FAtbAE
 AM0W2oAeb290WQVzMMkgfQd8w5odzJODyNvzvuRfd8ZAJteKWCX86AR4BOti12RoLM+iq5Pp0NH
 G6X8lHCIzhOlgriXh2Oi3n2ylg8L5qnYvBKk4KitS2GVxe+4FlsX6MYKNESTF602eQVyn7f5XbR
 yMP9xgioLkvAMFLuQZXjNqsm15eR/ZustCROPOtAJElQ1uq/T5yKFD0D6jw9FlisqS3SLqPslAH
 AyhDnknh5TTbJItsVGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93344-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 977DB15CCA3
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:23:45AM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2026 07:49, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 06:24:23PM +0100, Krzysztof Kozlowski wrote:
> >> The active and suspend pin state of VSYNC is exactly the same, so just
> >> use one node for both states.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
> >>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
> >>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
> >>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
> >>  4 files changed, 5 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> >> index 63ab564655bc..a4dcc88bb01f 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> >> @@ -745,14 +745,7 @@ mdss_dsi_suspend: mdss-dsi-suspend-state {
> >>  		bias-pull-down;
> >>  	};
> >>  
> >> -	mdss_te_active: mdss-te-active-state {
> >> -		pins = "gpio10";
> >> -		function = "mdp_vsync";
> >> -		drive-strength = <2>;
> >> -		bias-pull-down;
> >> -	};
> >> -
> >> -	mdss_te_suspend: mdss-te-suspend-state {
> >> +	mdss_te: mdss-te-state {
> > 
> > This is not used and probably can be dropped.
> > 
> 
> But I think it should be used - it's just incomplete. There DSI is
> enabled so there should be a panel using the TE/VSYNC. This looks like
> being added for future, just like many other pincfg states.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

