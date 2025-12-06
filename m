Return-Path: <linux-arm-msm+bounces-84547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2CCA9FD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CFD4300DB83
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C3AB640;
	Sat,  6 Dec 2025 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/aVJ3+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hWPOhK5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C913C918
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 03:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764992718; cv=none; b=RoEgOHpgyCKFiV/XeScpwPiit+ZX1GKkQ3S1ykmxoeHzKBuL2mUD0p2jdP2Lyb6GdHk1guBqoC80nuHivIYzLEsfYMl2Erz3N/ixOuf5e31X1LkiAruxah8QK4vL1lG6oFJSozb+pFqr3wRAh2TWBxH3rT258EObOoeLnhLxpZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764992718; c=relaxed/simple;
	bh=AnK3DHv56iUZKt7rwfu1rYhWmX6LpqUmiKYSAK9sNyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BO3Vbjta9+sZsD5XLloneaec/2nDrRbFIXEtZa3Hqm8+uUlYQqCvD5O0DAER3FpNwtqJ6f1pX2817VhPONOcDL0afc6GNwdL5U/J0udicaNBLeVaCYXKjj9BgS3iPyPVEoMjtYpB48P3p/5guNU21/R/PzOAaCHHrIdai+pn89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/aVJ3+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hWPOhK5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B63R5I22575498
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 03:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e1ycRnNkK+a3naK8OmMuCjZI
	VBoAjEBDlZlC0t5jcx8=; b=X/aVJ3+TiHulUhoEBZOOmSCwX/72HAbcELveELYD
	sbm5plrNPsNIcvY3nif7g0izpFK0+qTbypcU0hYXqFyr/4Vor1/I6Q+PCVaWWt4g
	j7TPi+TBx6bn3y/l/XQd2M8+mrBwa+GVJm+HOUZTgE+hPvgz/odw7rez5/JlylnO
	Wj2oNQvTYdWKvzlNmWc829FKvzrgihEIrkbZboiF8xsSnedBqfh4NDPuzH5eGcIX
	vAk2ejbHkLjiDplwk9aaj8qw6mBEdV6+MCl6FD1yENZKS82jI9HnqIHydGXEf2GO
	xXSpVScbaN47sqlxSBEdfWaE5Qe/NqDOpgz3E1j4tFTkCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjv80u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:45:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2194e266aso543517585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 19:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764992715; x=1765597515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1ycRnNkK+a3naK8OmMuCjZIVBoAjEBDlZlC0t5jcx8=;
        b=hWPOhK5zX30POcJe4vcoL1pW87WzyrCFOCa42XKj6XwYvyWem0cnxHhTZFhCYJ6ZTc
         ptqZ+MrR1hhiBuIopTWqCbJsHV5c9zUse6ym+Pte/hOPj7q2Xzq1l7g7UKqHE9LM16Lu
         ZIC+KGd07VuS13ZC2yUrEmMB8KN9gnDOSra1G2uHwvhO6WUZDQQETiKWHZBjIH879gED
         RAICzKaAgE5P3u0956I/K4CI3yKF7F8NdypTaQH56VClQchLNXNs4wki9zZAlbkxD/2L
         bLC1JcPtW7q5YoAbA/PajFBHYIb+ZST0FIdVSa7mjrAjiWydpd8heHWa2tVuYPIsCjwP
         Qe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764992715; x=1765597515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1ycRnNkK+a3naK8OmMuCjZIVBoAjEBDlZlC0t5jcx8=;
        b=MVv0utfCo0+JRX86m8MeyvyiZKKfnzD+o6kWVKEkN+0i5EZSzkQfRNsnM38/2tC4Ir
         v2ewKlcr7WDRGrPGSzFrT2m95H19xOARMlJwdU0WW+uZ613oHOzXF1vxFQXQ3tIs79yv
         YU1xcOwRioFCEJBB3UD+/Q4yLry9rCB9aRKTMXb17vBz8ThM2E4JVjvyrFF1g+XqvlJt
         G+ODve71MvoVkvhJnz5P50FzN/PAR5fMQe4slrOvEKRlSYZNrcpcN3tJGD+hsnkjFUiZ
         5ko1SiOfo2M+7J0c7t65pqXW3hxPZfvWWOv3wFPYyGvRU6iuPBaK5fynlJ32/CCySylb
         2jsg==
X-Forwarded-Encrypted: i=1; AJvYcCVePUWu7v5MjV4Fq/tRn8K5v76paEsiaN12NoNAMZuUJK7hh9N/HNmj08BNR4+SL4lqc4p96NBLCU/qgT3d@vger.kernel.org
X-Gm-Message-State: AOJu0YyHriCbWyBsrN0MKk2mZ/eDwjV6gMNBPmlJFSxvSg+N6iWVMiW5
	kwxQoyD81Jd2Po+EncKwEbTuTuSRTDegwGqf1khKNX1bAdi1fwDmN0MwXO9qlc5HsaWPUTKDkZP
	74ZmWGC2VPmpIJRVrwOGhgSgvOSwOSiv3pD3OR7cHxUr/bHCIUzkh+vIdRb1sJkLeN9Eh
