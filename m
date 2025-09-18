Return-Path: <linux-arm-msm+bounces-74036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A011B834F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88E6585FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D072E2D94BB;
	Thu, 18 Sep 2025 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XongnQpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD72E2EFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180355; cv=none; b=kaoGaHOIu2Funf7a2oSLO4us3S3A+jJQRG/aNenO3Al5N73Z0k+nmLrT9OGzoqrMy1RyLaLwRnl9giHiJx2ZOfTMhuaNCjWWqKuIN4UNWGbJUIerM107PFzRinxgIo4xBlED5rwI/UGbEydtjeCRd6lpNEV0QZc5VRocmwdUXU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180355; c=relaxed/simple;
	bh=45P+u1tAv3iIaIuLoskmjiVZLMeXMtR6uk2qfhZEw8g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlYBs/K9brlR2mNdV3go5/sQK+2IhYE4SsheO0N/xPUm+o9ONOgg+ZfaDrzu+thCVsxkmE9+AveR31Cj+AulvUpNW8o51srjVPWq8UVSzawBcmh/8WwKVnnb6pdLy0JbyjxYmXvj/9Sxou8QSnOoYh40u8rd/pIluCYIhPqGDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XongnQpY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2wSGF019633
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgWSHIxJ74v4zLjsbadVyxzqod/mpaz3qAfwUznSiDQ=; b=XongnQpYkvgKvGVn
	VrnFIzKfWLlxMzav2ddn1gCVtt9Sm97uJ+egvupvTqanEq8wS7JR6IArYo6fR+eQ
	cVAb0pjcFDQfyKAhAnoy9ai0SA6KxCVB9jIvKm3tTtFeRJNOIMnng1jJlqPNybJW
	Blhi462XecdgtTCATGaNjAWHmFTnoZ+1fnfSbwDuUA7sI3Jh8521ycaOZs3P/by6
	/yZoKpRDd1tc4E5RI8eVomU0SX6jAxsqbPNlxsFd0H7YqCCcptDUP0MKeyjtC4me
	kzscr/EvrYgOpM2ywukseYup8MmBrwz1i2INr/5brPR/Rb1psu+jyabLcXrZT1yt
	/gkn8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1wetc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:25:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e972eso10828456d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 00:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180352; x=1758785152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgWSHIxJ74v4zLjsbadVyxzqod/mpaz3qAfwUznSiDQ=;
        b=IVD3GmpNGriaP6cfm8X95DtBjm72dL46iDoYcnOBuMRM0SHxgHRPRAEPj30Eyiv67O
         xG0UVtV6Hv/HzVgZp0dlSrMsZJttDw9kDoTNumSO+lZPo2+igwsOAyuq1wajnfT6BynW
         pPLWslqV4z8T48TKN5FcrCPAapAtpU/TCze8gqI/ZS2FeGOBmI18AenM03GSRhFtHZV2
         lLBrIdh99QubjH384I90ME8bZMShc8cqAYAd3/R7J+aRK/s22Dj8fSHoWF41BGAcS0Bz
         clOYU2cBV5griYcJl3FcK01QJ7KMud8refAvK0GlVWg7n5Y1etElymktdFsmwQx7eYDq
         a73A==
X-Forwarded-Encrypted: i=1; AJvYcCVdqvf546vl2eFxtz7zTXXH8CuaPoPoUVK5GZM89Q3PsPUHFaBvrIro+f36VoWc4qU1rg7It/0UIsfk3n1E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19yMdo8MfSvyeN+13/L6Pl+h+X+BoqgnvyJpAB9aOP+eqPSf5
	pKIBYOt9Y7W6C2mL6fyoRs/SvcXSAz8wyo4gjwMFzBFiTFZqxabZGuBdpU8t85j+vkIgBcqVNDQ
	dEZpQ8rOfmsCCCndFaw/dSo7nE7DO755ul9w4p1f+9XJTGGRyS3MLuSWe/tLEzSVfyALR
X-Gm-Gg: ASbGncsOIdgrcEHkHNGkYCSg3p+uNA0MlFFoGmmodpQ9ci76DnmOa0/a2wR25ucZ3Ke
	SqZaI37uh9d77CX5WTzcb1xEcGo7AihVZd1X6FrQVtbXj8jpoDZ/6YJKOinDSvem3oMeiHY4Dkk
	firbJzZzzVB00l2GaMGOHXJZBKCP+pYaSdOvBylQaUephGOlvEsHqFUblX0wz4PqqEFhnQaaNUT
	fFDqMDcj6zFg38FU94UDrUCAJgRREKiJI4O+eZfA36cnzv8OBdW34i0lFVsqpc5pHwI4jQAVglC
	6ZgFEkgJOyOfv+6HwBshtNMMx3CIVmY6aUXoBWW+FigIePAasoNVwIiF68IbMQjmPUVjtA3ZRLY
	=
