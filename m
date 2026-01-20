Return-Path: <linux-arm-msm+bounces-89905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B3ANfgJcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:04:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A04634D75E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D18AA945BBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB58429800;
	Tue, 20 Jan 2026 22:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd3x2ZPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqoYZ/79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E471379983
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947893; cv=none; b=RGunZ6LuxsBCARQKb6Synd7+MVae8Fcff+QsnGuu04AgfA18wJMj/4nLfhnyb5Srskq7R0MbJ+/FzTAE7AuWZxxTlTcVk8kGtVBDQhyV4ZhJbZJdZ80JapBw7xM8OylLvCoH8Gvth6+yXA6fZErJfJpmBJw0+Q6IaqaFN7vK8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947893; c=relaxed/simple;
	bh=BrSgaNZx+HQfBwpu4sn/zg+03psniiStvPrgOycbRaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvv1E0OczZbM1eh5356BrTK4nm2L2vvnx1J5GHIPLIvWZbIjva9zDllelhYdF8JaV6BjNh7ENZxh/XaaLffMBRvfWPcJk9ziDu3UTAtypxDU7KME4e24WMgYHjAZNvcEUxPE4j7X0ugh6Axba63wIUwRH5TD8gQR0bdK9sKLxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd3x2ZPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqoYZ/79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKiVEL803888
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeZEMvDv+Ew3EjInq8QMcaKT
	LAuKh7vFSCIGrUk0dNY=; b=Pd3x2ZPL6HJaTTQH8pU2R5z1KGFqbAUwAx7vbQF5
	9bE1RKZkaVNAW6viBIODsA3HZMC+YQWzfZl2SkRGpIT8cTX5CuGtF+OfAA71GoPU
	u959InI1Vc6uGa9hfmaZXJghd0YuuPlE3nFroLYkxME1CBPHidUN+eYRrQ8A9XFy
	7DWIxMTWvr8DonfUnz0HjdsKlTTEADgi0oCjDJbvpXTef+641MOCV+AJ327WSzuy
	UY1vS2GazAHWsvKU7/Is0crXCmdKkZlQz7UqGUMs7S7wGH7iSn1T5NRh4qsZcZAa
	49EGY8qv8dAH0fd9mDJt6kRw9dlPYAB7CmBM1/7W3/SvMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1uum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:24:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c277fe676eso1558509685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947884; x=1769552684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeZEMvDv+Ew3EjInq8QMcaKTLAuKh7vFSCIGrUk0dNY=;
        b=LqoYZ/79Hxrt+3/KmvGfaTrmv8/HFv+uWuBbDKr/08iDgLrNpQp5KShgAybwu6roDX
         /EqVT/k1NR12Y1kjcjBn03UOaA9kk3rMt7ePQYHnRfCga18K+If3VmNXwqhT89paeFQ8
         LZU96N/J8TLVMJpKu7HYN6vtkvTWvlbCGISsF5/kiOtd+wuRF+R2veAhW+pBT3cVbhSf
         xJ4Wlg/fVMWCmWlnw/FBTwCgK2WZVZ4u29Bn+2vIrioqKaQEUpTKBADN9O1f+NihbBEl
         VogdQ0raFllCn9UTEXUbBGZCdaytW5LoQIWKgGht5nKedZQvNPh7V9kuYAGJffjOWBOK
         vdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947884; x=1769552684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeZEMvDv+Ew3EjInq8QMcaKTLAuKh7vFSCIGrUk0dNY=;
        b=ad2Kz7irkjJ+ZHgRCveZW6+vMcw1cg/3FedWwXLuzEXokGkIPa5DkhSL3z2jE19Qly
         B6yZYpZ13v4Qy5sYmr99Fh+ar+xCUMDugJr3GIFt6eHqMTtPYx8y/JsFHh2AaVD2kIcJ
         LfHpnJDEItaHB/ZJSxGmZ4/+xijFqNRTAjc1nLMgt02C7/VkaMesf2Itefu0XAbaRKBc
         tVsIemwaCz6tqMRt5f+BmzTrb3NGUG1Y2n/8p9tAewjtWou+8LtZbwR5MDHZzgTyo5Pb
         eAlNwHkwkU1UWaI+tItEPDPjHBssnvyzYexPq29IYtLfjNyP9XQDuQmLmol7bu5k0VtS
         1bfg==
