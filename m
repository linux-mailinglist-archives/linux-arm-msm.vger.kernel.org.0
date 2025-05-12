Return-Path: <linux-arm-msm+bounces-57614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702CAB3CDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9511D3B0207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65CF24501B;
	Mon, 12 May 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmw8PO4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F8B244695
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065617; cv=none; b=eRCxiY/7xQmbfnuqKScGt7H1pETGci/oHkrCMaofxps8E5mF8k3Z3k9zv9UCdA8GAtOeiCoWlriYvokzKNGLdl955urRI38OQtvIFr+XQj5vx1Azw4dlW6Gr5iOkYJfHi34pRFGnpFEwIZNdi32s/UUf4yb783eF4FHEY3rMkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065617; c=relaxed/simple;
	bh=7CYZ9riknA472ksZ+IraasbprFF2j0liMKhXc25tang=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtC0DvD/LvZR4iCfeA4GgJpCwfCprhWsLWNyC1Xo1KlZaRG09eEEFQVTO82DhmCbYu+zotvA3iw0WOu85jyISIYmfbmZNwDu81fYhMnmO3trEek3j23PMO+fXD/baMoWHSgv1sqWc7epkiR4bU195vOivpB/cLUOn/kAHpdH5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmw8PO4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9YfCZ012360
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVsnjHIPMc4UjE20nXbN/0Gh
	CASBV1MVcwaZVTJw9co=; b=mmw8PO4p8phC89FVBOUEwZAILQonYdmf3Xkj18Av
	t1EDSmy0cFmU8nax+fKaZ+Eetc1u6jIUyX6meRs2FFmrh4pvW2ngLmzjnTecrpTB
	QmK15c8SxFqo6sBWs+9AKFA/mp4K6hIzBA3geQmhs/3hQGz7+xakQnhJcgFcDp+u
	GpCtgqGhnSEQDUDfBzFOZ9weIF5GldxVn7O1sgXrvl4kgIjSXCqDM51Zlz7hqFeY
	aqYBsyF13n/eWpCkItMm4PGmfWvWdDkwv+iNQzAuvpuvW1aEnVyUiiT/xnJGLGT+
	3F2NrdGFaF4gVFgOw4H1+KXUoHyfgzsiaDuNE+tmzEOM0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjmsdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:00:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so448958385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065613; x=1747670413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVsnjHIPMc4UjE20nXbN/0GhCASBV1MVcwaZVTJw9co=;
        b=vPwUzKsQfD1WS1lDDdoy6it1kouQBRgK1ltU0+tJNQR16nmXnIhCU8ipZI7ZOvLXkJ
         gjVirad3tMaHjDZtm1B/mw5QoPAxhIJvfEuyWerRpzjNDii/MN4IaS9DR1GvGpkRxS86
         eX60RX3fTMKZVd+uvsk0ohBHH1lTCpZsu+9nd3I9fcVOIeyhzLQVLBRSrjfljCXfs8di
         ctsj5SmY42uhgWN4IxiZqJp3EVF8j45Wxg/21wtSDqliIUctYkY6jMVRIzdHQS+kVNP7
         //eLInsgYutxSqdlCutfQ5SL2tsLG/Mg7fCIoV/umRUANhGYBs8ugVlt3+IKF+4/TJad
         wErw==
X-Forwarded-Encrypted: i=1; AJvYcCXfW/8FtQzMgihKa6iAg+W+ZD9zOUXCEUN1ZRTx83HLfYOa7zlWbyvZ7/VL4JzuttjypQ3NU1dx593vrIVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9tYHHZkd59fiqBjsF4IXXJXCJ9KsqhLHxw4sdWZcgGCttagy
	kTDqtiJ6ALAB9k2EiDlyPhFNjKZut06lCBY7VKopj+i7ZxitjhyiM/pQF4AMXJatpSVr4r3eyxW
	WMeD/7MJR93oN7+SYSGSuqyxwCizWLeBKHrfr5M8su+0G6Eu84/4vpDXFGg4CyLue6ybuoUBE
