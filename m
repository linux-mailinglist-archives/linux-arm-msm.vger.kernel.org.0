Return-Path: <linux-arm-msm+bounces-65292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 543B5B079B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65D377BCA95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E9A2F3C30;
	Wed, 16 Jul 2025 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSSaVcie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3B288CAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679375; cv=none; b=ZFwri24HhJA8HNbU+1RIRq7BiGPYvMUelDzLCgeUXgjH3BJtvXATNS94gAQr3AlHXd5bpOacuvsabGlbylxHtZjWl84lVsz3wA9kby1HCrP5/aG3cJPRgLvBvO95nol0n5e7sKDGbaHibWB6V0jGEgArkGcMd3kqmO1aw1DFvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679375; c=relaxed/simple;
	bh=VhG9AzSZ94L0m4yTcIbjiip59GubrfIHNlb2iIofRZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIFOO/BSWLn/CeW+EwAsI7SFLrgswxBwccsMH39OW12BFgLBI2v+HcvnVaEynPMJc+9h20F3Nfgi+k02eLqMbOl5JEL6aMK6btm3riWzy2YKyJu9tGcCkUW+yPKJYhOjQADJWtIyjxEoRqmo49Iw854bkoqToowGUBvWrTzaqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSSaVcie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC7rtZ018985
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7RAbCb/hRdSzkV6VU4Ax2LJC
	ptbH3p1ObvUqjOpfe8Y=; b=dSSaVcieCjTUNUNkpJkqtkVSk94E/cFHICoovQwx
	gE/VzGj7JdERa2teTygJdcYjeCshwZOaR+43jwaTE3Lxl7CNsQ9KLYCF0zt/gtbm
	kpHsVVHEPRX7u1cV8UGxq2A/00PrSr7utW6CPekzYydJGjX7youv1Smy3nlEEPoC
	S8i7kEVF4IZmjeiUChnP4desk4Rairw59m2EJsZgvOnaDhZ/t3M9e0FW2AS9MxTb
	RuxGTjBMhgd1qwLAdkhuRp6FC2p8yLJKaxaB67w+UDZEIkTUq10lSFO1fFax7bV9
	Dds7L6oKZMrOcwir0B04LOtxcMyG+dVZVM/O2bwL+ELtSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8nuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:22:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so1252133785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679372; x=1753284172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RAbCb/hRdSzkV6VU4Ax2LJCptbH3p1ObvUqjOpfe8Y=;
        b=G5jp7HRejKJOLSaCd4hkKIFBv8F17tudgKatoDOR2NQw3QeemnVAvE7h9++1ktw7ZF
         r7IJWRUaeSVZuzqpsxjc0zZvQXF+/ob6z3KnLDC/3IxLiWsSomJPHqgjtbrktdl5JrFw
         Bx1Esv9ab3PXwKsNBoQ+kQtTkwMPqtZwgOuhzqDChej1Fuq/s2WgaR5k0q/cnJ0zP5wl
         ZtTeYJRFR7UfGYsCJ/kpsdDfNOLAv8RBwF07rRfilenw05hpsBxeOX77BVMuUhnEUtGX
         GoqD252BvE2PDSK4QvJjJr7P7lat7Sb/LtT+5ebwDXVWqm31z1WhqmEKfTzXwEipmMdc
         b90A==
X-Gm-Message-State: AOJu0YwKpF2soj+pQ89wJBxgi+qpI+M7MgVnMBNHchWV48TeyMI6zlbX
	EloOiFRouL80c7M/ijtok98dTL1V71ftJ2wB1LUqsztupvGU8QcX0ioYYBrHbW00yS/m8wjwcps
	J6feB+eQe5qiH3DEV7J9jP3skj5+J0mp1gNLqlXviHnBACcEyA3PqtT0XPN9kPO/otRut
