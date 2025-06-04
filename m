Return-Path: <linux-arm-msm+bounces-60200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8528ACDAB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FAC3A50D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BAE21882B;
	Wed,  4 Jun 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYQVe0Cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC05719ABC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028547; cv=none; b=XlLMUkkYCPVCh79iIU1lwoqYsJf+i1SuuoEab30nyo7sJysGeoVl5/j55PHzvd7yYfaZKHF0SnjPkhbiAJWZMQlAY5LTMZSwwXKPB6Kjj0nS0Y9QCP5H+Wiwvtu9lxBAYRJUWc8nmOUHt3vXBXCNsjpq/5ykP58tEY/9gv1254c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028547; c=relaxed/simple;
	bh=wtbK/c960FCVkZdDZijesw0w08Lsk96bzznoaXRvUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNYkDpW/h+2uOb+VuLerk0pLm4h2/uIStcbr3EXY8vdEIJK2EuJrca95xnJK6jgiPc33SddC68mo8dpoKmbT4apwhkgBiefXFDbY0FFJyiZg4a11gkAhfT63iMYWs7ojPsTrBXXgwqYVTpCx25WlN8EH7fz04F97dr5mWZHupQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYQVe0Cs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55475vic032316
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPPFsiJy+20CJQxcYQxqsy1auSOoSM4WU5ICkQfU8Ik=; b=fYQVe0CsdVilowuY
	OtobuCzUw+CnRbC++SF4DuU9Va9Eu+OTxOXcS1buG/gbWuKVbWLUZNBDZpoRrG61
	VBbThzHVe4eMuCLToa1ss9SwSCZ6IPDpEsyT+oK5Y48SF6Uj8Y8NeAjj59IuzOyb
	1RDxtYkOnmC3Pz3blrt/1yJ94cQec+uH4OQT+kmwD4vXnKFzOULi8ySf5nFsh0L3
	IOuWN5w0wEoTFf9u2Bsk6QmHZZOnszQNkbjsthCIQkgF3aZpM7Zy14lukLAAQdhn
	mbThkmyZurTUl7r4Ce8lCbviLw7gnIFrn2DA0aCedQGL86UXsc2jOm7CS7d5sZUA
	Co5tIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuvbm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 09:15:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad5f1e70fso94172036d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 02:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028544; x=1749633344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPPFsiJy+20CJQxcYQxqsy1auSOoSM4WU5ICkQfU8Ik=;
        b=pm88HPN9WyGO7xhnlBTGg+2UnSzjCHj/j7fEhJWcoWCFodI+otBGY7bT5Vq5oc0lzf
         VUqW9OAk1YYT1iY3H5bK4NlSSZESjaAfZp951trbq7nd3lr75W0/0fOvvW27SjnUTTuo
         WkYmQJfJxM005vQuoJ7N5m7S49AgiQ1YYAYe2cFUymjExredVCQKqCYS3oT3BJ2p3PuS
         tvwt2VMOEW3gMOkrDk7qwYlUC4xIxqNaS2Zy4fDD1uxdEE852pq9wkgMeO57K9vthLJI
         77KpwQWpdO0UE7zZIx6EFDeFSVax06ahreaqIZTFg6afN69NqNRiaks/OrGmWcW5EU3M
         U0tg==
X-Forwarded-Encrypted: i=1; AJvYcCX+16GwRFJH5JU2BVzgLcFsl83ngEsDjYWiU0WFN61EVI+ivOPXrusU2xC2NsrEPb7U9jnhAYAUM/gUYn78@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FzE6qBgXprbWpXQzA4rTDZlb/hWwceLNWx7nbcwhM+2JJjs3
	icWiAO2449TFTZUD0JEIRQFMBZldPEGWla3Cy3pwGB4yKilKQXIxJ+PXYQtrm6j6Rg/GluXOYCP
	mSRYJ6zj+lApeRfjmIe/76x80HHowMi0ObRMJYXQiMb1LjCFgus8Muve76wu8z1f9yP5T
X-Gm-Gg: ASbGncuTDn1MJJWLf8UXb327zQOkYGsMz61+RzcMZM4IcPUd8b18jO0M4aPMHVNIWvg
	eHbpdlsLOvjmqGylOvv6Ftr2VR8KrgFsf31g8tqpy+jj4EAFoAKhfCByzK2K2DRV5qCLkCZ/uyl
	Y9t9rCsm2e5DbPW2FMtori2kj4+0AzBtdaeAfBYjdFQ2s156g8LLxDrAItFXp4Pb6vScKJQ20To
	+o4Xm0ty4jTucbwjT83AGx232ObJRsaSFabRgJaxqqG8PohFEmvSbN9vYr8mxa66JXYCfG/pxDL
	Hrb9nICJpY7w1BY92n5MWnrEHcKRQT0iWPvIRh3gnYB9YA5JBga/XpH9niZOxxmGldP1nXFn4mA
	=
