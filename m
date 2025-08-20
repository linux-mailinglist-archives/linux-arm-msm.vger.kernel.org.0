Return-Path: <linux-arm-msm+bounces-69967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E54AB2DBD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91FA74E52B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3813C2E542C;
	Wed, 20 Aug 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOLvFsqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25361ACED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690882; cv=none; b=UP65EUH65YjN43e2SNs0X+Kpzlc4noNG9JBkdZrSCedwlNhGab4UNUgyxe3uVvPDi87eM82XeJMVV7CLbHaF3V+9PazLFDU/E9PUJU3+jkOLrcjRRzr6nXKM4xYWfhZ7yOzRaGsJHl8980FM7DLKG5qxgsIEKMV6IQsji1kUiao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690882; c=relaxed/simple;
	bh=M/VdAQD2mntfC5YT7fKZskj7YLan77QmBL4eeQs5/Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ov+ucubhQ7X6z/TppMIRoFqhqbGg6MQun/YIzvM3bAMkzqz7bq1GlbXD5uUW1qX39ZT7TNqWC+qlMbWXVzALMBPKQ13nwq8dmhwPs2WQCMK0VWI3kelMr/RwquVsTtCZWAOrLXniToxo165eAVTQJ7ae4BdXxSygnXu7S9zFYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOLvFsqS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fHf2011382
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9hkspx9x0UaL3XQk/V0/oUor
	TUc0YPNibxHdtYC5rCg=; b=KOLvFsqSgDRvsUk8dBZIPg6ItXH5vgGC7fNxsrUo
	xlW01//Kqxv1Gog3ctPhAH9GDcrbgIGG5Zx0wQnw56uxBXAzIcsaSuEHiHnG5HsJ
	l5YqdlENf/QYmpaFeEKJP6uAMaTfksmoELauVW56uNPob+E44G3vsiwwxTle+XDS
	UNSsMkqOKKzPXnO13e11oeJhukfA7IB6FgDofPMopPNJFxXJt9tLAU5CUj5kbA9W
	99dkVgLlRwlODq4ZunV+1ueYlUFis/tXABZjwUzM2cBftWPS/O/HsF8+SVjdsKr4
	hGkxOlS9rL0kWUNVsTzXGHZDlQAFwCqeSALOcCEot5AQsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhm3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:54:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88ddec70so63325116d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690877; x=1756295677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hkspx9x0UaL3XQk/V0/oUorTUc0YPNibxHdtYC5rCg=;
        b=nBEM2leQEoctaHy/h0Ga9zlHrlSS6nc3wZUwhYIYuzIk+Jfn6+NiD6ToYhToK4oY84
         coImMfb+ws+lmSkSNPW8M8zvfnTNs6AEeaPgHTeNwsVk3DwtzI4R1h57RaHuoeR2r4FU
         FOxRvybS9ZjOkRurnJNxvj8R/TsJQnHigLCE9dAATXJroNd09FW20rF0yS+6rQPI0xxU
         COY6cz4Iux+YZmpPtX2Gr7Kqjd8LUwgg86I1w1BeWyzJq2cTGsRnnA/ZOZTZh3GmMmr7
         g/dOqhlnMAUgn31P4UKETIJk3sQioMad7+PT9c3AbPYIpLg+KuELxsAiYDFAW4Lu1mPy
         RBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhcwt9ZjPc6/S1JBRD2RlFI3qEsjopofi3WoeNKXMS5M8dUNIK6dssu4ZdUbSHx6mfYDdAVXHgRsxbH3n8@vger.kernel.org
X-Gm-Message-State: AOJu0YypjpGJbWDHuO+BinT5U+jD5Zo4f8FqDQ+zeB498bRFJ4CF9NcL
	XJl+5ZEvxYtWcc3HcTbb7R3uQmrec1Hy5geU/fuFZdTlp71d8iuzoA+iOpuzUo0qvBBDYVT5bEQ
	ELt6ekF0CsMJdhMELV50nbxGeAaOmwjW5roDQwHc8hoFKLbRM1PUdwhbXZx5JOWTCyqoP
