Return-Path: <linux-arm-msm+bounces-118251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNCQCCjMUGrp5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD4739C94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IyqJjgSp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HGNx0H2E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118251-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118251-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3057303742A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755F040928C;
	Fri, 10 Jul 2026 10:38:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC640BCB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679923; cv=pass; b=Tu9zZEcsedTOkdlNp28PWd43kNpuwM7fVRYaA8zq+zF+6FrwbiT25XJw/SqjCurv812emBL0se0+7rVGkKAyOpW98FALcA/USyLOcf+QrGj+GrWyJC7CQ+5J74gZpotLKrj9xq0pJYIwLks+4ZnVhFIjdoo7+03FQBrx8TVWBEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679923; c=relaxed/simple;
	bh=0KPxLWAyuoPTQ7fPlwfSGd3ACJr7sRxjD2WQTRY+LBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYf/YbUNGXurHXCzbKwWuD9qjLc0KXGkCh/En9c3k8u8AuLhlpBiDFaXz1UaGMSDxmfeHnWrOfkNrSNL7CgLywOE9kEOTin+14Jk9iJlk+hJkh/KWlRnt0gzR5/pQ7i1puMnBlYuwERSy+fmebraoqZ1arBGd/gmsGeOnkU09io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyqJjgSp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGNx0H2E; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dmGk4156841
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=; b=IyqJjgSpCCQD+rpY
	f9EzMNXWEyBCQT31mMFOohB/sg9UwLFeR3OnotQs4BasxOiwspWHrZkO88TZAmA+
	w9b7S6ZpSALwOp6qKWInPx2NZK2ChEs6WHrUrCl2OiBZbpfZdPm5SAY/PcMoEzQi
	VVswgcbL0+Wa0/gwifY+lyZX3R9dPDpgKykMuxsBFRQhdqhn/tb1hWTFwxDbwqAi
	w+RKDsaGpl60OhrKxCzpNKOLwxMTFRFz05wF0mvUUxFcA+M7JnvytDNUqPve0LJ8
	IufItzKen8iNKihCZv81YLv4AjpKFbdupiQXZfhHRx6DxNk3N3mS8HoL3OrIQGXR
	h2tgZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jvm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so150022985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783679920; cv=none;
        d=google.com; s=arc-20260327;
        b=GHoDPyTBgRG+7W/yiM4Kn/msrQmAO1KJHyF1gtfsE68pTsy1Y6FrgptXrSiE9s32SQ
         B2KeS0vx5gR/NLpT7Nlkw0yWAULlww5BlQEeo+BjZQuOzUlLDLQcFM0cN5Nk8FTDIw5P
         U95O84sQg6WHpSt1/HALl31XZXI2xUHZsxwl0vpwmTgIxB2gWWTmGvRymrN6llPPgjYm
         IMBi6M13oIbFXmnbmyrrBPn7Y/Gcl7+q3Hql5dXw56vi553J2zWCU/xVs70K9VuuQNLZ
         T/KgV9or8sEQVK2HQGaemH8V1pOFqeF/8gluq1/nqg5RcLHZGLWlJV93Yl7urRlyXezE
         iVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        fh=q+IkmVDtQfrXV2AMvKKJK1s0ge7A+vX2Xv6+ygxm5RQ=;
        b=ZCMZf43vyAFr8ASk5vetnx4se6W85LD5y/Kr5a9Wit6BB60d4wr+YkAAryRhWey5Kr
         FAnSjSVrs1S8SbI0QUc5RCUAhjUmgzf7ok8ze0gMphWxOCW4vTY+GOQEg61XSOKKaASA
         R79WzwSoYDdf+xORe5qUPcMlEAmx6UIFpXFviRMWJucNqr3EN/clgj2NDAf51/u4pQm9
         5z+aPV890DosI2LH9buKJ+eR0zDV4H8qlAEBcNpazajTbkSRnJkWOowlHeF2oEjsNQTc
         bCg5Gb1K0O38bZkmCOGfE0Kck4FEVTyu9IV8N045DYmz+Bc0iFlCXAO3TGjGDR4d/cWU
         xLUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783679920; x=1784284720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=HGNx0H2EiSKRegbSOUN8Aa4Mp0Hb+onknAfKMpGjrvk4nsv8AAuTME5Tx9JkRGK09O
         LaXmA7k1LDZdVzw2fhn5HeYlDDXE4lO5nR8o+x5AvwrCPx4G2a4j5z4ifaJyBOGXqTin
         CIjZ2R4ZVP8AxBroUuqaDv8Hgm6rrgmhEEk8EXwgdSqUc4aXHjDn0iiwFjIyPyiprzVN
         m/RhBewFJQRXP9khTV4vVi6XCE+3IFAd61pVmood6ylBtf2wKv/BN1hxdlO+gC3zCpcG
         dbN59Sqc6XnlkinoZadDnuja3/4ZQHpN7Ern6BFTsTf+ZBTA2A8ahtJssQjotKKzOycz
         +QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679920; x=1784284720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=PBesJKgjQRMXHPgAXIczYNcDvGQf7sO8PcDLiCCKDyLze/N6Ko5yt9G3ba9qBYgyvm
         Ym0uql1C6i1p8+i4VNwD1jFMc/MvLcHt0rowxKlXFupenuNXpKs/SYJVqFP+xsVXNuHG
         j0O0avQfB623f0Eg+CbTQv41qO7tOzQzLgeaN1PfeogW9AtS4qIWITe1hL45K0168wZC
         Hgt+nbJTvznpeEPR+TnGBFq+NHV7WgoHrctmip9YPci5hnzMczYPduiojt7m6z9W3pzR
         gPCpbdftXwVYitTgLa4zJHme+C72Wa5Mn8NZfT+8vf5QCIFvKFTWmz2aQVXWZKK5Rx85
         xXaw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6xnJl8txReB04aNon0icQNtJcJXT8Z7rZh29hDJk4tcePA/pfhAx4vdZpCIXs1UOtYbck/2YchHAgQOcW@vger.kernel.org
