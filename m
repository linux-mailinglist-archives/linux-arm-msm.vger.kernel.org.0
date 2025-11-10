Return-Path: <linux-arm-msm+bounces-80904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F310C44E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 05:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA74A188D628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 04:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE582777FC;
	Mon, 10 Nov 2025 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmQud2Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brZtqK2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C19263C8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762748043; cv=none; b=gaaT9A4zN2Z66kOtHaLr+U5yO+2DB6dDy6zZU7awqC6oYLlrjIPQBdWCEduMYubh/KGgccsv6r7Y9qRmQefb3wku+IxPGdPifviZtLbjPLXOKyMxWsDxqX7YxJpAbIXmNITq4zkCH9pPpOfVUe7Ae5GoZ31Ld7oKw9oxqp8V94Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762748043; c=relaxed/simple;
	bh=OvMIL+Ag7ao+WlmXilMCYV3oFt3WYL+b4oSFg7J9BrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGGNra71jNml4LAULYgQOeiUe1TtkgnbzBXidb7OxqzsxpvZo+ahhc4cJvKwWK1TmBq63ul4GhtvV4/gh/FIiX1JnQROs2kYe1tOmRfnjn7kvZo3NUirIWgs95iszQDotoa4c5vFjh+0xIfSIhilc4H9wyq1YWENy9iRouWXT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmQud2Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brZtqK2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA0XGLN1809060
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=63Ba7zBrKoiAWfSOSCfa4uld
	py/JAKEBPUMVKa6S/Es=; b=pmQud2IsyJ6DYawFZ2q2ryuvuOploLX0UuLFG/LW
	ZVeLDF7PypHqPjgpgFTFPG+OLf+0ck9VkRP6bYasoj9oZ60qH/r07cKGMO+OPF5Z
	aw842KDcatU2CaoLRYS29YhnrkzuaWz604Fbr/BBpfpWRRnOjOZsQL7GlHOH32n+
	nAqadAjO5gWqn8Pnplkr3Yx+pZHw18rbyynGESLjejNbB8NhZFg2znuHJyhl+sG6
	I2aCrGrGKwifnNotkvuMkatb1Ss+la/7MAUGo5YvAEwtnr6Il6ObHFkWd3Sdm+NI
	WOJMbNtnnmIZm+L3jWRctqcGVOEJs/RvAsfsIshmsjohIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1gere-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:14:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so878366a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 20:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762748040; x=1763352840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63Ba7zBrKoiAWfSOSCfa4uldpy/JAKEBPUMVKa6S/Es=;
        b=brZtqK2tI9dnUw4e0B17aEqXjttyzPjoobTe2R+HIm/epkvu9+NZZIseGJIjGrDomA
         qpEIjDPMYDqe/VdO/pOA12XnS7p1LKo4YIDwrwzANxYVDr7UWErZ7p4VAjwLEl/P597V
         rCkUFKfaI2Whn2VCSq2xixBnVpNPrf/efeR4DDCsx8ykWOBRnyt/mE2++3Z2lvgbGd0c
         f68B0BmgR2mV2h87WdZSUdadg8/95jk9KB+LQbm+rQ7hWQ31KuXmPWREyzBDj0U/CARU
         LOhACW/RZt7e/Fwpb11ToZI1A5MRdln8IGTPFeG7Zne8Novpdt0WMQcAEoTzo4aUp7tT
         WFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762748040; x=1763352840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63Ba7zBrKoiAWfSOSCfa4uldpy/JAKEBPUMVKa6S/Es=;
        b=bUt1uFWKnCjZxksyS6fopTb65lrhGBCGyK8k5HQVJ2VMi9CbVhCKsYUjEiszGBOPBd
         6+RWRRg6fpP8/VWbhPu8tiy9+Sg6QwX1FYtIKzqXKoCxEgbj6GtpGv+NT2EFaA5V+d3F
         x1GeI/WG6yl5j2odjzQeAQHFVNlUwQFj19m1pELDKpsaa/S3jPoCLZa7Ic2jQd/GtQ7P
         w19rohISMVKwleM3Vel6bvWXmTF0aBPftxlx7jUuDMPBXmDriJRYTC+5ygFUR0YpLybm
         KJ2ziW27FeGztLblxruUCc44plmMvCb1oedYdau/eV/Iupiiy2wjxVSuZl0WS6N2uZOy
         zUGw==
