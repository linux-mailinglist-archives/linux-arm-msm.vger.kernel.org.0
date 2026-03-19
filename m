Return-Path: <linux-arm-msm+bounces-98818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGoTNpJTvGkXwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:50:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798B2D1CDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C936307D7DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F282734C81F;
	Thu, 19 Mar 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3YLXYGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/SiMi9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732B2DEA8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949826; cv=none; b=myqR76WLLVaLuOxAbxEUHQFtnptHA7AFkTci4mquJIsFNXXYbFRqt3xh+B4Prq+vnVkcuzlsq6vzWBda95GKtIqbhqIwGmGU4lKT1FJX78kpJ2jmPk4UDn+u2OEZnICjvA/RrpNgnWEOJ+bz21BZDrVnnzdXYO3RTPjhYtEZOOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949826; c=relaxed/simple;
	bh=i74+LUsljeq5OURT5idEOfUI+4H734ibDR81rFe92x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpUD+9AN0AhGYz/+INhvceoAMEKM3HOtEsTM1nAyBLYX/qtH/s6Rnuv40u0dgfRoUMuKTYVHbn+AjvMP+ubkDHrVtn7pHCtk6jSUOvEDSAXpO3vo2NDqe1G3L3fo2/uxIG9JuP+4ox1I109I9847j6lrebjqkW0c69atU0btTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3YLXYGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/SiMi9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JF5RFq1027820
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZWhyfQUUVgTuDV3BF0ZoGSyB
	bmACaRyf7XqBbb+fkzo=; b=V3YLXYGITNZAnyPHLOiWsytQDM30sKPDQi6cT5Vg
	IEFhg7QYUZQ4TLWL7/XX3EYzd+z4fMI4Yit3MjK461GkvCgdnI2IzFRGQDo65zwo
	+4RrnK5YyHpCAJLid33CzNuxfRCAFOoePwSDQFZUQDRCeHimi1zX2jSsO1r5rrrs
	68VCIUk12+Z/JotO80LAPvmBDUGpC4NmCurk0mHghpL+eynqcb+bZugxJXZAEu/3
	+0PWhClvdsj5LiyxQUFtZrrUVm4X7NTuD+mPicoejOWBwBx0ypT8yRc7oKANkWmC
	Hv8kXSEBmaQqW9AGNJ9tlE6ScNtMafC2NBddxwRsJDKCPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032mq7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:50:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917afa521so148160401cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773949822; x=1774554622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWhyfQUUVgTuDV3BF0ZoGSyBbmACaRyf7XqBbb+fkzo=;
        b=L/SiMi9ohuSCj0pLip29T3KZd7odwzFxzSGJPhmVIj/oyC9FI3Q25DxYqahjkAN4LW
         2toPzWSrkFkUXezovLsXjKRkWaRSSxOp/4Jo0RX9+0zpt6gsHpB8nqI2nbr88JYqp3Gf
         UMVJcfXV792GbL1ijgcqv4IWCnYF1xAJJ1Xxsmko/NWlNWTXEDd1jQZKgojf6Tt3U+50
         mUyigL6i6rzLsG1zCnj/F0r2AZp/4kmyjk3+CehCQWQSRy2yE+nhGNIyitE4MiQrVEcN
         ERjGnWURy6pY1G3bBNiC3W9s25vMOkdoAA2cMYl5eGSdaBKyFZlTGSiiNBGe3sg11h87
         WERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949822; x=1774554622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWhyfQUUVgTuDV3BF0ZoGSyBbmACaRyf7XqBbb+fkzo=;
        b=D5MBcvMq3J0GQHBJC+b7E3FitecPYS9hjoTQdeJwoulYWTl3S8fJ8fR/0o7DB+SKHn
         jP4rOAYPahGRccwppiQDYWkFC1z58yJvp4cmZtBLEjUFDCtFHDTTRKy7Z/QD98On1we5
         cyk12nAzuXw674H9JLXvcIm1qSZvj6XwSushVQegbeEgDO2KjT61w0RW4f11wwP4Reuq
         RfNiRD0CkI194dCSYluKDcGZpNfw1Hbkeiv1ZRQsFCxxc7nUt9KyxTXM9cvXID3bwpjr
         Bt8+ffMWWHEPbg+iho7ceAp8KM8canp+KfdUOHI4rXn1J0Rx0F40xIVbSCO7bifduK/M
         /qPA==
