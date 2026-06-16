Return-Path: <linux-arm-msm+bounces-113408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WlnnI4RCMWpufgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:33:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72B68F5B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:33:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UYIvM3MG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RcS2Ssnl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113408-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113408-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE668303CD0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524DF27FD51;
	Tue, 16 Jun 2026 12:33:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166C217F33
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:33:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613186; cv=none; b=uW8N6iynAU8R6k6CzlGFOdVhfkpThd6uPMqwn0yxM/7WBDvHa0cU1RB4BAE+GHRAG/lRPRoicKkIZaxx+NsN9L9VUyeoZSv8pQ+jjM5gGQhJ7lOE0ot1Kyn54xuHzjjuV/cMTW6E3S+CxikWSCEF/iAwt+NOU/ZuxKCdcp+P80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613186; c=relaxed/simple;
	bh=LC2MPRRKKi7YG3GvDn89rbcy8u/XG56ENIpxJdMr+mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7c4/kifIiKJ6fqlwTT4O4Zd1pK843lI9whduhzPtH1cE3zI7szPv8VpAqhqfBogfIzJP8DMf9Jbyy6Av0PPn30+NmOegG/fJleY6RXiajhc4Y0abW5dVprUbHyv+e+q17katursoY0rgjBavjwkHzalMpEHTLQOoyteF6tK7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYIvM3MG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcS2Ssnl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9KDX2914532
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uc7tBpluxfzaCIfWGvGu3mOj
	RdTPF+6lM7MM7zDtwag=; b=UYIvM3MGzNeen4q3DuuKHwU2zX/lU5rC4XwiSs01
	duIvyBgbad54lT6hxzWN/0HDwoISgADaphMQB4LrdcqSMA9AHwv9ALYY8oLOUk+4
	e08CLuPr+0mjPkICJ7mOU3gq7eBsDuEwIdZO6HajK6TRJP2HI+bXCfvmfD3Db1bp
	m7nSMt8FFY9PgJPgkx+D7jPlRMmVRQ9kpXGSHd+PUGEk70yEbxXahEJwJdjxXykp
	1wjG3eOCFmLdx9MnU+yh/V4RlYgz9boAkiX3R72tw/F3tkWkN54e+Z3W5jNTfLo1
	BjaoQGO01qnQNspCw46S7ec8vYNY6Q6fNi7vhLYlYYnBSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1761fgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:33:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso3242775b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613184; x=1782217984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc7tBpluxfzaCIfWGvGu3mOjRdTPF+6lM7MM7zDtwag=;
        b=RcS2SsnlZLmIJl8iYfUw+AVDLDLr7+cF896wRZP2P/hjVb5mCGeklXtd42BfgnMcDf
         uVAceFZjob/8h2hYcbubnelsMp1AEjNVUO4LVdsUukANt4cV/0FC6ZJNwQA1zKlOSLtl
         ayC2rjpHjGWhKQOfZsOnXg21q8YSTu8aSswOB6cCjWKIVteCWBgfEc8skDR9o/8wqKaL
         VDvwxW+fPZZOi8S4EOeLJ3pPtE9B6P1bVznW9GoG4lT2trO/5Cx0uK6sTkM5kgISqi+3
         tF2LtwGbZjMW7f4GFYJsfxdDz29S3iKYMGk94G92y1WGABYdEmsDRMRBPcTqpT8E0adH
         5VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613184; x=1782217984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc7tBpluxfzaCIfWGvGu3mOjRdTPF+6lM7MM7zDtwag=;
        b=WHG0zT0s8Im9o0/3kDNB5LILYgucsQ0w7rXcoZlfEAuZzYRSNLaV2ShTNRd1yPRXvn
         kck+IXJA56GOcMwp3YgiblGW3mMNRua966S3EEUlOs8Q7/sZrT/zQiQIS6KfutbrwnP/
         gcvVfy3vkkr31LWdFe1kZWjV1H6p9K1iUdpaZmZrTWOtv1EKtOPMwHzLXtR2iGmpRI/z
         xROIIUjh+cnhNHI3JK5oo0Zg0KzyIgo/84ElaO6XQmlj7GCHdOVqxQ/+OFqcSDz7048H
         4VatwICwCt1Cckwe9zbuvmdJ/Td0hqEI/CinLu+4w5NPEmNrc5/gJvTQTs565jMmv/tP
         fiFg==
