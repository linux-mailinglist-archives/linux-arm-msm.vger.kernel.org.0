Return-Path: <linux-arm-msm+bounces-113300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +lWALdaXMGpPUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:24:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17968AEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:24:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hXew5V8D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EIp3mpLZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113300-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113300-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB2EB305452F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5258B21A453;
	Tue, 16 Jun 2026 00:24:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF327707
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:24:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569492; cv=none; b=NcTU6IbHmzw+M7jFey1mW4BEPsJoSDy/9JoUoAUHm9Reov64+vfWFt+YFgA7hDTsyGG1yXQZyZsYJ1idnoJAZJFblxYxPfQg2PKDea/Qsfe+cK6Av9U5kIkZNWxEujAQP4c08oswTqvOHjM17g99/vXvXUGSekZDY2p13ymlgUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569492; c=relaxed/simple;
	bh=T/GAyTv+L7H8Foempyrb99XqxeTHKgF0+hJQyA//VUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFIKH70KO+G82ZZjfuX++WnApqAbrbxVeh/jy7mvOYeUNiGOzzJ/D6rQVAVB/re41AggwD8dD9P6eEk1Dzkp6ddZDTU9P0jh2f1sf+6x6ugMmFxZcWK7ky5aIlETe6RAvtxCEjBqdU6Fl+jUvFNmo/dGIyavdTX7nos8jPLAS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXew5V8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIp3mpLZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OIHm2154188
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=; b=hXew5V8DhYf+lndv
	z1mkdigZ1WnM24uptbXxOrBG74gSVaK+mUlB6RTaGpNX0GtgYDiMZWgj4H2EXatu
	clN04aNJAqePu/G3t/8QIqM7BrtvgofdKYI4/CKA2VnPr3ocyFJPpmryhhOUYl97
	iGTJAG+pr8ZcMq9TdpXcfwE6P+RUgHOZonS8bBiR1MlvwMBgSpJpyHZlRIIKpu4n
	dICtfe2jxRsDIkCWd5Om+aJHhJ3AmQ1oODGnV5+3C1qokRAQalBnZ7l1IfwZfXd8
	E9jhaa+j0rkTdhhmMXt1Pv3E0ZlrV4RxW6djhQ5+iil/TdCG/njFWHq1H09z04q4
	N1Kk8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc9vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:24:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91576c147a4so1011177685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569489; x=1782174289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=;
        b=EIp3mpLZ1n6DCnG0a6qabPpp/+mtDclMeI6rPf12aDlNErMlS3nICAp0UiELf4gz2s
         zxcxpMBlXsaRJRskaQ2NtMLU560MOLtSGzrlGFTGpLpSgpxjKeWTgRqdSuZPzzIq5TKG
         0PzJJmyJYTLOG40NWtnc29fLk0dAoch2FRjNHI7SswIC2jwn5s40OoIZophKUe/2ogmT
         Ce98W51K/sUg0cFm57jSBT5EsYS3vZ2L7Em3BXMWzKuXUdwoRc8WcSLbKotVZUMMGSw7
         ynFk9Tp/t1lFO0ripsnum8uEK2InDE8cKSFKnYmCGpVqKGk3GgJk/ja2u+0SET3lG/WA
         2/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569489; x=1782174289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=;
        b=tOZWWFPjxby0mpz1+TYGeljtRfFSuGQLCsDSj+eWlUWGtPSg1TTHL8WLWWkmbLaDJf
         pwfjyh48xtsLnDT7fx1/9yFN6aiCWwdjD/pVH97evTpxaEaljKtRzX1Grte8s9AmVyn1
         /hWX9+k8pX8TXQ6K1Gqe7hf/34uTOOeFeAaLFtO6I9YW9uQ6x0anagXqEvKrOKZs+Pl1
         73A2X6SASmeZBozxXWa5yt9lKXJpp4bFSMmpkDeVoTXcdksy1bNpLSdDvmGnKrZ0aQuQ
         AwYS5z53ATC3ehEq8dnJ5UvRUB1tUohnLmeQ4U1iW7DqhHsnjKXsczY51b6F8TbJ9bvr
         442A==
X-Forwarded-Encrypted: i=1; AFNElJ9WosTDJNig3fyL5v8WMqGedpE0IYSkBDUszHa/u/Kld3qwyv0qwlu5hkxcP2baDhD+vsdnDA4UoiY/Xril@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXt3ZI6zhubNhegy+5jhkpfyG9JF5pq5fIlmtyvNQ4aO4aThO
	elyqbqRnDcAMgtpFNr2HP84TME5wPCWicE8bmOeddIlYpc0FOqvlbMi7r4xMT76ySYiw7QtyjwN
	0Ol8Vq903DRBuNsBDIa+AunJhLLIFBaZ38Y1QoM+CtJzBYtJQzaLrkrrVFmCmrQ2pMPsn
