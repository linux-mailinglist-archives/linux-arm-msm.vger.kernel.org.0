Return-Path: <linux-arm-msm+bounces-114264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0i+tIBwNO2qYPQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 00:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA286BA7F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 00:47:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F525Msj2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WPqsOVFl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8EEA3069CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 22:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A39C8EB;
	Tue, 23 Jun 2026 22:47:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CC269D18
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 22:47:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254872; cv=none; b=QocJUe6FBYOUXZnHurQbh1twIpBfQM8n3pBjR0mXVC0IkmPR3OvRlIli3z4pWXblEVFnqd3SNKts32jNox2BMGz+ECw3AEvZ3r74rPm0+w3k94K9cC2wLoRambEG0Ev4Pcl4WbEVWa7jKegdqUZxYiYunp4zmqgJTTp3bRpfppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254872; c=relaxed/simple;
	bh=K8DthgNvpP8H3W1v9rUrPVBz/IFhRniVZrCwsEvBQJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7Ehx8SIu77qZ4OQkUowXkXZRST3CpcEYa8tR/vN/hsUmca5rQRqbgq4VEECKpO3fS0QpH6tq/qms7/PsIsGjK1aCBem64wvzNu7taLC3Q97aBe0Y1X2pcQdZBy9cxxiORuYzufFoHTGucIcM0eI0IXlnKotR/W6QKJXKE5LEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F525Msj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPqsOVFl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NK0owj1285756
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 22:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asq7qdr/KrrmzhR4T24h1GJS
	Iepx/Nw0a3Z1XgC25/M=; b=F525Msj2pgDAEAbRB3jeiUrK4GOoji/yIEmbUf20
	r4n0faO/Uw10FEsoDdztMyGSxNgHdbOU4Icv/kieCbgfIz4x2uvEBBIa+Eql9RkE
	ytlzR0IfWeT5Cuav8JC1L+eOOYqIsjCxDhRTTDTCh9BnfFwS3tVp4ErH90HKROZk
	aUw+ntmeG5w2flb1YayqjEkYLj5hD5cb256gmOQ4aG8GDmJrH/OTHzePl8+Rx/eW
	XxSBxUN987xUotAcWvpAel6NpgcHKyp+7BLwmEyOONIVOyEN+Iny78J0XXhjnWzS
	9E+83/SPJGTq4G+T3qFPdy65xQrQWNkC+cyZvnSxzY5grg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3230ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 22:47:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ba395b047so1031716eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782254869; x=1782859669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asq7qdr/KrrmzhR4T24h1GJSIepx/Nw0a3Z1XgC25/M=;
        b=WPqsOVFlxdzS4keSGvO3oF9EwZpMoV8tYe7Gp/6x7vZ0rt6/u7hnn39MSownLtSlv1
         rTnIXQUMtI2SyVl6AhzNSt7NOonRS2CF+8/BVu70encn6sB42IDn4EAiMadCvotnrSNy
         ++RRWusJmBeNapA7H3FAY2q+vdGvOQ7k4zaypWGDLRJ5Onj/e+XwmWoau3c/kuYuCm67
         y013MudWrCdPbBTx0nmsgo12AsW4O0ZOr4+RK7mKYt/Ww7yDG0I6iXYKeUVMuALSCVXl
         UhVw/BzJebX9hkNvG+svSfe4u0Re6mguROY1tTDa8ogsOxkKoT1jx3XPX+v73NaMTkZ3
         /g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254869; x=1782859669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asq7qdr/KrrmzhR4T24h1GJSIepx/Nw0a3Z1XgC25/M=;
        b=Lu0gxHNpCdPocuHmZR+aAuGO5AoGXqXylFf2ZsPKcKn6AiAz/v+xVnHPoauJChWDp+
         AG0CrCPcH6Oxhx6skAR9M3CpjxdbykzqWJy0aGiYBFV+YEHRMaztycdPhHu6Ln2E2jCe
         U/ydLjXLkrX5vt9SOY+386dkZjRnxkjLyI673zmXtCT3+pT5BXn6Z6I03dp2uOZ0AxD0
         ONyENA3oxlkIrng5XUOCcoot9CW1B4Isj4mIDOmylpdxygOCOMtRbGaDIFcYgNdzn0yN
         zuR9O8UPi4ITqEAG4u2+Z4AhaCKq3ySC454KR8wHcgblf9gpbfLB/KIBNMOpYBXrjF+5
         VWlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU0+XA1b+/R1hAOyIfK0G3u43aqkD/1CaGxBaKVhxqo2wQdVTtoWrCQ3TYYxiLxkXZDA0lMviFMSxjr2bz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4nKMqjeBfmG2ml/oD8Y1+ZxWRqxjh7YPo4BIP9qzc7/COR7y
	jxOjzguGUPD3oiOkb64vvhNGTHBpzbPhWDZLYN1Ndv88UI2mlEYa7nhVb/2NKHJLChZRoC6yBp1
	Ya4OY0NEmMTI27GeD6Gr/dh/X28PzZJuX+JOyMC/6f8NU3CbCZoQfCdRkse+KuMVwv+gkmDqV4/
	k6