X-Forwarded-Encrypted: i=1; AJvYcCUdMs/v9cNKK5CSM/n5oGzWdBMfTyVqfQhs7TsxfXnpp+BRf2SYbHH2hHZBnA/k0Q8vDugbxwZphA9iU21M@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVo5wJ953dgC7s4e/ne6wR4+bf/Zy/6gWrpCyj/N7mLrpGsR/
	fGDWQXQDiTBg3cq+NNBNHn1HPxJi6CiexBRxBJAgj+G++39g+ipSmROwrPkZn/+XfMOV/PqER7T
	X/cQwmaIJVtwUZXopP1xVF/KRRMA/VP8WHTEkFJlGlgwvT4V3aXBTmPhVLQrGY9lmwEFi
X-Gm-Gg: AY/fxX69o8mHyIszLuBof1dGyZHsSXuouzz6f5riX4n7vAj+SNGhmRjJw0LFJrzm6S8
	9GYSZjLZPfy3wEKW0i/cj+cHMaFaygDf9gLHYu4K5pU0dcvWzrc7jW5IvIzPlyFlVEld7kPSANr
	FldGKfRCsteK8twGPYVaFF9xSB7A0ft9qcVGwC+eYfvpIiKazMFTQYytMJKMVS/Ixg5gpVMF95W
	Lq9wqZ0b+C61VEK9gjt9pXQ9+EWWemHJlwSl/bbeHzbOKilqb1zk8XvgGUWbaMVuzVeHVKIpicC
	jHPkDTfvOZ3lQHVGi1/ZEuUelR+Tr1c910TJ/fiPvxM12+9rvEvb63KZW67vYK+i4X2g3zCYlrh
	wKv4t6WSk6DUL+yJMmRKaoM3i4iBWLVDOZ57fr3CU2vheX1zVbZWYPGgIMlcE2g+9wWc/FuDRAq
	/+lvXwJJTK6+62cchC6e8S58M=
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2039826885a.49.1768947884114;
        Tue, 20 Jan 2026 14:24:44 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2039822885a.49.1768947883535;
        Tue, 20 Jan 2026 14:24:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf1fdc3bsm4348474e87.0.2026.01.20.14.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:24:42 -0800 (PST)
Date: Wed, 21 Jan 2026 00:24:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <c3vo6vuvq2vwwmu3iqpmdpqajtsfdpzyja6toaycxn7gmvjv5a@yqrapjovdb6k>
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
 <20260120-pinctrl-qcom-mahua-tlmm-v3-2-8809a09dc628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-2-8809a09dc628@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=697000ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1AF_eU0i6fnmeDSNickA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfX3m1WdC7tT2Si
 Z6uUMOwtb20MqpYRTrYI2NggNkfFri1G9hwUs6vuMHttTGaidIMwHes6YCHvQH54XCNK/fhHcwX
 Q0SCs3AY3AWOQic79otcqavb7GHl9jrJom3vV2RHrlexjGZEyyaOBf3kkuQrNrPDiOeViLcXYLO
 C7zmSpvUaeZmHDqfNwq5i3BFUu3O7/EGser9Mpxw6W/PYqp6Ol3PD+ZvDwiB18+bwpOX5OZi3nh
 jmrj9qJ3fJcm4qEKXNwQASp6/QaJaGHHGlLlw79wtuvv/eu5QLtYUQult1mojQR/ma6f5zWYEgc
 S7MWGtupMbZcWATTtR9AvAe7k7RXTWkBxAJalyUZbsWG6oxYwwZoHPzR0Rz7f98LycbHC9s0srY
 4hkBHQt+pNrNnWc3I2dLSut2dv8pb75Ei8/1zCHeBNHjmRbW5Jj+CshK7DwDHl3ZpCOb2RNRx1U
 gx+QuSxewICgB8yj6fg==
X-Proofpoint-GUID: GDVsqkNJ0qgvkQUwp8ktHTzByRBOcLGZ
X-Proofpoint-ORIG-GUID: GDVsqkNJ0qgvkQUwp8ktHTzByRBOcLGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200186
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89905-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A04634D75E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:22:51AM -0800, Gopikrishna Garmidi wrote:
> Mahua TLMM block is identical to Glymur, but the PDC wake IRQ map
> differs since PDC handles the interrupt for GPIO 155 instead of GPIO 143
> as seen on Glymur. Hence add the Mahua-specific PDC map to the Glymur
> TLMM driver.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 46 ++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

