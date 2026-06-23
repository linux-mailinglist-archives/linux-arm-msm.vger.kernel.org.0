Return-Path: <linux-arm-msm+bounces-114259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CR8uCYzJOmrsGwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:59:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EF6B9541
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:59:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z+pm5g1S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cuFo8Jkd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A7CB30B912A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C096D3911CF;
	Tue, 23 Jun 2026 17:58:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42839184B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237516; cv=none; b=LZy1UN7tpIgqmBNozoIIjkMlpVLWG/zJ2W6gqsiSewl+4vw1FYDL1PyEgvCD6Xg+ifmKeuXFgA6m6Wf3/DA7mTTNULB0w/CYCwBpQcqoAdHMTkUkKAqxjxIe6ljvh+oTzp4icjh4xj9t+/QkErFoR4LslOu/ay3zqcNBaFYPpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237516; c=relaxed/simple;
	bh=R+28QlrNiCN6K6py3dNPx0pNB10YcrEwOklcujjM080=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvh30+nSrDL0mJIPgONd02/Qw5zBj7MN9rVb+v92bXnWxqvTS0GqHe+cGRgOe+VtotozeEUbkP9YByfx+/4yqUWTPanQXtYI5t6G+Y1ThejyeEj9dq61f9GftY/gnA0GvrhuEu8NJjfjuhzlVAC90LGJJizDyc2idOiVorENPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+pm5g1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuFo8Jkd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NDFq3t271024
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lidbR1OsPBa1dvYdzrXIvNxl
	oOyNJfjxIFISM5r5VJo=; b=Z+pm5g1SdtWM+L/1Db+V5VCgFLpgAlBUuhe7jXdo
	91TS+2kqc6CbDdIE2HTgkiPtMMiM1tpY3vg9wS8nM6Ffi+6m53Zv4bc+JM250qHK
	cNubRC3RbTfyOx4Q+JQNXhSiVqb1oUeyUXCc+5z9GqXz6kdyMQKbFOuS0jUr3+zw
	NEjxOGPGrPCCuv08vixJ4vcTeESswvy0T0nycMGn2eVtlWUxcSTeuQGKdt/SRzbk
	oMXKkR9WccAFugcHcXQ3T2Q0qAm+rXq3TA2EYP2Yf1KJK0FWG4Ujnck9n+fOwUVO
	eYVVOeuHWw7RmDHgnCVUxhxQ8upB9GT5/hSusgVlt7/MHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh1chx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91598ab3a1aso4897985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237514; x=1782842314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lidbR1OsPBa1dvYdzrXIvNxloOyNJfjxIFISM5r5VJo=;
        b=cuFo8JkddjRNtemhSbsLR+cAzBVOUBSjWcrqPjJ5THETBKbNOqvDoz1RFg42Qt1KsB
         Mx+eTMpjdMzSfALZyQ7A1QqKEMZqLsNUy+AaSxlHsoH40FmQnQ7sfvvcW3M0KCOhYY6K
         IpwRvlWQOthY909Vc0ssvaqGE5GMIx1x0hsy54emqdfMgn57eEASTQxjJXyoCYjKndID
         jxvR42ZoqgH72Vt+LT3BAzLfEQeaOyL7RH2pSXESVko0NkMZcydapCNou5eFroLCny1u
         WNwmcMkHADfRBo8J9L6OrWfYcSSfRysTQvz7vMmEg0U6LPLWuBiZMhOieR/u9E+Cj5k1
         rqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237514; x=1782842314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lidbR1OsPBa1dvYdzrXIvNxloOyNJfjxIFISM5r5VJo=;
        b=QCW+o14fplC3dN2pLZgubFf9dZkTPlawluz51dJI1vU3t9v6QUHa5qVI12uiwTTKFn
         it9YBd9hr0HgMMJIPlVfnJ1ppVk07EKojbalR6P2ey4hzt7s0CZh73Kj34Dg/BalwNrR
         VdtMFRNznZkkIGM9hmEHIFj8ynH435NyCo4Bp+ppsn6OKiAnO9CzGgP9dyLfiKe0XXgR
         OqSi2Ue5ikOe5F91eJOSdy86CDoTrTksWa0liJDcurcMz4Mbq9lKU8iUyJrnDhW7QzfB
         EvJNMSsAD7EzCo/vOUy1m00IMO0qY6bOTZUOGKnmQ1kt/yp8JFdJ7IkdqHDzcbV203mI
         BnCA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q4YUIx+wj/z/FTCKuVpONloamkDGJ6hTsP10N7T1C2rArzKl+zoszD4qWitkgIIvIzYd2bSLSVP10hVA5@vger.kernel.org
