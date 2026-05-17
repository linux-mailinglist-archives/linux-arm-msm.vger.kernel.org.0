Return-Path: <linux-arm-msm+bounces-108072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JgiA3AOCmqPwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:52:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5456362D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3D430247F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CA23BB68E;
	Sun, 17 May 2026 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqLG13MY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNKU4PAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E77F309DB1
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043919; cv=none; b=CyputDLHm+HXyfTEkioXDi6TVsYpSB7GulGMmFko4AiLQsBt1dJ28YGAb9x0lbATHX0/hPyRxoc1CdXXxpsI5SApTnSPbMW2f4wo5Er8ek6ZkO+/Oik354GI7EC7SRVAQrOPLyYXLsHAVkjhs/jfRSE5PWiLcGfNOjTYk1XoC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043919; c=relaxed/simple;
	bh=Y5i9WcyiDzQjtJSx79lz5XChtinSTRrDP5DUYMTy97Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMLrHkk6z3M2ra25J1MTA2Kcy3YHxwdoDoOH2Zu/6hARxp65Rm3ahuV3WPGNAZqoAgWUUO2e/9FZN923MY9zul2SrXZibQWsG2jIjxyE29N05aUI5rbXnGCuqM6n9FKEdKcf4mWj2wDqPcCiucqAQXfCeb6C9sFIfQX1liYEDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqLG13MY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNKU4PAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5JS7c2566976
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8qDcE/JkXAvARu8IjsWPZkQ
	lthwgFQJ1bcCPlrXmHw=; b=YqLG13MYcGs2osLqpsGGB9+Ep4Lp7BVQA8pnn30n
	jkCl2uge06yWxC1xdsrYDWBfPghOMZkIYeohGJmDgi/e9hRhVqjqg8u2y/RhdDqx
	o1W3AgwnG9b2J9FjUEf+s2VAk5LM6c/1zKTytynM/QdjRxfC9aeE8SAYayA0r7wF
	O5m+gOAec4uFNK5IGzqavxEDh/6ASx5DIhCnmEh0p0MUS1F1g4q+4tXbj+Ie86p+
	3mm8v1l4npSsrls0yLneJYRfY/BDCgOJlf0S39CbRc6oOPIjQk61RhM4zYS+Zmr0
	1RrQtnpX57ZmRTS+SsAytHuKx1YGusMguwe1jERRJB8qZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqud16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:51:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3c7b989so33079871cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779043916; x=1779648716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=BNKU4PAAl/d/4hFcuu1gCJ882A6UYQAOoA6+BIhE9U5Qvb1tdyQjSzKk81MbVz+cFS
         JkeEqwVWdvWFi66iO1tDY2XQgB+q900XS5E+hdth+Qfz7Lsq8kB+609x3V/v79KOJsfm
         e/yULAAwQSa3oSpva5IeUR9TfRaIvcgyrl9h1ZyinJfHyYkBopg/aJ8+4WWqfSXMQqw2
         SBe7/px5067JENK4ZJNt38cYq83cs+y6FrqPxuuoVdAraD8hnA9z3HijUlok2kW3Q8wH
         xQHVAW4lwhKExwdRWr6vIY3np3/5KT6U+tsykprzGBljHvaRYm1zToREOzEk9brF2t8W
         0Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043916; x=1779648716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=a2t1FfOPV/6v0CKLHbdVXCVHbrY2DegeqNrpYZuDIqfLbvp8pPSFl6Ijj5oIBEgNwG
         KL5ciGQsnTrsyxakAxGZDrUSv16xedG5VLl6lXsbxDkJ2ob8ncpbFMVrkzfpmOMxufdt
         Y8pFfCp/1DNy7/TwrWfV1rehbf1+Evt4Tz2WmzHdhxQHEwlZv7UkKOcs3AiAQIZFHdab
         vnu5ZFFgUt8TWw2wCAJASgIq1ckagEtBKz4tXgOKxlmRGv9QeHnszRZVzpYB3oCEhboA
         MMUtXfIFak9N+0jzP9xoK1k4UgatEL/HgCd8zrX2WhtK1Xr0VwdVnGKV5xyxRpIrIaAW
         nfug==
