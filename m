Return-Path: <linux-arm-msm+bounces-77160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32422BD8BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 242404EC775
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A03D2F547C;
	Tue, 14 Oct 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRSU2J++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DB52F1FC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437387; cv=none; b=hewnlCf8KtMia5EwgTAbb42sJz/m3s4fSo9nhDF6Bqd/YeKuXLAzYz7qAyoCpqtFkGEXc5CbK1Zhl1/rHPAn6IrxUldzamGluUGP78FmRIWWSjL0XHf/Dsh1mEP0ajzDF6Y6kp7wr6HJ5Fn8TVH3X7DkcvGIXLErtnhfLAMlmUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437387; c=relaxed/simple;
	bh=z2WdTcRaPaqI49kofZEevWYMKxOmtfhm/A5grF0PpaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwFEnCOiF8jxq00XyLOWVzm8bL29YstDQIoIFIquuWn7JOB7hZODB66bzDzV6jkeu79/SqFgrLc0WGsdJXkxCQ4TrevBFmJ7P13xuBlI/Tr5zcapTOCUDipu/3gyz55qfAGehtxeGSjIbNkPhmkE/E725XEpcS9MctAuP0affgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRSU2J++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87IKq017781
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Uj/7ATN4u+TUQSCAcK5UK3n
	NiApttHLG6ztUMcWXEg=; b=VRSU2J++mFCvHkkvlPobpzEbjhkwJV0p7WGrp0r+
	UjH3mQUV13vruv4FO2uxwDRPrADDOInLQv2JnjQyDNUP7Lkong/krzOmlPwmCOy8
	ZNqs2ZWM2LNxKkUhBExih9/bDjHRuQuw1WBHEImnX21c/MESQE0dg/5i4AgVnIf5
	KmS9K8ZjJtXkJq5b1oqVodMmXczMx0WlJOiAAMNrFJ/tk3QUSuQyT5w2kTXEAlCU
	PpKLs5Sj51AMed4iEmIkoLOCupi4gaG+ed0bm+O2hSpE20UFf/jFYLNIDYDUNtpP
	wPIU3PEQNjN3wbGf3fS0QUkKN8ekqfNAm4NgzSCMaF1N8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1acdpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8645d397860so962217985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437383; x=1761042183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uj/7ATN4u+TUQSCAcK5UK3nNiApttHLG6ztUMcWXEg=;
        b=QnGhtTS9J8zaLSv6r7CHvVzngcKQn7RBlrQuf8vdfEhPpA6Y4Wkzrjmi6NZd98jLjY
         j0PhC4hp8A99HdS4G3rsLvDOBJL1zvNhYTd1XiFYEaLr27sSBLgRJqe1k5uD3kFjE0OT
         z/lIzgmshIAaiPbQvfAVu4Kurb4JkzetJHiHGYSQilt7wl1TCmiSmwBzAIzBBLoS53UV
         qiV0EUbHU7qgxyjCjsqpEj+CUf47dzacjsBiq2AWR90lG6VUG41JU+Gt7a5+lwgKBYKO
         CdykCdtVOtZmLEXQ6NIrglHE+DQO2hPr4Q8sXph47YIoWBAagO0UD6X5vreO8rku04UV
         VlGg==
X-Forwarded-Encrypted: i=1; AJvYcCVnRePZZ7ZLn15bez8NZV6NOQTI2iNRqgqdMxJKpX2GkGBPHGrxLBK6lfvYsur8JPytO2ckzPNhmz+dq0Xo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wlchvFAMIKh1P6zklEVwYo3kcvsGpFCwilinL7DQ9t87zsWA
	iS3xLcW88ea33EjKaFL+5Howk81KGY2H1M6cIW288WzUwylRPngLXS0wTpK/5MQEbTm76Au630M
	K1F+SlLJXCbm59Iy9vge6ESI5LJwZ9z4ghPmxYY0k06RTxs7Avs5yEEYJj7IYwmJc4O2R
