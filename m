Return-Path: <linux-arm-msm+bounces-100352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELeHJFiexmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DC3467FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE4BF305E99E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C89A303C97;
	Fri, 27 Mar 2026 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEaJIrG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mxt3+9i0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA802C11D7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624209; cv=none; b=NpbEt1tmCv7SP26Z9FkP17B477Jzpd8s4QIKDPmIkojoQg/sbPCCInYc8X5N7o6BhIUsrfpY4t2jr7szWBHmw8tBBN0XVU8IzvdjU3XfY3hkqQBizdLZgvck/7ML5CWysiKUIw89taGMz4n0X8Thp3rS3tidpboMxY7JhW7Bv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624209; c=relaxed/simple;
	bh=5Y9TJJ7VC7jKty9WQXc0HoX3rML76lS1wV3BDQvb3a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYDeaM/mokSjevFo82C3nkAAPPiSSgVK6uIQTKxjNBsD7OTLeYLDYLNm1dPvnisLilYCqPZzYu2dTvoL5+3rxXFAyEOAveqzqqPL9r7O6Uzx1hAnmrZdp0OttI4iub88Zu+HHkJvs54PjSh1gehEWunJ8EY9/XLhA9DsPdCUSpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEaJIrG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mxt3+9i0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhDpG2558567
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhr1CXzyi2doW6X5jgohDydC
	UVzPecvU/LmdcLifDyU=; b=lEaJIrG/8MaB+VDEBh1p6wHDSHL+LNpgqqre+Kbl
	5/7lcp2rZIrlD0lhMhZrTEh72vHsti0jx/0fROrNwo6sMzS1YkY+Y4KihLo3bMGR
	Y8eX+lDnK4evaa1kNyI44kkY9l1Y5S95R/gh492F9PMyN4+pFv7EBUIBHbBCMd0R
	0WNsvGCqH+aD2i9OYOVuvrj2j+Hk8EGbE0vxVQRaiROcSKDv45Kxk/EB2uD9LcFr
	9HhXukOtK52bT3W4LlHOGnzedt7gu73uArljWTJffX7x9kSAGIwmoFfvx9QuaJp7
	1C/+fPTgYv+lNJwBNgVQshQfunx3Y1GLJpuy0Z2Mrc9reA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1c3sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:10:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950c363a61aso3212397241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624206; x=1775229006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhr1CXzyi2doW6X5jgohDydCUVzPecvU/LmdcLifDyU=;
        b=Mxt3+9i0tv5538YooMWgM79YmXjSfQ8JEi2QqSlwnSbq+VN5/FOHmxzGnQ77VwXRBV
         egDVPnTvy9EnyHdIr3wYSPWYxRxX04ea7kz3l6xqkzr5z8hMkGUnjzaGOBa4YM/zK9Tv
         MH4hlZNDokyTjZQ2TSbqlOEKNctaYA7sTLLEDSJXUwdC7tVusPg2kkp1hFyGCMPxBrLj
         t1yfuL8Hog2KnjE05GS0v/9t0xFXChQ3ErdGCYHatFR+9BvvOvfhjp9/ttaIZrWPiQ/O
         VZUQ9xcCEPUawt/L4dEDIIIr06BFooXTxeC/da4EjC8UqqNhB0bsbfQR0OfheOn96pfc
         0KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624206; x=1775229006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhr1CXzyi2doW6X5jgohDydCUVzPecvU/LmdcLifDyU=;
        b=n619oRTuy5JqzlllOkRhc1PHa4IQ6D4SmdvvocnBuYR1+4HlfqKqGVc6mnXA+Lm00z
         +OUy0is9vbvjh0gVko+hiYmRqeKdt8M33TYkrq8rsvr3jjpfq2VScplOH7utsuj6jmN6
         p0i2FyWSOwXuX8enCe+OSpwWa7w2zM2CPG5CCgYV3Px640s+kk1DH4hR+yCF7C6itjXm
         E65SUeaU2DWqol2rglpEEBq+io39+9shanqw4eSU+RkxWheoaB+368W1K6SW/j6WN5X1
         5Jq18qxj2u4uHy6K46jzh9T/P0uIHjr3CwEpcv5pjmOxccU5q/h6QOHZZTNKinaUoKyB
         Owhg==