X-Gm-Gg: ASbGncuqVrqNYlTNAyWSz7ETGQckwu8ecMCMLGGhwDf/EvSrtM2HNVcuSYaAAEnHzCK
	xak3ZSYZmNbCxRO8kOoCgOEEjp1op+/WugM/3M4C3Dt4//Ve6XSGyFSlhL3QgN0JTv693gpVy67
	3sQ5+knKXGHYV91ZqppokTCmO3mG/g58QavxKeeiJ4oc/EJxfUV5JLqN2IX14H+EJV+Bo4QJ93m
	WkToY3VR+su7RP86Pik3te8OYoIaGzK2OIVadN8Ipn4itzj5NFFRAgBLu4fSCfvPkhh4aAA+3ip
	RqnKYEL++nW1DrkfRqhp4vY8hMshFduqE63LIY6Urb8eqC8/rFEo8BFr68xsriju5sz6eAHb2GF
	t8/zVi3N2+RiacveSGK9PKExNMJhyNa+nCQIw5HNsRn6tAglXBmLRoLqs99uGRf92ZJAiHXyROx
	SVb9AfUWhAVNEU5N4Sryrnbeg=
X-Received: by 2002:a05:620a:10b2:b0:8b2:e598:e31e with SMTP id af79cd13be357-8b6a23c156cmr148397385a.56.1764992715322;
        Fri, 05 Dec 2025 19:45:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIVEYwsGSimF6nl6RQav1qs43OwCZK5nMusOwC95RJMdNNjF0REaWdaywYAza501U4k7i7cQ==
X-Received: by 2002:a05:620a:10b2:b0:8b2:e598:e31e with SMTP id af79cd13be357-8b6a23c156cmr148393985a.56.1764992714875;
        Fri, 05 Dec 2025 19:45:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6bdf5sm19272921fa.3.2025.12.05.19.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:45:14 -0800 (PST)
Date: Sat, 6 Dec 2025 05:45:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add camera clock controller
Message-ID: <vsdh2yzhr3kasg2epvxgjvc2dkzm33qegftrj7oh7ogd7kvq6a@izq7deto3ljd>
References: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
 <3e1d1dc4-7b94-47df-b4bd-f6ce4d7842dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e1d1dc4-7b94-47df-b4bd-f6ce4d7842dd@linaro.org>
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6933a6cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIZNOTpbyV0ayxcPKxIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOCBTYWx0ZWRfX8DBBqDC4PPtA
 GI3KiE9xWVKUTbcsYJQu7BcnLwO8a0mA+mLIlb2/LcJbpV1MNA8GioR4A8ZHGHG2GU57g/pv8n2
 7kFY/iof/mDcrZMGHo+4rbVaHyYEbPbzwF9E/N5E7c+PX5qNJ+gG0S4ofxW4bmbZTGM/QrRp3Mb
 c/DhQnkx2402XHbuLj+cCgsRXHcO9VAJL0B6KxKtbvIPrSQcaj32JAAaFv3x6yAWeBuFD33oS/Q
 mGwp57yIDaLBXnonCxcJNOYdBrRqbS9/UbW7i3VJB42XX9Fp+npRf8Fx3bNunEh/1W9oJVwQivk
 m9G1X4PKwxFYZWqqo5D1+UCcUAvfJrqaCb68GhqqFLudiKZ/oN6tbjOBGEui8OOu9qWUIl8kojn
 Mk6gFF76WJZfjQRYpq0hzkWWDi9u5Q==
X-Proofpoint-ORIG-GUID: tM9P8LWyifkXBXKdmYT8ftbti6KsLjSm
X-Proofpoint-GUID: tM9P8LWyifkXBXKdmYT8ftbti6KsLjSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060028

On Wed, Dec 03, 2025 at 04:03:26PM +0200, Vladimir Zapolskiy wrote:
> Hi Taniya.
> 
> On 12/3/25 12:32, Taniya Das wrote:
> > Add the camcc clock controller device node for SM8750 SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8750.dtsi | 35 ++++++++++++++++++++++++++++++++++-
> >   1 file changed, 34 insertions(+), 1 deletion(-)

> > @@ -2046,6 +2047,22 @@ aggre2_noc: interconnect@1700000 {
> >   			clocks = <&rpmhcc RPMH_IPA_CLK>;
> >   		};
> > +		cambistmclkcc: clock-controller@1760000 {
> > +		       compatible = "qcom,sm8750-cambistmclkcc";
> > +		       reg = <0x0 0x1760000 0x0 0x6000>;
> > +		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
> > +				<&bi_tcxo_div2>,
> > +				<&bi_tcxo_ao_div2>,
> > +				<&sleep_clk>;
> > +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> > +					<&rpmhpd RPMHPD_MX>;
> > +			required-opps = <&rpmhpd_opp_low_svs>,
> > +					<&rpmhpd_opp_low_svs>;
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +			#power-domain-cells = <1>;
> 
> I've briefly checked the recently sent driver, and I didn't find that this
> clock controller serves as a reset controller or a power domain controller.
> 
> And if so, these properties shall be obviously removed.

I'd agree here.

> 
> > +		};
> > +
> >   		mmss_noc: interconnect@1780000 {
> >   			compatible = "qcom,sm8750-mmss-noc";
> >   			reg = <0x0 0x01780000 0x0 0x5b800>;
-- 
With best wishes
Dmitry

