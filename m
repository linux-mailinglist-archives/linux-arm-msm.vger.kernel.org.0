Return-Path: <linux-arm-msm+bounces-115316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uQGUKo90Q2rPYgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:47:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6216E1576
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:47:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nJ3ufCCX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N7oMYpLX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 273113025495
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D536C3C10AB;
	Tue, 30 Jun 2026 07:42:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1E318EE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:42:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805359; cv=none; b=eiaXzh49p1jZ9zU+RRJ2+g8h3tsSh9lIf+2Fip9o42jJaj/0JLNvoT0u1h+SzrBdNYnwb1qu61YEIOeQC8UmN79ERkYbIYP6nfpO2cj3DqtG6GBQsQ+K5PTgVThICb4i9sNKw0NfjiGlrNZbWzqJXXXl8yXvA2fbrwB9SwkQ0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805359; c=relaxed/simple;
	bh=wUO9hGeyjWgq0u4+I/+vR71BxdfM3TdokDN66TF+0oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlOCcvu6FDweKfE3zkmEGjEXBsOWTOcHjjS7dASBXbRxzaMhHchXTEm63Z2khYSM8L3nP1W6iWHCI1KSotyALORBlpyRg6Kao+CchuoGBaBfp11uq+1ple1KBzn5lRzcKD7ZAAdD/5YRLllr8EGFVdSOX19ScsmeFoIdK/JklvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ3ufCCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7oMYpLX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKHb999637
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9OVOpxViNJp6xIYKCtstlSpF
	T5v5gqax+pc8jSVAyno=; b=nJ3ufCCXNKcIKrdOKM+JOcsF62e9fw9OeNYqHLIQ
	Ev3OXyz2WlUUhMG6Wr1T5Erx1JDO8QtIjxemN/+ICrVhUdKJdSWSD+HeT+TVM1Qh
	R83hAKIE1JaUYaUKodIoTYjej7uRBVeCr329xaX0EV2fHV2H1vOe09ENoV3xE+yX
	AqyV2SvF5yOmE0yqoHXGnN7OoIIwKUvha011IhSO5EtNSKl/IMsxc9o4TkD6cn3A
	r+1ae1avX+1qNw3R7GdfW2b9xSxBap+Wif48YDU7BwSs2PIm9FAaDKGth/W0FNkv
	4k8NcUodRanaZH4546fdA35F5Briukl0C6h6DgUP+4E1og==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j281t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:42:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139ca26403fso3228264c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805357; x=1783410157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OVOpxViNJp6xIYKCtstlSpFT5v5gqax+pc8jSVAyno=;
        b=N7oMYpLXf8b1HRxYiiZ0KL79JmEQXm+26U+4phQw3HW7Tv9K2UKugt8P4S07KhC72J
         /qB9yEWe3m6EWwVsX3g/aB4XaskBT2w4lv4YSwgZ62J/ZHexxUXE0ONc/0Uo+QKIOjG6
         l8COwMzfS6mfve8A+uBPQypMCZ0Gb1gg+AjksT0vDSO+3k43xIQ4Uyd5NDlUrSuxssRw
         LjUBYVyriN8q3qZgk7amFwwwyqiv9NTG6mxPntfB5I0AOLNEDyjzeTBco8EW3+pD4LC/
         KkHeVad2x0OxqFkTHEwZoDZWEqkTHJKJIsOptt82T5hyordH4QOx60LM4QyzE58lKNnD
         34cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805357; x=1783410157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OVOpxViNJp6xIYKCtstlSpFT5v5gqax+pc8jSVAyno=;
        b=rK/5hCIENogKKmcDbCD344ZKlryVQv8etdfLTun4H+bkGM3zpLdDeVEmoBMIfSdTHT
         ybfCSPHUTQw4w/TFyP84tZ3gmApkyaYEPSfF0KEJ2QMlQPPjkUIGTywMi6q2yM8ckqqI
         HnKJZ53Rz6nnHX8PEwG0HSCQ62DWjmF18rfwmDoSAXX9d0nJsUZRWlohsDiGK9U3X6U6
         8Wv7H7AaA4YJs8m5crrKaLc2jhhzx5kVZ8O14va4h7RIWYzfti00BjrE/IrSEoHhOCCn
         36SKPffqubJ3w2vLKRRmbaYOBHtftI+foMzGocJzjld6Uj7QiZ8EmvqP3Ue8jTNVGBCN
         d1EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w3dHuupqSQImmcSZq/tfiiy6el2NYymN4ZBwrzikLKYIcZqqsfV3sYXA8MGPmbrsIci0o8TzXFnf9jFYT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/c9iURe0sXzB19aDWqufw274vsgqi7ONoL2boq04nJspyvu0E
	rHpkbyCcszVf5mbIPg5dSe/Ow3qG/zuyzWOOkr/pnXvkBWPuFyXFyS4GB25DTM3jaGBbPBVfv8t
	+OOgzamEw8wIdAl2LhVjgyZ2FOUerziC14CCXieasqBqoqGv4oIDPdLV3sWZDLaI6mbN7
