Return-Path: <linux-arm-msm+bounces-71637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C826B40659
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C7B4E0AA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC118305043;
	Tue,  2 Sep 2025 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE4ouxNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87432FF177
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822491; cv=none; b=faczJhB3Yf96HTu8kbXhNecz2fwp/nlf6d0ZuTBU66khRQsdWtye1aPcdKY3k4VLqHrEBOolx1Lo8HZnzVGWr/CGzYPMtrfJkxO5fnUnSA7G8c1Z0lHXCyy830ggPI0nIPIjRPXRph22xn9JmrM4BgiNv+dGm8Ti9EqubKTWFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822491; c=relaxed/simple;
	bh=ioDj9OKZUZG9SXyaVD3LjRoWMvd0eSILJ9nbZmtaXWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMgEgDsZCYJt1ZJrPCfNZB2IYpjAsxACqaRf4vdnVqRDSegu/FNgkQ6nRJ92D0wdS0Tg3i5e0lgePz4hItGRMgU0JXX9bX+X8sT+NABrFoBhnmXRctr5/uwNdixk0oC9X1v0rpQNa2bR3uOK0tdhLy6PzvTYG2BqjWZ6B8+ER6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE4ouxNH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGuTv029653
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VPDjroB3ztY86zaEZex6BUAX
	LTZV4LHBrhebE1WbTrA=; b=eE4ouxNHvYPJFunGb3NDXZeOcBscQ8CmeQagYekp
	yO4abQ+l26jWSNJRHpE3T1tCtAxOegJNHqzK3wRbqSFa62khRHUIriZY1tWrZ4oH
	/YvrQ3B9YlFKnl1l0/ll654GrFsHGiP1uHs7zr2XA3YbZH/X1k1jUBDxXnxyfjSg
	05lFm+QR0IfmgtR4uW2+3jxIN/RchI0TXTUYUPksz1Gtu5EisCpgAoOMTNS7wl0l
	VaJrasP5EstOTIcRzAmP/8wtieg8Z+B3rW68R7kOEtlP0K6OVAMd4c/9U3RT4IZO
	LEQb0M1dI5AsQPOkS+zFZrSWRbOTwtM/9HrERdyVmUR6+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2yy0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:14:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3476fbe7eso16698611cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822487; x=1757427287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPDjroB3ztY86zaEZex6BUAXLTZV4LHBrhebE1WbTrA=;
        b=Y7Hcgpc+XuitZBQXYqPiZTrlsSLCwFuMX/4ZF/Hsq59MA3+KhHcNoD8pBdFHstx7Vo
         oxjNkxMlQ9mdfvpIiVBifWJJyntqyvD2AUqNTCBPCWcolDzIt7HmfeDvt7xp8HONF5cg
         9zC51fVzrJaAUA85p1ncaCCx27IV6wU0ZTj1vEzmqGfLwoBaC76JfRlgYOsgwy6yvYKM
         EF40LxHT/eGXEIQLpqgiudF+ngvZy+d0PXhdHGTd35rvAth+ssGgjrpluEg+2cUoUjE5
         lh/kzXu2nNdKjmpXT37asJnMCMh+UfRqYURE1i0mb7mQEpWFuIVQpf8CUsK5ijhHyU4G
         0Iww==
X-Forwarded-Encrypted: i=1; AJvYcCVQR0NnXtcXIjv0iK19ZS++BNiZainIJU7wIcRjuxKKciGYSUdjXxVX72wa32+8nToE/xZuQ4WQQMXVBvTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJniwAzpYfeY/9ebydaqx8NmAPFr9luc91bHsDBVPUpC9wDWh
	rsheo3OZiDTeVRLm30LB5U7Nkz/B/QN2E1qSVJaj8Z4n2V0jojMpBhBjz+K02Z2mrNnSkDemLOo
	48SBBq7iENT1uzmwVZWkac+V1HQ8OAJbI7ziU7zUt/d3rdNg4NhjY//lWqAa24NREZc/c
