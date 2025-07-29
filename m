Return-Path: <linux-arm-msm+bounces-66987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F5B14C7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA0F1661F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C3A28A70A;
	Tue, 29 Jul 2025 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loqFY7Bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846522D9E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786144; cv=none; b=quloL9UR/YMN3KNGcLxDx+oQ5eH5Wd+LGvMZYqHs3JCHYwIRytj+EuskKKE2PsFbHc2KSi4yhpu/U00noLx7v8q0ZrHFPyiihsYWQKQ8wZsSzbcMWojpnDvltb/438Ph1Ewm4mGWmI7jwu7i9e/REmf/OQCpA/qn9AZo6FGhRR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786144; c=relaxed/simple;
	bh=C34G1P0eEB9SxiCuqdA8stqbZ3Q36ewqbLLMaPiYE/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7ZSElLdXeUbjR6TJBfjpbKO/+niOZ7AVDzXZaRSMhkqZlOG537AEs7+W+d9DVVxGgbVcc3lumNsWHfKY8wXi3U3KkbUYvzfDrcdaCfo0abv8KPwwUxXTWzzeeDfWsmBOFxTjmwSBZnh0hpEWJ1P3xRfq7zB6NU/4N4eSirerZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loqFY7Bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8OVSO018828
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1gZCla+PC7KgPMRAN+a1woAP
	P0liPJQbm25JcENNdXs=; b=loqFY7BmrCJYeVDVc6xMnBSuo/ELUNMMfhK5vphh
	7F/FT3iEYz5Tu82Nt/dvO3epT7d423WV3PBOWNkSBDJmqpgtx7iH1GgWnxZ4NGju
	H2X/jR7u76EWIYs1nnuF2MRzDOHIoXEnJjVzwmS1jIH/02UZT3VM+WP0c/+rvfjt
	IZ4bnKnUNt8NCeV6JaWpbXc1UMBrHLG0eNGRjhajDe051v07nEnuyfsjjRHKF22w
	POg5/vmaQJTbiwsQVc+AgTYzZYbErc7Q1Z+ccNstICCvWC25uVHUtApNYPDYxxjN
	8CYjtOqnsRSicepIAWoWsvCM98RgqsNYfE0PjmDX610kSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85yv2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:49:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7075a0b5580so10354426d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786140; x=1754390940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gZCla+PC7KgPMRAN+a1woAPP0liPJQbm25JcENNdXs=;
        b=TIwmHP6xfGpmMiqwAg6DK/bBlvhkxnNw60hgKNkyRdMzfxgxde7ZjVI/botXdKnbca
         Fy3aLrf+mStAW2QMUng0clt1xTHFErDXjsyNzEPricjIrSx0WSeNzsLEHmrs23FA7DFu
         So/oWsvDOOFsevfHKpFepoxeOc8+5rLQsp78CDkf5moBNHMIBLR8mh7+ODWHIbpuzkCo
         ZRvpg6T8Y9Uhr5xy/S8cYtqs3dQXYYhaIZKU0EBHR2KGUpX0viLxlaQtu0Z3rK2pVrwx
         McjwlsR5QbrFXDhM9djil/pODsar4TZkNNQUEdKpb8Oassia/Mn59qmg6UMWoIH5DfDc
         gQOg==
X-Forwarded-Encrypted: i=1; AJvYcCUI6uSm+W+xWAiiZcIz1k6AU3/+SEix1uvukIT0SWbN9i84rQENhLkj0KRHt3bjX5qFvpi9TDEyWzcP4trg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8zrzzi2rbM2cWQXqdQ+kc9Q0ATv6xXTqUFHKusQl6WwZIbrE
	GC02NsDWjwvCwJzLUKVY7Bj+pgxLRPtwcxsjLStQ2dzpT9kFr85Cj47N17g/Vag6ewqwdqHQwPA
	UA9kX4BIDrNEGeNBxI0Wa/Ff/3TtXS+OCoOeYyGMcQoagFHgE0utvMo6bA+WdZu1JSTKn
X-Gm-Gg: ASbGnctM2W1/W8UqTSs/oKObomYOFg/FtJegnJcNnI7nJ9ocAfoCR2iIQjCIfv6drmN
	902HvvzRmbWcJ7IgKYJsxvDvEGtmrnohqc8v6V1ogP2ZYFzC6sqh3eAOgvpYE3sdk0J1K890d2n
	7YDsyyUPMYjugfW7p5Fs++gzts08TDdhpuh2Zh5AQ/dUUY5xYNU9pSlRhRdLphw6qESnyLk/Bon
	RoRRsbRxs91ShTkrvqlYhcMKbPyqBMlS3crt5JDC07UXC0uYDdYK6zQA7snsc7A+uETd//ZqAvl
	37SlBTME9Irw2wL+Wo/FR7Gm0Nyh30EyLmrqbAYUo5Yy55SsnJ13xXBxsMLdn3T+sTQmOFYFiJh
	MJS6XJNBEkI4N4uFOfzNOFVREtdxyxfNcMBDvAEpFJpkXvbxomsmU
X-Received: by 2002:a05:6214:5294:b0:707:611a:c7af with SMTP id 6a1803df08f44-707611ad0a1mr3722266d6.6.1753786140464;
        Tue, 29 Jul 2025 03:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOF6nNOAgWT75o0XQd1gv4X7CrFSmPeC7FXcrYQvNIQQ+mEZ3Xm0poc9B4mIvJJW3s49BzIg==
X-Received: by 2002:a05:6214:5294:b0:707:611a:c7af with SMTP id 6a1803df08f44-707611ad0a1mr3721946d6.6.1753786140046;
        Tue, 29 Jul 2025 03:49:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6336381csm1639826e87.96.2025.07.29.03.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:48:59 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:48:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Glymur rpmh
 clocks
Message-ID: <dph5azc7mrdmsrau6jb7alkhntkziwfhz62r6fwsiaq7ra44ta@qokbet7yue6l>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NCBTYWx0ZWRfX6deqFlA+rPdo
 IGvZQ+gfOiTwNlgXy+IqTOG09Pa/Ou7PgHU4CJNbNh4+5DQdXfzxF4i8Jnn/3unK4c3Nt3Qzyen
 rqzg2loW5lUVUDW4LW5FhWhvRtcFj8sgXtTD/gWWTUya1PJjfmTVVm596wSrM20gKD4tu65Bd8+
 7QpIwvpUcxWmfH9qIN9mlfuZqEIvAaNmRkPltBltlYXNVUApRNEqubs2RvPdY5m3unbY7i7eZuB
 hxiQ+gashjsRGnMu2RkyXXaKva7dODrpTMafn+zx0lj82wy0E5V/UvTRQ1hSpX9IzzAxahgJysS
 uXrU/X9LmSXDZ6D4D4vOm7JEkZrO35/aBvcc4bUyJEstpsRxsCD+p3LA9m8ObmHfSiAeWJPGe14
 RaOM10MfgObRxxyoxyfcTc42WXN+Y7Z+Vp2Og6h8KdDj9yaMPKWULUXDHG8vcUryDuyTCOSU
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6888a71d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EB8bpfT8cBTzwKD-FZUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vdwiYdo8mWa_JF4N7f5UTgsqcOC0NreT
X-Proofpoint-GUID: vdwiYdo8mWa_JF4N7f5UTgsqcOC0NreT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=702 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290084

On Tue, Jul 29, 2025 at 11:12:38AM +0530, Taniya Das wrote:
> Add RPMH clock support for the Glymur SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