X-Gm-Gg: AfdE7clcZp+E73lQBNC/4jIqLENCzr1DWjs1zBh48IJaDBtuXzDF2PmBXQNM7ppSoie
	IN4Kus7P3ISltCiffaJWqRmZgSufiSHySOKdkICA+f7LC/z0//Ibf0GB4X9wJREnAairSEQDYbD
	ZNBZGnPEP5invjkgYl4JMNaBSfe1BcNRqpWgETMd8NPZ5d+wJJR4OBSvd+j7DUPgHOQezM664wp
	BdmKkXLO4k+2zKZNvltXhGuEzwzueXst2BohciN0Bd36TlQp2YNekw/4G7iW/xuHra9GtG3kHWO
	sygZ48BIBd1oAUtay2Z/Htzlodcr3NQVbSO+aGw0xEGXZXe2NmB2PQ68q4TAMtwGJ3O26V8BDmJ
	TqGApiz31/AB+vWFXfJiNtIPPGnoa7YnCxJzZjcOT8/OEMDfIE02+YUxdEygOKyKcqIZ/5hpD30
	QzuCVN8IBGkuK1S02ltSeYCkY/gxVkNqv561xLJ4T7
X-Received: by 2002:a05:7022:117:b0:13b:20ad:b98c with SMTP id a92af1059eb24-13b2a1c0a81mr1576979c88.30.1782805357003;
        Tue, 30 Jun 2026 00:42:37 -0700 (PDT)
X-Received: by 2002:a05:7022:117:b0:13b:20ad:b98c with SMTP id a92af1059eb24-13b2a1c0a81mr1576953c88.30.1782805356480;
        Tue, 30 Jun 2026 00:42:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm4253429c88.3.2026.06.30.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:42:36 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:12:30 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Message-ID: <akNzZukjL0dCCVpO@hu-varada-blr.qualcomm.com>
References: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>
 <20260629-boisterous-lean-bloodhound-ea0949@quoll>
 <2068d47e-e201-434a-816f-27c3fa5ef889@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2068d47e-e201-434a-816f-27c3fa5ef889@kernel.org>
X-Proofpoint-ORIG-GUID: Cjy0VgPzT-HBSdfjrXnKR6WzY8T5Soh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2NiBTYWx0ZWRfXyOPiennexTaf
 2Kf4Odl2blwqdYiwiY3Px4sA3ZAbEgmsBAY3GtFROiIk3BZdYjtJ9x8Z2xYln9Or0j6h3/dZCNT
 YEoDLBAI+fPWWV1nXmrwzpB4sASi5CJd6D0NHwso5RpscvCgKdAcp+4ZMxuZriqTol9h6p4Vnkx
 twKo1S6bRA0g1Imssh+jogA1sZN/cRD9Y6LSTwqjmt1HGl+3DkXfmXi5kwBt0ZTL6A0I8HEkvJb
 j2m2Jzi4F65aIoFNH3j6Xyv5uKlrdmuUzMjIQ605mPhmxAzyGeVBqmQOT0PyOENdS8xeFaApw3U
 mkijZEhqKC7pcJsijwhW2XBic3jf0aJCXiayAQtEFVMGAWo0lEPXH/dV8vbisytuKzMixH5YDEC
 XAfamsUvJoiibbNne3ml3NixOiY/DozDZ30KtT/qLR191qr0ik+pJqCSnAaOMBKcdK8T6ZJrKbZ
 dufyQTzGY9JffUuYgdA==