X-Forwarded-Encrypted: i=1; AFNElJ+QWZYDTuStWgiWNTri+8RI4odmv6HY6e6VZOW+kE6m2MHKWI0FBEezmqt/gIB8kgLUgvV75kDdguQ8hZk4@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMehj65RWptepG315aiH83OJo53kY/kwmLh8mqGrfdaiyUmud
	QrkF03ssltvjN12vsRZwzFDA82NiQGhFqVs7HMBZYpvk8YGOpN/8Wp0amfpJfJMzJTMvyVYvXkS
	MWTjwIhMo47t7cUllEVEUagX8DfYoIubkXnS5PqmwGyzGGDZTcRxrJDqHmvPXUPPYkwV7
X-Gm-Gg: Acq92OHv1+my/l2DFjrJdgOkuVS3g7zUMVBFWdzaggNtUqU2WbPe0Sst2h1He5sOBsR
	ISapbeWHQBw+WiX42CfdHqHjWCDn1KQPZqcDPcdm3fZ2HMGeeNnNIBd7Zhw6x/E6C7qvJzB/Cma
	lqrZmwnxQRNtH7iRy/rQEbVrrvzATeaNBNrJcGMpCdg2DWHmMKrgCcTUZ+PeNajnyVn0gqJsk8K
	XGKRRNpupyrKW77PZi/hs/+4jssG9bgT9Qw+HWY//46CURujmqA165vYljy6lIs+zHYtWss2+PI
	g8NTny73NCnA0RXqZ2AtNrexruxkt65F4AH/6TzkSdPkCF9zQdZFbr8WhsAO3JgzJOhDq+fJag/
	A3lIBqpNp0Tffw+tWA8pVXq2Vdr7tNryR69I8IYWim5w51u3CV0qoAwQS
X-Received: by 2002:a05:6a00:2d05:b0:835:3861:812c with SMTP id d2e1a72fcca58-84513f23f6fmr2896388b3a.23.1781613183542;
        Tue, 16 Jun 2026 05:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d05:b0:835:3861:812c with SMTP id d2e1a72fcca58-84513f23f6fmr2896365b3a.23.1781613183019;
        Tue, 16 Jun 2026 05:33:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm15663212b3a.57.2026.06.16.05.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:33:02 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:02:56 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <ajFCeCEsNbkcGKo9@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
 <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
 <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
 <aaWnIrIMDgXAY7jo@hu-mchunara-hyd.qualcomm.com>
 <4gg2xq7mdx7bni2acicavtq3ogwupe4ok6tehh7rmjarldwb3x@j3cgohnd764i>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4gg2xq7mdx7bni2acicavtq3ogwupe4ok6tehh7rmjarldwb3x@j3cgohnd764i>
X-Proofpoint-GUID: NkncNFFu5L32wmTwoF6qvr2ccOBLjV1V
X-Proofpoint-ORIG-GUID: NkncNFFu5L32wmTwoF6qvr2ccOBLjV1V
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a314280 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=T0vSrIAX6HVucII9xVQA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX1J/6epH+j24J
 Ac3jaCT71NXFNpXrticWk9w6eNGA09EjwYTD2LhzDEv+Qy7HnsoQjdpKj5+Nqnz4tfiG/BrmpTS
 8IYp8d8+HWC561EztGDmyNSPW1Dy8ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX85W8OCRpJ+I4
 67F+LSmBpLAbhPAZFpo2XddbEUO1gtsN0qPNDR17YkE4BJjuoWwZJlwwg60HiWALs2o7aCl0Quy
 WlPFo2lT1HOPt+dM9fl2XJpg6StbSfqtm9NMIB0/ig8wvO2qtatC+t9QqBHXVpbdxcbTqvlc2g4
 +0BjCDN7AHBjhDlAWBicWTeuZBoYscNKTzjTJvSbZKBlJCu13Dn0zKBVAJKgeOdP+Lt8SGA46NA
 ual0oOXIsTIOe3eJtNdOJF2hopek/4zCdNHgV3/1p/UW2Pm78BWXiV+842PVJ3Ftbbkb8b247hY
 iErgaNWOH+QgB5tRRBgA7+yVH54vi79xPaOmp7ZRlvuxjqoXsiOjvv88hdo+9H8cdTl1x2aET+/
 T8ACml+bxtUIHUkXvfTJy1DC/gbTKzXFJkcxHwcRq+KoNUn+EW0D5S8AgGRsxXXkkdsOltGTmwk
 4T28CZvxtpyUIc26+VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113408-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mchunara-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE72B68F5B2

