Return-Path: <linux-arm-msm+bounces-89280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B6D28A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E487430AEC49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F65320CAD;
	Thu, 15 Jan 2026 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pihlr5hR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5Nb7aKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702042E9730
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511162; cv=none; b=DoNDgNBRPNZ3IG4w10EoE7AGFaDp3bMv69CZ1jguhPcE8BWJbhKNZk8UoQi2p3FdY/fRDHp+4ZDD7xYGH8m2++10kJzApZ0KjOkQm4cUoWN7KGDIEi9WdMMkq2U1cIZMQAsBgeJFppqRBHJu+TB4RxMEzelQJdjPdlqcdzktU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511162; c=relaxed/simple;
	bh=oT4zUU59FuW0YMr1mLEcrhwypZDnZUhjV2Wq+ibm/TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuxiFPv6f5/nkxWfbKGibfIC7cGzNQkVEG7h4jJxNt+wwvSPudRG7TfSHUBGueChyAK8+4hpS77qllpeE9GvYlha2QTEY18TAmSHlqA1DvKSxfPyA2YmrzTpUEEVmAs4t9VF/cKgKMn6ICIn1E0dHWVO/eQpUbP8JT6Rh3eIG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pihlr5hR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5Nb7aKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYLU03113532
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=; b=pihlr5hRNDMlH5Eo
	HDO4aQ9hlDtN7ejwdyrQ7/7aRLPYDdTqkDXA5N1fcEBNCfZr641KSZRgcJW+VLQJ
	ycPuC7fHqqSV1G6C5zN3krTtYrr7SzrhSSV5cb3yERut1d7FvaUsVquJW8jQY60W
	9XOA6lJKHnSz5N6GjnmzTXrRRJugsqRUEYjTbiF48X1HWlpasMBMLLx6I+asSv/S
	GG3siMQ58K8JMg0VJ5o+XDLwGitJZhVtk78IAb4z2Zv7lBVmlzOmB8WbxI2Ep6eQ
	qrZ6C4V+F9BZ6Z2lzCWAn3y4ky4YmOVSea++Cb144CWdjQzso7/RidLkJ/yUOrnX
	93XtWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so176913985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511157; x=1769115957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
        b=O5Nb7aKquYG9Ic0urD9vxWGTq/pZpXAvMLyvf0KX9MybE/EppTejAMZGg9UO/OLCOC
         a4iLEOjd2afYDC5oyn7/oj34IDLaiCvyBDQ6D4BRhkPlmx4cdJbyKOX6xg+nqXju4i/k
         L0xjHBe3NpwsMq3jhoTJeRTro1LhACF4bKllTmzZ8uhr0gWqRvTnNLf/zWkqWNx2Wgws
         yHAiYtp/OBRIjqSb+3nW8WPzeYUas3xASsAWXId6kSiDD+gBdjK1XkMBc0GVyLguYdOE
         evRYtzm+CWxQCHRvYDivTlqkqRDVE6irVVeYsAWucGmUHHfVTV5MNrzCEACZ/lZCYYOh
         zmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511157; x=1769115957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
        b=sfA82wvScYwU4OpkrxwP6sLYAa2CNVO3i9/zE9QuLD570SIhaV2MieYF1/WYb/onG9
         Nd6Kg80/UPrpTKFDUixnGCyqxP8QW+LWPZfhkkS00QdCtpspR5p76kOxUXHC7FDn7g/Q
         OzEF2nzc5U5Vl8Hx2xSn4gfFM88IhmP2JdETyO2pQxWkZjFDQ9ri1tYzenaB5Z1DehWe
         6OUVpfT+nt75vZgra+H5TBnli3dr3vEcMnmfJrsANN6oXOwW1d0XMnzo/WjowC4NPX4Q
         OSt2p6BwHw8IRkyTMmL55ZPrAWUehvA1zkwtAyzj4diRVPpbnNK06aUhGrZ6bYwURGek
         EfpA==
