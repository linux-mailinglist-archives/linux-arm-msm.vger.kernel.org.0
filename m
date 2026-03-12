Return-Path: <linux-arm-msm+bounces-97205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GzNNJe0smmYOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:41:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0D271F05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC55F310566B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEF131B131;
	Thu, 12 Mar 2026 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxARHRvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0eWB6Hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623143A6B64
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773319197; cv=none; b=QpPk2fYz+W1nuxgCaGwvoRakG4aAwdacTW7ldhmUoX+kbFDVfa5OzsFWbribE6NzVw8cg1NkcSMFNUOuwP6GV7gZq2GGCPeI+3WS0wh2z4KsvjACeQUKmIhITNk/l1+DyFuyCQAsPc1aZDc6qhZaCuVoFe701mhf0+F0LiXmdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773319197; c=relaxed/simple;
	bh=wH6m20oOvygHKWGptWP4fU94uVxnzag9ztwGIqhTPCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsD9688/6YdefEQRqJteKpFsd2xh96cYXA44i3p89ENA+jZeCZYSO9WDkjLT/yZD+MDr3075hLm9g0SJpe5rIe9s8U93Z+TPKO/KIg2T+oCRl2qr1HjfzX59jLQtFI7BHng8TJWSrM9DNkqUjGoc76HahhKd4zZsY61q/2hbsTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxARHRvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0eWB6Hr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9QTaH4133000
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TEe9/mDYVPAhaKZz+dK1GUhp
	LGfNKUy6R+U9uO88nPU=; b=MxARHRvbaajN9Hxegg0bJWVVYJrGhUn8UOV6jlY5
	hU8g66cKLGeCf29/0B/dqpziCHY9QjCYLCHfWZgFPjfS7O8MoMO/phSXCzzjgukg
	rYsLu/0PKiaJsybrtfOSryyk6jbwj3k/OInVTVlSnVCnR05285EzBie5MJ5ouEbJ
	ZDFcPRG0wZa6RQ573Zh9sCRy1bKFpNjFj0iz2ggInoJHCmucUOKdI4JtVo+i7KNh
	CB9t2ZK5S3GkuAMpIGywnOdjdnm+/hmNszI1BwthXk6Q356EECmDntmlQX8pfEiK
	oEuS7nOo2ON/JAd2C6PA4ro6Ktd1TtqoV1ncSavx467a9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w227r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:39:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7f6ac239so634165685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773319195; x=1773923995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEe9/mDYVPAhaKZz+dK1GUhpLGfNKUy6R+U9uO88nPU=;
        b=f0eWB6HrQRoO/D39p81fwtLeknaLD3psiRB0sYMB2jElMW2Ya8on4hJ/L3nLEzvB9V
         6cqaYLNw1kqKlWMC4OqO3OOFUttpAAep6LPQfIxnEmiJiXmCMPyUbRmsNstkRn38sYkr
         1tAWMP+2Jd8Kr7U2QNYCLRGu5cO9+LZNagmLofl5/PUFGwSIpYg4FToX1AGQJyY6yyXo
         akvLxFXAD7dv7jzUlLtTMkpouB1GtKaBbFRfNahXkDEkbyNQmpXVj2jVOTU8dzLSew3k
         TECw9KmAT0TU4BJ4m1dZ1dcQVCK/Cb7zG99T0Kb4nhNobgDFhfQpGD67tjIj2lNjP9p3
         6LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773319195; x=1773923995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEe9/mDYVPAhaKZz+dK1GUhpLGfNKUy6R+U9uO88nPU=;
        b=HUaWlpfi5IWb7l2EKefFDnCD21LztGgHcezKEAWjC+v1/cwbxfj1rTzdRzEFVuKr8D
         ZJORSwmqhVTySJL3kcFmzDT7DQVWZ9VORoE6YVLPSC+P8tIYxFBlE8EQkbg0dIG/frqe
         68G/yPX6GsAebrIXE2ZoU5uNiaPUNopq7Co9mCOsZObrgScxlZmeOnG9wlDJ4KhLgGuC
         nsZkbd208aE2VTwjVquRMMz24VtzMqU8M6W4/rctw+URda2BPDZRqC+hXFynMqztu/lM
         WlYYcikVQow9+9cmKXJmSYVUUX0PDgrp8x81JQlk4zJqCrrG/B+pRF2Z7OWr6RchK437
         t7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV4T+tO/YblvcrAjZS4NNNSatrBvJKB0HaN0Wh1S8HRdSbATZ9BiAfBqfc/G61EDjWnEqhRmF7qTeTq6IGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5V2ksl5DL0eHzdQdvTJaQ3rEdo53byiX/vOI5G6zJBzo3iCL8
	OZnL+jQ5Ky/NID7Mt9+X1znczSsXVDlX7rxY7gSH81ERWVskgnSB7Df+UOS/0+4JsV0klgd48Il
	UtpBDKw0Wwfaa6HuTFQNgv5TtdVx9aTDB4n4lHPDRE/e2YHDq8aqZjrvnQfdJpGyEKLXO
