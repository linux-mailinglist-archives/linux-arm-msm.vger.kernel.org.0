Return-Path: <linux-arm-msm+bounces-113653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fQqUJjasMmr23QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2C69A76A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BOSJ+BmS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9245D301F7F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA352425CEE;
	Wed, 17 Jun 2026 14:16:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C9217F27;
	Wed, 17 Jun 2026 14:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705778; cv=none; b=r3v1NCUn+pyZw6jMsMZMYb66OBnu9JlAFl2JB8ToIdkUKUwDQzQrQug+tDfVuf8Nog2n+b3sG5M5vWlT4w6+D284QMMUFFOaO4dn88jDsZ5uTDURSaWrAEvO5X8xNmLZYnho1k1/LkR/HVRtq/OMsXlKhSPvW8MUOSFGX0koR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705778; c=relaxed/simple;
	bh=wlCref5/S3MP6523NuLK8FyXHlqn1tc+yFz/aolauLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgwurOLGKRiAwoqk/j5uKOANrODBMJVyf3ICEUBpY2QMqj3IWflFa52ha7rHn7DkOyduoWaDSr+tLtTo/jIvfJJl7wUjmWzij4iBL2XON84OkL7z3830oLc8STeSxGV8ur48hsd5xT9qdb/novlQvmL+uA/Zxob/qlX6+4KYQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOSJ+BmS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEG3N62800871;
	Wed, 17 Jun 2026 14:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4qeQYmD98detR1I+Y5arYqlF
	ppwJLv/QnariAzxjezw=; b=BOSJ+BmSOm30CeKfUg8E22HoYEO49HIu6YMf27Ln
	WiohB6XxPDwCRllCj36z6IPin2P6Gl9VdjIMQIpUaMAdKLiLKzZTyypA/zjizL65
	c/ECgEYzIT7vJixoR1V9CXcbT/pMGLjSbuOma+nL3F//vQ5tZOg8EtWZ6pvt27nf
	6AsitA8umbqn/gcGRjRAxN4ATjimlFZQNuhgj4EX8YnmYRHYBXMIIGGwGmxg8wDC
	A4bqfCBWe6+qYFAKviIo5/D+270LTkVjJx0yERRgMGhGvkWnASQfCuY3WJoQEEZ/
	J/6zScnFLjLsANtO+Mb+ldzrxRaG3GWpAYqVhusUNpHo1Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees3gsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:16:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HEGBtl001212;
	Wed, 17 Jun 2026 14:16:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09ka8nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:16:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HEGBlZ001187;
	Wed, 17 Jun 2026 14:16:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65HEGBec001181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:16:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 97CFAB0C; Wed, 17 Jun 2026 19:46:10 +0530 (+0530)
Date: Wed, 17 Jun 2026 19:46:10 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <20260617141610.esdqxwyzcdk4qwhj@hu-kotarake-hyd.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
 <633bh5nvxafrwnga5mdvvfdkazfgmrkt2jgn36dh7u5dlgjkgs@vewjc6tkgytq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <633bh5nvxafrwnga5mdvvfdkazfgmrkt2jgn36dh7u5dlgjkgs@vewjc6tkgytq>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 1X2esk-jkqDSPK2ItUkOe-OwRi1vRXnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfXzbYaaSgv7SF8
 pu7tC5M1b2Yax9SC2zCUhOk3OXkn76InLfFpaUGPDTbu87UsgjQBpqxRngXup9opb503e/rr0NE
 Df4a2IiaWoYCcrB1dxJwx5GFDw61dlWHRSH3KhTJLX/nPj9X+oThjjI0u7cztoD9vD+pputwHpU
 1tHIilkQLlgYzv17wtmCJPH5tZexGwVP5TlTeT2RUVrUBwb4YWPtVHl9X0ecgsOjLuDfMPMRgjO
 P6td83iqPAySLmtNKO9z6R5EuZ3lkQeoGM+CqtiwAykBYmo5vMlPaTcjqqu6hPe6q6PDDZG50yO
 G8ahmVGbtwuxstU8HuEnqagYVd+FaohbynipwgVsFDSLiwS4tY+OjyBPx1QkylFX1gVnLMvIDyY
 I0JYV/Q1SMQTBZUbjx7h7O1u8oxXD+OEcRleSsXYxkgq6v9qtnI7XzGtDypXUIM9b32ZdHgImjq
 2c2ePSDalpbLecWYlQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzNiBTYWx0ZWRfX3I9ER+YReYRJ
 s8A7sH3XLYLOc1k6pbmZ8XdIonQSdNvtpKawhrXNXgE5U1bRc/9fQRUeCwqaNN/JfuZLrFjsklx
 IJ7EiC3rTXCfYsRj6y4P8vtqe9/LbZ4=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a32ac2e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=p2IqhNJQRjyiNKHNqeoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 1X2esk-jkqDSPK2ItUkOe-OwRi1vRXnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113653-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE2C69A76A

On Mon, Jun 15, 2026 at 12:42:38AM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 13, 2026 at 01:39:22PM +0530, Jishnu Prakash wrote:
> > Add temperature alarm node, used for PMIC thermal mitigation.
> > 
> > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8005.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > index 0f0ab2da8305..180809a0ee73 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > @@ -11,6 +11,14 @@ pm8005_lsid0: pmic@4 {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > +		pm8005_tz: temp-alarm@2400 {
> > +			compatible = "qcom,spmi-temp-alarm";
> > +			reg = <0x2400>;
> > +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +			#thermal-sensor-cells = <0>;
> > +			status = "disabled";
> 
> Missing thermal zone, also enable it by default.
>
we will update in upcoming patch.

regard
Rakesh Kota
> > +		};
> > +
> >  		pm8005_gpios: gpio@c000 {
> >  			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
> >  			reg = <0xc000>;
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

