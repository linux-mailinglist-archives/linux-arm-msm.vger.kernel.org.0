Return-Path: <linux-arm-msm+bounces-93791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM6rJ9monGklJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:22:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D217C4E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55664302369A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAE436B046;
	Mon, 23 Feb 2026 19:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRXH0f16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YccmAaRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DAF369979
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771874497; cv=none; b=SboAXfZFYafCyPLrBoNUNpG0FUuT5cPKYkMb+2x9tzmFOf5VjQXT7+Oci7OE4mAZPLcj1C0MFa3ALs4ZCkKQq/mYPkIGhcgwTwAo3eLsFPiRcPfiPArmGpjs/C0z1EBDf3ySOZiOUQ2FEs3HWxa1JnV+ZJpvMIF71WO7Lz4kvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771874497; c=relaxed/simple;
	bh=Wil/5hS9rIZJPcSIIANZV/X/gsF9UrXEUlxG0BZs9no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQFUkMI0PZIdq6C+xjJumetYCMrOTjBRNdUWTmr7kKfsxRPueqfntneVWtyWHWU/EEsOGmcUAFyaB+RkSBmt9LKAhzau8ALwO+7nx+5b+DqQHcfaX9rBQ8f65MpjJQSHMAOvdNxdIviAbtj5qy37Sa1XYWs8Z7aIRZFkm9e+1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRXH0f16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YccmAaRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH0udj109958
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+7adm1/X8iY8gA1N3fq1TBSb
	GUPxPvBpPUDTWTyP9Do=; b=bRXH0f16axb245a61MilhqGjGojeDieGuCfbT6ev
	i799lfZVtHm/a0491nLNSkiteETnZpCWLXPFj9+R1t7poVX6b24weUrDQYvBAUaf
	f+8QnbNaMawti0ac8XCQNhIObvtmIAlSPXmDW61I/uMC7G3hSLqa8SZS2oTi+99C
	w2RdMkPw32OvsV3/1Bs6kJsWosMLT0RcJAwLWK1BI6+7dvx5mTgqcZ/XhjZc7ZOo
	XK2Omyod3m8+gA+sdfpBCdFfjRAbKszGb33rCgwk2mMqAo9OSVn0pnurvbfNUIln
	elEpVfUAXNt6B0hj3NYqZaldN/qvmXsGVi83BtrkzeQy/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx08fj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:21:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so4534090385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771874495; x=1772479295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+7adm1/X8iY8gA1N3fq1TBSbGUPxPvBpPUDTWTyP9Do=;
        b=YccmAaRzj3xMzRQ/H1OZ18grmUoV0Q0I9F6rARHXz/7rXTKDdyGek29HtP1FBBv5ro
         SUWdp8SznQ5kBjTClQt5fCqiR9IU0EFvB0/01XUYX/9TYC5uOZzlyneNIy25pmWsDwtK
         P6HOYucBnfV279LoD8ux5sBHMRdF3FRCkp0hANw48wqJdBbG++480RDDJrWk9/Rz4guC
         3B0GCeV6KhQ5wyf4CmSsmFpIIhy2Cb4KKmd5oWK5tEH+37sY4zJQSHPtfKFzZqoUNmCe
         /qqefZ/fUi2iosDNOEmEPTwx3X3FIIpEO/Dh0lhvM5kzXUXTyGxfdxBJ3P0zEWNTvsDI
         Mecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874495; x=1772479295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7adm1/X8iY8gA1N3fq1TBSbGUPxPvBpPUDTWTyP9Do=;
        b=PAcONxgw7RZrKFq4hTmjnHiuOthJn8qm5Ws/OsN/vqkdQ3OGZOxx3MpAjc9xQimOkW
         LWXjNZrinYm0oLXDf7fAOwDL7vDV/U5x3GzQaRlk2xTyOzUKE3y+RjyE28mMsnSVprlV
         0iCWHi6wDkZz7cPy5A81+W8Q1TCsGKE2W5vZ8NhzhoZ6gsEKdzmgEw0bTgBD7aT/tfTy
         o4APf8u0yoYfb/VKHTubCS72BS1ajZfClVrO3l6CVnL5JVKKLaDRk2/hT6rmyF/KK3sG
         bbKdC/GVoZ9i5LPxVxwaPZv07QTQfw6gjXfywdnV+bKsr4Q6zwjoVg6E+5m9+dNvXgRU
         TlZw==
