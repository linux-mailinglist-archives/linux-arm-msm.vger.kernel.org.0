Return-Path: <linux-arm-msm+bounces-93545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0dIjDN6amWniVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 12:45:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47716CC66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 12:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0649D300E16F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 11:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E25C3093A0;
	Sat, 21 Feb 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnN5FkzU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lq9KGpGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D344D8CE
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771674329; cv=none; b=E6fci/OIwYauUMHm1p+CCxPv2PV4K6dmVQ3XaRk0jO5Q9dRrwNLA2kjIYVNcAhyMx46toHUHNjz5hk/j7B+g/ikLhuTLrbkEVItUQe4hIYoYE6wXjQqhlupHoUGZLMx+KzKDXTkK9YPMXhPkiShDLptOkDN5HzdzYswBz5Bh9kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771674329; c=relaxed/simple;
	bh=hkR+aDWnEbijQXJmIbBhHdhpGenvUEZEBRga5xZQ8Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTABzBi/nW1/w+hjTgyal9JhrcIg0W3V2TKZST+6fyLb827qpkjCtURnQHIvvPbOZ6w7tmDexTNiE3Z21CrQwzIs6NxDH4Yr0+EL0hSsRR1umVinyDb2yWtf0QRecuIVCJFV5AJQgmI6jKSgzNqAREc/yjmLP8eo+XrkoGswxW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnN5FkzU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lq9KGpGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L5Fe9T1284093
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 11:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hkR+aDWnEbijQXJmIbBhHdhp
	GenvUEZEBRga5xZQ8Js=; b=OnN5FkzUm9Li/y1eJO3JYfDS9QgA/QDILBDkSqTr
	440rwUJz2COhXgvower0/6s2NdDF3ix0tIxOo+NzkQF4fircDjMfwQ55jkJbH2yG
	I14qoyof95RToiOVzXkwHdeyWioznSHBuyLzMAlAqJIb4l6E9TTjvoVhv2VW3IEb
	DbrrpArkW/E7SdbPtFDnYUYEgU5Y3XqbtMPJOu3WpbWjrCnLXce5hp+CxrVbj0+T
	FbLg8MtRxRdbRyPQqaucBxnNeI9u4heAgUNj7VdxnYA9Cc4T3P48JrOOdfupizYV
	2cBYmkpJaBXsKcU9Tc2yTn/Rx+w59qla3qCb71C7n5i2hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5warn1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 11:45:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so2757133785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 03:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771674326; x=1772279126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkR+aDWnEbijQXJmIbBhHdhpGenvUEZEBRga5xZQ8Js=;
        b=Lq9KGpGgl/7wm2x29VCwYLYAq3e2lstg0tNvS6/BHrP2gF/98WcpnnXnGl6FKr4DPs
         Tmiu6N2QwzVjt+gzgy+JkfovdWP5MvLpq4XhcyfLMvnoDePzY8rcfo8//5Cf1a3ltX3T
         hoKy02al84HUf7NYBDhnHBk1RtvaYyCPONmzxJyDSr1bw8zgRgX9eCUUpq9p0RaxkgCM
         1LpK7eoK9DEiWVjLuI3iZ05q27kX6HqgZgUSrHH2O7DarR6SELBZgUEeUYyiKVAyQEsw
         NU8FacqjjEiGGWWEp+8ijci8dggG1IGhc89091J/yDe269RKfVyFqoUK9ISNxjxQ9wHb
         t3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771674326; x=1772279126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkR+aDWnEbijQXJmIbBhHdhpGenvUEZEBRga5xZQ8Js=;
        b=aZ5x1ByxTbHXp3kuhhKopALZ0qnabg00hLMcpkPxAT4MNnvMSkNnIviPPYz7JgOgcO
         33IwIXbI4mjIPHdGg28oQ8feJ+4Xizyw306P8J91C07pq8h6qNNtM1Y/0gfbL1lQcknz
         nIdDMTrYVCUnduitPs3a95kQZExnlMUe/Pm9wA/AHZtdGvcRyy4i3fWZuBGojJQVtexn
         y+lw8sb/P2Ihz/Tu5AIVKj2ODeUtAtDC8pnlQauRnkmGdAUqFDH7Qu5cvEs2C48d8Hxt
         5669GD9Kva2F9lILvg/WRoYp+p+v+utYsUyX2wDT9dkAyf5fjjPRxf6REYlsM/GV7U9t
         yQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtsIC4i3xDbjdRovpXZLA1S2uDmrzLbFCx6B0IuW3Z8RH02lKrXcm1Ky+np50FENqf1TSTtA1JwK/BLR1P@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRcBXZuR/MNFbo5+Pl0qeXoUUCkHkxwZ1NPgDvQLSZRqLPO9a
	SJOBqgJnFbCE11fWUk/5iixJUkQFH+A50PvBwukSn5tkT5ykSmmY6gcQS1HRy918hON9GBbran3
	CQySnrCAISg/TW8mk7YvWtV66YGA02oz9BycMEoS8njKtPdQIylFHYPAUde84NOuZzhsS
