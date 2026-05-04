Return-Path: <linux-arm-msm+bounces-105648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFG7BKxN+GmQsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:41:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD294B9783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49D2301DBB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1E43033C0;
	Mon,  4 May 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoaomhBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR7a1nXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302F2D238F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880433; cv=none; b=JsAJ5cpYhlPxic8qty73H+l6Mql5Rj38kkU2AVtmJHWPNEbjBL4Exg1xasLmsWfKsYg6D+mVrdm22QJhU1fT4uJaowv8gLTewisEEWVn+9gqTMPz7KJtjBey8aBHzMXPQ/2qdGSxSiGs2CdTq1LeHcZzAUsDmUupt7MoBvXQUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880433; c=relaxed/simple;
	bh=CxHY4RvIZsFVhZ+sfhFRyOxtKsGuxa202wmwVB50kfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkuS1aBcGvjQYlZdymp6bw0IDwp6CtS2ZzidKGEMM4SxB0tFVqJvBJ62yj9GRR3E8fDDPJhyLZoIyxzqfze5Nrgc4RjPqGmIGQbN7INxRw99y3kmYiTp4qxOgbU09I1p4WfK4Cd9JmLCSDfoqDRIIg/MOG96n44jh0Pkb7yplBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoaomhBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR7a1nXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DA2Z147182
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=; b=XoaomhBii6vH9AqL
	D1IMpS8AEOAFl8pbpgOoft5D2QxekEvTVYC/iMlgyDaCZOY6153eEmRxIH5CiPwI
	WIuJ9AF1wR1KS3AiGm6XpZ5+qAtRrA4GDFnizPStVshUHVjkLEdBAI1zoNllPqQY
	i0tPlv4tOyth2RQdpbrRbPq7C94lTTMNz6vLC5JLQE/qHJZNm6Pz4G0PG0mzPA1h
	MRPrIdmRb7qkhshtoITuuQUDSGMBARjthU4BP38IOqQkGjOOKnbI2OA2VQ2hZw73
	7ylxoOGy8UHoN/eQEGpobrQIOzJicKlK7YoU7HhOVBc1QjGFa0TXZbHX4d+685Zh
	9o92Bw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxmsu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:40:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57535a51589so14536e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880430; x=1778485230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=ZR7a1nXl9i/4+jyXKzvEVd47QT5COUQXqnAMhafxBn31EbXS70Xci1npYPoHD0/l8I
         5U7ine9kSsnWqHtK5nW2k9zcafIDWVEXFirGS65pCUDZqG+CKN3T5NZOCORCSJkCU6MF
         p3oDX/2Q7WExmEIPCVqsp1k816cQW/9Ixssrf4Es4Y2A/gM6TNBOW9UvsaI2BSqc24+6
         2bxXiN0maRRIxkGol6jyfZe9N4Q2tdak6HFKmWThbXFtUIvPFUFmDJClgH+X9Sjpt3sQ
         +zUMOjePPUrZDXFLa4UYSWO8A3kkYZ7V5NUt7NkDu6BA6p9Ow4mVRc804MwV4DJ24QTf
         VLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880430; x=1778485230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=EH3fijOSwbEYoGTuW73l5jd2PebaPqtGHlR/w0QLOtUgnG6q42akmVDm1xoDfeoL6J
         sF1fmghyuJAg9J2HVvjl1WLbLVG6SCEfMKpWwStJ2vfm5HXZ9/GuxctC/Gf9XuHIz46g
         UP6Pu5LLKPIAVDM+klp0ijJ/X2ZzSDAmeM4xpmfx/J3fEN5HJkp8Jc16eI+PyQEMx57c
         BIf5tDtMdK6MgQHZwd+L1JmRr6sU0Lrm8lvJM5k337J42n6xOXlqlwNgn391N/+mjy+r
         TqQyr1T1Ai7FcjjnnRAJjk4sbpHopS/dS9FJ/FI3xmyDU4OXB/lKvZHxUVEPmq3RHkls
         WcYg==
