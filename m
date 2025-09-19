Return-Path: <linux-arm-msm+bounces-74226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB89B8AA19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1251BC74E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2D7264617;
	Fri, 19 Sep 2025 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+zIWkYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E831E8B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300335; cv=none; b=V8DcUBAwvcw1B/2sbEZrwuZymEpO24zzrWBGTxJxWb2ZUujrBoIvIlrTrp2kQ4JaDIrb1Q7ZGoAPHWTZnK/BLtZ94iXXmPQeorNxMG7DVo278847TyKHuOi+vLRZXhyVtZHaryFtiNkwcmvewMvL0csht9gVvP4TZZIK7oWubtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300335; c=relaxed/simple;
	bh=4fs98jrSck3x8PLmQUQVQOKqZfnNTah8hBpBS8SrcvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9YlnVwfn65dgo9bgd2y9FbKGfi6YP+g1h4N269ErDC5CWo2Sn8X6cPfb5dQeTibQGOw6LPYs6/JXL6JeunQ8K8/5vmb/BPJHu2NPg8Gv3Koo458TqkBfXHjNDiLIUY5ciocVfrAfux2TDgPMzq3DrAo3G398OEHlbpgBWoWPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+zIWkYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFHUSd029741
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C20ghaTYz2z07OewDUW3U9kP
	PyChf5ZskPTDdANcg0M=; b=L+zIWkYX2CHEXD1IG7LIUWQjC0kQ25fACtMvwpbi
	OZboAtLm0n3MKd/wqPAgbMCllkaBCywR/c1UNbx1+bk1upwTi5krAOiY71qoc0b2
	mivrON5KmSG3KK97wOSVX03BecCOBLMcWCTd47sVdojrmDgixGdUsvzoIh5GLaDm
	aJVclV883owgqTbbHMTb+uPs707N0k+5UoKpuhQr5EqDLQKjYj5jGRrfrQJsVsTx
	ji7qbLbGiKr67yB3KEJIZgXwx0mG+6sRoNFTnbeB0NUw4vBVXA48aV6Hb2Gz35D+
	RY8MC/gjrF7wxU3T1isgVegs5peQSApRmS6bTSj9bGegVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy133ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:45:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad72bc9dso60082751cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300332; x=1758905132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C20ghaTYz2z07OewDUW3U9kPPyChf5ZskPTDdANcg0M=;
        b=Sb++wF/u1Z/2fDZpmtVQmoyYzleVkOI8+JGvYygSd1t50B8ST+pVUV0nrsMvoRv8jy
         FaiTA+G+PD6BUzDzA5GI3PnUimZ2ZN1vA7L+CilTbwIYFkjsIdtfo+wV4x/WB8DSeTfj
         eCnnMm39h2RRvn0IsZxQVkD6bZx5628qNAV4PyeeXbAF7SKiFfa5zrrqVtagMgS9DPpj
         csAD5OC1RvZ/gY22z68PXaFSpTeYPxnZJVvCDIdfTsYQmL59a8rEydTLVM3ciubZpc9s
         PhcqdX6SjRwBUqYzWp08fKYIOqAyzaVd9VZRL+WtlyT73xbzrL9CMiV49rxumL5AD6M0
         ZOOw==
X-Forwarded-Encrypted: i=1; AJvYcCWl62FDcupedFZIySbObpJJRjFPOZaWgToBkIV3ZUah+FiVOgw9hmxwF4UQdv1n1+7T9PoOGihmmKx/1hJw@vger.kernel.org
X-Gm-Message-State: AOJu0YyXd+z6coOEIMWAHjtRBIfMYjuUNxtJPMBlOVz99J1Ya9EK+Hgu
	nABM5jtgivbT3C22AH7jyflo7L53v4oYNOkNfUU1l5ygmFj0u0N32TS8J+z3+IC+9x+gJzw+G9c
	RdFbbdJBruai07eeLqRIcUPzwjOAX+iW0ePDiAnHLbrrCFfOuUYFZklWcRNhM3CdHzVUJ
X-Gm-Gg: ASbGncuD2Yr5kS1MjA/lU9jW81kKmt+5XC9ZkNpb6j2wHq2fwKhNDmuvOpSpJKkxT/I
	i57hoO+NEGNb2Bbwm2zyiU+YNVx2nC7yG4My239bYjDmJD/teejN2KNupYY4NDmCzFBjWfVQtqV
	PWVHul7HIoggtk53C/NHMiFBS+QgxLfET5j0RMr/IpsNp/5dZS2zbtcar+5pE4HZgxrS/N/3RPi
	+h2Pie81g1/jLCil3qCIvsoStQYx5fbokfda+ILyHA0j/dOCk38ZoQlQfbCcUysIjqEPVzwJIzF
	QgLcSZscOxJJDvBEWwoJpad4Ln0BDTDMYuSW+ujmhaloYayllJUnvg32Y8cC8FULeaS9Ks0IC7x
	wrbsrXWucKhySG9qTC+xrP21zEAD2PXP2F4oovnt0oCaHiPgpUiyE
X-Received: by 2002:ad4:5de6:0:b0:78d:72e5:4309 with SMTP id 6a1803df08f44-79913f8ccc3mr48541616d6.25.1758300331919;
        Fri, 19 Sep 2025 09:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENMkKKG2cQIkLe25WJp4a+nFBl5DjpFFzclGB37kCIW8D1f1msQ+H2z+bjyqDP10qr1zJDzA==
X-Received: by 2002:ad4:5de6:0:b0:78d:72e5:4309 with SMTP id 6a1803df08f44-79913f8ccc3mr48541056d6.25.1758300331184;
        Fri, 19 Sep 2025 09:45:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a26cbcffsm14030911fa.22.2025.09.19.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:45:29 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 87bBOv6UuBiIEtz0xZO7xnu0ydYh9mH_
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd88ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_hUenYmi4SsfCOKiixMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 87bBOv6UuBiIEtz0xZO7xnu0ydYh9mH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXz3lY8dXpxTZX
 nxaYrfho7RflwUrfixxbB5xJfxXbig3yzTQVzEtNDbbO3bELtPQ3wTOkBwhoZfsHIYEhkODouAx
 FQ9iVbfMgx9AADzbM1AIF6n1iBzrY57SFA58I9qpbUoXqM3zsTyQSoE+sEb+unuhj/YOcoro2Yo
 B5POY0LKrGPtt+GpPesFBWXZ27SPNuiCyctEpSHFZUo0W2Tk97jtQlxh8kSkMhtS8ezo8E8IBFK
 Yd5bmitK/0UeHgvF6O50FPtcHti4/SoBdLdEGeonzEzmu+8xnSSTAehLZv2fYm6DsOBZQBMoMQN
 T4o8Wcm+Ydz5EAAlV3tItd9laG9r2VPFYwOr97ZhgYCE8Fz6xQ6RObev2zqS6SIQpN3/ZL8ySZe
 80RHyAGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> path on the old hardcoded list; non-legacy path uses cfg->reset_list.

Why? Start your commit messages with the description of the issue that
you are trying to solve.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

