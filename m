Return-Path: <linux-arm-msm+bounces-84270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6873CA2190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 02:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1378A3020688
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 01:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE32221FCC;
	Thu,  4 Dec 2025 01:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyvI+m6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGRERRa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A328221726
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811562; cv=none; b=qAQRGsrnpgc6atotOxn+QRXqpuw/qcTNMXlb+vRH0kVPARBKqxBP4E32uyRvoLjCpU+wfLh3tJ60lRDzLRBpsPyD2aDZNZfrxU8JP8hgEiKWTQ3qPMhmxqlIqqAfV2ybtR4hOQg+IZxmpKjRfbeQF3V+RJ/LdLZXLnqGEUHbSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811562; c=relaxed/simple;
	bh=Tx5+zvjiW7F+Q0/qWye8fIgBNYvdodAxTIR/rWcat8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmQ1pJJIBeFYmrG3LzfRWA5z1QgZyt1bxLj3ZVqS3Fa9lN/UwK36FFtNNHaQcUKxL0tWzdVFybhsvKPAFqT/l/kynPSulXRyqOx0PPqN+YFku5PJR46GAwnsBdXAu5T7z+O99Tp87ARfYO7XGlJetMxx0ofTRBP9rYdYgmKL7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyvI+m6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGRERRa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3LZkYD1536229
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 01:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpvzOCQNo33Ia7gOc8JtFvxZYWFfnKi9PF+JmbAYiQA=; b=IyvI+m6V+amJ7jmQ
	f0ftVGZkm+6GOnzcWIDFLq/yx7BNzWTFk21cGs0tbSKhyVgtmPsocex3ZnzLHTW0
	mZRm+wilDxihD49NEiQYwVwUHsd5aX2xNCIlU2cDO212i7tBko90YCDqrJuK+m9l
	jzdAPa+ZJLnOoeb+Y7jLV+yq8pUgnZAk98oAL9B+AR9zRxQaHRqOYwD6IrHI06sn
	wxXPMDj8kWA3bzn3Er3ulqpaoOuJpqDr/20lHL1NPd8iRHwhsjOQf1y/sr2qftoY
	CGlLDPRlT1EwwQ92Qc4gzsajZ7qDzezR2pCvM+couOW+OihHiveg/e11gQsxfYi9
	eWsUAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0htcr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:25:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so49813785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 17:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764811558; x=1765416358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mpvzOCQNo33Ia7gOc8JtFvxZYWFfnKi9PF+JmbAYiQA=;
        b=ZGRERRa9HGH5Xz8aKOJ+nDsESlSucgLQAqXo4nafEDuLfVL4MDToTgZp99CApRsBYD
         19MybderEhezYhab4ZI4AR4VeR/XoOGQ16DqnIu6kpGGB7jPwgUOHUOSqAW5tfxSK4Ak
         MDQjGMMVQAcegISXZApPPxluqsTzmMvuU7eMgwm5GIPPGBp3+pRjT4QmCd36RYmtkzQ0
         eYgNiO1oJyCmHrgA1Ye5fIC3Lj+L8vOG5QQlSPEIUdDLKwAU/e4DWed7a6h/6951Q8im
         mqZysJbWBg4dc6Tbm5AwTuYXgd/RJagPDgGbmC6fI4T1mc3vQ5KJ8BWML5dORhg2nYiI
         +wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764811558; x=1765416358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpvzOCQNo33Ia7gOc8JtFvxZYWFfnKi9PF+JmbAYiQA=;
        b=vc1D3d8eFBEwnplSOZ0inp4ugBeo5e9FBMrZw90TqQostoB6vfbSQ5cgGglQc3+5GU
         9CCQgXwdZpq+9YYwy/kTI7tdZT2X1TeeprmF5OPKaeU7Wbc7aET6XYlU8o6sKMCrIB2b
         wrjYK/dCA8nkMVyqyYj4/BRmavvF/YagNoR6PLpl4berdWlUNEMFfbNrNXS28/b8NwbV
         hgM+PLWaJ8bHGkwF98WJYgW3vk796I/a8+R0V3xqr8ynJh4gfHNptinq24cOIMjm3US4
         qJ/ycS5kC5CZTr1GMn4Tkv/7aqPnGihNORPmen7q8YZ8XK+fMBKWjBpaULx+/pagYjdj
         HFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6qvFE1vUQr8OGw0dD1TpkxnaYJQOxjdoyvYw/68N3/FPJjCQBrEgu93HZPEzlm9nVoZ547nDfxxtmTRSc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JjjkpGMO5qYMgONYxMN31Ik/OCb4YmI5sxuaPn+Eg/FJRcsQ
	Z5/6+myy6YDOlID7wHbaBdNMTHCSi3WPb5yINHqHGHmp/tAjm4hKWtt24Q0/Zl5iE0AouRe10//
	xEvdLDABNxRKDUnmBFyUEQ5Auwg0s2LIgpp65bji3rIikqp4Uw0awd85upZpcpxNqa/cM
