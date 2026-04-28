Return-Path: <linux-arm-msm+bounces-104995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLOdF9qx8GnsXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97022485937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FCF31464CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FB044CF2E;
	Tue, 28 Apr 2026 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgPUl3+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V317HW3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7043E489
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381053; cv=none; b=uin0gijBdtp8gnuLDyHvyuYzbG1WYvn0FpGdUlUIaZZ/hNT6ch+INJrBZ3hH1A2ydbhVIG6K5FCVuEzYmN35qWcN8gXC8Wts5MKZuy23Zn20WKPZoPOq/yClDTSd1fzIkbuEnSOLHcCBDppgU2Q0V4HpaTGuo+pz/YWnNT8H0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381053; c=relaxed/simple;
	bh=ldxgjdBrYYeVXaUnxUUU/B4GwN76WLx+xuzOSN74aEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TH5TnmjpWLt5CkZQVVW3Pv0AnFNlsMHAYTe6GmgFIIYFKebsxpwHE1LQAJeYZjBSfnksW+ZEwR+qo10//oUwM41BTgevo280AwbUUuDgGIMlaVlZ5GsBgXv1mU87hJsvxHMNsKs5OrAgOLCNLDsQIxNzblj6xSWj4DYLFuHQQZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgPUl3+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V317HW3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vjx81744761
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cAZoI+HEz2rp+EzYdEX3uozy
	F0yBJpjpXc9xmiJV/pY=; b=WgPUl3+4aDAoeH7Sq59lei5hhbH3zHqoLlqRAslg
	T/FigfBneLbUj1F/qCCk8DXIcx6j0juHPkbozwmSb0w4kufUHloVNhW0naABMSuY
	5I6gZ5QP2Wy3Aa/NRAgqBdnpAXFiEu2NyJmdHo6EutUd89ZvcqSyIcshEjKpKkVo
	Q7urZ97JR4dQCzRkX0pMKbGIfzXiJnO7e8HqNi2/eeGu+DOLui8B/J0kNP2g2U2p
	01vikdClhMGASoG5HBr37hLAdPmmJqZQhNSKbFfdnqukbPyvzw5ZWXkcj8u3qJ6A
	yX9l8GMZWnr3MZZ6rWcLuyfcbsd+2Vk0UiK/Vtl+8QSv9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd953c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:57:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d889997495so30343242eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381050; x=1777985850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAZoI+HEz2rp+EzYdEX3uozyF0yBJpjpXc9xmiJV/pY=;
        b=V317HW3tvI23yR0tUp/+WFUkJRSSuNjkw9r6crPBtHPh3Jhj6HxLDtoPU6DdNqzyvy
         X0PbjHkwDNk7MeuJ1gEvablSvyJb5Mwn0dZEk2GFWqF7fbYQ+RPb5JolysQYml01limd
         Qj8B3B9BcuyFPNEtwfJC0Zb3BcBJcWmI6CroAC3I77Cq6WrbMlMlzsJ47sLyjGDYqQ5D
         /ars9hf3GaDuiK81JLO4uNtI6wulKcXXN10h9HqVO7CdJXOCI/bqz2O8PjKABOoYQrNT
         UFiDNECsJQiNWKLNufUrK6SCe2nTja/gVwZCzKEcUhEQRbuJcAO26hNey2KXJDPPnMqF
         PeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381050; x=1777985850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAZoI+HEz2rp+EzYdEX3uozyF0yBJpjpXc9xmiJV/pY=;
        b=ayMRMXYa37t4rorhr03Aq6GurvggZ1DCKA29op3rHU3Gdyb8pYSnOXXzdmg/4YYOn5
         3S6EXSRUArwEZYB1euJ2DTOnM9MgZ2Y+iI9dB3pDzHGSYxrzuB5QBCuF5GSMT+VsEqT4
         n/IIaRTWOH1FBI/9ffA6Eu2dkqD3KRq9d38+DXwYmQ7W5AazOJV5AbBMPXeFZJl8CxM3
         utv8hXKC0iwbrfKKzJx7qdnN6qdIEMGOi9Izj/5ScNXzU2u/7b9RfovQI0ih9BUW+u86
         u8FI3EH5bp2NADejHa9D7VZgHxEvMVN8gAw50QD1kR+Q1nonkyUU/cYawQWsGa7NDb+J
         8ing==
