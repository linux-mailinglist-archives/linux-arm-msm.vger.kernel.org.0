Return-Path: <linux-arm-msm+bounces-85053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8095CB6062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1314D301E900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC7F31355E;
	Thu, 11 Dec 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+HZz5Gj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFVQZbxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EC313294
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459706; cv=none; b=koon3Rbvb/Y6sS+JB6vnjJdMb/la6S7dWHnzSjC+UPOu1WCi2KwaZapqfw60DQZdfbRY9XOngx2AKtX3ZyKuhh6fSD/5p9Gr481+kf9Rz9VRiPosz9C7xlOVwLEHahUyJYLn9HmN52DKTIDTq6Ho9XteU0Y305ZSkjfJ/uXDwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459706; c=relaxed/simple;
	bh=SaU3NTCIc76Qar8zhALR6mQQlQPr2J7Wi2qImuwXIQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG7tkaAxGlTSubRVD5+vEEFmCGJe4L6w4J4JJ6tNwTmagSONcAk8rWueDt6Ko/CBEzLjjbrAW27GShGfX+P4edpakip2QTZ2+IsEjTtIxlfQqc/Ff9IMcJtcfVZcvnDALhAfCdlTnHLmI2DgLVS5eZE+CiOEQitDF1SQa1WLDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+HZz5Gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFVQZbxW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXpql673517
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sOYbU85RGZeZKmH5dMDlU5vS
	JV8Ht3upXjchWSOLlE8=; b=M+HZz5GjB9PDD2Fc3tzO5mlideYZ+Tt2Xb5WbQ5M
	46gzcxxz5utk2fVInswg38NyCYBQqTD6CXheTyDxMdFTfK5W0uXk2CkRqkvh90M/
	LUBs9qhdTikkPepCTlshpb5WLe0L/e1QCv9SCyf+GtHqlvvVZke6FwO8qbgnwZYR
	9oPULCFHxTYrYJXXmPp4euducCPFl+SdbLUH2lh1cDfMyRfxDjks4XTcVYMCPPxF
	vHon5zqd9c1jznmCk0ulUDL+NxejLIJRNBR026qo6k1nTG940sIhXuxHBkOq9WOH
	BRlcw5gCT0wGz3LN5rOxA5K4mbxZnOmPynNXyvty3ggjxg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aytwj8vy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:28:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559eda577e9so31362e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765459703; x=1766064503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sOYbU85RGZeZKmH5dMDlU5vSJV8Ht3upXjchWSOLlE8=;
        b=JFVQZbxWrKFL2La1Fw4H5+GIePxjL29RpDpRdLcqh2p+dtagl0GYkEWPXbvo2jmE53
         bcnTp3nx5FRkEktHXnqTAL3FG4e1VUS2ji/7lULqjG7FaaAAXD5JQRrTryFmnF9qO9Bv
         n8gtUsTLCKhZRhOQSEYFZJDAA6O4Be+Oh7HFIBgXw7QNyWzcv2Qr4aM2iuTEPdra3Yxk
         UkxSh/Fep6GWelRvD9uifDJbzQyRJpzqpfwmM0rZNcjI6NBol+4e6Fea3rp0TbpP+cWE
         m1+gqPswxT/wlxoeitMJol++Ioeai4icy2/HlnprKy7cSNeA69bK3w811ME5RP3s0+Wc
         xWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459703; x=1766064503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOYbU85RGZeZKmH5dMDlU5vSJV8Ht3upXjchWSOLlE8=;
        b=SU/jquGRdFWyt5Cf+AeK1iTBY1uwWuDKUwaqqC38t0vTsmqYkjLhPAihX04rI4QFeW
         C1AoFX+HMCetOND/Obt7wIRC+DU09yAhegL/nXdN4Ztcw/IdiizVFHeE9wEuv79rq8WC
         df60BFS3QfUPbAgl/uNCB0z8c8SAOenHer1FUVChh8o/bkMyTOCm4TF1ZH9ytiIJo96h
         2RdprkqWrNyUrgK807pLY/MJT6PhdDbsxnUismr+nQpCz+lVHrpCtppV6TyGx+n8pHVq
         gE6D5FZdHOMmgYXSz+zZ0VxPsEL5/eSta2jazoxhg7OqxXCDPfi28m8j6UwAcJPYvi5+
         GGBg==
X-Forwarded-Encrypted: i=1; AJvYcCW/27GFx8h/pfT1aBlNmnV0BiDR2UUMX1PxJC/agAF155M5qHjIbyjLhnK1An2xGTdKcccdCDAr5sLfezel@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2VCn2QV+1y7roT0iEI0bHiwyF4TY9rX77bD+oX2FO8nD7h8v
	X2LNDwJqR35aawzpzbeCei++dSzkUmROrTw8o+cBAFNyhYtYoWmfcGBEhpbcX7FaNidpXp+SMCY
	ezVmD5IdXMfUIEtkpvvkOjO7CGlBbwDnHCMeK8bLrqZuqnF9/RpSXF32QJxxKxhUPG7rKFTpnzr
	xb
