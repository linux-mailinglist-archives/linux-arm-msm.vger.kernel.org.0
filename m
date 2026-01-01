Return-Path: <linux-arm-msm+bounces-87157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40053CED476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 19:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E555300A1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 18:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD4F2EFDAF;
	Thu,  1 Jan 2026 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrHZUUVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlnVTt3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8D7224891
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293787; cv=none; b=VL55yljtoFtTUfcOeJWEGziJXAeHuEF2q2huqeINAu6xYxW44qumbWgXF53ByHKfk+o2AJrhecr3y1E/yksHvxwB0+jDIzAFJRBseFonONRcpnxXlDt28hwfwxkQb6+aUtI+ZrIgMMovhbncxfLZS1T5nDCrMpf/16t59OfagNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293787; c=relaxed/simple;
	bh=ztA4ERIUaOpybGOh4SHbJZ1suX1ZTxmjgGeeLvFb3ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taNlZjilm4xhSmmqb3PmPy2NwH7nUEqMne8PurkCT+xZ4afWAqMDlXWy9q2zi4K+kUgMon45mXUcWb1yUQG5eDLT4Wj3D2EXQAnaqDHe9+WyL+hs0drls2rWvnIxClheXqtrRo0+WpR1TSN5JFIoYwsX+J27pE2f8z87qE2OvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrHZUUVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlnVTt3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601IXNrD2556911
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 18:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qO1Bf50KUVnO0lVfdCvVquRm
	mso9xPQ1/QVgKeZcbRI=; b=QrHZUUVocHuODULCmSdVCjwrONDXtR/+OGtrDkAj
	WXrjDosHzVxFV90nFZi8r4tTb392Ov56biujKifdorn6kUI3IyuM7gCav27dr1iT
	bOeq5oMvL+qkxTvQ1OSI1bjROzlBQuTekTZrO4wWp71y6DLEzi0Ik07JSWZ0V6BR
	1Fcn2nN4s1+jC0ZD9qwv0aVNHJPA7sUIxDIZM9z6WzC567w7pD7QBeoYpSFmaRs0
	CDoUdp17dJNEfQK4+0jsxCcDbIYLG+EyOIW976vyJtxC0BatxcMJqKzgOXXOgLNA
	AR4WeT8pn1YfBpy+2jy59NO8/Qa4eO5vDHAfJPSx+5IxXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8ta6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 18:56:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso321568261cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293783; x=1767898583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO1Bf50KUVnO0lVfdCvVquRmmso9xPQ1/QVgKeZcbRI=;
        b=BlnVTt3c0oLU1zzeFQ1/k5clK3FMxL5MGBWSPCCZrROTvuvrETyrWkhKtxPGg65H++
         EW3xwm5djefsr6+f7BnWjm4j27gXsCNom9KXUFFbIYOecc0wyS4JZzYfJa2FzbN/VQo9
         HPWCP+LR0z59dMzP/F30wwh9WMADcUpQ8SFdI1PSHXFAALNSKFaue/uGuKaPQb/qsdeP
         roO4hDjiyhZTn95kGAZIo8odZKnO+CZ4Vj+0dD3aFl2t0V0Zq9eqdVq+wIowNGYLW/TU
         9AxO+U3Gs2mTsoXjW6lgKe7ZPuGUfnd8sAmt82ue0PZZb5fwjelKDiMzw2ibBmSF26FH
         Nn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293783; x=1767898583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO1Bf50KUVnO0lVfdCvVquRmmso9xPQ1/QVgKeZcbRI=;
        b=dJIv8BmMmI3Y0gw6WEo6useK/KDz6im1QlZY4QqhSN+UoPac1xFm6shTydGFJlU7rX
         lXgfWzb8AqiN7NkTO1SnHgWLab+jihFdMugP4zA6ebOeCpboL1eUlVFdjMVO35QAVrc1
         yA7clB5z6tPLCxcr04avQ4iVZqMlrDMDcBjFv/Qa9ac53AJn7vXXR5zsylLOJeritqVR
         OBWDZmLc85jgZOA6VGqqXoobfgumaiXFI9WVYY9UThcFC/yGvjbhLVpqilEBWstZNdUL
         kLjRCCk4tooBU8pLyrDMeBxZrSqG5fgoYyG5xp0Ww0oQvYI0ToExaDZZtAXXhbgkiBnp
         OG1w==
