Return-Path: <linux-arm-msm+bounces-62631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E960AE9C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73D0188A635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DC02673B9;
	Thu, 26 Jun 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGjtip2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6D20D4E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936252; cv=none; b=pwn+UGiP8RhVF0pqeUuprHPZgaThoEljC3LqK0N2T7EKX4zJT0Do3IPPjXB+c14h7L6ULlVbZJ+yV6tjl+TF12jExSmhnkWkcIYWHQ0BNZe0RZP6pIwGX9WXTea5z92rEbPXuRI6RolnxSx417BsZemlaHJO09tj0jxWa1QM1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936252; c=relaxed/simple;
	bh=+Nh7arEhb4mdiIAA47zJAjhf1JoxtTqPoXIZGzCdPRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf1zuQmFkSa5DAqjEZG0X3cpoOSnj3Ali/WGZ3OHc83PtY5x15Su76aCDRC/5j13WBlqhdFJPjxhW3lmT5wF8iZOqI3rPylWQG3GmsiZkJGO9AUwLB+TakT+kg0LoOFhj+889ns3U+wikzvkpbKCJV3VuWyRV4il623Z8WkWzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGjtip2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9SJD5015250
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cYqt5KyHbC7L0Vd38ScC2cJZ
	2gNgSimq/dQgr20ruzc=; b=cGjtip2j6+BIXEt74Q7TzPgDNrkfy5s8AZt5O+x4
	XFVjrtqgX4tg8caenZ9UvSKQ9q5rvIEPXEJsebV4dNGllfttOXMEwgM9xBaq2q1C
	Ce+VIv3+o1XziKum5pq9pnyIA7xIAc2G5SBic0KPxXXuQ118IfIdQau3quJTreC5
	AxB/4dZKwK7tlMsZM7jZFASu2Gt2vJdIL3v5nC6SN36Uj6KMICjhYlZOi+WfVjKB
	2MLER2Nf4nWCCwJ/mo4zUSMT52oJwHx+5RfNtrORP1C0U+fIH7xfedWxiuB6eKZu
	yglROC0YOp9sdnFqVXCaEzxjgcgjig7cBaqblsUV/vTzbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm21n4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:10:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so77535485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936242; x=1751541042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYqt5KyHbC7L0Vd38ScC2cJZ2gNgSimq/dQgr20ruzc=;
        b=V98ERbVC9AWgjfVZXu5anwd4DDl/kgAPQK9mK4v9eoKvZyjnuQ71gyjsp+7udt+8LK
         fmL2aznzKVRDfo1pOTCcNJ6nDLu7u1PyaqrhY+CY0KzIDNb4Y+7MB2hC3enVSKv7LlBn
         Zn3u2VVvvUSNbQB96qe1AGboW1Yztn+agiQQ7SJSfBKm9A7fnoT0v/k0vYnEXoYfm5iU
         BslrFRLdOgEQvf3v+LKinoslQjfG1BVLt0wzscJ7K6hmq5r4KA6JhBq0wHszgUUpxq63
         wPkzTelF10/K6XWgsqW+7pQyLZ2PjkG/M/Pt67BcL6w0Q/jYLzLxGspr0KQC+5Q64AyO
         9Cxg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/7PMUcVOm7KNIdFwGhovb9ZqT3C7Sr4a279qB9vBHaMe1jIulKSGlBvGC4Zn2al+70gyp7Ei2vy7lcze@vger.kernel.org
X-Gm-Message-State: AOJu0YyVNqyZDTCoo/PquFr18U+egg/i4JIO6tAHN60aDQDLRgosciH5
	cDqmxQM0B2CCBXXkV9NSugA22KqmuVARjboBpD8yrupvWf6kwtjCOFT37wMne07LmpeT8NMw1hd
	gdFe8e8bad/Nb1Fp5pf7j6qAInQo353D5fQOUKJFsuoQgs+lvuvLiiOKh+iwBgeQBcLfi
