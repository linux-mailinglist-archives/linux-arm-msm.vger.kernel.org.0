Return-Path: <linux-arm-msm+bounces-103608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP25MyDo42nPMQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 22:22:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6D42234B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 22:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7601E3027127
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 20:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C6933F37F;
	Sat, 18 Apr 2026 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZVvi3Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASlOBai2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1132D2381
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543767; cv=none; b=XcOFTmTV0LrKG6o84yf2QBPD/xPCBOY8DXDljKeyiw7Kbex0kNMTxzVtDzV2W8EvzCB8lJgp9unkPDWYYCrBrml74A3iC3KSKxPnO+ECDqCsR4uWqlBB8UF6jwMexKHqsoxjhaxgaFiE2CFCWyx7JduLVHzPraPPzCcmWNL61o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543767; c=relaxed/simple;
	bh=fKV/2ufktiWRFzO/z9e2LBLMix7njbSNHisSW9fVXG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/979O7ewE++JY72ed/xEDpXPSLVr206xASOgbDMBQgBFoBglhU9n5icW7t5kD1xxIhDboBceiaGz1+1msI1G3tAzxIM04CvhTioKPyhKLzpafin9aggPsb4mzmsnsoFFzSznW538+1NgxqoSKlrlvNdUhOGshefm8VjUzS06cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZVvi3Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASlOBai2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UCoD3440589
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SP7wbZ1k3opwG5T/nRFldA17
	XysbpbR/EyzGU0JojL0=; b=hZVvi3ZyIwP1A/MGcy5ixVJmjtylou920TDzXkun
	l9DkshZspuDXbrb1HOV+Ror8IU60eVjHlUswvJD0KcmF9mzRT2lCgA/5HsSesOI6
	L2oXEMtOgpM/DlODS7F/Q7KJltPGn7yau1elVuy+1TrXLDFTrxBTP1Ie6xGZIM+s
	DQh7EnbtvbBBDMvkD3529CSIpFnywrCBF7PcmzlhSoMKNe2iamLqE2Baq+eX3dlz
	91hQEhaH5TGakFTW2IC0GAsjpioCJ52FNXux7Rr04idw4Qh2vlBEK3hCpeXYl499
	ZvgjugJuPFza34WcmJC+IP87qgVdOYBwBcwjK/5p0rXNqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyne9p79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89502dfd7b4so31359066d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776543763; x=1777148563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=ASlOBai2eQpiSBwvJHrWiNBtt9CBpRJkN1ggP4ICBsFqSCKrE04fFn+f5QE9p+V8q8
         WAzi0Y8hpYbncqe3L2mU1FXB3CByeJvwQWFOif/a9yTIo2BHPEHe7d5Zt5eY8+ZuJRnS
         rX66G5a+CXrkJq3ZsP7jlB8U+0EebXy9MdzvlaoCXKsv5WnHDFyZobygHFg2VF0DMFt7
         +ZgLQb5DLeRklm5EOPI3fvfqMIBLlK74ZwcQ6mqZFGyvcdSDolP90SgD6ekWAf3Pbjv3
         dClwH2is8AtLqitT2A7WV7J39XQnfSuN2YAcODs6UigG8fcKHHzXD2Xok9IUygpWbyYn
         JTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776543763; x=1777148563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=XEVwT754xOBufvqvmeU3WnVpD+qa5KXuAWUY5HZAQR2PyN/YAO8PSH146uvM6CfU6O
         eDaP7Ze2AJ5LtK3YcCZNG90hDwThzyYNOoc6zmfBxOkhWPZeCPyPjjqy9yBAAWMmhkqf
         k/8S0XIbmB2j2+pdLWPktuGe1qe2x9YJSGvj2/KjTWWBR7xlkZtvgGForvqJVgOtkWbG
         rK9UibtBohXtP110EXFBILRoiKKjZc+3MCT9ELlPGtQ6E0GGyxPrxwpock2JZA/Qta1X
         /djr+Th5iPQV4Jn4fSnhUKCrSyAezP+GeNrh9A0nN1f8DdX7YV3Qo22OO7eoZVUvSkXL
         tSVg==
