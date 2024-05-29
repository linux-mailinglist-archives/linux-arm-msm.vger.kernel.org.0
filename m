Return-Path: <linux-arm-msm+bounces-20970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A68D3B46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 17:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B048C1C20D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 15:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D494137932;
	Wed, 29 May 2024 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NsrHniko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25471156F36;
	Wed, 29 May 2024 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997441; cv=none; b=ORUhA4ETOjccHEq0UM0ZTs6qh5unSr9J1Le9IwP/GP7ic2zrWd0Gpoq3lCBKbR+gIG5wd2Npq8UwiCJ2jzbluTZdYYdfHSz+20RFfu15qzt6H5n1njVvcWapHD+qmjHw3Ny7Y9jomqUK2FkebM0Wjif1LdUm+ZYgO91I1A6Oz1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997441; c=relaxed/simple;
	bh=08fNsTA0hP2squzMcUZ1gfcOagY4GbLarrX5MFlRAK4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMTeif38Db5eydgKpp9ogncgJWktGHMUy28JQNMy9TKMR4aHz7+tNdqY5qC3s/b8z44XYB1bGtbp540NbYpopTL+7moFQPpAaJu4UodWp4zSrphlkbt/73I2HBm6/AuG9bUn7Z2Gu7oMr6PBGBhIZpMLhGSsluQShNRPVIXus5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NsrHniko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T7MO5F015761;
	Wed, 29 May 2024 15:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5j0RSsTR4kIAMCNUS3tzwzs
	OLbYB58UqXMnwxQanJA=; b=NsrHnikokCHHUZiVGmh1QOvvREYrH4vpnnrn4gVG
	vilu2Hswws7UVM28I7/1fClfHXhN2yD3vCjfrJrvp74RjJS3z+gLQRocMY89EdIR
	JFwYzvOaX36qXVllNjujaUdXCEgKMaPcOZ+OSuBUxcFs1phlGjdQKTzP2Ei9NjFx
	Jmz65wUm3UmpMzQH+6il6T0ToMVc0tVM285nwd9TMx86/u0y7FrBTHWUCVzGlWKG
	334r+OsPu29i6nHMY+9aNZ9DkArZb8aUG5hWfo2jD1DTcLqobYiz+fXkF8+DqIGz
	1ylPRbJ8QEW1Palwl8siuR+xkZI+lR6bkMeRTKVJI/5VMQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws1233-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:43:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TFhh95029906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:43:43 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 08:43:43 -0700
Date: Wed, 29 May 2024 08:43:42 -0700
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
Message-ID: <20240529083435197-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240522-board-ids-v4-2-a173277987f5@quicinc.com>
 <20240525-aids-jersey-a56ce764b430@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240525-aids-jersey-a56ce764b430@spud>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OVQG9LUwwImajzKmaDG6XO58T-VuwJxf
X-Proofpoint-GUID: OVQG9LUwwImajzKmaDG6XO58T-VuwJxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290108

On Sat, May 25, 2024 at 05:54:52PM +0100, Conor Dooley wrote:
> On Wed, May 22, 2024 at 04:54:23PM -0700, Elliot Berman wrote:
> > Device manufcturers frequently ship multiple boards or SKUs under a
> > single softwre package. These software packages ship multiple devicetree
> > blobs and require some mechanims to pick the correct DTB for the boards
> > that use the software package. This patch introduces a common language
> > for adding board identifiers to devicetrees.
> > 
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  .../devicetree/bindings/board/board-id.yaml        | 71 ++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Documentation/devicetree/bindings/board/board-id.yaml
> > new file mode 100644
> > index 000000000000..894c1e310cbd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/board/board-id.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/board/board-id.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Board identifiers
> > +description: |
> > +  This node contains a list of identifier values for the board(s) supported by
> > +  this devicetree. Identifier values are either N-tuples of integers or a
> > +  string. The number of items for an N-tuple identifer is determined by the
> > +  property name. String identifiers must be suffixed with "-string".
> > +
> > +  Every identifier in the devicetree must have a matching value from the board
> > +  to be considered a valid devicetree for the board. In other words: if
> > +  multiple identifiers are present in the board-id and one identifier doesn't
> > +  match against the board, then the devicetree is not applicable. Note this is
> > +  not the case where the the board can provide more identifiers than the
> > +  devicetree describes: those additional identifers can be ignored.
> > +
> > +  Identifiers in the devicetree can describe multiple possible valid values,
> > +  such as revision 1 and revision 2.
> > +
> > +maintainers:
> > +  - Elliot Berman <quic_eberman@quicinc.com>
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  board-id:
> 
> 
> Does this need to be
> properties:
>   $nodename:
>     const: board-id
> ? That's the pattern I see for all top level nodes.
> 
> > +    type: object
> > +    patternProperties:
> > +      "^.*(?<!-string)$":
> 
> At least this regex now actually works :)
> 
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description: |
> > +          List of values that match boards this devicetree applies to.
> > +          A bootloader checks whether any of the values in this list
> > +          match against the board's value.
> > +
> > +          The number of items per tuple is determined by the property name,
> > +          see the vendor-specific board-id bindings.
> > +      "^.*-string$":
> > +        $ref: /schemas/types.yaml#/definitions/string-array
> 
> Your description above doesn't match a string-array, just a single
> string. That said I'm far from sold on the "thou shalt have -string"
> edict. If every vendor is expected to go and define their own set of
> properties (and provide their own callback in your libfdt PoC) there's
> little to no reason to inflict property naming on them, AFAICT all that
> is gained is a being able to share
> 	if (string) {
> 		return fdt_stringlist_contains(prop->data,
> 					       fdt32_to_cpu(prop->len),
> 					       data);
> 	} else {
> 		// exact data comparison. data_len is the size of each entry
> 		if (fdt32_to_cpu(prop->len) % data_len || data_len % 4)
> 			return -FDT_ERR_BADVALUE;
> 
> 		for (int i = 0; i < fdt32_to_cpu(prop->len); i += data_len) {
> 			if (!memcmp(&prop->data[i], data, data_len))
> 				return 1;
> 		}
> 
> 		return 0;
> 	}
> in the libfdt PoC? I'd be expecting that a common mechanism would use
> the same "callback" for boards shipped by both Qualcomm and
> $other_vendor. Every vendor having different properties and only sharing
> the board-id node name seems a wee bit like paying lip-service to a
> common mechanism to me. What am I missing?

One way I thought to get the real board-id values from firmware to OS
loader is via DT itself. A firmware-provided DT provides the real
board-id values. In this case, firmware doesn't have any way to say the
board-id property is a string or a number, so I put that info in the DT
property name.

Another way I thought to get the real board-id values from firmware is
via a UEFI protocol. In that case, we could easily share whether the
value is a string or number and we can drop the "-string" suffix bit.

Thanks,
Elliot


