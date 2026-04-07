Return-Path: <linux-arm-msm+bounces-102207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yArbKTgt1Wli1wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:13:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE93B1925
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1B0E306DA5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 16:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39223C870E;
	Tue,  7 Apr 2026 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKwk4HPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZM4EQrrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28E3A7859
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578304; cv=none; b=qY65saAECzsEKQ0bxT1Sd0/1tSJixU6DE3oqrxAH3dN2U0KGyLO/7i1JbLFeMh+ZVRdQ5rhm8PrXW9zJmAJrv+KCgde7IjVK3+FdVd9M3rMzTRqUL1LPhlwEMN+EBWMwPtwJ9N9E1p4Sw9Q2pKpCujQYAjPL7zN9ack6dyMlQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578304; c=relaxed/simple;
	bh=1cQAJtgQmFluSDEROaDsoxsRqFAOZvbJmchOqmbAdGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6qiRk2DR4i+/vqik9KI8Yvcss2ArWWPotNzzqQFmYedAZO4RE5pdBqai2eJ+uJPQRlotsTSY0sbOI3TGLZAiMV5WzCOcD+ZEUCBn/urzB6Kms6cBh6uLA+XOSaF1pDxjgOKmL4o7s+fMUfn/wN94E9qeUmm5M+md7PagUe6AvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKwk4HPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZM4EQrrv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CxsxP2580027
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 16:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNt3t7bGHnmTY4XQLsyQYIDe
	23zUVnDOM/yLMp7Jz6M=; b=lKwk4HPWDN8Jh6mKxHtwtmsIkQYS5NCmK631tWI1
	r3vGNcZCUitnG8BkKgQ/4nxeG99R2KHtNzqF6nusOk544F06n5DQcbkUFMEL9A/4
	+gi7yqNabk5HP4M3CNrawA8DJNAvIQDRvoH6MIDcd3lgqvo13Q0y9OubSj79saL0
	VAZY/SwwubKz9F1Az4/v4j+5MCwjhdXGDCfgsOR3v3ZGm47cgIe2JCcNHTyfYHNE
	+yX0ECY7R7Clzg8t13tVRFzjEANj6NgIPze7UjH0wkj7wu6TbmESWycNp9npARxN
	VvSv4yW84JGA///lUPm3uLernh+KPT/MZRX6zPKEzZb6SQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf3jpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 16:11:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12bfa367189so29612878c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578297; x=1776183097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNt3t7bGHnmTY4XQLsyQYIDe23zUVnDOM/yLMp7Jz6M=;
        b=ZM4EQrrv/4zGEoT1H0BHGwUwV7WLp4aTTA+TjNTPHhmWO7SbA+gT6c66job7fgWxY1
         6y7aJbNAozu0XD8lgZSOgMZXLXxMYJgi6oeckKY7H7xOKRY7pYbTnwK3pGyGCNsgH1Ku
         cI7odln8mgOAXcE8T6FBvOh3ZW+9OdZH062+DZ+X8zumW7leuT/iFGkDe31Fe3PGJ04z
         pyBeAkuMOB41s2XwdNIXwFv98/6zgc14XG4oyytqsb3ft922vtNOea5x1L5d0ihga7MS
         JD9kbScGEkS7skdNUlwR9wmxFe1R43fJpfpbhBX2uHIPExay3zvCicwmC6AUnimw5+bR
         YQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578297; x=1776183097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNt3t7bGHnmTY4XQLsyQYIDe23zUVnDOM/yLMp7Jz6M=;
        b=HU1HfuyOHsgq8Kk8yyFnBh7MoAuQ6rIMqByxyEl4fWDVMb/jQINSXvkpHUOBUH9E2S
         n2FHRS4TBEgLp4QKb7UOifcdQnaQfYpcl4KWEu3R2KgDqNgwPxUUudFZpY6gunMJ8FHK
         pWuyZvDIF1EZfpQD7KOqGy1EhMqzhF8UNIIO37XVRu99ztlZiI5CIBQfeWrP3QmXCSPP
         0GCQ936y3c2Q4MF7iUdBfhNB/avyD6UU6Dqu1BoiYzrmwygeUOQzRacLgZmYeETnjLh/
         aKAOhaSF5P+RwfyTCZCrH0ABG4ZyFP3+hKNnJQaZg+1wz99XaP1tJwOaPa1+AvkJBgXi
         EnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKumesk3FP4n+L/tmHRNkTC4z6B8jkM4pjcSgmTHeUcsrmtUi1l6n+fU9Db2QqQxcD7sOWc42giCxVkpR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhv4zSw/hFPEOa3FnAeu7rGvEYThK0dzPSiFeZ9jILa3Kn5JI8
	afhGrP21MsGveQ4rATjlA3WmDJcSQnWj2QzohOlcjglkUwxE2XYG3rUDYP3wy+8Ga43O0TBGV/o
	btkHDeqHrrPCYQWyiEVXNlsiNm2rM3654NS06HC6CFimB2YW7lOHoIP2XQZDwkE4DjO6P