X-Gm-Gg: ASbGncvu0GWM03zqvGRQpA4iCgKEbnSsOtSiYeBwMuwthB6z4y8IAlFdKNrUTcc7jf4
	stB55Eu9sbm5NS6SBh25ZOlMdVrAvUiWKFAv2Cb2OO8Iu2Nv5QHMIcs+aOyH02eT5TANG9cagal
	YXjjZO+93Hfn1LF+nQZmCWWPlFT7Eml1iKvtdMDhJdq8/WOblH7ffW7wq+xr2AUVLkFnpWGFpmJ
	9sdO1BrZtKEmMMK9ad2yX1cJKWuk9g0yGtrS7JaC02IHi6Eb6PWFINapigj6QpHEcUJpCevcyI4
	vw1yvLT6x4P2+zaUlOyX85bjSGV62gsdfeRNUvTqZUUW++8ZheMgvXrTmx6ASl9eUeI5Lve6L+w
	6+5hvYAujthTS3WDntdruoLDbcI4WKYneyYfrl6zcEjfurqy9Mkf2
X-Received: by 2002:a05:620a:440a:b0:82b:3775:666e with SMTP id af79cd13be357-88352ab09d7mr2876979285a.36.1760437383485;
        Tue, 14 Oct 2025 03:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpI9b1UGkdarxfxY2my6QGIRQFNyBFabsw/h2nYcLI4je0hd8JsX+xtryHXf3lrxskF2pXZQ==
X-Received: by 2002:a05:620a:440a:b0:82b:3775:666e with SMTP id af79cd13be357-88352ab09d7mr2876976985a.36.1760437383043;
        Tue, 14 Oct 2025 03:23:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088585765sm5122059e87.127.2025.10.14.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:23:02 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/3] phy: qcom: edp: Make the number of clocks
 flexible
Message-ID: <cjwmyljscgxozzbfdprb43mryoaz66mbqd2ihqdz4fbzzusyon@e4h2qfaeqxux>
References: <20251014-phy-qcom-edp-add-missing-refclk-v3-0-078be041d06f@linaro.org>
 <20251014-phy-qcom-edp-add-missing-refclk-v3-2-078be041d06f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-phy-qcom-edp-add-missing-refclk-v3-2-078be041d06f@linaro.org>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee2488 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=77Gn-jvO4NWksBu-1S8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IcfSrgI7xoiklFSQgSr-TuRQNyPfRI-k
X-Proofpoint-ORIG-GUID: IcfSrgI7xoiklFSQgSr-TuRQNyPfRI-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwh/LHrpYFUex
 bBRPtYAs3fjWj3kVJoeebCFYIDoR7m8HwXt/F2ol+A7hx2nXE2uszTaNudqJlKbhFQt/s6IQkB0
 rZ/Y+qY3DhmXWONk3RQexLndYfmjEgq8O41zn6VN30fbj2lAjV/MxjFrce9cRHyOPVF8i1ZGhc4
 CSfx6LU2Hvl6XaYWNy8WDJXi7+nVwO5ReEi3mq+Xt8U9Ssd4k2V3rP1BK2YVj1X+vEhN2P2yx4I
 rdg7nqNp2NeoE518TnZXg3jiCYGisDrYCAuVSNMeIySL5Vhb/TfXOp+zA41o/Gt1r49mBw+BPto
 l8pteA4px4MothDuJCzjgBVVnQyT9L7TtlpM2x81kW73mfw2vZumGDzKDMDaP1BcuGM8VWTXKh9
 ajdWWPFBcV6GDrOrk4ZAo+2aWYCb9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On Tue, Oct 14, 2025 at 12:46:04PM +0300, Abel Vesa wrote:
> On X Elite, the DP PHY needs another clock called ref, while all other
> platforms do not.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So in order to handle these clocks on different platforms, make the driver
> get all the clocks regardless of how many there are provided.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