X-Forwarded-Encrypted: i=1; AJvYcCUdY+DQJeap7hXZsgnLSwoxf2BQh3SkMZzrMZY1drQ0vTWwvOAThakyEXU9sil55pRT+tSPHUPbTe279u+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HcyYMJqkq0Re4arLhcj/ZRJJEmCMpeca6mOejuM2I6vOo0cd
	OEigsjsZjcTdSnmmHiR7IoKToajDX7Ke8HC36hxFKqDUhZOQ0kUzhvaMuRA8ArRX33oGn6RbAgy
	/+dDAuMYLsN98NMNhix3VJyWORn6WGOHnzWHuho99w62rW5+k/oo6+qTXokVKMPxatDkY
X-Gm-Gg: ASbGncu7YxPIMbbDcq+2NcY4jTRJhkfPUNPLawaf6JuQUMKw55CyHC4ZiRKtseTXXzY
	5rdad73d4sdqN/2WldMDnZVh1uvX7LN+15/6tT7YzgcsH+YgWmEjMX5CQ70N1wQ7r4AGD4H2Sqi
	DYsWGXYopYI6qkXwfgfG5x1jzoxB2zQmWLutanMEgshrMS7IHvRsynftXVGOysbYKvq2i7OUN0t
	OEmC1ZyD0j/nPvuZD70Uo+bNsAU5mAqa5NLsd9jhsKMgLidop7H0wWTYGt/PSyxHUxbwZWuEEmx
	un13vTeHkwNcKB/pwzYOJm2KeSGJrpzxjxLthaqgTMI0zKUX3TaKPsITplPiZCXe7DnWsjLDguE
	pJRTXgeibLAq9xN3fE68lJj8LiR3Ic22S
X-Received: by 2002:a17:90b:3f85:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-3436accd340mr8908390a91.16.1762748040217;
        Sun, 09 Nov 2025 20:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTZ3wFWABMsdQEIncQiC52zmOKq5UOdMUvgom5QS8xesVHXQPctEzv5PL538yn87n1udFPDQ==
X-Received: by 2002:a17:90b:3f85:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-3436accd340mr8908348a91.16.1762748039722;
        Sun, 09 Nov 2025 20:13:59 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9635007sm10178757b3a.2.2025.11.09.20.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:13:59 -0800 (PST)
Date: Mon, 10 Nov 2025 09:43:53 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAzMyBTYWx0ZWRfXw8gXAhhoB1hh
 lOdLefn9IUuiZg8qDe2O33w+b+9KjHfN1E7RdffS6JQ0u5N20iVHmuGPLkrire2gImAs2pOiUqH
 T+Olv78/bJFdVgEAcX4Pt+6g3+zd7sqjfzXurhsWk/+vsaTxCxXzE6ByiPmNeu+dJ12LF14dWLW
 3J5Ns3g0VQS2LMYu/YJuYp5VnjL78GT3kudV/4BsXY9KdZJIf4B9LnE4C3peIJGhbOp/Fmn9e5s
 QCAkUWb4gP/bwKRd+kmkQOh8KNe7QP5YpJn0bRdBbUA3+TIyLJH7T/T106mKxc5kuE+o7FuEV1K
 XT9rdjsmRAUPoRlHGRvQHxsdTpk8/ETYSXL8k59JVbViiRIEagwA1W/LzNSJs5AdLoqN/gkgE/4
 +cDsPu9S/3jZ2hK4wojhdsTWIxBgCw==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=69116688 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5liKcR6gdwzQ9ZU9jv4A:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: F_oiPpAMzN1d-NGJNrfWDHVrm9dxH9L-
X-Proofpoint-GUID: F_oiPpAMzN1d-NGJNrfWDHVrm9dxH9L-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100033

On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > +static void qcom_scm_gunyah_wdt_free(void *data)
> > +{
> > +	struct platform_device *gunyah_wdt_dev = data;
> > +
> > +	platform_device_unregister(gunyah_wdt_dev);
> > +}
> > +
> > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > +{
> > +	struct platform_device *gunyah_wdt_dev;
> > +	struct device_node *np;
> > +	bool of_wdt_available;
> > +	int i;
> > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> 
> static const?
> 
> > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > +	static const char * const of_wdt_compatible[] = {
> > +		"qcom,kpss-wdt",
> > +		"arm,sbsa-gwdt",
> > +	};
> > +
> > +	/* Bail out if we are not running under Gunyah */
> > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > +		return;
> 
> This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> 

Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.

Thanks,
Pavan

