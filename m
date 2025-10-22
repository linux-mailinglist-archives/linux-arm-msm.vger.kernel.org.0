Return-Path: <linux-arm-msm+bounces-78297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC14BFB072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2EEF3A49D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8AC30F53E;
	Wed, 22 Oct 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sueq6TsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48530EF9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123685; cv=none; b=QZM+LPNCE46a/eo5UYSWJRMXh7q7NRujtM+AFV/FoYSf6iTvXo3xn28W8aN6q0OjLm7Ef0Ce/2mu4MYQl12no4pBQlnzZzZLpXEPPCcc6jHZeoSkt37CMHbgHpN85Lx2xrvcxIK++rAytD3G61JpVwdmRjDS9XYRlSA2X8CJgTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123685; c=relaxed/simple;
	bh=5sCwvusLGqime2/Jy9aXr2cPI9fkv2LkkGeuCX9BmbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+Iaveu5yKYH8669Vx26ReFyr16UWp8VSRjlJpAv1AFU5BIKs1mvciRRenNoSAqNISAqSmWt3/udviWclrrXYDDeD6w/5SE4mnhIlOLUjJqomPCAmmiY6CtdaDWBJibA3iJMq/DFGEgiysfaeC0q0D8b8GEjdWgBVjCdzGa9fEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sueq6TsG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M378CY031269
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ivByTKhSESO0VcSxSaiYVhLG
	ISoDBO/7JhIXLIxz05I=; b=Sueq6TsGpWeoJOGBcFLsAoEpnNOT5Zb3CGY8mvZv
	gfOPV7k9z6T2f0I4pY5ky6HGf1X3WfGCpYKcwdW3b0oju+29JAlCw7rCH/ZHTvNc
	GeVIh467mrIM7SQThMhMtAX+diha7PqnQq7lzfhdLl6RGLU77jbfu2Y9MNsH3bKK
	LFX+P6QG/ANcyg7YTtLA5ArjjNVXGKIEC7q8sMLP5O6GbCI86mnLZBUG/x7qoxYU
	aO9HyHXoKSu6vOQYriUK4f7K3tzly/Pm+GspcFlmtPu6EgPDS2MzxP5x/t+/6j3F
	WSOJl/FYYfUlSJzXQCAikJHggiJmwnvoV9ZRJj6q2gum8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kbt1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:01:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f610f7325so5596589b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761123682; x=1761728482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivByTKhSESO0VcSxSaiYVhLGISoDBO/7JhIXLIxz05I=;
        b=I5u0VVJMWbZhqYnF5fLfYwYyzd5em5X/aPx4aDKnvSRidDVX03yhCi2zdwyaXWYdwG
         sGKd5wKzmhGDkT0bKnUFtUUy/NB8+D0Fc39qh88FQ0MH2uT9LtZGjdN7Z6hDNopmKjdT
         1GiICWrxDRq6mr0DnACRTxasktntqOLpij4JHb7KveKfYWhSF6/bNVs5wGQksFb2EgaQ
         B+Wvb3fo5y6YGU2NZslyOsKUSpkTkHKmEB6t3oKWCt2qmZUwwgIS0xdYhM4kGuJPjSzD
         4XY+5zl1ta15XcgXOZiBDH+MEngHTayuitxF0DOOqrDUUdkBkqIJPo4951yNSOsah+Y7
         fRHA==
X-Forwarded-Encrypted: i=1; AJvYcCXnJm6WLdQzkcSUXXQAWK/sm05tvlVRtdvbaru5ZGKpT4aV4SGTI3uQfj6eyxREzjkivPcJcvRTPTW4jODM@vger.kernel.org
X-Gm-Message-State: AOJu0YzdtytqcsbaX2MMNy0oqaT0vMk+hs0hAGwsYqDJLZOe10ZORtaz
	lvA6i3A4Vv2sukIlb+ZnUJhITL9cp/GDTwAahE6Ded8xVvYhPZ15xKx3CVH71y+PojMX1XQx6ew
	FSfvp+IPdS+B4p4Q1uzizPRDZeHUQ4MXqNJB0IypK+cBlDmWvrd2tUlRe6gC5S8ddQw7h
X-Gm-Gg: ASbGncvoyY10Y+Ist0/+8jaNZTQRW7/aX5ByX940hcm4eX0s7HQzUszZFAdrBo4OaAB
	NCKfeIpMOIQ2ANa9Za758ML8MNs5J3/GPtFGhYugouBlInsqSx1KcYqfx1aCdw8nRJA9MVb6kWw
	MlQjzZTn0ztFZWIHmAat1Jw+fgCz5pbYVmj6ZGTge5oGi5U7QFxcbRvqf+t45ZbXpdhkDnWqfWN
	BvOK/mMhFncDUycYLEQ6rTX0TLhLbks+90+XOOqfCV9C/L/NRN4ALnOlawlAR9/xoAxIjU0OQIG
	ImSy9O7SdbxClZrWTU6M9YNyi59fDFxSvtKBKYXOUba7oqfpbwDiOF6/Om8bJbd3fxNWDaLF+5h
	TZ51tkf6Zj5ouaVXtX/ozYJlGQBrpR2HDJsKW9VlnCxkdhw==
