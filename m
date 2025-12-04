Return-Path: <linux-arm-msm+bounces-84283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA02CA249B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B3930443E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D7118A93F;
	Thu,  4 Dec 2025 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnel4yhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEWsV1Dv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70BC42048
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821244; cv=none; b=SadFPB61nMnLXxpLDUAYD7TryEurcOhTyObysDHB1vCpwff+LIjJAWgwG3pWlEw45AVurXYRW0wh4+9dEzmCpPjJ5OORsHuGsW2ddrWaNnoWmiTiKIIyZwGOLgo1j13t4dgJr6h59rul66G1e67kmWhEsGc00XzmeAeQdwh1spQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821244; c=relaxed/simple;
	bh=TBcygF4erw7eCj2bfsbd3ARXHPOfwgSHiwqqhLLI3U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKSZtdEyuT73H50utNRnW7vrmwNRQU6PQRoXHIeFtRgPcbrJdu5uYR/MWyTr1eH3CC/NeC9v1opY3K/x19CSP0lLEAfYViDZe7H556o9RFmjRzv9/OCngPn0rmqCrMPXlxFY+SoCt8hOzaSqqnWxGKQyJSIHKupMECp7CWFsAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnel4yhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEWsV1Dv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B401cCE1975041
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=; b=ln
	el4yhklplQt7RzuAURYS7VNxgAOCvDzzBdZJJGntXyJi/5CwTc2u2fs2sZrSJ7aP
	O6uJD3X+Wq184x1ua6K/aLtOYggj9LlgaCyrYjoLmp9mDVUsVySKFKo/zr1YdBZf
	pGo6w8jSE0Wr/rXbIO1e87MXRJyEEMgL2apitVl38CV5kLYsqbv2X31bkuy2UoX/
	fNOAugy/i7A4rqA3vmYfjaxa5+EkDGCZfezoujzC2fd6w0qKFl4KeNnjfhUrQ9rc
	95IvWIdWKtg5h7r6nsq//j9irviBac/bBzC4RLk/oReg67ulU03sWWXFJ4z3KGn0
	7KPfnd6xS7At0rdOpMlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtjr0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:07:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so805616a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764821241; x=1765426041; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=;
        b=LEWsV1DveIBw4sFJ4P6AdodF6Ai6pyRF9tdD9euCv8wLYz+TqdQ1oKLjzZBTR5tytP
         qS8weiyFMRYDth981t7jQ0B2f5bzWQTjHf53C/3p/XL75ZR4QZ3aEeUdb07om+D6vcRo
         ZrJXsvHfjYF0wAcqnmhc/me6NkteIry43QSdQL7DcQcp2EQJz23dXt8Pon21v0iel5oj
         mdzSOliyX+JFbIq3ctgX7KlP9A+S2mfjkU9/Lh3jeMtO52+xX+fvnTEqhWtPmNrO2Ccb
         +xPAyLWfRVvXNgxyyrfoncSyDTBIiMx306RWObPZ9Lp/3Sd1x50TIq4CiV7FnX4qq+Uh
         gLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821241; x=1765426041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=;
        b=EQvQT+WtNgqRcgo8w9SlkjwFlJS+UXHuvm5gVMLVbSinl40dZ61dJertuL+248Tw3Y
         P3p0i8XwT0VOpMejFSbnznreO5wOVh3Z51m70TUJlnuxW88LjyEgkwSTy7SUvIVbs8wh
         Gp//LIo5FRVUNxOOJi+9dp6q0xq0to4vk8tKDp9HdNHK7qhPwLhAW7YUnsc6C1tE7FjF
         pGScuPaRdvYyvMj/DGpyaCefdlL00seqOOI5OtiR6amncQf4g/xVv5CC0OP+uzvWiu6q
         U1s5HHa3E3yK/Y+QSW2KiPCftvkFoSis4risjVYBn3LJwSsBfIEumLGEXZkRloLh+zpz
         B7cw==
X-Forwarded-Encrypted: i=1; AJvYcCXyqpnSggzRjZt6EDTaPmkLr2sUlKd0rTm9h83SvVXCgyU7KfQVweXMobNIVamZ734sxf5EIddzAXiHIHtG@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwdvQ+Duz7sPWboiMjTLwLmoz+j1VOwC/4TUSFIdtDj3K/ohW
	ceKlCuXf+C8BI4zxp9u1wqN2SOXqt1QdyDpwqM4rq3Lpd6M6Wi3LQDLdxMdAsCW0/BKNWkQOe+D
	rVQYNuugZ9Gn4qUmzjOa2ibA/U2CV6+B73WSWJvEU6bzW9uBv1+2p+hImYm86g9ja2KJ2
