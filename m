Return-Path: <linux-arm-msm+bounces-110577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M+kEoJvHWqWawkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F381761E719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1952130591DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1133D36E477;
	Mon,  1 Jun 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+FWiXti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkzRIEio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E99236CDE2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313833; cv=none; b=XjtuJCvK/jsPWBPyL/QQlSMK1ppdrw+r0HSUkQ1JgLVI7zTPFxlBlHrmIYeXEBmG5su0Cs7hPc5Y6cLLC283k98vb/Uvldu1uSBIQauS8iKHbVKF0PvmOohMeQcwk2OWbQL5C6SNR4M7dX84nztvZOkT8I4ope+EI34LZ044icE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313833; c=relaxed/simple;
	bh=NZbzVWaVHiBF3W8uLPaqkX/feD3/s0YkOgd+u/PTLKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsXSnfvuwhl1z+/Y34s7dtqYkYpHJqS3n48p9Wxvr/x5T243ov/gbRC94EShUHX6dMB27Kh+aAxcHMaBRC+fOv8eXzb/mK8BAehlskn8sTN4Ri0MTqLnbS+0uylPLnKiSxCzAT7mpvzaocJbzTeK/m8JLQ56yZr3svhdxzX463Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+FWiXti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkzRIEio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxExB334631
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=55EtMKRRw0JSC7C5W8hcUBkY
	QcZqMU8GZLRoMMfIUyc=; b=E+FWiXtiyEDBNgeuivCmC0MoXDMGmhPHFryw2M6l
	Bnp+oLRv1Gq0W9YYuJi5cvsK47kcAMoWwDGPhwEslHu8dvvy5oVbwrlaxzSne6Gh
	FSNj62jS8ZtSKUPTxM4kDlVHl5GgpfiM4t2Rr/ypZAdt9R3oOk45pMiqLBnNj9cq
	W6vEGdH4Rhomz8nznJhycFt5yfPAYAslH81/LJtW5NcHK+vuChxL5kN3RM4AswCZ
	yvfd1nW3GRIpqVGQSTXzCfxjqOH3u2bC8xApCUDTi/HqfPvvN6rBbT6BoqaAjlYJ
	yZgnX1Wqb/1hz3TjwneCj55SyOfMA6e/U3AaS+Z8UO1djA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfr59n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9639fa7f2a7so718204241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313830; x=1780918630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=DkzRIEioHQo+emvZ2GYzM1JzevDeKiIVDCV39nSprzy/kAl1ISV1bl/b4QC6ea0H9+
         IHI0terjJjv6Q3M2LzR0MHDdKQW9qM5TaQPosW4E4QOCYho/+AYvxXziId4RqaE/I79A
         hOT6g+hFp4yczZCYLsaS2jkwtvlXUrg0i2Xzfh54v7SVErkcjuzzMah7p7T5zUCT3kwI
         lNpG/1pFou3dnAM5I085QDbcOSozbeDJJAqv6TaoMwzAB/fOpioIPU9o3KNx5WFPiamk
         99IxBRCEGwMSUrGvd4v1uMFklHE5NUIA8dywHNft0CBaxBYPSECYmvgBch85TCzYSBka
         UL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313830; x=1780918630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=o43VnULPaB+SS7k2w1giqWaiGdszI9PZ9Gf0R6fJF1p6XV1pxpihlCXkFhkeQmodh/
         W3jUEkP2nxVEnucp+XR700TrBe6E6UKeTKkH2/QqWTRonePwwRUm3KE3vWt3HPtz0qWZ
         A8/yaY7ffBfZshb1sQaHOsX3WOVVANWFrkN/wTsWSnq6P6tz7nDSuui0MNihWOxLugYU
         c1KUUtpWDoBXYUIQbd89Q8FoduM+sQ7856ovK/dF1vCF/WjFYtV5UYQwc2nutOh9t27D
         dncZc76QTkBHx7Ct3mBJE1jetJb2jSAm+VPHIdoSReMV0CKhSDjpaVN/F/27WokHoO80
         /HXg==
