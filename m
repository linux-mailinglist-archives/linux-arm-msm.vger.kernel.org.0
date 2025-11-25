Return-Path: <linux-arm-msm+bounces-83246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7FC8508F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF5654E87CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5745927467D;
	Tue, 25 Nov 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9Tw7SCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKWU0HVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC907320CDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075347; cv=none; b=B2UHqbXV29eM42b1uCtzfuYDd7ZER7wU6/TyyTnOx1QObKQ9m8bxd8NIUpGM/UeWStaColDhEbdBLIMk38U35cKzfJYgoyKCBO4bxnxXqPq23kBLtXjF70ewOJnwhyFWX6eX1EX6rHBZTyTVyDkb661Hrc8v9ti9vMGLd2xm3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075347; c=relaxed/simple;
	bh=zhcAgWB5CX2/QnNT4MicRl5DG34M9QVoVsUjPTRGATY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECMfwK9QjTiv7NFqb8DaVpOMRREcYnQgbku1Jf/eOXnXJki6B5HSBhjZst01Y4WRsioG/eGod+Lo0bhLCDW7thgi+s9mBdLg4EYbOYYiq3m4zdPNcGLbn7CjvTOxg73yGI0zozc52GUBDc6lJCcD2tBuFF3xo8Kc+GdGocFgoxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9Tw7SCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKWU0HVB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9aDEn1232381
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVtV14gixDkSmKxTGoprqNQc
	CthEDn+SsOiyCKBoR5I=; b=f9Tw7SCb0lEeRo2Foepu5ROoPEnMnDYCrOfDMxhM
	mleaeDRNziY3hZuyyDBhFcq0Okze5UMiVrJBoQuOVbsdr1PXEYmFENn22MI3ee2H
	ZI+xNtBYw/jQDYQMDLM7ULg7qbEGQYd918IpCCSkVMj5+A9zJnGiRsqCF7Y5TioP
	fYvqX8BdX+dX97CkZ2ues9YSXXQpOwEmOxfEd/cJcBWOnG/s7u6I826IJpsh+eb6
	GNJ7K8TdEYa9f/Tc+QPsDfkfsnLl4vxqDtN0x9V7Hay8Cr8shkfZeeAdnjao1A9X
	qF1/PK10YNWqo07TOTFSEnfNhGVJP/8BIVfC7E/Vf8zbZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyj75x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:55:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882529130acso144244976d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075343; x=1764680143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVtV14gixDkSmKxTGoprqNQcCthEDn+SsOiyCKBoR5I=;
        b=AKWU0HVBGDoeYOOoZQSJ4rRtOehpd0i0d5/Q6tS66NyuUMyDEnu7kcYJsfQV/SU0Dx
         66BP6ba7Iw8MKXzWCFe1YJHmM68UWJE3V3uechKC861dr4fTmevug8fQomN9QSJpazab
         uUJbl9iF8s0jcQ3FZIwZ0VE5+lV3tYwaOTKp04jwQqsYNd2G4iYv0NFVNhewldEOCXvn
         Jod8pPTdd9SMZasmnk8uKnXqN4cxRZi6Yqv0/sr6QILlh3rrbp87WjruxB86LikBwgrv
         qFDyyyciw3fdybhuLJITmQAtfmSBwnevZu9MVzQEQ8DF/O2ErJetsxM40BR6BfzD8eP7
         Tzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075343; x=1764680143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVtV14gixDkSmKxTGoprqNQcCthEDn+SsOiyCKBoR5I=;
        b=JE3fNuQ1f8RE435dYPdQ3Z4zRBFxlKIo5JPrEts1C3+g9KHdFkvUZuLZQKRVjQVpgv
         F5PUrlxQP2l3eEwo02wa4gdUgdWno4LLP0qM2RzmOip7dUEulmnZ7eZ5tSqcEAgBD1I3
         ZTP7SzqxgLIfL3cLFm2IGqKYfbmuV5E8S7WDVh9CI1R+rxuYvmgWTq717Bo8KmivPibV
         +1WU5qIRji1Z9TrqwX1O+Lw6n2shMYGAs7VTRDYuXGWozeWLuko5HAHduewM00T1Ab9o
         7sA/kJVPOG50tboC6pARj4Oj5n0iREvr2FOi6aNydWap1YFW0DRmEhisWazQG6LkQgtI
         EXSA==
