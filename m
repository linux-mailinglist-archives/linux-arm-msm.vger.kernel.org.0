Return-Path: <linux-arm-msm+bounces-108403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPWiGYAgDGphWwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:34:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49557A31C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AF373156AFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB633E6DEC;
	Tue, 19 May 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y36yw2a8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA03E63AD;
	Tue, 19 May 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179134; cv=none; b=JotRE+k2f7aKSm2lnvU/mcQrCQqKAhyZsMlNzLa5aB6kozYMqpu5Dp0MS4Uz5g546dXmwYKq04UxEfHPpRQpVVMPqnhZiSHCyasGmyagUGlocTjFxyK2HQGiG+EOg1AivLnBwkBy+Ebf6970uQLiGKppHEYbbUGYtkhxvS6OmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179134; c=relaxed/simple;
	bh=bO8ZcC0RI0VrZiD9YVhbYmikJtDJp8PMmh9acP2Ak44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7xa03Ds8DrxMCwFFf+qDeU1YGLTgSN1GbTuWX58M1G8pyd9W/y/iV9ZCsnZ2QSfaW7C37sSfUA/E/Zge6mZouna0EOAvevlGwodET0RqjgCG5nWFs2JkZ0cWLPIhMVactSdf1qglg+m43HmfaRARW+QffmK+WDzPE2ol2117Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y36yw2a8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7hC2A2975577;
	Tue, 19 May 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mc8HnRDjIddYmMal9EmcvSda+GfdxLfGaL6wbNracc=; b=Y36yw2a806n1LUq8
	SnGvMj63AiT8nSrvsRyUfKDdlDkZInfnl5M2PfKjW/ASBS14vypNiFGsd0g5wH5s
	zxuspjIo1OeKso/Zw9Q9egmvaIPHa6lBLOje3vj4tVxhf2IMNeS191fYrwukDUUH
	9H0i7duvzzjnQhSn5tEUbaODBnEFAQVc0Pa81zTyFkFBZOcBKyc9atxlMV+2YbOh
	umVviIF8iFLIKcg05v/g8ZA1sPu+j1pWURXKQ9RFL/HkTszhZBS3qwGXDbCsQBmS
	gzEbGq9c9phAfJ52+hTqjxaTHLrRxtIxasaFp1FqtXDYr18a9rLG2N71klEieYqj
	ZJjfbA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4behq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:25:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J8PRV1026832;
	Tue, 19 May 2026 08:25:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716dcr0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:25:27 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64J8PRGC026826;
	Tue, 19 May 2026 08:25:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64J8PRQi026825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:25:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 4B14DD3C; Tue, 19 May 2026 13:55:26 +0530 (+0530)
Date: Tue, 19 May 2026 13:55:26 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c1e7a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8bFJG4ejbdCWVrgXlm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AbsmB0V4aGzKk5Fr5sq1AAt24NaAn71j
X-Proofpoint-GUID: AbsmB0V4aGzKk5Fr5sq1AAt24NaAn71j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MiBTYWx0ZWRfX5Un0cfAipuJp
 rSq0A8eknN/LDPqX7ZVcSYQVeU0GGiCjgp1Nqrgp20QGqvz26I/WmMBE48gOIRxDeY8QFbtHX8k
 ZC5MmBZ48SZK+QmfNlhXkkzzw6mc6UMcBhqsdoB8ToxhG5BuV/lsKi9vIVRyzzf0PUaVd3S3Bj4
 TAnQvcifj4hHlsKKCMJTyVKcxdmAYi9OUjbBE9I4urSfdyyq0WFtbsgDmIhUOCQP9nEvfUm3LBQ
 0Fz74kUaFhRG9TjETUNniuQOynqDPIU/JAikQXWu3HS3uHIomDYsqCwd2QE7Po8pESEH4arTwrd
 YuSmllfBPJjpe8ysmBn5GMQSTBXOasD0/jrmpAMT5UKroRhQPanWMwfWtjvKzaRng/dHS9STiPN
 EdlseIeJUut3KOKN9yH7AL171JLnbOLfCWhvfJ5mQDQIivJviEKbloY3dVg3957Pa556HKUlbKk
 XFTW9SZO3vAYOVtTlbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108403-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DE49557A31C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:27:48PM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2026 15:49, Rakesh Kota wrote:
> > Document the "qcom,batteryless" boolean device tree property
> > for the PMIC Glink battery manager node.
> > 
> > When this property is present, the battery manager driver registers
> > the power supply as POWER_SUPPLY_TYPE_MAINS instead of BATTERY.
> > This is intended for 12V DC adapters, where presenting the supply
> > as a battery would cause userspace to incorrectly trigger battery
> > power-saving sequences.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > index ff01d2f3ee5be18e404591e3f0382ff2b3f7d168..5f7b90d37ea09d9aacff463b2ff4b76d218bbeac 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > @@ -72,6 +72,14 @@ properties:
> >        - const: charge_limit_end
> >        - const: charge_limit_delta
> >  
> > +  qcom,batteryless:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      When present, the battery manager registers the power supply as
> > +      POWER_SUPPLY_TYPE_MAINS instead of BATTERY. This is intended for
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>

Thanks for the feedback! We'll update the description to reflect the
actual hardware capability rather than the Linux behavior in next patch.

> And isn't lack of monitored battery property enough to indicate that?

Regarding monitored-battery — its absence alone isn't sufficient. The
BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
development phase where some battery properties are still present. The
same ~10kΩ value is also used on some genuinely battery-less production
platforms where no battery properties exist, making auto-detection
unreliable. Hence the need for an explicit DT property to identify
hardware platforms where no battery populated. 

regards
Rakesh
> 
> Best regards,
> Krzysztof