X-Gm-Gg: ASbGncvVfYVuKcBEP757VWcP7a4jW99DkysNXi2SSzIpC2z+uLJN0Hs+BHpiTyzi6s5
	suXqU1TbTOe3zTtqbLwHWB2+/VXPTeWCPA9aAUsBhF9oRyxlUk85PHwmfVkYXmsADYt1Wj6pOhb
	MhnLQFk8rZx2AhFJfQp58YKCv5XG3hKUe989mky6VkaWzu3DmL8B+wWMplEeJzv0pdUny7+S59Z
	5Ct5/yW9Pco4TjZfHtzjIfDHAS/z6oxShIJoVDvM8LAoRAjJ8qgLSB3iwwHnog14ScBXfum+uKE
	y17q3lPJ+L9/rsHOSuKEJ/PqV2lbvzcQU5DW9YlEsGSAXhe7tl72obz8qQrEaxh4eevY/x8WYN/
	QIOCegyd6p9bgkmz/ZYZ19puqAf9dvBU8n4dSEtjdmr6vjOPn2SSp
X-Received: by 2002:a05:622a:5e06:b0:4b3:4325:c921 with SMTP id d75a77b69052e-4b34325cbbbmr27635171cf.2.1756822486534;
        Tue, 02 Sep 2025 07:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbkPG/3GwoZ63uDfguv+KuDMTZdCIFwLNXUWVjBJQbsg59aUFidJtYZdyH+pYNyJfobXe9Gg==
X-Received: by 2002:a05:622a:5e06:b0:4b3:4325:c921 with SMTP id d75a77b69052e-4b34325cbbbmr27634531cf.2.1756822485713;
        Tue, 02 Sep 2025 07:14:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a020dsm711923e87.118.2025.09.02.07.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:14:44 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:14:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
Message-ID: <4yt5lubdcvepqkstt44j4h6t5bxbno4eajevvkywj4y7ypl45a@wog3gteubbym>
References: <20250902140018.247209-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902140018.247209-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX5pEACYwkRfIO
 pDlp9ugJGI2o4+W4/DgWLSse5G08BJGvnmF5cmqD9rPlFpRPVzfb8rc9BFUVg1g/y/H59JNN/6K
 6TBSOgLOUfMN955zp9Avj/qujj/YVnHg/kOChmH4vjcyS0wuMoxbF/V3hp8i38mhiBp6CC3wh2v
 tZ7p/5CHjrKf6C0xRNuXjBoEo+eZJUq5wNfQbewV35FUzUdiHfTw4masLHHSMdtHYE2Jgb1HQgn
 gCZeceKNsg5yLzsGajW7haklq4V+Z2SDUULPFm2s2U0H5Z29CGY0Ciz3Ux4WxjgoKkAHzBTVzO0
 NpnooOl29rH0aJZesP/J7Ajci9kBjFdE/Ly96FctY4tJ2AYHZY176d36leJExz1lPIJ08xauXiM
 EUqOyFYV
X-Proofpoint-ORIG-GUID: ST0KbmWsTkBifrIB8vDq0z_jx_SBPxJb
X-Proofpoint-GUID: ST0KbmWsTkBifrIB8vDq0z_jx_SBPxJb
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6fbd8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IIvv0vHZhC9vjs7kOx8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On Tue, Sep 02, 2025 at 04:00:19PM +0200, Krzysztof Kozlowski wrote:
> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> supported by the kernel, but WCN786x is not.  Both of the board variants
> are considered newest revisions and the difference is only in MCN
> numbers and internal codenames.
> 
> Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
> represents the WCN7850 variant.  The S4D and S5F regulators should
> operate at 0.85 V, thus adjust lower constraint and regulator name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Add also PCIe nodes, because they were not planned to be sent
>    separately.
> 2. Drop pieces of comments as discussed with Dmitry.
> v2: https://lore.kernel.org/all/20250811131055.154233-2-krzysztof.kozlowski@linaro.org/
> 
> Changes in v2:
> 1. Add missing &qupv3_2 enable, so Bluetooth works.
> 2. Adjust also S4D regulator constraint.
> 
> No dependencies, can be merged.
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 147 +++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

