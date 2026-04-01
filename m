Return-Path: <linux-arm-msm+bounces-101360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGSgOtoqzWn7aQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:25:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27F37C1AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 117EC303C5AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3D8405AD2;
	Wed,  1 Apr 2026 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+HpWpDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPZIgTJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D72E62C4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052714; cv=none; b=p+980fQBGbR/iS8yVifCiWralYQt7DOU/EMjygx65ENWH94t+bY6HojCoTHGfLzd7CzewlQeY1MG3nKFQru5RYb5UpFNxjNSuRVx0shfN/2cuDPuQ1jqjVoJLXtTMKv9d2McUFkODLKyvD/O33RyToMPoKlX44T88z/sasHg1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052714; c=relaxed/simple;
	bh=S517OM5WlNAAS+kBUQg/STHk0UdlVuCZkzwjcBcQMHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8K6CpeULLPyfRoPKNVEJAAW39/tj7F1/Knp0duYLfu8T+UcYIV5PGHaDNBq9zpZKl0geqfyRa6sFsrBW0rUuqdqYKXFecVF3jJpXl9Xgeqnj60ue8XXs+6qU8LhrYx+0itWQaDmodQ6yptb0sZcB0zHmws/6miJBfc5il0+5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+HpWpDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPZIgTJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631DPhUW1893888
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mjtnpB4CNE6b3ELZpoYuDK4X
	mlmePDCg+17U1SlQAm8=; b=c+HpWpDkUo6J7Qz6tJ2guWXYu8Swc3Pq7ANUuYY7
	9kzfFQkp8afks1/Gk2eu+DLdsqzRRA1Xta8Hpow//5yEU7YLLXaf0YTSp8dpkoF3
	BV8NIfz7qdqucYhnFU3pcdWrQ5HyqNH0vTWY/KtL3V2lLQzhOrhRFNDwsxfFIp0I
	x+HYr3ef1qycq9dHYe/LVlgBQ6PMfte+lucW4McHp3RqGdt5NboBVOw3IvsMkViY
	wv/gjx3KKcBWEGtDMtOEOco1d2dc6pTT5qi5FrjL0oNlWEVWnCVcEC5eUw+NVGAX
	nn7iFIRqDg65O/1puGmFbtmvrRnEVTFPFzt+Zk3m/4qUnQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483r5nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 14:11:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56b6a0a29f0so4457544e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052711; x=1775657511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjtnpB4CNE6b3ELZpoYuDK4XmlmePDCg+17U1SlQAm8=;
        b=LPZIgTJfrsUorTjIos/nppACT3uGd4KMASMMuZTag1aHhBICBpaes/HLUllKkozOXk
         ctwk3YtCb90TAbSTlgXZwYqON5QSUoLRdf7JUIlytLbojhmfyPKLaj17g/uCy4Qw0bEV
         aUkr6FXK8dpH5uu6C+LT7X1z/kGSQ00Nkv2yzD4xDdsd2CSSy6JP2/a4v7CC7KvzEkhv
         bHFRPGtwMK69lJHLlr4kDmsDEOF3NYUPyadfNk0rC8brMXxZZ2M2CEvRMsiyRKZM8kne
         dyxq2M4bywYsdhZW19Q+1WkSpM98WKkBi1jFFKu4/TibcEaPM7BnymtMuODi879WEpw0
         OxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052711; x=1775657511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjtnpB4CNE6b3ELZpoYuDK4XmlmePDCg+17U1SlQAm8=;
        b=I9wDIWArUFu4cPjxqp50mSyp3XnnNMZt/L8osGoor/OpJNyXvFtycWdMo+Uh4oG8wc
         XIRHskgasli3EmbqqTsEtx1NdAWV8Uqy5COxgxZF07qYE4gICLCqzweHoKdH28BW9jxE
         n6RIzhlwAIrmTYCbeseL9lRIOuNU9u5r2vRTtCJsy4mG2C0UYGZ/5t4ZdfufotfHvGmH
         Ykl7SuLhfdQhlWjDBhw0Zgl9Pav8BQcesZaUuR5u/P9AUeLnQTFAQxNm/p4XP9liny7X
         HiMDUOtzZOjQwyT5f2urPXWYsSgH6Q9IeOkZYRb1e+LxUHRTyFdIrpN7p/bXPKxt3EfC
         qxkA==