X-Forwarded-Encrypted: i=1; AJvYcCXMOSJkZoPwixgbnGa8ie8JtRtCeAAjympJX4+MoN7hWlbEghp6+g0RVeV3uwJ9mMCpRFt5RL79pW4nhLXU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8SSAxajLQIn2csxDzjMne8satOAzjsy0mB6XTLCotHztjHFz
	hJtWMlChECnXpYQcn1fHSce2wwLjrK6Psr9bhJfMiwBMQy5hJTu04eDXgdMj7sbuhxrXgWgYgKO
	ML41pWKiTluSjxhvh6jNLiHBvxhEbUvVKhjqZAnsij9IiS5X6GfscUhMJLROotsaoD4nN
X-Gm-Gg: ATEYQzx2mZtdWM5GhtW9TjR7zTSjjnbfIeMBMcVYQn0rJpdkJ2Sx5NVC/yxvZ3/EK/C
	6rF8wM9SymtpJbneH6WZjn+WJO2WmDBciNXpA7FhmOSXRrF5j/8ysNvYBQs15ryvUz66aTGzccz
	3eRp9L7UqdtTvzek8KuTa/EN6x27ym4TZGV3++CgicJY0iEL7kmvNafWaU/5hCek01bj6B387K6
	v2ajlE3uRn1D6WG5JZrxjKbDmWTKLpU64ff0SldtdWC4FkwOpOKlnQFCCcarx5UD8qexaR7CK0q
	by0gu7LTIjmIDe8CECVVi++2D4disD2VWh7MXZQsG3tUVD9WSNCPAQyMGrllgYKZ2Gvzeay3Rqm
	tb9OUHJXhC8d8p+HHEFMtxKpGM1ExnCDTIEM86Qwy4Ay2ydJl/ecIAToUrM5T0queMTqwx8Gnu4
	RG62pmuJBGmvIoEBGWAL1zCouIaDNn7UhRhNQ=
X-Received: by 2002:a05:622a:146:b0:509:144a:43bd with SMTP id d75a77b69052e-50b245b4292mr63844081cf.3.1773949822264;
        Thu, 19 Mar 2026 12:50:22 -0700 (PDT)
X-Received: by 2002:a05:622a:146:b0:509:144a:43bd with SMTP id d75a77b69052e-50b245b4292mr63843611cf.3.1773949821713;
        Thu, 19 Mar 2026 12:50:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm96119e87.48.2026.03.19.12.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:50:20 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:50:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: glymur: Describe
 display-related nodes
Message-ID: <r7xzq25ilolljlucp2b7nsabcyvht7udgq3psbs5kt5qv25lo6@icdwtfygd3nm>
References: <20260319-dts-qcom-glymur-crd-add-edp-v6-0-f582e87ec874@oss.qualcomm.com>
 <20260319-dts-qcom-glymur-crd-add-edp-v6-1-f582e87ec874@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dts-qcom-glymur-crd-add-edp-v6-1-f582e87ec874@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WGN284uEe2bHvMmIgFCzmcIq2UBiVUl8
X-Proofpoint-GUID: WGN284uEe2bHvMmIgFCzmcIq2UBiVUl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1OSBTYWx0ZWRfX3h+Y3PQQpj0z
 ztR/8GcrvGm0/Fy2pdo1uDCQQt2qB+cNUjgmtbY/B1HMrp5RJpxDdgPr7wEdwEbaGXniBfBRP6c
 vMZOEzMm4pcw0YLtv7T+2UvqhJZ/XoCVHHdDUliyPNgGXQqRNaaWjaGzsaV3CZ6L5T+YDNuRW8/
 2Ss5yLDeEBz6eFLU3erUjSGpNbfD52SSveylBP0Og2hoEK2olJOYAKaR4iiNrbafB4gxKhhf5WT
 Oddqgvdw88BnxH6dXfEhD99NcSTcxwX+QnYZaMWJr75GeE8OypuYPEVomvpUuHUvKraxRXedw4x
 IFcinY0fU7IMoXv13KPub22Flr3RtcOvsI/N8m/eIl97ew/xm2JpMTWTgplA/AWqqPieYamoRi8
 LF9c9yh5uPvFyV/Z7c8eIDbWPgVdaXOwgdnhT6qjStFPyUL4hfGQFhjRHipETuJFCseXO2GzOL/
 npRfWxwQjcv6yFBWtSQ==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bc5380 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=j_cfvXHPzrGlstGZ7DoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190159
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98818-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4798B2D1CDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:15:14PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The MDSS (Mobile Display SubSystem) on Glymur provides four DisplayPort
> controllers. Describe them together with the display controller and eDP
> PHY. Also add the combo PHY link and vco_div clocks to the display clock
> controller, and connect the PHYs and DP endpoints in the graph.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 466 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 458 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

