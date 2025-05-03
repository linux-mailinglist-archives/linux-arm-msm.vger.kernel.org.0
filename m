Return-Path: <linux-arm-msm+bounces-56607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A1AA7E78
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 06:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DFE85A4C40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 04:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D01191499;
	Sat,  3 May 2025 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7qD6pBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429C18EFD1
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746247324; cv=none; b=um2gtDOsIEqFc4MwqwSvz/Pa1XMTeUypiKi51C1CTGw3L+8Dv2mej1QkQXQ1KA3QeDk8Tv5z14QoDH6NyrW+ViI5YivNFeUd8+j6fDLqtY+qlzWp+GHazvGcjGC8yDs1omtHW6slo8zEUnhK4ag/rpFlIa14gMk4rsovweDGG4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746247324; c=relaxed/simple;
	bh=hTnfyiZ2cUPzYM3nK1hIvjQ7hVwgJqsGscfrKpVDqGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPZGRbNavDEaLclNDD0yqkk7xISxt4oMxKf5SxEWs+OSPyCQv7HGBkt9bAPTQzMrhCYC8ceMxyMCoB2y/6QDjH1iy1vdvwcEiVwLaOJ06w1R6IGvpBWAjGiRctbF9hdhEgMHH8k53uW9N+Nnsb9xElI/o0KiT4iaV0Xtoaw0ZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7qD6pBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433cQEJ008480
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 04:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQMLPON870FXgx0xo2DcGcx2
	oTDkSI85oPnoNhn08Ag=; b=I7qD6pBceWUXkppQQ7aYBdquC21FyzdWf+dtBQT/
	kw6+OPiJGHZnPLuP7wHfXC37gboS70UNuQTYQWQj1KJO2fbxxJDPFpYcNhLzl78U
	4fcUof4mhzL4Z/3uKlUOzT2jqCe2q+kGoNx/BL+MMG+jRF2pYgDR1anchzT8Mk6D
	64jYKRvA4aBEWOzGwHzzXCcsutG7KXw0wKacsAIXlcSWk7JgvOLHesG05kzjPC77
	6zLnxozOhIGGLgzGLkB/rTshcXjtwgIX3B9xvg0zSqw47Joa2KNRcpdjl5T8Kac4
	aJ1biqQIT13E4o4Pd33Jju1PKur/3BWBU0pp4ciqAR6xDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rr5cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 04:42:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a44cec4cso47893701cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 21:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746247321; x=1746852121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQMLPON870FXgx0xo2DcGcx2oTDkSI85oPnoNhn08Ag=;
        b=soIcSp1x70vEajPWP8i6zBgqoo1UIg7ZaLkeAhs8m1iC0zglNZPKlSiDa2VOOX1pIb
         8GsbunV7n+vmu2ZHBsqP1ggbBcj0PN2z4n65HuCez65mmnWuYMtNmh7hy6nmf+5HU0Sy
         +vgaHNnZtptohM5bZCf6LRxupOHMI7h8cVxZKAZjc+tFFcrOaQiAN+bLL4Mls377XeMh
         Z9H/fDHzuoNML+8OIvHI6ATfwOVVWb1utWYezOqlMvh/G6AXNOlMLOVvdCPCGNBIOob+
         SdC7i92fS9S2nuJQKZxGaMSu1ztZoEfmbH1pp0lfljpv8UEJpAkkior3mzrDay52wf7v
         8XNw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/3uUITtUAmiUFPat3/Zp6+Wmsr3XtZrwOpjeItP4pfjRjxQE0IfM74zbXTcXQ6hnzzawB1XA/2D/zOw8@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYtZzLews5/S6T03KmOJEEXM7/c8ue8Ae1xo4fgPktgdVKBvm
	Y8DBqGMk9BFmEIsmw03MdG9Vx3IRpd021z9VD/PuUd9/sKMR4kG5l6xHDzlI8rwXtjksHGbSlXz
	z6N0KRhR/NWbsVSaSu6XjRVaiB4TDzdjxWfb30N5VEHNSPmnfvUwRT+QTpXNVITSc
X-Gm-Gg: ASbGncuFJWl8o8FuBDS8VuX0TqJ4Xkk8L7saWIv7EUZfJTl/j/5Nsu9p4+JOEPRn0FF
	PPO5i3EsJ13Z0xBftmPxMYzQKuiAXDHxoS2gDpb/xRZkLNCoxkNEqLknNs+wgcFJ1TS4tkivqKK
	ngrFnIhMjgz1/KZKInCAmJU4J8drVW056xU6KarsIPYA9G8ElQmYmbt20e9WgVpvSp6Zvcghu6L
	+r+u/XYms9EJ+Dza4YQYji/TM02jQ0uyz3oOu5oWwe//TscHRXaEZAkMZuepuwR9oqXGBpWi4Ds
	FQz/1IDn6iz771KCHDkL9jLpaklpnPDWpI6tKBKFF20TWofVQiap4tF9AgPLUA6FlXUzmcbeeYw
	=
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27117091cf.41.1746247321104;
        Fri, 02 May 2025 21:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8EhiCjDNNO/uwSIfsGfYL22hzcntZSkFEpC4Jvq708YzrvTHfCEi0esTQo4dgUDZpM7GpBA==
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27116851cf.41.1746247320782;
        Fri, 02 May 2025 21:42:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e625sm5826381fa.114.2025.05.02.21.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 21:41:59 -0700 (PDT)
Date: Sat, 3 May 2025 07:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <sz2qriqarxlfjr2pa6fpjfmeugagbztk42siuvtlgp45vjrokh@e3jdwa6ocxp5>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U7zLLSz_JKDlg8HX1WySieqJmGMyEQQ2
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68159e9a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yefebYspku7_6as8HWsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: U7zLLSz_JKDlg8HX1WySieqJmGMyEQQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAzNiBTYWx0ZWRfX8jOd8ns+I1KD
 NMADMKyxMpulU+4KPaQaH5jlJdGGEZBwgUihYM5XiQIhuMW1YIZkVmEixzNM5fGQkWuKnCjq7m4
 eq1itnk/BGz+7X8FhRkmxYq82MAWB3WeFNhhKZFP4dwahrRbth8GjnncM2AkRk13oYIX6fRpQeY
 lahEz7bzAxy4NsTSSyyrRKXAV6NrzQO/G5yi6nh0kMSnHvmtfxIOf9eivuparxjHmgheDJOLRQC
 PsKYxlEIuNvXB9Mp1MEdSKR9O/c53lxCLETlI5yxkJyBIUR5AwXy7cAitVqDorHpBUcc/j0osUE
 CqjnEETM2Xqe/xcGyuWEggtDXzHFcSJ+yrABdWcZWfbP4nFJFUBeA7WT9B7p88Ovcuv67qFZhEy
 yG+Eiw+yRPyuWy4+sPx+KxfkFpvFR/XTjbCS5frbyhNnQTtGQbE3RSEur6HQenbpt9G6SJkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=716
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030036

On Sat, May 03, 2025 at 12:57:26AM +0200, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> > On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Have your tried enabling it for X13s? Windows drivers provide
> > qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD
> 
> [...]
> 
> >> +			glink-edge {
> >> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> >> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> >> +							IRQ_TYPE_EDGE_RISING>;
> >> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> >> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> >> +
> >> +				label = "slpi";
> >> +				qcom,remote-pid = <3>;
> > 
> > No fastrpc contexts?
> 
> I frankly don't know how to validate them

Well... The easiest way would be to upload fastrpc_shell_2 and attempt
to start sdsprpcd or hexagonrpcd.

-- 
With best wishes
Dmitry

