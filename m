Return-Path: <linux-arm-msm+bounces-31664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992469776ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 04:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C917286201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 02:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203DB1AD253;
	Fri, 13 Sep 2024 02:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hz6h3qb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82137441A;
	Fri, 13 Sep 2024 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726194903; cv=none; b=RdhOvvrkLVHpMCxok+4G+w3aSxEc2RuhaJF4H0PjhVOByxGYRHRgroRma3sTcuIOCJWJ4CB5SJgpWYB3rG2J0rd1deLzh3fHgOrKzjA5JpB/o1ENeFbSFvmt9FMc4g6AhKuwEWZ/C5F9rtw1oNthwLzHUKRCseEPfCo2aRRameA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726194903; c=relaxed/simple;
	bh=Lus+D5+jOPKxiw7KHyXn9IKIRhFxZNgnKpipW52cqa4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiAHLHnRWwIyHxMME0+uXtuIl3a/0RbYOW5XZvQLFC/zVrFa98tLyAkoXDnnPK/+tVcLPxb50pnl5Q0QI+pdsCQsOQ+hD+9/HMVJo6Jr5HGw7khvQJTzBnMIx59C8J8Cf6O9uHfAon4kTVd9GXh6kgyeHzByLqwSzPePbwCTMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hz6h3qb3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBOqD017782;
	Fri, 13 Sep 2024 02:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBLwJ2Dmy+d80Rma2lDTl0bwyAAQzzf/HNInTF2pHaE=; b=Hz6h3qb3/3aGhsly
	GrmBasYvmpU5vaVxgbHg3y0zazy4wbDN7NxDsVXpFtNjxYjW3qNA0By7g5JpNpIk
	xV5IHTFTi/4mIj2n17D1ttzJvEICyMYPtKyp8UM/xnNbZzPfjOVYT/qtfZhKM+fM
	GSUvFScILdU7le9gEPq5rhWuJJxbNPDkrXTeEXpeRYusrLZtzj3bCZMDv38JoRI6
	4HUmmL8kV/rUUY4irsmaPyNYLcXOC+Cu+isBJk9/qXLr2qh9pS+EsqjQqQHbyMlO
	2eIeOZ2pxr+wgrcvz28lr9BCd3cnjmGY5JaKYHMOTczkTkbQPccbKG/Wc0HXu9U6
	89HQOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rq754-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:34:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D2YklD006211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:34:46 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 19:34:46 -0700
Date: Thu, 12 Sep 2024 19:34:44 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Felipe
 Balbi" <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Saravana
 Kannan" <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <ZuOkxKy5he6vVpDd@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <CAK7LNATGJHpC1WsesiNg-nYjs-8GK26at-VvykqvwOf-6k724g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATGJHpC1WsesiNg-nYjs-8GK26at-VvykqvwOf-6k724g@mail.gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C5lEFcNoMrj87TvrTbWsFovbXkPA0dg3
X-Proofpoint-ORIG-GUID: C5lEFcNoMrj87TvrTbWsFovbXkPA0dg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130017

On Fri, Sep 13, 2024 at 07:21:35AM +0900, Masahiro Yamada wrote:
> On Mon, Aug 12, 2024 at 12:07 PM Bjorn Andersson <andersson@kernel.org> wrote:
[..]
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 1e561fd8b86e..4a0ee9ef72e2 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -1160,6 +1160,7 @@ struct dwc3_scratchpad_array {
> >   * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
> >   *                    DATWRREQINFO, and DESWRREQINFO value passed from
> >   *                    glue driver.
> > + * @glue: private reference to any glue context
> >   */
> >  struct dwc3 {
> >         struct work_struct      drd_work;
> > @@ -1388,6 +1389,8 @@ struct dwc3 {
> >         int                     num_ep_resized;
> >         struct dentry           *debug_root;
> >         u32                     gsbuscfg0_reqinfo;
> > +
> > +       void                    *glue;
> 
> 
> This is ugly.
> 
> 
> 'struct dwc3_qcom' can wrap 'struct dwc3'
> instead of having two separate structures
> pointing at each other.
> 
> 
> You can use container_of() to
> convert (struct dwc3 *) to (struct dwc3_qcom *).
> 
> 
> I attached a diff to delete the reverse ->glue pointer.
> 
> I did not compile-test it (I cannot due to missing glue.h
> anyway), but you will understand my suggestion.
> 

Thanks for your suggestion, Yamada-san.
I agree, that will look better.

Regards,
Bjorn