X-Forwarded-Encrypted: i=1; AJvYcCXkN3z7nfhWWyDmlDFhWbyeZKWJATrfiOxG9sojG4lYGyXlEY87dbhUpte3i/lOELk4oj0z20MnjUfK9LME@vger.kernel.org
X-Gm-Message-State: AOJu0YwaaYvnUsvBFOubs3j8db1OWh8dOM9LawDpHrCnvr1vp5Vr62Ro
	n8x6Mf7zl/NXst8EACuMCImuFgSGSQ5BJgSo4NrYNyBxo+FoCoFkY//PV2BoyjsqAvM2jGPYDd+
	GSd+NtQXn/aGWAffjBbo+JmBaI05WJphmlHWmIbmBzMLxGbeRm7JAJBQVLDjhW0JimFiO
X-Gm-Gg: AY/fxX5qmoxKY8T43CqCklxVOKlXdE6Xk+If+1M+uEXyrCD1Mwa1FCWdQxOpo09wmkt
	GuNY4YjLa8phe72lMdjbCFdjbcFb99WRHg/KIXOlMPIrOlLInrE9AREWUefT8RCA3Aqaxt7X7Gn
	HE5PZqC7xroGrWAATGknvOZkpg1d1Bz6/lr8a/NSiRGxDkW8EJatFG83YcT9dpWmvOPi/xKKwxo
	pyHO13Se/xhh9PbXHqT/ai9cY70mdciFXPnJ+FTU2sLXWTC0LTx+/5rj+7PHZrD/cuoUhdYzQrC
	O/7F+ZB3Q2TBbmrwlTrX7oxqdU4JeKqf7i+qYLiIgdj5HoTTsQwbHUfliWYpkyJLBVL3/6Ght42
	xQRzVbL2XjhOULlrrz7JH
X-Received: by 2002:ac8:4787:0:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4f4c2c946e8mr340884041cf.8.1767293783229;
        Thu, 01 Jan 2026 10:56:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGvXKVfNf6JItm43nU/tdNJougEPfJ3rcs8qbHjPjq5ZWNYyaamji9kyzyAqX8oQhQTltCJQ==
X-Received: by 2002:ac8:4787:0:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4f4c2c946e8mr340883801cf.8.1767293782713;
        Thu, 01 Jan 2026 10:56:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm80390448f8f.5.2026.01.01.10.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:56:22 -0800 (PST)
Date: Thu, 1 Jan 2026 20:56:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Message-ID: <32gaiw6k3pwzdiqxbvdga76rj5bfyuhkfq3xxnfad3eb5yhagi@rvial4rz27qu>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX75uSiG1f1Ttn
 iLPVb7F+K4zN5WYAl1ckqmGDNZCujnUTXaJjrvmb9tjskfDNbm8cCqrtS7eSD3XhQuj2fWMqWOD
 D/lWSOYbVmU1Cl4eoJUGN6u3/aPpE7w1JBk/FbMxxO0iNqsBqQvwSgougU9hPakzw18rrJltvWe
 So7qTOQNFR+PpxUkRbCp0jemXdcFZ7YYs81Gl8shmaDXYdLGFmVhk/TQbx4ezMtF1T8xnYxfktr
 j4SvaGbSPsR8OtKHzXaAaJGQD7ZKc7A8+/miQXXIZOBw4SLS18KM49foQ1aX7M7NQ5xvEX4uBex
 PKLhGTJC2Wxx23lwAPqGwbvzQ4FJ/esv6q4MziTILKnrQzigf8t5pM1dlnydVer0s+oOw/rSfnJ
 vIHNovd2mju/IMdhulSam0ZR8RHCKjska4FR5mQypa24E4tiGBRkFMoLhBfZuOX7pjyvXAOJ6iF
 RL3iAQy7AgKqYfJu6+g==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6956c357 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Tt4ZZnawlGJF5pWS1soA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _T1aMHqJrt7F9xt977sJ2LwmPI21_53v
X-Proofpoint-ORIG-GUID: _T1aMHqJrt7F9xt977sJ2LwmPI21_53v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010172

On 25-12-30 23:08:35, Taniya Das wrote:
> The UFS symbol RX/TX mux clocks were not defined previously.
> Add these mux clocks so that clock rate propagation reaches
> the muxes correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

