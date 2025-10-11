Return-Path: <linux-arm-msm+bounces-76838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0CBCF802
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 17:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 297AA34A89E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313C827E7F0;
	Sat, 11 Oct 2025 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MStmPpZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8225D536
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760198218; cv=none; b=bB2F3YGa351mF7zUekH1yxl+ml0ImZ3A8CsKLljkUuj0vUn/wEVFyuX8dC9sW69uTIKRyf2+UF/93Z1dWjPSrYk9s0tQq73igyCrKOK3VhIWj+Pq7vIk45I79h3y5IR/pr4ftjQiIviNg7h6N3cJRb/qq+hdGPP/p7ondFTTlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760198218; c=relaxed/simple;
	bh=kLZpOY3n1Z/K7XxdlSQiFTduuS6/5SC0CiM8PVE2Bv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NipzXNoyTHJRRLkcGZP0dyBC9MyPmjYHXV228jxgCXDcWkyYcmJHanDrDbv/ev9FlmMjV3YzBp9IfrI50O6oHwWwjMHM37JYjd66D3UHk5NNY+56tIL8TPv3dDSRAP9p/UcXpwbzcJbIij5IXVdrCUVuF1tPa92c/8pQ/NOx9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MStmPpZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4dWkb002199
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SgSlMXYO2I/LhunZZinSNKre
	mdE+cTsZbKFJGYD8eac=; b=MStmPpZ4xur+UfapQ7+BbFWX4nOGFBIMNQWzt9jz
	SJPBQT/MaZTIJghdLTHBznPz7a4lkgfzhPiy48NWxcNhmNYQT8IvgWb6VzjLEEIX
	t+zv4BUVFX2i8Y+ugkhv0YgVFzO0ePnr5OCxBKny1G286ovvgeI4vFnadjKjAq6E
	7UHjiFJDUQW9M99Sgpg7Mt50uwhfQIMGe6QoMTLI2PNuIUCXOD8pBxWyui67xaVa
	NnWjmu93AWjihJF0UIOvC9jfJwuKT5KzpsJMkI3d7KinJys5w+ny6Dwuj7ojdgEp
	YqPGJ7G6fG34YYrnEPUEeLApwyO4hJByFh4/SIb4ywK2cg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfrs15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:56:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-856c1aa079bso1714850685a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 08:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760198207; x=1760803007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgSlMXYO2I/LhunZZinSNKremdE+cTsZbKFJGYD8eac=;
        b=JGjbaUxJyhh2x7iQPoEIokh6Av4IMkxmX6oV1qjCtuw48qZJbXp1KJZbadO8cYsbgX
         KfJsCzYx4L6NJegxJTgiCP/Is3NkQ+w3shTJXHA5141Dh1zSc72YNVWNYxzJraPJQDJy
         t4AXFYmRJ/hF2O0iOPI8fG8utf0Kczxu1TgkXrVkyTnMGBcY1mxBCbNOOJgBOUQIyi8a
         hg6jYuhBGJ+D8IwUOJHhOZ8XCakI98xi80nNnrRlH7gXrh35ixrXnM0n3VX4UpG3pgrc
         X8uce/nPgphLH77beLlG/awJpcJ+TMAo1sgINX3cS+VoQ/hRamxtG3S8bpr3IbezGlkw
         L1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUKLPAeUGf02cGdKJW3zIIDdl0LHRkS/hWiYzQb/aE/kVzExAIk0VEOMa51jRtTkleF98DfFYlHeQKqMKY0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bfRIiALE96uQHRKsmaVKY2eLUub+pUvKBhC5HULpVOq+8kF5
	F0QWhGEJngvV9IBfPQ81j2ZFjSlAJSUMa29QDajneKIo6p1W0y443Vp38q+L+ugc1yoQwR7PvMt
	jrkRPjf2OpmCMr94rf8CgXBUnomDXX0u3iPMGwaEUOEO0kzCjp1B48w1LTvkfcQfDkTff
X-Gm-Gg: ASbGnctT7vbZPIkGs8qcFAWFd1q3IC6cD4kqsukFU8tsnkTtN+WMIXdhsmEeTeaObAD
	99uFKHE3482VRsbs2cCOwJmZmyQswS+xSePacwizgazwfX/naCsdEg0fJ7lG9YtSHlVfnJOAptE
	xlVqwbCWP9w/CTsy4q8pJSnhKQW0GolNoIHvuCcqiArIxqzaoWoX+UM/zHvwIWqkrx5IJ2gOqmd
	/OTTbN0rWV1cUKqGyb9erzdZKHPpNC3ZlCbtCTX7lLmi9ffPYgGtsgyt26ww7fSjKYOK6M6BHOH
	21a2g27JS12UB9AtICaEYMVQ2VDIPQlQBooGHI4pyDBrq7kaWjvWmtInnDeiqcSuhLTlKFTPL8o
	+0u3be+x0vN81d5AgcviFCzUX4j4O+qGQJ6fmLqBvNdiTYRgV4ce6
