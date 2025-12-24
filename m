Return-Path: <linux-arm-msm+bounces-86584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F05CDCA47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB9E302E144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0E13164BF;
	Wed, 24 Dec 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRN5Dlpi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkrAwOQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE251346A1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589285; cv=none; b=VLrbAkZtVt7xOlMekPV3BOtfM9VN7oKmh/xygONr6HxMOz1l81hwKlbnFoUqfdL739LGYpkqTopb/GcL/6h+Dy/elMJXlKnIsCO92dAhjbzoNFUYiQWnDb33jSBk0zvsI0Cv2MWVJ4uX4AQ61N9fERaZoa2By24OUxoc+ispcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589285; c=relaxed/simple;
	bh=C7VyRgzu8Sv7En4v0737Efe3C7QajOA1haHUuWuktfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNMGeEZZCyz2M5qKIGFfgnr4ZWgIlPIdo0goVrYyoLi5GTZ4R1h2wYSMxQTyTeDRQAC0OVY2TNPHhk/on+T8Ep+JTkJkns6DtpnNMIeYjYN+i9SKKG9fSVu8gy3KGajCdvfPF9bGenIEHRz7+xOp12bhG3RwoQ29d7hmy7Tgav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRN5Dlpi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkrAwOQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5bwFZ1018062
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKM+jRWTC6pwMTUDyLDny66VCClXvGBoExeSimYocjc=; b=GRN5DlpiY3hSf276
	jkiZb5F24YTFcTiwK9W9mndw1r2i4LQZIJ9Cd2WyvscJUj+COq72WzZxIDs4JmlM
	2g8EeEvfDwAXG6skn4+hHl+D7/whOTULGz/PE/OmnhKYNHHiRgcK9Il7qXsfL528
	bX4urAidKQTDAgGMBjTttV1g4V4X2tRm4C2rLty4sj8uUEzElKolfSaFpwvZv1sD
	3a2NIUu7ocmJ+qyy009UqA8c8DsKBe79rDcFvKGYyURhOVnhMLtTThH2dmlBxpOI
	csOmNZi/V4bhemV5rnphcPBJ8GhUtUYJN7ecdeOSj1d4pPMDQEmGXvF9GRFScHFG
	2UJOBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsb6g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:14:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0488e746so129725371cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766589282; x=1767194082; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKM+jRWTC6pwMTUDyLDny66VCClXvGBoExeSimYocjc=;
        b=SkrAwOQOePFkPUap8SPqwjGyn+qdWnyS881ywe453x5FINLkszB1TeaYIQJabIXRv7
         +OWFy/SvOYZ5zMOdQ3rHFqAtPGF9VwNwmMvMTQVMnd9bFzu88QYfXGD/udE4YIxrpUwu
         0Lvm3XbPle6M3IiBmVKbiruvjFliwJtFnogTz3CG+t3fAXOQ8cNCcLR+ygS1P20Q9SFb
         oIheW5aDDTotLO802m5QZ1BXRwD96yxTJToLCaWXf3V8smkHdAPtyi6UGOY1FXFX4PvN
         zJqlAqCR7njD2329hFZiWoqc7xBRqEVjfhjLs4HJb0NvrTNkcg1ItBg2AAKeeRGdtipu
         kYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589282; x=1767194082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKM+jRWTC6pwMTUDyLDny66VCClXvGBoExeSimYocjc=;
        b=WgsDstFJYadbHXKKDosuyrf18xppJdqevkbmglSNbYqoRl5oSCZMg1lFIxIaXqPIWL
         iTDwhQv4hbNFqjbpRPz5q8QwB00Jn6MlQElxOvR6uLrBTSKPJPK+P9x4L8YLhxnlNpyG
         9Nls/Q9Iv0RnO3FUgrqk36X29T/qv/eik438LU3ZaOGpxVaPQlZKmZr/PaKg7KRC7w+L
         +0OHAO12S/M9VMotit7Evc67ne6dHrnNUbd003cejI/3tgRifrz0eRfRiXOE2K8SFSEq
         43bHYQEv9zl7F3E5jppMVgFMsql2MSiKA8q/fgKsc9hvcIWaZFGJ0zgYPQsjOdRXCoNR
         GVew==
