Return-Path: <linux-arm-msm+bounces-112855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RdwTCt+xK2q/BwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB267722B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HrXJtdVi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DqFXewll;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112855-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112855-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1EF3009801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A535399889;
	Fri, 12 Jun 2026 07:14:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A479382F18
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248466; cv=none; b=P792eRVW7F/B+eOcXMNt8acHco6X0Z3FxHlWKDffG4eNzL9/hyHUSFOf6kDNrXuqnlgSTgA30ie5ktsV6GzZY9cGsNDJ1xi1pksXACBTGMoxVjglGkLtQ4KiWRgrZaJNQcOTCTz2h8h5gsfrUu0wSMCKS+Y6OaFlFb9L9FEUOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248466; c=relaxed/simple;
	bh=VW+1netLSKhQaTgm9OLeU/ucpn/ddm2kFU4rfwnFmAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF/C13ejqVIjhB3upsgdzfZOKXTnbBfIihpmt3HkU2Fm76v42d3rBHNHm566VWg2Qqgb9N/SjPbeXVmDZwkhKBPkTouhZMs44+KndA460JncgjpkZZrcdoIAcsk7pesLsZ3NooKXcDZQd2sHYtTd+s2xYRV7Zkd6gGxOb0VhJCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrXJtdVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqFXewll; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39WjJ2475924
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Bk9sdgznjU+BVB3vMLKky6e
	a1c5xyuTD40o8R4uHrQ=; b=HrXJtdViv/saCAZUb4qyVI9lRZFG1T6VUd5jYFdE
	McDeP6YSNQIPf0STiZTlj8/rZlJa4/r+bOcCjfotmIgAeRFN0yNGZ5KEUNhW0X8Z
	P+1w/TG5EnKuPYY1jqCoF93G2lxQ+W5a3yg9udq3nxWCxxvIOAixQGTVmQ543ebV
	I2annhRWlcvILh1ypniJPqFvdfpHDtXx5MsoPA4NZAE6BFxTHyDsx3MfCA1JUEvh
	EWtvx4XG9f0Eo1uxDxYkyAPsExKafVUz5vvvyriMUpIOXKy7MgsgjHSjuUgWs6t9
	uTvTIQzts5v+Hjs6c55bq30BXybPYqic4WWI67zLMt2s/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5t0gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf9627010bso676632137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248462; x=1781853262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bk9sdgznjU+BVB3vMLKky6ea1c5xyuTD40o8R4uHrQ=;
        b=DqFXewllWG751QLcO4iOXEsh8+U7XLJZ0Ve/Dkg6POm8erN1Nt+svtCVaXXFCWOK5E
         AvcDsQnOIhF97M8halvNt4HTOMt33CwDRkr2A5BAa2O5rPpC+U9UmcwzpyVlukQmdSj6
         NuqRoLliYl/LvwQn6/I4jK1UA3cfgRbnQkDhVuKE2e+/wbOtWrSQ1i7DK8uwjIT0dsWD
         1Sbu9IPtC2efrEJ1wPw+ykN+YlkB5VU8TI5oVDA8XiNupL6aMumEwe2+XlPIhi9wPhxE
         6EbRTL9Fmff4v+bImcIYzeLT9Hq9gk6G9QQBblSwgMrquffFjgTnZXVW/2giEJ9daz0b
         45eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248462; x=1781853262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bk9sdgznjU+BVB3vMLKky6ea1c5xyuTD40o8R4uHrQ=;
        b=kvsjF0I97edLp/C6nmxWJMwhfHnHg6Y+EMu1cCF7YCx1Ic3myVlVlrkQHiZxgZh8Z2
         hjVL4z1ALbBOAOmXWbcjQWWYa6f0clMhgK9MFxiNYOQLJE87R29XKtXuJ6fIsOPFrvGw
         GcxsRjcYNIElzNlG67nRUtIhWnsQscVumz8ydVTBc+1SM0jvlvAtirceECb1pc6ntWwA
         AOTxAVK3kl6SigrVzZWGsgCVDo/VbIaifGD6fc0je0FIxW5Kh0gtPkWyF/0JKxfIkAQY
         2kLZtjUW7NVxY6p1f0NONBny5u+30A+fXQ4LtYHwJgoangSFPkIfvHRLPQ3DSh9pujXA
         E8Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9N4cC84bawCOiGdXMCiqdrKlN0yBQ270zmY9lSLBuRTvMw21TdRr1pRzrwCF0cwp266MxFVTPpzPYrELfM@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmW8blcFl/oX3YjO8XM92BLQijuqeraEOmoBfq8rU0dvp8ziE
	UXdGj3RRi9i/2qS0hcRCScMsuIda0GRVgQ0aF3jkZGa1adW9R0jZyFtahQ7IVtZnSvceR/BxLcg
	yrSrFQ2iCrHZ2CqXoAAofLAU2cGIMTA135Pppe1algRzBb7MdszwR3vaBMnl4qGKItKrp
