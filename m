Return-Path: <linux-arm-msm+bounces-56668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F371CAA81CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 19:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69B8F17F440
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA1D27A93F;
	Sat,  3 May 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2gKFMkr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0327B4E9
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746292904; cv=none; b=YBioxk9+YmfdtfaMVBHC27z620m6+Wre6x53TGWXcD0yYih32d2yqEnqGx39XTM0rpYMZTA5f2xZWDsWZOK7lSObVoRk4LKZJVmYiso1RcLV4BmaXmW6FYNC1olNLmmWVC4cr+bua7I2lw7MYnCdzmcbEw4HNvflyU68AxfHdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746292904; c=relaxed/simple;
	bh=FkqPTKKa1BYfGmOPnQ1QkH3rInAfKUq2BRkp0CBjjRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQE4CY1istfItTDSKVxdmNnkGwFTt67+tJ10jsTMMPKTCLIgG54pRdI39AP93WSm9c+biHi+bQ0e4FxNz3kZdYTo/LOZ6sDn4wAGONKIKcTgcqwkVT94iRMcff1djCwnJvgEJ3+YNl1//Ot2YFrx8YWAA/uevmc6HZfbGgyLOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2gKFMkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543CUKD9007844
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUPi73K0M4K8c3dJhvQF7DaH
	PF0crJym+waMYMfinqQ=; b=R2gKFMkrIBVeDakGd1qOJMFM1lsPaCsuL1Ou/N7k
	51cL4eIgHohEQVKhFQ/5k6V7LxXGxChYmtnHfIYctDgt0tWTcXArYUH9RlPy1Uwo
	cFq1yr3ge9eHVBNkx+jDCWSnXMWKMygsyc39vVaLEtwcpK6fKiN74YbKkPLZ2PI2
	MNdvXiWIdIkAUU/JlSAICZoKdeRthpFkQ1N87LhHxURqHGww/6EtHslqsi4SMimD
	51Nlf4JveqRfxvTDfYT38w+qJPfhIYarKLqVIs+c0HqrwYFP30oTmx+sTqhdhfRn
	+g0ZuUf4U4rutQMYjTa+VGo28MQ/KvEQ3PL1ZVKleE6BUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n0r9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769a1db721so82272561cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 10:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746292900; x=1746897700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUPi73K0M4K8c3dJhvQF7DaHPF0crJym+waMYMfinqQ=;
        b=rWpvHWQ1/HnVYiuRsG14IUeew2N8+yJb3t/SIcxrjUFwu6a++wrOKWt9iEXrT0vQ0x
         YIST2vr7uwuaEDLv9ALGk5hHUzSFvfa+os6qmNzXxL/NjCS+tuhrt74YqPDgGFWzpo4M
         mIkZOqyadBfbqPK9glh/fsJax1OoO1WFqghrv6LPwCBu6cj2PH9eTeUKvSn1YPSHHHQ2
         v+AHdMLCU+RkBN7QlyHiCDM49OK7hVlqFJJN/aOcQmWCm7egWA8dmNJ39dB+Q/2oznYQ
         MnkG2RpCzyC7c7WsuQB2lp9CWloCdnPYp5KD8bCLxHKCeZw5IMbG2UAzl5Vvs91yXIZD
         4JCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHjlFGmN5TUUOVIpIqDJcBvnsZjjh6xt/Qk5PP1GtZEakf8JQQz7bEPkLtb/yWKrU1Uan1U5YUB3P+2E4U@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIrObkbXMtTmkXXBrrYNrk4V2PyxJ1+x8p/5xPhP+FZ2od4sN
	KET06rg6GxwNMIGMAV6hdvvDoDzG04Rk9vGK3vV2x91xUiNgFtPqhVZVAEAadtdns2jqawiKFqL
	t7T6IDDMAaKbNpJrFwRfJdZ6avJdE1e3SWmlEqS05nBAeGUmFSjviOTCXw6E4ZSop
