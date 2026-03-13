Return-Path: <linux-arm-msm+bounces-97555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAkmJvMwtGmuigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:44:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8728643F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F20BB31BC9CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E703C199A;
	Fri, 13 Mar 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmvqELhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beoUip/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A73BD65F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416418; cv=none; b=cNuYdY+5MC9rncxlKahFo8h51rkvW3V0fC6+N7QIeh8FyOmrXpmGumSVJVcAq3/reZeAo8HHhnB8ZLyDbGuTo+U98M0NPhuO9EBfhf+gYxetgzWPoIDayA43Vrb6xD9smuCvI56UB3DRXq2r0adz7PjJj93GyWsEs/3Gxscvr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416418; c=relaxed/simple;
	bh=8eAD5+AQ3R7FtkZiFl6yFdLyBJ3YLRD/s9x1qQ8mMX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqQLSfe5lQiS3BuAJnvM5nUnNeMCPuzDQPk/ZGco6UafRLMVmp7FN+uouWGC0KSWcs7DZ3ORgP4twUfTqfhcbhlDYq9Em8tttMJl/VM4TilLWcx8vuKomJDuLK/tHWfMGK2aylb2ryaDOeHB1e9Wd89lsK/IJC7Wvp67D1rWk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmvqELhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beoUip/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DD8Wsi793157
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J2vru/Svx1Am2Mr3sn19MOmu
	aJS0qSOIhqRt3IXkXko=; b=mmvqELhcgTujbz86e0tTmm/p6H4WSschqPila+J4
	er+KacyDtRhxABU04pZio/1qIDfQ1AOgvioT39IAvUacxqM8uIkYCoetLKwwHb6y
	TQOkp/pQ7I24jWirKzfHKpllH9O7kt+73BxdbGQUBJ7NxzcnsR0xZIuLZ72v5rih
	hLloiLHephoLyQjFXrAimDYtRhPNT8g4YCdMYQgaBEFxLM1HaXYWe5V2A0CZbpYF
	NqRBe8gK8/oJlY7KFTGygcOq+OFaSrag+sLqiX5sKKYZ+w000qViA4Xoa7/cNI6A
	mBQ8U+vmK0/Fgeykm0ND3PCfYpMn8puJNO/tZ0pLjNINxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1ure-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:40:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so1555639885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416410; x=1774021210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2vru/Svx1Am2Mr3sn19MOmuaJS0qSOIhqRt3IXkXko=;
        b=beoUip/pp4NNaTKvdJJEfWsUMZTjCkQcIVuUtXZ1Sijtoi/UWX6Pk3jr/NVbtnTeL5
         bjmqvKndt1iu2WC1EINcW3/YJUwECBjzI4ODa/QTqU5yfhNPybFz+ozXFR0nBqgQ0zzL
         nldR6XN1zPqc2cCOgTGd4C1GLyOs5AhFFnEsI9Arx7jjGQObryCFRKbOUGUusfimtIdG
         aYOZ0nLa9ge1oWloVMonfTUTsmp6/2rgDv2s2MBdQXGojck0/DjVbolPIKHXAFPx77KR
         k0s9WEDjA2hqQTRBGba24Jjh2Lnv9GXnm7be505DHYRz2lCVeuGwbcCIdSBDMDKSoHPJ
         kyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416410; x=1774021210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2vru/Svx1Am2Mr3sn19MOmuaJS0qSOIhqRt3IXkXko=;
        b=S5CvXb7B57NGJ272ZfQMKO/9rLaPyZ7zix8MHM89Um73MfhLvy4hgHpDdKk5NGeq7U
         Wgmmgj0I4rHYKzxJWvnOUh76mrvJa9lPmQhzO554WPuuUZeL8sjCBkfhMiCgGnYDTIBB
         5fcoMLGUVqs/sKxW7M1jcKpuB2vSRK7jGHXkxEbbN/+HTbv7Th3aUfhKJUAQ/BrNrIYx
         8zFh0dQLHPggYa7U5IPqGZ1v34sbOpFRAvQvE3dr6LhuB5GMl7dXvPJAFSHHINqWbMHg
         DUmJ15f2qqV0ztITAYTm5Lju+qQawMHa8auXMjIPSbzAZ0NU+uGy8NJltWPeuX9TP9Kb
         S9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTdwI6nCvU4qqfG73cszywA68rj5Bao6DRhUPaoiu6cWHulYvgsnNqca+7tEoiErcZ7ovh+ROIFgSfwJtz@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgknAjzjzNEFF+oD8PcTIoHMgVSr685S7Rku9e6yabwkulnjY
	hVYHQx19KIcX8beQWtuzfI9igG9s2l0OwK4oxvwokZKTPNyfUE/D56FLI+w1B6lZ3tofwCFuKTE
	KVRcLvTK/D5lNlPg6cUff7HPdVf/JwQzuLtbShps1x75bh0EoS5DbB8M8XEeuBmgMVwGN