X-Received: by 2002:a05:6214:2a48:b0:6f4:b876:5fb8 with SMTP id 6a1803df08f44-6faf6fd1defmr26946216d6.1.1749028542946;
        Wed, 04 Jun 2025 02:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAy3lVFCTyFps38PYh4Cu1wvRMN2LoHwLW+6LfbUHP84/5730hlAgclrnqK6LGU+oqn6V+sA==
X-Received: by 2002:a05:6214:2a48:b0:6f4:b876:5fb8 with SMTP id 6a1803df08f44-6faf6fd1defmr26945926d6.1.1749028542461;
        Wed, 04 Jun 2025 02:15:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b55f88sm21033831fa.55.2025.06.04.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:15:41 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:15:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org,
        manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
        krzk+dt@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document
 link_down reset
Message-ID: <34dnpaz3gl5jctcohh5kbf4arijotpdlxn2eze3oixrausyev3@4qso3qg5zn4t>
References: <20250529035416.4159963-1-quic_ziyuzhan@quicinc.com>
 <20250529035416.4159963-3-quic_ziyuzhan@quicinc.com>
 <drr7cngryldptgzbmac7l2xpryugbrnydke3alq5da2mfvmgm5@nwjsqkef7ypc>
 <e8d1b60c-97fe-4f50-8ead-66711f1aa3a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8d1b60c-97fe-4f50-8ead-66711f1aa3a7@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68400ec0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=nH4wTwwcQCLCZoaC2lgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Wh13fd80Gi8TDUNoJwXJv3ZR5_6HMIVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OSBTYWx0ZWRfX/QfVijdhuN+G
 TAuL89kv/GP2xxwHJMLsU8o7YPj1ujVq3p7F8OTDn6MIseWZQy4PzihlILjUtQEH//DCYNoubB+
 pjTfKHKLWtxC5rwJ3/Gm4X3dLhI+AaIybmc5r47izGcWRke6Bcj+32j12621eOSpHXz2BhXQkn5
 FIyW8tpo/oRiZTBAzSNho4yQyYCBgxXtt5wDJwO1Ih4md2oWqItX0VYxiSrJ1tbIbbbtmGQPOQm
 /7VnzGN+MHxNizSjSTxJ1jcRy1AHkroJ/AAS3fA/Uc9OMnIuVJBJwpS0iJx9MthyCiP8wGR13oP
 AcbPWefuFWWGJ4Z0P7EUchK7r3TUW6d1RtRgUyQ7vff2HQWJyEHyvKLHMyiEKUtDPFHItMFJEku
 i5nh8yKWcLad7Pa2E5BwkfYbBgEOgeYG4Sr1xqjr/s2qCgCGIgq6lEsyyNuIyQmZdjPLsbYu
X-Proofpoint-GUID: Wh13fd80Gi8TDUNoJwXJv3ZR5_6HMIVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040069

On Wed, Jun 04, 2025 at 03:58:33PM +0800, Ziyue Zhang wrote:
> 
> On 6/3/2025 9:11 PM, Dmitry Baryshkov wrote:
> > On Thu, May 29, 2025 at 11:54:14AM +0800, Ziyue Zhang wrote:
> > > Each PCIe controller on sa8775p supports 'link_down'reset on hardware,
> > > document it.
> > I don't think it's possible to "support" reset in hardware. Either it
> > exists and is routed, or it is not.
> 
> Hi Dmitry,
> 
> I will change the commit msg to
> 'Each PCIe controller on sa8775p includes 'link_down'reset on hardware,
> document it.'
> "Supports" implies that the PCIe controller has an active role in enabling
> or managing the reset functionality—it suggests that the controller is designed
> to accommodate or facilitate this feature.
>  "Includes" simply states that the reset functionality is present in the
> hardware—it exists, whether or not it's actively managed or configurable.
> So I think change it to includes will be better.
> 
> BRs
> Ziyue
> 
> > > Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> > > ---
> > >   .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml  | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > index e3fa232da2ca..805258cbcf2f 100644
> > > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> > > @@ -61,11 +61,14 @@ properties:
> > >         - const: global
> > >     resets:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > Shouldn't we just update this to maxItems:2 / minItems:2 and drop
> > minItems:1 from the next clause?
> 
> Hi Dmitry,
> 
> link_down reset is optional. In many other platforms, like sm8550
> and x1e80100, link_down reset is documented as a optional reset.
> PCIe will works fine without link_down reset. So I think setting it
> as optional is better.

You are describing a hardware. How can a reset be optional in the
_hardware_? It's either routed or not.

> 
> BRs
> Ziyue
> 
> > >     reset-names:
> > > +    minItems: 1
> > >       items:
> > > -      - const: pci
> > > +      - const: pci # PCIe core reset
> > > +      - const: link_down # PCIe link down reset
> > >   required:
> > >     - interconnects
> > > @@ -161,8 +164,10 @@ examples:
> > >               power-domains = <&gcc PCIE_0_GDSC>;
> > > -            resets = <&gcc GCC_PCIE_0_BCR>;
> > > -            reset-names = "pci";
> > > +            resets = <&gcc GCC_PCIE_0_BCR>,
> > > +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> > > +            reset-names = "pci",
> > > +                          "link_down";
> > >               perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > >               wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

