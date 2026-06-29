Return-Path: <linux-arm-msm+bounces-114829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cz8eEUj9QWocyAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A16D5F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:06:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AqT4SD1c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fimiizBz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AAFC301F9CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BCA368D7C;
	Mon, 29 Jun 2026 05:05:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C218DF80
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709554; cv=none; b=ipcf0lfek/IYmCy1TPtdj6CwvRyKJE+JVRByaIkmfTFik5+1nj/KnNxXBzwJe6RtHiZlD28Dmxsit+MkPz8foHzHEz1pY0Y4sLoYGi/r0g3JgqWdEToym3pUwtScgFs1L8UtnsqviRm2NjOGJN+UiMcTe9FPRDft9HcbZfZHvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709554; c=relaxed/simple;
	bh=0UZDjBWwpZLsNJ2uJblfbqB6wdN21DW6si4zLBTKahc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRokmjg4nVw+2nef4XJnGdEHrgBk8ZlplWMGPGCp8KJMAMKFfp0bd9oKmC3N0VVut3InI9P5w96VreaF1xpe/DuNJCoV+IrE60bsLwuMmMTiImxIEfbjK3Kl1s+NWP2baJxcc7cVMOld89pr+F8a3QGvJBWUTWaRiyJ2pQ/u3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqT4SD1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fimiizBz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NICD1771505
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SphvedPAcYBkMmYiWmMFQ6HZ
	BK+WcQTpTR5JD7DeEok=; b=AqT4SD1czj6Rmf5HKmxAnT8OhcM+udBreSvm1L16
	OS4a7Z9ZNThNVM2O0FMMdEnKzbiGXloHUUFot6e+tY5W0DbIbpUN85cduySEU5ma
	1atSPNkA3qeQJfA87AhQl1xd0mIcLd1jCspNWmaKciaGpXYSw4XpkhVIGVdqi4sB
	Bi0VMRekZ0YGqYHDWnyY8s7cTniRm7onrYRZ0Y5QTjNxYTndx1cCVK0S2k67i26d
	qN0Y2/VKTxCQP5J7xQ8zsvotgNUHA5waUPtEJk7mZRo3fwD2UPBYfdYVTYxwu0Hm
	DcR9P+p0TuuW+PBZ5tsLBKvNkr9jKJnU2qBAS/sC2AHNIg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumfu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c62861b3bso9528023eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709551; x=1783314351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SphvedPAcYBkMmYiWmMFQ6HZBK+WcQTpTR5JD7DeEok=;
        b=fimiizBz2xK5IRhlKPEwqgCaitEkaYbmpUak3rBTpUUzCRZomWXzM+oogXBieo7rp3
         u/gUr6N/CNQDmhGKjcstadFsuPasqbb3nEL+NuzvAipgcqTFwyIxQq9Urwv2p0gWIt3e
         hh2U8h8lhm7lZdFDTJKZ+50QhkxbO9wTXicbC/+/pNxNhHx7xEtPbqlR/t/eHq/nu9Gk
         GCRNrpVk18SWMaK8PDvv9sHICcqy28RKRHqS6Gjh/NHZwpSxkPPbf4xtY2LD5BFqJZSj
         cOw86vmFtjCYPEPQRWRisPqvAk+lXQdmPt8M9kv77deZgeYVCY9Q1DM83ZGODam/5AOv
         Z3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709551; x=1783314351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SphvedPAcYBkMmYiWmMFQ6HZBK+WcQTpTR5JD7DeEok=;
        b=nJBVRiZCpfKQQYQv9UhaFjbWlIXMTIi/V7IqKkrD1RQgBlIfHUGErUkzfzoVjCDtoL
         8O2TRhFbZxrSR13h227bzRF/0IILYJykZJhpfIGNrYRd3K3b8Q+WecAsUCeh3l+68+5h
         tdp/l/6TnF3wtaEnodvm6dR3ldvI19O/W/lyUqWlhcfy4fg9VlaVXGdJUVTXnCAOcef9
         ukfJ0awSjU9r3dwKJtikWFWztcS7uuyPqli379E0n3+fGaYqItd92TKPyCZhW8dJTGBY
         rHKk7CBUPQEK/ny864EIAixHL2ZOwMINgW3jDNPE58vNbvZuLZAw3ZR3Yz5hP0LAKqhW
         JxBA==
X-Forwarded-Encrypted: i=1; AHgh+RoYSCf0eSaQppZ3T9Ju6stGVC4tfSnCD+ATP1Ku+TUEnPcw8TIfwGSy+iEVv19e6MQadwlJYNf9YTrlCWRj@vger.kernel.org
X-Gm-Message-State: AOJu0YytK1ezlucQPGJgfT26ZDeMECzRhNGxBQ1MiGZgYHYceN0jn0TH
	jdX9nb+PScDes06QLdngjW/ue894KxzFY4Le7q2+/SEijUMSV0a7+u//X9q7dP67rjIT/adHY6W
	u2QfjXTL18yLpjM7duqWAZ39zSwQnABL821UMujszeJ9n1M6urjmi0TEGjAnWPQojLUMx
