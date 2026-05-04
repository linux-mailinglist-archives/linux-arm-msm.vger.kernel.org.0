Return-Path: <linux-arm-msm+bounces-105697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBqiJ293+GlavgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:39:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC434BBD84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96F133012244
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E749B3A5452;
	Mon,  4 May 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogsYmlsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eR6UxqQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4763A4F2D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891180; cv=none; b=G7P9uH/o5mD8SVv6Urs9uhi07I22ZxngVn3tG9+i7zuOumFw8UEbfcon6MmoVBpE/9KDhdlXTxoCPUjvFyl8ZsFN/gVEtxDTZxJLPs3CWrcF7iqScYTAvl4fdrqa1BzzclI1n59YN7PwN9H42JdWQbdk8vCxNSWhEagU5wBYpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891180; c=relaxed/simple;
	bh=F1TdU09A9xzirY2I2SR1vBE+Y1AaT1Q0DI4ezpGngis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKhtf13bnBS/HAAuw5xsjSdSO9QwRVLdTYGhH5aSloeHX8fpg8cz9j7hZLTSatpuwOvfMl604hqPv1+ik4INwVO46UeJbkvbiOpVT5BbBLZ5V8EwZtYNEEISWa8ujxASnYFWNUtS9AJ8LjJvi6ZJzPXuE6FLDBCJOO8O2LOwUvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogsYmlsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eR6UxqQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fMfN3824344
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oYWZTZ1RsxbEbFBZBVQrrfVB
	ZqNyJ/J/7qT+XWhlgiY=; b=ogsYmlsU+3arC0cK9Rx6FqrEKHwmiqIKwYd942ZK
	5RENeKiCedaMMebFuhYR7Fw62eEk3mVzs349oKUsog/tfJPo40cSePwUGnhZ1PaC
	GxUbnb68CGUQYEsWlwkRTWhDZWgsEearEw28OE66TIJ77qYjlhkFF4Ogx50vtMn3
	x6K+95Cn3I6jbaFIF+2VNewUJ89GQgEwkPrqy5+qsASsE3fpuYK3tANzfEgzuqiK
	6OZ8KHA6KhYIZNADoLP+1lvlnNtatBc/2i2Ief0rmoFYeTWEZnZR3CeXaxQgN7la
	fVmtskzJxfS0QD5FIFA/ZDlY0dgyTyHp2zIUR7/0XLWgmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3nbf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:39:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so103455751cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891178; x=1778495978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYWZTZ1RsxbEbFBZBVQrrfVBZqNyJ/J/7qT+XWhlgiY=;
        b=eR6UxqQThBwKP9L4iBlY59B2hJWzauRKqUlbuxsY8iH4gzkz7ZaXAcxOr/YyCs0V8z
         bk2Pm49Sxskilf2Q939wdI/trfPC5eaALvghMObUrnHf2G3MZ+DkBVJnm1mXfH8gwfbJ
         Av/hgGz8T5EoxxXtoiLONuwzzGHlZqcYc8DCGfno6FfPEmhoHdb4nigatpvixdJxCq6Y
         RPA75Zdh8va8DbxcOJ94/YoBPQvCo8cUDEfn/dKv15eU9hbymYOA1AAvb4IiEdGhUFtg
         9WvgHmjIYEoL0uNhTJ+hRLSUZSXmKbkjBpK1VjmvUi6d3mJwulnzQqAPHlToCJ7LRGW+
         P85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891178; x=1778495978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYWZTZ1RsxbEbFBZBVQrrfVBZqNyJ/J/7qT+XWhlgiY=;
        b=YqxWVIf0X3YwSw1qjxrOxAoVBX4x/oDx5EH6Iollqw0BT1qi2uRg3opRQ7ie3IbZOC
         sNiFhqdEH2SJszd2tCpI5LQV4ZNaCvdKYvSHmoSQe5rEZEofKEQHICMBF12AJf6oDpbt
         6W6TeJCK1vfDRyhTAqwtra11oFRQwcdV2K6DdqcIDdHZJ5ZF9gbkzEjTEiTSqTUWpaId
         t89s1jzEBfTE/blQ4WYAItl+ArGpj0e3xPvpA+1dIYRRShFgeUSrP7ZUGSJR2vCRMF4h
         tG46rBPfLzbpMNdv2RRW7lYv/4RP/aLVqfQ55hR7eDKx5+LEa6Z7DS9IWXVW18aMt9nU
         CkBA==
