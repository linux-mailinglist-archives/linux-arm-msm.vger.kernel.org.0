Return-Path: <linux-arm-msm+bounces-112806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayx+Nd0VK2qV2QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:09:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47183674F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rrl8f5Li;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hIv+Wv4K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112806-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112806-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B6423176307
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DC836CDE2;
	Thu, 11 Jun 2026 20:04:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E758349AF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208242; cv=none; b=KSpBCTakmccb5uyHXqOxHXmB7Lr9CiVioMlLI5Y92KGCf60CesY89tpHMiRqgdGsx9Qz4iExlDjRwZ5J0ndFfjQXk1+CXIPcH5PTkRL3LpC5fpiiEDQYRGe5DBDR6VlGgSkkeBNQZ4DNBFNVWT3lea1Ok6M3dwCd7ceXv1g6GdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208242; c=relaxed/simple;
	bh=kCvhS425Cd+lt0/WxCqTbQdRk8LkCHFoNycXUZuUL2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nvirg4tYfi58qHoAWteSUmGfRH6lBTsOo2Bk7V/+qeTdDgNd8GVpTgqv+NFixBSLNo+5txKOzIGp51YQuXHQY8OA1va2Ecek4yl5a3eAuj5QUVwcimf/DJKmIlxZWceo6Ip3HdQhuzpytzuaAeZpGQJOhxB9vYAbV1G9U4NRBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rrl8f5Li; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIv+Wv4K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3LgC1388814
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBFyb5D5/OcA3NsvWjkuD3j3
	aI56Fzwaywe0RW8P2J8=; b=Rrl8f5LiVZ14ULaePi85Nft7mMSMQs8lp3FibeL9
	hgf3jBOwaLmDqIn10+K7yfrNozjJHltFgevJt+zUiKh0ddth9r2p6VxV9O183FUa
	fnh6DogbJYuEVmmW6AEX0lTr4WHpTkNswskC3sluWGv/swgLqHj9rBGnNdffW6gq
	4J9W4eX+FlsNBafxJQWOP1EHFoRAjV72/cI0ax1yp4GN+6mvDDOCOLkm8BR+stJt
	goPcM/Mdd4Wn2Dl8yxVE/thisOCcZNwziOFw2YQGvUov3eTeJqctUE4t28DEWOVO
	gaqLz+gJMFBb4izl+7irCKYJOEARPWC1136vGJjH9SyW+Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658rf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:04:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b0a0b727so66029241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781208240; x=1781813040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBFyb5D5/OcA3NsvWjkuD3j3aI56Fzwaywe0RW8P2J8=;
        b=hIv+Wv4KeLxX1RmVzubqnPw+VrkaBdQ8aA2Y4Zjgr5+o5fK0Aw+IfIVmn2iKQSIyE4
         MCgXkBFtdGypQxh1CfFnOxqFwPrx2OBcL2YPaywxuKmFIIoUqteL1G00tjwcQpZcgXNc
         6mvs+uSx+WKoCdfWAVH3ezvI0japrqIpY0qO6mPNMC/QniNQkgEp2XO4RE0isLYybv5y
         4lsprusq7phS7UIwAOUFpVloHWtRd3vW5ceplAzyYUB5FhfBYX/qjwhVVPfcmKJU8LLa
         Fu2sjWdxcndCAd4Voz9Rszee6/9sM/U9ayGXZ/XU9LdDu8e+BpQR+Jk9mQ4vgdOtBYGk
         yW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208240; x=1781813040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBFyb5D5/OcA3NsvWjkuD3j3aI56Fzwaywe0RW8P2J8=;
        b=LW6awrRF/AYnugRhsscytnBrqb0IWmBDE2mK2Hn2SrYfGuvTeLX5tdiYOmbyivwZsS
         UXzrN0jnSQU7/V94d3Q8yttfUbMW5vNsQ3sjFBlxYrz6ntT1ShUob+5FvH7XLM1MQoRU
         Dp//Kes6dapWuCSIFO5egnjt8nqgfM+uW9uAsy3Asv9JpK3HOG2F9SlvibpvM2oGMPaI
         OSvosd6l5MDvTK8ptNajeDOzdQVbAGm7mZVp8X6yrTCQXth6QUH90WoKRkPfHo9yDdWo
         OnpXA2jm5JlZDSAtg+7dUnqV91ZmeW0d/fQnEKlDsbVXKXtig8Iz59+lDcygQR0WZZ/9
         xmcA==
X-Forwarded-Encrypted: i=1; AFNElJ8eXnclXDuXL/svcP5Uq1YSqKfQXQC0XvkRFB7ND6aYxMbnF0pcqOWZXzzYNjz5UI20gwEDf2tyPZVG2+ag@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdq5X3TQszElq2bAiHU33xTYze60BvmHvbvssJZtcI6hmEXCP
	kBkg0PlyOt9dmnNzy1Z83mDqA6E8q2HsPGHLZQi1skCWcsRZzwd8GxEceq0a9q6MDcG/Xpe3GnS
	KS2kfC4px7vvhGdK4YSHof0WbrR+9COwPtW+LM4zNsb8IRIZZ8LdTOATO43UxT8XrPnMo
