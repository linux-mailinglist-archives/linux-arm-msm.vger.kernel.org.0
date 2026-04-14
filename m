Return-Path: <linux-arm-msm+bounces-103193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMSiIJZ93mm/EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:47:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 207643FD3BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E75C3008D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9462D0C72;
	Tue, 14 Apr 2026 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/Kh6z4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQBENdZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5D306B0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188819; cv=none; b=DNx+sW8Goouj1m7Cr1FitTYORuMM2+cSQR4e3QifiOerntZP8TWsBHL2SmuHqKz8YD3HHkWEw6W2+o0noJIxU397Y2MxxXJdfABBrTWgmz9Q+nxt2DjlZEuWHVnQ1kGWwiuPGH4VsE10fIvsa/tpJcvEPXezW9g/gvooWhjLRcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188819; c=relaxed/simple;
	bh=Az8jUdqjdALxclH4zeNPwiXwr4cGG16iIaRABsqhT1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agby+t0dA4IOdyPdTGwdkZwNoE5UV1dE4uxlDVbPiqfdQSfGB7SoQQ+qDiUAMbmUJ7alhnyxlKsjfLEJUjrSyiB3jH8BRu7w/l9wEGyZTfaC24RDTYtJFgi2aqdR/+M/7529lb2bbpTxsFUVaHEy3aLm+QftuGHwuMQT3uQdFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/Kh6z4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQBENdZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBmOri280927
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGTVhNHPdzV7VNIwQ2/A5yra
	FcoMaJ4fGpKnAXy6Ivs=; b=V/Kh6z4nP1cj7/7WhFQ7m7ovv8sATNrePAssnP/J
	gq31iFCDyKRYbmOhgQvlZtxGZFNP6jb/70ln6PPhZPKwhoOInO9ZCvmgQ/gW/JQT
	AXfIMupFjlErmMHYhMkHcxRSGJVoZsL+q1rSGFBSXI19LshaCnstBGeTDktyTthj
	GDuhmXF7M2T4B1ks4NKEwwxNZg/wIjFKCrLCd3FnW2bIkl9gU0MMxF7iis8o3dqu
	ros8AYi7Y6HEDEtWan1YHSLluf0JZsb9C9g1Sn+vGKYUJ4PpIIEfhJmolrIezFcW
	qpUNsb58jPatZdESFLWZs1BeW2lPqUCWC0eP6owhLRMgOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkwmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:46:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so104328391cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776188817; x=1776793617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGTVhNHPdzV7VNIwQ2/A5yraFcoMaJ4fGpKnAXy6Ivs=;
        b=fQBENdZu2RPHw6dVQoyUfxXdv9IJadebNRtV0M0yLCimIBr2BirhrPtzMBoWngxc3u
         mHMBAXHzfJwzxLIHfo1K1bLt+lMROKI5sqpcbpHws+gIJr7hJUB0HVU55szIh6dDR+JQ
         gaKQeqBtZacemL5NwuRLHR0/ofXxti1lJoErzPAwimpaGthrmA4p8wcrCnpHIl0TZ1qJ
         yvcvUVK+YZ8iqTjLUkhy9DB2JgMjxSrEITi5SBZo8Uvo2J7RTKt9gv3XdOnhld1YCIMm
         CI1JsmbaHZVxBP2pr3KXh8lMcvYSg7mmGBkmhRyDymcP02AZk/jUBjdPgdoShY4Efzdh
         wYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188817; x=1776793617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGTVhNHPdzV7VNIwQ2/A5yraFcoMaJ4fGpKnAXy6Ivs=;
        b=SrAarMSEYfqQYoll5LA3T9mFEtzrro73+GBL3I17UqkakggNsdqIKCOHQ+ceD3guP9
         95PN69NPhnxbylo7xc/cWlGLawc04Ankply0qY98mKYJGj21saPvJ5kYkN9yhz2gjo2G
         OfREz4nuoONAg5YPA8G1gAtKbz7jkv8/Rl90YEy3Uf4U41WubgnhZCzslToytIr093iS
         DB80sJa2YVcGVga1plJId5neaYGSa6qNdZRFQTHJamUW/vizpFVYuGzXxVNIq7hl0JYb
         xc6+8chx3xSAjq4wirfdBo1e2SsWHfb8W6j6P9g+g8UTxG7WIncXNSTFmQJqHs/ESVpX
         oYqw==
