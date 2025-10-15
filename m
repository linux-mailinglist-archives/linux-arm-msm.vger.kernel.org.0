Return-Path: <linux-arm-msm+bounces-77265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E7BDC029
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EDC3E2BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 01:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401F92FAC0D;
	Wed, 15 Oct 2025 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtLmbErP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987782F9DAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492545; cv=none; b=QrplDkRyVazPZbGjXDfBHRlu3H4jtseQWTwBJeU/ZhFXD1O8H3vozUJppMpkHb1gZHr+u6raa+ekqGQMXZfjMuf98f4Mf0LosEv/REwld+r5aY1tICAqO37KDBviIDdYzVle6rCrVyGDr3c/515Hv56TNbjNFL4Y4V2Hs3aY/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492545; c=relaxed/simple;
	bh=n4F91oo8qdS4z7e7r+5rp7FlOj7EMBYBE1Q1UITF7cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw21VcC2YEdoxS7SZmQzP9sbxASaWKkCnRTf3re0ohnhkD9nJMOG1pZkqtCNlnEuv9NZf2xCG6dE2yyyY83Kq5+SLlQnW9l9rr5FR5PCnC/zmiQ9joGzqIXPDcLg93r2k7AoY01egxztCZKeF4jIWSZVIRYxREkqh0cm+ns5izA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtLmbErP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR4JF015310
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4yzH2jg9a45gSQQ9qcgiuKVk
	rAKqNZa+ZRDXMqcKqyI=; b=WtLmbErP+4GMZ33mTJ3TZMt+QbvIVHuos0pSv5X8
	PRkumE2ooiycyK7rHqwY5bkqWO7j9s1JNoOEwYqvgo1y4Bg7rK6AkbKiedQN18Mn
	1bE7V2hjrvPNdA12y8kx28h812Lakjc3AYgHT23TufZ1olW0msZFQ9zqgYMHqJlB
	oR94AW+nAuZrBiHsjonUgzBtBpi+cMzxiXIyZNy2qJ3h+9C49dgP7aUW80mYJQ/d
	PSRpfx7/u3TY0LOtjbWwsdhdRLtO7bCQXXDfJJpiCGXB6SqdDi0biieCC07wzG88
	AABhx4SXozewgdk8U9Gj1k9HxC7U0U7RbMSuDyej3KCi0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c2k7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:42:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27c62320f16so118413155ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492542; x=1761097342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yzH2jg9a45gSQQ9qcgiuKVkrAKqNZa+ZRDXMqcKqyI=;
        b=YSZXaC5vTIKLlgKIEnyh3ZmC09XDNIn41MxhO4rhnytslUC1ai564I0oMM+LJFrzOG
         NuPJ8BDCMTbXzZtsg4nxjWkDzy/hyA/zT6tc4GLHEejaNXIxBeOcbf9B9ZUO2CjP34WF
         FWZidyUAEYgRYWnG36xr6JFZLVPIMnuGpGcXNp4b0VlRUSfFWeIaEep7crOn+EjK4gav
         aEAOBDZSy6EdZJTb3meic9TxEBuxYDO36GSjtJJ8BmUxRhgDjt/hW7b8EWYk3pzgd3Kz
         FgRp3b1r0OpeyPReuemYABvHN2liNeRbe9JzpI8KOdtbKl5RgEG6Xs+PHSBMMyzDWoKl
         cabw==
X-Forwarded-Encrypted: i=1; AJvYcCV6V4J6uboMEgpcdQ10qMsPjx6dV8j7PAmQMOnfR8pNOHRoowyA3VWkDHl96NxybOGi58McOqhKj96210pD@vger.kernel.org
X-Gm-Message-State: AOJu0YyeApJlk9SG80l6EP8sJwoLHaI+jIdi9M4bMWPdls22sf35pcOf
	FzZCtm/BvsXUymxTrZ84g0Eu8EBaQWh7+hflc/sL7Ut/s6Muya8imTm0K7Tsh5NQzE6JhlbA2+K
	ARuJoPY+M3w0o6pl/zHPtyieThdCqab/LghAP8iT7a2XltZiyzkZ3r6ATdG72YC5ezVVx
X-Gm-Gg: ASbGncsU/5EfLq8aaqXepE2lR/cYmIdOeWHVZyA2kq5HcNx/+Vrefa2AR6otoE5YYkB
	o6L1nc20O4vlaaO5BZlHxQz/tlCMTCYMGOTtS2KbkfYJTCjJFA8tJbjF8jSmpb1pn93T1zxySIO
	OJ3sLfG1kPLFKP2E75oufJW1vAzc4JF/R4HJT9+n9okKZV3A8zAYM5RieVUIQrTjS5RWfRoOdqg
	u2RMb9SfNFpr4fmaCm/nPSutcDDGdCYx6QJT4mDJCcjIJsCkos6XxKevdWnYM2GMmbIYYsNf1GP
	tnNEKQRSkxRrH0EHwkDntk1mCrzNx8L6jZBp6UdaI+eYMRIRg1knqeAT/QmnWd0AhdOVUMQS9OD
	2ETGrEXpWpjs=
