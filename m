Return-Path: <linux-arm-msm+bounces-89976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFzmCu+kcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:05:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA254E73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDF6086978A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D783382DC;
	Wed, 21 Jan 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvvXsGd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5NmbDGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D0441042
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989432; cv=none; b=PwRdnZviunwAMEscOfV7K8pWALwf5W+fLT9Hs8+e7hH3sOu7AVUSr3NoWvYpKx0mjv0xEUf9Z/p9m9lPpgIPbrwasirZGzyrJyz5RQxNm38019pFNQL37+ugWr9cTDJnNAGaejEmq4mprD/CiZ68Boa3L84xXK18A3ZcBy520IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989432; c=relaxed/simple;
	bh=zI9dMyVMHtnq96Wh36X5XiGYaX6RWlmq4ebKvg+Hmqs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u16EiNj+XN90aI/O5QH+7tz0inF+2TfsGs1TtWOsXhgtxypQNxP59/B4xli4BY6Bp2RAhgHdTlF7XoVzlQz++IHeAnu7qnEwawF6YBpLoYdDOllHCCGrwMgxoV2A02kyLLUvHUH2ZVv80wekLTXI0TGDd9ZX422TP6bc82HonV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvvXsGd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5NmbDGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9fSRm824387
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUguWyv6qDysRQh4SgxQ16x6/vrpSNJRBnc+LJzfj30=; b=VvvXsGd3e8qvDtz2
	jr9LEerDtKeT0mL6MtbQCRY8IKffc3WFQ2Rzcyvx4wAlQh9gfUvTUp//bu0qeh6k
	f6qjmymnGUqclslNj35CRpkujiY271PDGfWJ66JHD6f9hzYvtiE4gqjpBQR6ov8N
	NlkSMN08YadhQX02aP1ZszGMvVxkoFrBy362QCeQGIEXMgKxj1gQufZ6qRfY3ITv
	BTTr9O6AEI7fa3thVXTiRGs98VaDr3aCuSMbWenw8PI00lpcYjG5NHzBvhqfBaYV
	w04EuJaM/mob+58sMio4zDbGXzbMySW/BK5qxkVpcj2Sy2OYJMCB/lawhKpUf75r
	sLc/JQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3dm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so155873606d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768989427; x=1769594227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUguWyv6qDysRQh4SgxQ16x6/vrpSNJRBnc+LJzfj30=;
        b=D5NmbDGqA2rX17pnJDDJHLWeVFajcfRXU+ntK2igDRpicGAkrF+yUudEVk1uY6DMTX
         Bi3Syn0UzOBqo9pEP9tW2GojeIFKXoT96Zq6Lu1uDEipP4MzA2Z5opiE0yBuCOHsd0W8
         O8qjN6+9NEnXPbxr5aMklivy31qN/GrwEt+3pJO/5y00kamLP62GiX6IjAvPU6ZeXAwG
         MFWGQn1o9ddlSUJvoLG5qnDgYmV/y9QMq7tcOe6KACe+KlQmdoRckzudpx+Cl4VCYi+9
         AgMOv/M4DLxYhIH5U63Btd0wfN7PvIJDpa0PGe+eFGDlBH3Pcgfi21+zPBVjVPAnZe9M
         gxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989427; x=1769594227;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUguWyv6qDysRQh4SgxQ16x6/vrpSNJRBnc+LJzfj30=;
        b=lBr/v9tVJT7sL9dYoB/2swL9vphmIB2AU4Ua8Q7MTgo1vZ1FXKRGLjSjX3wDCSUhCk
         3fmDuYtyB0dMChigGRW0nf80nG3sftIDoj8rTTXEYhWcvWoDXb1CLrF8t/sNgXcKulmS
         +SceM1Y/C375/ViQD89IeVbJvyKoYu/CH1BpNdXvV46iqA0vsPIYzyuaOMvrAQqW1TAW
         rSOfM3QIFT2neZHwK5geM1ruLt7/SJUZ+pSUZsskGDZwwoHQRWm1uw9a/G41K1DG7lun
         kI+cBmA2Rnr7F24ZoETTj48A+1vO85zxDWPzhh9av7am9PdLV8LKEPVh728ZsssP88rF
         854A==
X-Forwarded-Encrypted: i=1; AJvYcCVqMV4yRpnyxDbKasQDu2hUAuCrPabqjl0RR27Xnn55dbKd5VgwIYl3Tg8KssFAiQ1sBt3tdMrREzQRuabM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt35mA0iBGRiw7ajGuBc2qVJoBUqq+N9hTZliDm6vzrfp8vJlQ
	C8v5hawAGJCU3kaodmOmXt41t4+i702eKwwoWTNqWHYqGDqqUxX6sFWOBKuaSDGkXPVUwg+HpfR
	WJgFDPVXq2yBbH+epHKcd0RXEtJCqex/q8A9ODllTwLk9DMeToN9JeOjGYCZdXGf/UUxqznfSFt
	EGw+8=
