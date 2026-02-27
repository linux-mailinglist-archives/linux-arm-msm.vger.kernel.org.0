Return-Path: <linux-arm-msm+bounces-94440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAGVCGyEoWkRuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:47:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843D1B6BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F698300F2B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788FC31985B;
	Fri, 27 Feb 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACGQXBod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg/BBeIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB92222A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192871; cv=none; b=L6+hcQfm7Mv5wnYWjJUcI8hx2Ta2PRQjMiYSZ+H68+kn6//oWTxUYgsMqIJEtPUTXTESbv2JKP99WqeW0Pu8UFoVAijt9xeFlNB52ykhh6FDA4xOmzP77Y6vbzMdWvx5TH1aVthqGW/XIH/C4XJhu3UVG5MCwbvPw/LQ7ubDSYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192871; c=relaxed/simple;
	bh=Vr3kLQOkLsFS+EwADjRYVEC2XRNqb23/sanrkgmmKkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjKrHepFlUea17pqYAOm91sq0YZuytf80uc6euzKd9yAmHX/GDZMlWsU0MhPIHsL1ZAygvR7nleuOLBzJd7xYNCbXbA+fKzYK0/m8ZZ8vnZrtJlqYHlIBY2fP/vvFJhSEqsd3cFWZ9vnyPCGH0qBTU1wcD9cCvmBmNGbGO9DQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACGQXBod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg/BBeIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9kBM23945768
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kMnhYI/cWhNEBcvWEDoxgb1v
	XD98lOKjXsWDD1pfSa8=; b=ACGQXBodRVbC5jdhVrtz0HFoKekkGUzpbeYb0DoD
	5dsFbM61H/bjfrJfIohiaetuwGJQk5OMXLUOpISZB142U1fJ2PLXZyMFb6ZzoI89
	amcM212CWEz7h/gBwuOO8Zj6lSwQjTCrOtuu04KKHE0NZvTmk2WGEJP0Fc21eu8S
	kgjAzOomI2xuGnD1U3PiCJKw57JJ6UU51DKXTZpvYDEcivKCyzNglqPDywcukvQL
	aFnzkX4bI4em0b+8L4EE9AT5qt+QQih6AtjQzhqqak/c+KeKLpsPMHkPWV+STB4u
	ofhKJjgiIXUxLqOnSKGaITOYJsJTtTHuyCT1Z9fVIgCFZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x88bfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:47:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so2380946285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772192867; x=1772797667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kMnhYI/cWhNEBcvWEDoxgb1vXD98lOKjXsWDD1pfSa8=;
        b=fg/BBeIqmHchOf2FreMlHTI6Z/O1wDpO8xrS2FcCmzoYC44+Rry+kF40Urh9KxAp21
         ZBBsT6ENBXn8BnN+AlZZsHgSrREkwteZ7nj09oLUA4u5Om+p9NCCYkDk3JqWDk418pTw
         GINRZp+4UlNnyMoEmdNww40OtA8LjX1rqYT+/fPscy4K8H/O839QDxNzQzSZuO5oavjL
         lzltlnmNfZWk134UqtSP5Do99ihygu9TPjDGfzw4ySOzTmPH8UuC8M22/N+YLBZCx2xT
         ikRMnV5pTBGcRFghGxpsayzKIzS4BcF29o0Mx3cDU4w5i53f0fZAcRsQhqYqJOvo/Ik9
         NNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192867; x=1772797667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMnhYI/cWhNEBcvWEDoxgb1vXD98lOKjXsWDD1pfSa8=;
        b=VLdqh0oLnAKaZ3WhiC41hQ/DTINRKteVYtYBe1aBABugkZ96DM6nmakFkbdy91MmuX
         DdlFO7P7noBsztLlv/V375RdSa19mAYD0GeuN/vHjdXiyNUolvw+fa/B79J/cmu5VM7g
         /rL0gtbpSrZig3/Gk08DtxkDIogwJgERDeyRQkceIFxzTf1pL94gMookm9UHl92U8Ipk
         y9fRP4yRIMIxd9DyxGAP8d6mdTcvBmkFz/2HIxAajfL3O8e6GlbQD5c8nXY7XkzOd08x
         tJuvJCsXucSQjBKWObNtRS99sSwYUBWUOKxLzWbwvC9YLy0BTEQexOpcdsoHoaG9dVqz
         +/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX+DBYt2phaMnLdZYWBu/+0Reo6EbBDxWbrusmMo0l1vfvzpRDpMEN/hJYxEGrMZgt0tMXt95eErUiS6+a/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtV9wdVat+BZJpkwMfMc+ym/9K/E0XNEGAVWt7SxPljrM7/Wqw
	ejNtC9M2cLMy/0b583uVuF4Vyx1DrOYm5rz4tvtCGuFGOd8vg5iGtqPUJknFN4j4vkymQCeadvz
	OKTGWvpiNZVDtbI+FB8PZW343XyGvcfgSybJ0SQdciKc4khjJogFMeeaCHlS0HXb7CW/+