X-Proofpoint-GUID: Cjy0VgPzT-HBSdfjrXnKR6WzY8T5Soh1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2NiBTYWx0ZWRfX6pucW3MKnRxs
 KnzZLnkJp8WtBhx3KfSrz8Cj85SqNJJIFTairHI7eHbGBMFs6y7daSBWCbEGkvmqZzoEkHodhNe
 +2qHQJuAKxXw0ecbL6iFQl4FZ5mua64=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43736d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5kZnj-dxASKV5PTaM3gA:9 a=CjuIK1q_8ugA:10 a=s5zKW874KtQA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,hu-varada-blr.qualcomm.com:mid,shc-kerarch-hyd:url];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:jassisinghbrar@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D6216E1576

On Mon, Jun 29, 2026 at 09:29:47AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2026 09:27, Krzysztof Kozlowski wrote:
> > On Mon, Jun 29, 2026 at 10:10:46AM +0530, Varadarajan Narayanan wrote:
> >> Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
> >> APCS mailbox compatible as a fallback, so document the valid compatible
> >> string combination in the binding.
> >>
> >> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> >> ---
> >> no cover letter contents, it is a single patch
> >> ---
> >>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> index 1b4ef0688ca7..39bc374300c3 100644
> >> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> @@ -19,6 +19,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - qcom,ipq5018-apcs-apps-global
> >> +              - qcom,ipq5210-apcs-apps-global
> >>                - qcom,ipq5332-apcs-apps-global
> >>                - qcom,ipq5424-apcs-apps-global
> >>                - qcom,ipq8074-apcs-apps-global
> >>
> >> ---
> >> base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> >> change-id: 20260625-mailbox-01f977bcceec
> >> prerequisite-change-id: 20260625-apss-clk-ed39c40ed468:v1
> >> prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
> >
> > Same author, just squash them.
> >
> > I already complained within Qualcomm about this more than once. On the
> > mailing list, on the internal company-wide open-source channel and in
> > person now when I was in Hyderabad.
> >
> > Repeating the same is waste of my time, easier to have blanket NAK on
> > your patches.
> >
>
> Oh, wait, this is even messier - when I look for these in lore, it
> directed me to that patch, which I took as some other work. That is my
> mistake, but still problem remain:
> 1. Dependencies are not easy to find.
> 2. The clk change-id is found and I do not understand why you made it as
> dependency.
>
> You are not making it easier for the community to understand this.

Sorry. Apologies for the inconvenience. Had posted three patches in the
internal list

[PATCH PREVIEW 0/2] Add APSS clock driver support for IPQ5210 - [1]
[PATCH PREVIEW] dt-bindings: mailbox: qcom: add compatible for the IPQ5210 SoC - [2]
[PATCH PREVIEW] cpufreq: qcom-nvmem: Introduce cpufreq for ipq5210 - [3]

To test the cpufreq and thermal sensor based throttling all these patches
and the tsens was needed. So marked them as dependencies. Since there was
no negative feedback in the internal list, and the files had different
maintainers assumed the split is correct and posted the same for upstream
review.

Should I combine them and post?

Thanks
-Varada

1 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-apss-clk-v1-0-8c423d3cb94f@oss.qualcomm.com/
2 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-mailbox-v1-1-24b766dc2ebb@oss.qualcomm.com/
3 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-cpufreq-v1-1-0a1f26d5b734@oss.qualcomm.com/

