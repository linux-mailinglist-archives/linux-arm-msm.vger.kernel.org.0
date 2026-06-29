Return-Path: <linux-arm-msm+bounces-114987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DRAFMYtPQmph4gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:57:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7EB6D91E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:57:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o9Gqrv45;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fbhj6r3M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69E8F3042917
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01FD369D53;
	Mon, 29 Jun 2026 10:55:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676943644C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:55:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730542; cv=none; b=slEvMtaQ/IWz9jbmk0hPQvQ8n5t/mdtvcjN1Na3hoWFhPygfoV9OvTtroKvFXlCJEk0EGBtgnfhGvyamwAHNXPXyC49KLw+hnLIbUaT/rVAERR1dbCOzG+a2S52uAIiujiMtgrXZBJmAqweK4ZB5c2m5U/hehp7vk51rKuqKJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730542; c=relaxed/simple;
	bh=lIBETdguojxD/3hcidUjQKcTFlkGNY5+j8vydzjjxho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moiq7Rulc3MuU+aVMXNZNlCy54fZI/HwQnuHU4H2t8Sh3I+bGVGm5BQ05gSA6y0+LTFd3Tu1/JKhQiSgFZ9t88w4gfSEu3AfjwzmJZOntUsVgrZp7c2wOGGCt2Qtv8bIVAdtUi0DGSu/ZPjANf//wITadTSYca7AFnu32GhknlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9Gqrv45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fbhj6r3M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCUN2647686
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Db4jdjnSqHZXgefBgI/pneBX
	20fscU+O//6vunreTmg=; b=o9Gqrv45XXFyco6x2BDWTwmHC8tL1CeiMgVwKaBa
	Pnnwg6hL0YHeXy1HmiWpM40KNhIXNwhyjZTXembYjwkq40TvmNdoJgpnVdtjo03S
	GKhGTs+5iaCZpbB825PAauYb6d+T7/UGMKIYikgPwnXMgrWBcJxvJNMo9En+bNpY
	ZZhmKKhtsfDrdauW8xKHqJxtn8z8J8i1ockLHzVIggdrExdgiLfpfC0SpCP6Uxcf
	2BvMGjn7Oej85aOf2QwJ3epyTyyn9Zlv4nVN0GjCZ51OYn90zPexm0j3c8Ig81mv
	MA+q1Cu889ay+goCd9jIzWIBV4Qv9jPiCES1nJgyhTERgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgx4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:55:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b380149c4so260855185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730540; x=1783335340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db4jdjnSqHZXgefBgI/pneBX20fscU+O//6vunreTmg=;
        b=Fbhj6r3M248J5lHaQ37qHRuOe+raafx7EBlP+f2UYAE3oR0lUuRnzzHvSy4Sc1vEMD
         d1F0YPupCbv1K0XAi9jpDpDMKcsRysFbDDlT+Wnt5WiS1+lCBOeqxAi5BhE/KmR6mQ7h
         Esc8YQF4NWMFPUS+DxAWIiHhTh+FMLJBjGGUfeFuuGQOarub5tpDryk8bwAdQ58XYUfS
         PSSOKNMROgGUXWBu5QYAbcxPE8S6Y/bdJgp3qWwUvu8m9u3FxJwLaqXBSvjWHvDJqTEJ
         YIzwppqXuca14jSwDymSc+/zW84xxpLC/VBX184jw60c+511SN0e/4Bwju7fuZhVW49u
         8Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730540; x=1783335340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db4jdjnSqHZXgefBgI/pneBX20fscU+O//6vunreTmg=;
        b=mAWhC5oVLdrMXnWEy8PhBZ8D0P0KdJCKsJv4t99X9BODktZb+QcuZGTABsPrWn+PyJ
         MOqDwmlTLRHcIBMbTOix5DrH3OZodMiWAvvi+KqDq0vWFrTleRNi/UMh5Eno/A+OesOQ
         c7XEbf7f7h3p3ptY7dxEFCyI1UO0lpJ9rqMJdsA2cbMJya2Beet6NwR3ElbA2PG1NkP9
         VHUpiJddBqAFBpUTDhnvnXJeBw5uXwcXfeRt9V7M1RXEaWaEwcMu0i5NTfEsFSpnEBeb
         lGFd71DaiYfze5jj8QAH3hrLmhSGnvpPGOHgnTM+n1T+7/44bSlAN+haryTiYG1FpiUH
         Q9QA==
