Return-Path: <linux-arm-msm+bounces-114286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWmRDLeBO2rbYwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B96626BC00C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K02t0Zgf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qky8xsQ8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114286-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114286-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54DB530CE276
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCAA38B146;
	Wed, 24 Jun 2026 07:03:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0072F8E9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284582; cv=none; b=JPpVlFFUGPTG5XnT9n9hLmElQwq85l85kQVFyDNrUn9IHZCVhLSqY02SlXcWnk1KytbsupNL8jLhgovGHQqoN+cYA8tZ+lc1QDyZnOp2Oh8T2TrIozHfRwwJdcgHhfp8UD5YOVdV6dCOvKUitKV/s5twPK+zNY/WuM98i0LZ3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284582; c=relaxed/simple;
	bh=zeM5f2R2wS1XwHGdgeiJF621JTCzXNAtYsJrEOR0Vls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5Yn/wmwOwg4YHSy44nEpv7nRmkMfMcCaq81wqjYroUeXh6mgVlqzNcuK1AGB7P4ItMWMXR5GdDYnXeWwwfbjNevbhXtJFBeN4LRTWfcafwLIimRbDj7wNuuOAYQCtD9tVeCYs/S9bj3nfbe/qd5n/MbzlDGeUtNMHhkpjlKzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K02t0Zgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qky8xsQ8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u5Ig1889403
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgvfWtTXGgI5yN0IDqmXxyN+
	NWSF2UV/4MJTbhztfkU=; b=K02t0Zgfvnbwwrc6u5BYup+htPNXs7L5j1Sa6ps9
	UxT4CJWDBCWWvGRFoslA9VYGG4CW3YoYJ8I7sXr+GtjnNBfkesJGIAZ6fNt5lP7y
	qY25c1j7ACldLGH9LGEZ02d23zAIK1MAilNjZEd5owqe0/XC4D1vl4jRI5YRXTMg
	/nKMeYUyrLNP900MMULpZ+PzJ6k9p1ObXoEK668Ga+MBYLkGa+Y3VDRUzDIC9aww
	cIdT3Bqz4k69CZ+hxyxWxRSYf/VpN4C2R+LM/FWPcodYP68sZVdyjcU1REqC0i/b
	Llt+TKpsimbEsoTCVGv3KdKT/G0Av/nifnWVW6LbdF6jZw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3ktsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b71dso475563a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284578; x=1782889378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgvfWtTXGgI5yN0IDqmXxyN+NWSF2UV/4MJTbhztfkU=;
        b=Qky8xsQ8kQ30jZwwqQan+sh9UWA/LNvonArRBuWCy+bExGb1+mJSmWpxYiPO4wz9hQ
         wT3H+ilvxWNRBk4WlPr8fReJVDWpbkHr8/eQe23cWdl50xBEaxmi7SEr+/LOX1iiryVF
         0cBuhLq+1+/2Vs2RmySYxXiVha9dvreJqLwBO/7dhUE4WuXvui/HX2h6ApCwu/EQiLB0
         nvtCUdGHTjhD0uLHGTSg8j9sOy7NMdk2aXdEXkDzxv7PIGcOEmim92iQygT+3sfgc76C
         WjWeJqniGljh2dL6RzOVFRX0kxATMAcgCfhdmwaThzQbFoGuJf0DPoRgaCBzCNLpMaNX
         juUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284578; x=1782889378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgvfWtTXGgI5yN0IDqmXxyN+NWSF2UV/4MJTbhztfkU=;
        b=Qj+uT+5VBKcaPouL6Ii/tTOQVTjZcSFxRenfdV3QCzMR9AM7AtXYZoZEjAqS6hapgZ
         ybk9nx2rcHcgq3qXZC6C2LPb/jVzG8KdAFxddlN4IRNZ4B9krRc9Y2o0qoR0dj3R0uSK
         p+/m3LyV7x65VzF58jNGQ/+ExWG+ypCmJ2iXl1RIN3hQ/cgb0sYA6KyWZ212oyUYjoT+
         YvpcJD0Lx1jxkCOl25Om6UKJeY4Kx5C7VRcrWQKk3jxfbtDIE3v5s9PaYr3KHv/ay2fl
         o57OQ7b0mVz6W6Z7zpM+fGdA+xansNaIAJxTeMlOl6JyTBc609ttwJB1L+ipqP4T9WhI
         eM6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+mh9BO1/OWp66SnIo+cXI2z8pV0rbvooyrws2bKyiqBMCX/S21sbPDE9HtjtmPBrBs1nFcnt/JHdHTXp/H@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNu6BcoQgx5cg6whHvtWSaFoPi51muebEkKr4jyBTuvVRM8iL
	Nv827dsdsIx23Ktebz1BBtJbXmDHzTH8r1CuWHNivFIoG8Z13f0iSLQ2bQnFk4mAgjHdr+H+/IX
	whGCBc3UYbzbCCQ+Y8EfyG+ela9MX7mLJnCbGyjZCwEd9WfL7SLpKXv/RAEW6CmcV2bYj