X-Forwarded-Encrypted: i=1; AFNElJ8H5TyK7GPb61oxH87U1aDnlXOxmqtiZphbGDXtXgIPoueU/PegAlNi2+Gs3cKnTNWe+ANiGOmIlb8C1usb@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEJn/+O7/GuvwB2V3oEr7gMTHKgX06tj/AwCzBpg+IVDXN8jb
	CoHLQ0kYomsHY6C4es6Y8S9EM/vYbF5rYAWfutIXBuKVuU8/KkYauACAMFF/Rb0mg+zAAzpU6Ut
	aa4LX5CdNm2QkfxJgBJricWQTkq7bteEgai9xqTuUxuAwA/4EiqdFGMgh6DmwXs61kmd/
X-Gm-Gg: AeBDieulY5c1oVsQn/xariHquzU6V/pqmlsqa2ccDo6tb7nH1ao7JsbLWxO/eCGJ9JN
	MHlrRXxC0gDcqXmlMZn4uOvbSIGV2xvCXyaRrmRp9lrUwg0PAkOznJehK1FvzQSoxR5bWWq4cJM
	SMuY70d4uYtjTwamHWl6iO8KH5P1qZwyQO5PFjrDH0/2V/1tVTPOQ8XBQ7xdHtWx48q7SMG/sya
	yWEwNh0vCdcaxm3E++ngCibqEF+sj+9MRWbH156XXt9pJI5ZsagsTJl+Q9+bK+YGmmaoC4iMor+
	HUOlyKM9ir+r9R70pUZo1ItgGB5aPuhlovblNqFGZpSE7tKOsgbcuvR30p5v7GQguUroyTjKi+d
	o5lYtHqLNg0Q+fI3MkJz1v9YU9nZKBziK2WKdSESMgYWU2zCFL+It3D9Il+uLy3Ryo0kkFg9qDw
	2broUZaP2Tnl6EyvsTvqnP+Za2Df+8+1P6sHV5ktGzaalaPA==
X-Received: by 2002:a05:622a:4d4e:b0:50d:6ef4:b38c with SMTP id d75a77b69052e-50dd5acb6c3mr246211321cf.20.1776188816846;
        Tue, 14 Apr 2026 10:46:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4e:b0:50d:6ef4:b38c with SMTP id d75a77b69052e-50dd5acb6c3mr246210721cf.20.1776188816199;
        Tue, 14 Apr 2026 10:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe7db18bsm1378509e87.47.2026.04.14.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:46:55 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:46:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Message-ID: <p3nx234uwvrsrrpyfhwoc6lfzax5mvaixhaqtbehbiirvp4h3m@vzalm3esidnn>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-GUID: jEuDzV5DlkW1SnCItOpAzPz4V9__o7UT
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de7d91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nVvXuFPTU1805r-_gQIA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jEuDzV5DlkW1SnCItOpAzPz4V9__o7UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NiBTYWx0ZWRfX2X3ZVneg0088
 kxZqTfbznbz6zoNTe209TGou69BfjlWcn5yqVqNvMDlyyFO2t8U/QAD44lvB78o9YthN5zcguWB
 8rYExYoTv8AMuNhdzEInvNaWphvjdnS/mHUv6dvwYzl5G4wct7jr+2wVDI+2HWdNV5OIHUcnic2
 jEYFimderyg4F6zJ/YgWOUzD+/mdZn8NTNe8FEOFBysZh4PBnYs22efD8Au3+wseRqRrM0kaVWt
 rDVYmD20tIHSASZfpZ/bIluWtGKoxsd/xTz1qEhkL2C2ess2yIUxbm++ALuIwplzxLiCzu1VO1O
 rDBeIt8nlJWXw+X2l4y1I4UhIWDi/93LVRksVlNH9Xyiojt6o5ugDAM9LCyDngagK6f16t6MekT
 nH/SFB7Gr3g+SgZEFwXHQYhfer83t/18CFM9T1IT4RsRLxlN2vRM/LzTProy90bHyDOVdEo3DxO
 FHWGKpPJCX/vxRt1Tcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140166
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103193-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 207643FD3BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:38:20PM +0530, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.
> 
> Fix by adding proper error checking for all operations and using goto-based
> cleanup to ensure all successfully acquired resources are properly released
> on any error.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

