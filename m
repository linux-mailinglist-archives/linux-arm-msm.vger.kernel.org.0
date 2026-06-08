Return-Path: <linux-arm-msm+bounces-111648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RbcAK4o1JmrmTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:22:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A56526B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:22:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HyVOYLIK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g2IH5v2y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CFA1300AB3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D4348C42;
	Mon,  8 Jun 2026 03:22:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68B31AF3B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:22:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888929; cv=none; b=ERcyiPW6qVVNdVveLdyA1hgNQuPvwhiLNLzw2FAahToxQYZtK0aoY8ViFjqc1my0DwUeBROjkHEpw7lU6sZnQjfOvOfu4lASS2+ifSCsvx/PfAiKbN18vXf/XmE/dpXcT9Zgr1vRFVOzufKNCewAm8WuzfH0bgEuZYziVPc9lXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888929; c=relaxed/simple;
	bh=fx3r25rLt6VUivKdQcgb2nSA7OkctUBrtqGABis58ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgsvchj+0beIpVn+AI7YmITzHBGVIMa3FdItG2f994ObSjexS/HbkbeYMIIP1kgOceUHcEXziaZHTJVrJjcqcZBVLKjlqGH6vNXzbZxlrG9flZAS6ezY3gSpTtrixbq433Sz9PptIo2QNUJHn8eND0jrybT9WNzfrLKs6IiS8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyVOYLIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2IH5v2y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FQGp2023487
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdGfDGBoMgDf1nHklX0qM1Jx
	g1iBzheuZFvCVbKMi04=; b=HyVOYLIKEIxJo/YbMRsnXQSMvxVOzUdw3xKH+iB8
	h9JPYfImIPYTUtCUaf+h2VywcteJ08GgQvnMclbwCltvFiMxr1muP0zv9RwACChG
	5LdQGaBxuYhqTXKbRE90TsNx2MetS9pe9Y3qYGJIL7z/k/11gGKdjFRVSK8lqPVN
	mQPgW54svNRq9Ea3rYfUZhd0OSxuhHjbjatp75y7aI1pa9zU7dw9pS1bkgR+SWaT
	2WdYzKog69jaq3vds0zrWCF7etq7eB9vO6ST/S83m6pCciA0M03szL2+iCoE/HmD
	JuHxHrAyEZxc4PyATtCg6pQuxzNzZmSCbbFXaYZ//upLMQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdn85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:22:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51758177935so28864901cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888927; x=1781493727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=g2IH5v2ydCSleBH9e2b4I9m+s/bgVqhM5yV6zuJlsA/UZVVHaBNOcAFiByCpJxJGjW
         Z92Zk7xHXcB4QaWWozrKJEpcxpYR0KJhZGRMlS+SQj55k7AI5+QttybdS0Jd+GRldMGg
         xmwyhop//pd9SQFotjLySJBVlWJ8A1idtK6hhP2dd+On51vp9RRDUFV/qBEfAfz/Zcdy
         cQdznzcaMMp06ZcbaPfjvMnLFkBB1n2FAoTSadFV1KkG8Xph/8394j421UspuPl3CmYw
         zUdXH6faPxo4aMSZlIqAWyvGcsVpv2OYLh8b73oKT+O3IUEgXp5NhqUXCtnKwsIk7+Sw
         wCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888927; x=1781493727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=TqzRJx7RFAh+qddpLTgPbMgbOhqBhfSQf7s+jx2FJS3LeUHWApKBMQ1mm+aDc9BWWP
         L2Z5Fcaoe8ip7EyLx75GE8eUBOH2ZMeHHusiqZu69Jt5GvXnWLPlfef12YZT1mktI6zX
         7Xfj4viOYqmiiIF9PsIr0Z5S2j15+ziSC4xf4uPAypBbRcCiCPlvT2tBQWaGXQpjMdEp
         uyyY863zhmii0j6agAA2iNevSkkbyySpDF5tOnwPDjgIzIosm1Dt6uQbC5QrLjCgWgBr
         U+/7pdzI6trUZPnZQyuZ3RHMZnx24UAYIkoa3oY1Vc2KVcXctZvR+AviLD+GRPIe45Aw
         T4XQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ve/7+wmdpdL33CrbUq8Ekm84xobnA5d0PFvdOt+peQPUSXs/3/tHK80neLCGBSdbd2dUVnJ2hS2H9DnYI@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0EnBVlIjw6i+H/BoA9Mc1hIwn/DN9H+tTMR9xtY/oVlqhmnF
	DEddObi68ZY5shGBZBRuSbirZF+IQ2O2QkTgURuDVzB9I4IFJgLbeqIOBiPukzPzaxW9lekRANp
	6x+MhoQfKJzF/TjNxS2GTqW/kSVLjNwBgd/we/icD8N7nkF4rSRuX4zYSC1ZAa3rt/lky6hXXem
	zt