X-Gm-Gg: Acq92OHXfROU+mxcSEAn9YyFJJlcA6EpAB7bFW16v+C2NKZugZX0ykvFGf3qIX7KpCw
	Ok83W/MEKG5bEZtOegQWXOBmIbumk3Z8lbI7Eh2rgYC/bZpRIMfR4qTjc6X9szcnbUmqcUev80q
	YUWe+nJkhxUTgqwrjnkKV/MU8c/GJcrxlXKKc8sBBeDfpaaiuI6/dgnEAmnuwpyPsyzlgwdh6fL
	AzNlkq6Usx53bIiVO/mx7otQIQVwosZcFlhOTcIhZR5wkrowyDfPqEnPipJzLafUjY+S/5ZN5ch
	mcx9JZbv0356sS0wFJ7dasCVcMR68AcKoXk+ZhJBjcIl/dLjL4UV/wg7DNoR3BMO53uu06WDYM6
	WzpLkJiSsnGI+ykOqaOasPjEAlHQIlweumj/oNQIibv5n37vEEBUhp+DRv4MoRF+cQW9wCRveBu
	FKPF+RM4mNyhyVTwNl6W8/TDqKOJspQ5kzWBM=
X-Received: by 2002:a05:6102:6a83:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-71d5af2077bmr3143130137.11.1781208239729;
        Thu, 11 Jun 2026 13:03:59 -0700 (PDT)
X-Received: by 2002:a05:6102:6a83:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-71d5af2077bmr3143092137.11.1781208239261;
        Thu, 11 Jun 2026 13:03:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abdcsm138351fa.13.2026.06.11.13.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:03:56 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:03:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
Message-ID: <qidycur7hkqrccrpbkchztj3p7fgxfhauv6n4ajtxrw3mhhwnp@d64n2nxnlvov>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
 <e5b487ea-151f-4d22-b046-b72447c023cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b487ea-151f-4d22-b046-b72447c023cf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfXzUdcrEwp1hHh
 0bsrndT8QvGEWsOtcWs628sQzSWgSD5U3oziW3jU14QAwmYE7l329qLEcb9qjr0GdHCT0hz5NvQ
 lmr2vjtHXrGWhwwOVDAFk3Gc+jJQUws6J6NV0rhT2mc5UDBSQINsBXIvSqyFjFwjYk75J/8ZhNj
 3IhvmyyuWTveabrPCTS5Kn0SDezs/KUObIbBFeg2ndyufGRLTbfa7xMfMNKqp6xZvbMrj+AJjQo
 Js8flUWHyFgYObr+Q2fms7ftKohGab1fpkTw+4KTV8WPNBjri0EJRZGwed8zTUYN6sOCV5GL/1O
 hI6Z5Nj9MU+mXAxGxkUCYI6Z5OMT6U3+kWP0hwheSkfbDXJ6mT+Xeq6VdifYdEG74OH4TxhjYT3
 cdESOzTQl+V53vuxXWO+UBhx8FYnk1xagv2fWtvqm5TQLndNeTjR0/tTg33rKJU2jLtVgNO4arF
 WCu9NvyLVKOxkYQtjpQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b14b0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=mbcBxj5cxTrRBoZ8tFYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: lqP2klaImojoHKaJKhqf_KZhFDNa3jtm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfX6b688bNa7ncM
 LB4tJPdoFPt2DXj4QH0rNQ6N9bypShgrVGIYaBOahfQtaUAMxcvV7zT0cRbKYyYbXyyBAkzbQy0
 riic/tDe86dQGHA5vV3+OC6wFaMbHRs=
X-Proofpoint-GUID: lqP2klaImojoHKaJKhqf_KZhFDNa3jtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112806-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jeff.johnson@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:konrad.dybcio@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com,vger.kernel.org,lists.infradead.org,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,d64n2nxnlvov:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47183674F7C

On Mon, Jun 01, 2026 at 06:54:35AM -0700, Jeff Johnson wrote:
> On 6/1/2026 2:46 AM, Dmitry Baryshkov wrote:
> > The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> > WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> > configuration to support hw1.1 version.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/core.c | 92 ++++++++++++++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath11k/core.h |  1 +
> >  drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
> >  drivers/net/wireless/ath/ath11k/pci.c  |  9 ++++
> >  drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
> >  5 files changed, 114 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index 3f6f4db5b7ee..7e997016cf6e 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -393,6 +393,98 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
> >  		.cfr_num_stream_bufs = 0,
> >  		.cfr_stream_buf_size = 0,
> >  	},
> > +	{
> > +		.name = "wcn6855 hw1.1",
> > +		.hw_rev = ATH11K_HW_WCN6855_HW11,
> > +		.fw = {
> > +			.dir = "WCN6855/hw1.1",
> > +			.board_size = 256 * 1024,
> > +			.cal_offset = 128 * 1024,
> > +		},
> ...> +		.num_vdevs = 2 + 1,
> 
> this value is being modified to 4 in:
> https://msgid.link/20260525020711.2590815-1-wei.zhang@oss.qualcomm.com
> 
> It is merging into ath-next today and should reach linux-next very soon.

I've upgraded it 4 for v2, but it crashes the original firmware that
came with the board. I'll revert it for 3 for the next iteration.

For the reference:

ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
ath11k_pci 0000:01:00.0: MSI vectors: 32
ath11k_pci 0000:01:00.0: wcn6855 hw1.1
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
ath11k_pci 0000:01:00.0: ignore reset dev flags 0xc800
ath11k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
ath11k_pci 0000:01:00.0: failed to start core: -110
failed to send QMI message
ath11k_pci 0000:01:00.0: failed to send wlan mode request (mode 4): -5
ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -5

> 
> /jeff
> 
> 

-- 
With best wishes
Dmitry