X-Forwarded-Encrypted: i=1; AJvYcCXJuZD9VY+MuarVMnhLJxrIX4GGKUsJxnTwzK20GkcrvAXQq/N/1ACI41SQuJONRqvFBK33HyhrmoUVzn/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lIWe1HPrdrsNhi+urYa9WoyH6RR0pn+f+OLNsBiCHX+0CWHO
	A5Ug3x1uY2FCXKoG0cAQhO8EFZ7Yhur3aTyD8BQk/Rb8e+ROJaUnpQDIO18AG3q1MFw0whxjrOH
	IB6x6hwDPd7QzvGD0xXVJhJL3IXpMowpIwgMCWWslPu0zhBS5B2fy4i2LjJNVpm1fHLdV
X-Gm-Gg: AY/fxX6w5a6gLE8BsVBRHLizlCNqPbe1yzKC2Lw4tgQrfvKnvy/E+ghoDJ7xkOiy+DT
	0ySBfZxKki/597B1CBfkFFAMyNAGXrEkZAFyV1hgK8MOwXDvYPXUsFHnGqm192kT5h0PSWUf++L
	IlAfe0H17hm0QxGQoW1maju5BiWenZY6uqlUqRuH4V27nKNK1s744PHTj70oVxiFUN4jv95mVig
	+YUB8/ueeQsY1S+D7zrpKMIlKTR9dvtZeZ2jcFzRfvmdrYN+m9uRNj4wEFwds9El79I7n9OrF0i
	i63RGdmHQ0JL3xQzl/PwQWiIEZ00VwDeQO5eDA8Av8EKAB41y/81xpOEm1pqtHehsqtTNYP5UUH
	Q+wsvRpuYHeEbzWWQp8ntK00Co8CQzfuNww0shxPDbsLNYuKcZ0SECXrZypVTIxgKkl9WU0fjHr
	/IRRnbVdakwvaOoS8BenjdCKc=
X-Received: by 2002:a05:622a:199d:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f35f3a0267mr291702241cf.5.1766589282186;
        Wed, 24 Dec 2025 07:14:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM4HWFmqw6RhOyxQti4OTXb9IzWD2XEC7FAdWT2Mo6yNJBTwSWTrYflgNoT+TqWdbIm/XUHw==
X-Received: by 2002:a05:622a:199d:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f35f3a0267mr291701801cf.5.1766589281524;
        Wed, 24 Dec 2025 07:14:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm4981675e87.45.2025.12.24.07.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:14:40 -0800 (PST)
Date: Wed, 24 Dec 2025 17:14:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845-oneplus: Update firmware
 paths
Message-ID: <nv3uiez57xmrfpcpkvqitvnfrbs6suuqor3a3trwugpvqxvr2j@6loizlgt5l6b>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-1-a2d366f9eb89@ixit.cz>
 <a8cc09c0-6acd-409a-a907-c3809b4f4db3@oss.qualcomm.com>
 <17490007-73b9-423b-af49-b89e33ee51f3@ixit.cz>
 <4a3041af-efda-4345-8298-9602561cb57e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a3041af-efda-4345-8298-9602561cb57e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNCBTYWx0ZWRfX6c44hSlrmGOJ
 Vh4c0qj8GT/pDj2F8sHukR+5WQ62IMXu+QY65hMJUQJh4dYY/W31djKvj99e2bPsJ4H370iV5z0
 UCRCVuhSBi7pGz7P9DQKOnj5KlhpsxKQ0lLnNuZy0gyUVCyDX840G3VsjwykMOewc5f2dgFYowp
 pAbai21FzkvXqCMIIxbXIgi3vPUVS1sbMB1a0KKLBH8v0/BCUZUAiXbOzRnvgr/syQOrxhJJeuC
 gornbN0p6spxDv0nzjtk659Vy3KdkgpUAN+x3ZQ+C+NWb16o2jh7SAC0PNu17taCZMuUGDEKdWO
 MP82/hwo2l/jSscNfThZ9falcq13wVRB5V8dqiS/3mivOLF7w9OHHBQ3TaUbyq3xR/SHY2P7d4/
 HJ7yfrDjAG7BiitEBiUQB9PO0XG3cLbiFwD/kDNSRf+JxJBQJ/eu2WC+KAFCOaCUYg2rzUYTnmd
 eVAor2nx67dQx9gqCBQ==
