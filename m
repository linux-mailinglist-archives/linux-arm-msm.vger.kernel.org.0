Return-Path: <linux-arm-msm+bounces-88807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548BD19BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EFE33090B68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEE32D7DDD;
	Tue, 13 Jan 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dirMW21P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUJvVUad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF02D6E78
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316512; cv=none; b=O0PMquepL9bae0J7v94aaUyKd/GrHiaQnLiBRNiamjA+hslskRm7SB866GSFt/wkOtp7FU3bpCpi0VZJAnVranJYU4ZFsWzm/orhh7ZYllQFcSEAdJmCFUlwGU4V6pNo4gi4HnCZFrD7J6URjY3i46jpuqa/bj/4EX/rNItBffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316512; c=relaxed/simple;
	bh=qC0U/JrlSmEf1xoX/OXGO6rS2UwBteztm2jkO2TNsq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQojSF8pQ/Idax7VshY5yalzxxOfigX+Hb4fmLhBFivIAqVtkZpE4yvxXHMpLZ72gTO/OlyYEio7MQvRPwz1j0ooxOQvMlCFYXI7w922RJuiTMyecsk1qeAkRcnotD2sPDyb8948TFtOPCOl2IIYcnc4MWeEsf5u5ZCEhgc+wBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dirMW21P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUJvVUad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsZaP2071308
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nGMqMIXQLPssYD0xT2LvyZhU
	kqwpNFcafC9Dm+08hn0=; b=dirMW21P7XMO/W744AxQulVUbffP24IeWMXwRB+p
	39ckmDLpWlmzkyQlugNmTNkTBx+pL1nE0M2m3lNyEp4P0x0BXnWDlYDa1GSLxGZr
	ZzYggkaUsJhklKfzpqDuanCywptocLmXAxTPSius9FowXwX0ZpFHwUyMK+s7JBWi
	JL4jVe4NHm7zpy8T1kBjSOFjgEmL9wMSorRVLYm0ONVDDgNyVSMt+Mdb7h6PbJbh
	OblAtecG+Nc/9GpFs7C+BC0vuA1N9L1xtsJLX6TN/J4EtTqaI88HZkq69aA9L7CD
	HSuwCIqOZk81loGnWvfA7ExSh/+RxEV8Wsp5UsvbNPydxQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm877w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:01:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5636892d498so10077607e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316509; x=1768921309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nGMqMIXQLPssYD0xT2LvyZhUkqwpNFcafC9Dm+08hn0=;
        b=DUJvVUadlFrhKtGRRpoWhmTQOqSLBCvSch0kwcMy/UilDjOAIA3eWHR20uzN/lpuW0
         VbJurasD8dLB6CiuAun9m/FPnaiVxuPf0aq8luroPmqkUWISGilnNO4iR1uiFoPtzBad
         BFKgYpxn5HAhrila7WGGHdfmBdn2qP5LX9XuKkrX+ADvnltQL15aLlW6B3cp5TXAardl
         J2sQyy7Ygwte7SV6FyLc6Zh63zr5U4Zp59gBlsZ/Ct7e8luO4C1SHbi5QI8fjtGsIRs5
         MYtWZ8eL22Nk0MqK/QZa4GqyMorftRZbxd0tg5Y0srYqbcyceIrHjculvZg0ypnCl0jx
         K9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316509; x=1768921309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGMqMIXQLPssYD0xT2LvyZhUkqwpNFcafC9Dm+08hn0=;
        b=XiP7XXNfTwTRrks3iGJ+ux2/lrf6fGe3Zk/jDpQb9jpaprs1K+jTjLBfuNwVGzCPSG
         NwbAFyYgF5bKpyDejLbQXiXYWL2/gacuKP2ZBtnSE1qnMv/kN9WNOVAxmWWYYIfOvzi/
         0iAkWd+wNRCcnxSy/Lj+/NkMKNslL0KmuBs8XVDR+ATsw283QG3AwuwB+5KxN7x36bsx
         xXIYmutFr0Arw5eDGB+oPkXDx1L19Lknv699Ln/XwQKzNrevtOYyUQ3FUBwsPSQ8TuHK
         DPQLsj+GkME1GKzybLXozH32MmuVmaKPkC5z3S00Kdm7QLf6dyJcnzHAiHZ+ToXjM5vp
         JFJA==
