Return-Path: <linux-arm-msm+bounces-84125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB9C9D02B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 22:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F32734618A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 21:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166E32F8BC0;
	Tue,  2 Dec 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi9acDJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdR6JS19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7D2F746A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709604; cv=none; b=mzcaJH7bdSP4L3mIa3PKhNGoVebXBDbF1Z3GiW1Tq1CM7zZNxyCKS6198x6udA/JZK2X2icwCl/C/GS8cHW7MAZiZwbAAZbZfOvVZIQ/n8s/3Nz8KVwWcpQPiCZr6njtf0WK1le0mZmMXWYUr4xsZJgUfzvECDcTG4A6lpGZRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709604; c=relaxed/simple;
	bh=levm/eFs6Pq7GzCojVYWl8fYRj+Ya0yFTu2901K/OOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDWT8s9Qbon9CeVGFTfjQf/3rEKIZheipWcTFQO5Fr+AQH5RnymJ35vhyp3a02dSyyHdaTKxpOo20ek8Y+ZWijos0rpeqDD0IknK4XMO1JyWELaplYSCeuS6KYHInoUQauQHjkig8fwuWN3Plf5tIbxn9zVIUwn3xZiZKoj5VTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wi9acDJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdR6JS19; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2IFFX83243435
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 21:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=weaA+rX7Z/XNIRuchY/Dyj2L
	JxaYm0oPd2w5/PR0Lm4=; b=Wi9acDJGN8HvF6QJKhk/SXamaBQ0NLUmfm8mT72B
	wp8Bvwpd7HTsZb2pCgJk1SWHMjfDfn6Vwz9pQzQUT1PuLw7Zy7m7OTU+0Xry9SNH
	433W/G3NT2V5OMF/M2aV1pY4cOptoqUn95XJMIG61ULegP7BIq/OTsSyFgAnBrVi
	COfX+ITp/1Tc1uc09MLY6vpmtgcTJvBVSDIhFXLNSrA8Um7ZQFnr+1dJsFDgR4Pe
	zObOkiH59p5k3amxvVz4KEC/qvfL07rnCbR9Cf9Pb2KhOFwLR4nN1DSuI9os7zQ3
	rNk7sTbH2keiPGzN+9Yt6R+733xWBS/ia/VSl1e7CHq2PQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aswh524tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 21:06:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29846a9efa5so109579225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 13:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764709600; x=1765314400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weaA+rX7Z/XNIRuchY/Dyj2LJxaYm0oPd2w5/PR0Lm4=;
        b=NdR6JS19LXk7Xm3wk6jooxtSpNaYAVrJuz6G5AhO8kUTA23sxdyMxHWaUIS6CL7KVM
         P2PHATM1hN408Q91jUiy77l9OQ9JUNPyIHR8u0yDEb4uRrapA84QAGeVlRHGaDV1+3hp
         kEp9vRKAJrhOIwoEqhgRO/dltAOkZB9+h88YssuJS3tsj7GzKRFD5lF6/NIjq9ue4TrA
         I/QYTI2d/BYkJOxwlLlt89W8nQ+LGZ9zznEEQbt8jUlzd2hnHHSkwRRhyyVOV/UHTwbJ
         vGHNHYYhB6Ap4qB93nWfaX5QB7D6O8grLZpx4PiZhscUc2lVCIUvdzPr3fsojeMaAN4n
         u1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764709600; x=1765314400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weaA+rX7Z/XNIRuchY/Dyj2LJxaYm0oPd2w5/PR0Lm4=;
        b=JVD+r2Er/+XxpASR2QyKVCDF0ghfyCJ3fbqgd0SF1SFB9b6svuRxTBJvxRwwa+ENFg
         xDUpT5W90g2OEA80R4+Hryfjq2moJIu7rdOXYorPKxv0m3IAlCXTspNzoT30TC0SbfeJ
         htZuKgBOnGUQ3aCPz6hqPASXDqe0Uhf0Qf43JOuIdtphvYImVXNjo+GoFoz3clocE37W
         KnUqW9WzdWxU+ovAwrna7tyiBs4kmW9F2xS7lj5AMgE2Sazz9/Febd4/RkqgQxBo8adh
         Io85GLaYzvoI2Nuu+KElJd7U6WXlwVuMJr6b4dgWeDL3V31SErKgcBRWIoDWgO1MFG8p
         F9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHyxlece5H+OmeItdYZ7CYokxuhhP2icG24RXIyWlkrEFCzhpCvUGD+OGmkQUuY1YuAqahGnB//u8CcnBl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0BmQ2RBQ0eR057f61MACEy66e/p6VCGLEoCRA+HjxyGZNNQQd
	vjTdZaITEFnQNextbtIXU12oBv15f0yfHHrOd8Zcy2QXZ0oteB0QpD19TM5npKcWw3DGXNB3dpM
	aNn2MFIABGk7nIuYEO49b3IY7IYhPlT6zYi2PaoJAjxIVPNQeUDhh7kFATNphLOKSOa3PiQ+dy6
	lQaNTf2cKVVpj8xubLmxIcAy0Oluqhw+Z+NUEOy2m9l50=
