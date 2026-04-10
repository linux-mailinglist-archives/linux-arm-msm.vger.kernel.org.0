Return-Path: <linux-arm-msm+bounces-102592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MsuCuKl2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:25:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5D3D34B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 710E8300E174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6714239F162;
	Fri, 10 Apr 2026 07:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOjG7QjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcK1E11v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA5F1A9F87
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805919; cv=none; b=lYPKHVA+WxcH1OO1x2yidML8ymwQ0Tf1D3v2Mq/LgePvPebi6k59fMc0VLkuLuzXS1wpo36Wi/aiYr5Z2BJStuXVYaUf8JB9J7RUvfONvrTlstgXVL92IIsgwos6Wr9e2jdOq9IM4rxqyYFcIlBiL59qAIbv9JPPairZZ6rwyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805919; c=relaxed/simple;
	bh=hP8NCF91lkhXdaJLcZiy1Kb183qWANmDQMRFxpC6fKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwLncFvZUjMH56tvrGF0FjWbW1s1oY8NxUDCl0XrF/w7HQoJsiSfPhnIXxlwpd42XlEtThT2y9iutVuZkDjgmuSXjAMJqIDXrNpUUcubWLfTzhbHYt3uoGMkNHRZOIFkfDiVNOG8Qb2ukJGXm6P9gXFwrbq6cG42vv0XP1WUQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOjG7QjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcK1E11v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639MNnG23934931
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LiiUq2KT4FclofLSoCtYniPb
	NOImELLqK9osE4QsYbk=; b=ZOjG7QjUBPfvXcFyzc6dpUGxkeEwwyDr/AIEyS1q
	K7WcwlfBeEyH+F31Uu4hvQeDF4r8891XlJHRvPzc4hxNZmb1lK7SdA5EQNj31w6/
	qkcwaMfbt8IYijqiIVjJNyO2kSL9IgSEbacX7+KLQ7ye4vw52UjvqVq449U7ogl/
	StLkTH1oCus4pQxEBJ2XmuUl6Cs2GPJpTYY+otMNrZXyxIURdrwhgsrV522Ilhy/
	Bny9kKVgpBsGABTTmFY7vXzB+YUvhfeNo1jD/okY7+YWtfstuXyR9QbmszqLp1U4
	jpmNgxrJdq6XjFqnu7udYHQLkD00m6jN4wpEUBkXI5xIGg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sb0ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1276e71652fso2418401c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775805916; x=1776410716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiiUq2KT4FclofLSoCtYniPbNOImELLqK9osE4QsYbk=;
        b=OcK1E11vlEoPEtqrPlqnUpzQwtv0KMOT63oxOStcJKLLgSUF7RF4tW/2yugbwqUjgp
         KnWSdvwCv2DIiydzPxNnaXmO4B++hezYz8AFTRFADInoZEcdmBV+2GL0tYxl1ZxcPevS
         a/TK3vRoUR0K3p0FgFUEGGC4iDo3998yeiijdBv40lenXEiSL44rqm/FEE4pDclAmGdm
         44HK88gybb/mx5AuTgvyRFoMLwhQKRrKYNTgWkyuJgiA9m2UhLTyvZrLwRZ+7Gqy9guz
         4RJDck+gHGU6hLTtGtdxMc9qng+ll3FsTsuMuQ9S5stTwr8ut3K/XEa5Ev3pzvJTzCCW
         c8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775805916; x=1776410716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiiUq2KT4FclofLSoCtYniPbNOImELLqK9osE4QsYbk=;
        b=PLDBcgiADv1L+OmxbDcx9hTxMzIVeGVFVg5a5k3gVwXhgNc1ENTL099AgHgQDAe9f9
         4fBfkihbut3JeIOYntA/h3GA2Jr4pLyrYg4trm6W9xkxZ8dkMZgcOZSgy4nRjmURVucY
         QXiOFoq4oQMT7gkYcwLHRxew4SdPKiB/H36nlxr4kHU42ydDJP+2BVuqOLpBspCRsMS6
         8z3YFNJQ7SQGiTKUvWhUuF6RMebtvPqrIf0Dwcx9ueUK3i3zUy1kCGCLt/U2R7hxyTIO
         LoloqQ7FRQBlggykQ7k73agqi17V0zGf8lEpWAsXgbcqZgpKRMSSPPE1dSmasbXv1ZWb
         rhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGONH+7Zet1YHJRgBXVeA9iCk7i1SkRRzFafi+38+DEy3hE2Zz0Vje2XO+CToSd2umYI+0mG6bpE5e6eZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FcN/WaqldRTSi457wIQeP8fgJ/16WnGonXbuYM4MD9MOt3pf
	ZMJiP5X3t4i+htaJhhMWhL92bJIGhqe4F7qQ9mTeQakR/3+nxO2oH/vwZlza2UBDQ8TfUkT29D/
	yHi3Z9QHdyE2pWVXrdumZ/8TiNHKnW1so7JlZmz1QHpijqFc17a4cLuge4SHde1NbP17f
