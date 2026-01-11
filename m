Return-Path: <linux-arm-msm+bounces-88402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F55D0F7CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 18:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6D763000954
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 17:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A6B1DF261;
	Sun, 11 Jan 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iB1D6lmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITmiyggv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9F500963
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151120; cv=none; b=XpXkFvrxwrcY+mpwD6gF82fOZdYXzdJvniUMyj6MwCyTIg5+bduT77cjcKsFNPdyP6E78JcmrG0VMl/bsVF7Pay8ZIgfM8Fg9imvx9FzHjwETw2/L1QHWM9+LXRwldNzRKDoj/OHSiHvPGgKBjje2qtRyiJY2M8+69ciKnPRNiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151120; c=relaxed/simple;
	bh=qqoHQ7NiVFtsfQeeaPdxsqI4suWh1kqfUdivJFExy/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRbB2oKyGSbgclAgK/pvOwFIP3kzrO+Grmdl6f7aJrGaljV2NTJa/Fe0YqDrlgQMs5CWIe//BF532m8a8VOeimI6dw5QlRJg11YaVdqaXolcvF+p+Od1xs+9zO4Vx/DEfo/hcBrHWUH7ddn8h91jAy527qtXc5MvUhCbHM4XsQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iB1D6lmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITmiyggv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B5ksl21129505
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 17:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xaIFujk+dx5WaWNP1+0p6D5b
	Z7Fot7bXSzAgCfuqvXc=; b=iB1D6lmvCUWux5Yh+QQd0gS6YETVmUcu1jpPKMx3
	SzAOzAcH/ZhTcUul1SAZTrtu2X3d/RwfZiqhVHvhTSDvvhsQqnekbADVUTH3zQhK
	RtDtaqLet53xuTeYzqrn88WGDrBrQLWSgCO5QBwjRyLqh1lSueM/PIlu3e/9E5cD
	4nW9mNnmZgRTxcC5lBUIhpsjkxTinvbzaxpPqZtFQ4OCSzj10Mc+M4LQaPyvU8Us
	WO808SsYFAsg9l/XeZ8Dv0pnDZ52ubnb/QF+q8WOa85hONU+u+j4x4sbzwzL1U6j
	CWekSEg54aaDERLpVUdHXRzPZy0fthCRhr+mgsTC+hxOlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57afkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 17:05:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so2266208385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 09:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768151117; x=1768755917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xaIFujk+dx5WaWNP1+0p6D5bZ7Fot7bXSzAgCfuqvXc=;
        b=ITmiyggv2QbMpRp8n+yfU5qgRMNi0NfElV1d9a6Xit/v4ASv5sI2A1nKVSY5KCnkyE
         pxGZfztVu65FjWr4GLCp715vCQg1UFEFG++3izB8v/Y10Qio5LznG9to0NhOPnOsRuFx
         +GZ1wnSKhlnLgeWWGA2S/YE3GGz6G9gNNbqFjLOlAWQt30FU0pQfFsgc7Zw65CRfA0G4
         jahCK47/flAUvnDrN+arCa3vsQU436cHJxF/LgmsgpmyR4yJPQOZpqHK+NBtEGGXqDGW
         UgtryUHpDR3X+dZ++9yWB2iYeZO+OjuTJkY2lWjSqnsi9Rua3JmDDnLgJKXfCHKmwIut
         sM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768151117; x=1768755917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaIFujk+dx5WaWNP1+0p6D5bZ7Fot7bXSzAgCfuqvXc=;
        b=AuhLgaF5BnC+8VrA0zncAYo5VywJ90AZpRrqmFjiHask9FZ6S2TdzdosC+qH2T2efS
         EBOtMnL17+laWz7AHDxpdG3Msu5Y1WevcoWgoV432IffTk+OheohqwVwrjUJBabaJW4f
         eWdFIIwGrLT2GraShphyMSKJBe+oPnPYUS2D6G4esoThJazLnSq8J6gsMzO01o6Huoaq
         EsVjaq2ddirCrHps5+XM4DqMKdCQi/+q88cY8/N5u1RB00mW5bTCYZUMB2r32vpL5cao
         OXJ0OEfoerv/cCjQAy5rGYwEUskfprOLRtT5QpF1gr+LgowpqPmhjGPt9zwPZB0HdOS2
         4Otw==