X-Forwarded-Encrypted: i=1; AJvYcCXXQDEmm+xQFM9lB9zipeKYOVPF5LIgwFXsMv2s1NpLZPvFyXusrQhPjW/D2pQIeTYa9/+2NBp/nm3+FvWL@vger.kernel.org
X-Gm-Message-State: AOJu0YwPu0MybIzu+HKfU1UiHG8xEVXeTb6+CYs/g2QaoHSyH7V9soPV
	+F0lRFnQWN0Nb36b/7VwoGZjetTZKvCgEXv0txIIONzG0MKI2vCqlNCrgWALzN7shqA/+2kCWQB
	yMbNxizkXSANYHHlwdHDAyM3OUDwZ9PoTqjyRawzZVVSl5YHH5GC8LoS5n2vYsBdTZP2X
X-Gm-Gg: ASbGncvoBMsSv6cylAceoZ2uPRO5Vec4ZIVcUcNlhA9PqWpoHKxCOTLdnQGnpEFxHVZ
	bXo3tMH82GV/fBAThly/QQ/qZC+jdpp+PAeXkCGQhyX24jJq8FUJMRts6ryF3HGfMJASxFA27zC
	Q9K0sfSwjDqNgr6fkbM+fuOjKaETmpL9QFUumSYwDqgob+ohIYF92XClQ3/v3tmSP4I0K8IdEbX
	fvismGgz/dkwWlV7acHHDGGrgJC3E2POqgtBpSnYrMdxKAvvEzSZXyYE2b5IYO03rPbgPfSl0cw
	oKzzWayw5ylefdbtxReIueOVo1wQakpXRpFhJiBmAkct5g6zqJ+Mkdf5TtrcBbZ/sKSc2m0yOVh
	Gg24CTNSY/ujUqNAxYO34RL9fypFz3V4u8J57Kmyhd+GL
X-Received: by 2002:a05:622a:50:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee5883f9a9mr223197841cf.12.1764075343073;
        Tue, 25 Nov 2025 04:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhNIasYVLMVZdZZWp5HXuFZ0sg0htr55tVL+zFjCMV5phbOBMGl7fmFN6bY2cHbu+X3CShog==
X-Received: by 2002:a05:622a:50:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee5883f9a9mr223197481cf.12.1764075342641;
        Tue, 25 Nov 2025 04:55:42 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfe70sm14979385e9.10.2025.11.25.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:55:41 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 13:55:40 +0100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSWnTE-jeHEg12N3@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925a750 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VotzM4syS8sqhLSgdhkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNyBTYWx0ZWRfX5RCutWdgDbRy
 dwKfXTugKqoOXsytejOPHOIlKnuf5xNj56OzpQv+30V+pI0b6fr5STP93x1Y3p3AletvoFIcriX
 2fSoAlSZdXc+J62Y0pN/jSxqVL/VPwbZ3+xFKPO/FJki82YA8QyTDa6B5nbALcLoU5bF5BLZLAS
 ulWPqjoNk0aDcEKZPjZka3EN3Di58dp9D6MwrExOOY9jiRt40TR7/NJQnq3AXuHFGtC+bx4e/AN
 02xqAYEN2mdIv27yikjHR0Jj/q5Fmp8j8wM9bJ1H4lVynLSUODfPujFp43ze7DPOrrOC3wHV7vh
 6rNiqUJA+FKZ91B45fuNDIT5Uf+6gZiwdGygUAdxEsVXjKlHciXDnBk1gVRZSPrZ/d1MvEjWtYl
 2LO+YbAI95GaWIUs49UhG2OwQdHmyA==
X-Proofpoint-ORIG-GUID: iZptbOWEwE9SyyoAZfcqwsm9vTcdmec0
X-Proofpoint-GUID: iZptbOWEwE9SyyoAZfcqwsm9vTcdmec0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250107

On 21/11/25 20:22:13, Konrad Dybcio wrote:
> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
> > The Venus encoder and decoder video devices currently report the same
> > bus_info string ("platform:qcom-venus").
> > 
> > Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> > parent device name. With this change v4l2-ctl will display two separate
> > logical devices
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> 
> Perhaps that's a stupid question, but is there a reason they're
> separate at all?

not sure I understand, enc/dec support different APIs, v4l2 controls..is
that what you mean?


> 
> Konrad
> 