X-Gm-Gg: ATEYQzzTr8CaakDKOhNgbMj0aeUDgTxxv5bTk00On8z57AbNH+j0PjXMHx0gUxHhTns
	JZAEbi4z23yWSocWxYJrDVMkMFHEHIg/xb/5K7CEsnu1XN8j/55hfvn8XXLbHMyOoYHZe7briNy
	hnZ6v/e11ONzXtMIE5u97ebiE5t9+5ioeRi9pu1SPqvlc9R/vKlK6gkvfCjzkxL2B1xj5EkdwjE
	ZsEi/A7bDo9hX+RBq4FEjfYCtVXaDgOhHUy/NIlX37/Fw/V1S7v5R/S9gjplrbv/IY9OjQ7Jk4G
	sFOJAAMEUbSfkBmJ54XyOSgt8FJop3i/vUmZiAYsQs0dEcPtm4gc0butVRwEu4QX7BCXEuUkLJH
	IaOjVqKvCM72st1VDm/oN+EG8T9folaMSIT1X
X-Received: by 2002:a05:620a:4509:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8cbc8e78817mr291262985a.64.1772192867082;
        Fri, 27 Feb 2026 03:47:47 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8cbc8e78817mr291259785a.64.1772192866551;
        Fri, 27 Feb 2026 03:47:46 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm99290655e9.1.2026.02.27.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 03:47:45 -0800 (PST)
Date: Fri, 27 Feb 2026 13:47:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v2 1/2] arm64: dts: qcom: glymur: Describe display
 related nodes
Message-ID: <m4kxd3kww4mihirzpoef3fa74sjtaifm6y3tvemwiloq4gybi4@zjqwiqqqy6kz>
References: <20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-crd-add-edp-v2-1-8026af65ecbb@oss.qualcomm.com>
 <xkrlyk33bddfwjxh7n4bplubbegmvetxqukcxmpbeqncosdb4v@fpznx4z6noc3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xkrlyk33bddfwjxh7n4bplubbegmvetxqukcxmpbeqncosdb4v@fpznx4z6noc3>
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a18464 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=O-BRc_vsYpTQEQB79n0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwMyBTYWx0ZWRfX/znvIwIn01np
 7vhF043tYouyae1w51PWTA08boEV29GsDfK+CC+dgWmmXz83ENVUOrrj/Ctd396H0cbA5uPHbV7
 oYhIu9auYPQEyrdtn9hPs2Ye2vVPnRW8qUH18g3r7AOeJUYd/rkHT8kPxyOifwahmsgQkqBm290
 RXZA8QcwrhQV5XwyI6TAYk/6LjK7Br6kcPgQiC0YWMECUnkj6DpXWuhO7FFFkg77OWKwKaxFzIN
 1d3UHXa1J9FP7wlPJfRijDseZOgJosKf5nT3EvsicApqC7GKD8DroT3XIONYj+9I5wPrktTjs99
 dnVptaJ9Kvq/HhF2GqtRGvfj/JeO9X6pBp9gG+2A3dfjRJYyMl1HEwFm7OHVrQPyQL5M2wuAp0A
 lkUvNIPRYUfvgAt3OFAoyX7FSecP1BZNdauFsYFmhijMV80WyxDBZ4vkkmd5ZHpbFkVMsvDh6XH
 QGLtu1JpDvN5u9Ex5ow==
X-Proofpoint-ORIG-GUID: lydPUB5iNXt2Tulo_Vps5gEyfaGSGNhq
X-Proofpoint-GUID: lydPUB5iNXt2Tulo_Vps5gEyfaGSGNhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94440-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,af54000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3843D1B6BD7
X-Rspamd-Action: no action

On 26-01-13 19:48:07, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 05:00:05PM +0200, Abel Vesa wrote:
> > From: Abel Vesa <abel.vesa@linaro.org>
> > 
> > The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
> > controllers. Describe them along with display controller and the eDP
> > PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
> > clock controller and link up the PHYs and DP endpoints in the graph.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 431 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 423 insertions(+), 8 deletions(-)
> > 
> > +
> > +			mdss_dp0: displayport-controller@af54000 {
> > +				compatible = "qcom,glymur-dp";
> > +				reg = <0x0 0xaf54000 0x0 0x104>,
> > +				      <0x0 0xaf54200 0x0 0xc0>,
> > +				      <0x0 0xaf55000 0x0 0x770>,
> > +				      <0x0 0xaf56000 0x0 0x9c>,
> > +				      <0x0 0xaf57000 0x0 0x9c>;
> 
> A quick look at the memory map points out that you missed p2 / p3 /
> mst_2_lclk / mst_3_lclk. Is memory map incorrect?

Sorry for the late reply.

Will fix.

> 
> > +
> > +				interrupts-extended = <&mdss 12>;
> > +
> > +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
> > +				clock-names = "core_iface",
> > +					      "core_aux",
> > +					      "ctrl_link",
> > +					      "ctrl_link_iface",
> > +					      "stream_pixel";
> 
> This wasn't actually tested. You have 6 clocks but 5 clock-names.

Well, that's why it is RFT ... :-)

Will fix.

Thank you for reviewing!