X-Gm-Gg: AeBDievLMjhoq8l/Y1ozLoeQFSAo4wydLZmhoCJI6ykn/r/QEycjl/rcLGataI2RVgq
	bQ869vJtPtDxeHCNE/62z3+dPh2oeydPngcye/UzqcNG5mEa/LCYpI0EFJIaJPMS/SXU+IU+9V2
	Ry45qhIJhqsu4vuTIsCUyV4WEiBuyXWrDmDeMmgtDNFxncGTwwEGx5YCu7546ULt5QBADaZM+ch
	ZuVyQyN77tsmZ2KJW/nsR6Rqwkfu4Hm6fS4q//Vnd5Et9mJfjSuI4YhkUdDvS4oDKckSI61o+Kr
	XCk8Qbi7uJ8M7bsQg6u78pUNxoUpaGyFA9+I7CLCSAq3vCd9KfbavTFrS8kbggGz8oQdDIS5b95
	BkCCkMtwWWnAqU16EIeJ2JnA2HgspBxoHWJFSY8nApT3m33LnaMB/DbiQ514s7PwbQtI/EwFmde
	U=
X-Received: by 2002:a05:7022:ec17:b0:119:e569:fbb4 with SMTP id a92af1059eb24-12bfb770b25mr9183236c88.35.1775578297052;
        Tue, 07 Apr 2026 09:11:37 -0700 (PDT)
X-Received: by 2002:a05:7022:ec17:b0:119:e569:fbb4 with SMTP id a92af1059eb24-12bfb770b25mr9183216c88.35.1775578296453;
        Tue, 07 Apr 2026 09:11:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm14659495c88.2.2026.04.07.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:11:36 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:11:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Message-ID: <adUstp6A2WT0Dvz7@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
 <20260407-prehistoric-inescapable-loon-cf0dd0@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-prehistoric-inescapable-loon-cf0dd0@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MyBTYWx0ZWRfX0Y1vQhojUsQy
 /reMfEAYXIVlpKk8hwgp8VxEnL0BuG85LEQs6NWEN2akkq8NzltYHeyEUC0+DlHRd6XlVhUXg+l
 lbwLryrBuGm83vDTxFMc8N7u8AiieV5lpEYGz6kkwwDJ+ffNoSlVgGHr2b6YhdYMl2CWgt61gfb
 LMKdY4bYCwscNWgQf+/Rz78IYEWU/P9ScsiFgUuICV/4Wmhux0Oz3knNjsSkXAfnyNYJCb5ynaS
 0sjP0na7r72uqeK9hfIvk9Heh/ZLQ8lDML17vDtTtAzA29M49gG2mzFhakzEsubnfrnUENWL8gT
 e4XJUXR0KR94S4rE9IN/tu1CicS9Ae8PXAjg8V7CvD33eEVhfm1rH6gOTss37E7RJlw90RLTI+Y
 eWC+2hEvjLnIWohgJGPxqu2x5uWyxBU1/CA+vqED2/9uO4AFY8k6A+Cq3Wsmd6Xrz0SurGai0Cl
 oh9O1vRUt7G7fWsSpzg==
X-Proofpoint-ORIG-GUID: Wa_KxiYjen6RiOh5XajJr8TEdXrN-EtB
X-Proofpoint-GUID: Wa_KxiYjen6RiOh5XajJr8TEdXrN-EtB
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d52cba cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eVgXn4zF-6aLp7D_HksA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102207-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13CE93B1925
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Tue, Apr 07, 2026 at 09:42:09AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 06, 2026 at 04:04:41PM -0700, Vivek Aknurwar wrote:
> > Document the RPMh Network-On-Chip Interconnect of the Hawi platform.
> > 
> > Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> 
> Same fixes needed I wrote to Hawi upstreaming lead in private. That's
> why I gave that feedback (privately) very fast, to avoid repeating the
> mistake. So since private feedback was ignored, you have now review on
> the lists.
> 
> All Qualcomm previous patches are poor:
> 
> document the RPMh Network-On-Chip interconnect in Mahua SoC
> document the RPMh Network-On-Chip interconnect in Eliza SoC
> document the RPMh Network-On-Chip interconnect in Kaanapali SoC
> document the RPMh Network-On-Chip interconnect in Glymur SoC
> 
> Made by the same people.
> 
> Why can't you look how Neil did it for SM8650? Or Luca recently for
> Milos? Or if you cannot look at non-qcom commits then Rajendra for X1E?

I believe you're mainly referring to the lack of "Qualcomm" in the
commit summary and description? I agree that should have been added.
That's understood and it was overlooked for this patch. Most of our
other patches inherently have "qcom" in the area prefixes, but yes when
that isn't present which should clarify that this is Qualcomm-specific.

Thanks,
Mike