X-Gm-Gg: Acq92OFCrMRrVl8xJeS9FPWAzgc9JybwA7cT/QGgALO4N2cbZASwjcLNN3LG9IjeADV
	Fu0/uTSUbSw2mq86S+rAXzqbkkpNuaen2udmnHNfREMsVLwCatSURkpYArz8H30UcprpW/mp+nr
	HGICrHNLeaGKWXmGSOputeyzNAQECtCSb4rDzLp5eemHhE16H8iNdoF4n147rqInQA9v8/uECOb
	6VYqOLEIjrv+f/mUjDD2pb0gzsuB7InXtMrX5W5OA70ouUgv/DtZsD5YNNlh0l4+gZgZzceZHUz
	ya7vhlrqS3ruK7I/IIjxYfDhKkdFtVMBgbjnKwvU67BPAZUUiBMZxKlZfQ+KYdXM0dr9z6l9IQG
	EMNNTTSm0c9j7Z5b00pQijZEuDKpRtmyKjjaO+Tz8SKvWMLW9A3v8diJs7tgtyOO3Cr/JBNQwBS
	5OluVCeFI5FInShVXxNyUkTrHRvsSdSsJsUEE=
X-Received: by 2002:a05:620a:460d:b0:915:cda5:27fb with SMTP id af79cd13be357-917f30f86b7mr2234740285a.54.1781569489026;
        Mon, 15 Jun 2026 17:24:49 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:915:cda5:27fb with SMTP id af79cd13be357-917f30f86b7mr2234735585a.54.1781569488527;
        Mon, 15 Jun 2026 17:24:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fd9sm3097412e87.46.2026.06.15.17.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:24:45 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:24:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <3vmdu5t4342pyx6etdtzu3wapvwncvue5nsg3q7jx3epnkq6gu@5dwpfn6egkqe>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
 <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
 <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
 <0298e09a5b4497910c226269daa2586b@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0298e09a5b4497910c226269daa2586b@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX7bXPhz0QASFV
 cNP4zHhC6T2mMzVwrMxGMMaU0IQ/fN0MPSPuKE1qeruyYOSpQoTguGKviAc3DJ+0cGjiPGLgbpc
 GuWD99Y6RpkU6XI4+qXd3K5EnSpfRpb9jKgpzYM8Vu5yWiB4ljSOmToNsNDS8psazZHd5ZK4xws
 zxhPdn+xrMnF0ZpWdo+EbpzQA4YpBUf4Q2YDdTKbzcOOikhHMJN6bJjZOdS60bKNxVLpfE1QFV/
 u9RcVSrkgcErXG8j8bLoe71FOMkdvozOB1jd4VImhBRapBUgphhbK2pCLTvHS40BudN8UQZ5MJl
 IFkHNoTGRel2O3V2Dm73JXg3vXgao1zY63+xDTEWy6CkVMlOjoh33mN8hHirinzxsqGazwdpZj4
 Jo/JS0gN8yRx1MnXgVWTorgTFZ14a2O9+H1nYb65MioGtV4wYvnerv/zw8Stj3JR8zUynOBbe9m
 13rsyEIbm6TEN3SQWcg==
X-Proofpoint-ORIG-GUID: Dbk3O2V0aWLszczI9WdqD5vSjOvpUFq8
X-Proofpoint-GUID: Dbk3O2V0aWLszczI9WdqD5vSjOvpUFq8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXzliHVfAatMbe
 +IFcfXI8Re6gFoTK8MPZe+iAtRI0qYkhmE6yJPndnuZr3SUyvMRbIxKv87Ua2KWiLYUH67i68QF
 +EI0Wy6CtA5/UV6JHWkQU3pUTXLHh1E=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a3097d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=cTwmTnRGAAAA:8
 a=7tWiRPGIeWnQM0iYfUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113300-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,herrie.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F17968AEA3

