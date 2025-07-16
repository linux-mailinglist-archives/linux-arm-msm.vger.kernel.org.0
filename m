Return-Path: <linux-arm-msm+bounces-65297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C0B079E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B495A3A9776
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531C223496F;
	Wed, 16 Jul 2025 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkXgvXc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C405B1D5CEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679868; cv=none; b=jsUZ/KBxoGxMNwQ1q4pfkYI2jZxvAIV9sNgMxVR/u+P3lh8q15KXqvQOYYZ1oSA4QDPXlOJDWXX/74D+5blT65wFR6bDkW/mIsPMMebPKCfkt3xzejW9eUi6xTTriL/CKrF/AwLF4XvfULm4fY/sZ0AZ2Tbc5TWOaCe4PZOzbUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679868; c=relaxed/simple;
	bh=/lLpKCl2c3s3b6IB1AXI7KNpiEuKvyHjh0OoPcKoN3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8VCMIzGjL4UKCsmvowjWRxtxwxHPqZL0WwwrKkws1YsdOm0cIIi+2oSNtLzBMsFAI4IgiuKPEM8T5E9T2Mprn0F3aQ7vMggOMmr7OEnSQeWJQaOoPQFK0grQKochBo3OkVwE0LKO9tvHCEl/O4Ad0jzQT5c09tchaPsiPK8/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkXgvXc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1Wf0031464
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WtJnIzqB+3SesANnG8pILja+
	egjdW8sjzapaUNf64Bw=; b=LkXgvXc0cWraNAW0XpxyqSgIAgFm4bNdFCbjtBuc
	OEHfT9UlCX89bvmSQGI7Do+V86qG/G1aZoSgaYRfK1sqUPafcfklNqAdryVzl5t6
	ZankvEAdlKLtLDg91s6T6BjUhoXSOCi8Yrf3ePbke0KK5zH2ULuvyfFeDPI6YF4J
	tEExAxtByeNqRk20E+g96BfW/TdhU5dXIgupneJTlannFT1xvw7ZKRmiJ3LB/EL2
	ypa4CMrNMCToIl/asi9sjZcx4SMBSbT7pyKv8Fc903ADV6n2UGPIm0tiFtj2+Bpp
	U4tzAkjmzeBk9Uf6GMt+u1xnBPaIjqHwGPTheeEZStkCTQ==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h9q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:31:05 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-876afa8b530so716943939f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679864; x=1753284664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtJnIzqB+3SesANnG8pILja+egjdW8sjzapaUNf64Bw=;
        b=e8bo5ZmdJxoTVjSQG0meZH5isCi+hH4wcw7VQPCLBQVaykPbcNdI/7WpsvsxMTeszq
         mGTRGYDPZ1nK2IGRMgqovqRY89US/+kFvBTPhoM0wZN+N1aE3IkYanRuxruufV8G3NMM
         IL9ea9BUwlNTlD2/jetkatQ3H1r8489T1HYvnkiTZCE5myhndm4XqlnJtW8Aut7D1Ib2
         40bQwcvVWdyDS0jdCPAc2M8YLqLif6krGJi5CZEh1pIo6Py432C9nW2LcbFTWCzjhUOO
         OTrc1estcYTp+TLM7xXCN6Si6iB39/7iSiX7dkGBNcl3a8puy9AZx2GIqqHN7CXauBjf
         URhA==
X-Forwarded-Encrypted: i=1; AJvYcCUOXvmsrZDAcvezjiCK32/IokO4WWg5ynVAtsWMlO5g9GXO3yB4F3SDHl+UjrHXGb13iJ39TrIOGdPh34ig@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAnnSpYnmqr7nYe9sLS/xjO7QC2W7faBs05bC68zk9ONdZ5GG
	ScpsnB1vzebGWkJuYNS5Klrc0Al5mCqVZPLl3JwMBB9UFUsbkbgQ2k0bt8N+lmDAmSyix2Y9bSY
	+DhKPPeoJDVdu4MpypcTt4QwzIBu8NR4iIMM3QdB32k0znFplRf6Ca8/PGzV+W+9M/Ffo