X-Gm-Gg: ASbGncvugF7uinkY2PoyxNykwgmRe/wrewPLYGnUT9UwofKrfZTYDpAwXzehbTgE1+f
	tppFATtcZg7W8J05lxpwGaGZhlSoZ/s4uBtnpqAMi8sJAru3TpbimqJCR/PHJBZpSu3cIbWGdRY
	ky67pnmYN86tLdOtKrhcJFsP618C4tXfQRr5Knw3NX90isoDO20PNO6j4JGZJFFWgcZ+uwPKes6
	hx8+vdTl7oDlX9p0xgTfZ+M22FQ488Ih0bF2y6iy1GxS46iTIAfue9mYgArNpHJYvHByab1KyqJ
	dDVszGvaJtihee6pAys+Iwwo6WwPPoZHd+h8PJghReEVy7p7DDySzMq0yzMJgoGdIhDXDpyuRe6
	WDtyiY8Ewk9POlyAeGXlP/l1zpyKnoQV0vsV0tYktrn3uSPCTIF5u
X-Received: by 2002:a05:620a:178d:b0:7d0:9ffd:422f with SMTP id af79cd13be357-7e343643fc7mr486070185a.54.1752679371679;
        Wed, 16 Jul 2025 08:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENloaWvoY9ZjMi7UqKHYublujFbYKx4L5NxmeqRfowsOVGfz002Oq2YrzRud/wdh7lvrpMw==
X-Received: by 2002:a05:620a:178d:b0:7d0:9ffd:422f with SMTP id af79cd13be357-7e343643fc7mr486061885a.54.1752679370921;
        Wed, 16 Jul 2025 08:22:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d086bsm2710587e87.139.2025.07.16.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:22:49 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:22:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/28] interconnect: qcom: icc-rpmh: use
 NULL-terminated arrays and drop static IDs
Message-ID: <k4zbxmhgcphpsmyjtvobmjcogblanvvujyxqdalx4melhiqahb@rup7xg2mb736>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c3cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Zi2BZlG-iNg0ZsKB5K0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LBBCTe8E2bqZxzQwaUKhAKmH1iYo4dWX
X-Proofpoint-GUID: LBBCTe8E2bqZxzQwaUKhAKmH1iYo4dWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX2GgvxGiIf58+
 cNLVlRRxskmrTH0OYAuyXHBV1fxqWrTi/ZiK6NSu36JyqsPGAVhA1EH/i461LDhs2yHSTRDDxXb
 tLrduxkPpilm+N0907QjWulqfpE+xAMkcTaUV+QuVq0zK/jZHGn9aQr67MkYbxdnGkBr4h793RW
 38HQ/RRajvHDwP4p0qRe/lxZU72nS52eX0vgi3kOY6hgdGj/B+fBUlNIPC8nhbg9rqp3nstfHHw
 dHuXZwTZXv5b0AMwMQ9liIJXbBYOBwfPBsC+el7xOJ8CkrwVrpYDX6Yrcgnd1ns3UF5a0qy0A9o
 kr+iKlXrdHUjl03vU0jLOtbdAGj/0r88ceSYiyUwt8wDQXJrSA11djJqFUytQQ3U1Se17/NkCxK
 0ldKYoolxpWRHe+FtQNhzZbGYIWQwpi+YIoEyzio8PJdPoHSJs1HK1Y+zFW529ZXQgKtHx5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=639 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

On Fri, Jul 04, 2025 at 07:35:12PM +0300, Dmitry Baryshkov wrote:
> Qualcomm interconnect code has been using .num_foo fields together with
> the arrays embedded in the structure, which results in hard-to-notice
> mistakes if .num_foo gets omitted or incorrect.
> 
> Rework RPMh interconnect code to use NULL-terminated arrays for the
> dynamic IDs case (as now all the arrays contain only pointers) and,
> while we are at it, rework all the drivers to use dynamic IDs and drop
> static IDs code.
> 
> This series touches only RPMh interconnect drivers. Corresponding series
> for RPM drivers will follow up shortly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on linux-next, dropping applied dependency
> - Link to v1: https://lore.kernel.org/r/20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com
> 

Georgi, gracious ping.

-- 
With best wishes
Dmitry

