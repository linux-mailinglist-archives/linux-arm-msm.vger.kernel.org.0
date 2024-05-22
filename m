Return-Path: <linux-arm-msm+bounces-20273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920B8CC9D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 01:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B53C1C213E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12952146D53;
	Wed, 22 May 2024 23:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="azsBbvxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D93A14D2A4;
	Wed, 22 May 2024 23:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716421701; cv=none; b=BuVS3UA4lrJjM1UO+xwFSmPi8IK6/TtDD8vaNcBdLQ1eDOKiVWWcAfnTvNwB5UjRGwf7ORcXNnGMKDY8chneS1RliI4ABezxqa4hGoMj+vHM6SpsVwFfz1vyBrwBROf/Fo56YdzsYxek/i0gImiytJMUbFgakWLIC/B/FI3gs4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716421701; c=relaxed/simple;
	bh=AJsx9yBJy7KmJZ8yFLoOgiMw7kr+qvivBCVpiic91SA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhpE5LBdWrgRglHnYYYsCHNPNrqMVBJVdo5gntd04+ok27iN+5fWhpgjoANkK3J8s1RfsXVdT0nBTwVsUh8IfGYhPPQIV7qRCjFbXkSjTBkd5Z7ZB5pe4cCYrrFdM8CfX7pYu+I+9PykCSJdK4RFe8O+CJoDUN5t5lUd9N7NvCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=azsBbvxE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MDGP5Z031736;
	Wed, 22 May 2024 23:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=iEKyOIGYT1uhtKW2TUcrB
	jky0FOziJQOHoYC/86BYaA=; b=azsBbvxEMnGpJ8q1Omtt0NcKV+il/vmJkYSCj
	h4nNGz5yOkY05j+Am9C9gyeP/f8XE9VNUWKLCwtd/gcQmVWkyyEYu4D1hkF7Ojf1
	AxgJp+8Fujb0sQ6drCw77UJW10KSqcSbFtRf12x4rcvFHmE/64CGeaVGhRTUuVTo
	xnT1gX5r7Qs42+cnFjz2LXORvyUh8k5tRy6ZJoCZWCnIGotZwkRIuCGIrWIP+xYn
	Na1yByBFVQ4rxMjUUGhDFUfHquWShWcs1hoLlfEjg/MQGxIl4csvGKw09MFBly/z
	n2X5PgxW8hBS6nyvRni7o399BXQ+yNExeWmNnrnj3w+gtTTWg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psb2bku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:47:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MNlwRm022885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:47:58 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 16:47:57 -0700
Date: Wed, 22 May 2024 16:47:56 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Conor Dooley <conor@kernel.org>
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
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai
	<wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Michal
 Simek" <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Message-ID: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
 <20240521-bonfire-backboned-9ef33c10d447@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521-bonfire-backboned-9ef33c10d447@spud>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qY_JvQaN1iAlFKq6mrdUQu4JL51Q8nc-
X-Proofpoint-ORIG-GUID: qY_JvQaN1iAlFKq6mrdUQu4JL51Q8nc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_13,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220165

Hi Conor,

Thanks for taking the time to look at the patch.

On Tue, May 21, 2024 at 08:21:45PM +0100, Conor Dooley wrote:
> On Tue, May 21, 2024 at 11:37:59AM -0700, Elliot Berman wrote:
> > Device manufcturers frequently ship multiple boards or SKUs under a
> > single softwre package. These software packages ship multiple devicetree
> > blobs and require some mechanims to pick the correct DTB for the boards
> > that use the software package.
> 
> Okay, you've got the problem statement here, nice.
> 
> > This patch introduces a common language
> > for adding board identifiers to devicetrees.
> 
> But then a completely useless remainder of the commit message.
> I open this patch, see the regexes, say "wtf", look at the commit
> message and there is absolutely no explanation of what these properties
> are for. That's quite frankly just not good enough - even for an RFC.
> 

Understood, I've been trying to walk the line of getting the idea across
to have conversation about the board-ids, while not getting into too
much of the weeds. I was hoping the example and the matching code in the
first patch would get enough of the idea across, but I totally
empathize that might not be enough. I'll reply here shortly with a
version of this patch which adds more details.

> > 
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  .../devicetree/bindings/board/board-id.yaml        | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Documentation/devicetree/bindings/board/board-id.yaml
> > new file mode 100644
> > index 000000000000..99514aef9718
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/board/board-id.yaml
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/board/board-id.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: board identifiers
> > +description: Common property for board-id subnode
> 
> s/property/properties/
> 
> > +
> > +maintainers:
> > +  - Elliot Berman <quic_eberman@quicinc.com>
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  board-id:
> > +    type: object
> > +    patternProperties:
> > +      "^.*(?!_str)$":
> 
> Does this regex even work? Take "foo_str" as an example - doesn't "^.*"
> consume all of the string, leaving the negative lookahead with nothing
> to object to? I didn't properly test this with an example and the dt
> tooling, but I lazily threw it into regex101 and both the python and
> emcascript versions agree with me. Did you test this?

Right, it should be a lookbehind, not a lookahead.

> 
> And while I am here, no underscores in property names please. And if
> "str" means string, I suggest not saving 3 characters.
> 
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +      "^.*_str$":
> > +        $ref: /schemas/types.yaml#/definitions/string-array
> 
> Why do we even need two methods? Commit message tells me nothing and
> there's no description at all... Why do we need regexes here, rather
> than explicitly defined properties? Your commit message should explain
> the justification for that and the property descriptions (as comments if
> needs be for patternProperties) should explain why this is intended to
> be used.
> 
> How is anyone supposed to look at this binding and understand how it
> should be used?

I was thinking that firmware may only provide the data without being
able to provide the context whether the value is a number or a string.
I think this is posisble if firmware provides the device's board
identifier in the format of a DT itself. It seems natural to me in the
EBBR flow. There is example of this in example in patches 3
(fdt-select-board) and 9 (the test suite). DTB doesn't inherently
provide instruction on how to interpret a property's value, so I created
a rule that strings have to be suffixed with "-string".

One other note -- I (QCOM) don't currently have a need for board-ids to
be strings. I thought it was likely that someone might want that though.

Thanks,
Elliot