X-Gm-Gg: AfdE7cl8+U26orBC8ZAa/KnwLRKg4tV8NIvfnCLfhCwoxAM+l1GWHiIhNXFRkflqeZK
	/Mk4kVyHUbXguyf9rSYtsdMx5HkvTKNa2hFLr2kTY+6M55YqoDfEadT8xGrs2sI/VQcYhuL8zDg
	y9mZre3DHT/lsXd2Xw2os+99meIfIZ6+H/cHHZvLoITDRTBIVwPtZGIy2RnqG/TS3d5190rYbkl
	uqSU8uFLGswaGP0qLKcb9gLUe3nPC1hTl5HG4spizGuxZItKUecQp5nmp5+yWdGIlUjE/t9+VSa
	H+yaYuCkAAdLGVhDf3yltxUYP3Lhu82mm1pwv9p3V4V7+M1iYAdDDJwi+ZNOGuGCGJTRopJJryu
	ttcn5W8sGZsODhQjYxII9gODwTA2G4e3x2bHtxpgAyXGKCxP6VXmNIsvZDg==
X-Received: by 2002:a05:7300:2203:b0:305:56a:c38f with SMTP id 5a478bee46e88-30cab3855f1mr9060495eec.26.1782709551117;
        Sun, 28 Jun 2026 22:05:51 -0700 (PDT)
X-Received: by 2002:a05:7300:2203:b0:305:56a:c38f with SMTP id 5a478bee46e88-30cab3855f1mr9060472eec.26.1782709550644;
        Sun, 28 Jun 2026 22:05:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f14f8asm27950230eec.6.2026.06.28.22.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:05:50 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:05:48 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
X-Proofpoint-GUID: IgOJBPZ8uvp1NYXlfnDvmXYj_jdMJAi2
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41fd2f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4Le2suw5-MkOVKQ7DJUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: IgOJBPZ8uvp1NYXlfnDvmXYj_jdMJAi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXwM3mWPOmVuPr
 c5cou666RjeX1BUTsLkqnhaDCB8C5SwmB+253jOc3L4gPc1ZeqspT/pRDnLuTPzSwzS+FclfAuA
 rck/UnJx1VG1GCN/XynNkWXA0/1Kr+qbcQz9ovWcetzA1lbP1XuGIHdHkoE8NBj8Pv3bvyp0bVU
 BNUAfrAGnX2H3uNsrhfDjpUJ1LLjPPxwyKc80ssze0La7f3xt4EkLJx8X+SGTlVbrz2upHLrbOX
 bh5HTZm/TioElxyCiGh3oruzCk4OwoRMoMDe4hYACs++rgW9hRW1hOGa8YvV7AS8lr3zxJOOBwS
 rRS2HloVWgbKw1u62Ot4+xZEjb3Zs5Q3hbGyn+umzemvTGHWsJcQFrzj9GY+YyOsdEHLDIAF7DI
 xBbucgr5HHs3WMeC72wGAZ55gDJhF0z5J/7dICvhNte9budqqn4ciYlcKnppD390InHsSLDf0eo
 8/zPh6wBCFrde0uBj5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXy5ntjsHqIl9V
 u6UlCe6cxn4csdWit6/Sie1aIPLGk/Khwt1BDXrfzwfPjIE7RsUKE288i1Fy0XebOtjLBKMCImq
 rErnAMdwhdGSAGtvbw1bRmJ9nv0h08U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B2A16D5F8D

On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:47 AM, Qiang Yu wrote:
> > Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> > PCIe3b as consumers of that shared PHY provider instead of separate PHY
> > nodes.
> > 
> > Update the DTS wiring to:
> > - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> > - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >   &pcie3_phy using two-cell PHY arguments
> > - configure the shared PHY node with link-mode and dual pipe outputs
> > 
> > Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pcie3a: pci@1c10000 {
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01c10000 0x0 0x3000>,
> > +			      <0x0 0x70000000 0x0 0xf20>,
> > +			      <0x0 0x70000f40 0x0 0xa8>,
> > +			      <0x0 0x70001000 0x0 0x4000>,
> > +			      <0x0 0x70100000 0x0 0x100000>,
> > +			      <0x0 0x01c13000 0x0 0x1000>;
> > +			reg-names = "parf",
> > +				    "dbi",
> > +				    "elbi",
> > +				    "atu",
> > +				    "config",
> > +				    "mhi";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> > +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> > +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> > +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> > +
> > +			bus-range = <0 0xff>;
> > +
> > +			dma-coherent;
> > +
> > +			linux,pci-domain = <3>;
> > +			num-lanes = <8>;
> 
> Is it fine to keep num-lanes 8 here even for configurations with
> bifurcated PHY?
> 
> I would assume so, given essentially this is a x8 host, whose 4
> lanes may simply be effectively NC 
>
Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
never enabled at the same time. When PCIe3a is exposed, it is always in an
x8 slot. But if we have a x4+x4 platform in future, we can simply override
num-lanes to 4 in the board.dts.

- Qiang Yu

