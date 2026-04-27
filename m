Return-Path: <linux-arm-msm+bounces-104835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMmQIrzU72nGGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:27:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF647A996
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 192E2301B15D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3036379ECD;
	Mon, 27 Apr 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4r7U4pu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZHVVVPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3625372EF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325240; cv=none; b=mfqUxoypuMzPd82JGWH0js49WzMCITMLnrwCLL9/OY1Tg2SZnUJ6CtXL1WFcANH1AqK5zDgKUDTNmsQvSa/lX5AEa6My6Xfhc0/I0mpL6S76PiScuybO4F9NRaCzEYFPbbMs1GUz61SlBNCGqnz5i6X2bTyOYzuk6BM85JVjrB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325240; c=relaxed/simple;
	bh=2dMK2CeWM50DA/cKroIjF36jz4FWNs0gFTQMNXDpw/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0VB8e5CC3VvY7xYhirHqHXGg1zxMnTiQaa96Pfd51hXpXalg/AVP7nAaH4tQKxUJzSaozb6HqpwALYHOIFWp+nReVpIuubDjvElGBsMwt0HqLH1tI43zDwhkO+oXMvcmAyrtMn7UZu0EshW+lbPQqHWexTDwTU0Jxr4bvWGKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4r7U4pu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZHVVVPQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RG9FZq3123629
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0eM6T8roauSQzRuBmRoVn2bg
	U6085UljmY4Iu7OUuRA=; b=B4r7U4puMg2NvvaNTLi/06KcuLeGhcqlfXtBwSvM
	aNzN/rUrNYqn5h2fCmHg2lsaOFYiheaFwtxrPLjSGk1frKXNykvIAkzFQLUKErpb
	ijfcqznKwBem2NziHnaYFViat5FXW6OirNBXw/u48kH+9YQU5IFxr95Y5LDPJGuz
	WzdCXYm1kjhBI2FpJwYJGsevoeid8GV5DJU2Qwl2Y+nDEgkr3DDgQkNpR235XOAz
	if2coBXOPTbUAQuW3jLTtY4uUiNe4/BsNWQYbG6ECflmJgwFremtfzTY/yBrfK/H
	S30M6+5csLFp3DrThA2gKK1W3Pic5PM/RVZw1Lx5NZapBQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgjf91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:27:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2da19227bc1so26079134eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777325238; x=1777930038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eM6T8roauSQzRuBmRoVn2bgU6085UljmY4Iu7OUuRA=;
        b=dZHVVVPQKlxHCmiwZj250keaz+vzvJLLElWM3Ujy0h3ZywOdng6Ftwe0q08yphZca6
         t7arUpGaMsbQJDtmscfdrTQxPI7c2NhgHA7zKjs1Hlie6xKLpHavuqtdVDiHwfmvCmjv
         aBssNG0/c/HtvXP/Ym14IUlE23JZaSxwDGDozNZsQ2/tRhCkb7KYoW0muZUdNplGDxTM
         wtVQPbiQTt2sc917c7R32EfAKlP2HVV4+gGpaqdmxSxNlbjsBCIvss651bPw5M8BliQ4
         VrNRQ43HLPpS1jRMa+JvnwxwCBGVGYiAgi3QxmWft9ImDAPnTgFUD9SKVh7i8p1ouELg
         HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325238; x=1777930038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eM6T8roauSQzRuBmRoVn2bgU6085UljmY4Iu7OUuRA=;
        b=mYVktwFYiH+lpajuOTv5wstiEWVcX9KWUs8aSaDG//EKw8A0wdhImE30eL31vX/o/0
         6sgx9A9WmjpJJv+uaJ3VmOoe0z7jdxNQRjXvkyPzPe4Bnm/Qb3/1yLcwxtjPUd+N/oVJ
         RCvBu2LBEkj22P7qjA0iuWNRvmv36XkfF2qB/pzf5xq9NlncA0eLo8g3NjEa2bSjaE3h
         EaSkuykCARjxOGlt8lVablEc+iAubDzUPTlyyniN+cZGgBVXC/wnxBXo0d346xCGf0+N
         cfr/Cr9Xm4gjTgjEiiIC9nurOhMDgRISeEtLI5QwZe/l4cVgZlzID8+PQmyVf8Lov8AK
         AZGA==