X-Received: by 2002:a05:6a20:72a4:b0:246:354:e0ff with SMTP id adf61e73a8af0-334a85242b0mr26308721637.8.1761123682225;
        Wed, 22 Oct 2025 02:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrlAYEvjmvObgyZJEcggou/JfliOLpgFt5Kg0VJQSp8IlUPjr3+XSTnue892eZTAwBzkWAUA==
X-Received: by 2002:a05:6a20:72a4:b0:246:354:e0ff with SMTP id adf61e73a8af0-334a85242b0mr26308680637.8.1761123681758;
        Wed, 22 Oct 2025 02:01:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cd9005e2dsm2273885a12.9.2025.10.22.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:01:21 -0700 (PDT)
Date: Wed, 22 Oct 2025 02:01:19 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v5 6/6] phy: qcom: qmp-pcie: Add support for glymur PCIe
 Gen4 x2 PHY
Message-ID: <aPidX8h5z7/A059s@hu-qianyu-lv.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
 <20251017-glymur_pcie-v5-6-82d0c4bd402b@oss.qualcomm.com>
 <rxju35izazp7zrzs6vyy2cxuynzc6k4i4iot5pjahwl2bfoka5@cutpfodvixmp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxju35izazp7zrzs6vyy2cxuynzc6k4i4iot5pjahwl2bfoka5@cutpfodvixmp>
X-Proofpoint-GUID: mXKIyXr2_c2gcrSrQgqmXKc5bfQQhQ1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXxzHQmJLt3fbL
 nGHhG+E3X+aFBPmOv/wGHq2rjKmJuFo8A/yec1daq4dJdfoSGd7ZNukcbJ/g+GOk+BPJhHDAVFT
 DQFYrK63aLK7goqoBc0T0wIyfJyCVUEBM4SiBWqFogelha1rEEs9eJrVfwE5cFG00YvcsYsyGae
 jD6xk4pQRxRR5htS8xOWYxLkJ+KdhRQawZvblPhRgPv5asziEAL1iiIN7FwsrfSngeVFAs4x9ej
 b4qGJL09rT+y+Z5jrho+eibAu0ks4RKfEnZs5zk+54DesjNEAjAozWSKRj3z00X3perhto4kq+f
 gPJwMtn2FD5GpToDDsrsO4kx2KA02Hk2p3iZJ7xDqEDXIGqmnGe/GIp0EdpGVnqSgn7GgXNoysZ
 AJ3RWl3QOVbBSwXEN5pfxVx3QfwY8g==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f89d63 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=YTQ-dMB4pklsVi_CFI8A:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mXKIyXr2_c2gcrSrQgqmXKc5bfQQhQ1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Wed, Oct 22, 2025 at 11:53:01AM +0300, Abel Vesa wrote:
> On 25-10-17 18:33:43, Qiang Yu wrote:
> > From: Qiang Yu <quic_qianyu@quicinc.com>
> > 
> > Add support for Gen4 x2 PCIe QMP PHY found on Glymur platform.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Since this is something I already sent upstream here and it is more correct:
> 
> https://lore.kernel.org/all/20251015-phy-qcom-pcie-add-glymur-v1-2-1af8fd14f033@linaro.org/
> 
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..2747e71bf865907f139422a9ed33709c4a7ae7ea 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -3363,6 +3363,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
> >  	.ln_shrd	= 0x8000,
> >  };
> >  
> > +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8 = {
> > +	.serdes     = 0x1000,
> > +	.pcs        = 0x1400,
> > +	.pcs_misc	= 0x1800,
> > +	.tx		= 0x0000,
> > +	.rx		= 0x0200,
> > +	.tx2		= 0x0800,
> > +	.rx2		= 0x0a00,
> > +};
> > +
> >  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> >  	.serdes     = 0x8000,
> >  	.pcs        = 0x9000,
> > @@ -4441,6 +4451,21 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> >  	.phy_status		= PHYSTATUS_4_20,
> >  };
> >  
> > +static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> > +	.lanes = 2,
> > +
> > +	.offsets		= &qmp_pcie_offsets_v8,
> > +
> > +	.reset_list		= sdm845_pciephy_reset_l,
> > +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.regs			= pciephy_v6_regs_layout,
> 
> Definitely not v6 regs here. Needs to be v8.
> 

Hey Abel, please ignore this phy patch and dt binding patch for gen4x2,
Krzysztof reminded me you have posted patches for it.

- Qiang Yu
> NAK.