X-Gm-Gg: ASbGnctMtzfBaGQtb8TwHv5guI32lixdjPuozOeDJKoPuh+zUekpdb0OePLMRzAiGjL
	q7Bj03XF+fojb15TDUzmAotBiW907TNvx7oUuKWoQ9S8Z200cZPSuAgVZPSRJLC97+K5uBRe5iu
	j1W9WjNyBYiE2iYC0jqFRe7RfNBb0b+kQ1QSvpcPv7ZE4b3tmLzLbf6CK3AoZFs8dwx8BrP/TUf
	BGzWER93bWq2SEpAzigps3G/Qqe4jfn4selWVXmUaAQDi9AQeLBxCR31C8fce75h7MWaH980Sew
	GGwXf0hWGxydbmbCeIKTzbsc0zUJ9fKk4xA9VJ6PnHHDuFKSvs+THsjYDK9NhOT2LoJwfiO1Dv8
	=
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879711cf.40.1746292900334;
        Sat, 03 May 2025 10:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmoBZgMqriscERLtLJYJxOOTXkywtkwOsXpQzulxWIgQLOXUAe46ItjymMZEGDMLwcrBNHcw==
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879411cf.40.1746292899907;
        Sat, 03 May 2025 10:21:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f22a8sm878183e87.176.2025.05.03.10.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 10:21:38 -0700 (PDT)
Date: Sat, 3 May 2025 20:21:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <vpm4ee4bjuqje7zrpay3pllvcghh547yce4nbqgbeujgdbu3lk@fahrgwfjbrzy>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
 <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1OSBTYWx0ZWRfXy0KBmSmXDP4v
 tyLLw8aauWNxIgfmnIoWnrNQAK4QZ5cPQfHZ+a+HlyJeACa/aa79mMIwBieZ0Sc2H0B0XARMNzS
 Xc5g1eeQgMikniJjGkOTMM8GLtw7SuXiJcAeDzDuVB2d/G+b/iLB9Nd4uY6zcQfWCFRs2HbRPGD
 V18VM+5QdpC836Rarh0uJtpgNVYnrOeseFWpM/G5CO18xP+JHrBl7MctPvYwrtdGCTar0onijSP
 loyrgTcLQIk1AA5yM1ZQBfrfi7ltFnbSwDgDFrj+pEE5qgJVmZ6uZ5VrO8ttVz9tf7un60lzGeC
 hmEcUgtYwL/z2uXZaSVWptCOMT/5aeNF9OW2jqy7Xsd8Js8fh8hx/tZHWOI4URFXKmEdkghDopv
 S8n/S8qdUy1ZB06Eoj0ypkrEJCGNzIBJFF2lw23wUXDXOKgY9StOwJogdfPSh8efcRmtlqmn
X-Proofpoint-GUID: 3G8lQDS1WPad-vg8YqJjxlnwVfqDMxPm
X-Proofpoint-ORIG-GUID: 3G8lQDS1WPad-vg8YqJjxlnwVfqDMxPm
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=681650a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=vrWCv2ldUtsF7w5ASE0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030159

On Sat, May 03, 2025 at 04:47:52PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 3/8/2025 11:36 PM, Konrad Dybcio wrote:
> > On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
> > > Load the firmware to QUP SE based on the 'firmware-name' property specified
> > > in devicetree. Populate Serial engine and base address details in the probe
> > > function of the protocol driver and pass to firmware load routine.
> > > 
> > > Skip the firmware loading if the firmware is already loaded in Serial
> > > Engine's firmware memory area.
> > > 
> > > Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> > > +		return -EINVAL;
> > 
> > I wouldn't expect this to ever fail..
> 
> Yes, that's correct. But including a default case helps handle unexpected or
> invalid input gracefully.
> 
> Please let me know if you would like me to remove it.

If you are asking for additional comments, please refrain from sending
the next iteration until you actally resolve all the open questions.

-- 
With best wishes
Dmitry

