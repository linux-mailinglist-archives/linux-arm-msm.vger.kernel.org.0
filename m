Return-Path: <linux-arm-msm+bounces-80451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FAFC35C2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 14:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4807118804B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C5428C035;
	Wed,  5 Nov 2025 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7FUgNbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up+Vr16P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DE1315D5D
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762348060; cv=none; b=KRkc9Vt3zmwlH4x2tcVhHHfVXeCsZcDCHJmkMs7dYbEcUEODx/FLgPZAURvDVbVnN5/b+JR05vbMCFps/P2SUll2G1vfhO+zL3cvoaUw9cRn20PS7wPScVZ/EGW2hqo0hMrVHXTN+JI5J2uytB83EQEavZdsKpUgLxutjo/GXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762348060; c=relaxed/simple;
	bh=klRtdEIvbZyJbNGYRtKdKDSRIVBFJV55P0Mt9NI5eL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL92d4VGLBu6kwgdjC5yodT8qUL8UsYE5c+4O5iRcZR513gwidEieJowk5BS1Ge4jti2O1ApO36Xyj/qXHrarmhQKvbEy/LoL/EV/izS0JXZS6BDDhZBoPhdORassKmcsnb/B8v696ZaU8KmL3BMgFcW6QZ5cBepqu1bu9KaPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7FUgNbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up+Vr16P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58LeIJ3114829
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 13:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJyMqcmOenueo7aEWDedVgPx
	9iT9e9a7v7fXA+XT7mQ=; b=a7FUgNbPvgP57arFwM221RcL0UYGY43A5q4vxHph
	4o7lN7XsdXHRpmD/ciLIZpclP/kabdfIhuQbVqqaGbaIgfc0nZ5xNU2xiKC+CRWq
	T1tNBLHlMNE5QKLCiUDvuPY1Q3eNJ4yfMGarbKu/HWZnGTREU/xfY0CcEbMQsZKW
	LVvkR+Vb7kKbjXhKAoD5WQLI2F/nBr6oBwsO8Su43Axf+Aw4kq0Zbo7vH0AwJfy3
	wOxB55yXN7pKB4rgbxXn7Sz8OyRIjq+Qfvzv2hOR0pKVOw3OblOdV4584D5mQQDm
	oLFXPNfwTPfz5iPspjbjvhEtcYGDGC+8NJiL90uj7jFJkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7sfdta9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 13:07:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956510d04cso51817945ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 05:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762348057; x=1762952857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJyMqcmOenueo7aEWDedVgPx9iT9e9a7v7fXA+XT7mQ=;
        b=Up+Vr16PE5ZtTV6ElQ6JZBrZP9tHrLUxmKaGIlPlnU/YIhCnZ3Tq7EJUO0wYDcZ8H5
         CESRxIA2K2G6u00RP1uTJUu19FsSbxbenB4lfTIGsxMEor6XXNiNJbOOuX3J0OEyWWbh
         oa4WiHzDtiu94CwUrbPZPYx75UdW85vc/Hw/hAgLHBK/GbAPRdeKz78Bpz9UfhaV2YIf
         Ix/aVR8jKX+h9N71wl5JJuu2XF2HZQGKhnY1IZe4mx29mm79hA9ZLv/jKnm5+TcteNnX
         u0WVRNQKWYiUhJaOfic6I7HHwDJ8WxDx2BB9y+IykyD6bY9xAjZ0qvM2l9EP9Xn5YiTw
         cWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762348057; x=1762952857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJyMqcmOenueo7aEWDedVgPx9iT9e9a7v7fXA+XT7mQ=;
        b=qSLa28k1e3jv0L4MCCx5070rw1Q9VKAKwZTNJTn0WfPUGms/HvkeCA431WUBLIez7O
         5HTZKvhUFsGx4LKCvq6WAiYhLdyBj6p7LqUSAUNTajaZtdNQ8njP84Jb7B9LiTySNBx9
         jq6vK12D1lz4xaC6oT9STy8n7V0FRSBj8s6UHswkY6zJGp/E0d1Rlq95kmIP3JvJNaaa
         OMbihiUO7Mw92Ti0yGlfLP/WW0u87VKBqLAWXlxSWXP+ELnSFqqAxor4kIjQ5YLkB/a7
         LD21/DzLL1T19bH7aBKWzwV7Hs25z50w/DqsqvJHLg1cAJrTI+6Yej7g9YRcFRePme6Z
         xFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQunjcfwqPkT3TGHUHv8u/lBEZhNjPKEt+NuZCSDasESFDiWPQ+YpQ+gd0vIt2FPj45X6mK0BHyDBasE4V@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIUYAx/aNykFKsCI9PlezGpaMZmJGu3DHy9q0Fc/X7TfhkeHr
	WTiZcOe3y1kMJF6KaVmP4+E49SCh7xbv5GT12zRaHlvomRRm69vDUZtQlw5F9x8cyQDKZZmJpvV
	5pLxXUlTip5dd9s8j11HB23YPeGcPFgd4IiX1MSlGKceEV7m7VI/Ej0zJR+nRKikwtqJ8c5YJn3
	rS
