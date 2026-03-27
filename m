Return-Path: <linux-arm-msm+bounces-100337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAkwMkKLxmlELgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:50:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72592345981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5243230EAF4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E6339890F;
	Fri, 27 Mar 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQA04hkK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdiHNrsK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9D220F49
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619121; cv=none; b=JNOTJqlcS6ix/tgNdcS2M9LiMhd7ecgHjQQ+b24Wmqpo79zcGuuVC1mRv+q8tQPRyZREmCh/MY1JjUlILmFnmuCOqBcoJyirEb6MGNfwcJzBedA30pfuj6pVpEY/1yZ1rYNKjVHNeZyPzwcNqAQ097s44kLUUkUNkUW4izIdNvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619121; c=relaxed/simple;
	bh=DwcUac76vV09RAO9Jg0ZSLv+FZ3B+zJ71gF7JbdPL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ2jF34eFVEOYROZ5qN0PFjugaqsWGbsjKgwzIXsPlXI+Sbp0Z44rNvlNmtrbuBRg8kDwvjOeMeEcBZRa4yjTGYom4eKWq+XhFWNa97ub7VhGJYQx1bnSe2NL0/80dbhSagm6U4swB/pZLL6X9U5d0JlvH3n/LnvxOw69DxZhao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQA04hkK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdiHNrsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhVWR3701500
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XoentRkvS13HRF/jsn+wflQZ
	jGBlnUMdtdu55OVBkF4=; b=JQA04hkKdNHWKzRrGCogVYxXYRgiHrJ0hToiEp3u
	o4hgKW/AMmARNDzGoau1KRj3t8ZZgMXESNSmW3zys4qIxESWOsw52zhjN0PJl7Oz
	rK6FOEeYiGEOs4saPVuXcj+1PQtXQC1k1dHiJyIELOGd/3E9Tv+Drw3Bllu8JEUG
	fWBSY78qx75QF04MvzaYuNvXhrL2VGP2yZgYUkGhJ9da1A85nDHJZTcr2nwXj6qZ
	WCimS5g1pn02PHPAlf9LvEc3kLjjqOHPu/m1cqbJlDaowmJ8UdociG7CviGBvISv
	Lr9SEX0Cs458i2GkHURaUWwZcr+11GBGshtvuPC+RB+qmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx22xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso65732391cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774619119; x=1775223919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=BdiHNrsKZjUKK/els+9dW35kh0ADht+DwQCunO1o1mup6+qPMJ32INqiY5AEJ/W8eq
         PXURmvtA1sTGQSigfOHkK/zt7yut5Tg21U0KpmyGhLm2fVFEgWK95csZhPuKLpv1fxNq
         +ekLpBJiAb1aDNgrl318Sbf21bXogRypVI3qcOOs5yDlNmFI4bjTtQ0X+/ZCdZ6YmlAJ
         3lBuJv8lyxUvxKUr7B1tP+WIorPJ+edJ2/L3mNIH+U2cEaTWiuB1m3DdaHngt6wqyGg4
         9eZ9FTIaQTVOKGu+WNiYws7J1aX4xHT/bjn2c+ekIN5ZuG0zsU/yEAg/N3EA0kPp6F1+
         L/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619119; x=1775223919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=Rw48NlIjkfSx4ZSh4gpD6lvoyrdINi2HeWtAB7WJsPw2Y+MgXIeazePSq0ffFwGfks
         pTe2/R0WD781pAjrVSM3O46SvbRSamDhFL/APJ9owYJjxFAcU7Dsb7PYJaEjEaMFiXVo
         Nyhvwn79lOBdEkclGvHoSJ/HubUdGkfXjnKcMgMN9T68bQFY70LrPoEa3k7MUcBS0S+3
         WL2iBmPW0vKPdle1oM8RDnWfU9WyXpnxhD5wapJCXgrU8UjywIF0cKIOgnq1e89DZhm4
         iA30UZqXlWsHyYCKZXS73ORqKjbu9+Qu7ehupfZ56VZS34rombSfksrJKV6DLsHPeLG8
         /sfg==
