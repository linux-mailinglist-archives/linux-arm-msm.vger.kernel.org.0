Return-Path: <linux-arm-msm+bounces-111589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y2zrLa7OJWrJMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:03:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D26516E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:03:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YRlemeF+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fEVPNQIe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111589-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111589-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D0F5300FC66
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0021A31AA94;
	Sun,  7 Jun 2026 20:01:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFD2EAD1C
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:01:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862480; cv=none; b=oVmQQqwFquAePHRQsWgWTsv5s1UUQyuKpTqs5sMfQTSTc7XZKkZjf3zzwGxXouESDIlk6gWk2eb/WFibgov5nZ/MkLQlZoHmqvKWfm9/j5NBG2idedApnYNeObSAVWpuiNBIQLwU50aaX56LTH1jhgz6fFwoTHLtB2Wc26U0W5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862480; c=relaxed/simple;
	bh=52hTa5kcQvaI9pLpbWBzX3JmT1JFDfqMHf0HFsvSPaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWxm7eLPc4UOEljUEsiNOF8fQpHpfPqa/wE7nPTDHKPEmvUfD6AGaGaijHW0fjP449skgm01gWpU9iRLzoeTVds0jz018CNKdUryQqCmDJs1pPgWf4IGdb60GbCH9m0pTVgCNaJ59xdy8UtJ6U6oXcTUGYX2Hm67VHZIJe0M2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRlemeF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEVPNQIe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjwYC373535
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=swfVuia7jiOXExS+LqAUOMEp
	pKPJAifFHX+6qOB4k90=; b=YRlemeF+sEJ96lciRX9Gq5DgwWl3sPxSmLGpTGPY
	5df/XsfKLgZhs5T38MimiOImUHQvX/KO/aEi5HdktfIp009mQpgoB9ZzipYqP87+
	EZLjA3v9Gh3DRcVbScndY40URU9oEqrw4FiuYLGxj5nZp/9kpL3b5BCvbS/jXmCv
	b5EjWfgMQDRazi8rvOm2G6VvJWHs7pgKoJW+jDa3UuGsME271bytxh0O+TRj0pZy
	8/df9nOK33EAZz6RVxwz5kko9xZfCxqIxnpOrCCGrrx8ay/bxoYQblAA1YMuFMRn
	3ott3u4RIvOpzbeqoSw5hDSVDCYL0RpATf0Pual+NfBbCQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvcqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:01:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso1880410137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862478; x=1781467278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swfVuia7jiOXExS+LqAUOMEppKPJAifFHX+6qOB4k90=;
        b=fEVPNQIeapYdNpRO6ouUOYmknOOVcJYxHWwhhf1nWCasrMD7IT3DXDrAa0TeHjK6ml
         J9yfHAAyvXsovFYAcbvnwOQMbX11NJt4EbEAUx9CZjjEhi+ibGHsmsMyUsjYsPtxEoWb
         Py/jbV5Gqb5evzBxymy+73DfRowQV7QRVKIYXCr1An3TrxuZBvDGtTl5X9Fk9uwabujT
         SNz+Xpl7G31Eq24PhbhMRWmrDS/pBKs6nkU+BzaltvwW81QQIBqZSSgvrBDcWEf2g5qP
         pjf3MpoyuMKAseYnMkz52fOjiNrpRfIYKlLM7vtmU3nAfYf/OXMQ6D01euvNOKLAWYHD
         axiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862478; x=1781467278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swfVuia7jiOXExS+LqAUOMEppKPJAifFHX+6qOB4k90=;
        b=NrEMTLHTcY8mBxn796OfuC2gUwRqXZTAdeVv83ip1DtAMatOchzN5nNAsHVUt5JsO7
         +aTFuSyxLfO/LcTi9U6EdYDh7cye61LUZBf0vtBF9IvB/h0yV5+Ae41Xv1QIbkZ5x993
         kk7ddUEeclLfTtp23aWEhvmU3WxbKZ2U/XET2s8RHBt5cXkFZvBPbCFz+fTafADbLDkR
         hXPrDQxcGT3Rbz2O8XdJErgxJNF2fGVa2T0vhUwkxADpaFRgchh0P8t6HBu/mcF43Vyy
         HSxbpLSjqseLo0KDV7JqxYs92WAYimbnlOpZHpHloXHL8M6OD0fD9myGrFPubFijT30p
         pJoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SJATHqNOewUz3WwzPNZLK/zeIwkNdK9O/gtixx83TCUmMOqtWrwY1k/cQNRNF1iHnTsP/0ZvRCU8dyWrP@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJuczA/8KuVhK8P4tE/2TuMVWPBOcyCGxEsRM6b/SsK2a9/Gm
	xgozyBGYkhKzbyWm4rH7rtYqyxwwjGAkI/Z7Q2B8e1tPe+Ntz44AGcjqniunAoAPku6Oh5wZ/lX
	PQjk/VnOGxbGKPMrcOy6T+VrMtfQmZl2y0FfYB2fVLMucJKSAsiaC1ioPglBZchBS2km8
