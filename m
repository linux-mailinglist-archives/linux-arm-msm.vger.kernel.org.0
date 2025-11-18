Return-Path: <linux-arm-msm+bounces-82302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBDC697A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0132C381739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC3023EA86;
	Tue, 18 Nov 2025 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMlmbeYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCUgOauP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16B23EAA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470353; cv=none; b=ufbyp9r+5X2hl3iqAwQo+3B/XUsKlJHs0H9zT/30tZZJ9U9Iuatxwfu3qr3MzpoxEfQjJhttrFBKRsdzhMeIcj15nqODpVAL094+rTJ1kPFHdEGTFXEvuTlxXdgty0DpJHexOxQ7pTQLEU8Pogx/z2z7EeurqLlpkNZTQ3xScwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470353; c=relaxed/simple;
	bh=HmxVUxARPArPC9L6ug6sxw6oOtpchgzcTK6OqPWPNTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ni9RpaQaNiiKJenO9A6jPfgX4lDAoI1dai0yjIRbIsjPXBkG4ldPhCDeoC7ac5IDdlSi+KOf8sBiYoOr9ZrlzUYw7Q6i9iRyzp4q4RJXVtVTiluuqygJ7iGcwEK5f2uPqlGkid44O7Hl4ZYVplmYPQCX0pM3JMwXCcsWTXB0aIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMlmbeYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCUgOauP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICApNi2802314
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IiR4KboEJ5xl0qLosJHDL9+H
	FeoW63vwtgs0e4TjZEw=; b=XMlmbeYrb9gxTCgzV/I84OdT2NDU+1rYjbtfjha5
	eHiWkmpFImVA8k94LwJxP0/UrwocWpoKeftboEM26NTDWM77HN3L30nb6mLVWCD0
	doFOJx+sqH42cRWvicfdFvNnbMtbK9dHhS16uO0gReBb7/K4EsQBNHi3fZI1t8kL
	qotgvjKkOxmAf6C25If2g/9hzJwRhpEoxF9ZbpVnVNbIOs5Z4urn5uQmxB102rsZ
	RK1VDYrAJeDWvwHif7WxOT+gqz5CnfvmirtTnMcRUIAj+IkSKn4YBHjQ77fU11g8
	XZheSseVprfdt4xAXdrByGgraEMh4IQ9AVR0k8kII7tqjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk2038f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:52:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so62031541cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763470350; x=1764075150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiR4KboEJ5xl0qLosJHDL9+HFeoW63vwtgs0e4TjZEw=;
        b=SCUgOauPfL8qnirKN9GvAWm+9WIBY/Pedls45ihFVyylZ5KFwD9hEA/YNxmZRFzIH7
         r/ZxTjul7Uc8QM6exeYB/rT5aNe37AQldc5nRNBauQEDvVvDytETSMEkzFPU//3KslcN
         Gh7j7thIgC1vSKY8x8tiDZhKvWwYG6ZC2+bg48Pao+nRJt50ST83ZP9G6RSttdlM6g0v
         7XUOctdaKUyxiotYBUYuyJT6LoP+BWIC+WfrqG4sR7hXWjQdA9wqe9vqe+d4GFHxmlE2
         wmfkpjEmI12SbYMjH1r9r3DDyGbpM5C0qgZxt91InfGQM2gLJhyDfptan72UHZXw16HI
         6siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470350; x=1764075150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiR4KboEJ5xl0qLosJHDL9+HFeoW63vwtgs0e4TjZEw=;
        b=FEzabas9i6ZRMatab/QdTK0WYGwybDJ1+nzKcIWTpdJLba52ihvpfOsBMGPvZLEtYX
         W5Lzit5SSukoFTAs2dtzKY1P6kx3PpgC70iiQS/pvF4dQHbZ1WOBJpv9RUqpE7isyiFe
         HAJlx1HnmFJxkaXPSZ0i9A/ooF5JvSnqZzr1o7VnbdaiR0+hO6yt4TfupnR7xXGtnHGt
         KlKrWFo8RY1swiP9/MMKQ92aW6R4RJODwdx+f0UHGw/KFwj1a0zOBrlyRfnXWKZVRVFp
         guT3x/1L2e0TwdaJeTDpkT7T/ld37bM4GoGKCR2z9LH9XWvq6NGSPd3q8oa9SaWnPDiZ
         1aBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxRN5vUGAlopos97GZFY4KwQMEF9YBSRjdNLMEnsTRZIaOpHDRcwOXApql+JmIWMf9Xio1g97F8JOyJ4N1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw847O2mwp5EB1I+HWgC2Va6aqpsBdiFpY2P7rz8XsgUqBkIktK
	9kaaMkDzdTxIVfagvby/YR84sRyCaa9idz+09dTyNrxoma7kkR/3uSV+OAA2Ir2xpshU3US3nqE
	Qze4dpQX2TDLxp5ElY12I3SpDq1pXIU5PVB1EuUu1UMVkZp/Jhf+228whJ5gGcF4iuaSD