X-Forwarded-Encrypted: i=1; AJvYcCVeaz07DtnBjLO+ShcVTaWgWKYXnG2sXdr6SibyEhi8Ft6iT8E9YBwh79DGm9oVNs1YeXdd+GCBNybOxeVp@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSXWoSuVs6SiGWk9tzGPyhKsW9mvDHpDh9BhD93x02Seevq/r
	WcF7qKF9L+YjuG5J4VqhLu2vdYJ1hWTkS6/ORk2zr0S/pZAbU8svl48ydIBzDVib9RvRFGv6mih
	TXQOYRgXgtp1Tmq2uQ9fVBUbb0t7TEmrrkuLyDpLc5M/9jnqlT8XIS7sUMyPjI0RhKsvK
X-Gm-Gg: AZuq6aJgdGmLDKOdPOaM2glV3WNA4aOOZq/qo2RXznLvAVozE1GCBlIwY9y4mXBn41q
	LnWj4WZPTufmZv6/iJUTSHwtEV78J4fUpY4iAOTMfARYEkQ7v9+s+7wfv7gNYZRxKjYDibD3yru
	17C62SBHlwwehmFzTVNh9p6E6yIJNqmtAqWxTR1bBpBMTMdt6E0ubbPjX2XrAhdcn8xSqkBqOEp
	+UWfrzEp74uXxVfTVkmo+B9YAKyrn3Xw4a9dE5kSZQDv0An5RgZajKhBqBpLczL4tnX9TuT/A4T
	e9eoU9741tY7rrCfGvMLt3v2u5okgFfaFfSVXI4UZt4UurOtmUW/6gao8M+uckKZW7fn0948W35
	U66p5SDTiv8lO7p+fMLyvdi9cHaEV6duUxyDlDzN+4V3r7lh42f1Mc+RaSF+SSKcN+JJ+QVuaPl
	KLXbjHMGDzs2RrQQ+Wqck4DDUysXO7hRTasfs=
X-Received: by 2002:a05:620a:1a1d:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cb8ca83429mr1265868785a.66.1771874494614;
        Mon, 23 Feb 2026 11:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:1a1d:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cb8ca83429mr1265865585a.66.1771874494143;
        Mon, 23 Feb 2026 11:21:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45813sm1729180e87.64.2026.02.23.11.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:21:33 -0800 (PST)
Date: Mon, 23 Feb 2026 21:21:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing GCC clock-names
Message-ID: <3uukb4hxh7wlvx4alyx45czon6tod3iyf3wmejvxvadafgf56i@w6j53o7yars6>
References: <20260223143624.118271-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143624.118271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: q8QifPkSbR9odLbT-s2C1zAcAY1KUIh_
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699ca8bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QPe4Xi3jo-O9ThN1vCYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: q8QifPkSbR9odLbT-s2C1zAcAY1KUIh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2OCBTYWx0ZWRfXxMEbRaaxA6FP
 7CLMi+yXVezRqk1IEkAiUWdxXAc9IBUdSxTFnYRRKE+4e8OwlJJVNb5nNbxr98qYq4ddvt7WcU8
 ZrMQ0eR4ZdyijIXRsRlJqe35fq1x/tbCrnLScasiy3kFxneB8RApuFtov47971IIemXKzt94Aoo
 MAqpgODrP2Jj2OLYFKm5jcgl8QW7ZICPr+7AuJA4IAi7IwZLzTr57xZYw91hdfewfFhhKENjG2W
 vg/hHo7VyGqvqhIR6gOu1Ec2wI0/AR4h4/F7HOXGUV7OA9im/qKSDbKJWVqkxUHBpf7obf/z/gU
 c38D7Gl4ZQcNwwg6ioEmBRDlw3Wmk6vvR3q0U1ldbievlXRFMH4idNucTex2mFaxYlCH1cY8LnP
 Oph9skvBspk7uS7Gjf5YZGTguro4fUYuFGxH+qwlbmELclGx5QHuONLJYqpWPQRuhfeSjExQlEr
 hpJW/ug+5NhuLNG6Vzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93791-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 400D217C4E7
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:36:25PM +0100, Krzysztof Kozlowski wrote:
> The GCC binding (thus ABI) requires clock-names:
> 
>   qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