X-Gm-Message-State: AOJu0YySPL85maTTzyG0I+fomO4iEDfGSkewmTsq/HqCRm13qTip9MT7
	rKdcdCzqCe/T6tU2fQtiHk7wHiJRx7B+qhV1rbUxFnMN1h4ojRXxus2aNw00otMfZOrjEaa8JuI
	SgAzRUseukJEjKw3GwSekV793EIhPvtV2SEIFasMh9xsoSVVTV1E8NbgKrjlK2KDWEeBmLbx/Bh
	EcMOmUlM0+fQjXCj9B4XTaQhHDIIp7XJLxMWg3YSlXSZY=
X-Gm-Gg: AfdE7ckkckFONR9eltpiUWgzh3wEN4++Ksr2ngA4/QHEvUY/Kdkb4ukbKWX8UBwj7+M
	mIxo/4lDML8nigA4lygtCwePWmM0BlGVXdGik+7RdLAok1dp8jqMy1OF2hIkzD1up9oZ17bzed8
	1pmK1gee88T22Bu9Lf8kZzx2teu8wE/twk7XG019Cj14aQvvIKyZf1rxs62MtKOnFDISnBShDYI
	2metMFxDX33P5/+A7iIP4QEQat0dxYFWsvaoQXoaPiNi/X89VnJfvpToaiFHlgUns1EW+6mWUya
	uxQEBno3hcQ=
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-92ecf6aa99bmr1161316985a.52.1783679920254;
        Fri, 10 Jul 2026 03:38:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-92ecf6aa99bmr1161313185a.52.1783679919854; Fri, 10 Jul 2026
 03:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com> <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
In-Reply-To: <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:38:28 +0200
X-Gm-Features: AUfX_mxQ19n9pqr7NeXF_LyIWJF_S-APRtcHzPde7YNEtnh7-ASBQu7xsaFIcQs
Message-ID: <CAFEp6-1j=kA=3=wxWOrn_A_=Ugj-kgxRgKzN=a=3UsAef9YiTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 098N8JTKWuJOSYwBn39VxH4fcgSRfpA4
X-Proofpoint-ORIG-GUID: 098N8JTKWuJOSYwBn39VxH4fcgSRfpA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfXzPwoA3tfO/PT
 VAW2cbQQWRdSktUL03vPezxS3RpKF0+2Zq4Qfk60Eb0mGGp49Mn8oqdr0RKRifGq0BChwzmyrsc
 oXSqU792g/rYVz+ALXIkkBwqOwjL5/4=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50cbb1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=mfUuqgtbHY_zyTLiPi0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfX+MYZwCao0KdY
 bNdZX8q83Hfc9O039R/oc4D3PUKLUswc1ZhWeFpDGasxcGik0EqdpyAOa078t8Y+B7mfLccxyeC
 wfgJrtByNpd4rSaNIAqXQv+b59amlh/yfsD7bc7cwfpKRumajFQf/gFKcSXEEezZg0WXf2e2LF2
 yC8ctmg0IY/ThafD7gbiOx91Pc3WMGtpft66Rh4IUH8EP0kx1YASgORI+DfZlrX8ncFF7WTSMd7
 n7qSXcVORJ5HyIHqm3BOADdRJB6ViqiJzewFYjFPLXtT1qI2QjUm+4ziNVVbXG1oQSJanFn5ktF
 8g7SBLEQlKhUS2tIjeYmfI3pya7/iSOUPWJoXIk1BWd4C8UsLkTVDuizXJ8cmsgpuZxdXkSJGEf
 5/QgddtpsMpQgtyLQyCqKs4EM16T1ZT/FKBo/sZTFqlLcqs/kU/eb/wdaIL7osZOuFz+GYabV4O
 hBnI5JGh/D3B6e2SgHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118251-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2AD4739C94

On Fri, Jul 10, 2026 at 12:20=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > +        reg =3D <0x5c42400 0x200>,
> > +              <0x5c42600 0x200>,
> > +              <0x5c42800 0x4400>,
> > +              <0x5c46c00 0x190>,
> > +              <0x5c46d90 0xa00>;
> > +        reg-names =3D "top", "qos", "pipeline",
> > +                    "bus_read", "bus_write";
> > +
>
> Does this register space cover the entire OPE i.e. where are the CDM
> registers ?
>
> We should map those upfront even if they are not included in your first
> drop, we map CDM regs in the IFE even when not used.

My initial thought, especially when we first moved to the CAMSS
subnode model, was that CDM would be represented as a separate node
and referenced from OPE through a phandle. However, CDM may not be
generic enough to justify that level of abstraction/complexity.
Therefore, I'll reintroduce the CDM resources here instead.

Thanks,
Loic

>
> Also, I looks as though you're missing CDM S1 SID entries in your iommu
> definition.
>
> ---
> bod

