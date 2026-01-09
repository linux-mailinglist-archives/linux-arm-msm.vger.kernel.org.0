Return-Path: <linux-arm-msm+bounces-88274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67DD0A232
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B6B531B68CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E081835C1AA;
	Fri,  9 Jan 2026 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw6klRMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGJMM5R6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F991359F8E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962995; cv=none; b=QVO97ogzUJ3+l1i05spHQ/keGdXtWd1eTdtYkPm6UaGr+mgENQawbyaq8WlE3Ln7gJ+vwvcI7p4njon7IzS4jHfEmAsPCaYFONlCczrtM7+b2sv3HbmPFwikMATXF4X+g2zpzo2+fdLCkrlwIXTpnoNVg40Ta8F5LPAyfyKsmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962995; c=relaxed/simple;
	bh=WSWdmixBO1IUCVPGrGWXUizvHhMIt+Fempr0HkzGYro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XltgoikJoUCOKPtlC/5FP0ykv7dKNHPRTdF7dqptdrA2zn3SgoYJbyyobUDN2edadWnG1if05YtZmftJrBwoVcVPkqo7ye8pE8E88pNLTfUXw1l368IWlieH8/lxu/RDKPwkvwMEYRmycmCiCblBN/Gum9fGFSsuZnuophDhP5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mw6klRMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGJMM5R6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982XNR2184008
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rd5uHVBTMwWuRc2epUK6f920
	2o112jWj2BZm/gYde0w=; b=Mw6klRMcBaVZT2/qtbZ975yCZOxXNduNfQBe0l2k
	IulxeIj/bm0qe2a9E6ijucFyrdtMzVfSgtHf7XD+GMl8Kx+P9MvHpA+W6U0uQx0N
	FFMMIES18plXmp3/F0Y99EDUBALfjzNCWB8WnM/wPWcKni2mh/9IToq+u9xN7zhj
	MguY+E74g3Qk6Gwo0Y9qbQY38hOZwYCGE+I9an3M+oK+q/vVn0V7SfBIlP6tPv1m
	FFTdKqcLnv24x9QjKMc/nlC2oK2KaAeouw1XgrH5LKDDbqloRu10G8X6UQdP0j8P
	vVySELgv+yTstyVDFK1u3utFqP69qBYDk5eKa19VQMiB5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8v47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:49:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso985320285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767962993; x=1768567793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd5uHVBTMwWuRc2epUK6f9202o112jWj2BZm/gYde0w=;
        b=aGJMM5R6/c8xqJHBMiSS2n0zdidgPdDpxA1K4rUb6a6D+zlyOjWGd8AXsb0Fgs2UeW
         neLarekyR/r9vsbyBKNmkyJ6/OfLHWfg2tN18YWQ5V/KH1bxZG6PQhZFQEaiMQ0G/qKQ
         j5KSuM02/Ze66SZkHV+ewO6wUCheNmIJxvPisUKL5l9F+EADvQcS9rVO13/mFaTMeEKc
         6xAkQMsqJAkI6wpxeevNJ1Wvs8DLLyGW+oOAEUWJl8vFVXw5I29iBzYVGdJnE0WgfigD
         Igv3UObzGSvmzH1+PVKG0hC8SsgboKJUTMyyBN56ODiG256fR5fZS7sbaRZOs2Lz1FHI
         fzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962993; x=1768567793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd5uHVBTMwWuRc2epUK6f9202o112jWj2BZm/gYde0w=;
        b=MrR6P25JL40weXsKA28GIviKWfUfJzxl6G530HMn226lTwLCEDEe3xTFyfEIcvHf3w
         fRZW7Hec1ssllVkImtNnD089IBXOgooTRl9ceVjAw8bDdkFU6iJY3PMkI/m2rs2KK7Hh
         El+86HImvFjAzvFDG5dbqB5bCWwok+HxwRuKFy7cQ26K6APnFq/39ytQo+N/+aLRiSP0
         equaaDWVwii78IhZqw+ir+gqXozyrTwybUcuavDvKGdcxp6AqxeGO9b8nH8Ho2iAAxMh
         I+8GCQCq1Ezs0hd4kKnHfIlLipVdQjk4GE6XA7v+Vbb9vjwNdiF3h0tSj0WtZJkaWPIu
         VVzA==