X-Forwarded-Encrypted: i=1; AJvYcCVPE6CCjm4iuLiO3gZFWMkQKS4XYqNt7q0Udly/Ph/gPbyNiaB6ys4zrNG+quH5aF3AEbR2dWZGDs/Q53hY@vger.kernel.org
X-Gm-Message-State: AOJu0YwIe7/3oJdo/JV8x7dfLpsbFHttZS5X24uf0f715gSuSJJBZ1hW
	cJWXI8qALkofhMQTYNPfP1g0yfhI5E4qSgMu0hK5EiZwF10kjCv+KIgCerByyE8qkvVQe3sESRP
	OFcTM8uDkqGlUFyKyK5a11TBGxUOMlLDL6o7rTxaw6dnHJ8N3sJZVifuezrVbcKehZO+3
X-Gm-Gg: AY/fxX6AeXgiQrHQb94U+SKqCKAihjXn3a5NxPl5KI2mt8nYxBeQjKVhOjyXTUrrrKP
	7QCxEqo9QvhrInGozfcCOAMq59XgAIywL+MMi2XKjj35bZ3LqrbctCgWlZTRJ6LqZEidT2u+oQc
	T13l0nRU1xZRhP2D36njvldzBiA9WQfr8sKA9L8F6GmmfeOYRRY1dF/i2CHa34X6m09SViqE2MW
	IycaWy3egSjRlDCHYFSqKUEmfzbmnqHkoQgyK2leErDzyOfp6zfFS4KLY8enGQRdNKRVAwN+IWG
	o3MI2uzEXgfcQamO1ZgNlcq8ax81TqvefcHPcEEZNiZU3FaL2GOV6G7Y5HP8xPexZWpTANimeVj
	iUAFAXf8f3fo+uEe2/5+f4T9z
X-Received: by 2002:a05:6122:d13:b0:55f:c2cc:50ac with SMTP id 71dfb90a1353d-56347ff99b6mr7399648e0c.14.1768316503918;
        Tue, 13 Jan 2026 07:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA7N0c2TLfiXB2RHkTFtfhSWvF6d70Dgu5+htKgbpWhLK8Fo5tWvKLAmc+ZjQuS8PDYqM+3A==
X-Received: by 2002:a05:6122:d13:b0:55f:c2cc:50ac with SMTP id 71dfb90a1353d-56347ff99b6mr7398772e0c.14.1768316496996;
        Tue, 13 Jan 2026 07:01:36 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87023a8a33sm854312066b.18.2026.01.13.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:01:36 -0800 (PST)
Date: Tue, 13 Jan 2026 17:01:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
Message-ID: <lm4jz2xfhj3gjddkb7gsar6gbd4v4sskaotkg2iehtyllsdhzh@7zmtp7jpyglt>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
X-Proofpoint-GUID: wKDtMsir5Zt4z2NK3PULEqpPW6Nfs7sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfX1BYDHPnM3/Q3
 iG11Px817+NdPEcRJxvnpc71zKS/jUPq7PHuJFkN1I3Cyw2Habb85MIi4aQVmgXqDxXdjmwqg+0
 umFGJBhakX8392F3z0d7ZiIIaup4fH6VPkkU/sBku7LX9HsskmwLJgS95/mO9YK0dUO8SL00dEK
 EtaYcZGpKx6Frg/uJJIp8qo3mFh5DPSoKRC8eyazLjYkASG/NmDvvkNOCNYo5V7vzcUqpjGh6U4
 wiYBciHbAXplqoRI1gxH4es5GS3w3pSwgwmdW+zs+9oe3VH8zdFIxtOLczZTyx4roSjbEAJDscw
 WxBZroWlzbnI8iTrB/sQE369JWHPSXp76SYJGFWQ08Y7Mhyer3MkgiPwqE/0kWijTg/3g/1Go7T
 390abE8aWXmDV5VdBg2LAh226bKbhTtdq7cSPHWH1FLgg+sejz7XBFDetgqu41uICaTQUQY2I2L
 T76k0nsAwfVBNhJ8HfQ==
X-Proofpoint-ORIG-GUID: wKDtMsir5Zt4z2NK3PULEqpPW6Nfs7sy
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69665e5d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130126

On 26-01-12 04:12:23, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

