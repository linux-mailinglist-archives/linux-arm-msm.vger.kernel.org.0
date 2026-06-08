Return-Path: <linux-arm-msm+bounces-111643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +zryGnUxJmojTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A416525ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:05:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GQ6dpV86;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RmtkK2tI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111643-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111643-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C334330073F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE7D2F7EFE;
	Mon,  8 Jun 2026 03:05:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AA25D215
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:05:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887922; cv=none; b=Vx3tau6K+tZ8qnHrqCT42alWKcgqF+BSGWrnIn4F4InZnX7qyeXbx5OEH7DJ4CCcO85u47BxB0rk21GG7lxULn1FN2vZ2pjHATbT1JMcV54j9ccjfTUbKJJLZd/BkEG1pt4byx7QMZuebmMR7Cm6LSU92dgd85WR9svlLgqcE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887922; c=relaxed/simple;
	bh=ZzO+xkhtMNBw34NZJknOUCTuwjS4aaa3c56ReHvEvpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAl4bc6fK2u9teDV00tuKoqgU3E2bLsIY7TookftQm7HgfUDSzykygUKyNYeKb8Fg2tYqj5tC8zAXAsVvMCC646vpYL4w+TStGffgJLHc3aiXFXfcT4rLfEJKFvvOvAYjXXc8JnRSPxYhfGKYGMgut6OnXxYO3QRfnZJRGyqXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQ6dpV86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmtkK2tI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FNjT2023416
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6fRuSMi07wfs/X3hr8ERNVY
	8T5EEOC3T+9jm25RzpU=; b=GQ6dpV86/pJhcn7NpdSOIJoNuoltluceU51eZ0Ae
	RvZAfnNHBx0rm18CW+smYpfsfEjksURe+mleDAb2k99IpeHdU2hoR2M3iQr5/smb
	/mIYzuKdMpX7Ch5dRTaIHDoUZAOtIlJF/1MLJ8Q9YneV/R9+AcLMrnx4GfknKwug
	ujuhUMTBNa8mKUtDFl9vET8Eb+S5ZLy/lp6ESYsgvselHuC0HVuTlDqA2W5ci/sa
	ji5wLCQaKG0DIW9hzxptjylAcAhTya2seGlNuQDZ2padE88JBJXAZwemEkd7/yQ0
	waagx2MC4zOf3f8yPMWdVjGLB2yzp/vZFs5nZUIEZHKmGg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdkc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:05:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59bf1a43cd9so9704532e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780887920; x=1781492720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=RmtkK2tIoICZDU11s2uk/zAJN8xpnkobH+IjmSgsP2JEGp0v1N+jlIz6vvdF6RQ6+g
         zmcQrBAQdrRL5tbOp67iVCtxmp08OqYfu7WoL2qsQDeS9R1uzFcbAYpfy6OcurtLrUhs
         bEj4s9LnOeB4eqaq9yY5/99IMIoFXIHduOatTQqt0KkS9XrO9sMsdJg4b5SAEdZ9YQLX
         jBKqljaeRZafEBQIZd7B5Q+WRhOCskbc19DNaxHkQj47KIXk/BE9jKbsB3wsmjB0/n1v
         /wAw+JEdBlIT0nsaqwRNW2UuwgdSbQplBTjbx0AhwzOeuWl68DtIbsuBRaAyb0/UpnZS
         Pzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887920; x=1781492720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=JmG7axCNJ2sOgFGCwn6iVsCAetxg94ZGTcK1pue/gIHlWKrEbZsvBA0mzu8mobk4eE
         OppJDfQ2k29SDN4ocqh9zswrCvtjBuV2i1Sj04MK+ehDbLNvoaHV2Rt/tDRfq17jcul9
         DayyxTRAnkIa4v1UqqmT3nEBxULT0HLYpiyRmi5e0y7T1A0BGB4aWYL7i/DFhJY9vV7R
         BsruQc5WWRXSWoXFAig+EnTmhv39jL2GzS7Vnf4b4fy8TmIoNPLGjnYoXpfypDpo0KLE
         gYH39I5Jx2imjduqhUmq4kgMRmPkTP7ybiO/ldidg45RBFcojEBawwnJ8fbsEDgCxSSu
         bYCw==
