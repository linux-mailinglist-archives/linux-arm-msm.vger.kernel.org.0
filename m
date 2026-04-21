Return-Path: <linux-arm-msm+bounces-103921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOTCNWxS52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:33:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F643994E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F37FF301A69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E782A3B95E0;
	Tue, 21 Apr 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC4q1OYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfMyZ0s6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39A3BADBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767423; cv=none; b=Ro/KIiYfuoKoEJ2PDWSIap9RnX6hZfv987LkndIwPRsVijOj40x/QSXVj30sHNyq5UHbTBwNGIgsM62zS9jp6Gr8FKLhUd3kioM6NM6OA1Eu+HMTQ3tsOODuOmNcxsq+9Q/lMKDC8IyzpMJOnaGmWqAFtRJWM4NrOUv211CaPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767423; c=relaxed/simple;
	bh=mKvt+355AELGxSVEoeEvJasrsUpGv3nK72jz1jq0yQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rqz5241ckHMQd4FNiibEZP1mHYTRaPXvwL0FJB6swe8gyYfM4LgIuHZ1jl9WnfNUeZDyt5v9qPX310BkXhUu9JCyCtjQ0iX6lp3M4sVnU13i/ou+OmEXB+lKk9a7OuhUEXv5Q/ZW71tTU47twYibEyMahuwhpOz5qPsyL+QEcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC4q1OYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfMyZ0s6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ePum3574148
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=; b=WC4q1OYbxbM8/6mR
	dU3hWujdoeUHn7dTS0FAPJ1yBpVfSf7zu/LEMRs2No3aoNRpqefXpz8SUOPe7IUP
	dKdXoxn3+gdlSeBFAQsbLBcZwATdlAQj49JMSD8AEHo5r90cKL6oIZT2Dhw7H6P2
	8Rjqnwvuz6Ub123lQO1Yh74b6Ih6VPduu7IVaXcAxu06qsymVqNw4lzRgWw4CmWj
	lIfhTUhVi8iMBLFa3CyjKnH2ZEe+S/TA72TIlQMbS6UOFCOpM8a8T5vZlXdIfzqh
	aeH1sc0zejssAElZu/PtsapvAQtot6PQrVwIAdks7g3jE/jAn/Y16MjbBXDBxJZe
	WpSoow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gv03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:30:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso3607701cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776767419; x=1777372219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=;
        b=gfMyZ0s6yZwjdejQWz18PxCM/P4dOtzWc3cp3BSqJQn0If1EvaIxxcWTV5L4+XJg2U
         qCdJIXhKKKMDI24WkanPOEOoyBD4GEmCvQg3Krj+1RwsEHxEE2Gv/fU1qVhL7iWrI9+N
         fCdNBJ1A4lJxErNmif+R+zEApB+BR7Iak2WOvfwI7cJHQ37/K9/1bFAztau/rPUNiib3
         60WXPmTPT8vJV6epwvyhuhl0Zl3xbkKW1vdWc9JDP/cLmw2bRi47xVstELpLd5sZJfe7
         XDHZezzzADsZvDQ+H3t0i/ZM0RjVzwb3P1guSpXnjdEpCByho42xAeHuDu9pIE1cXS/O
         d+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767419; x=1777372219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=;
        b=Vtm3yxrzh9HLIIdZguC2LgOV5jvVB6ZEamTf9QPcYnnxOjm3/lf53JVIh0OfjUlSx9
         E251robQv9Qwa5aDKGkg31dPRpC+/lc/Y+dHLwvYGJ3h88ksC1DRb/oSyDZ6ZAk6MTft
         6f6rgX2kHSVBCztIqUU32kyM0S13BvsZUvwG3W1sfa3tqQNaI0+mleGIn+7iumq4nR1v
         PmifwF543FKz65rYvf6TkpYaJChmUAc5XxcBww2q7CNSMpnzuhYZO07KF4TiQChFsFOh
         vQaHMSuGyIJ6ox50jS5kU/3blYLas8fAahWcG2Gmg0kbuayCjzpo+dyEwIOGsXMZwrST
         R+DQ==