X-Received: by 2002:a17:903:37c7:b0:269:8edf:67f8 with SMTP id d9443c01a7336-290272ff5b0mr330503125ad.52.1760492541772;
        Tue, 14 Oct 2025 18:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd26Ya7KeB0vsQUfEI+ISuhvFzMq20QrNpYS1F5gorwosC6uljCBBbCbaNjNXiab7DgFLXww==
X-Received: by 2002:a17:903:37c7:b0:269:8edf:67f8 with SMTP id d9443c01a7336-290272ff5b0mr330502815ad.52.1760492541311;
        Tue, 14 Oct 2025 18:42:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm177801145ad.12.2025.10.14.18.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:42:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 18:42:18 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
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
        konrad.dybcio@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Message-ID: <aO77+ngliPXjYhKe@hu-qianyu-lv.qualcomm.com>
References: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
 <20250903-glymur_pcie5-v4-2-c187c2d9d3bd@oss.qualcomm.com>
 <w2r4yh2mgdjytteawyyh6h3kyxy36bnbfbfw4wir7jju7grldx@rypy6qjjy3a3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w2r4yh2mgdjytteawyyh6h3kyxy36bnbfbfw4wir7jju7grldx@rypy6qjjy3a3>
X-Proofpoint-GUID: Zuj5ddvxh3GDkdKNHeqkGKF7doAwttCW
X-Proofpoint-ORIG-GUID: Zuj5ddvxh3GDkdKNHeqkGKF7doAwttCW
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eefbfe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=NBXR9N2l4VvmmIVneRwA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXwbX49eXQpPtK
 h/lFGh07cA7313/yD95AzJBfZw6jAZH0MUF4nDBYDqI8/eyKNR4QEJerw9ltVVlkq8kIvw0yvvE
 XBsIZ8di1ZU3mTA+gF4zNsMuA+Mo/GfyLBRHjMC9qJJH/rfXkiYm22MgP/f6iKRIh/cssdxUwQ9
 QkL+6MUhroEtwQigJZpoaeAxrA0K7fjHQOn6crQ1+dJDSWZpC5G08n+WYsB7l6Q442yMNVqOlP5
 BhWdnIR8GVFnjnv3FHq8JXpyswQDSHqwhlduGKmNvVE7kQjwm76thpRFFcvXyOhg4HzyY0aPnur
 G5M+9weqAkBBHjMOkkflv0Sbk6b6+G7CKX0MPSQDzT4/CHMRCJny2FS7qaWAspgITTE7jX+ZHuU
 BLJ9tDz4QC+f+tG4fqsGzIl1RHnZ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Sat, Oct 11, 2025 at 03:15:56PM +0300, Abel Vesa wrote:
> On 25-09-03 23:22:03, Wenbin Yao wrote:
> > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > 
> > On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
> > controller present on the X1E80100 platform. So document the PCIe
> > controllers found on Glymur and use the X1E80100 compatible string as a
> > fallback in the schema.
> > 
> > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> > index 257068a1826492a7071600d03ca0c99babb75bd9..8600f2c74cb81bcb924fa2035d992c3bd147db31 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> > @@ -16,7 +16,12 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    const: qcom,pcie-x1e80100
> > +    oneOf:
> > +      - const: qcom,pcie-x1e80100
> > +      - items:
> > +          - enum:
> > +              - qcom,glymur-pcie
> > +          - const: qcom,pcie-x1e80100
> >  
> 
> The cnoc_sf_axi clock is not found on Glymur, at least according to this:
> 
> https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com/

There is another dtbinding patch to fix this issue

https://lore.kernel.org/all/20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com/
> 
> And dtbs_check reports the following:
> 
> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): clock-names: ['aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'noc_aggr'] is too short
>         from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
> 
> One more thing:
> 
> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): max-link-speed: 5 is not one of [1, 2, 3, 4]
>         from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
> 
> max-link-speed = <5> isn't yet supported and of_pci_get_max_link_speed returns -EINVAL and sets pci->max_link_speed to that
> without checking the error.
> 
> So I guess fun stuff is happening based on that later on ...

My bad, but at least on QCOM platform, we will get max_link_speed from
config space if < 1.

if (pci->max_link_speed < 1) {
	pci->max_link_speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
	return;
}

- Qiang Yu