X-Forwarded-Encrypted: i=1; AFNElJ+V9lMylnpyyEdSn6OgDT+70FT66CGtVL4LrW9E/mTqY/puyo4zdAVLRvDXdWUIN+7dOa5zHRcdWo33puQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOnymCdb9S+4svI2F/HLorzq9EQcIUGDjT37Y+UMfN+zy7IBV
	dbw9S+gPCUABatqYeU2E6gSnYwAukKL9WhvtYAyAwsDS/n+laHNEfHJNWQqGgzmCawqyhPYPc5f
	Q2hls8SR5B+v1R8hHmLpFZ0NLMZAP8ty98Sxjo7rgL7AfvukbAjJSQs43kZcwtoX5HfeV
X-Gm-Gg: Acq92OFjWA+/DV9k4pfPT5Eg4ItgTZ1EjyI1zXWd0ezuQ0+5L+5iu8J00UiD2dwsqFW
	4OHgqV3TDle4dt7CfVcxGambHKnP5r1ia7jlyK2Bdr1PdCOG5OY4TSKdVE9BDyg3yiN8EVw2ku3
	fgqmuBB+d02S29szUd+woIXqvVWkvXEbt55yJvi2Z9Xo7aFgmV9jDVYnzMPkSGSzHfHlNhfucv/
	DjwqXqNa9tyXUJ8zWVo+SQAf5aauvUWSgIs2NAT5aZo/P7KqrJWSvclmzaSvS2CmFl16fB35MCe
	JE7vZY0QkdBr/bgcOxTG7s7h3pDrcaPcNf5ekx0PICDceBWnae14NOe/K1Tbt1F1ciTrXPowSQO
	ziuITJUsbLo1yWM7foprwSbForaXpH6rZWdol4y/NFp/S/J9swXP2p16fy9suGs9b/qu7gOqklf
	vRNYIukOvT5b6Nt/LTIsW47ltTLJ/kdo5THFR9/cSimZJY9Q==
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362630137.12.1780887920104;
        Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362624137.12.1780887919706;
        Sun, 07 Jun 2026 20:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3450395e87.65.2026.06.07.20.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:05:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add lcc-msm8660 LPASS
 clock IDs
Message-ID: <3zfrwk7msdfum7kmmao4szpie3gtcirp44kjlpcweik4tnfjai@tl6n5fvxircs>
References: <cover.1780148149.git.github.com@herrie.org>
 <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNCBTYWx0ZWRfXzbuxLKkDcQ1b
 JFTVmOQLvy+Bsk2wkFFmzihizullLM0OQkkjGLWG3hnRr5R02I+CHgfj3fUitVCuMBLJ5+CyQmW
 TzA/7TeW5LVwTz3BeOGFZC7dTY796TkoKtd/V66jcZw18A2D4CuVTg4C/nMdwqtJT97dHGhvGsA
 dnlpHG0mDYSLYpWdSMvrfirKdMizpdkU0tXMkhFC/OexyDJ4WutUJx7q/Ug28ZALsD+tcOmfgSH
 2B5mt+VlJdBXkaamKWy9O4WtdJ2PBP0aP18V1mST6HtZVMCx28OoMBlyzMR2nRx2NGuwECducuG
 xZKkbyQvce4tbScS0FERaUTievWjxjcIGM7TBFllvqvi4x6SDAwBZ7bYot7zWPFlZELBDwBBgJs
 3HEBowuEIYV7YJrBrUCKw6Qk6rwAJaAIa8lHbx2H6+N0ghBqDOGqDvCRxjZTbyBf3vpJOySZNYl
 iB2xqRLnYjC9TBiS1cA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a263170 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=cTwmTnRGAAAA:8
 a=PfdHpp1dQluSkMl_sowA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=tNoRWFLymzeba-QzToBc:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: iCSFvxQd-UxUmjACcwCYe4DM1BfoXctO
X-Proofpoint-ORIG-GUID: iCSFvxQd-UxUmjACcwCYe4DM1BfoXctO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111643-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:sboyd@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3A416525ED

On Sat, May 30, 2026 at 03:59:57PM +0200, Herman van Hazendonk wrote:
> Add the dt-binding clock-ID header for the MSM8x60 family
> (MSM8260/MSM8660/APQ8060) Low Power Audio SubSystem Clock Controller
> (LCC). The header enumerates the LPASS clocks consumed by the
> qcom,apq8060-lpaif sound card and the codec/AIF nodes downstream of
> it. It mirrors the format and ID range of the existing LCC headers
> for newer Qualcomm SoCs (lcc-msm8960, lcc-msm8974) so the
> drivers/clk/qcom/lcc-msm8660.c driver can be hooked up the same way
> once it lands.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  include/dt-bindings/clock/qcom,lcc-msm8660.h | 48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

Full bindings, please. You can extend the existing qcom,lcc.yaml, but
the compatible should be defined and constrained.


-- 
With best wishes
Dmitry

