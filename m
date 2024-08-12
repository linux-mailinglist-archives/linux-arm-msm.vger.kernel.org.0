Return-Path: <linux-arm-msm+bounces-28347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37AE94F8E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 23:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F25ECB21194
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 21:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63E819413E;
	Mon, 12 Aug 2024 21:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poZMgg6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0618E022;
	Mon, 12 Aug 2024 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723497735; cv=none; b=NAAhiLN8H5A8k84ypO9hvtH+nX+NnJNMy6CQzDq4D4pL2q05tM+ofn+i+9EqV7DG8RsvjlzMg08XhrnbJeNbRQ2KoEKwy3ez0hwTtdaWyOluRTtU+hejSmBTkJsmP/r9nmF749s+K8oF7L0TI0mtQLTVTcqj05H6B1fMW+Aos4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723497735; c=relaxed/simple;
	bh=8zuYJDj8cGzoiBk0h+FKjFFJcGPFsUazacaKzL2g8nc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiFyO/XBmjPukslVD7poVDIy3ikBa9HtgDW/Su9UV43WH2snjyut6boGzobpUJ9hTXzFo6u0GFl1dUciWdKePEgGAzlFoakzC4DhJowOPnrWFYpCf6PcfjkOpNMVc+8eRL/uAR3odC8ePPMSJyKkpFsNuH978rTq3FXE1BROvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poZMgg6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSXCG017465;
	Mon, 12 Aug 2024 21:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FAlLOeojXj0MnxpAxPHUG0VjVJDJ05pa+uyH9jzmfk=; b=poZMgg6Xi9VY/w8l
	E8nghQQZaNBGLRnjoq1UrVFyV7QgS6Hg7c29rUthzKkUz0QBUwg0oCLY5msa1m8G
	JefxHlTEkjjHtmRZlpS/y28eVhP8PQwVuvedEcvo+o8lrXVCjYZvq1zX4CMNvNyp
	+WlE/Az6vUcKCIxp/482S7qIoGdHb0kGQYHKlOVPy9RjetT3CgnRmf6KC9q4Kak0
	8PfMIa05BArv8tDJhFuM6SIPZMrtKgddsJ4zwoLtDfhSrIA0wO0HocfSDhjueIF9
	mFaBthORu0efCT5b8hIIwer5ELMJ2j2DGg+AC+53i3fQo8Wpx+4i+0tnk1OsDnbk
	FMJ4TA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4dcqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 21:22:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CLM014023372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 21:22:00 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 14:21:59 -0700
Date: Mon, 12 Aug 2024 14:21:58 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley
 Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] of: dynamic: Don't discard children upon node
 attach
Message-ID: <Zrp89mKNvTn+PdmG@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-3-91f370d61ad2@quicinc.com>
 <CAL_Jsq+0pX7P70OE8suhCpSsffPcqQffLEUqc3+LSX7ocf-iXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+0pX7P70OE8suhCpSsffPcqQffLEUqc3+LSX7ocf-iXg@mail.gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v4M0rjK44hIaNTtl7TuhFOeO8mtBvgDS
X-Proofpoint-GUID: v4M0rjK44hIaNTtl7TuhFOeO8mtBvgDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120157

On Mon, Aug 12, 2024 at 02:24:21PM -0600, Rob Herring wrote:
> On Sun, Aug 11, 2024 at 9:07 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> >
> > When dynamically modifying DeviceTree it's useful to be able to reparent
> > nodes, but of_attach_node() clear the child pointer and hence discards
> > any child nodes.
> 
> of_attach_node() is kind of the legacy API. You should be using
> changeset API. But I guess you really mean __of_attach_node() here
> which both use.
> 

I failed to spot the changeset part of the API, that does indeed look
like a more robust solution. I will look into this, thanks.

> > Retain the child pointer upon attach, so that the client code doesn't
> > need to manually rebuild the tree.
> >
> > Current users of of_attach_node() either avoids attaching nodes with
> > children or explicitly attaches nodes without children, so no impact is
> > expected to current users.
> >
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/of/dynamic.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 110104a936d9..32e1dffd9f96 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -221,7 +221,6 @@ static void __of_attach_node(struct device_node *np)
> >                         np->phandle = 0;
> >         }
> >
> > -       np->child = NULL;
> >         np->sibling = np->parent->child;
> >         np->parent->child = np;
> >         of_node_clear_flag(np, OF_DETACHED);
> 
> Before OF_DETACHED had a clear meaning. Now, are child nodes detached
> or not?

As far as I understood, the detached node will have children and as I
re-attach it, those children will just be leaked. The current (few)
clients are then making sure not to detach nodes with cihldren.

Perhaps the expectation is that the client will have traversed and
detached the children, and will then reattach them here?

Or perhaps the intention was to never allow detaching and reattaching a
node with children?

> If it means not attached to the root tree, then it is
> redundant having it per node. If it means parent and sibling aren't
> set, then what's the point as we can just check for NULL ptrs.
> 

In practice, my goal is to detach the "ports" node from one parent and
attach it to another node, without breaking the graph.

In patch 6 this is used as:

  of_node_detach(child);
  child->parent = new;
  of_node_attach(child);

> This all seems fragile on top of what's already fragile.
> 

No concerns with that statement, I will start investigate the changeset
API.

I appreciate any guidance related to reparenting my graph node.

> Rob

Thank you,
Bjorn