X-Forwarded-Encrypted: i=1; AJvYcCW94TysX4byjw8qmgAxSGzR3pLtMKec7BJIcdpPUn7nSgiqtkyOtR4t1qIpf/zvIeHSRW8/4x41v6V4DehD@vger.kernel.org
X-Gm-Message-State: AOJu0YyTnLbs6Rz2gpffm5fE14RWwSqVcKdUyJZ2sWRzQm5qvthOeOKJ
	uUCtWXmb6Qdc6qxHtVuNwoGxUGSO4hPXlVVrvHib4vB5tlkDSn+Qh8Sdy8Nxh+FhiAJ4HOY4vE6
	BEJfXRFC85/vUw2keBHNTqcR40+SqYjY/HTJPei7im+zIV37zN1tAdBBg1tmZAxoGkvLu
X-Gm-Gg: ATEYQzye5vHoKnxrZB74h/iN4p+S20ftJD6h6CzO+oF6cdlT1Wh1D+a6d1lwFeM7Cuy
	VALjGpP0dYHOHkd7NHpkaKrBVdEl9Mnbngxkn4aP6fyguomf8q/FCcFachuQGQcTKesAZQH+Lnj
	MYt33LggsnLYI8ACSNvLUrOjGG/LxZR5dSTj9BTTWofmqATLy2T7G5ErQL0WuT/9NZvER2Blh/W
	Cu38cKReyEiya6LcAb0mGLV5dVR16xVV8dR+AN2rYykAiwb+2ThAme+tIZljCY53mKcP2a7mto2
	xMNzEDbYQHatr8Hut/zCJrtsGhRZ8ejHfo12HPHVZ4KWfxIPt2CgDesNHl+DctXrdEayPY1n8Vw
	BL1L+VvQs7MQZ8T7sojFECaMUV647/7Jt6Q==
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32993721cf.45.1774619118782;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32992831cf.45.1774619118209;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df85csm21164885f8f.28.2026.03.27.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:45:17 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:45:15 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Message-ID: <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
 <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c689ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vx3vbEJZiE0Yo0wITGAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VyDgDdiLw3LmsdudKwrP8FR7y8J1Dri-
X-Proofpoint-ORIG-GUID: VyDgDdiLw3LmsdudKwrP8FR7y8J1Dri-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfX+s6dEENb8Bd2
 EUtcBxi2Lfff16VRZ+OKcbCuhGgr7jPKKRFIxrQuIAAvcnzOBzn/dvdd/elp8XsAcqkubZ96eD9
 Qt2fjPoB1DoOjuO8JlvjtT+88a3GRRSnTYIL96cWfVCE3n2VzMXDuIr/kHqKp7URo2emW6+9w4Q
 EV7AAdLi3/5MkGQCntGXPJa1AFERlg0fJJz3thISVI8CtMtFRZAoswJf1TNXsbXeIa6OXXnhYWF
 oo7lVQ8L4ZTwoRSFZluxrvSoXTHCcLgvrWJLSfIbVgLZPw0XkVOzTPJdthwae3Eoi/Dy29L/gld
 k7M+LKfWbcP51pzElFxlQs3MOROotdixxxbALGVOg0Fydz1vqTVsZVyRDCJ3CRO6BYc/mHSIXIU
 zZd6ehRGb8wdfUy+z0HbTyaOksoOS4K6btRZlltmdzJBmPn84kVuVyNGBhdwjvi0Kek6onLmIas
 nhqqOb83ym8KhSEgA9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270094
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100337-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72592345981
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 14:37:17, Krzysztof Kozlowski wrote:
> On 27/03/2026 13:13, Abel Vesa wrote:
> > In order for the GCC votes on the GDSCs it provides to be propagated
> > to CX, CX needs to be declared as power domain of the GCC.
> 
> I assume this is true for Milos, not only Eliza.

My understanding of it is that this is true for all platforms.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for reviewing!