On Mon, Jun 15, 2026 at 02:17:08PM +0200, me@herrie.org wrote:
> On 2026-06-12 02:25, Dmitry Baryshkov wrote:
> > On Thu, Jun 11, 2026 at 12:39:45PM +0200, Konrad Dybcio wrote:
> > > On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
> > > >> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> > > >>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> > > >>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> > > >>>> (address, value) pairs that are written after PHY reset.
> > > >>>>
> > > >>>> Unlike the existing "qcom,init-seq" property, the address field is
> > > >>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> > > >>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> > > >>>> class hardware needs this range to programme pre-emphasis, HS driver
> > > >>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> > > >>>> via platform data.
> > > >>>
> > > >>> Are those register writes specific to the device or to the whole
> > > >>> platform? In the latter case please extend the driver to write them.
> > > >>
> > > >> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
> > > >> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
> > > >> devices), the writes split into two groups:
> > > >>
> > > >> Platform-level (same across all MSM8x60 hardware):
> > > >>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
> > > >>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
> > > >>
> > > >> Board-specific:
> > > >>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
> > > >>    devices use 1. This clearly depends on board layout (trace length,
> > > >>    connector loading, etc.).
> > > >>
> > > >> So the platform-level writes should move unconditionally into the driver
> > > >> behind a match-data flag for the MSM8x60-class compatible, and only the
> > > >> HS driver slope value belongs in DT.
> > > >
> > > > Looks like it. Please hardcode the value for your platform in the driver
> > > > (with the comment), meanwhile we can try looking up the actual values.
> > > 
> > > Do we have the values for a MTP/QRD (or whatever they used to be
> > > called
> > > back then..), like we would usually put in there?
> > 
> > As far as I can understand msm-3.0 and msm-3.4 most of the boards were
> > writing 0 here (although it might have been unexpected). None of the
> > board files set the hsdrvslope value (which means 0).
> > 
> > Please correct me if I'm wrong. I see that for tenderloin kernels change
> > that to 0x5, but I can't find a sensible commit message.
> > 
> > I could not find the documentation for vendor ULPI registers for those
> > chips, so I don't think we can identify, how to make sense of those
> > values. In such a case and having different board-specific values, we
> > don't have a better option than having a qcom,hsdrvslope (or similarly
> > named) property in DT.
> Dmitry/Konrad,
> 
> The bit-level meaning *is* documented byte-for-byte across
> every MSM8x60 downstream tree I could find: Code Aurora is the
> canonical source:
> 
>     arch/arm/mach-msm/include/mach/msm_hsusb_hw.h
> 
>     #define ULPI_CONFIG_REG3        0x32
>     #define ULPI_DIGOUT_CTRL        0x36          /* on MSM7x30 / MSM8x60 */
>     #define ULPI_CDR_AUTORESET      (1 << 1)
>     #define ULPI_SE1_GATE           (1 << 2)
>     #define ULPI_PRE_EMPHASIS_MASK  (3 << 4)
>     #define ULPI_HSDRVSLOPE_MASK    (0x0F)
> 
>   reg 0x32 [5:4]: pre-emphasis level (00 disabled, 11 = 20%, 10 = 10%)
>   reg 0x32 [3:0]: HS driver slope
>   reg 0x36 bit 1: CDR auto-reset enable
>   reg 0x36 bit 2: SE1 gating enable
> 
> The legacy `msm72k_otg.c` semantics for the 0x36 bits are inverted:
> setting the bit disables the function (see set_cdr_auto_reset() and
> set_se1_gating()).  Every MSM8x60 reference board sets both bits,
> i.e. CDR auto-reset disabled + SE1 gating disabled.
> 
> Surveying every MSM8x60-class board file I can reach: Qualcomm's own
> reference, Samsung, Sony, HTC, and HP: the platform-level values
> are unanimous:
> 
>   pre-emphasis     = 20%
>   CDR auto-reset   = disabled
>   SE1 gating       = disabled
> 
> |  Vendor / board                                 | hsdrvslope |
> |  -----------------------------------------------|------------|
> |  Qualcomm reference (SURF / FFA / Fluid /       |            |
> |    Dragon / Fusion -- board-msm8x60.c)          | unset (0)  |
> |  Samsung Galaxy S2 family (Q1 / Celox / Dali /  |            |
> |    generic 8x60 MTP)                            | unset (0)  |
> |  Sony MSM8660 (sony-kernel-msm8660)             | unset (0)  |
> |  HTC MSM8660 (shooter / holiday / pyramid /     |            |
> |    doubleshot / shooter_u / ruby)               | 1          |
> |  HP TouchPad (board-tenderloin.c)               | 5          |
> 
> So Qualcomm's own MTP, the closest thing to a reference platform we
> have, leaves hsdrvslope at the silicon default (0).  Two OEMs (HTC,
> HP) override it to non-zero values that match their board layout.
> Neither override has a commit message. HTC's value is buried in an
> init_seq array, HP's appears as `.hsdrvslope = 0x05` in
> board-tenderloin.c with no comment.  I've kept TouchPad's 5 because
> that's the value the device shipped with and our HS link is happy
> with it; changing it risks regressing eye margin on the silicon we
> still have to test against.
> 
> So the plan is exactly what you both already converged on:
> 
>   1. Drop qcom,vendor-init-seq from the binding (this patch goes away
>      entirely).
>   2. In the driver, hardcode the three platform-level writes behind
>      the qcom,usb-hs-phy-msm8660 compatible match-data, with a
>      comment citing msm_hsusb_hw.h as the source for the bit names.
>   3. Add a single qcom,hs-drv-slope property (u8, 0..15) for the
>      board-varying value.  TouchPad DT sets 5.  Absent â‡’ leave silicon
>      default in place, matching Qualcomm/Samsung/Sony reference
>      behaviour.
> 
> I'll send the new v in that shape: single dt-bindings patch
> (qcom,hs-drv-slope) plus the driver patch that hardcodes the platform
> writes and consumes the new property.

Sounds good. Please explain in the commit messages that you can't decode
how the values correspond to the actual slope values (I couldn't find
corresponding doc inside Qualcomm).

-- 
With best wishes
Dmitry

