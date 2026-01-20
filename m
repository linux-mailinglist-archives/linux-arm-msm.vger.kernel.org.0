Return-Path: <linux-arm-msm+bounces-89837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALYFCNRKcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:53:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE705E53A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42FFF8C699F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95EA3B531E;
	Tue, 20 Jan 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8ChORhw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlkLSwvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236A389E19
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915211; cv=none; b=p2+Dt4Os8RJ3X4AiNuJdKsILqS8axHBgN0QDJM8IvK1aF9qjehKxF5wxYjLpuPh8GCbQVP1sYJoBrnOGPh14x95VvcuOSZexin4TuEuoJri/PCEOniHBebqKll2z+kkFdL3Vw9fR+8I/bcjO0RvPLoPxD3JI2TUkrBB5IOrL3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915211; c=relaxed/simple;
	bh=QYkxvKyKAR0N672mjccCsuu1WsCP42zC/2ZwEQ6O+08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvz4iNYk46gKlhbUEjB/Yny3ewwZownqgpMSPI2IW9RqWl48Nmhj386A3yf/pUUHiVh/YBNCWFQeU4xDrS9NkMkCPGpE0quiHqLi0gh1tPI3IPOCC+LUb70Nv032h512GDdzsXMgFh7vrIKnxogeiaR+FakCVOrFLo8Lh7BWg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8ChORhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlkLSwvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KAkcvp3252372
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/xphT9Wk7jl+Tx4ZNBZFaz+GnmNm8/iRie1IvsxUhQ=; b=f8ChORhwf1NRNipu
	TfygW9pKVexoiX+pn3PZe8aL9g9zltHO+OQmSXWK2xPpuLE2sEYAwGYkLcYg+W8Y
	jAE/EkwOQOc0pR4Db4QKwSLStAj0mN+UDA1fmBQlkclMewoLVMXYiz6DeB6lFbNb
	uqV3Nh11m8vI0TVr8vtuYEpesvlIbCquyA4bBL12Qx3LHq6Z1X9k6RSufxSb4geN
	6EgTfIxLWiEf+b7T0xM/OIT+8MMp8uYQ8ABVw78I+6lbx28LPnfchKG9RMBT/Adz
	QUY9KeY4+tQYipuSAqezskswwz+LKgHRi9xq02dt0ZOnB3uGaO6z4xG3hYuXz7Ck
	nHdokw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27ahkn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:20:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b137e066so46277485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768915208; x=1769520008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/xphT9Wk7jl+Tx4ZNBZFaz+GnmNm8/iRie1IvsxUhQ=;
        b=JlkLSwvggjZO5HWZLo3L3cWpqlo9yr6BiYEoLhQRj8LECx6JIxXUpUdFCDa35qS+jS
         RWbM5dhIPlS0GwRCYAK2QKkOjh/Ylz5DUjxN0KLpiNGPY9lfqdljCK0r6FvvFH3vftI1
         3IhKJWRXpzNGOkXjEAqcQeCx7ufPHlYdae36pS+rCQifg78Orl23EAmK7hbvxeCQcyeN
         nsjRW4gRSVDGjHck+rgYI2HjtAYPOmyor2p/aoBhZpDMrR+aQf4KOJwlwGOjF4c9NoRh
         pp2CSZ/UflfseGgsUwZQN4njcCU2PJ3iX7Ogp1twuEEyYNM5qP01oms5PXSuyWdRT4c8
         v1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915208; x=1769520008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/xphT9Wk7jl+Tx4ZNBZFaz+GnmNm8/iRie1IvsxUhQ=;
        b=b25/48eXM4PTOJAQmUqw8UpgftVGP7mkyujEkheiyNCNKm6cB/ICESdCBB2D0r/GOe
         UD8H6/h0jUG2c5BHQizuyadsVxT3YLCMHv1d0DXx6C/W29vnokj3WykisN1WHa83PwPb
         cOmsKgkTGjVo/5teNEGiJE5pQcziPXHtESx2K97fXafEiKNWgd38hFFwLvl2/O18/gXF
         OEOTjbxoGRqiIZHQLIW6w1LYqtb+QIEesTYniu5z4U9Hc3Lh0vxMbZC0g+uhExEbqh9p
         Ehgbcv34t81pi6bGUbFQzLgp6n/qQvy21UzuHBSiWMgdYDxrnEE8w/00POmRE25WrtMF
         5gFQ==
