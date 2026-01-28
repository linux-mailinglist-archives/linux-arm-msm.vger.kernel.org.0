Return-Path: <linux-arm-msm+bounces-91080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCcVLdaHemkE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:04:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D09A95D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4AC3027B59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CDE341660;
	Wed, 28 Jan 2026 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS0Q7uoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdVpAYR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88D34164B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637841; cv=none; b=E1zc0DT2nCz2tK5d8T4hvSjsjYq6rTAYjgGAtHgx6h+IsA4FrSU0/GeBJjYCfMvMWd2Qzpoz5x2SQyEWp9SfaG0Fo/tWHmLQ1c/K1kQ6CNOc3s42hW9nyM3JadUj11qZmu7bxWHhfMPCabsK8SBwAI9Xwje/4IkxS+KkBMHZDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637841; c=relaxed/simple;
	bh=twwKUsKsbKQgiOk3755aKnscYBOVlzeUsvaZyLlzzBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoxzrvJI1pPm6n2Z72KnVSKs5svznXaS5ElO4zh1/fzs2tsq0IikB5bE5hQ9YiXUPLE8U5g01chhqlswD5KUQTFLoifTg6gi8OON5BNZzqdWK4r+1v+sFN7s7VVUZ12mI2TU7b3JQA6Zcf987iHD15gp3j6CrQSbZDVGlyatVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS0Q7uoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdVpAYR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFL1Sv3247633
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qX2P7KKnIhqxHBBjw5BbK2GY
	A40Er84ZfsumUhnyNv0=; b=lS0Q7uoXFDWDqruxJ1G3emk6UEugRUrrJ05xJjm5
	uKFMkhGo9iz5NIyFY/BlLCwxYk/aMT5O9g6uVOFzhY12FfcZmQI8Wq/IYpjZplVk
	sR8CJqI/lqx5LOSfKe8d2N8gPK9pDmhEfNFUoq7Z6b16oCHamLPTHnN7d9zVb2hI
	a/WaSd/4NrBXJo+o5UXXxJ3+FhK+avYhoiSrsncl2teIZtgc8BiMUj/00o+KYHj5
	lcPriNf4vqmfibBWAs6gYhi+SCSamfgco30yOkx6wzWGcbGCdT5/j9PEsQA2zL9q
	SvBULDP3N1tFdsI2kKjvfh3UnSzEv8vBSpwPUM8hf3IebQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk34sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:03:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70de6bd18so83428785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769637838; x=1770242638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qX2P7KKnIhqxHBBjw5BbK2GYA40Er84ZfsumUhnyNv0=;
        b=gdVpAYR5jVM7IEvRfOSG0qA5xI2j2msRu8d+gNYu+uStQYh/gUJgBNKgZ1oJXbYAnz
         T2GwEsSOkUwV8Jnmqr8vAw2tD8NiCzOfIZo1wnfYR8/9ZvXyO3VVKsMIpiivYf+C00Qj
         PRO0DgXJNtFZlOyVc74gEBMbD8zcUpRq4LfPl+A3WhKCWA0wxoLGjz3UF9+iqRXHKuhc
         MhqdneBfUN1h8SWz5X5wzCAWZQMl1DNlbnKs6JBIPJ+vjOS3ECNeqaAtUfleB1chdsva
         cYQpobZwwK3hXYNAGIEupInPlBk2lCfcmvD98CELhEmHb5B6pPa26q6x30pc6GhOLVfP
         7TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769637838; x=1770242638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX2P7KKnIhqxHBBjw5BbK2GYA40Er84ZfsumUhnyNv0=;
        b=OIRCKsLKohxgyQ1MRvxTnA7u/iA6dePDGG08JKbCOg92/6var2C/PJIA2DN1yOzDnA
         1zMRNEVKr4Nl5bXLn/2go0i26TZoe4LAqV6WqX0HIxSN1pTA7zw3aLkJNtIZJAT4Wwp8
         KXvx1zQu+6WZ8cmLSzlAGwQfq9L00f4V0B2eaTHsIajuOFye/IcjSKP5IXdeL4YHFP8E
         02hUsyoby5Bg3k0i/ynCrvmmtNVX8xQlhDYpKJjqdA4n/fhGKoe/V76XqHlgG/a8osuz
         1z9Ibu1cLSH+1ZztIvU8SpCoUf+Da/sjt+GhszZ0W3kMiRab6RAOUl9cGhY68Mw3dJae
         52PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1iaxSDsJF29TzAsubVAJUsrK4B6TsFBdsCHNUsJpwZXzMnZkQKmn2vUHvWh2b88JIpBcK8w0+dAQ/k8Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQMuDIrtZsHQqNvhZ9YPuc6mjH8JLSiIM3FKjrbSgL2ApsmnO
	76gVYvinu2EHuVfis3Zh/CAVypH5wgTG4wN2t+HdL3jkSIcaXCtE0KUuU1f/YzITjd0IilzmUEf
	AIiN9KcCvNd9KeaVEmwVKRO1IbrkGHCc2Op4QEoUPg9VeJBtDy5jMmI4UQG6RT9PeEiym
