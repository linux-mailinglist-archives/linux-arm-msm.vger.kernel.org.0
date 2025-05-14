Return-Path: <linux-arm-msm+bounces-58010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA8AB77F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE6E189305C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43050296D07;
	Wed, 14 May 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi6YVY2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61F290DA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747258142; cv=none; b=JbRko/yw15vYKAINNV4YNE+4atRP6BWCOvi3UocX3ZtvTQzcL53e7VRLKlPd2Ov/ipQ/0BNvg9SSElVRYpW3lnwjA56xXfEVo2mbK+uYo05Lqez1w5P/OEgxgg4CdrQPmEqLMDBT7CrR4Y1Y4hZ35lbfRZsYwVyTCmcGOUg2EPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747258142; c=relaxed/simple;
	bh=gTxoIidJRIRRVDXdvOL1GC+8KB4tp/V3gMpMeWY69LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCBU1nnwzLGZ1Rf7Qp1pMtxbtfy33SPFQO/XjLLGQo4fk2kvlRGAIuL1bSewzC9o24puLC8zg7aaiElsws1mqJVtZ1viBXoLe1uJNK26yKC+j+Sr8QLBPwA64OPgmXqOIla9fMlBXgxy6hNz2t1dad7lXYM67qgmJHjW1UWA4kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wi6YVY2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWJcF012652
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RsYghxjwwfqPkfH16SB+W2N9
	Bybu234eeCOwqX95rqg=; b=Wi6YVY2w4bveQCVSvdE1Ny/xwhIXNZkoOJVRNzSN
	FYipLExrZ5u8Ufvl9ZCsPEMR7sp6DMAH++wjMFKsHHUgDyKs0HhjEZ1+CWshP0rt
	zMgTYGOccJ8Xy4VkNDnzUQB4HVzyGz8l5pI0gph98zZf9onW+J98UXIRZi3MHRl4
	qnboshFlotKP9wXE3Vtz/bJyEiq0KGugXXO+mcxMTIFE6OwK18ZrI34ZCxgPi6Up
	BctPYyGElvEhVv2U8dXDWMiZR8m/6YwK5KKuwuMieyrGBqdFGIv0tDVJFljiX1pa
	coOQtP4oUzH0dwmha7dKT5P3/TJSDTiI1oY3nrQ1ygEJFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym6j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:28:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767816a48cso6233331cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258138; x=1747862938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsYghxjwwfqPkfH16SB+W2N9Bybu234eeCOwqX95rqg=;
        b=qyVlYAgK0LPdBMcWkCRreJO1MNWMdzovDEjZT0vpueU6DnQLR+zlqTfHTPG490kTaB
         AS66FIMLW0S3OwX60zUDTyyG0y2ZBQDy0fHxSuEpAXFLYyNl1XxE16qKSGGepqaRf6N0
         KupLeLokA7z4ZB3n0B60FQcICEL2fwI3d5t33mltB9I73920+JxS6daGZWNRdfNFSiy/
         7Z+5zroese04xqrhpfIM+mN78HItogOeyGId7AXlRrkmFMyndpQx/c4BBC7dXsxThptD
         t9md12lLbnWWvnbQ8P8WOfEGxk1yS49YD2AXtWPibNgXlbeBFETPYRfn4dRCIcG9bbOU
         o/FA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvjZSdFqgbVWC1XZVnmWtyNvaFW89PBEwgCPkARgZVmJYDtxnmhTxaf7/I6+x91hW8hrpC0nJ2G+x8op3@vger.kernel.org
X-Gm-Message-State: AOJu0YxjS13koieGhJmy32CarGOEEShi5hlGlPgdDVGVUVV4I0dpfIoF
	Uwd36cTlFDka8e/LUDuv9Nw00+Kzt1TGuH3Gtdc3B1vifAhzwxFAnJw6POCXVE2fNturH2vO11t
	qs/6X5bFZCX5y1K7nF3duaZaxpeyv155/EhXtpRjZ6QOZC8R2S4tMgl9OGtW8HKX8