X-Gm-Gg: AfdE7ckAp/3JiBCS9iIM8FWLCAWqCwt5fv+gOX8hoyOEmD8N3wofvBTxqtZIxEVIAtS
	oN42ThUA1R823J+H439BgGL8hP/D8Ywgap7PQGU0JRf0b1BDfEaL2ExpVuToz3hU/LTRvs1yHt6
	zO5O5AtE4pnPs48pgTPAJwbEx+xTqbn/JrbB2n4Er39TbsrhQXjvflh+jvZ28lEmgpAUoUgGeKb
	xxNCVR4bpin1laTqHubGP6eQxwCKUSh4f4HvVrdmFUOCyujlecf9A63fbfofDoemOqEqtH9hecA
	9V4XeQHjwn0Wll6fgxVBgiByxa6rtI6SJyaDCp2IhGjuauUv6zvUdjtAMobBf0vKqr7h9OTHgXL
	a0tRBmQr+evVuM4D0/HNfZvKiQq0w865W0oCNow==
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id adf61e73a8af0-3bc5181907emr22290778637.6.1782284578342;
        Wed, 24 Jun 2026 00:02:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id adf61e73a8af0-3bc5181907emr22290724637.6.1782284577842;
        Wed, 24 Jun 2026 00:02:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc326c487sm11738900a12.12.2026.06.24.00.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:02:57 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:32:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon
 SDA 850
Message-ID: <20260624070251.lxmevkxejkeyrc2l@hu-mojha-hyd.qualcomm.com>
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX5JqCYwWPnjNP
 6kxwSXuQSlBR+YwuvIa6UQSbFfWRXN+qh8dJGtoOfGnXasQboTY4cll8AUHDWeH0GcNz0Uj3P5G
 AyuFKNIOXdPv+s1LubdDc5DpgnCYygM=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b8123 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tM2yjQwG1dvND7ghf3QA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Nw_C0MJ2RUX6Ledj7cM4P5CeGWhYr1LD
X-Proofpoint-GUID: Nw_C0MJ2RUX6Ledj7cM4P5CeGWhYr1LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX2qT7AIM4PHXi
 1JvZ15qv56KwyypmuDAFaSWkkjb3iZymknTWn8XJzpCoh/2YUOG6DmVlVYlXPqLj2uOnjbBeRaE
 uO2eMn25H0liHFovq4LczRGZEwUrvevVXeSDhN8f9QlR4QFDd1P5jCldxia3WcCv1QNKL1W0eeO
 MD7hIKKWKe0VU0aAMPn+wQ1seM4J422E8DHGktj19SfyABHq+F52UGWhz8+4neHkKa5e7we9mxh
 d0GPC+iUV1zjSr9kbx5h4hFgUfeApedl3RmdZS/WgvbMcbZcIC2E/vzqEoWm2puAfn5Jr+fldO/
 y3p8LgITPJuc2K03aCSlCTpqhuUZdswBWVmbQ0pL9Tk9oaxeN9G+sxdekgJqQOr0GlyKRROw7pg
 7UOMpDc6kFVP7bWJ5qEeoQzqCM+Vs7LkmEJRLCineFJ62yfgpKJxcEKXs7G+J6Dp0BWvA6vg8nq
 klwZNBk6ckXO8VMeDQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-114286-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B96626BC00C

On Tue, Jun 23, 2026 at 08:41:34PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add SoC ID for Qualcomm Snapdragon SDA850.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