X-Gm-Gg: AZuq6aK5C4A/OM4sMNbJjz1WcWrHwr81S6/xON5lIgtMLpijyN5XQaCQB2vtsf6C3En
	WowqC+olh/xuoTteF/XVr4LKGDPx8dO2OIAA98OMcABCpOq1gbeQ32n2hnuYlRjH7exL+K/KpOL
	j4EP4R6lFRJzRNzgv6Ikf47e5lPazZdvR8afVnxpoGxmzsDMg4Vh6oEXh/0pEm8w7YspPIau89y
	oa0xg0OP9hpT3aArZYLuUNsa8rEALY7Ecq9zua56S58nEW86W1cfQKgn1fdTabzlkNUZAWC3UOR
	eUxc0+A8VjV4Z+oBCco2wmi3CGWrlYAL9zV7jY1VufXZiAyZcDoE09FaQcGz0UYGrZ3XHxZnPTX
	K2Ag2eHfdZDmmt3nS+WrhOxhayYFjM87Y5jUf
X-Received: by 2002:a05:620a:1a9e:b0:8c6:ed6b:5865 with SMTP id af79cd13be357-8cb8c9474f6mr339769785a.0.1771674326079;
        Sat, 21 Feb 2026 03:45:26 -0800 (PST)
X-Received: by 2002:a05:620a:1a9e:b0:8c6:ed6b:5865 with SMTP id af79cd13be357-8cb8c9474f6mr339767285a.0.1771674325482;
        Sat, 21 Feb 2026 03:45:25 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm5370545f8f.22.2026.02.21.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 03:45:24 -0800 (PST)
Date: Sat, 21 Feb 2026 13:45:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and
 clock voting calls for ICE
Message-ID: <ayk53t4tjes6gq2m32e73tll5umb3fvot4keqxnfi275xeglvq@cis7h2n6j5jy>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=69999ad7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SBCaeXWvHhY2KLIX7PwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDEwMyBTYWx0ZWRfX9GAr2x/8wqAF
 W/RkntVG5iTb5xY/y7sV0slSB92B0zU3V+yARMBAoBS7hA3Jz+pyAgYUj2VtnFfgoHiEKbZ4y/+
 bIoESXj6MPmLCE+Sqe7ekQCTkDNJRdSk75wnJfZ29fqGtyUU4r706lFdKhckfSj5TjGUfhZETeY
 TQrovUgnt5EDy54gLENM7YC+6+5WUb3k4lzMGk8WmPpH8TBnLBFBIEtOpOYmSHs5AYCkKNv2OJV
 o5YjXmvckOzLZqBWIy2si5QWEBiLUTd+kurOSe13UXr2JdZTfFwjTdKo7/5P1qhwt4ez1HwQ9Qi
 BpjkVjeK+gV/Q5Ugz5XJPcVxN4+B0k/rbPhh6A0vxnZce6/IFlwGSOv4N4E4yvLFtD4wHRfacNu
 KdjEk0t8yC0KWbvOmyw3cyfavndSEjWG+DKuq7YhvRzt0txB4RTNCrQB2NUho78i7m03qiBVWyI
 KxnSLYZ7942cdJLe0FQ==
X-Proofpoint-ORIG-GUID: A-2ThiFdulxVoErV6BRASflm1mSrmNJz
X-Proofpoint-GUID: A-2ThiFdulxVoErV6BRASflm1mSrmNJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_03,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602210103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93545-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E47716CC66
X-Rspamd-Action: no action

On 26-01-23 12:41:35, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
> and the 'core' and 'iface' clocks.
> Also updated the suspend and resume callbacks to handle votes on these
> resources.

Your intention here is to fix the patch that introduced the ICE driver,
so I suggest you add Fixes tag. Same for all other patches.
They will have to be backported all the way.