X-Forwarded-Encrypted: i=1; AFNElJ/dVKFaXwFZINfvxvBCl6mFvf+XVUGnE4mbU0tyNrxVr7Y1JrbtfwGV/QhdO/YS2gkJZ8tGHKgDDRmCt9pV@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMsLmLAhLvWpE7Ko3A7+53KK+Cuw4CwneQacgWoJi3vvd27wK
	RzRb4pdXcAyIiJ10D2lF51FDHaRT7MUgFBJ4TTWfBj16lGhVLR25etgsJmb3q3i7XgHj9t+U/ug
	EELIBFw9S3uudaq4clMJyZ7sdCkoN68SAHNZQX3ApB1YKBWhdzyZcsA7dcyYQikQowbLG
X-Gm-Gg: Acq92OHcAzGpVA8ER94V2se+1rmvUZwrFSs8DBmswtzVys1cPoxaSz1SFQ2W/27Vfbc
	hP4/zIN1flOIj1z83y6TulsDSvAPt5oYtvRVf63KmYuwfkroZgNjE2G6z8H+yXB2quCyy+PJDFW
	vBCFbIJYAEc2b7QAaLqH3oiMdTZqfgF5H1R4Y4KiJ0MHkl03409D+cmgJnFyTeyKo4ck781zamD
	vhfgNcHUEVGLz9YwSk+mADGYbjNHJC5p+roY1dzBmVmUCev5hb6Qyke9y1kzStMVGOxY1+22K1k
	0Mh5WMFAD1TlgEpfiS5BGecC7MbJf1+WvyYl7KYZqDq2g7sNV0q/xN9OJ952rkGkoPyYR4KI5jN
	lL6s0ef3PuawvycOsxjFarr3Ev+WCPkO4x0pnvZXSlyqpy9YGZm0QKr+HngDz12Fm1wv+fLJ3+j
	j9JWOa695DFysdqM3d6tAnvZNOf5vTtfrAGLfXD4BnrOq7YA==
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866839e0c.10.1780313829802;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866783e0c.10.1780313829350;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa631c7e9bsm1494523e87.16.2026.06.01.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:37:08 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <ckxvmbz2rmel6etaqyzdt7mt4ijdbehqp2sg3pggcdo3hf5qcb@z3vkzqaby2rt>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Proofpoint-GUID: n54xcAIqvjeZ37whWPipctAqjV-_C28X
X-Proofpoint-ORIG-GUID: n54xcAIqvjeZ37whWPipctAqjV-_C28X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX4n2oRnuXB5Qy
 al/+DacFuACSgky5ecamA4mOT2epb2Q4VOFPds64RoTjs83lucuHwWCI+5qA8iMr9cXpGHaLWi8
 6EDGxoucUpH8ouJOrToFE1iqtEj+V7/cRn9msxlZAAs8hWAUQGikGi/X7Mdrva40jeT/UV/U8iB
 jjXCwvXgjelugZNoszEt9EZvI/Q9CCXp0HRj1xsZfaAoCFY5a0zYj6TjZSwX1aETEP5w0U6O34m
 ME3VBzbEB4bsXUi6jlMVqDw5XDxZULVwPw2m3q/GSDBC5Z5UqHjhpIpt6ftyGtBJTpFXv2f8Nx0
 JBFUatWs5bVrcOkDqaVpr8n+F6w8tQZ+ijO2CpoG1SRkwas5qE59sQ2Vvt07xw/lxHmULKmOEzG
 YIIJDIRyGUmuV8LIdXvkJwXsMN1QosZCugI0ixU5Fr3o0vLaz9dnfdcch7iKZru5AdzApBaWKwr
 ynb7WhLqyaO28wm7dSA==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d6ee6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010117
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110577-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smankusors.com:email,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F381761E719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.

Nit: if the series will be resent, please consider adding something
like:

Although the platforms might need SoC specific quirks or features.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

