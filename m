Return-Path: <linux-arm-msm+bounces-103613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEpVBooc5Gn2RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:06:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93831422A78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1303023366
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579B9800;
	Sun, 19 Apr 2026 00:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT8phkfW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ka2nLBTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A833EF
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557182; cv=none; b=UtxNSXR9DHBcqIk8vx1FuTs7xaW3X6kMkSKK0oTRKpI1QRTs5I3GAyKAEt9PM6TRKcrtyvkF5KyRv8HWQFmAjyG4Jms8oVBBnaYz4YbB7AAANlub2sopz41ohEDMLN74T7T4uqSvfGGedUgEkA1KsGTKC0783cPJ55aydyzlN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557182; c=relaxed/simple;
	bh=wFc5+y8X7XR2aozhdmzotLe1/w45G+fKz6XQCUCQ4ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkrW0u67UtorWv7eogP/KUwggKdHctDCKvBUT40PtjwS/7ZfiUYnQ6pBhMwf5+zC4b8+9bynMyfsCTGJ4us+x2TkW8Kyc77Y2F8HUvLl8Lhmk1jXFfiVoZe1eX45cD166u9MGgn2NDpZN1B6IV+lyurx6BuZR1BUM1doZrDEFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT8phkfW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ka2nLBTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63INJg6b3681523
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zj5Zjm363/C/DyQhdYHrOzrf
	FWfpN0oP7QhfINvXvwQ=; b=ZT8phkfW8DjzJZ666YqUhN6laGl8/pi81ES67r0J
	MWvwq9KiFX6s55oujlYf2a+jOEOggJq/4CHnORR3mJiyHpNq6oXQwDV5rlbCvxUu
	SFRxd8AFwGt1TkeAm/paS3w+zM4CoppwNWoXwyghafDU7V5/Gf/FwQhQF049xcEK
	ILukNr8+8uorTCX7fxajborn/1Gnzs7Cma2eY5hVz0WsunFBuXHu4F5U19dUU99g
	NUU6o1BGH2q6dsrfEUCKyqdQFHe0iXar83tdr+fGN3AcQfarulbVbc9b/N9mpdAv
	hbBiPesPkND0+abeOfUKcVY0EWs5biKgkXtiSNRMp0kdYQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qahmte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:06:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953c4a80ff8so608264241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557179; x=1777161979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zj5Zjm363/C/DyQhdYHrOzrfFWfpN0oP7QhfINvXvwQ=;
        b=Ka2nLBTmDVyVqf03XuFHwMC1kdvKQHYBJlZO7xLnCFkBJNNrXN04spDfiz/0EYm9n5
         P9grSSl4IpBgalWjr+vBEb7GkjMywRNTE2/+2iYgK0GVckoh6GtJg/8C1fy5b5Y54awF
         n8TDLwMkremvAjQR9RO/Bmg5PY+9oEyj69dZ4OasegmoXgJBBOJO5gjCfX/e+2El4wRx
         aE2g1qyWmGEKP/rWvZ7xulg9nqJlgkyQaBOstDFyXd8RBK/U7UE85YO+9Oju5YsR4tPw
         kEokGM+fOCS2Y+/guSDkJfnuxoIE/WiiWGNqjs4oK1nk/BN7N1kBITWoig/P4H+Jt5cB
         u5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557179; x=1777161979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj5Zjm363/C/DyQhdYHrOzrfFWfpN0oP7QhfINvXvwQ=;
        b=M/BpaxQ+yl6x20vZ1AFh0Su1Kmv9kiWMwvxuNjr9MGHuBoFEA63Gdb7l3KDp9Wq40j
         yPytPe5XnJ1L3ReC+SDkUsxbwS//dMQyza79vJdpZvQ2H+k5ntbfupeIq4qqDqTwOT4A
         G8pJx69bRDeEmETDfEkdMeNlQ9NvEaTJkAIx4p7ZahQUOg1QH8HhyfdQYG/4FgNIM0PE
         4KHdKraXxtjrl/9wdf8PdS1MEi7qlDrfynzPjYwgmdLOWTEgUNjJOjL6DqHZdXXf6AXN
         YYBgwsv6mBOA5uhrC5seMFoq/esk4DdukcZo4aaTQ8muu1gXoJve5l/1LbQtPYuFDVbH
         MsPg==