X-Gm-Gg: ASbGncue2H9UiyPdHSukCCuoeDcxZ5uPGWjOy23N/W+Uo/29tCepBXul0z872YkgSK/
	23V/cNLDo/SWSWnApKTevnGIcuPTT395l0II8+fC6Vqaedq7Nbx1P2QmVU9UQU5arjoa62i4VcR
	L0ydcUMLZPoTlSniz4BEUVfvC3XluvamO1sVDcFUiRZ1N45WcV3XNGFxC5PJzElfzenfetlgYeq
	aSbNKE+CoXwkpuMFOpRpsmvMb9GXEAHo7TwfEbQ7PFs5NforNqOKjm5Yq7DrI3aM8BgD0LLnDVw
	DhxwizFuHJk06AEbNLYsYlJgP2DtifhGWSTNR22jKxun3XR2je4pd/w1D9u5SkE5s83kbXklLoR
	HmXnMJ4/wngchLIvY6X3ovzWoqOnxItS3Gusgm3r3ilqjsD9ILLH+I0CbR2Vq
X-Received: by 2002:a17:903:3d0f:b0:295:bba:9734 with SMTP id d9443c01a7336-2962addacc0mr44990915ad.24.1762348057083;
        Wed, 05 Nov 2025 05:07:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi1VhR989ZZ4vIFZKd8TvIl4G60NTKKZtU1PCrjwDE+njM+qU3IIPJ08T9iXL1mcYzd4JdAQ==
X-Received: by 2002:a17:903:3d0f:b0:295:bba:9734 with SMTP id d9443c01a7336-2962addacc0mr44990395ad.24.1762348056531;
        Wed, 05 Nov 2025 05:07:36 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d174sm61765875ad.77.2025.11.05.05.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:07:35 -0800 (PST)
Date: Wed, 5 Nov 2025 18:37:30 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <20251105130730.pr5j63wfseaa6ubr@hu-kamalw-hyd.qualcomm.com>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
 <xg6x7vulzjtiqnzu2g3k4phhi3og537cwu2quwqgdlpcxoggwt@pqmfsvsumt2g>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xg6x7vulzjtiqnzu2g3k4phhi3og537cwu2quwqgdlpcxoggwt@pqmfsvsumt2g>
X-Proofpoint-ORIG-GUID: q_VzTyv9-gSrL2Sjo1NOFe38Nv1v83GX
X-Authority-Analysis: v=2.4 cv=MMFtWcZl c=1 sm=1 tr=0 ts=690b4c1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xrU_pXCrs3kvcMV52VkA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: q_VzTyv9-gSrL2Sjo1NOFe38Nv1v83GX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX+QsjqI45Zyib
 TFwKlAt/HkdNSdzAmfqRo7mNjLD2EZ/Yv6Wny/92M8DLRvUjIg3+mJAJ/wmqrT6kxHJGyoBlOcN
 tSfVGTpCtEBxGUvjCteC6ORIDEDBKw62P/YNnMbWMQwpYw2iqX55dmxPbm0RrhwPe6F0ajmZlS9
 /9BOqSoex2bnxc3FJ2MN0AueWSNklmMSI+ts2TlBHTCeFvXodLy5d8mVLsyFM0fuB8BqVwp5hVE
 q71ozMMmGjiFGBmCoi7AK0du1vSv6Ns0gJex8btS5gIIznOqS1ZwFBcRQ4nLopu0FZW/uMD0dUB
 XT8hpsryigqES08c1WhVZsm8AIAjn4odFgqp6vNILQt1YhX8rWxTTP6EK8ZdKE3HLuf5joI4CMg
 a3nRHiSkZkT8Io31eLhWjEY3ATRROg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099