X-Gm-Gg: AY/fxX7AADSgDWKLP5pR6fFVDlH+Uh77IwXF9vs0cJO31bG0GJPgQGY6XK6YaWTi3PI
	gWww6tB2qYFkcZBnmaOd/jJorRL5qChfWB/iGMpH5GO4PI27Af++x03FEB5Ny2i3Us06BiA243B
	7lSKAnkmatJ6Q9RjYSrHB5GO2AWvbdIrozxog4U01BpBeCJzn/XfyI7V+k2PEyJ+Uz/easHpKeF
	km1wfxFLkXH5ylfXABf3iDNbfmUkhFQ0hj9u4PiKSOf5pet6/tmU+HZfvwyjApu18wKgjHSJThG
	zTrhKgffQ9sEM+3w/48D8S+jJn8/Dcowya8oWSxzNTBHXGaqT5gQR0EQ5o7Kz/sfC8x3XVhkLGL
	NA7cKm0U13BrJWZzcqHVOjM9KiGbAgU30IccolHaCnkfuNAvx+3fvfdNtUiMQriX/gd3XTGnvS3
	4LiOZo3OxrgbNnJquvyEC09Ts=
X-Received: by 2002:a05:6122:4d16:b0:55b:ab1:377b with SMTP id 71dfb90a1353d-55fcfb11c36mr1857075e0c.5.1765459703012;
        Thu, 11 Dec 2025 05:28:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi3n4BXJt44HbgoUvZ5NwaZ94C0wCZmhDis31+A2F7qzrH/vnnq0CyR/CBYaLlpbYyQ8cGeg==
X-Received: by 2002:a05:6122:4d16:b0:55b:ab1:377b with SMTP id 71dfb90a1353d-55fcfb11c36mr1857059e0c.5.1765459702580;
        Thu, 11 Dec 2025 05:28:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9ba309sm7184791fa.16.2025.12.11.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:28:21 -0800 (PST)
Date: Thu, 11 Dec 2025 15:28:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
Message-ID: <cd4b3wgoa7vbdmzvykqb3qslz6e3ot5legthlxhxg2gl3ducf4@qbyrow4zdubj>
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
 <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
 <87454dcd-9eac-47a9-9d0f-e2e10791bc6d@oss.qualcomm.com>
 <ufngcyzhuisms6sljw5xcex3pyddf56ml244wbjn2ih6c42jgq@al4gsoxoin4d>
 <f370e56b-21e7-49a7-944d-b7c10b3ea628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f370e56b-21e7-49a7-944d-b7c10b3ea628@oss.qualcomm.com>
X-Proofpoint-GUID: TxLEHtiilw3IaPGlfWi__MUKzBgCIig9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNSBTYWx0ZWRfXxVZkmN0V+Afl
 qYk02FRhSk/dKjUf3xJbxZ8KSMB4xyWNi4XWu+VboRLgHdsaw3v0bnxZORbN8pOFpC6S3iHWGOt
 NyfAekm/wXoHtCXP9dMKXEfzpw2DGalx8wxQTGRBVpMxhPTBX+uVMnYivLDP51lOLeGZZEzDDHN
 L7vGgDwlGX1BdB74XIKCx7goxE4Erc1INByE1DU1Us66TaFNx2awOVwM7f161ccBPLbvycxz5zK
 k5r2o4ApRpFYpYBeM0aTnoNIAH0woLAL9DcO5JjeoZtV27VMCEDjzaRbfmy7O4OY3ADguOm7apl
 mEvJmZ41k+kehL1HDox7xDoYPaaVqyySD03mUe6any7OnbPIg3GkkCbf0vNLFL5Vk1o1rPk5PKz
 pVhrUI3AVQEOLbzp2Fv+M/9K4O17BQ==
X-Authority-Analysis: v=2.4 cv=YokChoYX c=1 sm=1 tr=0 ts=693ac6f8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vDJZ4Y6AiLIkUIgpi_wA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: TxLEHtiilw3IaPGlfWi__MUKzBgCIig9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110105

On Thu, Dec 11, 2025 at 04:45:11PM +0530, Gaurav Kohli wrote:
> 
> On 12/10/2025 1:45 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 10, 2025 at 12:37:05PM +0530, Gaurav Kohli wrote:
> > > On 12/10/2025 1:38 AM, Dmitry Baryshkov wrote:
> > > > Are there any cooling maps to be defined?
> > > 
> > > We need it to configure from userspace daemon.
> > You are describing behaviour. Please describe the hardware instead.
> 
> 
> you mean without defining cooling map for cpu, we should not add
> cooling-cells to cpu?

Looking at other platforms:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