X-Gm-Gg: ASbGncti8NoXAjZ/C8q+xoYDgGYuYcwP9jqiJ3gpdKBWbmd6BoyFLs+zgqhzCd6DTwo
	BPww7fPAANOsoKGhp9bdIZ0OHePmKJklleF9k9mMWRTzKlr5a0MDs+I9JdatL030oy2BtfEIvJO
	ZsicTSgIk/Z4NVN4v58S3Yy1mLTNpPJramZLkhuSiWiNrp6TlStefhZiXs7Xhq/dHfL9Gdqm9eV
	9ngU8rLqEfpZ4NmuNRDaxnYc7sO7e3sGj1xYq6DE1e43l7F0x5QexmuuBgjeCEHcZ9EHCJ+GXmG
	Rta32DBdeQVVpN+mUtA8Y+0bNjK3xEmxiWh7tM8r8k676NROG9ByYoQqrXdwA2DP6RAeAvpWVIU
	PAE6cWUZlos9c1wV9yUgFtbz97/aN/80rvzKGjCeCXB90aamL3C3/
X-Received: by 2002:a05:6214:e49:b0:70b:b06f:3d47 with SMTP id 6a1803df08f44-70d76f5825bmr26193606d6.1.1755690877273;
        Wed, 20 Aug 2025 04:54:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGgrTO8nnUT/lmte63CyExWcCFiml5AC0BmNDDeEox0FxHid6Ngno7F0JmrK609jC1RUQXsg==
X-Received: by 2002:a05:6214:e49:b0:70b:b06f:3d47 with SMTP id 6a1803df08f44-70d76f5825bmr26193296d6.1.1755690876730;
        Wed, 20 Aug 2025 04:54:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41e251sm29376871fa.11.2025.08.20.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:54:35 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:54:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
Message-ID: <ukxv7donvkulgci2dwrokuflzxzeyh4kohoyja2vywropntxnb@qepcssbe4wpc>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <b453b8ff-a460-4ccd-9019-aed746a7d52d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b453b8ff-a460-4ccd-9019-aed746a7d52d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXz0KwN50arE83
 P4C9YnYtsVjoBI8qB5AGRUAkKvPzLf6vdWeAIZoQHwXur6xiJPp8L6YSrHetENTTACMemyttVZu
 /CVQB5Otsy3hqBPL/McivL67ksUUVQ3oX/xaaSph4geh+B7QcyKPr3CllmYUYF9LMl6Mt20CyWh
 kKwcD1hOnyrM/M2aHuQN4xe/MkyDraThLxhptJHCc4Py/rhSNQgVRYIuyjfg8J5wJWxAXgoQoss
 r+PxeuoZCKCWdFimIOj9OlSNKCmdYgMUE/j9NhwLKQNfCSuX5nkcEiIgXkeGlv9Y6rUdwqM+6OW
 NOHvqerzGwFjMRecQjo0p1tY/U6gTaHS0f/Z1J7WVdfYPqoMtaPY4qtr8tmMGTUcsNily+p3noL
 5AmcnP++cQXtnMSNVagG0NERqraUpg==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b77f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=jOqwWQH_q4CvC3V4_bsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ZDGzLWBIevhW-3IEla7R_dBxv82-iBcz
X-Proofpoint-ORIG-GUID: ZDGzLWBIevhW-3IEla7R_dBxv82-iBcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:07:57PM +0530, Nitin Rawat wrote:
> 
> 
> On 8/20/2025 6:19 AM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
> > > Add regulator load voting support for SM8650 and SM8750 platforms by
> > > introducing dedicated regulator bulk data arrays with their load
> > > values.
> > > 
> > > The load requirements are:
> > > - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
> > > - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
> > > 
> > > This ensures stable operation and proper power management for these
> > > platforms where regulators are shared between the QMP USB PHY and
> > > other IP blocks by setting appropriate regulator load currents during PHY
> > > operations.
> > > 
> > > Configurations without specific load requirements will continue to work
> > > unchanged, as init_load_uA remains zero-initialized when .init_load_uA
> > > is not provided.
> > 
> > Can we please get configuration for the rest of the platforms?
> 
> Hi Dmitry,
> 
> If you're okay with it, can I merge the configuration for the remaining
> platforms in the next patch series after I complete testing on all remaining
> platforms.

You don't need to test, finding MSM8996 or 98 might be troublesome. Just
fill in the values from the hardware documentation.

-- 
With best wishes
Dmitry