X-Forwarded-Encrypted: i=1; AJvYcCWoK7btqAemAlsF/YgZcMmgfaJM5LsJI2qtvJWzny1b20GWixk71rbhX63W3o/cQL9WeTBwwh4q4yr9vdlf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6guDr1Yhye/p/lugq9vxmRt7weEYK3Sk4WNvv7wxsaxiCPox/
	GukL4lyHV9sYhJxEwlgfLOFFJlxfZgiG31KhUBMdo4OERm6biVSWUmuN+mcv5MI1kyNC6gVM9Ho
	rMvsclZ0IASxQ489ZtpRA4fM5bFQ5FqG1fKhaQk61WqSeeq1pRMEe1uhNTUxBGcbMUGH/
X-Gm-Gg: ATEYQzx7a+qqU5h6SLiCWcZlaZD1s7Xl7yG8PwSGUsHCtLVq9O9oxdhyenikx1YWp7D
	8fMNDQW+k4kq8WnuM7n4LDUn0FovDOIeQwRHh/NcvNoCD0CZXNiwPd0jhpPl0Xhbz7ZWIjAXnl9
	D+2e70N1ovgRw3W09GVYx2x5Ow3T+2n6r15qTQx1wDt+nMUIpdCBbgOw0HhYwrZNuYYg2ddFhpF
	CXWobQRGH36na8MpI8+p3Ist1kteU29WjhIQuDKHiG/LhR2Jm+5wWOVQ74/T2WPSIkcnyr4cTE6
	FSVw3L2xLM4RfZUhguHfnAxdeTIT3MaMOtr8WMprlOdaxe3lFXGEVMv/qX/8RMAZuBvwSYnpvZd
	ROtLomhKQpzFUsF9O9UAVRCl8nI8D3b30WWrC69eWT+PW6dvUuYBDm5x99X3QdEZ81NDFc8SkS+
	+L/QiPWt0Y9Bb4u00MhtDRjOCtojhjN5nF27M=
X-Received: by 2002:a05:6122:860d:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56d8a83ea9cmr1301827e0c.6.1775052710993;
        Wed, 01 Apr 2026 07:11:50 -0700 (PDT)
X-Received: by 2002:a05:6122:860d:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56d8a83ea9cmr1301781e0c.6.1775052710489;
        Wed, 01 Apr 2026 07:11:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c4b9e1ccsm264894e87.29.2026.04.01.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:11:49 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
Message-ID: <3lbwog5ziomxshjg5t5ffchaiwjcva2sq5okdlhqvhxfmdmglr@aq27e6nrnit7>
References: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cd27a8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mgjOwgaqgkQbYHjcbWwA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMiBTYWx0ZWRfX9ogL3UOEbMUD
 0j6TkVHpUiRw8WbrbkeH+AZz+M+FfNQ+R/fM+aRoRy6oO0CD603C2kI5o5mfD7O8uTTAqmPOOOR
 Fp79U9coCNVjimFPZtD9yL5yFixzYK5gmZPiJXX4yqkQ0R49x/wcuHt0g2d9jcmTFZch8I+cK35
 jKGFAhITGqRNnqm1VuWkUWVAgenv7KyA6n0a+zI0d7gn/uAKgil8C4HfrtJ46LoC9lz8EGcPGbm
 ZuZQiuv+1ImIqeulDaP9MSMxp/WEg1700rWdhN34Xy+iRvhQ3gjcmPNQOd1TqwbbjVWgtsz7Bdd
 BwV0zFgvsahnaXNVCaMdc9TVxYnFmvSeki5BEU38zrDEbGtvmpHGqUqKeGY2ZV2kaCd7N3pqTNk
 15l6du7D+TZzqXIzG+TmPfl4CGgH1UUbCoe4r2Qm9XRrqxQRj1asNYSZ1OcnMKT+RQdwjfWIehq
 l2eMlt4mXzZBDC+2qNg==
X-Proofpoint-ORIG-GUID: 60OKAmkXxGGEQ6wJORhi6SRWaAfgStnL
X-Proofpoint-GUID: 60OKAmkXxGGEQ6wJORhi6SRWaAfgStnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010132
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101360-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C27F37C1AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:24:08PM +0300, Abel Vesa wrote:
> The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
> capable. Everything is in place already for the USB, but for DisplayPort
> the controllers need to be enabled.
> 
> So enable the related DisplayPort controller for each of these two
> ports. Also define the supported link frequencies for each output.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> SoCCP support is still missing, so DP altmode won't work until SoCCP
> support is added.
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

