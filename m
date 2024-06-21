Return-Path: <linux-arm-msm+bounces-23672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518E91307A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 00:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9D51F2221B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1BC16F284;
	Fri, 21 Jun 2024 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hl/q2ulA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956716F0E9;
	Fri, 21 Jun 2024 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719009641; cv=none; b=PTKemJO4E0EkcKMIlImrQYR5+rrvry0HUQ7cr52u80flga/MZLhUQJergU52/n9+b2EQW4Cnu2u88lVH9oGt5HH2uGlRELaPwmtehrx6sNxp8HynAEGuI6L+XkNTOsSlpQCVc9aN7+1YK8pLzf3xCWxlPkO2hUtnGpj/zK5uS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719009641; c=relaxed/simple;
	bh=jsDCV0bFqKXaxTxHhx/XJTLwaJ9xWnrya+1wxZ/zwTk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK8RfRYjM5qJUeAoSFNk6DbRa8UqUoivp5FYA4XikPkkIyutSG5EBa+IbYuLM3Zs6enCkv17CgBTNnKXu4z4srj2FlDEoZ11jX/lVK/UY/MBxrFbsNs1/9Cx/zqe0+XUSRZsjjCnSDxBmfsvPKZQDCgZpR9Fsb7P09QeAl3ut4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hl/q2ulA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LLwZZl027622;
	Fri, 21 Jun 2024 22:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h0ddb+WIGiR/+5uLz3IQifrs
	TNo9FDwj5crMyEw4ZCE=; b=Hl/q2ulAwXsiKpKKwVdNjvkKe5lbKS8pmdleHwVQ
	48ITA6zHpmkXbXNSQ1RrK2BWt1xal0XjDxU+txHhcjSGrc7Tmkyz0yEv43++/u38
	zKCp2P7Fr2iDzyENfZWVH7KRd8RZkh5XJQpXTWl2GnGA5kogyspNpiytRJ7h4yPD
	hNoOXb8QYevpjDlcxZciE/Jj8zDBl8S6x5G6G7ZZ9DkLEW55xDMPxLaovek6t6iK
	KmmSrFvSuUsmZ07QtgiheLSZvAx8gUcQzyRpZgTgGXr1ujI0jVYPbgK4qodGWU0D
	hhN1bVsq7k2Z58RExNxyzV7jyKLGcxg1ukybtjnhVtS91Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywhw581r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 22:40:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LMeLeK023284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 22:40:21 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 15:40:20 -0700
Date: Fri, 21 Jun 2024 15:40:20 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Simon Glass <sjg@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Amrit Anand <quic_amrianan@quicinc.com>,
        "Peter
 Griffin" <peter.griffin@linaro.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>, Doug Anderson
	<dianders@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Julius Werner
	<jwerner@chromium.org>,
        "Humphreys, Jonathan" <j-humphreys@ti.com>,
        "Sumit
 Garg" <sumit.garg@linaro.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
Message-ID: <20240621142054973-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com>
 <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAFLszThbe_aUAq_5rCCiPV-bj60oq9UCc=vdDHwM3i6t44ohLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFLszThbe_aUAq_5rCCiPV-bj60oq9UCc=vdDHwM3i6t44ohLw@mail.gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aMnnWvPZXbpMlGkJtooadWu_tY6AtbVb
X-Proofpoint-ORIG-GUID: aMnnWvPZXbpMlGkJtooadWu_tY6AtbVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1011 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406210165

Hi Simon,

On Thu, Jun 06, 2024 at 10:00:54AM -0600, Simon Glass wrote:
> On Wed, 5 Jun 2024 at 11:17, Elliot Berman <quic_eberman@quicinc.com> wrote:
> > On Wed, Jun 05, 2024 at 07:17:35AM -0600, Simon Glass wrote:
> > > Hi Elliot,
> > >
> > > I am just picking up the discussion here, which was started on another thread.
> > >
> > > I can't see why this new feature is needed. We should be able to use
> > > compatible strings, as we do now. I added a 'usage' section to the FIT
> > > spec [1] which might help. I also incorporated the board revision and
> > > variant information and some notes on how to add to the available
> > > suffixes.
> > >
> > > Does that handle your use case?
> >
> > -rev and -sku don't fit the versioning scheme for QTI devices, so this
> > isn't a generic enough approach. Patch 5 in this series describes the
> > versioning scheme for us.
> >
> > In the other thread, we had talked about using some regex based approach
> > for matching the root node compatible. I haven't had chance to work on
> > that proposal and will try to get to it in the next couple weeks.
> 
> OK, I look forward to it. Please do check the FIT best match approach
> and see how it might be extended to handle your requirements. So far I
> have not seen a need for regexes, but it is certainly a possibility.
> 

I spent some time collecting feedback from the team on using compatible
strings + regex-style approach and we're not able to add a regex library
into firmware, so this approach unfortunately won't work for us.
Because we have more axes of board identification than chromebook, using
FIT's compatible strings isn't a scalable solution for us. I don't think
we have incompatible problems, we only have more than 2-3 axes of
information.

Thanks,
Elliot