X-Proofpoint-ORIG-GUID: a7v81FC0K1wwkw8dlgDOJ5yjOCKBDQtd
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c0362 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=_ZC-_fbanAzVBMKBJqgA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: a7v81FC0K1wwkw8dlgDOJ5yjOCKBDQtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240134

On Wed, Dec 24, 2025 at 06:48:53PM +0530, Akhil P Oommen wrote:
> On 12/23/2025 1:21 AM, David Heidelberg wrote:
> > On 22/12/2025 20:31, Akhil P Oommen wrote:
> >> On 12/23/2025 12:35 AM, David Heidelberg via B4 Relay wrote:
> >>> From: David Heidelberg <david@ixit.cz>
> >>>
> >>> Conform to the new firmware path scheme.
> >>> Includes cosmetic cleanups.
> >>>
> >>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>> ---
> >>>   .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 +++++++++++
> >>> +++--------
> >>>   1 file changed, 15 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/
> >>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>> index db6dd04c51bb5..f1c63794db979 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>> @@ -181,8 +181,9 @@ panel_vddi_poc_1p8: panel-vddi-poc-regulator {
> >>>   };
> >>>     &adsp_pas {
> >>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/adsp.mbn";
> >>> +
> >>>       status = "okay";
> >>> -    firmware-name = "qcom/sdm845/oneplus6/adsp.mbn";
> >>>   };
> >>>     &apps_rsc {
> >>> @@ -353,8 +354,9 @@ vreg_s3c_0p6: smps3 {
> >>>   };
> >>>     &cdsp_pas {
> >>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
> >>> +
> >>>       status = "okay";
> >>> -    firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
> >>>   };
> >>>     &gcc {
> >>> @@ -370,7 +372,7 @@ &gpu {
> >>>   };
> >>>     &gpu_zap_shader {
> >>> -    firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
> >>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
> >>
> >> I believe this is considered as breaking backward compatibility. How
> >> about creating a symlink in linux-firmware instead.
> > 
> > See discussion here:
> > 
> > https://lore.kernel.org/linux-arm-msm/
> > CAO9ioeW9=TPde4P=AOcQANvPv90K-9MkcRRgb7HNwe8KiOpFjQ@mail.gmail.com/
> > 
> > I understood the conclusion was "let's do it".
> > 
> > We have more-less 3 consumers here,
> >  - postmarketOS (Alpine)
> >  - Mobian (Debian)
> >  - NixOS Mobile (NixOS)
> > 
> > some of these using droid-juicer, which can be easily updated to update
> > paths.
> > 
> 
> Dmitry,
> 
> How is this "not breaking backward compatibility"?

Indeed, it is a very gray zone. There is slight difference: firmware
loading can go through the userspace, which can provide backwards
compatibility (in form of fw helper, symlinks or any other ways).

So, yes, we break compatibility, but it is documented so and it can be
handled. Compare that with the e.g. updated driver rejecting old
bindings and thus becoming incompatible with the old DT.  This can't be
worked around in any way.


-- 
With best wishes
Dmitry