X-Gm-Message-State: AOJu0YxCW/jz0TgLjYirf4sDClFFBq5UXjXDcMOlpwJSr1bSWzgCksux
	SVGQI0ltqHkHPjP7WY99LlETLVkMu+hDn1YITu8n7AcjI/JukJF/LeXpnfDUxgGYfu48F3sQB8r
	WjtZI1fpWq20m6W/zhxHN8vtw2wppNWqYiWW9Yg2y889TyZes887tNiEcnfWE1141rS/M
X-Gm-Gg: AfdE7cmijhb2/W4n73+lcttzj/1AuJ+o6h4dp902iUz/fdd7ZyGR725hOJNZ19a+e4S
	jJyN2lJkXycSEH79ov4c4yU0JV1vLon4Fh5qNlPx/ki2HkaacndyvyzUYMQ0oucnoDJoE9XACtG
	6ln5cOrHDcjs6VqKM1fXTqBl21P4Hcn87T13WPreudpUP20/sM0f7QOUnJgSuECZNTkmJlSMLm8
	1km33NFAhMvM938U3W3HDoptxGVh5ff9+DAEs8mb4jv/K9NNGi/nGVJJ9PRMwURvzYRrMRBuKOd
	Vc2BvAzjkmuu28eizxanUeCzVZqEB7v6ndi2BORcBnRsQ8L13Dq/XOEujecT63KwMRZ2nl4vsqN
	LD075MfyOcAe+cMN5m4ht9TGWxEBtWYEBwAqQvQsqs7l5fWzy0NPnLAepLWT410h5M3IBb4NwF+
	DwSJD5aAvAFdFt1vU0wy6FOF+b
X-Received: by 2002:a05:620a:458c:b0:921:a4ed:2d06 with SMTP id af79cd13be357-926453c4a47mr635250485a.4.1782237513836;
        Tue, 23 Jun 2026 10:58:33 -0700 (PDT)
X-Received: by 2002:a05:620a:458c:b0:921:a4ed:2d06 with SMTP id af79cd13be357-926453c4a47mr635245285a.4.1782237513359;
        Tue, 23 Jun 2026 10:58:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156976sm28071411fa.22.2026.06.23.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:58:31 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:58:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description
 for USB4
Message-ID: <kdcsigkak4ct46cbx2uy7vlhuipq2qyewazf5rtafwec3naqs6@rphkuu32v3m5>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-5-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-5-71d827c49dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0OCBTYWx0ZWRfX9sodrAFM87V1
 Z8Gzx+0Htkclu0uovswt6rgV0eylPhqO2dvhbsA3GuoRIdfK4emRjaEJvlTObq29KKzPFmzZHFG
 n0mADHtVQjS3u10NuFzdOGUIsIECcrjYd/DDo2dc2gFBXVgj9VqN2bEEdYYA0yWgQw5bGoaiTnY
 6or1BM/dDF7FoSohx1TJjlCdQ1jz7yjCFXepoSM1m1zEB8Yj8R6ZkSZpGsRPnZeDeqQ4LGxFaa1
 Js4MquAHzblrOMVHDZ4PtikaMVwdbp0rtVCSWwQWoesCUQMxDj0CiTrUtx+1n2l1cJT6jx+1UI+
 i2WAmJu8IRrBgJkKwD/dbNV/FgYzXY3htAaXD6Chsac5ifNcR6FYaqGWAKNu34aejsMgIrCoOCH
 hJzjsIEHVVZ5cqNvpcHr4eZ2XzRC9B38VjP2IYIHNeSp/VVBXTcjaNaZDtuMDJOy4Nx3i2cZc4u
 DkYS08tMs/nuNuKeI2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0OCBTYWx0ZWRfX6gwan9ApWeIf
 q2NkorsHIQTeMeLoJ+mvG2zBs/mOCw+bzNNXu5VntxewfL6wEJ7G4b7D8J2PMfyNX25IhR/8Sd8
 7pDsXk9eBYYwY91lWYrHpA0KfcKttG4=
X-Proofpoint-GUID: h2Hj9FEo2kBT5iWF4OGQedhY9ety4I_x
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3ac94a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qXetow4D2dObSurrW18A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: h2Hj9FEo2kBT5iWF4OGQedhY9ety4I_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230148
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114259-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:usb4-upstream@oss.qualcomm.com,m:rthoorpu@qti.qualcomm.com,m:westeri@kernel.org,m:sven@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,rphkuu32v3m5:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 860EF6B9541

On Mon, May 18, 2026 at 12:29:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
> successfully. Describe that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