X-Forwarded-Encrypted: i=1; AJvYcCWNC2dgNXWi2xPps51iiAOkMNydmqN1Nne/LFj9noP3zMHILyN6N5otmxl6R3yZQF2TVWk+kbsCoyH+Mcxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/eLl6VLYNb+Mov+kpj6phG/xnBvmB28je4YGEmZXy0Bm5rvx
	trbVpvC+g5S7ODEzyDJp62QGdAKRsI9VBxe3Po4kg5U6TqTvAUC16xQbLF7pZBAxEgsAFU5RuSZ
	8LwAsQ0wxLCEs2jaMh6be4PUCRcJHK9VGgeBV4xzS6W2yi2dW8iIX5T6HbRtDNrgCdyPk
X-Gm-Gg: AY/fxX6LeBVBpuOdy9IQYpIncHCIWqYsixtn8HNaEdHhdgOPSoNF0Gr5HSFqu0t891j
	AsVbEl7RX8CwsFiVHUPlTtRA/hQ+gJDeMlt4u4MCz4kMnVCzq4CJLK9chT3ca2f4ru3uNK37r/5
	YwYLierpZEOstNlg7Lx6+RTIn6rk610DZ/KhBQJASP1eSGmbqWaEqk5xQPJ/p05CPPpi+1+ozTx
	5nba4JgGmhVvb8bdMdXO6ojgN3dbHUCDxWc2Dq1KK1p19oIW0W50e32PHmBqkFLTkILi/fLx3Cy
	pkGNRkaERvJJ/onipSJd3emMIWZBbUEON4GS3wuObAdlI4uy+JdT6ieUIbIixwLj84qknSl2fue
	rVs2/lmlQRxFirojb9wW4HS461QjG7gW/Z2nKkPKw7bUJGqzO4vULxPcAWlweWAH8oDK26Quy+E
	hMSaqlppDHyXM+0OkLwap7B+4=
X-Received: by 2002:a05:620a:258e:b0:8b2:edc8:13c2 with SMTP id af79cd13be357-8c3893693ecmr829287085a.11.1767962992587;
        Fri, 09 Jan 2026 04:49:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHstTtb3FrRh30obIfJP6DUKWz7S2L8BnVOnPKrp23IWevnvTKBVQtaFafvf+bRIVu2jd5OyQ==
X-Received: by 2002:a05:620a:258e:b0:8b2:edc8:13c2 with SMTP id af79cd13be357-8c3893693ecmr829283785a.11.1767962992062;
        Fri, 09 Jan 2026 04:49:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3bf079sm21512361fa.13.2026.01.09.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:49:51 -0800 (PST)
Date: Fri, 9 Jan 2026 14:49:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: Prevent unnecessary PM runtime
 suspend at boot
Message-ID: <d4m5xswrcekjm7vb7fxzmx7apirgmmypaqpmazkp6xqc2aifm3@7iyer77wey5p>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
 <20260108154944.211886-2-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108154944.211886-2-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: 0sf1j7FMOZ0RAaX41QxvCmS0NkVmUqn4
X-Proofpoint-ORIG-GUID: 0sf1j7FMOZ0RAaX41QxvCmS0NkVmUqn4
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960f971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b7NUgUE6t-UYR0nikDAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NCBTYWx0ZWRfX/aNeMFJsYFxV
 aE+Xuyi+pm4w3lEwfneQ0puCWnA3mjrfDDh7JI7g93t7SkdZiu/fgkCn8Wj4wLeTEK3FNya+msJ
 F4foQ1jx/bSbPcs3rOrhKrzgD8GY2KUwJSkPzrfG/85hE6MNYVU3uV+WcWq3WQTp221ZTH6oI8T
 66AOfq8+RUsYYVlX8cNYZG63kUjPx+I8rotx6sfevdPY6CjNlwTd3lZlbYtF28NeXG8L5XqJGMt
 ESjC3g0xHCNQXNAezlvvuB88B2r48T+RL0/1nhzha/J97ypoDBe77UcrsBG2glYwJxSMMBAifhf
 qNz/FVkhR/Q+p/rRD24/wVUExHuAKPoFOJzB5I1QXuX6UOsFYQmvE0ZknXPO+KeHzc6B/HLZHJE
 yCqKq8AAhKiLSsZL/ElfWdjJfx6FghM2aDEyghQcIfdIVUxXffP78oG+XcKy78zXXSQlzm3yxOr
 PN6CHBSO/35nPEv1QvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090094

On Thu, Jan 08, 2026 at 04:49:41PM +0100, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