X-Received: by 2002:a05:6214:c22:b0:792:d0c5:7155 with SMTP id 6a1803df08f44-792d0c574efmr21812626d6.18.1758180351831;
        Thu, 18 Sep 2025 00:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNAnAVp347GePapB/xQ1YAYCNvzrXi3Zwnb7APYVakX2+Y/D3TUU0hrhQldlXBUl+I3q+K5A==
X-Received: by 2002:a05:6214:c22:b0:792:d0c5:7155 with SMTP id 6a1803df08f44-792d0c574efmr21812416d6.18.1758180351169;
        Thu, 18 Sep 2025 00:25:51 -0700 (PDT)
Received: from trex (152.red-79-144-196.dynamicip.rima-tde.net. [79.144.196.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f4f9f339sm30217505e9.14.2025.09.18.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:25:50 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 18 Sep 2025 09:25:48 +0200
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
        quic_cchiluve@quicinc.com
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
Message-ID: <aMuz/C1iT8JtjXbQ@trex>
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
 <dab18f70-4017-4c06-92c1-91cfd2229540@kernel.org>
 <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
X-Proofpoint-GUID: RNOfxyiXZKB_lWXOAnxA-LNhlYhPWpY-
X-Proofpoint-ORIG-GUID: RNOfxyiXZKB_lWXOAnxA-LNhlYhPWpY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwQc1z32nJnGf
 duzBdVP7azW3CUnYu9qlCDTR4uSQQ60S5KxiC/pjKjPv0oB7NqkxRun07RIti8/+3+xOPIi1GZs
 iK+RFYJ3aGmEGuV/OKLPq8tQdFJoeCDWnMGtrZjx0234aNxNucjxP5UNVqsYFOZWABD3EiHou15
 sp82P5i1yupl5IsD/bTAMbWwJOkt5cHwf6I7zKCMVssw+nDTWf0xoAH25NDjoBQcZUXXekdT4jg
 6okByomnxJKR+ULdGrDq/xIHmZe4CKWIgef5Qe/FKN8JLVLoBGgiBffMEw+Hi216H9WXbxoXMLU
 syAlelujlaIg+ZQqAIIgRxaxfV5nFdoiueg/dTaiUs2zCwai/x3JWRVutQdIFbdGWQX2mhYLuRw
 LJU7H+oM
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cbb400 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=UlsMzGb/nx+Jy78HFkoo8g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6bHfGmxriAW5vq4Uz9YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 18/09/25 09:25:53, Praveen Talari wrote:
> Hi Krzysztof,
> 
> On 9/18/2025 5:28 AM, Krzysztof Kozlowski wrote:
> > On 18/09/2025 03:51, Praveen Talari wrote:
> > > A stall was observed in disable_irq() during
> > > pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
> > > while the UART port was not yet active. This led to a hang in
> > > __synchronize_irq(), as shown in the following trace:
> > > 
> > > Call trace:
> > >      __switch_to+0xe0/0x120
> > >      __schedule+0x39c/0x978
> > >      schedule+0x5c/0xf8
> > >      __synchronize_irq+0x88/0xb4
> > >      disable_irq+0x3c/0x4c
> > >      msm_pinmux_set_mux+0x508/0x644
> > >      pinmux_enable_setting+0x190/0x2dc
> > >      pinctrl_commit_state+0x13c/0x208
> > >      pinctrl_pm_select_default_state+0x4c/0xa4
> > >      geni_se_resources_on+0xe8/0x154
> > >      qcom_geni_serial_runtime_resume+0x4c/0x88
> > >      pm_generic_runtime_resume+0x2c/0x44
> > >      __genpd_runtime_resume+0x30/0x80
> > >      genpd_runtime_resume+0x114/0x29c
> > >      __rpm_callback+0x48/0x1d8
> > >      rpm_callback+0x6c/0x78
> > >      rpm_resume+0x530/0x750
> > >      __pm_runtime_resume+0x50/0x94
> > >      handle_threaded_wake_irq+0x30/0x94
> > >      irq_thread_fn+0x2c/0xa8
> > >      irq_thread+0x160/0x248
> > >      kthread+0x110/0x114
> > >      ret_from_fork+0x10/0x20
> > > 
> > > To fix this, wakeup IRQ setup is moved from probe to UART startup,
> > > ensuring it is only configured when the port is active. Correspondingly,
> > > the wakeup IRQ is cleared during shutdown. This avoids premature IRQ
> > > disable during pinctrl setup and prevents the observed stall. The probe
> > > and remove pathsare simplified by removing redundant wakeup IRQ handling.
> > > 
> > > Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
> > > Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> > > Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> > > Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
> > 
> > Where did you receive this tag for this patch exactly?
> 
> Since Jorge was involved in validating the change, I’ve added him under the
> Tested-by tag.
> 
> Please correct me if I’m not supposed to add this tag myself.

let's test a bit further Praveen - we need to validate/trace the wake
path on a real scenairo to make sure it is not cpu intensive (although I
suspect the 2% was due to the storm you described more than to the code
path itself)

I can then provide the tested-by on the list.