X-Gm-Gg: ASbGncu8OZXdcU0fI4ootJ7MHEMzIAWcNhvi0LVcu9hgbsligrspaHgypXsvegwvDSn
	3UUcvuhRoPG/YtjsGNF4ZBjJJ2PT0UaVue/RiKHPSlD0sjYhTDnTltWGOMTYNmgeuTqGGo1wGL5
	0hLyvZoT11E/LR3wcYjZzx0ktyFbVswa0Ysm6ZpzBtILumd0amC5lV9H17reyyx7cYGowd0XrL/
	DC2V9WcQ223C2mt0mH/fCekC2Q5BZoblcsAWjWoW+cFS+ukYWv18jSFDZdwsIFZAxs/ZsErW+ga
	IzqR9sar9irc8Np6IHiQMEGN/m6Z9qq/+RqrPdPz4Jgj3JYHhdeWAkQf5koLhEIGnBsDJzA1pt4
	=
X-Received: by 2002:a05:620a:254c:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cd0113e3fcmr1865032185a.45.1747065610578;
        Mon, 12 May 2025 09:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgCdyq3zyS28tN3F2p/Ex+KYAVnsB2ZDiCcC9Z5PrA9qpZZZLy2A7EDKvjbQNL/WjcEU2bg==
X-Received: by 2002:a05:620a:254c:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cd0113e3fcmr1865000085a.45.1747065608247;
        Mon, 12 May 2025 09:00:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c3502dc8sm12723831fa.79.2025.05.12.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:00:07 -0700 (PDT)
Date: Mon, 12 May 2025 19:00:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
        robh@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        beanhuo@micron.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
Message-ID: <34kz7pj7bjbmpfyrlwf2u4vikrbbmga5mxv2i7x3zga57qysg7@oou3m2rbazdb>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
 <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2NSBTYWx0ZWRfX5x1A3QfPdFIx
 duz509Og4Ca7TbqwE3NNzDIIfVGr5laqv+w7EwjuNfa1piPpM67n06vhZ2xobl3qYDbBG1dZxre
 WSHMO48TAiMZoakvfmHBPeP1pBRIYYQMcHgaDb2KTPfBjdiflTxaoN7KJsro/GxmtnirDaWI/ps
 xIb+Blfj4RPPBAeu7tjZ7UCPPEIx18tRCqM7emCcVRbhDzUMKM10BhwwqfmHBvVKWIVeAZK6qjK
 sXEtD2hoHEWLcuSuZPaTxgaz2OTCBrYrAPKpkNViHqNs5cikiRn3q0PWanzAQeCDBzUEoS0OtQR
 zELeer+4zXUY1/C9iJwmEIm/LGCmaCezoMT16fgfJA2WuTDy0YjkiWUNRNjAJZIh94RLcsKflWn
 i4pEnNdfFlu9cBzTvul3XgIBznLlaKUiCXqRhvVAUtb/u771wHvi1EdYsrnVhf0t7l/cDGaO
X-Proofpoint-GUID: kQy39sVeuHnF45wz6nLrwELKEsAizSGM
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68221b0f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=L0YddVROYn7RqkBwd_kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kQy39sVeuHnF45wz6nLrwELKEsAizSGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120165

On Mon, May 12, 2025 at 01:11:08PM +0530, Pavan Kondeti wrote:
> On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
> > 
> > 
> > On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> > > 
> > > 
> > > On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> > > > On 06/05/2025 18:37, Nitin Rawat wrote:
> > > > > Disable UFS low power mode on emulation FPGA platforms or other
> > > > > platforms
> > > > 
> > > > Why wouldn't you like to test LPM also on FPGA designs? I do not see
> > > > here correlation.
> > > 
> > > Hi Krzysztof,
> > > 
> > > Since the FPGA platform doesn't support UFS Low Power Modes (such as the
> > > AutoHibern8 feature specified in the UFS specification), I have included
> > > this information in the hardware description (i.e dts).
> > 
> > 
> > Hi Krzysztof,
> > 
> > Could you please share your thoughts on my above comment? If you still see
> > concerns, I may need to consider other options like modparam.
> > 
> 
> I understand why you are inclining towards the module param here. Before
> we take that route,
> 
> Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
> on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
> based detection?

Emulation platforms are generally not visible and not supported by the
upstream Linux kernel. During the bringup stage you can apply any kind
of quirks, but I don't think that FPGA or emulation are of concern to
the upstream kernel.

-- 
With best wishes
Dmitry