X-Gm-Gg: ASbGncsEUpPF4Ft6jf+zYm8jQs/elLRurxvp3h6FKxZWHjXV0DToU/vuH0L6y8lCFQQ
	BOIib6o9AsomJnD+vW8OpVRaG0gc3wOz1kSax0Sv+CZ4dxBBBV2YTVZ4+ETNmLSlE1grzYdsSKu
	X1HMzxuxg2G4Xdsmb8iQx8xOvJTz7JFXlNA0OuZoAjFUfmQOpUR/qC3HgnwjGRw4tp7YvzzfrVE
	/ungnaEQph4Y/Yr+EaHa3Y=
X-Received: by 2002:a17:903:40ca:b0:29d:584e:6349 with SMTP id d9443c01a7336-29d584e6510mr45243135ad.13.1764709600178;
        Tue, 02 Dec 2025 13:06:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhG/ITWxbbVQlcZSwuu5xuuK3grqFEEBLjX2WNOEW4DAnjX7z5p6mwkSjVqc+lIk0uaIi8WN84vFytgq4LOrA=
X-Received: by 2002:a17:903:40ca:b0:29d:584e:6349 with SMTP id
 d9443c01a7336-29d584e6510mr45242845ad.13.1764709599637; Tue, 02 Dec 2025
 13:06:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
 <20251107105735.1491273-3-tessolveupstream@gmail.com> <badmoityubqmjsxune27vrh2e6htwkhvnak4uj7iiixnxhjpkm@qi56e6kilyt2>
 <db3edb31-4a1c-4512-ac46-ca3b4e9f187e@gmail.com>
In-Reply-To: <db3edb31-4a1c-4512-ac46-ca3b4e9f187e@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 23:06:28 +0200
X-Gm-Features: AWmQ_bkLJWTM4Nido7Wn3CF4LTeT0kNAOKXGyWrlQ-X6bErmexXFtYdBKS1bY9A
Message-ID: <CAO9ioeUVx_qf3no9aLgZ3OQQPQ7nG-2aTx8SHaEN5DUf02USWA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: tessolveupstream@gmail.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=VNzQXtPX c=1 sm=1 tr=0 ts=692f54e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=GV42bERHAddS6UJatvEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: RKHB-hvjt6em5k8u3BxxdZqesusdypTp
X-Proofpoint-GUID: RKHB-hvjt6em5k8u3BxxdZqesusdypTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE2NiBTYWx0ZWRfX2q8VsM8mA0+n
 Ve2L40/JE5wX3Gbl6A9Q40ga9iQNZv9X97oleAXOFMjCycBfK6cdo4QQu2Jw6agfC/GEuiCDLKE
 tGYVM5gStfauE1zlV/miN/m0v5CL9adVpK3s2M0TFsq4+IVFSrk7/flLGYwXkohDb5mU7U/jjFK
 TxFl3wbWxney+p/9IL2PzUiqcLL7M/vi/F09iRisQDPMYK+U7fQlhCaO3COU7hanavCfMmClxpk
 d7W3xd/2SBGbnbt5OVLw4Smf8el6VmHUxWyO10U7K6ww7BszDrEpkpZEFOY0UBQnZbdVqOroghg
 sGMo6jc1dgJ0MUwvDBp7XlquRrGmEbek5xheKCoyFvZq0oyv6IF/EN5njb9tq/sWOZmJwBzMw88
 sRE5aA/u2rxDMkz6MdoqhUP2G2A0MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020166

On Tue, 18 Nov 2025 at 12:16, <tessolveupstream@gmail.com> wrote:
>
>
>
> On 14-11-2025 01:38, Dmitry Baryshkov wrote:
> > On Fri, Nov 07, 2025 at 04:27:35PM +0530, Sudarshan Shetty wrote:

> >> +
> >> +&uart0 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1_hsphy {
> >> +    vdd-supply = <&vreg_l5a>;
> >> +    vdda-pll-supply = <&vreg_l12a>;
> >> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_qmpphy {
> >> +    vdda-phy-supply = <&vreg_l5a>;
> >> +    vdda-pll-supply = <&vreg_l12a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +    dr_mode = "host";
> >> +};
> >> +
> >> +&usb_hsphy_2 {
> >
> > So, the labels are usb_1_hsphy, but usb_hsphy_2? That's not logical,
> > please fix one of them. Then please fix the order of nodes here.
>
> The node names come directly from the included talos.dtsi, where they
> are defined as usb_1_hsphy & usb_hsphy_2.
> To avoid breaking inherited definitions, we kept the same labels
> in our board DTS.

Please fix them in the base DT.

> However, I will reorder the nodes so they appear in a logical and
> consistent sequence.

This is a prerequisite, no questions.

-- 
With best wishes
Dmitry