X-Gm-Message-State: AOJu0Yw4SSxZnO9iYStHLb6A485HbEmLxcPXpwW1feuCTKUIqiBdf538
	pALeQLY/5L8G6ZUDHin+0fRZ73K9ocsQ6kpd5MWqSPWq/Jusmu7OWK+szDg1sZu9n5/ilg5zoNI
	+r1A89V23ryDiZVh8MAgipix9dkoUdSVKu82LEtPZCZNsSCVDAxuJ/qDur2Hbg6jNwDnF
X-Gm-Gg: AeBDiesggxxMnBviMzWOi97QuVvpDOARdzBSSnwrdBWBfj38dsgJ7RfacTSQZ9hwJ+D
	954USFw9vNSnqKPkinGALowByXQv3hyWztlg3ILttfx5pdY7jLUWqpS0WwGTzbCtNRkbUUCS07b
	Lxrxz324m8GLnjlx4a2XjrrbpTa1k44MKIift4pMAvaEnV91OGmdAJmrAlX5wVV3ioRPl0Jye2N
	Y7FpK9F7ci8Xt3/i21r6VpuOmZixFVC6OgbaVibNwBZYPo0npL9cH1y2P/EE+4m5ZMreR2YdrJK
	RtdsuLF9Fk7zsFQu3Xw8LhzkkeDcOlY3f4cuPIa3M9La+EN8d2hYNf5ckbJ+0gVZOWrg4N+MW0n
	y4A+CyVdv6txsHcaHD1011ktTGleNS495xEYj1wr0X2pBFkj1NjcGCpHJD1wZyRQy4CerWXA43Z
	yGV7hoVLnMsYSGHQ==
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773068e0c.2.1777880429993;
        Mon, 04 May 2026 00:40:29 -0700 (PDT)
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773066e0c.2.1777880429549;
        Mon, 04 May 2026 00:40:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc20825b337sm93249866b.23.2026.05.04.00.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:40:28 -0700 (PDT)
Message-ID: <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: MINETTE Alexandre <contact@alex-min.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
 <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GyY4BTVFI48K_HawKGCQOMervU8RC2zJ
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f84d6e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DDlRktX6VRAlMvZBBbgA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: GyY4BTVFI48K_HawKGCQOMervU8RC2zJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NiBTYWx0ZWRfX/P6KHB8y0yTo
 FhRIbGSHAbNYD6E0UvBfEUFF2Ct6XJs+rmPxfCfH5w/KGcgQTw2BwJUeAgVf5xrlkZcsHQyQRRa
 cF+FE7ao7kkXlvW6QBrT5oDUEbigoxyD8a4urXFpCXmGZn2rPKwr+NVNFgg2Z6rqpE+yrK+OwtY
 Jp5AdNXeNGi7hJPRWngQ0elEfcwsDnZeBPnShmLHkCvHJy2kXGbiaHKR+bGqOgGeXdEyhJyv0Qj
 IutHP1zg55tIJmOOuRZ4Kn+tml1DI755rLh/Q1BdQ1q+AI2sixnWW2BECSF7gfIAib+bz+q3UD9
 kt7N6QHbn1n695uFLsEwXebjCZb9JR/YJzMJ9nixKl4GRTiZwcDLJ8t5vPZeVmTRCwEjHVQIxNq
 8TG5agI5TDIVULcyvuWdeRVkSae24ukuLlOL1AGjm8KZUh/hO6Rqn5t8pINj6asnNbAoj/7ALaQ
 By7O5RFY5LSHTjOr0Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040076
X-Rspamd-Queue-Id: 9AD294B9783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105648-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/1/26 9:41 AM, MINETTE Alexandre wrote:
> Thanks a lot for the suggestion, I checked the downstream board files
> and it does not look like these buses are wired for GSBI.
> 
> There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus on
> GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
> GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
> (GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
> to the GSBI controllers on jflte.

What I meant is that the pins that the i2c-gpio nodes reference
are actually wired (inside the SoC) to the GSBI I2C controllers.

You'll notice that in drivers/pinctrl/qcom/pinctrl-apq8064.c,
there are bits like:

PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),

which mean "function 0 is GPIO [implicitly in the macro], function
1 is mux to the GSBI controller"

Konrad