X-Gm-Gg: Acq92OEOOPfo/I4OBBo6MEclv47/rqVZtFq7txfbFOPkm0jaR6ZaZvql/o/OkL1aQZv
	hQZ2XBkM7ykjtvz2I4K8wj0URrMdSO3eyCpCPoJPMi5ExjL1mkavsQ0VfRcESEjPVoof82CHICv
	vE12+gjum3kFBdqP5zetF2hdsAkyHf0vfFmO1QcdQhjaP3EureWwNJ8F2tGheGSIZIFXENmeFjp
	pl9s1rBonkLunpxXZeyC8C0/fKQs2x2PLuxhAJ+0aj4aYFXz/UY4LvpooWStNMUHImp2pQmhxfV
	L1zMQ6EcJHUIAmKItRKhCBNrmwboPPVTR2InoQ4EhbkmmWr6cZhlgnbp801wQF2ahNH5UVT3ZxG
	4d2TBP0ULx0rrIfwWv4g3O5tLq8NrME6iu4ixH1xcgwRK6OVlGK8ycryvKkE50mxhKzsBAXzXAG
	veAymWENTt0rDToBT17Ets0u3VOzhLXbF7rBfI6H7D6d714g==
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628481cf.20.1780888927219;
        Sun, 07 Jun 2026 20:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628351cf.20.1780888926767;
        Sun, 07 Jun 2026 20:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm43897391fa.28.2026.06.07.20.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:22:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:22:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] clk: qcom: add MSM8x60 LPASS Clock Controller
Message-ID: <3j6l3q7sxrwgok65tgkjpkwb6iz4h67rdbuzzv3iwopc4u3zag@qrnodft3j55s>
References: <cover.1780148149.git.github.com@herrie.org>
 <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNyBTYWx0ZWRfX9XYJZ/lPGktA
 w0ooQMUIo95XqDPc4RatHhWWoUT8W0Bd7+i8RFsflgvvoB5qeZtEUNMFOaFChL6KiMwjFNfwTv4
 SowPRR9frLiffiT8VRU+8BM5mQDnnBJODi2KbKe51N/fWzHr/cRYKa3gSNrPP4GEW478DFGhtuQ
 KSJSUSwj4TM8PLqD64Mbd0OqPm7/v1lgXPemIL1HdcW2mrWA//39lM8A2dWw02sKj3GIONc0qvH
 6kPWmTAmq8AfLeLtgPA9aGZfL/sLFliV7n1ToAD6WKtIKdB44Vqs048tRrXlNBeYLGtDab9OJ32
 a9/EeCkWiaD30UMlgj/yGXujrPufnmFoyhvBmEh9HpNelBfz8gWgbhpGGJaPAcXEebHkT0dP6sd
 TCDlHEkMLfpECmY5VDDP+8HtdCcmiwG2OTBnHj1FRuCixOODOOm8tY1TJnD4pVp+GEjfOBF26qn
 KtWVnnydQIuZElOjRSg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26355f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=cTwmTnRGAAAA:8 a=OF7aXn1xDe1HAw4HkrkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: aCUQ2VDbf5RAO6jKghK9KM-kR88UUa-F
X-Proofpoint-ORIG-GUID: aCUQ2VDbf5RAO6jKghK9KM-kR88UUa-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qrnodft3j55s:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:sboyd@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1D7A56526B9

On Sun, May 31, 2026 at 06:08:59AM +0200, Herman van Hazendonk wrote:
> Hi all,
> 
> Self-review (with Sashiko AI assist) caught five issues in v1 before
> maintainer review reached them. v1:
> 
>   https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/
> 
> v2 changes:

Please send each new version as a separate thread. Don't send new
iterations as replies to other threads (or previous versions).

-- 
With best wishes
Dmitry