X-Received: by 2002:a05:620a:7085:b0:858:9d54:e899 with SMTP id af79cd13be357-8820d18e381mr2693141185a.32.1760198207511;
        Sat, 11 Oct 2025 08:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF4e8oE9a8ZlZe6MjQVUbFU5Qz1czZ4lPLXspIfK2RqqFUrTfptrIWkI6x337JAbepIphv4Q==
X-Received: by 2002:a05:620a:7085:b0:858:9d54:e899 with SMTP id af79cd13be357-8820d18e381mr2693137785a.32.1760198206913;
        Sat, 11 Oct 2025 08:56:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856dfe0sm2024644e87.91.2025.10.11.08.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 08:56:46 -0700 (PDT)
Date: Sat, 11 Oct 2025 18:56:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 09/24] arm64: dts: qcom: glymur-crd: Add RPMH regulator
 rails
Message-ID: <jszx4ztfjbjdxgpslfqbpl6urnvnqqp2l32v2dcrez4j4ngdi4@y5nsco67e5gb>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
 <sean5dkqku4norpl5llaps6wd3qjcxbb5kodjgvh4dshjkqvt2@jtlqhser6hsn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sean5dkqku4norpl5llaps6wd3qjcxbb5kodjgvh4dshjkqvt2@jtlqhser6hsn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+WUxGn1bAxwe
 AcqH9zQDMGG6NJZZ2gwvd+PxG4PZ3rt0SYHvndMBYGBEKhVFuxvVpwYG44nb77JacgljNceGpsn
 JjL37iwHdDrRljeUSBd+AydX7mVqomjIIX/N2OqyprdzDXBx7cZS9ZtVHrgesnnAuXOIcOpZ8UF
 Lg6WhUTWQMIzqtuMgz1fyPFwz5dxjzbSRuWbOm+qUu716p8pawvUoXOqio4r+mk1E9rhBN7wM7a
 N8PYN5V4Ko/55ukIU4yGZuCLlMAwgM0q5gd8PrRrLA3mtnygDfapUKa7AQ5vWHhjclsR3Ltomnr
 3EoQMkGYSh1vAAEif62NCqdRbMvDCtIjQC882krvLGgkiGj9VjgT62mXC6pFUZblRPLFKRI3zdz
 e73KCvUzdx4jkmPB2SwTyiPvHyY91Q==
X-Proofpoint-GUID: dUfIm1bcNTx4ioyebP8XTAPL6_BCkult
X-Proofpoint-ORIG-GUID: dUfIm1bcNTx4ioyebP8XTAPL6_BCkult
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea7e40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7HhUDsceNTqC75YT8XgA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On Sat, Oct 11, 2025 at 02:31:27PM +0300, Abel Vesa wrote:
> On 25-09-25 12:02:17, Pankaj Patil wrote:
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > 
> > Add RPMH regulator rails for Glymur CRD.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 332 ++++++++++++++++++++++++++++++++
> >  1 file changed, 332 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 4561c0b87b017cba0a1db8814123a070b37fd434..e89b81dcb4f47b78307fa3ab6831657cf6491c89 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -6,6 +6,7 @@
> >  /dts-v1/;
> >  
> >  #include "glymur.dtsi"
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  
> >  / {
> >  	model = "Qualcomm Technologies, Inc. Glymur CRD";
> > @@ -66,3 +67,334 @@ chosen {
> >  &tlmm {
> >  	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
> >  };
> > +
> > +&apps_rsc {
> > +
> > +	vph_pwr: vph-pwr-regulator {
> 
> dtbs_check gives this:
> 
> arch/arm64/boot/dts/qcom/glymur-crd.dtb: rsc@18900000 (qcom,rpmh-rsc): 'vph-pwr-regulator' does not match any of the regexes: '^pinctrl-[0-9]+$', '^regulators(-[0-9])?$'
>         from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> 
> so node name needs to be regulator-vph-pwr instead.

Actually not just that. VPH-PWR is not a part of the apps-rsc (why is it
even there??). It should be a part of the board DTS.

-- 
With best wishes
Dmitry