X-Forwarded-Encrypted: i=1; AFNElJ9onz0+gycldfl5a9CwVLTJSTKB/h1tB7EIMSCA0uTyZvCU2mLI+grLHwGKF6/1m92Ao0P1t4IS751VV5kX@vger.kernel.org
X-Gm-Message-State: AOJu0YwEobWBZOcAuoj9OXy29gkXVf1B+SjUGsZ5k3XjKJPhF8/MfRLl
	u/fwCEhKjKeHhztykCFov3Kdnr4f/ERbM3ZRjmcIB4GUyw/YEBLJ2HdpcToB/kc3bMRRvRBEmp3
	bIzb2zgwOS7BJIimfbXOyOTFiL45GFXn199k4bZU/SRi+D9EbdrLu1t7IR6pv81o9ecfiMatbim
	UR
X-Gm-Gg: AeBDiesp+/9MV9GTAUCDxEQWIMG5rFjz9CUMP/40ZY/WSs4scxoqXBcanMyWlTjDWFT
	Io6QUFeqr3U0GSQ1XeNwgaiX2pYMbomiI63WaPzteaWwrgK/AlrBoqwURgBkU6kB3YMv7Gb/G6B
	qIiiAmr1IHkaS7YPUs64DI2C8ayBQQX67rw/G8d38WzTtpWk4HuFdR5eb4Nalez6MPy3aLVTqQb
	XcjB9rl3mX70bt2HTcd0TQLFWycUKFs127qMWAo6Lj5y1kijDnMSmg/z5FiKtB4Zd3AaoFBZMrD
	bnuHHrlzHSwaygsK+ADTysJitYsplcmcVvpbZa1XmvnsDusTak4P6WNL/5ZejI7kCX2ojgM3YgD
	i1EWbjdEbLUb6GsiVTG9wmeUNvqHGAw3e3s32fjiNSh7OwOkPy1wRkOqRPgTDjMXw0SDfaNC7JG
	vD9Ftn19FqI7SZSg==
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr45350221cf.2.1776767418966;
        Tue, 21 Apr 2026 03:30:18 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr45349611cf.2.1776767418421;
        Tue, 21 Apr 2026 03:30:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm428886866b.48.2026.04.21.03.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:30:17 -0700 (PDT)
Message-ID: <69515144-2046-47dc-a43d-bd4d0cfd57cf@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: add USB-C
 controller and connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMiBTYWx0ZWRfX5/B+mhuYUegq
 UGH8+ld1sXyY5ae8msnF8OHTPaJjeyd9olyI/jAsSDoKfymLuNZGAgVfSWskRdgnUS7OhSkZV8N
 eWRJYnNxwKR0ql/wFuSsXItJG7KujWpeg6NfdEE0BcCYkW03YTbu11VXa5hr1wVafoWr73R0JrH
 RrsZF8m7Tq7ApdmyN1ay5ph1WnxKdqevpBGYO54zwf3Tvk/8Hr7URim/hieqZbvJhQHGeXbYU+L
 EOazs1+9+vT3HuH5a+7Lmz7lAau93nt9Hiy1Vgz3e7Q7jHWr4EeV/GTRZG/LEjY163UiPBfLlnd
 C0c28M/+Jv9RYbVO2Xs27QRvDjQ5Vp3Q5ImD7yADCqn/m49+KuD15PxCN/MHvMW0dk2N4Jcobe2
 oPJ5resg2NqI0AlYEDafeMcIlt/xvJUp3DJl/1iz0L0SjpT1TjTbdwaZweGLHd7Z1VSi4beQ+8o
 79SB6XGBC6k8OiWS2lQ==
X-Proofpoint-ORIG-GUID: aRLqt05N4Dj93mQzAKXOHxuwnyVfNPDF
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e751bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JCuPP5i-eADJVAQJ9zEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: aRLqt05N4Dj93mQzAKXOHxuwnyVfNPDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103921-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E16F643994E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 12:16 PM, Loic Poulain wrote:
> Add the Cypress USB Type-C controller and associated connector.
> The controller is connected over I2C12 and wired to the USB1 DWC3.
> The USB-C connector routes both high-speed and super-speed signals.
> 
> Enable dual-role data and power over the USB-C connector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

