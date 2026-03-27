Return-Path: <linux-arm-msm+bounces-100358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPRCOICixmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:30:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE383346C25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5AAE30D8E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381AE3264EB;
	Fri, 27 Mar 2026 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouw+gMEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/IrqiI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17C2F12CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625036; cv=none; b=Nz89sy74ErSbdXRv/RcuV6PDEEoe8PgBBm1oqdHeHt9B33GIyVDNk1ATCOz+VUGEHxdBBgTn+N5ap1cixPDF8bOtX+yKkQAkuj2kcV0EbieXZrB6N3fHO5O/QMfXswFp5rMWO7SQWRfsAd4rylVsjvEOKuCiSgeSCO4yYouG9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625036; c=relaxed/simple;
	bh=CBQ/HTj/+gacw7tT3f4qCTthPnRKgqCdg8MA3D487EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV0/oA6V3qEIIdJnavcKX4b30r5ZlcaSwaKSaG08DsmiEULyw/z4d654FMmUHnm2Hii65sTNhWxvxRESNfYa5yGYh/k7WRc+rraQy24RBSv/dMYPcMupswYdXMpmnkCjXPQY23RTpgFiGikxmO0fooe4WxdweMJLWuZgNVTGd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouw+gMEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/IrqiI9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFL51O537091
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cJkVB7soZuEH2OgjtJtIPgf7
	yoWxt/8TCdmxiXUUzOY=; b=ouw+gMEk7leJbxOPZqtLAL9CCBgFJwEvWJZv+7xk
	Z7KaPbkQ0empzPJKynwwlq7GGqwsGhcPepMNI+l3VHmXsf6bnsvyhq1N7IvounGT
	LpLUZb8HoawEtvoxoJE37Yl/PQnu7qI8JThzh085dBSdJhAy5NA8zBI7PrsLgG9c
	/WMVXebZ9wD3XYJddhTWFmh9xW3FCyYzZ+1yaVDBE8Zu/vxbNmjltw5oJuD0/CB5
	TzzB2xVxp+T5cDawDEm+S64AZuyewR1JzTEIunUUK5N3eGl+UcRHVZ64j74EYoYP
	Km0Tsc71GgM5PoWybSf8NH/DRZhD/5Xc7yYozbGUcFBgCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6r0af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so54910371cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625033; x=1775229833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=b/IrqiI9hFMbh9ya5GXRwjKLfusb0zPQazs6gaqtaRuLztKhLUcdRU4X2Qs7g6Lshg
         /pZCs0WSSXSPHOksek0hU/wOsy1iMcQdjBjk1Gthf7cFZtnbFAYPDBZKpvRx0Ro/eNcb
         n4h/GR5+C9/Kwobm1n89c/0ycgAQwFUTQ+hcubUkQB8+aM+n8Etd674UptWXZC6lQJJP
         tztKdbQOKZZY0nkD3ACZMSAOslfQ2SIzlVH+aW0PqsxOwg3TPp/JgADtuj9Er9SeWlK8
         JzxHArXFtNEcypq4qD+Zzr7lXt6I0Ef6LjwJKkAotb+RmrBwiO7HuQS5Nqe3xnO9Hbeb
         S1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625033; x=1775229833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=Vx/pHqj97xn+n0pCpujvF+pdKgp6iNLmqsjVw1MLSqMd9pbY4c6flyDc8vr9HoSxM3
         1xGS/Mil+QfaJxGRCwL8rrZ85+hXPJN2YuGgM//zjEuPTw1lt7vpF8KhzYJ7d8r3hlfT
         5zN8DbgrW3REZJky0onNIWL5VQeuIMnv0KvaXwb9FScPmoxb9l8L830xGHlD9X6wFXuu
         EVKXbz8gnoNb99tJqxk6ZDjy6UX3WnlFFE6nCp/HhoHUGp0ZZ8wfvg4lNXCmJVj+4RdH
         UdD3LCVENTztyQVO5uS7OTmpX1CIH/Z6A0gZbak8RROfYY10sH6jRf/r6DvT8/LWj0sH
         VwDA==