X-Forwarded-Encrypted: i=1; AFNElJ+X1GJvxV/JoMbXhDlvy+5ntCNofEyrRKqoI7EjrjUHHpyuQMt0sRtEwqSv/N0dErk2gq+Bn0GtPEBwU+qr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/7AhJTVGbeGO3k7tmNcitsI+MI1Ir/MG0M93+BBNtnIW7Uq1H
	NvBYvN0NBJvCZnKki8biJorx1jY1iiYZG5pCXmHzd045x7wf8I4UtCN2wghZiJHaXlaHIsj6RSl
	yhPLfilGSOnsO9l/jXBzwktMAo60DfbJqPVM5D4T9hG05/Phcw9Wduh+mhRsFvF2JUVhh
X-Gm-Gg: AeBDieutJ+6ohSmKsFgCOhoVFWPsxgMwpkL5zvUE1IuiHtLn+Sk3LskmJE++9ksM68E
	ppnZrHattiWSk4dBDGZMA3BU/bti/uYuK5X5joIAKc5USzmDoVfokX+xjy5sk9jo1MZyk1LZTvE
	LEcnBXO7/23Bw8DIr+OAXemk9fqEU4uqkcmf6huOmMeS4zOAfriDvw70PaCyWJqc6cTHJbZmkNa
	Rew9FG2yeyZ178ZkEs728uOCsSeiOZbHIYjjdPbWD+WDWw2AXFuAVqpdfLm8QFGy6/NITuEvFez
	ixEtjLlKPnYm25v+nBYlJq3Uyi7poo1l8hBRknqf8eyS9AwlQij9qnrr+E5nAWdblJMAdjBKIyW
	ZZ/5bw6zW2NsHhnANNXz1n8q4t0BYbnI00MwLWlmQojQK67B1/1r89w9lABsEuM93MuRt8In2i0
	M=
X-Received: by 2002:a05:7300:3b06:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2ed09fe6f94mr1542604eec.1.1777381050186;
        Tue, 28 Apr 2026 05:57:30 -0700 (PDT)
X-Received: by 2002:a05:7300:3b06:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2ed09fe6f94mr1542577eec.1.1777381049572;
        Tue, 28 Apr 2026 05:57:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0cea01sm2118609eec.18.2026.04.28.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:57:29 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:57:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm
 Nord SoC
Message-ID: <afCus0_JslMgwdlg@QCOM-aGQu4IUr3Y>
References: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
 <20260428-tricky-magic-koala-b21fed@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-tricky-magic-koala-b21fed@quoll>
X-Proofpoint-GUID: TCIz_GeUIubP5eJHHHz4k51v4MTkky2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMCBTYWx0ZWRfXzhcXbtHwKLaH
 6pumX8gbBl0gQLMVH6ssGAeoNcavCm53ZyzDWkmEZ8xbUtv3vGPZ6J/4fqEtalNgXrz+sn2QhLI
 dC9Kq0rTdOBHMToTR2xfp+yzonynU170CV7Y9WElNos1oRYB6RLPaHEM/lrJhuyc7uP6aXarN6N
 EtOmZKcoMq/src5XYWR+c2cE4q01yap6y0yE+MaGCvq0lrDm5FDXTnioFUAwwRsXy/1x89gf6+O
 AMk1ZXuaaGxw9P1e770QIwucoLKnCRtxiIPsG204uqzxu2OZDcDV0JJRQneUXSI0J4HflJKvbc5
 9TRjv50LrYtS3ML+w5G9kpI0yFvTtA3n2LYZAzf6Xwa6PU8lpiHipi3awPGCQbfohiUn0LjNKRA
 A9UkFnYtBdAGAW3s06/fACHGwSGjWbmJBs/WvDgnaJbUWuYvOJRF9NHtxs2kmANhZ7JtjjbRgMH
 jJ+C1Lfz/9DMsC8PWhw==
X-Proofpoint-ORIG-GUID: TCIz_GeUIubP5eJHHHz4k51v4MTkky2C
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0aeba cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Jwcvy59Mha0-J4ocVUkA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280120
X-Rspamd-Queue-Id: 97022485937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104995-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 08:20:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:17:28AM +0800, Shawn Guo wrote:
> > Document APPS SMMU on Qualcomm Nord SoC which is compatible with
> 
> What is APPS?

Should be APSS.  Thanks for spotting it!

> 
> > 'qcom,smmu-500'.
> 
> What is qcom,smmu-500? And which one? Adreno or not-Adreno? Please do
> not add any obvious parts to commit msg.

Will drop it.

Shawn