X-Gm-Gg: ASbGncsvItd+h4HlJaRpfEC1z6s0Ty+MbdUQ/EV76pqu0xkJZSN5UkGdsul9R55Moeq
	0InRNs/CaCYVhM5dsRuk5WWT4zwqBTU48ef34uY+b4ygZTn3Cdy9Rh/1ClsigGu6A89feZg2vRF
	RJwKz/lmDdttI06IIhjJWXGIKmW7rPQRqDJ2JeJS4oqu5dWtqlH6ypLhoZSJzcqiusw6vTYhzeY
	6QWguu0ZxXqEjp+V+s9rid0W1bCQITuCnylrm0AkWhf2Z2CviUdlfWG3MtLxa+AA6kK3rmIk9fV
	pIM3npSQWZU5AEoUC9aNKgVQ2AhzJtBps7Maa/gbVbGgSdrY4FZkzj8GWmRUIFzNnch7RxwgQEX
	Tln4iwxe30atNxBm3vPOdAbnvC0FDUOS2eHtdGxnBYPVCiqYqVJ+BqDNj2stiVu7LdOi15iBcWI
	mbm29tF5GeZxfLKZKDJeEF6Ro=
X-Received: by 2002:a05:620a:408c:b0:850:b7ad:c978 with SMTP id af79cd13be357-8b6181ed7afmr197103685a.49.1764811558214;
        Wed, 03 Dec 2025 17:25:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnxueR7Vb7ZuhZ+9icc4ICE/pDGjfgXu+hTxkd7uJVF0z+Z7/2UVs/GeCYUu+NzcnmAJd+Ew==
X-Received: by 2002:a05:620a:408c:b0:850:b7ad:c978 with SMTP id af79cd13be357-8b6181ed7afmr197101385a.49.1764811557733;
        Wed, 03 Dec 2025 17:25:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f69asm6228631e87.90.2025.12.03.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 17:25:55 -0800 (PST)
Date: Thu, 4 Dec 2025 03:25:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] firmware: qcom: scm: allow QSEECOM on Surface Pro
 11
Message-ID: <cablbrylovzpvj5iyjkjpjfihjo42x5z2zadccu7oeoi5oznf4@ttdwofl2d3zw>
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-3-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201011457.17422-3-daleyo@gmail.com>
X-Proofpoint-ORIG-GUID: LlzP-nAUn7H-EuoHrXkSvZhx1Gk-c6yj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAwOSBTYWx0ZWRfX5T6UuDXnbFj+
 w9jlstLyMPjFEX2BBncX/ZeqTcdSJjAJXUWpqqImbyfqlXctlacDTTOU5vjBjvfbDNpkLU84mCQ
 +rcFZncWxwc49xShy1lNELIsoRBy/kJJisNjWJLfX6TSUPQ+0CSLiRoeQeevMMi2JT9KZY5SiQR
 Hw3FqNqHK6xOPnzpQ/gA0ym+v6MZpMs+V9Aje82tLSOfwXUhtHbn4UsKSUs7yHb6OK8RxGz5aDY
 /qtBlclCQ5S5d7NFRr73rzAhzQpqIj8GJmrxAPpFwmdLXpQ6Bm5/c6UjYu6R78OC0i9wdBv89wp
 6vuMjdbYqg+JfQb6xRANw4HjM5qm+z7ArvI1WvmlsrzMz5F1RhrbTts5NVTfAs+gcnt5bpbOHnI
 11FFlYhMthDY9h9o3/gnKFq/VqtW4g==
X-Proofpoint-GUID: LlzP-nAUn7H-EuoHrXkSvZhx1Gk-c6yj
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=6930e327 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gKbAm2UAwThS6RaDI4IA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040009

On Mon, Dec 01, 2025 at 01:14:43AM +0000, Dale Whinham wrote:
> Enables access to EFI variables on this machine.
> 
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

