Return-Path: <linux-arm-msm+bounces-62262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40CAE7449
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 03:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6006C3A9AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 01:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5917528E0F;
	Wed, 25 Jun 2025 01:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0BF+O5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8552C1A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814715; cv=none; b=qxPaDvI/Ds/7w4URMPQ/dOIxxbQHl6ymCLaKo7uN6E0Vq+0d+d4gBrMyhNeMae5IYFlc0i2+cVNHKS6W1UAHywAHJczkQFvfL5aBdQQWGj/Y21FTmVjaY0NyIkLhxnSf0sVI9fWCELFdVPHqhiFCBnbbyMWkRPR/eLqGyH2l8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814715; c=relaxed/simple;
	bh=LjILxZzJCo0oNQBe4Z6YlCNWg7Xm/G6qiCtV+4mjvv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1wtaImlYZMMxzvNxj6tgg9akLqF1rdkH5EwOe3p0J0+8YbjOZohUPKZQgKyomZ/Jbyw8uY8T1jbgPEZCB9EK4cdmS94LFA7Junt0IYw1uEDWirvnUmKdNmlP0iyvNJNNDdayQyBsgY7glP2iWS6t0Yb7Mc0P6CJpY1Ugh3Jl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0BF+O5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEbhZc021620
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oz6s1/LbHMBjPRDe4vexuHv3oMH8X3GRD3VQxCaeQrY=; b=Z0BF+O5pA2i8oewN
	66tHtfVIwP15TO2Yp5UdTUUAS7vrG+fZAKZoxMSDFyEkmW0IJ1bjgI7FLuCU/ET3
	LFNFus2aShef7c4SazHbZVqhWej/yAVJVFYe2Axk+MiuqPF13lyuw473FvNuEBXA
	rL5nDsdEAVr6OmwfWUropv/Zey8AW6BVzy2D6kH1aiGuk8F9gBLam3lxzkUb+N0k
	D2gjH9TgO4X1JGeT7nTBX6T4YeUEiq1wlwZuB6CQ2V5V98i+CfkrTsJzF5W/hmaa
	j8QLRxDctlAbKXIVLJjDRDQgxeFLokzP08g9c/7JVuUC2iV9kjt9CNuden8Jbdyt
	F9KWHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec268a7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:25:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so512881585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 18:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750814710; x=1751419510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oz6s1/LbHMBjPRDe4vexuHv3oMH8X3GRD3VQxCaeQrY=;
        b=bdPrHqJQKkaR7JN4fgz12WKk8KMlNDEJNHRpnu2M5hJoUdx0p8WhR5rzI5DzXWYDu4
         A/XH08a8sZDfpyMUw5RPe8fbkX/EcnMChspJ6zYRrJK26By0BQ0nkKfLQwQRk9etIr/I
         T8l1sbN5IIYXjjBezOKx8N/jzRBYGRPkx/aZGtw0rauJMjUmWPI7vb+y0VsrvCS+dPRB
         fT85HqRODuiReap0Dcx8cw9S9+hVG2QoCRlhpTsMi0481nI66yBoR9UUDj8qJT9daHTk
         qODVHszr74eppcmaxc+EoAlPA1hkn3d8XWWDxLQmJzEMohIPtmt8oIctGVI4mwyNr5e2
         dgCA==
X-Forwarded-Encrypted: i=1; AJvYcCVt8Cu01VXJivWMSF4oyRPYZ9KZWMH8j+6R4Rv/an7TCdBMG1Vx6QASNYGf5ak/vbnX9SfsFh4rIbR4hZpP@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSJHYMlbGBufHLuvs8eDkWudtwir8m4A0RZB2pbIqCSofIRyY
	W1Mqynk0QFsBO0Fnhs7n5nEwck+IOlWUMIWS3ZSvFwhJ/BlYbcxLOgdw57lWESBdg0qbk/ypoHf
	xIMLRlBrrQkcq/jG9ahD8aL1gCi2qg5pylTHeYQE/bEk1i1jQeMQfxKol/ryYmFayNcHY
X-Gm-Gg: ASbGnculwS7aJAr/cSMyciRJoqZNI3c1qtl4FOil0agwF1Xod/B/lqbunubXbndLYx6
	BdfGGUx/Btcnd8Xn4vuM7aOrDm1Ed7v+C/uI/+s9OjVS8o9d+8W2Ka5ZLILPtZ9rVndkDCb4J6f
	Luxtb5XI0AzEybXSJOP0fCOR9nxi4l8sar7k3AfY1XQViq2tfqIMNk8l0F0/5t0TXy8nky25cUY
	rgU10QQelJjQn28MI02eT9aq5le+OfIrMPBnvciZqU8V/hOfljgruMrA1D3A6cI3zrAEODEE+xk
	e9apnyc5p8IufgrMfCpz29rEYWNC4iy9qwHCHqsAnTRyoMLaBzbyYH5FoDJYvEJceTOeWvB+3Qf
	8Rrjr2UKuD5BzpWK4SZZMjXuhMIcBAlgg1Lk=
