Return-Path: <linux-arm-msm+bounces-94205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKwJDgS7n2n5dQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:16:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2DE1A069F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF993014C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDA836F43F;
	Thu, 26 Feb 2026 03:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVTiNERq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqLbrpRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1A2D8DC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772075544; cv=none; b=p7UZzky6AVzVofb/Bs9wVZiIwi7OuWPSDYoVKgqYan7sjWBUfkimRXd9S9YBjxfD97BKNPllXk0VBWOHSbnMLQvU7EXospbW/BnNvek8RRDVpJYHD+E0FdC29eP2HF4go510al1YOBJ6b7hjVWimUtE9QrRHUJcnBxVrqAPOCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772075544; c=relaxed/simple;
	bh=O3HuabJ4nGq96GPw15bwWMpCL+tZhEWVrYW5DaUaZM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1gPbUl/G0QUcz1jj6B+AF9uQMR/0LIfzl5zI3oRmpAd3GRu8aPnkoTMKRrvkHbWEMZoy2XwqjOtm4i6s78GeXIDrUFQLySNrSQpODidzBGf268gFtLH+9TD7K8WB0A8jJbCf8KAao3NO2Wt2oY7aOkX5lq9Sl9p/X57BnxVCTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVTiNERq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqLbrpRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHShEv3057449
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2zRpXPy3GqSm3ua7S9QJ3jUT
	2BD0Q3VmNL6eCFxTHG8=; b=XVTiNERqrEF1QPN6v+2jofz6boUeRn1YrThKz6wB
	+E9FNb9DB7iUtp+m+L/EJ3sB34jTN3hQoFrDseHuDUCLAy/OW0t5R8n4Oi8G6LYj
	B9+7LRCJjHtSOOu7WNd8RfEgbrxRuoc1gJaiKez9iIed3qJubYsCs+IdMEh7A2Do
	0nG9Utr/Sl5UGHV6sgl0PD6ROc4TMcb2otHbASnkC9PHaPRHxhO0Kb37Qmuk6TR4
	raYOC8ku2jkPcMW601nYgT50rkpX+fFz2icSNEPy987jYBxLPXkuyysKofuCYmCU
	BeC3YZGFmhaPFoQeGIS9Df1EE3onDsnOe7nBbVt+M3NUyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39k1da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:12:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so240065285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772075541; x=1772680341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2zRpXPy3GqSm3ua7S9QJ3jUT2BD0Q3VmNL6eCFxTHG8=;
        b=kqLbrpRSuCbGQ7Cpmn7es7tl1ObyDf/Q5F6HI+rf75Kljy19ntAEUvztN+RRPJAJqT
         Xw5GmnaVNAIKpGxnkzcMUmJh+Max+WizPrbrjw/8ggyzpI/uldCs9KGHWDCCDpOED99v
         uR7sDFI3a2qRbagpOGKnAG0eiyu8Jg9pVCk1AtAnMKSF8rUzRaRo8AUenCXygx2xP7Jj
         6KsBV209eOVJEa+5A+VpkOeESnzOlBLX++F4WFqLyhHU46x2V/Nyynx7h6FftsDSi/RX
         oFc8PZ0bjJfJ3W2+jczfhl4Q2If7U4zE9dCS6GnraWI0DvQgRHxqz3BHjv4rArQyHKEE
         YBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772075541; x=1772680341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zRpXPy3GqSm3ua7S9QJ3jUT2BD0Q3VmNL6eCFxTHG8=;
        b=AX8FwRJK6FdQ13iTp0D7CxMGQON5XfxocBTbYlZzLurTd85obW09wpdlJtpK9VUF3k
         Kivmplu45FMg5kfnOJ3BId8R7T0o1hw1Rq0EJk+4Q/yJh/LwVjdTAPuTXsbiW3NdqJsb
         XM26AHzuKfmzG4ZX3451zkTsdyJeKpR3G/2jfTGNZfbHyi1ltFQC3OM4TkSNkbhIX0J8
         p+z7SaJgOEJgc4KQQO9b9TnEPk7/+R6QIMzdKVjJ0Z3pRdYd1sesIwrmum3GLgojhz3c
         FasKMlBuqx68C4lHaATIzeFvn/oOTHlZqLECLrQoAQzarMRA0TYzyChQZ4cNTa0vGgn4
         Qqsw==