X-Forwarded-Encrypted: i=1; AFNElJ/surJlO6dnq1s2iOfr0Wzgn6E5GTPDwn7TSfCQweVVO2gxEfB78wwUxU0WK1m3LVkKimLMt+TyOkvWcVzy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7UGBVqmOcJbfxfDSizwk1x4a5EBKAZQy6q/Bw4SIZ2nVpGvuC
	n7uD1dRV1iz9dEdgTuxQpABSs+mSYD+UWnevnnRZHDxBdYACkt/LEXJZv7L1xd3EHHsuzVndzVn
	cr8oMuCVAh3nwgjCUnfQrdImm1O3rN7Lt13ltLv6UvcQr+Nb1+y+2LFrnsTNUnvOFd7nZ
X-Gm-Gg: AeBDietq9Qt7JutuJy+XUWt092iAiayyd64Vvp1EECT3oW5vlVc2qG5VUxM3/tlF+FU
	GU//eohjHNAnDsSTJQQU8myGYt4oHCkaI5dBMiScMEprKidIIVHRP1Q7CfCFkBrKOXTQ4LOdDQ5
	ZKOAKhfgO1qbRpbO+uLqpOH53ddCtRMTG30596pwAk9gWwaUC1m2/dBJE9/u2O3a/kDICmw2ft6
	nzixPlyTYT0f9ZlU9M31Z8jQgyV9ppDgPzyjUvKWSIIlObHmihDbbY4SjP7M2wIJfY03A8N63Wx
	PK9AMMGo9VaUnWXj6AKLY4BTOvF2aHlpF/zSkhRdRGhIFnCmOrt274/gE4pjP/anw0cxDJvl1Yk
	Y882dpCk8hScYlp141xv38juFlXg3fqv928g62s69ysObUTRVVu1/hEiRrtXRQGpPMEuUeJlUtS
	+J/5upaP0dZA==
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-2ed0a015a63mr320152eec.12.1777325238226;
        Mon, 27 Apr 2026 14:27:18 -0700 (PDT)
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-2ed0a015a63mr320133eec.12.1777325237697;
        Mon, 27 Apr 2026 14:27:17 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09f8a909sm690956eec.4.2026.04.27.14.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:27:17 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:27:15 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the
 RPMh NoC for Hawi SoC
Message-ID: <ae/UsySqVB+UaahQ@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyNyBTYWx0ZWRfX067D7cCeS0Oi
 qRIe+NK0rEO/XVx+HM+1v3lF8vT7DG1MGPjudAr9AIVg9s/u8IGXuB4fo3YEZkV+1qe+SccmDJ3
 Wf7HpmmQ8axfBY425Qrcde90YiunUtKXfweRh7Oel05Z4S3Wti+ppOKKdLnSQ5xlWUCCMpH2Lw8
 qmOJSZoAXF5wGKQp2yojp2ctuL43Vz8KIDslNJDxmtGIZ71k/hdZT6SdpG7H3iV3u71u3AyCK9v
 MSyS2bZ/6AM7PxCSkCxFkXvSiabcnkNkP8MntcIAnyt79XGKsH8BbNeGiWQNya9SJwtxY2NsM3p
 ySQK6drVzLNghb1WC7RxUkqxodAfzOtnxnEhmzJfqC6TtN9IUnUKPgq2fKbOryztvQMK/qA6c91
 WQNG2lTwTZL0Ub2W5UNKA+MQ3+W7ogzqVTMEqGenIIdOdMUwTd746oTpxORkX5gsf9fwE33QcFD
 1g+lUmwpwWvQW9/AOjw==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69efd4b6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=leQ04dn23ONfhV9bpxQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: yh-4g1CWraybzbMxEPkP2gqxWZx3xzqI
X-Proofpoint-ORIG-GUID: yh-4g1CWraybzbMxEPkP2gqxWZx3xzqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270227
X-Rspamd-Queue-Id: 06DF647A996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-mdtipton-lv.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 09, 2026 at 02:01:37PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

[..]

> +#define SLAVE_IMEM				9
> +#define SLAVE_PCIE_0				10

We're missing the equivalent for SLAVE_PCIE_1.

Thanks,
Mike