X-Gm-Gg: ASbGncuLqaDbdUmTh9DtZOTGzGxEGCQpH1HjIo9YN2HTFd9byiQBZtPOtREbkF1BDjp
	jH9HMbyZIqRfexDhHhjxuPs7cT1g0HmHBdYLL7aL1jWy1KMyVvlUmBtA/b9RrAoMko80Mh/q4i5
	sBtc+6c1CFFtMT/d61wJtgij66+xXxikEJ0KtE1a3KphcpoxnLNMCvfVflat+nFrjGURt1rxSE1
	0MfEOXkz/PD7Ahvu0y/yq+hU7q4CwrFkwh7mH79qaKi0oMywlyiMatyu/9D5RM9Bk8x1UbG6Ya1
	EV/OuAvGRbFA904eCTHbL1zfQtNv/0ERlHjeOAt+RBYPISQQI3mlw16rtNkm/H8jYtq+CVXXHZ2
	5GvoEYO/pUTHp7g53lc0R5QskRJD8u/dMfck=
X-Received: by 2002:a05:620a:7083:b0:7d3:ba53:d88c with SMTP id af79cd13be357-7d42978f2c2mr996161885a.30.1750936242237;
        Thu, 26 Jun 2025 04:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjtAiIEi52PqDdVHz1fI8lluW9aTCSB2ftm6y/pWoW4VAWz4SzJ2hSwGJSK/pOX00PIVi2pQ==
X-Received: by 2002:a05:620a:7083:b0:7d3:ba53:d88c with SMTP id af79cd13be357-7d42978f2c2mr996157985a.30.1750936241770;
        Thu, 26 Jun 2025 04:10:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414beb2sm2535941e87.53.2025.06.26.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:10:40 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:10:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix
 RTC offset info
Message-ID: <xddgggbyt7dyy6a75dup7dgt6fxy27sopkv6febckstcpamv72@sfbul63yeex5>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-8-aacca9306cee@oss.qualcomm.com>
 <aF0eEWK8d-l1Mxma@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0eEWK8d-l1Mxma@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d2ab9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=rtKsz54fpWh7oidnevsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KBqqZn23QlQOWZIeaqq5xF3A45oR_kwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5NCBTYWx0ZWRfXza/QpFnKwTHW
 rko469hW/F/4ztFrTsiT5cYgb4eweLvd7L7Xc+9RVtNOwQg7NephP+n/nCsp4KHY2QFaAJKWn9w
 eowFeQ7UatCVasQcI4MoZBBfTEh/Q4/agxHE780cfhcz5lOJqd0JdlD3fmYfZsoScY2nFRxp7Wc
 2Fubw9nuGO7Q/97HQb/MXM5mn0V+EM7262S/iTMP7SPiwLhSTD4lTz4w9+4GAdU+0ja5iHRNJoF
 4BxCvFXQnFmR2nVRb0OOvkbk9N/FL6te0CClpG/Yl4Moqm2YJRXfP/G+FxjzK1ivvu8amw2XU3Y
 HG0svDXU+koe0XdO9oUUKX1EHNAHG6erTZ9kaJtzPg6xW960MZACSmgx3Q3J0aal/5lV6Vb5d91
 oU5vjCMKX2fXIJw5ZhdMTs16gdK0x3yWEvv6LC/q1DP+UfNLX5A75hLU/dKv0JaHBimcNKww
X-Proofpoint-ORIG-GUID: KBqqZn23QlQOWZIeaqq5xF3A45oR_kwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=961
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260094

On Thu, Jun 26, 2025 at 12:16:49PM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:27AM +0300, Dmitry Baryshkov wrote:
> > Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
> > the UEFI variable. Add corresponding property to the RTC device in order
> > to make RTC driver wait for UEFI variables to become available and then
> > read offset value from the corresponding variable.
> 
> This is not a fix so please drop that word from Subject.

ack

> 
> I'd also expect you to mention that the RTC would be heavily crippled on
> this machine as the efi variables cannot be updated.

ack

> 
> Is there even a UEFI setup setting for this so that users that have
> blown away Windows can ever set the time (which may become totally off
> due to drift)?

There is a UEFI setup UI.

> I'm still not convinced that this is something we want, especially since
> you could have a fully functional RTC by providing an SDAM offset
> instead like we do on the sc8280xp CRD.

No, I don't want to go that way.

-- 
With best wishes
Dmitry