X-Forwarded-Encrypted: i=1; AJvYcCW10bLySW1y10KSeCHa114kd+p5AbreLJnx0lZLruPqXu1acQVFjrGywKQdnT2fe7mel1EtSOeOH299EsvY@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXHerR+ZKoVuPaTbC+hP1GeAPZb/irLmYI+J7DDNdbK2zZVnw
	036xAgMGf1F/nHiJMkigvD7sCTyTmED+MNoubmKn3ApqX5sFDYUxvjwjJtmHTXwslWVR2JTNvzF
	TSUt0g+sJ6AfJJsiRGaUbdxGvnZ7tJhFmpXFhDNDg2dLwGB+AjVChmwNowxb7j5PuxY4f
X-Gm-Gg: ATEYQzzyeQa6HzhXSw/1of/Y4+7iOEL4YGt3tCr61G4HI/Qo3VEmOTGyL1vwNXIXcBs
	H4RYRnpwhOwBuAsnLIHwU/uYnaVUEHJctESuiQrKpg9vhBbVVTlYMg+tVA5V/nmLHV53ol5OHgM
	QtY5aMDWvHHY6nv/E54mzvgEu9k3UCd5f3APvkpOeqfQ0eSDX3w//MRDvid8MhoaqXg+cmBA4C0
	gVZ1M1tXkTOwUVCopb0H5zsQzkQU/gnPh9jqJFnVLKdTT3mL/PqdTwF9fcmUqkrl5Y08onGWhZM
	q0LjRuOBB8maCadYvaNFUSbhlx2Lb6230xlgZDyie/eZYUm7Srzu5OlctLHthDI+nyJdUo2S3kO
	s2psGRfxNpHRkflSP1XMezmdC3yXn9628Xg==
X-Received: by 2002:a05:6102:54a8:b0:5ff:a34:6ce8 with SMTP id ada2fe7eead31-604f9278ae9mr1289903137.20.1774624206351;
        Fri, 27 Mar 2026 08:10:06 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:5ff:a34:6ce8 with SMTP id ada2fe7eead31-604f9278ae9mr1289868137.20.1774624205756;
        Fri, 27 Mar 2026 08:10:05 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm16626365f8f.13.2026.03.27.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:10:04 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:10:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock
 always ON
Message-ID: <q63r4uurga4mxzdmnwt4adkqz5ohfz6wnszdaiklzg3rqbvjzh@fclk7fgpppol>
References: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNCBTYWx0ZWRfX6848EoAnBXjo
 KijJpqOB3ce1BEaSBauAJ6hCc54wngKqKMxfpdrgz0TjXO+xM7A9UCf8b8/YxZ2phIn8I88WbTv
 eQkWUhB+ykNVwJqq8VXL1Bn9A6RHVNn8pUkDKv4aKQeXcHiAjS/fA1P9Htlqrio83Y7nYXfYjon
 nnxKxC0KdsPQswvbk5/AslVFioMj/zuOiKWpW8U+L2hMIQBBbx0IrZxXoRlF9zTalVitrXCVBTx
 0mUDA9bR39DsrvpKFWEbZ3vL8frKkwUiprcOWMbsbwIuppvzP/ejK8hnPaABtQyFi1OYu8Oi768
 wC1Nqt2B2zS/WdkSLMar6UbQur1NyyXdqs080BCcCQIGneWuU//62HlzDir4fmSa793OomP+4hQ
 YrRSJV09GfRgmcDJ95PLXDLDz8RZ0LkVAEm2lGdOEemsyKUcEt5aYzH8JTYTfXZPD2ZxZ20PUQL
 5APDzlCvT5pq9AMAoBg==
X-Proofpoint-GUID: CM4simbunuCSXbmJKmWCe1uLhLuTA4Td
X-Proofpoint-ORIG-GUID: CM4simbunuCSXbmJKmWCe1uLhLuTA4Td
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c69dcf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=flGS2D7TJj4J6cRu0g0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100352-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E75DC3467FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 20:36:46, Jagadeesh Kona wrote:
> In Hamoa, SMMU invalidation requires the GCC_AGGRE_USB_NOC_AXI_CLK
> to be on for the USB QTB to be functional. This is currently
> explicitly enabled by the DWC3 glue driver, so an invalidation
> happening while the USB controller is suspended will fault.
> 
> Solve this by voting for the GCC MMU USB QTB clock.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