X-Gm-Gg: ASbGncuu0fJIGIHSwuSw3IZxcvU+di/D77QEA18Q+WSbqmb3pLJVmsb0iHgb305A0SV
	+UFme9jnl2Q3tKi7dxMZBs6Yy3J57rUPIYkUg2vrs1sSvC9rCacRpD4CrhLLlKplHLHx1LM8lku
	Sarkn8xHgy5LO/TriO5XDz1QNzsTAZfa95E1PxscEoBjXWTIByJTE8Hh6RDWFo+lSQTAOZx8ACX
	Falzel1hwYe0xzzm0uy3CDtgwIraVkKsc35r4FzEGbflYAqRrzbg9p1ISCfvd97+o/RlOJ3QEht
	xh7BdH59ET4azggr3E6a3BUwJI8B82Aa4D5SqFUGfFQEgGqnrPYZbrzUc/IfC30utdc5U62rVZg
	=
X-Received: by 2002:ac8:5782:0:b0:494:59b0:7347 with SMTP id d75a77b69052e-494a338f8cdmr4118231cf.37.1747258138490;
        Wed, 14 May 2025 14:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlKluSGkmg0f5Bl+QdFi/VJlor5IWupRH/g1xYafaDWacbs+pcDc5DlUBZtWHHVfOpPHCLkQ==
X-Received: by 2002:ac8:5782:0:b0:494:59b0:7347 with SMTP id d75a77b69052e-494a338f8cdmr4117841cf.37.1747258138020;
        Wed, 14 May 2025 14:28:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cee9sm2378489e87.75.2025.05.14.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:28:56 -0700 (PDT)
Date: Thu, 15 May 2025 00:28:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <xlul47xvzvaexbs7w3erpfel754p3nyvnkaqdwjktbafugee5h@ppgxmt4cgnv6>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <oogbxu2uphyhknr4fjbc4ato6q7r2iermvxbqezyqd2xwamqtr@cddhw4kh6zzx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oogbxu2uphyhknr4fjbc4ato6q7r2iermvxbqezyqd2xwamqtr@cddhw4kh6zzx>
X-Proofpoint-GUID: X7icUAvoZbRuyEsAlXztiYoolO64ipB3
X-Proofpoint-ORIG-GUID: X7icUAvoZbRuyEsAlXztiYoolO64ipB3
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68250b1b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=3T6xumy5ldElVCuf34YA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OSBTYWx0ZWRfXx2ZIhgP6oNju
 JVNZ/y9Y1ik36q9SVoPrMxuaNI38SB7uiU6lvKbYBne7JJWYc9Ol8f3SPVgtB/7PE3MuQEBN45p
 TQplClrWvRmc9AtOZCb1+VOOW2AIosubhT+UF1o+RRUglQlrtljlEvxw4OnQ+LF1hauEfXZ8LGx
 eyrO9SuXH7MjH2KPZ5Yc7w9pi4dAH9OnTesoJJ3dRV45b8pLqHyHBASiRZVgAikGMW2QOn6teD0
 z6/7CcMkMfJ1j8leT+/w1SMms/j8n2+uLo9vT9GlYu5O7VbYyGonsUSKnCr2uAmGneVNKnuwCML
 v4g3uqWF8plHmWBaGemTtS/miMzgvBiczgaj8asmCbHh/xFbP1lkGddNKZKfe4AoHtAsmGDea5o
 POtdO0n5PkHH8zxHn7BN3rdFDET0umoWYElGeerkam5D8SaPZ2e0tv941RdOTY0J0IJaQPHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140199

On Thu, May 15, 2025 at 12:15:30AM +0300, Dmitry Baryshkov wrote:
> On Thu, May 15, 2025 at 12:38:47AM +0530, Jagadeesh Kona wrote:
> > SC8280XP camcc only requires the MMCX power domain, unlike
> > SM8450 camcc which will now support both MMCX and MXC power
> > domains. Hence move SC8280XP camcc bindings from SM8450 to
> > SA8775P camcc.
> 
> It requires MX for PLLs. I know that we were not modelling that
> relationship beforehand, but maybe we should start doing that?

On the other hand, it's irrelevant. If we add MX, we can as well add
MXA. So this seems to be correct move anyway.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> > SA8775P camcc doesn't support required-opps property currently
> > but SC8280XP camcc need that property,  so add required-opps
> > based on SC8280XP camcc conditional check in SA8775P camcc
> > bindings.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > ---
> >  .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml     | 15 +++++++++++++++
> >  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      |  2 --
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