X-Received: by 2002:a05:620a:1921:b0:7d0:a165:60f8 with SMTP id af79cd13be357-7d429745a9fmr180105285a.25.1750814710503;
        Tue, 24 Jun 2025 18:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+uLtG7ipJbXkywhU4UbbwLQgBm3VR+9G+OOF3uy+y49Y5gXE0AwAWBnHUpJ8tRalX0TYB1w==
X-Received: by 2002:a05:620a:1921:b0:7d0:a165:60f8 with SMTP id af79cd13be357-7d429745a9fmr180102185a.25.1750814710102;
        Tue, 24 Jun 2025 18:25:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d6eb3sm2012990e87.244.2025.06.24.18.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 18:25:09 -0700 (PDT)
Date: Wed, 25 Jun 2025 04:25:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <bbxjndrwl5htybxg6xme3ibkcezqbqj4pdyosmzioseaetaxrb@2jzfid7cyk7m>
References: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAwOSBTYWx0ZWRfXzdwEulWxztom
 Bq/SdXparFGaP8/IbqTpBCY5zJu9L3Dw22XiVdXBFVjlg+TZJWRrcmLVNhhGDRvJb2/S4++WcKY
 kBxtJOsaIt8kawAN0wI4VqI3ZyIJgj9kvcZ1uVXYtnGXw3ye6BTftqOoKO2JeTBFhCHQlyiw/ET
 HB3jTLiv0Y2MIAQRgyhKPmr88E88gH6RpIIGu5ugWuVPmTkQfCmCjWWII3UFma/zxoo7yHpW1Gc
 HocmqpXnA1ruNN6uhCAxHWT/PzFuQavXh6U/hbTN2K8t7gRInTnaarE16vBYFm/uFg291/YFEfL
 PZqvqUv8hOFW1KhcrsmcDV0FWKdKPjw7LHFJDnHjGQxaaZJpyu3lq5brfu/HmsIB8/SBijfep9H
 kKMFPU+EqE0cLpA+Bd6hLLV+JcxDURaNcJBTdV2GKEaFrRVyUqCc6dCrdt7ag+C5kIA0xvOF
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685b4ff8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_X9p2M_LoXEVNDOxrPUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8O7fucmT7qDMk7kH-im6zNl06F-ZUtkf
X-Proofpoint-ORIG-GUID: 8O7fucmT7qDMk7kH-im6zNl06F-ZUtkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=937 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250009

On Tue, Jun 24, 2025 at 03:29:22PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 50 ++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 8af79101a2fc..d20f01a0cd5c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2023, Linaro Ltd
> + * ​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  #include <linux/auxiliary_bus.h>
>  #include <linux/module.h>
> @@ -16,10 +17,11 @@
>  
>  #define PMIC_GLINK_MAX_PORTS		3
>  
> -#define UCSI_BUF_SIZE                   48
> +#define UCSI_BUF_V1_SIZE                48
> +#define UCSI_BUF_V2_SIZE                528

Could you please define those using other UCSI defines?

>  
>  #define MSG_TYPE_REQ_RESP               1
> -#define UCSI_BUF_SIZE                   48
> +#define UCSI_BUF_SIZE                   UCSI_BUF_V2_SIZE

I'd suggest to get rid of UCSI_BUF_SIZE and be explicit whether the code
should use v1 or v2 struct size.

>  
>  #define UC_NOTIFY_RECEIVER_UCSI         0x0
>  #define UC_UCSI_READ_BUF_REQ            0x11
> @@ -36,12 +38,24 @@ struct ucsi_read_buf_resp_msg {
>  	u32                     ret_code;
>  };
>  
> +struct ucsi_v1_read_buf_resp_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     ret_code;
> +};
> +
>  struct ucsi_write_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u8                      buf[UCSI_BUF_SIZE];
>  	u32                     reserved;
>  };
>  
> +struct ucsi_v1_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     reserved;
> +};
> +
>  struct ucsi_write_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u32                     ret_code;
> @@ -133,6 +147,7 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>  {
>  	struct ucsi_write_buf_req_msg req = {};
>  	unsigned long left;
> +	size_t len;
>  	int ret;
>  
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
> @@ -142,7 +157,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>  
>  	reinit_completion(&ucsi->write_ack);
>  
> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
> +		/* If UCSI version is unknown, use the maximum buffer size */
> +		len = sizeof(req);
> +	} else {
> +		/*
> +		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
> +		 * len accordingly
> +		 */
> +		len = sizeof(struct ucsi_v1_write_buf_req_msg);
> +	}
> +
> +	ret = pmic_glink_send(ucsi->client, &req, len);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -217,11 +243,25 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
>  	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u32 ret_code, buffer_len;
> +
> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {

Missing size checks.

> +		/* If UCSI version is unknown, use the maximum buffer size */
> +		ret_code = resp->ret_code;
> +		buffer_len = UCSI_BUF_V2_SIZE;
> +	} else {
> +		/*
> +		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
> +		 * update ret_code offset accordingly
> +		 */
> +		ret_code = ((struct ucsi_v1_read_buf_resp_msg *)data)->ret_code;
> +		buffer_len = UCSI_BUF_V1_SIZE;
> +	}
>  
> -	if (resp->ret_code)
> +	if (ret_code)
>  		return;
>  
> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
> +	memcpy(ucsi->read_buf, resp->buf, buffer_len);
>  	complete(&ucsi->read_ack);
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