X-Forwarded-Encrypted: i=1; AJvYcCWA+LSAGXyjyl2E3Md7u9xUVqymYtsgMjhfTO8X3RhG3tSbGlWURskrLhYbCSQO3oDfktPSpETvbJr/gwzg@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMp8B10L3mracoxFK3ivV3PS+fKSBkO17dX455EU8zdpWZ+Mp
	wq3EEYG78+u0a04lya44kWQrt/qt72JpHqlt7EeMoOW/fFGVzBYq4EcL55Prw1w9DQo+aDz4+Cs
	vdM0Eb4/PNuMotZYY0rMqeyIWf2qoXQ1lJxIfDNGVPin/0autNqQZ130TVDoXsSgjG7pZ
X-Gm-Gg: ATEYQzyxRgD9Ni4xwCScHf/gzHNAl52CZfMnUemmm4iTVDgfqsGAGcHxgMRRCarR7LL
	OV3CvORn2zMrovrkI0LeFCvpUPFWXYnLXvV4sML0HGmxDKMwZ+vA2hg3852mlElJP4HzTahr+gJ
	prG5zBCwjGugeUKvMXlYzmlhfFlQZ+YoAWQt6sXn9CayKb6hA7J/NDYKHptWBCpHL07LN3wSKsR
	WngjoY8LlZFedJIUN3hxgI1mOL2tlfbeCMLenogaJAYFI+GqKTNhyxlfgmU8tfvP+cEq6PziGh8
	EH6S4/NEtoAHLfdmm2cZIlp/UwijH0MLRk8jMEVvFUc7DVuQmrOE0lkCxdaoMZV9LjRUxwnFwdo
	X9Sj547STi2WJDvJeB/a454XrkJfn0KS0Xw==
X-Received: by 2002:a05:622a:5c0e:b0:50b:551d:ca87 with SMTP id d75a77b69052e-50ba394afcdmr35393551cf.54.1774625033262;
        Fri, 27 Mar 2026 08:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0e:b0:50b:551d:ca87 with SMTP id d75a77b69052e-50ba394afcdmr35392991cf.54.1774625032756;
        Fri, 27 Mar 2026 08:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2aa3e64f7sm684285e87.62.2026.03.27.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:23:51 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:23:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <4pzhuqyaxemr6tde2duzg2isxa63nfxa27le4vpvohxcjb3j6f@jxlql5yibs4q>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6a10a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UIu3W_2PBg2vO60LnBOmV9xP9F8-FfrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX96OlbcJn/cBC
 y3ZKRh4lKz7zMeTzMOL8SJ1wmEQRayq8jKKzQT+ifld7vmi/l0VChdEu+9qmgFdqNB9VJZrPqTj
 wrttmj+YVPSdE3v3LucizuxLUUC8FYP1OJqCr7EMbK+gjvNnOWtvlBbyt8OUDjJW74CXE27/lfe
 uDL+gIB6cnxPlBny+nht7j27rW0AMEiwNwrhpw9cCIby4y9Lsktz1SbCX6F/HJcuVqRwNuOeF1R
 40HJoRNIolzwPCJ5Y8EDLFOXi3X5YpmTEDnNdFnZrJlszHbjQXYOD1VsMuJLtY1pepww9tbh6Xf
 pN9IURymJVMKltesxuILmqOL2Akm031r6XP1wxZjF4k6kFNBOzbQecja6ACoyGmByB1Zvw5JDCx
 mLBDtU4kNBbwpGj3IfXEg8qEGnJaX4IdFJi7buiqci8R1lUphCCm+zMT4MW5RCjU0NKO5qfBIfT
 wlSmFB7a7xWAASNXC4w==
X-Proofpoint-GUID: UIu3W_2PBg2vO60LnBOmV9xP9F8-FfrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100358-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE383346C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 17:57:57, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