X-Forwarded-Encrypted: i=1; AFNElJ/5vN/VuNWrQ7w4z0NjOsdVwSD9U+i+OMTkWevx88uK7sdxgGnRXelQuJdKGvTa1pDDqSkeYwTpQsVKhy0X@vger.kernel.org
X-Gm-Message-State: AOJu0YwbAWosx3nFzEMzJdixEoCyIj2SDzVgVhcVZ25KFm8964k6e1J+
	/Annnss8mogK9p5DEEu3pobr9z+IQDMXCWdbCCp/UTlmPxZAQNaVBiwSug7nFEzt8J4QI34evO3
	6eif1r8X55BEFSS2iXMitnJRiaWV/eiyT/FrPDKbtuGl8hMnhz3ez26doPNOpAyj/Gp+y
X-Gm-Gg: AfdE7clbEl1ASJJTtp8rsEObUAvCPKJKOi1P+Ad+Iw/5ajyyQP0uFwZecn29nqPifT0
	1zXVJtp+iM/wjFlo1zaWyTCpQjjBVOZJV6Fc6CJ6fWLu+7dE8zWeR/TEw/nAQk1M7y9YdfmeofO
	mdaaW2WlJKoaJ259m9pdZn+3t27Qt/XpMVM03tJESdI7idDKqOPScZmxHwF/6v9TfM/w+f1hDHn
	A0DRYhvrWXZpv8/d8mhL2rRZhKg+elH0VyGopnKv+PjgoxrRiqQW9bnl0jJJL18zM2YpwCI1pKW
	7+263W0KU29TkD7ya+q0GzmfEGxqXn5sdUI+/by+x3EjhSJLSYCHoWnl5Gz41k0Frt0G7DCifw2
	lX7h7NBCON7wosViRZHA/Toarb6mwpfpHIvLJ52Gc9+quFx9jL3Ro1Xf53te19OL9VbmfvqkX/w
	aOJBXVWo7pH/WzKhJf1xb6VV0m
X-Received: by 2002:a05:620a:4625:b0:915:9fba:8794 with SMTP id af79cd13be357-92b3b100986mr1468650685a.6.1782730539467;
        Mon, 29 Jun 2026 03:55:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:915:9fba:8794 with SMTP id af79cd13be357-92b3b100986mr1468646885a.6.1782730539022;
        Mon, 29 Jun 2026 03:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeaf86e52asm1836247e87.18.2026.06.29.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:55:37 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:55:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Message-ID: <poam3wo7qr5m2xmnicptfz4dpkacfqqmr7b2vxvqifwykpn5k5@tkypv7epffmd>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
X-Proofpoint-GUID: shJf8ex3A_twOmMkHGS7u55LBsjR6IV_
X-Proofpoint-ORIG-GUID: shJf8ex3A_twOmMkHGS7u55LBsjR6IV_
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424f2c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7wtgjnKuI7ixzQLi8VAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXxsq/OJSI1C4K
 UnmD9XkIyitgCq05X+lnxiE2SQb8UivupySABRupMzIE/FTzp5wOoblGXbQTPWRvFomN9En5IOi
 lJwTqIo6LsTWPHsc3E8HydGRIpd9q/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX9DF+7AsgpOrq
 Ub33LKI93smYJ5iQ0Imc0sDc/tEpZoLmScbE8XQO61ucucbnXJExqQF+36I+tQUgBBgKRUbrlDN
 xrBi+23NgN3N1C0sZ3GIXwkCHRV7AMns/sIB57pqYgUtoAArSbsXbvNvlxmJ+cqk4JR/T9CSaDa
 g6KpCqF9ThI36k98cleA6Hbg5C4E5dWAzjrZcdOagur8IgkY0aBtxG0hiArhQXWWg+JsFzxWJsw
 YfS548ffwN+GQhEjCza5IuAe78AsR9uRdX34SHnNW4kftiyPtjEjf/A+wE9exzXQocEVXxo1Li/
 4EMIfXwe60zZUSUKs6d3xju4KA3kd90fG/FLiASscYHwHmmMgy+sP4uxxSLvK6fget8Ht/iwoTy
 KFcmWs3s9ph4mg5Z7y8CvcnkdjX97VHv0XAu+m43l9MOwSGOFcAslWxfQGwNt6Ofr7FwZPmaelT
 DlsZlEX8926ISXZXTPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7EB6D91E1

On Mon, Jun 29, 2026 at 04:10:18PM +0530, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

