Return-Path: <linux-arm-msm+bounces-100482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP7/Lwj5xmlwQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:39:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F934BC92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10B8D3016D04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BFC38E10B;
	Fri, 27 Mar 2026 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkO1KHnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHsZx4+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FF38C2D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647457; cv=none; b=jHVpo6BQ/DJaXzBRNLfDn/mf0C2lMXehb5GSigeTA8bNzpz+lEbZqOhewpFYy0p9QMFIULeGSP0nKi8WtW9e9G8+XwWOYNKnjY41N6iCvDhv5OkorFElcAW2LaZlLdmWFLRHfaY5xQ+d+MzpYbwixKyyIPXksMEG6xNeJw2TRmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647457; c=relaxed/simple;
	bh=52YfLSOX7vzmZCLxLP+4DyZ2hchmO+MZkVv8maGwx2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdMPrPADagYlFSXJjgGVBGC/cSf6EBHaJMfsRCbyO7S3vDobR95HhSpusn/QzF3x0E+d3P/t2xKX+yf/SNWToBmfpcVze9PT9XDeKwBqvzgE37gri4ZwF4rd31glB8b0/thUGq7AJzrel1n2Xsx4yEXSpwCo8qdUMJP4bctQo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkO1KHnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHsZx4+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLD4JN3761424
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5i4xGwjuVHNOMGgsNb/h/J6
	oYgeiOOf3kbGsOF4WhM=; b=fkO1KHnEenBNKuNmyXMYUGBCDRf3gp0tzWK2sraP
	nZqc5QRDnNbdVJqmFnt0SlNRzRQtd8HS0l6APnQ9k9kOliY4oUYKtcNS1eRAdTUM
	O2BO0K7ALqug7Nzz/kAneDNo+DP/5oOEj+gF9QnmS3VWJSgylsKKG3aIutm70rwU
	F7wGnmf7Xlj2MMMcy3mh9Zeps2TA5/o5UaIZsc0QP1LE57NqyoJiHVrXyDlX1Tn8
	0OkJipETZdc8NlrD+LVy1Cd0ecWl3RJcBe2fK2bUJ8lyMcnzrrC+LewTTdZR7F6p
	SJ8VqhlIDpTc8BVRvmer1cFiw5CqiwkOhuvT0SRIkVe3UQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d61m701tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:37:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so27002531cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774647454; x=1775252254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5i4xGwjuVHNOMGgsNb/h/J6oYgeiOOf3kbGsOF4WhM=;
        b=GHsZx4+w8oeGTPFvMDL/frTmAvOiSYs1CdWH0OjOqySqlqJV20vNRSM2xyzPpi+AjM
         9PF75ASXNgchaemwY651S7v0/1+wCKnbaWBuPb5Djd64p6FuyEIIobbvGBmh0bmDG9Wy
         Vzy/v2Lt0EzTxTbeINlJ7atyZEPR1osGk8OvedAm0VHKu6Iaev8WLV67emIYzjUatRJY
         y3TgblSJWLfGd/Mhu2vBkZEcHXVxlk1lR+U1Pa951ikZ8nfztoHgwevUF3kklAF/EQ4u
         p4u4eGVkiAYbv+p0X+d62X8fJbLIDX7M3SbBIEo6hJFBE34ds9DPKcZ5bjwkfjdrCnQM
         4pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647454; x=1775252254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5i4xGwjuVHNOMGgsNb/h/J6oYgeiOOf3kbGsOF4WhM=;
        b=BWFn+KGEp13bdSEpwLKg/N04cDnU9FsbLIS6byPnoMfwOBbvvocyi19WE1Vg/SzeHq
         0RstkdrRR9gmy8ZK8Y833ASQ58hoVjXUTb8hqWQQNeVF77Mwn+EAMIQYugQ4bYP07AXQ
         16I3YZKqu0rr313u9nD5aIZ1AbEPCVM9CoZZ57LxsAbpujksXNliC5I+fuTrYBumDg69
         07nAzO71YhwMSzFxz18bEfdzmm+fsikhMJ6bOkwEa2ut1pJ9IdbsrdUa9sgv6MIhcWQm
         3FletgnrjTiMdTDdfpYiOy59kD4lLliomGyI4P06yqP0n7bIwMSojVR0CZd3MPTxc2hF
         PNKw==
