Return-Path: <linux-arm-msm+bounces-63032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33813AED1C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 01:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3C23B23AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 23:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CDC237707;
	Sun, 29 Jun 2025 23:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCgiDsJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118901FDE14
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751239835; cv=none; b=cRdVl2D/psDdYXegoMX3t3xSbWMmBmUAahyKgtdQlsAeAFT4OxVP2wAYVD8JrNyNHRRM5OuM4/9uofhk4sK1BZdHJN4d57ew0gZKTi8LlArU2ix7Dufuudqbzza5FdumHqrq2vcIz/BnYqCwN8eYUboZvNlkRyQ35Iq6bweiJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751239835; c=relaxed/simple;
	bh=3AFvXCR+bLX+Z8GgWNplffmabN7kiO9ZobmutwiK+bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEKdJpfGhoeuresDe1mr1vBdLZAzswUYXp3/priBl63sa4r9mS93alPsIb5019tVWL2o+t7/4/OjYbjGOswLEKY/+zP5edAM/3dZpaqetQpqDsgv6noFwHhk22h91f7Yjf8EeW3uLHzZ9tFKs5Cyl0KpYkJNjVwxDo9mYWzocCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCgiDsJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNUL13014993
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S2DTLYpxIRhT/nA6PB8/tp+3
	viSuwHeW5OhO23oo2lE=; b=eCgiDsJTEoNxBfqEo08mj8Z3xu+cN5h7tBDr2b7N
	GAfLLdTEIrwoWEOKSVxRyKmaPPg6Bg5wYMdLdMBnLqwlCNdUylL4WXTclVvRASzT
	HBT2ej0w30v3OjB7K5ETY4cdib2qw25vC4doGeC27MTV6rVRS5EZX7VDyM1XySHY
	Y1TDFEtG3Eob/cTpW9A5XE77tVf2RlxZQuW88rT7GWS+ewc6JUltl2quo4vDayea
	HM5bd/VegdC64DyKAtuAVZ2h9HnluhKHULQ2e1GxfcgxAlAHIKS9xvwcQ4koxuE1
	q7bFkZwk0u/0V0peYimRBLpjOH9nC/82j640OWh6Zhxc/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjryv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so645216785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 16:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751239831; x=1751844631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2DTLYpxIRhT/nA6PB8/tp+3viSuwHeW5OhO23oo2lE=;
        b=r/BmjhhcRZ21gpeF9WHKEVWowSlILEozKVSE7pwlFTVvz78RaF+CzZV+jdLfq8qju6
         eStp+dty3vZVp/j6jVh+4CUfOIVKqtG4tJqASh1Z5LTQZWA/kfDW+eJr1OMuBIELolMR
         Qq/KiaMv7ysuyeC10RN6Ym2vjH3H1AHEoIkbUaNekB0Rz7y+CDG7LRQkKYUmYxZ2fqP5
         eT2GllsB+x96P5t/m8tOyEA0bcWA35WWSfSv3i9rqb+AN+MfbTZypwPQShCKcWH70oa9
         3LbN1GnCvnOFL0VBPFSWKWvKdwmPHe/l1WdYNoq9kqWhk6R3zO7cd43xyIs4ss2UrXfP
         +xqg==
X-Forwarded-Encrypted: i=1; AJvYcCWBjG6nJhTV4KJrkBJY61Y0ECbEpTz7me+rQJbxmbMWZJc9ytN1Q2oQjDeKjdrObzrxRsK65pxM1bYsI/8b@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSOB5AIBSWl3w5pf2K1K2/JlNLoekUbjETlhivA01SrkAEjyE
	L+J1fD8PKgsbrLnP7SjcwrLgeiNp68eqJtHD5/j3BfKbhJ7a6ORWNgQR1y9y5f0EU0An+kAt6cx
	ywh+IXbqYq4eZV7KRoNChiuIMFdAW3+A9crbuz9KVB0M8u6co8fszXr6jbZlkaeDnNCHR
X-Gm-Gg: ASbGnctH/fgloHIu39CSgRuFI7VzWbnD3wLb+EeivO1xP8q8C4+p3djUoXsY8/7OaQl
	Lh7Tvj5WD6o7DVD/27OnERvgaUAaEMCdfeqn6jTJ52CDU8md/Q1sf06WkJmGiP6m8BAkU/H534I
	nhNI5weUMSYYjRvjT0KfyF9aVMLvbKjQTiTxcwv4wZWq3cjU3/pNUs7QftxpeU3tqXNVAeVLlJ7
	XmfU77wPy0hqwGeJSyswaqUp0D91tXBhmomeblYSIy9KwmFyRsAFL+wttgnA93ohwrKuP6S88IM
	KFGy97tdXzK/wTUTs9VjlpTNZcyPCSCjJLagWvi01eG2Y6iPbBmlbUqaAXdIRn8WSqKnvEoXGos
	8wwWlc4uIQA1Y2XgWVY7uwLCZbiNIHf0VRfo=
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744006585a.48.1751239830841;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsLLpB2ln2NTNuxE8oAZN1AOX2vanByzGZqG9Al2zbL1LihsHxYQPgaiL9CfBNyLjW9EH3XA==
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744003285a.48.1751239830424;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2407b4sm1245026e87.23.2025.06.29.16.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:30:29 -0700 (PDT)
Date: Mon, 30 Jun 2025 02:30:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add SM7635 power domains
Message-ID: <strdf7m7tjnktyzwcm3iq4bkhabzibxopeal77cnetga2yp5wy@amwkv63uoogv>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
 <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
X-Proofpoint-GUID: PB6aFTArdmGickEK7u4-h1oiYLiH_KfB
X-Proofpoint-ORIG-GUID: PB6aFTArdmGickEK7u4-h1oiYLiH_KfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE5OSBTYWx0ZWRfX0/gk3s9g2IhI
 4y/3inUBlTz6ki3rGXvri49lJx3jpOLvuEHn/SZsg3FNOJ11GaI5/hyL0cf8AkR+BJJbclDYSmB
 PT43q3/UY86ahUJAwQ05uqvzeLrAscyYx81xMlrMkqiXuB1mcGINLx+psM1Ovh493z6YLiqxapU
 UbaofsdQrsMHjxRdnOquPToiekOvbp5Mc1bMm92K3tcCapTbPSgOx+JmAA+es+CH+9HSSw0Mjpj
 +D7RnrzvadngOkcxldZGgjrTtYIVkhV012w3WwbB2DNennhYWNzq8rILKbP7NPt/ckIeBQAfuNg
 VJF3jP2AQSPGzH4OsYnmTEuU6YEqwPQPnl+s9mlPsYQT8rzgIAaKo4E0RbH7IAXiaMp1SB3p0b4
 KtDRUREu+Ab22UXhnX2FiPccLSzDkodG2Fux7KR7ELPtnh+Zy/Y0b8RLAnxw2Opsh+FssCyS
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6861cc98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3owI59sVmJdHpXqbcb4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=933 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290199

On Wed, Jun 25, 2025 at 11:13:24AM +0200, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm SM7635 platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
If there are no renamings involved:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

