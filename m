Return-Path: <linux-arm-msm+bounces-110260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HWTDoV5GWr3wwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:33:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFD601A9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E80713018148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574133D7D95;
	Fri, 29 May 2026 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LizHpr71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jL5DzQsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431D3D3CE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054397; cv=none; b=C8NX92pCDr6GOCW4EXar554peyGpHr4Doa8mrEFQgys8CrBEHxL5JtruSxSm3QXiq6erFtooLQt2cM9RAQuuRiDWhPOLp3Hf6bpx9M5NB4D3qWYABL/6bEX7v5oY18Rm2QOxXBToJ1SAIeKfEr7pR/6QWQpI/wtZCOcLMrBuxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054397; c=relaxed/simple;
	bh=tk/ESQWS+XA0G3eL/z1s7DjariWy4PtM1reR0QtNh74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSTcGIJDDmp8clpxNiP9mEtHASrFwrK/mKfNHaGEDpSn2KRO+YF+UIF04+fextZQYDm/bOsFQOkxYeZKfBNE/ReQesH1D6Pb07iPthP4yD2zopowpYPnFcB+a8EnNYQIDAEg8ZUFq0VqRiJMK5Tndty52HPTzphnM7SY1nVGoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LizHpr71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jL5DzQsd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TA5iST3677608
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcwCFtKnzv3LShfYkyp0eS23
	qFCvWy1MIYWSH6XRLXo=; b=LizHpr71MNelzjU50M2oTILZa3oluiEqrGNOIJaZ
	jFvUim2QVC8TfqbCb2p5wI/pbu6M28cfJuBaRFUeEuYM55tDiksGVKcO/8O4hZlm
	eMMAt6Hj9H6vC7Adi1/10gZ7XKm3HyhxPbsZmaY9GLDQGyxFCsJ+TZbQIIfBR88u
	5sU+7IVjE29w9B43hUUuXGu/ak5fpy3qMHTgb4BwBmAFVRGMQ3fCCnEGcnyQxoEC
	mly95J+ztao+tYwn0c3bob4TnU8vbUinuompOBeSaeIgSgeCrXWBHwimleXKP88A
	3UfJ/zO86fkBt1qZwOsJHd9iWxb/FQBtUKIEa2dbAxbW5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcgay8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:33:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d58f74b0so87614551cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054394; x=1780659194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcwCFtKnzv3LShfYkyp0eS23qFCvWy1MIYWSH6XRLXo=;
        b=jL5DzQsdxOmkJhQew646xItMtH2rUb0+9hwVxcCrSyODkO7B64wmvtGOoy7YLJcaRr
         /OZ/oj+eWb1zFwl4hOjnHEUD1pGCWf7K35PU7rgHHl2FeadUp1Y7694PBWRIR4r398Yf
         KQFqbrZUn8ua9kWQhOWQEJh9AzqIDCT0WIVULu6/b7b8gxNkBM8EnDIrPYth9ztWRRNS
         p6bC6zW7+Z367IArFpGfL8txg0DhyZ0lyCblnRJ9w2N0whhRZuRUdv6Fkkr/7/nQALxu
         yIU0N21WVUE5ms8OLcYF+p4UeXko5BM+ClLCEKloeinzF6OdQcKHZU7EMhyGjpZyqILQ
         UnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054394; x=1780659194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcwCFtKnzv3LShfYkyp0eS23qFCvWy1MIYWSH6XRLXo=;
        b=sRH1RakpKTCOoFg0suJFdrPxzp3IIS7MNl3+pnxAcivkLnqpLxkBIxETYaXvdNlkXF
         OWPsHrky6K5NcQoYszzqrxYx+AsUPPxHG86qGpUZY5WimORAJ1+FWIfXQuUridowoMnp
         niu4r2KSCaFnuqp8gqCHYYwl7pVUhFjr9DAJBfWSe939P7wYFuHMEo8WGbTSJ41AewjE
         /PQvLs0P3mCejxu8jBGyT32kc3zshZc882jyWgacYM4xA8kTwIAkRSpGQivPX0SYWxQJ
         r8XkwwOZ773C2qCwqfFtczF+/kCAKoWPhhLUjkZbmc0iXGKNSZW+ZaO68RvReal/ZsnV
         2uhw==
X-Forwarded-Encrypted: i=1; AFNElJ+CFEqIgDEF2ZfH5DCltw2SZDD9AEgvzsUTJdgkIupGlkrEK9gP8FlP4X9TPo9vn098xVlYBLLIa6iYeMFr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5xZqs3H3H1cKhlZ6bU1rL3ZL7AWS+edCmliob8rJ/Xk/95ZC
	JunSNwV5C4YXx9bSAzjJcJw8pNG8VlFPcsT5dniS//H1AnllKsVxSGrfwAIsf7G45dL3zPFaEf0
	mpYmWp5hb3AEhZ0/o06UpHDY9Yh4zclgncEA2k92cPx5fSM2IyVtyxiEu7zMZxn0Usf5k