X-Gm-Gg: Acq92OEKKUaK/iaCQicIFEycwvWMB6hqDYbQ7X6lt3hDQrZHSoncSCi7SV5cudm9x47
	Kr1HWiU6o9P0aMGrqPAkpXfOoUX0nebBbJkHn4OzQzqmVlbmE/XYQl4LeY4wDe6qZzS6Zsu7g1v
	H4sh1TIPQMdaeee8Ulw+u3uISzCI4JBMyPIC4ybN6zvUPF0FNJLDB6U8H/poKlLNGrJ+JR/LYL1
	dO1cTaq4mkgfwvxlcjs6dmf+DTarK0mJuudNYz8BPZ2qVzp3kb08/rk8aD5nxbfuoGrs24Cmrh8
	+71iuQ/V1mvpKaN1jy1cmCN1CHzriJ8qc24F4w5t4VROS7D+8N88sfykesbwKsCDY8GxOp7uS10
	+VoE3Pe3yr9d3YqJ2+dQcOl34qA10C7k2js1Jin3HSsUCRAVzkTw3LLaLfCpjmMqUZ9Cq4xRWU1
	ZYlaF384tsuV7EyH9g7w5fYEYGH36Q0qfBO1E=
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr832343137.2.1781248462408;
        Fri, 12 Jun 2026 00:14:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr832331137.2.1781248461928;
        Fri, 12 Jun 2026 00:14:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abdcsm3826591fa.13.2026.06.12.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:14:19 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:14:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Message-ID: <knl25r4g5xw5zkjat7e2kffdhrthgln3mcz3hlic5u35srfsep@stoetxcewzom>
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: amsXmuWw9PhlBUnqFT0LiOu9f_6TD5UQ
X-Proofpoint-GUID: amsXmuWw9PhlBUnqFT0LiOu9f_6TD5UQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NCBTYWx0ZWRfX1em0gdWyTuPo
 Dr8SHw5vzTGyuG+HHC0MpO/I1ypci1LIAN3aFUsHG1uKMT9DCouPBI2G9RDJzvDzmO1tmN2O1BU
 lw3GO4VahE2IY2NtjHk1YjBqEw1ICSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NCBTYWx0ZWRfX4ksNHHDf4Fnw
 87FwrRMkO7LdHpA/wiMK65kh8TTjGaCNI1qX7fJf+b6RnYOOsqm8YYQKSusc2HkrfTNjnMqDJLr
 k0opVMm7ImVG5LGx6gefHe+3LZbw5wsicEGUAXB9QoYSpGKG2TOY8qFpHU9qPbDD/Cjnm2LVu92
 YKhZdcmFd3v8jpiSXSA5cVjISB+kkNjYIUhOYunRpy41WNBvEwMkXKSEQravFGTKQy8JFaH+8tm
 a7/dXH8gC/i64ol/ec/C6HSx+q/mO3dzLaslv0ohy22BRM7Q/Vl8tBUsUMkJbhInjxbvosjZJKZ
 +p9fKrmPcwnn7wwKWHN25nolw+zBY9WwCx3DRDXSBRJAH7/o1AWMLzH6YzKvKsNsgqHFKhFmuXY
 S1cD630DJ500bWeDg6M2+PVduz7evPRcR8RYVf7BpoXYMPx4zRQGF4ONTTia9jt7FwwpYPvk6Er
 IQyn/mBrwbxAhki3XEg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bb1cf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jCeJVGeWWU-kfwvKBo8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112855-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,stoetxcewzom:mid];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25DB267722B

On Wed, Jun 10, 2026 at 10:28:27PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