X-Forwarded-Encrypted: i=1; AJvYcCVMx7EHNg6xH8ZaybkRz4aTG15Sy9r8m/pE51HEXrPE5rNnXMzFU4LBFgCFDT2iTOhvkqP0GKrOAGmFdhsP@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMb1GrXOS4LTDoB/K22pOMw80/dH6jU8D7DgVLl7LlnGucQ9e
	3iWaCnbNLjJYZ/jgJf3Z1caLw5iHSA5irLn7vHJ1BTHiussVu9lz5nc3cxysC+Pjv6PTFmesSQV
	n5jJHl9d54DpkjxhcMVS9Yvzq58Z5GUdigMJi+E81ZvXxwhk+n9TctkJHD4kjke9YhL47
X-Gm-Gg: AY/fxX4aNncGGUOthsr4ZHeilgX62mmezaUQLbIvRaosQxyjWs7WpvyMPWO8YfepFN2
	SzVQhQvi4mBDW60WBTpbtphGKH93E2kCi1quJWeAGr2Q39kR0A0+FDMcUdpRfP20vOfNuOir+AD
	64009IvD3EdKoMXMjKhDHJMgAhRTQ3MFGfkzjTYVBssyscDi0RSSzS/VTmMmvtf7DHb5JyuGiEh
	StbiZDBjPxTgUfhinETWKecey70SYQdyx1X1DOMPYJLIUzfMFIF1W719PdDZRJpMNuWQYFRubip
	xcYgEgZzoHVMDe4CMhA181n33UMRfyrO5Kr/M0J6fnpMMRAlge1E4T9P7Xr863BubeyIvaIui84
	4gAAij+D7gnyvu5SlJucNlDZpK0iafrRJKfqadCYVvSLudIg2h4NwnXuL/EjAt5EkiTcOHz8eh8
	TCzVyjGwJhxmezq0sQSbEc7mI=
X-Received: by 2002:a05:620a:2550:b0:8b2:fa94:e48a with SMTP id af79cd13be357-8c3893f4ff4mr2372135485a.52.1768151117050;
        Sun, 11 Jan 2026 09:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYFG6l+EgNfUjp9ttuENH0hvUJA/bDotn8fhAoUkXAfV7FZJSzrKHNUCHUor1mEQGYuTdlAA==
X-Received: by 2002:a05:620a:2550:b0:8b2:fa94:e48a with SMTP id af79cd13be357-8c3893f4ff4mr2372129085a.52.1768151116503;
        Sun, 11 Jan 2026 09:05:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7791d2efsm2529585e87.89.2026.01.11.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 09:05:15 -0800 (PST)
Date: Sun, 11 Jan 2026 19:05:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710
Message-ID: <l64m476relvap7keob4qzt4fmxowkji6c5v53tn7ttbfhabbqi@7rj66yzt3yy2>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-7-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963d84d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jijYm72WxJQj5CxCk9kA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE1OCBTYWx0ZWRfXzvMfnd2rSdDO
 C570XGJg24rhrsdwGCcBk4UHGe+rZdXKoVLjOSmfgCbRmnWVQOjVsWaIpaLgGU0VR7khrPqCrDq
 C9d1va6R6mcwGRXn8M8K/u07cXXeaRTJ1VyzxAdCpshkBBIDEiBhellDC59puvBSv2dxgj0XgvM
 j+XUpcYzTjhL2zKhaolLN6N7JsUYV5ciaLEFXRHD7HQ6JhEJaTkMxoC733Y9OsYFTT3YGFsraxJ
 QCxvZSyCIHeIlWYGkG2hF248NfNvm98B6iHcWveU6RB+SaEwRZS4sOrhX4uifrT9s+ofsWeOU1j
 25e+Hw4+PKzFTaUX55JnZ1P2CVt4YLcKpvMHUjofDv24ErPfWK6phKN6Zey+caie33CLsdjwm88
 MYvkWFq2LD4JfZr7Ye5kAqTnxRk/yWBJUWYeio9PNDvxBVtkFjF0j/Imqotr/a/0fVABocbGDa0
 tpuSJm7ku4UX5DSVr5g==
X-Proofpoint-GUID: qElGOcvCCI0ABua7ood6XoddGw7RZvcu
X-Proofpoint-ORIG-GUID: qElGOcvCCI0ABua7ood6XoddGw7RZvcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110158

On Sun, Jan 11, 2026 at 05:35:13AM -0300, Val Packett wrote:
> Allow this machine to access efivars through qseecom/uefisecapp.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