X-Gm-Gg: AfdE7clB+IiEMSRv/8n4TOAG3YQRMkS2qvH7FHoxwFhszYKoF2qE0r3d4LLOfID+o/l
	Q+4ZWHE938nOesJlvt/rc9+hQXRHb+VrMJh8OZn91/XEIMK9WHehOI8PsjZOncVDWKkEOdQ4dHp
	biQVga5w0XlURe33Fn+WC7b5mtX2dk3OyvTF0wvphwcs2co43Bmn0K8Y/MB0ojHKeWBeJzR6eMM
	Dl5VkRUqVslVDeppwZ/2wT7lEAfWf5F7tOQVWRhSdDj6vgupDcwZsn+Z29dZQUG+IS1f8b3kUDv
	9KXZZh4NkqjUQAWBZYUK/ykySLGLIVrt8So+WupDGGd5S+R8gNYkJMA5OhaML4qKcH1s4eJ+huL
	k/Vvn3eU+/EpeiGRF/CCXJjBPnP0xcz7HUWR3fo47esVIi53jMjw15yDgG6maCVTHjtM=
X-Received: by 2002:a05:7300:5bac:b0:30c:25c4:70fb with SMTP id 5a478bee46e88-30c68e33484mr1215368eec.34.1782254868610;
        Tue, 23 Jun 2026 15:47:48 -0700 (PDT)
X-Received: by 2002:a05:7300:5bac:b0:30c:25c4:70fb with SMTP id 5a478bee46e88-30c68e33484mr1215333eec.34.1782254867956;
        Tue, 23 Jun 2026 15:47:47 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4b24esm18691660eec.27.2026.06.23.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:47:47 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:47:45 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <ajsNEftGh/dC5JhK@hu-mattleun-lv.qualcomm.com>
References: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
 <20260618-hawi-pcie-v3-1-f31880bfb3ec@oss.qualcomm.com>
 <20260622-brainy-observant-crocodile-d57bef@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-brainy-observant-crocodile-d57bef@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE4NyBTYWx0ZWRfX8h55u0D6+0CT
 x1upPpxSeGTkgKkxaevgY4OrZMFqNvpF8STE7ydfl+WQE7GXNOeenNinVnS33aWCRv1g4MlzZy1
 8A91s9lGrD7IBDWMGBpQjZGqPHgCSuM=
X-Proofpoint-ORIG-GUID: joGljeqUMcWoX5BsuzLUwK9pasdwazdd
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3b0d15 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BYOc-fOMsGyrnX6sEagA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE4NyBTYWx0ZWRfXyqVLyBzaM8vf
 2AcMg9K8g2ynM0PvYBp5xqwFgeKCE2YGsbnBZENsJ59WaqA3bWjiHRcZzX5GBFHWMwbwqQjBTwq
 JzXnQNrOnO8tJIHA0UrTiJMiEL2q9TOsMlotjOPDtGIh9HaYLyJdZWVhNmqPVWDzy519zcLk9WE
 j94KwIi3vNPuvQXCWGLW1wwGHSsB4B4Zopa8tJcsAUHH9ghkx9xE1mzitsr9PZJLuxG31mOre81
 p7Xz4TF8q964wIsLFpWKPfNwIyrIF8/6lCytYmZ4dlRaIZktAR8R9UcQsJTaiz5WI1DR6R0iAho
 SIHT+uM/a1ue3JRD8SP7Ppg1h7w8nEhmE4PEBdWZSEku+cpXNfo1H8nW4Dch10dYwgaAv2OPDs0
 b+8LGtdKXRYVHvbtEY98sEO9ZE6WRwtBEK1Ey3Ld/96WSU04PItNLCe7eE/coMVNGZL04kOiEq/
 X4cS7ekB6qAA/oJC3YA==