X-Gm-Gg: ATEYQzzGYJtLClwTbVMFfnbyhiyBZg5KA3AsW1qwXAqk40sunleDVt0pwrNT6PijpeN
	Uj0ATPIoJPWxLnRNpSIoehgsOQCehW+5IXNOTMoAfW1OM53MPQa+t7pGXmTJHw42eASXDyoNKcW
	+fZFBNDLds70gMysLAMoI0JEO+3X7SaRCA7NGPLI2H43G8gMvdzNyB6tAG0P4hCEOalE/RxfUe5
	GroGRT6jWgQ+NUtJ/Br1lre1EFtfTuXXs8AicWiU7L/fSsLstZBik5h4pvxIVYNaAfuyV0rQR01
	AwfGYxodCqF2xQL88T+jb3jTDyqTzResmHp9SNs7SIMMAjxbAcqKO+ZT4KgAan95mVOp/bLeuOl
	1hYnmT8ri2jFzCA2/nDGzVph/7481HJBK+iizapIPiJ8zLa3w8vrf0DGvQiERYwQ2ksDvORAWDK
	7pBRk7VDAWZcOlZE9v0wKkAcRCJWmpP0RDjas=
X-Received: by 2002:a05:620a:198a:b0:8cd:9938:9810 with SMTP id af79cd13be357-8cda1954688mr777500585a.25.1773319194582;
        Thu, 12 Mar 2026 05:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:198a:b0:8cd:9938:9810 with SMTP id af79cd13be357-8cda1954688mr777497185a.25.1773319194102;
        Thu, 12 Mar 2026 05:39:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f1asm8331641fa.2.2026.03.12.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:39:53 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:39:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-sc8180x: Enable runtime PM
 support
Message-ID: <vbdpbesngvoya5hp7nlgt2oorw56jqyuuhjvxjr6fgqvaea5mf@zsnzzqudje4g>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-6-val@packett.cool>
X-Proofpoint-GUID: FYQkniL4d7YCgjal_VJcrnIIp75O0siU
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2b41b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=v6XGWrSWbwRJ_Lk9CX8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FYQkniL4d7YCgjal_VJcrnIIp75O0siU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwMCBTYWx0ZWRfXzpfYSFmvR9It
 gBmWu/rcOu7kIMj2vKmeEMxyUdwH6SpluJOsMrw0nyrlgecchDCxkLFLVcr9Mhs2xWRhaVabS5G
 M38huDl3XEH48ywZxCq3oR+22d7v2g2AKvWvgCvVIYuF94uC9af3izRC1zA654SfecvN3DorH4W
 Guu3FWKN1Ct8HqBFnGIJzJjTjg/atEPMEBhTRWR3XR257I+iUZQcDO7RnOVRY/Rc+7YU6cnyaoi
 ErQnRqbunuXT8dd2z2X/UfRD2bSbXD8LCD84gqGzSCtGuOF0Uw2jWkUxpN/TKlihB1y7R5EMZ4x
 D5J862J2+SnLQXHj+TB3vIdeOix0oa9Of+mrhNwJ3uuYxnr5jaPdo2kPPWhD6ml0PSgN+84mlGQ
 46jMS3TAwK8ppr0SeCe467Js7XILubUcB2qjK//FbhiHZSS+Jz4f0MMAE9aQu4sBNAFDPWHlpg/
 F5u6gM/Js9sNQi9NcZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120100
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97205-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AC0D271F05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:10AM -0300, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

