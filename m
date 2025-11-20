Return-Path: <linux-arm-msm+bounces-82611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D286EC7245A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09C8934E1F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 05:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1498B1F463E;
	Thu, 20 Nov 2025 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vov/U6R6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECp8SfDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855EE10957
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763617524; cv=none; b=qIQvVvvJsvcPh/HmwdkQeO7cBIlUmfOpZaMMkFrj8ne0lI1jGfKD3D9v8Ixl+42cMVsozeFTw53RbPdEIo5GQR3wj+MFe8G9pnJcUF2OAO6SWDFP0cAWzZLpG9x5uI3JMuhn8N0BfGggVTuiglP0eVTzKroVyV7xSYQRDkLJgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763617524; c=relaxed/simple;
	bh=hZ8Zb+XPk6p2PK8VQRVha4TEshtY/2wT1XfF6qcodoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LWtePMgdt2QFKzWDeLNG+e/vOcoqptW7A5XqEmRym/bYUdULhwDcnWbHD22nTLfWOnnhwhqiMmsj5vDTPehAMmcY+UADPPQxMeKoqk16ULo8J7DYZTYc/zcRbEtm71evpblZW9Jyl9Iyj2einXxlroBTsYF+ba1hg0Izg8sfwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vov/U6R6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECp8SfDM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pQiB3719909
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=; b=Vov/U6R6QnMmbgf/
	qThm1ULgil2UH0/odb2f4VFupw7LrC/iA6kG7flKrh8qTh1BxPF9T1FXR1Pn/tTv
	Rj37nnCDJW1DDHOgaCFjKF2s5f0gIZdAX8u/DEeBI8uBuV0zCV8+aprTBT/sp+N8
	YPHSDY4wGVGbBON0Sv6HtNuhN8pJkftes1fpc0qWbUQ1k0tFiypiZzH+khPDRr0o
	N6YONobohJ6bh5mg1LqlVnDefbzNO9Oim6qwVH6hpWEwmwS+2pPihKn9mN7p5dpb
	Rw1wsV+6lwIFMmoOgUOQXSDRZYbtJDVxGFQmKuf8BSjaje+WFqnoBrV++doOE6qc
	y6IdmQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahqb0h0bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:45:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343725e6243so1693473a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 21:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763617521; x=1764222321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=;
        b=ECp8SfDMNI7NwIanyF44y3ThBb7y8UmgcDnFhlT6W24Ww5KVXHD38DJFPO157F5oB5
         jffsJohH+9oy+4Lav3Kf8RLLtynq5I8KieI7XdaFiaLM4e4kYoUBP7c8Y9e91rjIR3uw
         HKOVzKdE2k0llzzFNhl+TAXrIiaZ9Ud4tsO+VZhMncIPLkgKWvGrtMAI7RI7cFPmsrFI
         Tj3qZYHP1ZFzuDOWpCZ7Ae2wgy3p3e2284sZtUjTXy4bPwQD8r6IrDYG88WOOr7qKsUy
         Ca48LLdmeFk5qyQIN1PlzDHnnShRwrjpIipd7fXBUThUz1U9zFY8uhh0qptCRBUKfDCc
         JP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763617521; x=1764222321;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=;
        b=nOKoE3C757CS/qxjHVVCLoQQLRYdaTTwXz+20lCMqmdG/sT0hF4tPkXR4O5z21CQ2K
         1l7eUsgGN+/l3BoYbojGvi8UC1xZpX6qxiSydsdn9cFje8jNKABs5WbjHV6cREO+pIgh
         5tNPDYEeQW5hSYSr9z8FH+M2wy3QayrG/0DzpQF671LPDpldmyfjFrK+LETIyJUzDSCl
         +Yp/W08cnkUPwElqy2HSRdVuuNB3MKFtMDL1GVk4AJSrSFDufp7CFjiUVpMu883jhRso
         PKxrSM9SILztEb9u0n8hwVo3khBgARlL6EiS2F55/Vvocg1Hgu7t2GUM7Cos/57vjFut
         hxAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+WlQ52dfInOBJU3PImZ9rrpzmL9681Mzs+x0KItQQH4BqegtQBYWWjRRKrq8hmAXSxFjUBagyN44uALVq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+5z195K3Kq4xQwhieK/1/4P9kNdFLdbPLgRfJyS2lnTxPZFn
	kPLO6Om3N8GN76zmi49tE4V6VQFqhtuVY/xc/1GyGslUZg66ohFR1UWOh0Ruwc0+UfHecKZ3un4
	u7giDk9y3519YoY/18CvotkuXxlAZQ5+kBvga3CXBgzS+aEClr4HG+w4sxDI6PhS97wRX