X-Proofpoint-GUID: joGljeqUMcWoX5BsuzLUwK9pasdwazdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114264-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AA286BA7F3

On Mon, Jun 22, 2026 at 12:12:04PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 18, 2026 at 10:00:32PM +0000, Matthew Leung wrote:
> > Add a dedicated schema for the PCIe controllers found on the Hawi
> > platform.
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 202 +++++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> > new file mode 100644
> > index 000000000000..fb3145f89f7f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> > @@ -0,0 +1,202 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Hawi PCI Express Root Complex
> > +
> > +maintainers:
> > +  - Bjorn Andersson <andersson@kernel.org>
> > +  - Manivannan Sadhasivam <mani@kernel.org>
> > +
> > +description:
> > +  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
> > +  the Synopsys DesignWare PCIe IP.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,hawi-pcie
> > +
> > +  reg:
> > +    minItems: 5
> > +    items:
> > +      - description: Qualcomm specific registers
> > +      - description: DesignWare PCIe registers
> > +      - description: External local bus interface registers
> > +      - description: ATU address space
> > +      - description: PCIe configuration space
> > +      - description: MHI registers
> 
> Why is MHI optional?

The optional properties were carried over from the previous binding
which this binding was derived from, but I see those need not be the
case here. Each of the properties are used in both instances.

I will update with making the optional properties required.

> 
> > +
> > +  reg-names:
> > +    minItems: 5
> > +    items:
> > +      - const: parf
> > +      - const: dbi
> > +      - const: elbi
> > +      - const: atu
> > +      - const: config
> > +      - const: mhi
> > +
> > +  clocks:
> > +    minItems: 6
> > +    items:
> > +      - description: PCIe Auxiliary clock
> > +      - description: PCIe Configuration clock
> > +      - description: PCIe Master AXI clock
> > +      - description: PCIe Slave AXI clock
> > +      - description: PCIe Slave Q2A AXI clock
> > +      - description: PCIe Aggre NoC AXI clock
> > +      - description: PCIe Config NoC AXI clock
> 
> Same here - does that mean that once instance does not have this clock?
> If so, mention this in commit msg.

Same; will make required.

> 
> > +
> > +  clock-names:
> > +    minItems: 6
> > +    items:
> > +      - const: aux
> > +      - const: cfg
> > +      - const: bus_master
> > +      - const: bus_slave
> > +      - const: slave_q2a
> > +      - const: noc_aggr
> > +      - const: cnoc_sf_axi
> > +
> > +  interrupts:
> > +    minItems: 8
> > +    maxItems: 9
> > +
> > +  interrupt-names:
> > +    minItems: 8
> > +    items:
> > +      - const: msi0
> > +      - const: msi1
> > +      - const: msi2
> > +      - const: msi3
> > +      - const: msi4
> > +      - const: msi5
> > +      - const: msi6
> > +      - const: msi7
> > +      - const: global
> 
> Here as well - why is global optional?

Same; will make required.

> 
> > +
> > +  resets:
> > +    minItems: 1
> 
> Same here?

Same; will make required.

> 
> > +    items:
> > +      - description: PCIe core reset
> > +      - description: PCIe link down reset
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    items:
> > +      - const: pci
> > +      - const: link_down
> > +
> > +required:
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +
> > +allOf:
> > +  - $ref: qcom,pcie-common.yaml#
> 
> Best regards,
> Krzysztof
> 