X-Forwarded-Encrypted: i=1; AJvYcCXc/tCA2Bq2YCfUBVzmD+5nHzs34l4JOKOy20uZmolofgQmaJ8xJBHBpSyYlq14bd6FKs/bg1+sea8VL7Ri@vger.kernel.org
X-Gm-Message-State: AOJu0YyGISRaAig2j+EZ7uflg48n6p+p6rpmzh6Q0ahSHr1PWnoecJnX
	KBp0FW0TknIwHH16LKD0aK4KIx9T6l4yqlM7zGHQmlNSzj0vLByptmdvj3TiNwgyc6GhquGq0WL
	JJ/qUEMTr5kDq++gdjR8r8hxoi7q8nUwArdbV6BVxwDLt2DWlkiBh1jt2V5rDTruA4aOY
X-Gm-Gg: ATEYQzxnw/w/vgD2fisNw/sueJdtlPvOfuIbsOpxyQYiuIwh5tYqXZUZnOa2/X4d6ts
	qmj0lYbJIT7KKgInjDPTAdVGGEmbmBvBaoKT12W3wBWf5bcLCrFonwJdlUILa5qTtdVJtf/S5NZ
	3lLvkqqW2MMoXg4qCsPywi+ibUQo7r5MzDfHigdWowbf4BgNwE99ITS4R5mB75rdj5LVhCN1xNA
	FBOkNHbo0ZxwkHUA39Z+yabKCRo5Sp0y5M+9OX/zvNweylAZL9WtX/57lLNdsativ74NJv3QNA8
	/c/DB4Oy9jzo1iYEzG+3tS2jik/XNcV2TNgCEZ7lMpVHy44KDof3lKSOqxDVegi16LDO4mZEJlo
	P6inOmvlyU3kt6JcU3MIEtbMtMe7RrnP2khQCw+AWa93XuisfO/bM+4jKNK2xopebe0PUZt9TT6
	AtJ6ayYqKhMhIpIXjWMsCVX/XwXYGdpGixDYk=
X-Received: by 2002:a05:622a:424a:b0:50b:5258:28df with SMTP id d75a77b69052e-50ba37d1d27mr59941461cf.1.1774647454531;
        Fri, 27 Mar 2026 14:37:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424a:b0:50b:5258:28df with SMTP id d75a77b69052e-50ba37d1d27mr59941091cf.1.1774647454123;
        Fri, 27 Mar 2026 14:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm928931fa.23.2026.03.27.14.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:37:31 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:37:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 IdeaCentre Mini X
Message-ID: <rumbl2qbfy47px2ysa42m2ymw3dxmnzrync5lgywfiqwujklpw@7zpzruyignlp>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-3-768b66aaef30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ideacentre-v1-3-768b66aaef30@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MSBTYWx0ZWRfXxvc7e2KW5eSC
 b929CjSb5E/m8VrpLFtJZyBFW01Gg2Q/7HinJEV6FryPdtZUucCZbe0m72yCEnh+B0cn9yGgN0f
 rRrjiOrDC9lV0zfq9qzhMe0jm3Z8l0UlcXYZG5I8BcADRt8DEBnTm09M8vcN5JnYk3s9KYdMKjI
 dt/VpG73hR89U8rmdEgFrI7S8S0NB8dzts2VXHb+aEdzdk1+zpvGkGYfMVKCVBy4q+MSXFudddv
 77cjp2skcvj61Nt+z+VJ+Favve0acsLxdeAfI6bcI5t1e3kBaYd1sP89EzNIZal53vSy0qWV3EQ
 beUJYcqhNI1ehaqPMHqDJCfBaYJGkaZU/aAOhn8bHqAqvkOb6UWi+0BUUQn+iM/bAvVG9CqXh3I
 /rHdE13446wrECasfRNMDCyvVFt3y1Qt1H5T3j0fp98CSYmAc1p2tkgdJ0cFWZSQM3S10KdoZ6l
 VNjLhPBCCSC0/ZNoAiw==
X-Proofpoint-ORIG-GUID: UAH0UVMZixJYUf9QV6bm5a4h7-XvLpmK
X-Authority-Analysis: v=2.4 cv=aoC/yCZV c=1 sm=1 tr=0 ts=69c6f89f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Yw-7cwJRhbzFpx93OmYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UAH0UVMZixJYUf9QV6bm5a4h7-XvLpmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270151
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100482-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A6F934BC92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:34:50PM -0500, Bjorn Andersson wrote:
> The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
> access through uefisecapp as other Hamoa devices, add it to the
> allowlist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

