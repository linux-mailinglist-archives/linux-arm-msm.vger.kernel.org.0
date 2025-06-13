Return-Path: <linux-arm-msm+bounces-61249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825FAD9073
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 387FB1753AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF34207F;
	Fri, 13 Jun 2025 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrbmd/yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A6C7D3F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826816; cv=none; b=HyrFV5EoLuYISh1ftJNIMhsbXokfHuSyKovRjoNRirt8XNIMzcobfROBxzbmEjC8PaAxc7kLQuQG2tO+B262qf9WVGrazHYIUrxIdN7pQ8H4aUcQ77zeLQSoRAh2h2Ovzr4hc1RQS69LfWhkGg3q8Lo0nw+2BSj4j53XMXwd3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826816; c=relaxed/simple;
	bh=E4CkMZvZn5O/HFg1JTR/nxza/gN3m2V4wLT3hJV+ghk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4VmKmJ1MASj4AIOr1WrHLUkpaJufVGyKmdcNbDEwKpiihT5+CxCeGGyOo9zZyzEWRdwaidyPEAIUmXOShy2q8W3Gl1b+xH0BD3UXSFNa7848/KwtUZoMHimHN6q6yRiyGkAg6t+hhFvOcQ/wyXt0ahdqExrz2iz98fTBzFpNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrbmd/yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DA3j6k029613
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIoq7TQNFr31va//bRfEh+6W
	CaxxSdbEdo/2Vwgk598=; b=Zrbmd/yqIIBgBE7q1alslX9otWJmxqnOvxqIlsoI
	+MzWPJ526slnGZ1+KfyTpSrfEJjMgzwcCBJpbQjTUv1/TsD/hMDvPwiaTurNHMrp
	V7aVbLpTdXeAmJ+KHcyDFczMWxw2qXojueJV36jp6Bii3rY7NVEzY3w4zMl8WGJ8
	bNfzxou/bCp+R9DxYv8FQHOMWqd0GeZPLqNtKuqATKtcVzCTsTu3xypCdyzjT8Fb
	RDxElTisnPd+b4DCBgX/1H7JrFH0Cl4iEO9OwoGvWPAHPP5+yU0N0XmeyQPFswMd
	MSNgOdwodI09tgBijgTWTJdr3HkWOnQJExAW/1Pjfe96ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d12bref-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:00:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3466271fso38691586d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826813; x=1750431613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIoq7TQNFr31va//bRfEh+6WCaxxSdbEdo/2Vwgk598=;
        b=sXgqGQ6/CSFGfwQw9HMOXlpdGEkjNysh/DRfksJNqsLVXWzA9uIsj7WgQzph3zF09A
         wnQzkxEOGZYd6CV7ByTRzuYeMjluJ9scAjfZRi+YKQNqeAdC6/ttTGzsKlZObhQUvzbH
         nx1QBPRZe0SrrVwoiXrwDRobMQyeKkM6Edg/67Z2hoKX+L8OhaGLJu+GgvZrq4DVyRzv
         pVgpVkQaiFZy7QkkOix9kR9ydiFIzbJnXwjBE/6J0dTIMefZRi/B4k79roSL/J9NqdcF
         mQ1fV+PUUdIbWdLcYNLnoCB41iXjGzrjWdXw1YgUoPgE4y8WZRcswKukGvWrv6PoaBMa
         eirA==
X-Forwarded-Encrypted: i=1; AJvYcCW1twU98OvC8pXzPlLhRICMLzaXfwaK3Q90AuHkO/gRBQneqYrrrySAyiadTWXZD8pGeIiFSj0BU4UKPkTG@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUvHvMJGmnW+E0aYj2WKRShTLQpKjuHx3sXmCCPb3uPFtp0G7
	qmgftKoJ1odXSOFqMVtMWwOF64QD4aRbTbTZhDyRCvXpjE89kroPjdliO5zqBdlMPDsfjmK6j9T
	nIG60mXI6dLTHkxuMsmSleHhpVa+Rm/8wuOVsS5MWrqQ02moECWd/dMgKO9ttlFZtMtGK
X-Gm-Gg: ASbGncs8mhEloXNXjP+/EBvtsmkAJhlQ9uc4rgcHwOGvJY71DXUBA/6PsdevQuauWar
	tommObdlMVXd95vF727JTspqntLBAYeatzaCxUghUfGfHiUNl7k34DO1qrfUQVgZKOF+Zi9pXPm
	rCsZ2JyqVs2JdsHqAULN1qoXioWJ8vzfp7Ixgzqf+i4crsVcMTqWAXTL5SAE3NJ/3TXlmiYuewQ
	9KbGOAuJruU3ZfVGEt9ZR3Rw6v7T5eHXkQh6wLajrn2noERdRJiKbNYU/lFoNcdG67Y46yXhqGr
	Ebshf89uztZPgqpRIt+V/6Cs4al6cqIdpm91cURFV/Y0ymCAlnlCQZpOr3cdcrSk2cQlpEpB+Lu
	hT1lppGKx7eZHk0/LK5LI+Jg6I4EvwGqpnS0=
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr14748226d6.9.1749826811557;
        Fri, 13 Jun 2025 08:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGoXvnc3lC2lrsZXsOUtgUvC1XW6+DbQdmBou7XX0ZccxSl3D3oAsA6zhfFgbdanwdCRWggA==
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr14746296d6.9.1749826810361;
        Fri, 13 Jun 2025 08:00:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f76fesm472238e87.226.2025.06.13.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:00:09 -0700 (PDT)
Date: Fri, 13 Jun 2025 18:00:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: sc7280: Add missing num_links to
 xm_pcie3_1 node
Message-ID: <welmka636qegzxkubalsaskuptfjq7zudmeu7zsfayqpqqg2fv@xtvjqlm62fcn>
References: <20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com>
X-Proofpoint-GUID: _qcnb6V9SQtGQDqTA4b__w-PNW35roZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwOSBTYWx0ZWRfX4kxHe7+zn5/j
 tlSOu+t1R/kVQj8ATuw967Cd5Ica0ze1P4q3HZTuNbRbtC9kGJAiAli+qf8zbh4chLB6YFtkYMo
 5UnQMiF31asC7y/5Hn57zbRNIupG6QDzZxetnqtEFyugC9f788By4MEiy2NxHtwCVtFvXBYmx+/
 XNHK0YuVBA8KZ8DrpBQB32C5NrwXV0FhgqM0CiN7TJVyH6d6nunbD+TGZZ8OYAFvE3d98YMRUFp
 yNni4o+ZqUKZIrRj+SFdOKIeYJkO9g+ALGVAdIZt1lgteXQV905UV3AdfjAbh7MIJ8/0o04rmxJ
 ESj5xr9WOt7C81J04bhAw87i2zplPjR1k5PlRgZc5LvopWya5lMA0kfZpmcdfkXN0wZ3VaQg/SX
 wHaX2UGqFMS0b2IeS8KvdeVexeQxadYIE7NElqnQCIOabDk9aek+lz687wg6JTbdxgT/2Aal
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684c3cfd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=egLgVL_HDBsgJ0s0AK8A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: _qcnb6V9SQtGQDqTA4b__w-PNW35roZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=817 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130109

On Fri, Jun 13, 2025 at 10:53:38PM +0800, Xilin Wu wrote:
> This allows adding interconnect paths for PCIe 1 in device tree later.
> 
> Fixes: 46bdcac533cc ("interconnect: qcom: Add SC7280 interconnect provider driver")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/interconnect/qcom/sc7280.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