X-Gm-Message-State: AOJu0YxobJwNwUgzPAZKSBbgwnBZaeZ7xfkDm2aqZeLSJWIFFoOjI1Xz
	aDz4AHEdKbH6664PzeI1CK2BnrJ3FxAhHK2MH0RJ9ZNRSue2n93mK9fs75bEOPcSqKkoxdRSdF0
	7yIZbZZs1rzNTwRu07oG6O1GthrF/ANivyLImgGAgJXZSqfrDhRtgOJN6ThV8y3jGfNrn
X-Gm-Gg: AY/fxX5hb/+WN2FJ+4m2ue0ab13eUaIZC2QkwEvHZEPikXQsapVXm+MxQTdrAapSQxE
	Jb+e9m56UN30W5kvMsADkBQlRxbkEeLauh7u6+RzbYI5gk2W3G3JDWmLWZiWodz6TJdNPv6WGzr
	1l4q5F01Ks89Zmb/82IIl5ZwVj0dNCCbTYb9EjRRTvp11R0AiUp+3NdIAGwcaFN6XtTlC2M5S5K
	Y4RjSmTcb2JGjZWvW+jC3noR85r09twE7wd5NAVIptBfuDq1B3ZpHEA/p/RfuIOxvXF/EWuAnKq
	DekugEukz/KwglPxlj/etvbcN1+HD3vyTzd3malXF9hTbKOSlo8u4e/j320ah53td2Y1iYWF+Fl
	j/8f1hrjY35ozetrBnY7teMaY4izsv3jEUT7+FpgyTc0GFskPWzA0BGvX+Q9+1EQ1eTc=
X-Received: by 2002:a05:620a:710c:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c6a66e91c6mr1582289985a.2.1768915208409;
        Tue, 20 Jan 2026 05:20:08 -0800 (PST)
X-Received: by 2002:a05:620a:710c:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c6a66e91c6mr1582285785a.2.1768915207868;
        Tue, 20 Jan 2026 05:20:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1369816366b.52.2026.01.20.05.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 05:20:07 -0800 (PST)
Message-ID: <a664ad18-6b79-421d-b7d1-7cedee670352@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
To: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
 <20260120-akatsuki-uart-v2-2-867ee7f042d0@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120-akatsuki-uart-v2-2-867ee7f042d0@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DfZbZqeZdQ50pIGNgsjDOkKZxyzfLt1A
X-Proofpoint-GUID: DfZbZqeZdQ50pIGNgsjDOkKZxyzfLt1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExMCBTYWx0ZWRfX4JPgzgTGXulZ
 a6124c7rfKqnsPvdyvNz/Fi1Eg+bFMQtdqXgIPF9/yVo6FL41QoNLBAXvicPUHOp09q8lNxIgLm
 tdIxuHuoWltQGuY+AgbrjIJ9R651Pute8zpGxJ5sjOshNj0aoR6Z6DE5ZNZWu4aEgH52erI/KLN
 vuIIVCTI2TVcnNbANznCiL7BN4L8NwJInu6pzID/qU12xzXTEQsosiFj0z+9JbF3MQvr8jRP8Qo
 ZliaAIU3PXVmPNNEk/YHNOw0+8VII44QgZJhoNkwJVJ7HZLzMxju9+XTKU4e7Emhgt8eCQLr5lp
 OYFmbm6Jtl8hBH9+sUcDxaTe9UrhTvitSmnQ5jP4qRb443qGhEmIsGi1Un1KQMBQpC3drd1mPbH
 IbGsAYwY5cX3lWdVGVB9lRt7lG0XTLKPgljmbn9jiPiFulqjLTpJcY/sIwZToKXtcYfIiWPMGMS
 4L9If/ceMizO8orwPIA==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f8109 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=jHSRpuFS0wpEBMYsvAgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200110
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[32];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89837-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CE705E53A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 1:24 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Enable the bluetooth interface on the uart6
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


