Return-Path: <linux-arm-msm+bounces-52201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 016EFA6BCB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B7B18913E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFB315CD74;
	Fri, 21 Mar 2025 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPVlj4zz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A088B15530C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566423; cv=none; b=FwVJK80jr4Ipwx3VT1HQx3Tx82mBUxLnlZLAvzyTNrF9Tq57I8J5bNRbEoPOhT/8IKXXmWMrjUgihJZ1B1WCxT2iVX5DnUVg8QlA/83/LVkiGoI7mkYL9mJ0Cm0E69SGSkQOIh2nwXObei9+UObbYleEdvsKp/td2Ds+35UmRDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566423; c=relaxed/simple;
	bh=uBUiccQ0E1+lDOw4b+8JHHFhusVeUfHW2gI08CvcdIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmGciu6ErATC7zGgWTmQ/eKg1jXcgerokOMeq6qIBjsVGX5v4WnDpp4DUcdp7cw8PqYv7ep62UW/75o8gi+auwRbImr1UWCLP/yKW/XlNSaIRGO5g992ZCf2FWzeU3SBMpxNaiVvCwW95NYxU8eXMN0Q+Mkm44m7Q03IA0Yr2w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPVlj4zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAThOa032640
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/OpsejO/nFX3sSiWvHtSM8e/
	VQXv7bXmKGj+8glzoBM=; b=FPVlj4zzrVAJVgRA0tFAUrVa2rWZvCfOke+pU7tr
	Hpu3XPD8rb8vPqIY3TTEBf50hszdjHgJDzd+tg8X/+H++klmbMvOY0ehw99aCSa7
	uq2dQ+4QA4QKRvUXCxsYOrv+eyLW6cigopp0orb8wcW7LxFYs7RjfMmfFxHMedhc
	4V7HSUn1rEfmnK9dz8P1aCLCRmbluP+r90Y3sb2Z3yjN1e0IsJk0z0D2l1iUI5n7
	rxDbBJERCAAltD+oclMWWZiR9XON8zcIPDBpn7VOjRwnEAJ4ivxEX+tVmhfQ439U
	YGgE87sWNhZuCBD00bqsTaO45IlZH4rzKMoBbEXlCmRSZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjctt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:13:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54a6b0c70so202284985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566419; x=1743171219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OpsejO/nFX3sSiWvHtSM8e/VQXv7bXmKGj+8glzoBM=;
        b=SOoDzyeqo+uh4N6i5y1v7GVw+NYFKxk7wJny7abEAjNON7BhjC2h4T7jq3hj2NBDcN
         sacHwt23OdmK6cNGz2cJUBgp7ApaUWUBKXGnrh/L/xjpOqLb0SWx+STJcQsed3BhBZDa
         84SZXamCeLJQlVO5Nf4YdQYbSP7iTFXZR1CQV1bM2tb63/puX1bTbZ4YFnxXgQnlt8O3
         oNJKvQfCRoajPtEFrrKw/LPX4Md1pFwdklpXg0gbxDF2hZ/uvo8G4lDn0hFSPI0+Z2vj
         w/mljILAuYjT0NCXCnP0482mM+capMpqDZy6wmJzIeX8ha3eu2QaW6vEf0a8RNbamtuN
         P79A==
X-Forwarded-Encrypted: i=1; AJvYcCW+urrcpV0g9wj4o9GRW9xCnXaGl/ISWBCnEhdeRUA3NuTv+ZBLwhUu1EpzZPiC8VT8lGk2wrO4v2MN+iTR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jedre+qi8b8ErPM+q+YIXXIbCvjRTi/3/cwgTBxdFLGUTPuJ
	YMzb0NrcKdgg2DIC9vbNaeKGrHJmMO8UpMieEG6vEPh1oNqpBJEN+3n2ipNuAxOamjFRW2LHi21
	/3o09Ya0No0WzZ08lT8kKiRije/iq9uZgo5vzapdyR5Ta8G1DA4a+o6cExQ+R/t8/
X-Gm-Gg: ASbGnctOZx6D1qwPsjVZ3k+fzCGFiPk6mtxd/uVanFxQ3haqBrg75BhkQEei7VMLmiD
	GYpBi24JMe36/2edK2BJ0trhfgLUMssB2lPuzs32s8b9kHTswPzDpc276UzaffKpKQnfR2YmOYH
	RCsWfLSHcJLk4JtVfYlquBgOMUDmmiU52djJZO5WxwyLxziOKZFg0UPiLZvWp1LniHJxb/ZQBBo
	MMNOFSmVpQUN+zky/Z2KAqD6oHCpgPnMWwlP9OJzdivtmWxqDsLFCIoMXpRXX7pcpmVBk5Ox5+Y
	KF6woK38avosnRauy/kpVpBVykqH9cdkRdPP3PCcIU559SNsRJfw+F2V4XL9DqwtCuRWa40u/Ya
	Bdck=
X-Received: by 2002:a05:622a:1896:b0:476:8225:dacc with SMTP id d75a77b69052e-4771de6129amr63272511cf.49.1742566418647;
        Fri, 21 Mar 2025 07:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcpv7lxv7hq3U7s9ctlOYQCQmLNU4dbw+zXD/Ekb+GQhj36pTR5y+EtUBwPhZ6EX2Ma2zidw==
X-Received: by 2002:a05:622a:1896:b0:476:8225:dacc with SMTP id d75a77b69052e-4771de6129amr63271671cf.49.1742566418102;
        Fri, 21 Mar 2025 07:13:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64805c8sm194189e87.90.2025.03.21.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:13:37 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:13:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        20250317100029.881286-2-quic_varada@quicinc.com,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: ipq5018: Enable PCIe
Message-ID: <5seajsw64e7mber5yga3ezcnvip3e4o2wylg3uhvaiu5pob47i@ea3rnxqrigcx>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>
X-Proofpoint-GUID: jSinpD8BvZWoRSjk9R2gPrwZ3RAfokxO
X-Proofpoint-ORIG-GUID: jSinpD8BvZWoRSjk9R2gPrwZ3RAfokxO
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dd7414 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=zzgNwz6f6jWhJtTWXysA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=498 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103

On Fri, Mar 21, 2025 at 04:14:44PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 432-c2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 40 ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Minor question below.

> +
> +&pcie0_phy {
> +	status = "okay";

If you have schematics, are you sure that there are no supplies for the
PCIe PHY / PCIe PLLs on this board?

> +};
> +
>  &sdhc_1 {
>  	pinctrl-0 = <&sdc_default_state>;
>  	pinctrl-names = "default";

-- 
With best wishes
Dmitry