X-Gm-Gg: AeBDieu6XbJJy6hWA7ypBESqkr6zBUdvo2csJ9IaU4ZbZP7dJxc1mZAvE9I7pcq+mLT
	VpcqrMaj4hLFPcB0sncEEBWEScckIVjqqKhaZFV2e6Dkb9AoGspRZaaEhw6yQV39Axiz3xeiUWc
	f6zM7sm1mF6HtW5icMX2vA0oKVyBRtFja3Of9KoNv6e7jvFGPV7njJRFwqgUAtIrKFVIFvQdMPr
	UxYzHGOw5HUbcDCtwgHOjmEYaNEQHmFHF3TSRAGubVqKffZHwU2KWD7QpYlkWQL1kv1WRZbY110
	+JxtkNPm+T/Cg4ygnopiRRe8bbS7FDwFf8MZg63UuT1bxRgJKxeL1e7/uMktQitwgFAtKC4ruDu
	Q7GULrlZllWZxcG+tsCXjr045Iusi+jj79YbdTHu+Pyg5+vj9q4SFc/XlvCVwKgkGyiOXilQ=
X-Received: by 2002:a05:7022:4387:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c34db2bf1mr1086053c88.0.1775805915958;
        Fri, 10 Apr 2026 00:25:15 -0700 (PDT)
X-Received: by 2002:a05:7022:4387:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c34db2bf1mr1086036c88.0.1775805915289;
        Fri, 10 Apr 2026 00:25:15 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm2396376c88.3.2026.04.10.00.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:25:14 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:25:12 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <adil2MTlPvMhv7z5@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
X-Proofpoint-ORIG-GUID: teSt38yoFwzJNj0WHqmkSq1GY88w-cf_
X-Proofpoint-GUID: teSt38yoFwzJNj0WHqmkSq1GY88w-cf_
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8a5dd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZT9yhLYL0zAwis4BFHYA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NyBTYWx0ZWRfX1dZt3MB0inP6
 2/1QCI5Duz8n4RSx7LuOg/nm6mZ2o3DK6gINYT7UevyFB4zmqi/SzJD4piCWl3BGMS473kXJdGn
 mPa17II3qEfYf2CEMo2cyZfgOGttjjENTC8QPl9vYVWTKKG9ESfgryOi3k1S6jEEw74zFMYKnWn
 fqkUA0KyqkS5DP764nqFIP9P72ihDGBvxXGuqTIlwdvAYIJAPLZCmKRR/xDAy+KtKRIVVCaLjWf
 pDCKVZuFiRQRcz3+YCtv+tMFMJEQipuA7eYArMIB/9/MLA0fMeXdAxO9wo62cJXUNVZ71scn6z8
 eeUty6mMAD/DMPZdnDgS44ihFTRr1wyuOyXvj8BoUHuAZO17Tn9kdYbjji5c3eMves7xQ3CWV+8
 E3HIKnHp5X7WOqk5MT1UxsZwYYSmN9SIEloudhdLrAF2Vk7ujKMRJ1KTYVhMIqhnCEs5YjPblpn
 UC0yZkuQrrLKu/k/EKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,hu-anancv-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102592-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BE5D3D34B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 11:25:50PM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
> >  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> 
> Missing commit message.

It appears trying out some b4 shenanigans messed this up, I'll fix it.

> Also, as this is adding SocCP, can we get pmic glink device?

pmic-glink for glymur is already present, in glymur-crd.dts.

> -- 
> With best wishes
> Dmitry

Thank you for the review Dmitry, much appreciated.

Best,
Ananthu