X-Gm-Gg: ATEYQzz5FcOO/2wq1NhNF+s0rqzYavvygEmZnDCpXWvZkz4RCN3J6w4JtssoeKHylfK
	q1bhFIOGjRaZHzhQ9aRRxXtuRoh8MJgO8isNh0yR+CTt5PIgN1x3eOOdQaacrYY6Ieox60R0RJk
	iS3JVzgQB+2ugfPC6TmL6v+YsqsOb7k7lb8J1jPK4oQdVZ0pcxmflesfXGnPQjASmr8YmBfBT0f
	AXf/umlD1Jmw/FGKwqxwKcnKKtAQywtiF+ia+QOq2KUDeWMtFiMVs+N8vxh4aMqNvlzZ4JwZ+cy
	eLQaHL6yxaOjhN6/DVX2sseCBxoCbBE46UZJau6wVPUlLTAYbN05J4FZH/Av+HchLkRMPP60QKd
	4JVeL3DBbiqZZzYLe9KLLB8YLnU/FwzK6UmwHlXwcSVHSgGiNfyqYfpepIwVwE225lk7fy+JGiM
	pNRo/i5Sy978lDyNZueg/FuMa7gcvh4Z4bOJU=
X-Received: by 2002:a05:620a:269a:b0:8c7:fdc:e87c with SMTP id af79cd13be357-8cdb5b247c7mr504829985a.51.1773416410619;
        Fri, 13 Mar 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:fdc:e87c with SMTP id af79cd13be357-8cdb5b247c7mr504823285a.51.1773416410042;
        Fri, 13 Mar 2026 08:40:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156377cdbsm1537814e87.92.2026.03.13.08.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:40:08 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <5otifv465c7duslmogb5uzaxrh2k3u2ayiylcd6dnz3kc7win5@kltv3fxhtso4>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
 <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b42fdb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ni5EwOkUcNZy2ZnK61YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NiqZ42QLDbhSnHT-5fOLB5GbBBFHK3_9
X-Proofpoint-ORIG-GUID: NiqZ42QLDbhSnHT-5fOLB5GbBBFHK3_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfXw8ptqzNvklMC
 F6jfGdLfjjjojEotUe+ACR97o0CxRbqHuPEZOGiFxyPAHPWb9DJ7Kvde3n9cBxFmLN7sQ6Ilcsf
 Id+Q+rx1PfkxWApYYIakCilwf9EJjL99k6rRsL6oFxh6JVKqSRkVImNo8TsyANMZKBCtPO2bW/Y
 tkmwB72Kwx0Pci3Q38Thvkutosa40I9uoigTB3pqwfuc7zSfsvbgfpidlcMJ172IyiVRdH0xsRB
 54ng5IqXxvZO8ArFwBZW9GkKMeY3Uwpl83WrRMc5cOYoCI7Z6FM+YKzyD9J1FMvZh6BA36ceWBa
 j0Myr1UwTb87TUuu2nM9SAWdtILc6cxF6fJJFxrO7cB8qiUuom1tyQZyT8y5Imbv2zgkUEu/0ak
 fyaGzw7QFF/oC3PNQ5sNGhOAXAZgxf91VJBIWfqmFtK3Mmt1Cel1y+xl5hwf8njBEjnfswWB6mR
 znasldT6anvjdvpq3/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97555-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45A8728643F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 08:46:52PM +0530, Vikash Garodia wrote:
> 
> On 3/13/2026 8:32 PM, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
> > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > compared to previous generation, iris3x, it has,
> > > - separate power domains for stream and pixel processing hardware blocks
> > >    (bse and vpp).
> > > - additional power domain for apv codec.
> > > - power domains for individual pipes (VPPx).
> > > - different clocks and reset lines.
> > > 
> > > This patch depends on
> > > https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> > > 
> > > Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
> > >   include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
> > >   2 files changed, 272 insertions(+)
> > 
> > > +
> > > +    video-codec@2000000 {
> > > +        compatible = "qcom,kaanapali-iris";
> > > +        reg = <0x02000000 0xf0000>;
> > > +
> > > +        clocks = <&gcc_video_axi0_clk>,
> > > +                 <&video_cc_mvs0c_clk>,
> > > +                 <&video_cc_mvs0_clk>,
> > > +                 <&gcc_video_axi1_clk>,
> > > +                 <&video_cc_mvs0c_freerun_clk>,
> > > +                 <&video_cc_mvs0_freerun_clk>,
> > > +                 <&video_cc_mvs0b_clk>,
> > > +                 <&video_cc_mvs0_vpp0_clk>,
> > > +                 <&video_cc_mvs0_vpp1_clk>,
> > > +                 <&video_cc_mvs0a_clk>;
> > > +        clock-names = "iface",
> > > +                      "core",
> > > +                      "vcodec0_core",
> > > +                      "iface1",
> > > +                      "core_freerun",
> > > +                      "vcodec0_core_freerun",
> > > +                      "vcodec_bse",
> > > +                      "vcodec_vpp0",
> > > +                      "vcodec_vpp1",
> > > +                      "vcodec_apv";
> > > +
> > > +        dma-coherent;
> > > +
> > > +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> > > +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
> > > +        interconnect-names = "cpu-cfg",
> > > +                             "video-mem";
> > > +
> > > +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
> > > +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
> > > +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
> > 
> > It think we still haven't settled on letting iommu-map to have several
> > entries for a single function.
> 
> I have described the hardware aspects in the discussion [1], if there is any
> alternate way to handle this, we can discuss in the same discussion.

Yes. But how do you plan to merge this? You've split away the patches,
they don't seem to be listed as dependencies, etc.

> 
> [1] https://lore.kernel.org/all/21fda4d2-72e1-4e5b-aee0-a799886f53b7@oss.qualcomm.com/

-- 
With best wishes
Dmitry