X-Forwarded-Encrypted: i=1; AFNElJ+9thGhDSuY4RJvPTg7cugC/DUzv7ouRhgUZgxxeDWx+SWbslV9ogTB4p5az4LTr+R7XmLE8/7xIppAMRSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2m2G7f0Peudz5AoeEL/VaK9umBc/nljfZnPzc4arVhOts1DL
	mMl4x2PuENpx4O0rViiGnUtd8/JsHb6MklbjOyO8z06UpDfSZTet7CYoE+0LQ4udHhM1FzHuL88
	8HFuNfXmO3oa7nno9vKEXP3dYMx3nckws6q50P3+US7YWpj8I9udC3JpR2v8f9EsC3CsJ
X-Gm-Gg: AeBDiet8rtiqkUHPZ1+REV4MreMiegANERO6jjyESw0Iy8pl/2Hs1F4wlXHTZWL+wkW
	+MNAxVjhd/ocN69rm2zcgAXlPt6+wEW4Q3bAxc5oKTv8fbEAZze2fuITnsPWpFmMG5cgoRTe55B
	e3sf04JyH8lz7kMQt0yEHDEfXKZyq/D55ky6jRE6B8PZxkjipv3CvVju3PmufyhD1cBp1vmakEa
	jJGClDMv8g+w8zOaianHalczvgdS3fxhAcMyz/gdqVCWvoyOEs84DRqDXfXcKTn7MRK1e5HbqGE
	9LbWVZD+GGVg8b/HZe67rYpJmAtbVBfaKdvebwYrYFvvji9QaLBq1lEIO/yoV9rOeK4KlovACAv
	LKrc+U2OmlQ58k1qBIQvdov+qnIFe5B2+sAvZ8gPHY1dwKXw=
X-Received: by 2002:a05:622a:2b0a:b0:509:2858:3c63 with SMTP id d75a77b69052e-5104be46d3emr130122421cf.23.1777891177855;
        Mon, 04 May 2026 03:39:37 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0a:b0:509:2858:3c63 with SMTP id d75a77b69052e-5104be46d3emr130122081cf.23.1777891177372;
        Mon, 04 May 2026 03:39:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fefbc1esm77851295e9.33.2026.05.04.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:39:36 -0700 (PDT)
Date: Mon, 4 May 2026 13:39:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Message-ID: <q7jljxre6j2zgry54dwpvdqjxwsrrsbqtl65kuwihfn7f4w2q2@5tqowtkknidl>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
 <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX97urOAqVDhJT
 CyuN8Be+tuyJvorhUudjTd8OqgAw5VifFlv9YjBcG2+NCBEm03PsIeo1TYjDg3rlQ4b4za2jA+R
 qDBboZwXLizoYrwpc9bBcEPS21fxqyc/vs2wPIWKEApI/Xwi9+cx9/LinyLNY25d0VzL/zIXy+H
 vdd8fe2oq3s3lx7tz4lXHJaIqS6bPGCFIqWv2PORtYRoLVvyGAj9jK/4isPbwdkwWYXsHHWEDGR
 WOOTGG8q5aRHPQl3DzJUZdPrhmoqG5Pag6vwXy5gxSDqVit4yQc5BK1XSnBqF8unR0yCIe2sGVn
 2RPMgIg2pFG3+oBeNfPLvDtZ6VOmYRHmQ8ptyEQaKBt/ZLlOB5DWvjHC2Jooq5OwNmtwMBPWh5k
 upuieVIwMsQozeAqRhILyrU7UMTvzpbj/ieGIhR8K744zDE+amW6Bsxfg8n1k2Yl5Kzh+xWqMdK
 6RsIxZTNs2xU6DmZf7A==
X-Proofpoint-GUID: nO7sPwsRoDHBHaivb3dVeixzertqNI3N
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f8776a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v0xJPtYkcPsxJSDiwUcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nO7sPwsRoDHBHaivb3dVeixzertqNI3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112
X-Rspamd-Queue-Id: DDC434BBD84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105697-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-05-04 12:24:56, Konrad Dybcio wrote:
> On 5/4/26 12:00 PM, Abel Vesa wrote:
> > Eliza uses a 4-region LLCC register layout made up of two per-bank base
> > register regions together with the broadcast OR and AND regions.
> > 
> > Document that layout in the devicetree bindings.
> 
> :)
> 
> Otherwise, matches the docs

Will drop and resend.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

Thanks.