X-Gm-Gg: Acq92OHdYdzIyOm5LgnuwZnl+mXA9V6CeiCX1dWN2KffLQvwrx90inoLzsffZE8aLYa
	T0mZpBEjyXerkylBbIjyzsNrP7lr1Hp7jPJQsyAC7P/J35l+dRSs2RjdHHVIoO7psGhsrA/HPEk
	lKziQvX3QR+yUaIEbLnaCphFNKt8gWdfm4Q7QeE5CBzkQkNsxt3vElsKOwg+Sjqm/iQ7xVw3iVC
	XCbXCry7bkKgAPmh2lbWQ7o8xj9OrrIbWVj00/nneT51odlQx+uojL2i4lQt/fNM6MSr52g5cfg
	mpNU5dFq5rT5mcuODNLJKlj27yiCwYLhdqSczq6WBr7dmFVkVAwwtsVoXajy40QQ77ptTWPprB0
	Y6aw5kr3/38pqxwHxYV2jCzQlgQdgxmnvMaAaLlWhX5s7yVjeeb/waVLIDIsO3iX9Wj3pJ9zXRR
	ME1mizUN6TsHhviG4YPfnzq3di9gMecz5gMyZEVrkp7ISNaQ==
X-Received: by 2002:ac8:57cf:0:b0:516:e0eb:d87 with SMTP id d75a77b69052e-5172dc50433mr31984271cf.16.1780054394346;
        Fri, 29 May 2026 04:33:14 -0700 (PDT)
X-Received: by 2002:ac8:57cf:0:b0:516:e0eb:d87 with SMTP id d75a77b69052e-5172dc50433mr31983871cf.16.1780054393846;
        Fri, 29 May 2026 04:33:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06892fsm226898e87.13.2026.05.29.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:33:12 -0700 (PDT)
Date: Fri, 29 May 2026 14:33:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
 <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
X-Proofpoint-GUID: G9_rh4YNZZqRvS7GVFxRG1tsawC-o_uy
X-Proofpoint-ORIG-GUID: G9_rh4YNZZqRvS7GVFxRG1tsawC-o_uy
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19797b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ru1DF8YJaokbvtfr2H4A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX+/2X5m1XIdvE
 Wt5lyQvxYcdPp00YfFUd/54vZUtrHKHjAOn/DN6K+57bPlZfZiUoeQhlYeXfASzyPGkJGQ8+Jb1
 ogIV0yeqTWz2inYT7YxqeOhS+RQkflO7ZXyR3aNGye4x9NOo907H10lsKPiVcEiSAaew8uzBff0
 CRhI/WkflhUouZKSyRR2SDIOtB+PL+elVPc5LUmgfxeBXOcDChgzfqNRojvihgpMuHBqu83qPsH
 kfkwbwGGEQtj0LO2pdxtTCe+8a5YhbaRdCI4NPk2yRjzZhnVQqoADE5dyOOxkUjSoqTr/X5YbFm
 dGiffM7E8+ekCMmLuw9K8NZwYjfbtC1ArOf1J3Q7bFa1y5M8iGGFDBDuN3I6VhuFyyOxYswwURQ
 imqZDIcJfeB5NR8BOtb+2brhzmGS7KCquW2sOWzohaKetzU8/SboZRYheNNSIA6mHw9w0bfAq2x
 4L18SeiamvQ404n9m0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110260-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39AFD601A9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 02:53:29PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
> > > The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> > > but has minor differences with the number of input clocks. Update the
> > > existing QCM2290 DISPCC bindings using conditional schema so that the
> > > QCM2290 requirements remain unchanged while accommodating the additional
> > > clocks required for Shikra.
> > 
> > According to the IPcat, display clock controller also has (unused)
> > inputs for the DSI1. Please extend the ABI for Agatti, then extend add
> > Shikra.
> > 
> 
> Sure, will add the DSI1 to Agatti as well. Since we are extending the ABI
> for Agatti, I will remove the clock-names from the bindings

Why?

> and update the
> DISPCC driver to use the indices-based approach instead.
> 
> With these updates, the bindings, driver, and Agatti DT must be picked
> together to avoid any functional issues or ABI breakage. I will explicitly
> document these details in the commit message in the next series.

Well, no. DT comes through a separate tree anyway. Be sure that the
updated driver works with the old DT. Also make sure to not change the
order of the clocks, you can't break the ABI.

> 
> Thanks,
> Imran

-- 
With best wishes
Dmitry