X-Gm-Gg: ASbGncshLQcgIgpABLrdQco6tm+MlH8JPpiwIZKhsI6pfKJ75BLYpSmsLfYBFmsEA6b
	whfZrQrUOzOfDNnSQ/hwlgyTh18feTa/TAgf6l2aR/A00LAvBBYmebGmttfuwqLny02FFi5Bw2M
	qEeT0uOA43OZ75G78s/acz4FpI4irwtDwWFq5rdjMbSL3jL8hDnvQpnA8DtnNewESSIotgnfZnJ
	0bglsZehKX5pYpBKpxpL7K6DuuoAG2zVBcGBbY9KeCHrrU+Wt1IqsYnkfwsw/inCK6660gxVdux
	NGtPHDV4Y3BmPM+dmEiA/X4bqg8Txl/n1Vu/1h0ApTJSUBVH5dwuraw/gHeaZZaur8vwytb8VIZ
	rmzuXOPQlUdU8l1EZWgQ6D5c5z4whMW8YrOeHRxK/tVmmHclKISLlnTZYCTWWkGfgqaLoGWyGOT
	6m7ngCUd7shHdj
X-Received: by 2002:a05:622a:1488:b0:4ed:62f2:8f03 with SMTP id d75a77b69052e-4edf21652c0mr201522461cf.81.1763470350335;
        Tue, 18 Nov 2025 04:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkKVG2kZa0/m/Yk6w+yK9nG6erHxHDqa7umX/ecwQ7kHKgRcAoZ9JFspZYalRU57FuaWxDig==
X-Received: by 2002:a05:622a:1488:b0:4ed:62f2:8f03 with SMTP id d75a77b69052e-4edf21652c0mr201522191cf.81.1763470349829;
        Tue, 18 Nov 2025 04:52:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm4040233e87.13.2025.11.18.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:52:28 -0800 (PST)
Date: Tue, 18 Nov 2025 14:52:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
Message-ID: <l4ay27t4jbycohdsf4epxftq43kceuzymb6l2tx42lxyol3btk@vsof3bbmvrrl>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
 <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
 <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
 <d5sn56mlwaae2hou7t6pr24h2pojvjcv4ufsxg4lbbnk6vlpfi@xc5e5uekofbt>
 <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c6c0f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zfpTpj5-GZubNqkOT7EA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: UUf-qdoY1yv6Yx5kxOAcIJNTSSPGUyCN
X-Proofpoint-ORIG-GUID: UUf-qdoY1yv6Yx5kxOAcIJNTSSPGUyCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMyBTYWx0ZWRfXwLlsu7elK00W
 uFswSgg/eg30C1O3m7cfhjhBuB80iV/tkBUnN/Lafs09XP+drW6vM6qbHT5O8KjH6ikQQ5TaRx5
 VcCBxSdK/eGvnDoYjdjnZiRPSVFlcWqD8FQNSqq7mqT17CB5djuJAaPhMuBsyY+95CLfwXy0DGG
 q00Yd9KzWuh8QnjKBE/toMAI+WzS6b1qdr4Zb8tgt9/m8rY7ZBOTD+979cNZzm5GhLxJgnBhiHR
 yq5DOIDFZICoOAitraLrn3Z/konMJYd7bR6ZcDmpmQRJs5BCY64FQH5NFV9AfwJQ2WYZV5D5FRO
 2BQQ8w43JW0khdHk6GUGzAfvk+HYdC2HI7dsDQiURXJjpaWYU0MVxCXw5ZNuy5w8JA/8QhclnQb
 aSYHv1zYi5Jdb+NBf+h8PYRwD5zSuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180103

On Tue, Nov 18, 2025 at 01:32:51PM +0100, Krzysztof Kozlowski wrote:
> On 18/11/2025 13:25, Dmitry Baryshkov wrote:
> > On Tue, Nov 18, 2025 at 12:39:51PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/11/2025 12:35, Konrad Dybcio wrote:
> >>> On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> >>>> Make use of the __cleanup() attribute for device_node pointers to simplify
> >>>> resource management and remove explicit of_node_put() calls.
> >>>>
> >>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> This is obviously wrong and not helpful patch.
> > 
> > Describing why it is wrong would be helpful (or having a pointer to an
> > explanation). Bear in mind people who read email archives and find this
> > very brief note.
> 
> I gave some rationale in other patches, but summarizing:
> 1. It is against cleanup.h - author did not bother to read it - which
> clearly asks for constructor with declaration. This was discussed many
> times in the list, including many bugs and explicit checkpatch warning
> (on LKML) because people don't bother to read cleanup.h.
> 
> 2. It makes simple get+put code complicated, not simpler.
> 
> 3. It grows the scope of OF reference without benefits.
> 
> 4. This driver was already reviewed and simplified so author should go
> back and think why this was left alone (would save a lot of trouble).

Thanks!

-- 
With best wishes
Dmitry