X-Forwarded-Encrypted: i=1; AFNElJ+LblQtmouUsBTXjHvrh4qkL5nLu7igIW51BakBXDej3kQngbNjJ7rr494IPaCcvRnR1KKfDwySPKcp6kD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwAD1KfTg3cLExCq9HBnMD71LJNuvx4R8ZMiuc+pjZ9HmUPHVvS
	oEBRL45tcgddYWuuDbdNkooBPkKGwshwG7nk9c+j6+Qwq0v7H0bAZwoc7HIPKdg+I9dwncT/qYn
	x1S2WTGtEmbiDjmerhwarKSw+Y2bOOIDeAz7BQmhR4JC78m9ELDYJ7lEkuoX0oGJyUTUU
X-Gm-Gg: AeBDievejg6Z/oO90PzlGsZztA7zJGgZkXgDotgTQRSR2e3WOWvAzHNjpp2EhyLfBE4
	H/pjzWlOymeaoVgavpwAZmlblh1PzqPIzF741u52xlft6IqoQ+tHLbsGey/pXdz7hvflYnkwZdK
	LOpeb0NVkVFhO62fdNKM0g4u1jrZq2/bh0SO5qa/fXSHUd0x2vYTwHx9BvBT6iVSgS4VMqPWtru
	r46R2EDHiKpgVyW0HlLMi9Mi8pPVPicZEY6Q9diJPZbBgjEjhgi1om/h9H6Axe/nu2KChDPYIpH
	uQtGX4IWf3wgHZ2xy4uiEWRWFOfOX7QGa/K324mVQWMGDgogYYG9cuEk+Hq4OKGKW2zc0sTPbPT
	jUTrmTMRNxJTWE56RrJJNOCwg/57DVg6ABq5TIH+05mZHgtYWplAhhxjnJwm9L7/Jv/6Kt6Ys8a
	UScHbhqWUZrmb40Zj8J2ZbIPhPHfDwUlibvS2b43Ab7Mi02Q==
X-Received: by 2002:a05:6102:5e94:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-616f772efecmr3605493137.18.1776557179212;
        Sat, 18 Apr 2026 17:06:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-616f772efecmr3605482137.18.1776557178732;
        Sat, 18 Apr 2026 17:06:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f65absm14470731fa.11.2026.04.18.17.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:06:16 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:06:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] regulator: qcom-rpmh: Fix coding style issues
Message-ID: <comfrjkmlvpihmtlbxtdjdqgja3s7b6xwccpzmlfaeqw6omphb@3f3mazsfeqeo>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-4-34079f92691c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-read-rpmh-v3-v3-4-34079f92691c@oss.qualcomm.com>
X-Proofpoint-GUID: 6IuKoqOtLXoWrs4AbB2kIbsD0B5snLMf
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e41c7c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0WakZaYG3ugiRQ-UYPwA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 6IuKoqOtLXoWrs4AbB2kIbsD0B5snLMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDI0MyBTYWx0ZWRfX9u1i5yooz12T
 8p6z5pJFO9pU4PTQdTWrBkcy7oy6LUX5ZxsK3KkrEk2dY7fd7JuY40YpJWobtjyEq+PlU7ZcTqj
 XdDwhImPqaf3ryVAMkvo/xIlSMRsnQfq7TXaoBZyTMap9qNaQ2X2MX44JDSgkthlxeW24nr/hQ2
 NfPY3akwdRo4EWTuLSRoGUbI9m3GtFQ65BwIglcZ+Mq9JXq7TJ4MFJHb7+7UVSsMF+LXIVaThE8
 yuRk+sCYUnn9ls2JiBy3lZl1eAgMtAd/+Rz0qKrODbJ6Ti15wLLPXiGXsZgXrnyX16ybPKqzfRv
 1eY+x1G47H4R5MGQqQdFnL0HoCDMlOhLtdUAWiPkIkNQ1j3BznUdHHfFPlmTS+PiB7NJEWaN083
 NypJ3kHNyW05npL7bTMT8DPYlHuUgOnhJ2Ybx4KSJPhg/f2wkgc3Ho7fZS4L2R4KAsMfuZjhsjq
 POvWufBII8L6/wuhPkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180243
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-103613-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,checkpatch.pl:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93831422A78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:13:32AM +0530, Kamal Wadhwa wrote:
> Fix the code style/format issues reported by checkpatch.pl
> script.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

