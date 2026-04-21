Return-Path: <linux-arm-msm+bounces-103945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMLAGWB052lc9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE143AFF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4DA3300B51C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798863D566A;
	Tue, 21 Apr 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLNVAWjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDakIPHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F7E3BD653
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776192; cv=none; b=n37i+bQChLFMkDwIxrxgnb5pkAmrcwEIR3qS/8AjKboKHx9f3tdGLGz1WLZgRtGfBXZQMDJ9eyqmvj9kqI5fqPu6i42O8+7zDt8OeUeCQu3552irKkhwnUcaE4mhdW8GzeEi7nD5N7z6F/ATUYVkP+0EYSoNt5RGQUK2wotf9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776192; c=relaxed/simple;
	bh=fZxcstZOtHZken6KyX6sF1sb4GT7D1BHeIJ10cAP5OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSVhmlMZc0EpBZuBqcvpPzmfg2Roziyj8SQCDvRRoQCs3v0uiAYjWxdLysYVT2SAcO0QEpcA9Fm0u/0Ozvgz3gy6frjqzBbc6L5Zn/JT0VVrrnNgvzC+Yo0UxcAOLkmDMWvgAu/KTtCxzZla2PUHVt88/06/xFJxdMqwom3otok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLNVAWjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDakIPHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3RON1085706
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=; b=JLNVAWjZJAjaSa8B
	7Sc2N9yzIKI/ZHt2xq4TGTGQGkrE3wIIoR0cu262e32Y5o14hRemLW0Jpdyjr3Rs
	JZkr0gl1yvIUQC1/a6W1iL2mJPeExY1TeSqK6hhg7iNwgDo+aYmvVy+ERUqRIFqz
	pHHPWdvS0a9NwczufXWIjVKPgPFqp6ECU6HD/QVrx/g/HT5OY81eg8Ys7nXABEcq
	/dNwFptXf2XA/uhTr5AC8y3enVXKL7up28Bcn8g24owH6fijvTC5BYFndTF56NiJ
	CoMz1gUaNqkKNkr083PTv2EgC2B50/Z4LFWQWVMVmzS/0A3ZRd4i9E12EjQaLlzN
	0/D4rA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a8h1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:56:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so1036061cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776189; x=1777380989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=CDakIPHCDz8M95HHeILYTLAn+CtJbMCMFBG0opAsR+kwdgwHZftA/BnHv7e3aWsBSp
         na7YxeEXBgmyi8aLo0FC8274hiv2Z8A6KSFOGwmpwNkUFNiD9fx4xoMMOg4Dp8t5cg/s
         Ug4W5rzKjptqA6fXpGxAO9EJYepZ6ST7nBiHIrCC0BLTpcjA6u+GO/mUWdc+Pb9mjLNf
         iDwcWY+v3R/8TySBtOWmoJHUfNRw/tlRHhifAw68Ovgakg2GsZg1WqDf9039mjswN9Wm
         v3784+ADrOK5weYOzRgSgTydJZWs8UtDDD3uSjpyrd2Fc5j4IVZvPOF7xcpocPb/mIRI
         5GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776189; x=1777380989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=nPJBqUUu7GM+8fXmXTgmVULyA7VHl/0HjwXF8DBlUvQ+yFv/dEdFCZKa0HIFMq/6LF
         kkL+2razJZvNitoj7HYFk/xDVU/ISyGpkCi7LeswBNGfohEd2bddCerq97g6CZwaZuid
         yPweKeGYIcXv17PSZq3jkZNYExWZA0eR6K7bf551wlCTTrYzQUIIRxy8JFuv//z5wRPr
         6MzPUfuIjBBIfdVrNCblHGLnzf563oQkczXNX/9C19sXkxGBj/8d54E1gD/G4YaWrRdy
         IXQOFphBvRuS8vlORrKxLSgakQcc4pRM7V/xWUYe3C2jn6wNkKNpRx2+c14U7UF6sql+
         vaew==
X-Gm-Message-State: AOJu0YzM3jazL5++RiBtsCeIHgf4nOQM8rE8Ny1l9PffyZacZTzK2QfM
	xWOa13JNQkBOyUDYcNRUMEtTbyGmSzuwX6etPxYOq+9cHijM4pYqN8UJ0VX7WJrHnvzGzqlRGeB
	Z0z1KNryBYQz8UammNMFrwPxQUp2k1u233GmlyktsLNctQ6JJLQGi1+6e5q+oXfnol584
X-Gm-Gg: AeBDievWR+k1UpGCmRgrZbnIl/9Uccv0IDSvH+UKsce39Yub79oo6EaDe9J+1w0X2Gp
	1nj0cS4Z22GDCsfs938Bu7/5QryDJ2+30CQYXJBJPtDnwKMbFFJJqn3avhG8CykwibtR+UzTenK
	ldYd29WSOq1BmfYvZeCx4z6QTie4x/1HRtvszF9AfggqLF9T6ZzyN8CZSzlXSfv49G2LlavfwIr
	fLQ6cZ5cLTqbGr+xnDrMI7RbUoQ4Dt4h20WCESvMG764td5eG9OK9iyelsn/JUeUEC37hBxLVhG
	UwCfQ0QAMZpFH5VREPKOp/3fVVx2QeCMCMVTkR0m2Nu18+47Zh3Fx9ScAwGc3guJCKLHU3l3Acc
	BjMJTxLsLe5PjmgCsnRAc9+XeXlG8tqE70+j4iilV9zq3zmaIgLJfdoKZaMqwFtGtylOjoXvA0a
	YCIpsHVpimLBu/XA==
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85384031cf.7.1776776189474;
        Tue, 21 Apr 2026 05:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85383581cf.7.1776776188975;
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2692261a12.10.2026.04.21.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Message-ID: <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:56:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z68f0mg4UHbO7FwxZUxUbc4yZQDwaXHu
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e773fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sxPfDhhxBCIg7INJgBsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: z68f0mg4UHbO7FwxZUxUbc4yZQDwaXHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOSBTYWx0ZWRfXzAJZFZdTkqzs
 nZiO8d3t2kJKaG+Ox1Mqvsf3kQxs0efDUQ41PGPoiCqM/xsHNYWoIPn/pomPCqakLcyPpbyCsXD
 t4vEQgGHPmcLpuaXB+JhtPz5Za3hdkrs60VY/V3AS+qYQR5wDGLgVvnAGcW4mAxt2deBu8ECtaP
 yyYF3ROebzaGSjawrvZf2De0B7QiZNBtZeyyZ1k2wm54r7qDaZYElKZ/M9lHyG9WT7TnZovk6oq
 HKx++RS+43AoGurVDY11SVN9QIrul9KhIjP1rNp889V/SUq8ZirfLCQ1Yi//A22hmsqn9tRfm6u
 WHG1f5/JlOxUyMiKCJ36E6ogQ9uWxXlQ1Hg2dco9IjU4Lujymow3PbS93Z6g3G9kaYCsDReMbDq
 rKK4Np7i6oimXJsla23LWgPz1STOJYvfRSsSSnOgbubo9NNESfml/+C8DeTMqIlhZLr5dQBrbaL
 4/EaMS7E1r6/8UsQQRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103945-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5ACE143AFF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 4:28 PM, Alexander Koskovich wrote:
> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
> 
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
> 
> This change splits them up so devicetrees can request the configuration
> they need.

Please massage the commit message so that it highlights that the issue
is that there are multiple functions defined for a given pin, sharing
the same name

Konrad