X-Gm-Gg: Acq92OHDcvZpk/DV77/98FCGFLUih5NRq2IgGSjnSO3kUCpcpuIk+6AowpKmtKBsExZ
	Iz/UPu1eh2WHt3zFQhX/2T2UGYGQLqcYlBz3a2PuwtCCw6tmGUAWwUIUdI5f418Nh/k5T69+E03
	pHjx53/Qa+k9rWkllOmGFEttye8ietZi2HmpHgmPtfvBL97zKZasC2egC7vhMIPRwjPEOR6wowj
	cGMdFrQpRKrHmnOUNvN6Be1yz64HilULsNWWSTC7bCZSqIaOmQm/WLJNjCVxMELH7WRw4405etw
	wqLBuky4sGV+9HMsxmYKNITHmW/K6urlqd0eB3p2e7UaQMiQzW+at8Y9j5BPTiIPj+ZE/vfRwj2
	/XfTZyqV6hZcrgDFKbtgkN5HYiWnnvId+mPT6dVeqcBq4kwNFutnj7ZpbIG32kPjt9Xt6Vx75J9
	y20TgFWOXJTNUCWVZpznElWRNsZ4ARr6czzPXyPVPaYuifuw==
X-Received: by 2002:a05:6102:1609:b0:6f0:6293:747d with SMTP id ada2fe7eead31-6fef9988a02mr5765007137.14.1780862476961;
        Sun, 07 Jun 2026 13:01:16 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:6f0:6293:747d with SMTP id ada2fe7eead31-6fef9988a02mr5764831137.14.1780862476161;
        Sun, 07 Jun 2026 13:01:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091ccbsm41273641fa.14.2026.06.07.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:01:13 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:01:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25ce0f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IAKb1KHifIJ-sTjyejYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: aHq8KD4ANYiyM2R0ovkF49Mh2psVkMAv
X-Proofpoint-ORIG-GUID: aHq8KD4ANYiyM2R0ovkF49Mh2psVkMAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMCBTYWx0ZWRfXxtpgZClKs704
 ofFR20XZM4NNVBEhb1wDXJNIE2nwvw7K/aa8wXKiKUFHb30BnEMOJvinDpWDcJpKD1atOHV1eD3
 PzRhhRrp3gMtjVhyKbq4uMsIVGVJ2bs+kOZTyTjqjywbzvaFpdAIUulrCqDb0/bWqG07+H/5/kh
 m7+dYz/CYBSrpuwjVMbLsn8h9SaAPXnjQzUTgRDBQrBdOmVWXtel5cNuO82Q4cHDXpGc4fYNA7j
 F+s6lY/CMNSEfAsuWg+VT/dCTPDMJqrvdHu8Q9tnkv86ddRKbUEDQLoI+uh13txWb9GhiQZCB18
 j6Xl1iJKTd/neVGKTC7ylrFbHDudrysZqijBvtKojPSAsv9iarnok6xyzew7QjbEWuJtblHqVKd
 VWTks/2G+sEG2iZ9n8GFqsJdg9WYvZUcHKleFD3iLT0T+tayO7nmT1vjx6dtG//xxPkhXmyzHed
 tSz5s5HkSyMSqhmB+jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111589-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[h5losfunylr6:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130D26516E6

On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> Add a dedicated schema for the PCIe controllers found on the Hawi
> platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
>  1 file changed, 204 insertions(+)
> 
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>

Stop referencing clocks and interconnect header files. Replace used nocs
with ephemeral values.

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Not looking around should be a sin. Take a look at other Qualcomm PCIe
bindings. Compare them to yours. Then fix yours to follow.

Hint: the extra soc node is useless. This is just an example, so use the
default, 1 cells for address and size.

> +
> +        pcie@1c00000 {
> +            compatible = "qcom,hawi-pcie";
> +            reg = <0 0x01c00000 0 0x3000>,
> +                  <0 0x40000000 0 0xf1d>,
> +                  <0 0x40000f20 0 0xa8>,
> +                  <0 0x40001000 0 0x1000>,
> +                  <0 0x40100000 0 0x100000>;
> +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> +
> +            bus-range = <0x00 0xff>;
> +            device_type = "pci";
> +            linux,pci-domain = <0>;
> +            num-lanes = <2>;
> +
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +
> +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,

<&gcc_pcie_0_aux_clk>, etc.

> +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;

-- 
With best wishes
Dmitry

