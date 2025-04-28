Return-Path: <linux-arm-msm+bounces-55907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A0A9EE50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C07189EC7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C277525F969;
	Mon, 28 Apr 2025 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXUnkl4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEB2356BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837365; cv=none; b=g+sXCSpsVA3NQFbwSuJr+sY7HyRVER4PMyFmMJpOdq/uaJtTcGwmswg8nNbyUR/YFTa3xWL3ViN6QG/UPTmt7WfMzsTZjzICrBvwCSPdictwLlUqM/ysIqhGtRqTEiqQASMAPCve88MiLS488neg3mbDWKdCwJfg13AMao5VXuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837365; c=relaxed/simple;
	bh=c/A33H4yAtHrE0wZjDTWLJC7wnY8YFeoDowDA5ju/DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEHBkwwP5I+fx+HbezIlWUCnrEXvQRWKbqiDV+WsHbY3hJnupSY4iLGsfAUJcJXM8payD4Ko7aEBw2mGhy9NCM5VnxKt8ZJBqYYn94em+qUI1mfmPp40ValTP0GCJ31ysDubeBL+tvQUH9NtRDWt1LIEIFzS6StO4V8crJ1pOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXUnkl4r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9gIjX023077
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lDmhszglaNT9fzli8c56cXMb
	J0ClF3aeFP5Tl0qaDz0=; b=MXUnkl4rNXnQo2UMaeZmkMd1wyl9argAL9z+RKBg
	wk3gtZh5prQDnQzLt7zeDeLZL/8glSo+lDd/hcySiSMU//AFOBhKII+cj1bXMFAh
	szmhvWVoo/azNO6jR4Y3LL6H/WAJgcUoGZbHnhUKKq97qkZIkms/KghLtPA//7W3
	IDKxtMiSYfS1/qBgMyC5RjvnWxjwefvm/O8nk/YTK2VFi8430zpvt+0ea361kuew
	8Yetj8tosiB1BJzAWIyX/hNazmSICzZPJUi4la8GmDxCKqDEVuQaYYtde2OvxI9Z
	QJQhpJRRSdQpDoCSKRoRfj5FLzo92hUr7O0N7JfCfypOpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb7tfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:49:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso5214107a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 03:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837362; x=1746442162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDmhszglaNT9fzli8c56cXMbJ0ClF3aeFP5Tl0qaDz0=;
        b=Mw5YstxgibRoZo2gcXZSz1rQzrdzaYO/AsuDTV1P+UwVv0qjMzc0drhwErS5y2YPbU
         pRIlCApb9yULjMLfAPkDGibWc5QYki7Jtv+FXrQUaoe+06K7cykgpHLVlp+nxPss+E4K
         xytgyVzC0yjZ51VFnmITGr9yjMG0JadVnq0R3HBMnQPpXBMOu1OKhR2KzeSbAb3ci1k9
         GhhcoAcdAbRH4Hy0/8SFGAWZEWiBVSdNkdhNzBy4DWE/G0glfL/Bz8HbawV5LxeuZ7VU
         pFEtZuYL5+fYrR5S15uxPCXIr0v0naRq67hVuLylY7Lt4ALH94xvRJ/bUDZmDR7M4Psc
         cqgw==
X-Forwarded-Encrypted: i=1; AJvYcCWL/BuvPrLiy0/8IVkC3lFkBI6rkwEp5EtZtzaIoZMpx3qffS0FGsexaLxs2d+4NuECGmOKhRCoe+cVcgnB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dowuycLPBd4Je3+1Qm4V9Z8ycKziz4//KoiGqW0Qpor7eaQg
	gDJtrr8tStjPBNlGv1T5aPEdTNo/F19UH0cCb3DkR5vw+v943Cf6FuBYldzQqn5oEsx0zdNuMdk
	GIUaloxX2fI37FulMU+g2lE7uAAZB69Aact7VAK/Jo0ypW8L9C5D+jhIvZjmoM30MKAjYHwmOpd
	N6FwFM0ysD81H1nR+sgoGyS7g83idFW2esY4RZ8j4=
X-Gm-Gg: ASbGncvkL42QF9bZ/Akq6et34qH4RBZ2C/LBVJblE8qQCb5S4JBFA5WIq0RhvdaTBfo
	TPN8qOytS8HCp/kJG5oZqQdoc/yDzJvF51UKJ7EzKFDhcd0VO9RCMa8JKeWIL8/le1pINl+rfQ4
	Wuz94W9N2R0CWOy4HWq2cLrSGa
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-30a012fe1b5mr12489597a91.6.1745837362148;
        Mon, 28 Apr 2025 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz+/aYe6LvOR+KmeDd0jMeJ2lt5sUppcByWexbXLICBrt9fYXv9DequtQGO3Qn8Puh7URm/6CRCB6zgv3HI9w=
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id
 98e67ed59e1d1-30a012fe1b5mr12489560a91.6.1745837361738; Mon, 28 Apr 2025
 03:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com> <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
In-Reply-To: <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:49:10 +0300
X-Gm-Features: ATxdqUESaAcsAnz3fLSqCu2cYjvTXl2dF4AhQuMy8hC7LO1Y3nzIdjCZakO_n24
Message-ID: <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OSBTYWx0ZWRfX4N+rFPQF91L7 maQWvxO/JOmLpL6d5//oeYKCXqmVOsij7trnQxFijvk2ouBElz79UYIRHYDZpZRx6tvH2DMBHUZ 70pr10ipcY/Smm6BD1uO+tFLbprnjIQm0lmS6cbXunOhhZ1MDw7d6nYrMcyDFdPGHZ5ce969QaZ
 jq4HScOdq0w3ZJxX8QeKYdHZcuHC8iN0gmbnt3OJ6DXKDzDIlzb1dMiFIhoyLhBAocr+7pSsYFa BZ6MHT1iIZoJg2mLmieqwqCYW39Q+4svqAhAm0gNlxkrMOX6oIZJR7vTOuQLjoIB2nH0Ag2Qi9l 4wjT0SWY9+2F3vTTdnE5qYerLoqTguDebE+nXJlwMeIbTvGbqypbXGG0ufLHRLG1UAxG1slcaqS
 30HLNUu2NJXLGDI2lXRZKd2QQDl2Ax2E/dnHVhEYYgCNx/XD+W9/ZhtxN9ZWLZnT9px++uta
X-Proofpoint-GUID: lq8KUqsSCBV77LyjmYcdrmM2Mzldbbn_
X-Proofpoint-ORIG-GUID: lq8KUqsSCBV77LyjmYcdrmM2Mzldbbn_
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f5d33 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L9MUveKbg8kMJ_lLYs4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280089

On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> > On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >> For some reason Lee has mis-squashed two commits, picking up one chunk
> >> from the first patch and one chunk from the second one. Rather than
> >> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >> Add qcom,apq8064-mmss-sfpb").
> >
> > I don't understand: that commit looks like direct, proper result for
> > https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> > so where is squashing two commits? The diff markers have offset by few
> > lines, but it's still just few lines and they do not matter - there is
> > no diff/patch mismatch from that point of view.
>
> Ah, difference in compatibles. I see the error. Anyway, I don't think
> revert is correct. Just add missing compatibles.

Why? The commit that went in is invalid, didn't come from my patches
and was produced in some weird way.



-- 
With best wishes
Dmitry

