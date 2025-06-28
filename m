Return-Path: <linux-arm-msm+bounces-62890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00843AEC3F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 03:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724ED4A210D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 01:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD181DACA1;
	Sat, 28 Jun 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2HEW8b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEA62F1FF1
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075867; cv=none; b=mrWMRKe9fJCAHKr+qBavQiDye6lI7AM0kR1uctYW3EJn0FgihIQ+phQDRT6phj8ZCfLYy8SssxoCX4Gjwvn8tV9vqCi6w21i24FvSbOQHcj+hkZuH9uNx8fbPt5FkWBAzLL4LpG7M/kZ8k4CRzUtufiOKn4Dz7sI6A+OJnCPQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075867; c=relaxed/simple;
	bh=eB2h+WWGUWxTIdXYzQWwwYrg0DgFAVeaboMVJ48OFSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmFH++LpGoQ5emDaSVIJL7/HG8MJF87DUA4WTRTsTG4lJfN4/gp8P4+hqY+a2aKn8qpdOLbH68w3NwP4q2QNZaViZpSHqFvDEFimnVAt+AfgPaC8P4AtZFTxzEg9BlFlSQT2UrJDA5CyOdG6xsFpy5bR5+7xaeo/ihpusQi4SBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2HEW8b7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DFgZ015462
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C1cLAjsBclJ0QBWDw60ZW2kU
	AMy0clXSWHYg54xP/7I=; b=a2HEW8b7NwtvWqvduqwrtvZYP2KmDBQihQJw9qF+
	t6OrJ5fyQpJpC+49AyB0QMlth9sZoUNjNPz5hDM894auBz0LGAC91rYKbzOOUM3n
	+zeqEtjULScwi6lMxT4rHy6Y6qFuSfafVD+5j4gydEvOis/VRxO3nPqQ5ExEDsLT
	heF6ksAC/Iul0c8CjaH/XEI2hidAVHG03MTKIom7Gtc9aoaeYnQG0Z7ohTABPlmM
	U3OPmV0y5lP1lsfPV1Cukb94IX6NBlhnqKrldPf5aPCqnhxkDgSPiJpUdgFKpTD3
	nDYmnqjb7TokykvNX3obqz2wS5L9Hl52tlfBvrIWojgn9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx6q9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:57:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a77e31d163so3624201cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 18:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075864; x=1751680664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1cLAjsBclJ0QBWDw60ZW2kUAMy0clXSWHYg54xP/7I=;
        b=p2McypXXc9Kb4hw+W0zrsdnfdm7v4UWcF1DnMBoxk3/x4NuhTNrswQlUQMZB3+qllT
         Z8ycDaZO5w7SPNLgeWREiDDhQwpryo7ecEgmsdO6MIqLPcqMEdanmfUkWMSW6dXldZRA
         0qCNW1Nc5pDN99KC5ZCkoZd4DpBDbrCkvvI9J/QmLon3jfIJSNSmAzhDXp1fbzXOZsvP
         GKCUN2Hno05CCS9jQRDPK5l4kejYV4gL72CdZd1LRF+WpiuSvwS2wLe/zH8NaFIslMYC
         Th7U5BuMhYCyYb/VizRGC+IpU/SVVTro2PWXp8zKUmxCf46LwnRWfH4f1QtIegdPxGWQ
         +VFw==
X-Forwarded-Encrypted: i=1; AJvYcCUY+XEtVoURUUT5t8eBXQeNyoFYLpIIh/QMBa0wSW4CgcbGQw0pcROh3KtTHE9JuZBU4fj3YpkPYgEof62E@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlOaUZUL9oGg7Ik/ACwZry2rH+DiHikczbeodNe+qV+4QRJNn
	ZFQHtlAaPkb57zeaS73IzCTlyFnGqC2AhizYQQxwz9IZ/jeXpeLm+TnUMgY/D15ZnHYHjlnTG8Y
	/LmZaPk6+v0cMHW57g4lGOFkf+W3j+IE+1pI5f9uUscYiNSfz+AfYxeA5vQfC7vr0x8P1
X-Gm-Gg: ASbGncuLj5Ax8sfjSu6jYUYGsgpOoOYkYVBXq7kpv/DAwJz2l/U/51+lW6qtj0dWA3l
	qOXfGFhZewTuUWpj9ng+zq2cfs++R410u1i7UQYRoHdJwWaJyiBVPwWpbCClkzzFWxj5iHARcFF
	TY+swN2ocVPF8DdEdUHCozQKjsTTXxnuUNlNfHGqD0NcpgUjRaifKaLgqLYbeQ9D8xRC10BFJ0R
	xsqqvU2gzY0cHoeKb/0aYdyLG3vmGiGI8fHFA+vRsr1OGlum2JnrK7dnCDq6dMusQKUcTHq+df7
	5d8FXexnHjnsMihhiOOtmJ+DlRJ8gWrlOTGkwwL3XT8WPgmaoiZihvMfsD1MPvqaiUcwlKOUACi
	WqZq8AyRG9S8PreDf49RLwJyy49Xih+GvqkI=
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241536685a.45.1751075863746;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Hltdir3SyFuBpeLJoJ4afHk65Pi5pMb3NzWsxG3FHxbeZRywpOH7wvixrcleSdr649yHIQ==
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241535185a.45.1751075863298;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f01ac0sm6638601fa.101.2025.06.27.18.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:57:41 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:57:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] interconnect: qcom: qcs615: Drop IP0 interconnects
Message-ID: <3edj53e2tlwqg265udg7gjk5lfmlwz6higfm6roq6z65qye3o3@wjbjsjq77wjh>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-GUID: xrPn424jAzIyeYSqwECDJeMIAll-ucQ5
X-Proofpoint-ORIG-GUID: xrPn424jAzIyeYSqwECDJeMIAll-ucQ5
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685f4c18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wxkdqnHnqkY9PcZr0RYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX8L9HbQMY4zr2
 S76/F9B/nHp3D9tzpcn0E6gkQKlJkbcdJgVsUblmC78lUfuU/PipjrrPO8SJ8HgC5HKYGyuZ9g5
 PeKIp/dfplGJgwrin7otFP/T5/6lfi1DR46xhHJ7mpXTUbwszv0+qwqiy6iqsAlUwCFskGY6QDb
 2Ctz/yCy0tQ+57NUSHby7A7ZCVZem26n7vDPsY5LI2qfWQuuraYMuvlWwMJ9XHTh24rFAb8NBa5
 kfB+iOVj42Sxh5DMJzbExNE3RaDeA0pxACkHKO1eoz1V2KTuBjdKK8t/5iQY2UDeRTGrjmpr3ew
 CYr4Mb8jqjncdxRYhB7qaCPZaELYDwJPXivLqEaSisK/UPT7RpjiOnEbuK90RGrTBt6VSKI7aMv
 T5RndSq2Nca3k2F4a7TiMxIFGZZuL6hgIEpsUIjwo7i75Hc+U2qPApJnFcVzGhL6pdjYx9wa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=796 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:56PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit b136d257ee0b ("interconnect: qcom:
> sc8280xp: Drop IP0 interconnects"), drop the resources that should be
> taken care of through the clk-rpmh driver.
> 
> Fixes: 77d79677b04b ("interconnect: qcom: add QCS615 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs615.c | 42 --------------------------------------
>  1 file changed, 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