X-Gm-Gg: ASbGncsYYyOq0aFTtRzvnPnrtF/x7WMDLI6iZ3APow+/osRohEZLYUzBy+UxXUYO+v8
	AmT1zjT2AufhuC5IVHDTndHaepf9TK1a5OXQJWyZx75udlEyxlW7mL1T0tg3BApxSUTwPx2RWaF
	eoPEREaNKK69WM87Ll7wW78nzUFekcushybhzYcmiLiEwnYawYCqhSd3KOcsf4JLELkxPgT8JhS
	j819RCEgyG193lXhVcBvdcnOPOmh1XQ28oULk/+hYkm5Ce7B//iiW9Q0/9nIppxZWAXlVTus53a
	VGAN7CUcyqPDWZwyZF5EQ2LgwgKsANagdxrD/E1XQ801KbfC1fVE4U5kk188k9zXLX2gH/UW8xN
	MTo50/pmpX2sphc4fFBTOF2TokfoGl/1LzjHdKjXM1c8=
X-Received: by 2002:a05:6a20:3ca2:b0:35b:b588:3002 with SMTP id adf61e73a8af0-363f5cef730mr5902875637.2.1764821240725;
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2UrzzkLrdjzuX2UlZcDTnPIcTqHvRtioevp/Qe7Vw3+4S5U2KAiHTDJrmu0ANkstk+HAGdQ==
X-Received: by 2002:a05:6a20:3ca2:b0:35b:b588:3002 with SMTP id adf61e73a8af0-363f5cef730mr5902840637.2.1764821240266;
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ecf6fsm527934b3a.11.2025.12.03.20.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
Date: Thu, 4 Dec 2025 09:37:15 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, rsalveti@oss.qualcomm.com
Subject: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693108f9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=Yi-RDYHqs8T9QeDE7fwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: jYDWyB__0PdC5gtJr2rVP_fv0kfdFXLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzMCBTYWx0ZWRfX6HKHV9L7zivB
 Lzy83vYTMAHgpTL2aw2qSSesrqEfzqgN6dbD+iF3vlGxybP4DHPukr57LP4uoH/khjl5Z/WVhnn
 lagI04M2sdSoAaflRGlLocPuyDkyIhG5hPpFU0ff9xQLtsICsofnNq8dzzCh8M6qyV6TgT4hl/T
 Cy5TNYFJdTCJ6xJcpF8AhEtqN9f7x5OWYJOilMT4MCQ8Nrv21CqWNFOMkkZ/y9IiswsnUi54KE6
 Fji4sl2m7JMBuYHCNGtcLIq76drfJK/hH4FccrimTebsS4ROBb04t2gfsrDd0hLrUXvkfViWhIr
 V1sVuOYulPMXIxfGctyoyDCXHTyC6nO/xS25GzemVg9M4SruO09LVaIV/aoIxYXuNHkzqigsvjX
 AnLIDAqcuZTed3+z9zt6M8suhfXVHQ==
X-Proofpoint-ORIG-GUID: jYDWyB__0PdC5gtJr2rVP_fv0kfdFXLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040030

Hi

The pointer authentication feature (PAuth) is only supported on
0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
The ARM64 cpufeature discovery code expects late CPUs to have
this feature if boot CPU feature has it since PAuth is enabled
early. When a conflict like this is detected, the late CPUs are
not allowed to boot. It is expected that system will continue
to be functional with CPUs with Pauth feature supported and enabled.
This is not a desired behavior in production.

We started seeing this problem when Linux is booted in EL2. When Linux
is running under Gunyah (Type-1 hypervisor), Pointer Authentication
feature is hidden from EL1 via HCR_EL2.TID3. 

arm64.nopauth can be passed on kernel cmdline to disable the feature
in kernel so that all all CPUs can boot on QCS8300. I am told 
maintaining a custom kernel commandline per SoC in a Generic OS 
distribution is not recommended and asked to discuss the problem with
the comunity [1]

This patch [2] from Catalin adds a devicetree property under memory {}
to disable MTE. I believe this work predates the id-reg override
mechanism. However, this made me think if workarounds like this can be 
detected via devicetree, for example a property under cpu { } node.

Given that what we put in `chosen { bootargs="" }` kernel under
respective SoC devicetree can be overridden by bootloader, should we
have a **sticky** cmdline to specify critical workarounds like this?
This would be more generic than introducing any new parameters.

Looking for your inputs on this.

Thanks,
Pavan

[1] https://github.com/qualcomm-linux/meta-qcom/issues/1277
[2] https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-24-catalin.marinas@arm.com/