X-Forwarded-Encrypted: i=1; AFNElJ/ucWgYwSV2yAo47jTVPijOOUUKf3wse7NJ+1A3u4my66mVamUq6bvur3p+2wcAlHIAQBsmlvt5wV7OT6nq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7bwDQNARzS31Ziyu3Oxei3xpMpk7XVq0YY2pZ6+FwOyFdJwp9
	ifiNNqK406gzAJCuuAhuWLBAsDD8JGrUUX5PFrPs1274W8NI3pV8oOu4YlhFB+CA45/jVTdkNSy
	kNeM+bvxTCX9L842XAWOqb2gk/lP4SsisFbaOjEEnxKpizud9uEEHxSqQLV5lyOCdgANW
X-Gm-Gg: AeBDiestMEjlIDSFtYwY7uuNEhO91PHwLjv27W9zWkNXFkiEOKks1asdSBHPsstrQbo
	PIVkaHq/fTP/4rQiMNYt9/K9REzHPdNfluc2Bx/0Y12ppZuTPIo5J2tjE9XaAdT5NGL2XqNXDtm
	mXlSFd/pzDrLN8pV8C24lvi/zfObWfBR8sUfw0bgJmYNJSSPIx3e9pVyKEHoiRmHi0+7WcR6uXk
	T2d5ThlzfnxjuYr+4YZlfMA7sH5iHYvzQ4QpqJFIOa0w7xO4HYXBFVsj1G+F9Q79t9xBbcrL873
	d71QyNArne13j2b8H6q8n0voLbZ5O/N1qz0AZZsr0ezBn3Z8/mkaw55/VfWPUXzc0yAqVepY+kT
	9Ume2nv20DnhnQGtR6draK7cnWLa4nGYn9JHf7jIMzgtFavZ2qNFooIbeVzqLSzSfBfegnVrTHG
	6EK8GVrZOwA1YtR0iEGw8DJ5cxriJPmIbc0zqGZGn4JJqlcw==
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133451016d6.21.1776543763438;
        Sat, 18 Apr 2026 13:22:43 -0700 (PDT)
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133450716d6.21.1776543762968;
        Sat, 18 Apr 2026 13:22:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0adsm1600693e87.11.2026.04.18.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 13:22:40 -0700 (PDT)
Date: Sat, 18 Apr 2026 23:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
Message-ID: <q5q7q4wvecgxsrfxjvkrjuonweb3ptq2cgky3peqbrgmbajmx2@6iyhe36qp4sa>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e3e814 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: msxt3a9xo74nLYGJGeCLaC7b-bVtwA5a
X-Proofpoint-ORIG-GUID: msxt3a9xo74nLYGJGeCLaC7b-bVtwA5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDIwNSBTYWx0ZWRfX64rSmmJNPw/d
 KnS4WF/qYLkkNTfj1Kcg4ODW4Gysghnm8WQCUY9srKbCdy+gp5Axq6xWA2jKv9gCycMq2KlX9iA
 9qMamfyA9mZpZ70OsWHqlCEx/S0v0luydDGpFEd8hZd9e1haQcNfr68qT3rvuIJWnfbCXacZ38h
 rNd/DudK7XV3qMs/jhNV8x5BZRoZZRAZjQJlYxSw4bYKo22sxZgQOWu0FSx0w18oncTRalTlZJz
 HHse+maFG3qqxjxFh256Iygsg96BdtZF5yYA8EcjcgopiXw9GraK4IslOIcVXUtAcT/qGQ0lcZf
 rvR4ywW0PHuQ/PkBCKLR8pX71X9Dgs3z8nhz28rZmR2veWh1sCjbcQcjuJgZBks7xumNxhZ5g+4
 x/VxqLqoIz2U21glVgP00nkrJ6f3DeHhMYehuB7op2RafHsPEtfdg6H+tir6T42uGnnoM9UTwg9
 7KN2YD1uqKv6T0AbwvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_06,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180205
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103608-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AA6D42234B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:59:25PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |   9 +
>  drivers/pinctrl/qcom/Makefile          |   1 +
>  drivers/pinctrl/qcom/pinctrl-ipq9650.c | 762 +++++++++++++++++++++++++++++++++
>  3 files changed, 772 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