X-Forwarded-Encrypted: i=1; AJvYcCVxLz0Q3/Ij5p7zqZk7hiiis5x4CPEgATEFW1qi2xvqLckLrTucS6Rb8TLNK/o8/YYjr3xpcdfWKLiDdYpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyexR4Sjt9ZKjFVU9u9WsqRYxIDQcDmrz6oEWXpWrXxSPFjrDKn
	eUSXWX7IL9ZXOnG6dtxo02JtPUbW4dT0bkVa3BS2S3Rd7d+J32ItFUOo+tYm33p3pxMJ6zsUbLs
	7HJEpgviya0zjeDYPCp9gENS9GeFVehUVu3WuTOlrJLMovXpZTHh6RRBg40CIkqLUMG+f
X-Gm-Gg: ATEYQzxcFKHoUC6qn9Qg3u1yX6F9oTM7fgza3zPBWkUyByVHhPWBTP9acXjfetI5w7l
	CZU5yNAl+1s4mza1GcAsTVPPvrBLoDeM9WF30fyR8gPf78jfXxMUQpvYJPYbl9SCyJNPnvkColD
	hkNLttCgISbR9iiaT/2p3OAClptf0/vVeVMCVtIgfqZfmLmHp7NKWkwEaFq7r60H/oNicxr3ptA
	+0SHfEK2lI7e6Ep0HWO0TauFoxMx3L0EcRINabW8Szu9VgqFeKoxGT3cFqeWuZ8SOsqtmgzKF69
	PLRc2/Uy5844dy2L+epaOxS2vfti50Z3Thjl4XCsqV6UHgyd13wcij+vT5Ssqm3JJPlvX665KjI
	JV8AvsWTK4xaDNZmCePPDTBCL2dxg4e8bDSVTHPDuW0KeZuGZxfhA2KqqfTSQJ1RC/BPIzeobeK
	QJzKpnzgiELeTRVSUSFBNAzslTjhJurDmFblw=
X-Received: by 2002:a05:620a:4591:b0:8cb:b0f1:cf29 with SMTP id af79cd13be357-8cbbcff71a1mr354961985a.37.1772075541422;
        Wed, 25 Feb 2026 19:12:21 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8cb:b0f1:cf29 with SMTP id af79cd13be357-8cbbcff71a1mr354960185a.37.1772075540986;
        Wed, 25 Feb 2026 19:12:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2e52736sm1897381fa.0.2026.02.25.19.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:12:19 -0800 (PST)
Date: Thu, 26 Feb 2026 05:12:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: lemans: Add role-switch support
 and HS endpoint for tertiary USB controller
Message-ID: <af3af64f4v3kcm3up6exbwwakabzudaqiqpbpbgthszk44cu4t@obdo7pzjom65>
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
 <20260225093155.4162177-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225093155.4162177-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNSBTYWx0ZWRfX8nOR64BrVr0z
 kv7gPG49XUZcopKopya6Wxtu7uJmmSndik88bjV4YslMrn1YJH6FWSsQyWAxxPrlmYQc4Qki2aE
 RTOeO6azdM0ATeajikTZyi/25nrPSFZFsTX7QB7yKG4y3kYJCxzV6ITKKDIZ+uF6gy/6OWkqOFR
 /PBMFZokRRYdBwhs/Y7yF+HupsiJufgCgnFuUdm+dsY7cbs45aG6/Op28FDgPwLREfxSHHHI/hR
 xdzZleDJD8Gds44YdxFR8ZK9rx08spchTO0vXO6RFCsJdqDBmQCg5af+ulATOVyeTFNIj6kQ9Mt
 CBw5OGPWqqsJxEoU8A+5jAZQk3SOFjLTEdT4iZzENr7WVvF1cCao522KJkyzgJ3A+tGECUM8CwH
 KJP322thHqR8aaSfCImcjRKXWpmOKi1tLB6nYGuehpbXQ2AmmhbMRRX3UOuNBqhndFz1//9Jujm
 6GCUfv9Mp4IJn1bWiIQ==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699fba16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=4sf1UO7b2iwPJg_886cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: k8uxtPQi6BolnjDKRTXBX6-tZNzcgPfZ
X-Proofpoint-ORIG-GUID: k8uxtPQi6BolnjDKRTXBX6-tZNzcgPfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260025
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94205-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9F2DE1A069F
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:01:54PM +0530, Swati Agarwal wrote:
> Enable usb-role-switch for the tertiary USB controller on Lemans.
> 
> Additionally, add a port node with an HS endpoint so the controller can be
> linked through the DT graph to the corresponding connector.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