X-Gm-Gg: AZuq6aIH6myodMGMDWknjiBLAsSzTpX1vnRwFnjd4tqtG6JELq8CtkORHypozx1AwBJ
	HXYBfzQ+cQg1fi1dnOH75fL4DJur7AhwdpWpAKmrDEH52ontyK9khKV5ktv/g3dMXk8++1Gn4j0
	Y/RUpSb+IGLubgas9ANFoJnDE/5ZvM9WVdwqim7V7Vfp25+UoN9LLIBFokT3Qn7FSXAYZHkHqC5
	dTgHvLI2r+k8a+SGWQ9rKmuncduHLXQU2vcXihWgGD8ajoLVaBAzmhBe3ZH2mj8my0HI+Dp2cVB
	mn+gS8l9X8rEDCF0eivMM1NElfatGfqYPLjP5uAml0OaAX5d5fZOU0VrexynmzwkShVL2kj11hP
	22L6T0bpUrzPJpZtPLX7OpvynSQnrXeMcCA9SCnx0rC4XpwR8O/+r0rh2X/VE0nqo8C1lpmqSQ5
	W8thxkuQ2oPyz/UoWeJgumHJs=
X-Received: by 2002:a05:620a:1710:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c70b9268a5mr850660885a.84.1769637837506;
        Wed, 28 Jan 2026 14:03:57 -0800 (PST)
X-Received: by 2002:a05:620a:1710:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c70b9268a5mr850654985a.84.1769637836865;
        Wed, 28 Jan 2026 14:03:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8e417sm5783591fa.21.2026.01.28.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:03:55 -0800 (PST)
Date: Thu, 29 Jan 2026 00:03:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
Message-ID: <x42kgt6442p4gbbmokkqpmfnrr7kt27p244dasbzc5whi7jai5@2q4fn6hu45sw>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
 <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MiBTYWx0ZWRfX94KJU3sosDMQ
 EzDsT7fXhvUjuZ/UieE9Dtr5CM+Gt7SLFN92DnfPVVTPAdwBICIEJ0Jo0bsr3QuhE0uDcj3TxgX
 uU5bTW++Bm/wIoFtlKhIBskPyP0hCNh5hLXgT7PQi6AN4BUJR63T3nuBlDM0vyDTCJj732XIMeU
 nItH8H7Bf3OeelokfGpQ8DanGRsoDKZQLnSr+l6a5q/Ez6h0dFvWa6C6Mnv5a+mG5Z+j1fI0k+l
 8SUPsIfdEImsC8tvMoMl1n51s9iVpAGLWR7jJPwJmw8/SQk3uDPEoejMQtBTwhp8FuGXuDu+Wst
 xJvBnKNrq7INU4JhkTQEjf/MLtVTMLCpqXQBDlP5J/eJsrULZMxGa+3TVYEhDRjpQHavT05hl+4
 rCNQVdZ22yaoT4EStuLofBD2RMica4KqwIAa2tBB6YGvoQJaZtA3m560TVkp0IqEXtmWAcXUXuw
 7yC9rcakI+s1LDGp5rw==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a87ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=c8c3ORjyqegn7QojdrIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Uf30OMvL4g7gnqp0czJoP3285zXJ_ujm
X-Proofpoint-ORIG-GUID: Uf30OMvL4g7gnqp0czJoP3285zXJ_ujm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91080-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60D09A95D6
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:39:21PM +0100, Konrad Dybcio wrote:
> On 1/28/26 1:26 PM, Luca Weiss wrote:
> > Add support for the pin controller block on SM6350 Low Power Island.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> 
> [...]
> 
> > +static const struct lpi_pingroup sm6350_groups[] = {
> > +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> > +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> > +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
> > +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> > +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> > +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> > +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> > +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> > +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> > +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> > +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> > +	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),
> 
> Modulo this odd cookie, it's identical to 8250.. but then it messes with
> all the definitions, so it makes sense to keep it separate

Might be worth to keep it in the same driver...

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> I verified all the functions and slew offsets
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