On Thu, Mar 05, 2026 at 06:51:09AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 08:35:06PM +0530, Monish Chunara wrote:
> > On Mon, Mar 02, 2026 at 04:47:41PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 02, 2026 at 08:07:23PM +0530, Monish Chunara wrote:
> > > > On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > > > > > This series enables SDHCI storage support for both SD Card and eMMC on the
> > > > > > Qualcomm Monaco EVK platform.
> > > > > > 
> > > > > > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > > > > > cases. Previously, the common SoC dtsi unconditionally enabled the
> > > > > > 'supports-cqe' property. This causes regression for SD cards, resulting
> > > > > > in timeouts and initialization failures during the probe sequence, as
> > > > > > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > > > > > with the SD protocol.
> > > > > > 
> > > > > > To resolve this and enable full storage support, this series:
> > > > > > 
> > > > > > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> > > > > >    now only enabled in the specific eMMC configuration where it is
> > > > > >    supported.
> > > > > > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > > > > > 3. Adds a device tree overlay to enable eMMC support. This configuration
> > > > > >    also explicitly disables the UFS controller to prevent power leakage,
> > > > > >    as the VCC regulator is shared between the UFS and eMMC rails on this
> > > > > >    platform.
> > > > > > 
> > > > > > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > > > > > 
> > > > > > Monish Chunara (3):
> > > > > >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> > > > > >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> > > > > >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> > > > > 
> > > > > You are adding two overlays. But what does it mean? Does EVK has no uSD
> > > > > / eMMC at all, having both attachable via some kind of mezzanine? Is one
> > > > > of them attachable? Or are both cases present onboard with the correct
> > > > > one being selected by the DIP switch?
> > > > > 
> > > > 
> > > > The monaco EVK has both storage devices present onboard and the desired one is
> > > > selected via a DIP switch. The overlay selection logic would be based on a
> > > > fitImage metadata entry that gets populated at UEFI level by determining the
> > > > currently selected storage device (eMMC/SD) on the device.
> > > > 
> > > > Hence, this approach becomes robust to enable the user for using either of the
> > > > two mediums, without any additional requirement of reflashing any images.
> > > 
> > > You are answering a different question :-)
> > > 
> > > Let me formulate my question as a review comment:
> > > - identify the default DIP switch position
> > > - squash corresponding dtso into the dts
> > > - leave only the default dts and non-default dtso to be applied by UEFI
> > >   if necessary.
> > > 
> > 
> > Thanks for clarifying. 
> > 
> > Default switch position is on eMMC on Monaco EVK. But as mentioned in the other
> > thread, there are a few boolean (flag) properties like 'no-sd', that conflicts
> > with SD card use case and cannot be deleted in an overlay file as
> > /delete-property/ cannot be used. Also cd-gpio and regulators used for SD card
> > would be redundant for eMMC.
> > 
> > And similarly 'no-mmc' added by default would be inappropriate for eMMC. This
> > being the reason, two separate overlays were added.
> 
> This only means one thing to me: UEFI mechanism needs to be changed from
> applying the dtso into directly modifying the FDT in the DT_FIXUP protocol.
> 
> There are three options which needs to be removed this way:
> - supported-cqe
> - non-removable
> - no-sd
>
As per latest discussions and the approach finalized, will be updated in the V2
series, such that the default scenario is honoured and no-sd-no-emmc case is
also avoided. 

Thanks for the detailed discussion and suggestions.

Thanks and Regards,
Monish 

