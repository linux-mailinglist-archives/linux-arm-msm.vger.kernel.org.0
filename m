Return-Path: <linux-arm-msm+bounces-82911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD95C7BAA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0F674E26C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F42072FFFBF;
	Fri, 21 Nov 2025 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCnww/aK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hihycIHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F0274B50
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757685; cv=none; b=n9fA9adQoKu4+uslz3RUYoVTj/6YhCNIL20PT7SmAWyI5iQ7qwHgMhz7B6V6oes4D7KPNF7Xzc8rEaucT3eHwaO1JyeuNpfVhKQBy0qaAbtmgmmINV6KIk4lO/IIdBTiwrZI2h1UWzA/dJVyFY3OmuUzDA0bPdq+IGu2tUbVID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757685; c=relaxed/simple;
	bh=CmmeSLsFKbFQZSkOqeVWsKGrurqZ3lvuMhrIbxz4sBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzgg7cpJQ93H1MJAuAEquyVVOfrk5DVDUC8hXpBtgEub/+UPO/6s0JB8Jk07WnJH0M1tstgp0fTTDJCQXJL9fGxWaD2KfFcXlCtCX+ua9tJStG5aTqd2W1aoxR0X0/sZS0rYUgohM28YkAOT9UPKVQDPVpQJ2A0mAApk+OgXwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCnww/aK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hihycIHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALI27XZ2746339
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ieNwCDZhu6Y4SfAYX5S3lcIt
	DLJrVAQaTfFSPrD3B1s=; b=cCnww/aK1AZe6kzrUMwy7jK4JxADM1yl5WJJQTGu
	EFd0cvohSsfexIzKE5dFGeGNY1Zfh8u5JgPLrghiYCvo72vNB2UIrk8lfoqtl0Qq
	P4idfouXm1tlBVvGZ88j0+d9/di9qA+tQnhAWmYczwMmXQlR8h8t0mvyMhOMfLma
	RKMGjxbH1RwTraUSWI5e4S2QA8wL17USpbE1yXLcp0FoGxuTvsi/1t+iQjgGN2Ch
	FgyOiXUNkhCLD9EHXzHPBwe2A75Dv83+eEyVEf83OgUiGd3m+wyV8OjDkD46ABXb
	AYJH6sSsk14/4GB2pvEgwS5xgMcgU7OVAcwBpHy+Ow8zzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh33qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:41:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so97552661cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763757682; x=1764362482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNwCDZhu6Y4SfAYX5S3lcItDLJrVAQaTfFSPrD3B1s=;
        b=hihycIHhfWiylTS/FZ6ZAeQoWmfWRGIfc2uaZ1NXowtjFCbVIc5EWyaa1cDnaVQO6J
         +egKrCTY0lQpbRDxynEWupd9jyJ2xGYuvJ/QzWM3pqW3x5AbdGjA2Bfu6CNCv9aIEnFJ
         vKma11cITWV4skc8MX/KjbyUdTfg8sfuT8vrYZj2mlegsaMFBG62gzFFHqQpGghff+S3
         vUcsV1cv3o8wjxCEDmpMfSFVT0Z0tLKJJ1cVrEAnrXzSbwDFUiCGrBH5FH/hx0g6zHvX
         8Q96C0/4vZZkKct+q3SgNmDikrAmAqd0Y9ELsYtY4IsGSLZeWP1R+kInB9tsgAiR3Iih
         P+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757682; x=1764362482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieNwCDZhu6Y4SfAYX5S3lcItDLJrVAQaTfFSPrD3B1s=;
        b=XfXQwXucwFFXm5S3UEUjX2X42kwIIswiITsjz1zcWyyk0doQsYgduacb6wRI3HqX1c
         pL8/c/6G7dgEmZ2czWEsAnysQ0f+TcewkWNgzq3KqdH8tqnfxkCeoMiRUynVqBxd6+9l
         LG5W2hY2b/5OnI1GHxYkY7RCuxpR+QC00MruPnLZgNfljXvxfl8nADy9Y8p5l/EU9bQG
         b6HVzFMocQR0ziKAKKDjsUL+klDXHz0600p2HOncoEE/ekjNgq3Td0jnlvv7E+2/k/14
         G69EIom27/Q7HlH3NLFa/OMbEs/er4xH2lZSuAW/vQSHOLSd9J/h55Af9D53JAnApXCq
         GCzA==