X-Gm-Message-State: AOJu0YwGMI/cpiia4DDoT1Czlp/WeA3/apWHW+O3eNAlo1x1xLLRPWxZ
	CKgMeiOvNgzhb5mlRwGo50bbN+qg+YsBNq6DRd1up0CtbdKbPpdV9ffSEqxUv0UsaUE5E42H5v+
	3wLWrX6Rrp170acXJlZTxuowkpEywRn8CNad1O6bcV/fLxYSDncu1MisB1SV8jcnuD9Cd
X-Gm-Gg: AY/fxX4lelsUQ39R/yrwgCUZ/SX+E1dNdcJWZgcXpRj2m2iyHCcbeeYgo4w0dV0DIOV
	3qMJHZ3KSZ4juj991VUmVmd2s9mdt1oKBXEjwpnU/lu9pBt87sNqMZ6MYuDFCYhCE//bZgtNUAB
	L/kAoIeOQYynQaee0VHiTlVAz6pS1XTz/RFF8Dk02JJsnQlXqTkzUvvaGW6R9pxxeEoSpZtm4gs
	BqcLJfumH3BzZsBzw9VQXFXgO3HsYuIo04u0YAMPqqt9MP1t1pJH3FlMc8oypD5k69WTxsCZ5lc
	vGad8QxB521l5KPN5O5BJhdu2NpxCtcM4SAqFqB+u0cjzZJxdCXJYERhJOtwGCpVzam08BW9v5n
	qq+YqR1j7xkBhZUfOptwKZvvDAYlKrA1tOISxm12QI3pWtu4TgcVq+/SCBlcwsW44LxFrhW0S2w
	3SGSm/PiYVwjfUrO9plZjrzZk=
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id af79cd13be357-8c6a678a36amr148003985a.51.1768511157264;
        Thu, 15 Jan 2026 13:05:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id af79cd13be357-8c6a678a36amr147997485a.51.1768511156597;
        Thu, 15 Jan 2026 13:05:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Thu, 15 Jan 2026 23:05:53 +0200
Message-ID: <176851111169.3933955.9170507722560093643.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wkP945k_39MTkgFKSf78hRzhqM0_PTZk
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tuvf9S6D2CPeCQ265SEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: wkP945k_39MTkgFKSf78hRzhqM0_PTZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX6ICC3pyg4adN
 S5MJcWzBrtzz9D4VueLkDsEUogzpCZuzPDxLDhRlU9hMREo1C3dPK3Uelu2lfsh/M20nMLmIQZs
 +kCoPb8dzik+49oKnjZgf41YLUtpbWZIpptxxmxUPPw2ktvZxUe2x8yV1GdGKSQW1KpZYmmIbGW
 hT7n4EgS9erf6LoXobgMgrDJuFQ2QjloqWYzBZuLnvdJqzDq8YKhsl6yOE2dhJbhvVw8pHxhwm1
 rgt+9YyGRvQupyaAxRIPT36DoEmUNdTiIpSdXQnYP+w0Jam9w7m5wwZCAA2Qhl3TASjo8K0+QYQ
 E2WkwYGthZiQapIGLmPLtqC8P2XBI0O5Ycg0T7EiqoBa+XFf+Xaa99OQ67BAZSKcNg2k7y6x+6H
 EpTFv+n5XugB6mOIFBVODsNc6R5sqphFDEtAPvFfLTRwwiQhGzCGwRMcH6L0sebepuzl3shjgHR
 f2yNxebnlha/mVuVszQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Tue, 30 Dec 2025 09:17:55 +0200, Dmitry Baryshkov wrote:
> Currently VSYNC SEL programming is performed only if there is a
> corresponding callback at the top block. However, DPU >= 8.0 don't have
> that callback, making the driver skip all vsync programming. Make the
> driver always check both TOP and INTF callbacks.
> 
> 

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad9880f059c
[2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/794b0e68caba

Best regards,
-- 
With best wishes
Dmitry