X-Gm-Gg: ASbGncsXBKEVShrfItzuE2hilXjAeUc8SZ02XM/NSJeZBR4dW6GbUW/QkKcWc+ho1dR
	v2qTC41DfY2ArBa7/C3xvVukWMokNn9iDHTBHUhz9RyI4l3R0fCjFJYm1xoBH7Get33dAec/tER
	BYj9TOr2wo9KUTyFQSX8Mi5+YY8yiil3b3LqoZF1tadSCz6Mndp6rUqCwZw+mEfOwtu2wmYIJ0q
	0ww/+gW9UObDZfkKlsifEi9KrTuqKZ+nbvl3qkSTgFHo9beE2BgPqO4fumAJgv0rSxe70QPEKIq
	d/bT9T1hN4mRq6lT7mJNyMnufMeWvN4sYwL13j2Uu8pOTtBm+ZYrY6YMbybxNTWHgzKYMxRaVWc
	EtAX7SmlmrvXOkSaUOfTyboE+v4/t1hPMez9hjyU=
X-Received: by 2002:a17:90b:224a:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-3472983c014mr1566392a91.1.1763617520925;
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO+KG805i3YS+IeZPm/hdGaBmj6AEgCTQlfyNg1lYz4PrcEHQL1VlHyMMwTZs3ZKfP3abYgA==
X-Received: by 2002:a17:90b:224a:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-3472983c014mr1566326a91.1.1763617520450;
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
Received: from [192.168.1.102] ([120.56.197.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1279307a91.9.2025.11.19.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251119105615.48295-1-slark_xiao@163.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
Subject: Re: (subset) [PATCH v3 0/2] *** Add support for Foxconn T99W760
 ***
Message-Id: <176361751471.6039.14437856360980124388.b4-ty@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 11:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: VLEE3xp0zXVCf2U5h-UI72pK2LZMrhhq
X-Proofpoint-ORIG-GUID: VLEE3xp0zXVCf2U5h-UI72pK2LZMrhhq
X-Authority-Analysis: v=2.4 cv=DMqCIiNb c=1 sm=1 tr=0 ts=691eaaf1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xeX0Tm50+WxWVv+NCdhSGA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v3APBEOz52XWWHmREQQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzMSBTYWx0ZWRfX/VG7reU2G17n
 rg10HfyeLz/HGPHnIPq6ZDErx2VLy6mjPn/ysn+MCYeXx/nWzol8CbaUZr3IRp07Ti6NSC0aCux
 n5u2TSaQfEB+1t6nSprIEjnDMmVZclpaRZuG1xFTV6IaxAaLmqc64dP+d2VIgCqZI14XadodBDk
 TpUkUYPekXlFyeeZmIYxO/AUKj74Y1NjhXNZZRw9lbxfJE1e0jekVzZbymErSyO2pluxMnIfzVW
 njFjkqHFXxKqdIwbsSUt7byArbtYIu4gmtYnKc+LgGvIM6BPHX5OJiA4WyyeufzWZBg2qCP9ZIz
 QqpLiGtj2ws4JKs7G4gPbfZKGNHKu1PXugmPdXRXCoCInJP1SUgs7ENLJP/o+33eYSd+fZjB8MT
 VWHeHAIIZtsMAoMP+MdCdx7IP5GhUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200031


On Wed, 19 Nov 2025 18:56:13 +0800, Slark Xiao wrote:
> *** This series add support for Foxconn 5G modem T99W760 ***
> 
> Updates:
>   v3: Fix the 2 patches not in one thread issue
>   v2: Add net and MHI mantainer together
> 
> Slark Xiao (2):
>   bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
>   net: wwan: mhi: Add network support for Foxconn T99W760
> 
> [...]

Applied, thanks!

[1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
      commit: d44619821f46e724bca2a001fa7daa35d4e5602d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