X-Gm-Gg: ASbGnct6xPcPgC9yqUtBrYkfMBF5d8WbT+3nc7zqKaxk8a+lA9zptYngzJF/3C4pzN/
	+Yaek7nJph9FgFJqDI7iR+sL4qR8mDr8HDvyo3ic0Nz+p9iM5TqTSS2s5LXq3JMMG3fIex4Wcj8
	nXsVrqMiniXKF1Xsuul1nQjLv7EyAgcG49FyKZOmGyq/flpdfjRsuEbcOQ5xw6JfK2YSwUH+POk
	E/9oIbbSeoZ5BfzCSkU7wS/1WpWCZ16fqVtw/FaRi/fVm98VCCwKYcSbCUB5VHEzG8LBbkstPLR
	PKJJMuBoDdqnDpQlWq4LFtwq0EpY9VWU2Le6pPSGNR4QSo7gkKel5j+9OUnjjSb2614CBW7ubMN
	2RsYzh8bZcbC18JIPDoGABx2TUSoOJVmI8bpPEADRrFcpyCTc0EuP
X-Received: by 2002:a05:6e02:4701:b0:3e1:5f8c:10e6 with SMTP id e9e14a558f8ab-3e2824455b8mr27612295ab.13.1752679864487;
        Wed, 16 Jul 2025 08:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUoHT+PB8kn2rb6kYrtzuZSZX2s+9VLncmPQvqc9jUsjfQu+TJIFGcQodWcjaEgjwNacwprQ==
X-Received: by 2002:a05:6e02:4701:b0:3e1:5f8c:10e6 with SMTP id e9e14a558f8ab-3e2824455b8mr27611855ab.13.1752679863975;
        Wed, 16 Jul 2025 08:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bcd76sm2667601e87.35.2025.07.16.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:31:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <b7xjjlrn2clktozk5uwipt7tdv7clwipmq4wono25ts2csrsil@wcsl3wfippcz>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
 <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
 <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfXz23+m3d1Wthg
 VG3VElnkiZs6okgUaWm9XLz6rBP/6H/yJzzyPfBsmE1wF0+AQNg3C25GXkTPNVHPat7ePPtSmJh
 z4ouczqG7uap6m2LUajemT4CVMSLX/rQwyD12Y65S29nN8ZMFjhqEuD0gXZ/lbeySRyQin8A2N6
 3AhKd87WUWU/lcH5RAa82N8CgXVpKai4Oi+Z0ajlrSvvKln7B/qo5gBmwHulZPQLZJWoOnd5wa+
 0YCBXYeGoWt9P5ZewzxizaiiUfP0PJCH+KZfhB8brnEQE2ExsoEex5xHfg5OAnNbXtTdn3Bg53W
 IqJoqnspKwzL0Ou/PIc/LIyPJaQXH7/s+G1Gs8sRiS5tcPOOHyF1l/oN7qiS7EPp2B5NqX3NqkD
 DpC+z5kou6OdG9XJo9QjfP5KtkcNuuHrxlA/KQEYRubdwXEc+e48gjcKHeH8Tao1veLB3hH2
X-Proofpoint-GUID: vdSN-jM94qXx8jEi9PGIuWlMWBh1lu7F
X-Proofpoint-ORIG-GUID: vdSN-jM94qXx8jEi9PGIuWlMWBh1lu7F
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c5b9 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=SawCyeuA4rNlEbsMlaYA:9
 a=CjuIK1q_8ugA:10 a=61Ooq9ZcVZHF1UnRMGoz:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=727 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160140

On Wed, Jul 16, 2025 at 05:21:20PM +0200, Konrad Dybcio wrote:
> On 7/16/25 5:00 PM, Dmitry Baryshkov wrote:
> > On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
> >> Domain ID in the uAPI is misleading. Remove checks and log messages
> >> related to 'domain' field in capability structure. Update UAPI to
> >> mark the field as unused.
> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 14 +-------------
> >>  include/uapi/misc/fastrpc.h |  2 +-
> >>  2 files changed, 2 insertions(+), 14 deletions(-)
> >>
> > 
> 
> Dmitry, your message is missing

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