X-Gm-Gg: AZuq6aJcTyEw8z2nO9e2FUVREw3jvowAY9mdbn49eeGoay+bGR7UNRUr3kl5HS1Nh6K
	PRUvzVwrnpjnCRkHxyYiQfrNMGYzBNIRaS2k0m8Y97+IpvBk90SrhvqJDkfg5GtQyuxD2LNJAqL
	F1y/GQyVuXBMVyVEk797lvHtjvb+WuifwGQNClIJO49cAo9EoK0V3eugJVTd9MqXlp37FBQPQ+M
	YVSTgZtEktaFPRgSLZ8/gKG8dZa/uzuQohzz29LiaxBWVZIxiv6TlDU2qG/t30kfm8UXfkG1ynO
	iMwVeIQ0Dr8FKwMDu8hns5ymrkHW8p5kSX5Rmfavrabiji2hJ921rYTdLBOIu3LZpVxGkLypiSJ
	aiOQHJz2MpcfhztC68ZlIObTRkNTpolcf24p0vPJaWpaCejnqWK2R/PD/IFdt9s+E2yKRxieIt7
	NRvXUohHmNQ3JdpOW+/4EZh+w=
X-Received: by 2002:a05:6214:1d23:b0:894:61c8:930c with SMTP id 6a1803df08f44-894638be95fmr55512516d6.6.1768989426911;
        Wed, 21 Jan 2026 01:57:06 -0800 (PST)
X-Received: by 2002:a05:6214:1d23:b0:894:61c8:930c with SMTP id 6a1803df08f44-894638be95fmr55512366d6.6.1768989426507;
        Wed, 21 Jan 2026 01:57:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c051sm4611385e87.79.2026.01.21.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
In-Reply-To: <20260111085726.634091-2-val@packett.cool>
References: <20260111085726.634091-2-val@packett.cool>
Subject: Re: (subset) [PATCH 0/5] Add support for ECS LIVA QC710 mini
 PC/devkit
Message-Id: <176898942562.3623549.3607046539318792338.b4-ty@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:57:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970a2f5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xMBfJuUfU2nANvzb4K8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Ivq88c1ueCIfEHnIL0zhpWnHsiHKlbvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MyBTYWx0ZWRfX9bvBRYCNvTGO
 PWpaC484CKZhSn81jq1dbiksNGWvvG0aokk7QxUrcunzXGRPj1bmun/EJeH3bwCyFbXvs8qn/If
 8d+kwxOurZlrFaRralcl5aBd+oo7/k7kUl19mvMo/hwBAiNvg5P+iSsSyd65HjyHLrWOI8QP6Z5
 6uEbZ0Q+8794cGe4PeoXEASHRv+yMXm+APgJKMw+0OXJ+OHqrCDMJL+DeH7p0WOlpq2zpZtnJig
 HvNexS9B5iDSrwUGdOnzq4Tm6lmyYAXn6MDG/tXuqlo16/bI4excop0by8h7ZwvMgCCFi055zyX
 4R9hBIMLX/u+0qgAwZ+1FEk+KWW4EXAhHpIl86PJ4d5L4jAgDNYDoOhNAd5KBi3D23bykdbu0de
 cDnbtC8LmJ+jB+NYxXTkmcsy72dwmreZeK6uA2huh5n8PVv+4eGxYl1zuaibRMC5pthcqWjB0Fg
 LJlOv8dvNO4wpMjp9OA==
X-Proofpoint-GUID: Ivq88c1ueCIfEHnIL0zhpWnHsiHKlbvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210083
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89976-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88FA254E73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 11 Jan 2026 05:35:08 -0300, Val Packett wrote:
> This piece of Arm history was an early Windows dev kit before Volterra..
> (Though it holds the brand of its manufacturer Elitegroup, not Microsoft's).
> It's also a cheap device that can be used wherever you need a mini PC.
> Now with Linux ^_^
> 
> Most things work, including Wi-Fi, Bluetooth, USB, eMMC, microSD, GPU.
> 
> [...]

Applied to drm-misc-next, thanks!

[2/5] dt-bindings: display: bridge: simple: document the Algoltek AG6311 DP-to-HDMI bridge
      commit: e58be49a9a09112fdb4e4d68b4653a2545746091
[3/5] drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge
      commit: d51e390ae84857a999ad2046e074e97663e98e36

Best regards,
-- 
With best wishes
Dmitry