X-Forwarded-Encrypted: i=1; AFNElJ+PRRo31GtxAMZYDItLLXyTSfKdU3bNwpSmT89CGQh77KXtQdCM6Dy2cKWiSGrKOFStBcxcmOZTtVT1pZhX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7h4Kugy3bzDR9QxB1VWGinMj7pxgDSXnjbETn+3vhmrtWhqOd
	oYN4amXkuACeGpp4QJVMWmxfRXL297Zoi1W/xvqebfodK/zxn74ERv30RHzfMjDgOYf4NbEDnde
	FN9gg7SDrBjygAYZndyBiDNR44rnlDsR+F2j2y1v035R7T1NiIy+t53tOMOz0ejtaX2TB
X-Gm-Gg: Acq92OGmYQcLiPJ6OFovatvCddIIKtGzKcJnMLT7OCEYsfHatNxHb/nnpr5d01iGaKL
	tqREpEQYk3yelgAeupD39bbgmr/oxSq4pRXPrUHTzFIWDIOcoGDccv8V63TdDXiV525pA6YclEP
	SRj/NyzDREkzqR6iXsr1uIgVs5GiVIaIm4CkoYujwzlXxUa7v2dxgdWVBGmKEShleNNpoKnqvcx
	4z5QjOx+B1gfYJhmGg9vOfATHww2I2E5Fn4AvK6VFt8LUiRcAwzqCfWE4rrfeeyDkUUZ8Fy6Swg
	QEUABpjqeyXI8GZVxSacChYoa6mx5BFLZECNfm7cBkTbjXyeFDh/jOek9Wp9XDDfhhVDk8wUbSm
	GgHt7mSbR5IkAXDYz5A5ld/iNrt4TDQEdQMNKciUtme7P/27bCEfQWWyS8qVKYxqYAgohF2URsn
	nDBz2pgSprHb10TO04Wy41HzyGaImQv6QuADs=
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162139331cf.15.1779043916045;
        Sun, 17 May 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162138991cf.15.1779043915619;
        Sun, 17 May 2026 11:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c74d6sm6943301fa.15.2026.05.17.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:51:54 -0700 (PDT)
Date: Sun, 17 May 2026 21:51:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
X-Proofpoint-GUID: mrI4PCSFN3zSKTlHY9PAPEBe6QdDFcwm
X-Proofpoint-ORIG-GUID: mrI4PCSFN3zSKTlHY9PAPEBe6QdDFcwm
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a0e4c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=92o4APbqSy6JO7topJkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfX904iVe/zVzfl
 qiYKoYnhkcNkUfZTtSQTBfXlddbT7AYg68bB0jUGwDJRezs1jjHp6OhlmXdyRgiqYlv4Kvcb+60
 fOQJVnmobfhWAhBAjJFBghSMF0AKi14gosCbaFtYJkAIXGtUagzlOIHsgSgYWGqXzqttWQkO369
 dAijVXPQMSd+o805Wt+m+xBUx3oM6Lnb8aaHO1ixgiRf3vKNBtaqWRqnYmgvnqQJLsGN6++MHAx
 HVHxg9sNQNTkdSVcBJQArP/QZi/wPMZEDxWUQwg9EJXCiZjDuFffqRhi0NrywiXe9faQAHLQ4ZR
 wpro+IQEjgeHNvM+LdydA9P3iqaNtKz7HsHboYgohU8X/Yg33Bn4H7CAbMe07NfBLx9qKWfQPM3
 zp7UyxdrbxFeVt5c2ogLAP48Tl4UQgRxhfS4B9Ru1DxsS9oaNm+5ztcvWZfgB6ilZd+JxUKW+Om
 L1+YUyv/O8Vm9goRg1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170203
X-Rspamd-Queue-Id: 5DE5456362D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-108072-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > Use the icc-clk framework to enable few clocks to be able to
> > > create paths and use the peripherals connected on those NoCs.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > >  	.driver = {
> > >  		.name   = "qcom,gcc-ipq5210",
> > >  		.of_match_table = gcc_ipq5210_match_table,
> > > +		.sync_state = icc_sync_state,
> >
> > in Kconfig:
> >
> > select INTERCONNECT
> >
> > OR
> >
> > depends on INTERCONNECT
> 
> In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> INTERCONNECT and INTERCONNECT_CLK.
> 
> Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> Please let me know.

I've sent [1], let's see if it gets accepted or not.

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com

> 
> Thanks
> Varada

-- 
With best wishes
Dmitry