X-Forwarded-Encrypted: i=1; AJvYcCWAn+BrNg2h+wmt15TilKHD41QsH97TKyLMPG7fck4k3bMu+Z7rSz1ioPENLnfNwagot49h+rkaoFu4dBkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vRZd1kbRJuODeBJBLJEmEwJOEHpeOt4PHJqpezcQ7YHk3nmh
	juvcg/l1BmTyFu7bfs85l3J5cL0BMggkoVbMnl7+VR77fbkxWFm/IPHHjdhCaOS0MBEey1UcNAp
	xOBghvMPIs4zCtpepNqLejsBl107vGGc0qdcZkj6/P2MD9KAzEKKPGjC2uglFbr5wtBu7
X-Gm-Gg: ASbGncv2j4qVbohKxJuXXluAKzb7c45rKo5dIQX+Gnnl5kLZhBzw69QZi1flVgrYPcY
	zrkwJMgAh1N0/cSfKk2FjthaZ3HWPUoEuyli2BpA0Pwa3I70aIF1TSWaxYaGWtpnbCx/FMt8sn5
	+04pcWbPhLQtwEBAyg2mkq7g8qCC6QBXjiar+6QEaAiP/QPl4Dvo2/jsB3ty0INkXvN4RNAd5Ja
	SdALZZVx3iNRZ9sfQqSOvWb/S0rLPEaTzjGe4xXDPU1rsVK7bp8rhzRqvWU62xye5EhbzCQSGoz
	uIk8/YQCJkE5qQVROPxTw8NlLEu26tTGRuyIb6g8TVFTiVngisxzABHX6sqBS17ozjUr+othYqs
	MQ/uPxl2x0AigTC2N7SpiK7QUJKAW1Xmv17B0JVhiSjli+dpQ+njRxm1LHuqutdnsdkWQK9O9jj
	rLAd1xa3jkCZFryNcWUDzJHtg=
X-Received: by 2002:ac8:7d91:0:b0:4ed:5f45:42bc with SMTP id d75a77b69052e-4ee58a5777fmr53734781cf.19.1763757681680;
        Fri, 21 Nov 2025 12:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqn8R8lGjlhJb4SJYHDZhpjmLvFJGX3Q/WRA+rLLeHvGKobFdmQcgTkow66H65qDcGebN/sg==
X-Received: by 2002:ac8:7d91:0:b0:4ed:5f45:42bc with SMTP id d75a77b69052e-4ee58a5777fmr53734441cf.19.1763757681271;
        Fri, 21 Nov 2025 12:41:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b48f7asm12478111fa.9.2025.11.21.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:41:19 -0800 (PST)
Date: Fri, 21 Nov 2025 22:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
Message-ID: <sy7f445onhmuwm4fgislqki2f6tmxkfavajwvdmp55vowmeirs@ve23n4wocvtd>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1OCBTYWx0ZWRfX6SlWT+4R0GMv
 YtGwXwFzZ7JkRsKbQS9nCJYipIXq/w3SUC7yMWrqhDC64zFwxXDi8XKUVgp4+ujF1kSwxzPjL4T
 tV/wjWV2W0/UGhaphE8nH79wsZz9iBxaR5+FsXa9Cdj9ELaMbGz82cj/XZzfu+OUijirttGZmNr
 HVf5dfm5HHJ42xZNoIJGoSP6OT0sY3Wjdp7kdnEfBUZ/6R1ufvwIx4waMRL/n5pLOWH7yl4bJtN
 13kVcd8v5Y6RmfiWiegYGCXtjrqFs5W/Hw/tUBAWyvzAxYAJAtQdvfIj5B1Bob9yS8ZTtD1vWjl
 AQxmbTZloGf49vqGMQx585bk6JtFtoKKF8bjNcu+3sX4UVBT5KLEcBACxvWK42fK/ENMGKTU884
 5MIOAqO+rjKP6y9defCqYQ5p2PaKXQ==
X-Proofpoint-GUID: dHUGWWlrWeWKRS0yz2hhJJdQ6z7q_7xp
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=6920ce72 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=25jd_95BLNFA_-C9sgkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dHUGWWlrWeWKRS0yz2hhJJdQ6z7q_7xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210158

On Fri, Nov 21, 2025 at 11:26:28PM +0530, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   8 ++
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 150 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