On Tue, Oct 28, 2025 at 09:14:10AM -0500, Bjorn Andersson wrote:
> On Tue, Oct 28, 2025 at 09:36:09AM +0100, Krzysztof Kozlowski wrote:
> > On 28/10/2025 09:29, Krzysztof Kozlowski wrote:
> > > On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
> > >> Document the Kaanapali and Glymur compatibles used to describe the PMIC
> > >> glink on each platform.
> > >> Kaanapali will have the same battery supply properties as sm8550 platforms
> > >> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
> > >> Glymur will have the same battery supply properties as x1e80100 platforms
> > >> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
> > > 
> > > What does it mean "battery supply properties"? Binding does not define
> > > them, so both paragraphs do not help me understanding the logic behind
> > > such choice at all.
> > > 
> > > What are you describing in this binding? Battery properties? No, battery
> > > properties go to the monitored-battery, right? So maybe you describe SW
> > > interface...
> > 
> > Or maybe you describe the device that it is different? >
> > >>
> > >> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > >> ---
> > >>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
> > >>  1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > >> index 7085bf88afab..c57022109419 100644
> > >> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > >> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > >> @@ -37,12 +37,19 @@ properties:
> > >>            - const: qcom,pmic-glink
> > >>        - items:
> > >>            - enum:
> > >> +              - qcom,kaanapali-pmic-glink
> > >>                - qcom,milos-pmic-glink
> > >>                - qcom,sm8650-pmic-glink
> > >>                - qcom,sm8750-pmic-glink
> > > 
> > > Why qcom,kaanapali-pmic-glink is not compatible with
> > > qcom,sm8750-pmic-glink? If Glymur is compatible with previous
> > > generation, I would expect that here too.
> > 
> > And again to re-iterate:
> > 
> > If X1E is compatible with SM8550 AND:
> > SM8750 is compatible with SM8550 THEN
> > WHY Glymur is compatible with previous generation but Kaanapali is not
> > compatible with previous generation?
> > 
> 
> There are effectively two different implementations of the pmic glink
> firmware (in particular the interface); one designed for Windows
> products and one designed for Android products.
> 
> Then for each implementation there's incremental additions over the
> years.
> 
> 
> By not accounting for this in the fallback compatibles, we're relying on
> a growing list of "specific compatibles" in qcom_battmgr_of_variants[].
> 
> In addition to this, we have the addition of USB4/TBT support in Hamoa.
> 
> Enter Glymur and Kaanapali, the implementation has moved to SoCCP, so we
> should no longer do the PDR stuff.
> 
> 
> IMHO this binding should have fallbacks for the major "versions",
> mobile, and compute. But perhaps even for compute/usb4, mobile/soccp and
> compute/usb4/soccp?

Thanks! this makes sense. Then should we do this way..
- We do not touch the existing "ADSP based mobile/compute" items
- Add 2 new items for SoCCP based targets for - MOBILE-SoCCP & COMPUTE-SoCCP
like below?

      - items:
          - enum:
              - qcom,milos-pmic-glink
              - qcom,sm8650-pmic-glink
              - qcom,sm8750-pmic-glink
              - qcom,x1e80100-pmic-glink
          - const: qcom,sm8550-pmic-glink
          - const: qcom,pmic-glink
+     - items:
+         - enum:
+             - qcom,kaanapali-pmic-glink       /* MOBILE - SoCCP for pmicglink No PDR */
+         - const: qcom,sm8550-pmic-glink       /* battmgr - mobile    */
+         - const: qcom,pmic-glink
+     - items:
+         - enum:
+            - qcom,glymur-pmic-glink          /* COMPUTE - SoCCP */
+         - const: qcom,kaanapali-pmic-glink    /* pmic-glink (SoCCP/ No PDR) */
+         - const: qcom,x1e80100-pmic-glink     /* battmgr - Compute    */
+         - const: qcom,sm8550-pmic-glink       /* ucsi */
+         - const: qcom,pmic-glink

Regards,
Kamal

