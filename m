Return-Path: <linux-arm-msm+bounces-94356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEqwA8zhoGk4nwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:14:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DA1B12B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E61930191A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 00:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5671F239B;
	Fri, 27 Feb 2026 00:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBt0A/9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNINaB7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE31E1C02
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151199; cv=none; b=pDhD6nS2Ir2iJseChjjwYWkx+vaAJS6FKVJH+STK4Iz+iuwGsQqv+G1VFMF8qPIVr23BBjcNeY7qYHGKVMzWy9p1CAc7OiGqFV/vNKG1VN9uRjvoiG442kcKbdlkJpuwXY5ILBr1F18BZ9boauF1HST7IpE/m8/xewcSv/PklzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151199; c=relaxed/simple;
	bh=QR9boxoQsSEhcKFpW3lzAtEmOL/uK19/mo6bTy05qxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuExztP6ppAM7zeWCgL8iZlc0J3hkc5fAcYug98F7RAgtmJbuHkCph0p94Q2EZd4cnd5q3UjzR96t641yIDHYglfjpR6yLEutAKkasqC3f+PdKEH2DhoDJbUWckoJOMcaBV18Hp58bXy0K08Eh9o6bnkBs4KtJUa/NhSKLimUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBt0A/9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNINaB7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMaa3D3279964
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nhY684CpTqumo3wHY+UC3CL
	/opjCSEWq+dQgfleplw=; b=mBt0A/9XbeoINQ8fCT0zC9FAb999XskWmVwuTASd
	Ax9Mx5YVClJKdeCXxzNK7TtpBEEYkgKuj98FSLNGsJGbxscN+NcV50C7hlWiHRrM
	EA3TB12xjb5VbMfbyxF5GC52wAqWNQCVUQIJQuDUh0y/50nwCnciwIu0DyHV0oCK
	sWF5ip23zzElBw34aCuVYx4KrKslvNXKx/WOxiTmaYXTaPjvbzOBlyryu9afLEoF
	rIH/nkJxKe6d/7VfrmCaWhDVTuEVi2ExZnPkF75zEoI/ED8JObswVbYp59b3KLpV
	4zHvOa/n3NXkI9Dn2zzdb1ZaCXf4Nrn/dbgP73SkYujkxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur0xhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1748434885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772151197; x=1772755997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nhY684CpTqumo3wHY+UC3CL/opjCSEWq+dQgfleplw=;
        b=UNINaB7whzMufZJhzfom/AqMZ5DEuzFRHyoIU/d+++gkddt8i6eIoT13N0tNfHJEiP
         lTE/Oraj7gElrFz34BzrWeN6X4Rxk/3lOzcD0VGVEFmw6q+W5E9BidH8i2LIFqX5Sc/V
         jS/2+CAWgrh5RPpy1/DSTuHx+uStdZv6af9qABZk7hgyQ1feyLl9jZH8pkjQ0w0mIEbf
         btflwaCQ1D4tZLQfrgd37cg+zei667Pp0DNdDxPfF+RXoyfpog+1Y5CEKBzWqQcLlwo5
         gJyOjh+jLSkuj3FXffvpiovvtwb+ECECBmL7s5O8qyb/qh46wuJd7GKabT0QvWbeePaT
         m59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772151197; x=1772755997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nhY684CpTqumo3wHY+UC3CL/opjCSEWq+dQgfleplw=;
        b=lGrHHIPR/4PJAS0ARBjZHnNnhD4swlFqEDemqN3t59s1wphd78swE0wTVPzDIlsBCy
         pXJgi9IZL6xOBssrZxFXd27zhcYVqt+zL0NhBlsJYupYiWB8YAdNYWONOZ17P3xCpnVL
         vFkqqFDDMkxQnOcsd6RxF7ZEooL/jcCV+KhX97SaIxW15cPI8YPfnVw/irPDJLAEIy/R
         h7G6GndodZgJAFNUSNmA8BjqLMEZiDeA/+7Muu9LE+EIpfESD1sD1SEu/EmtL9BWluux
         Y0bFN/0dfTcKNuE2om6dfg6pM0k6kzhtZCFW0UdNHBt0O0h3/F01XAbMXu2nm3dEZG/d
         Kwpw==
X-Forwarded-Encrypted: i=1; AJvYcCU5itnfwfl4afYyKBlp00oRtP1U4szjHh1gs/ChRkIS/c/wKU5n2zqI/2w+huZtksmJ5DYxY1Vxu1LWvMNr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFThWu/7JsvzyFp5AoEFm1zHcz5pjYv53wTNc3FO4N+rcpSy2p
	P4HNqDg8G8swqI2YS643dHZC0fJ+/35lnd2ddey8JIF2vzP/ZZxLfHjpXYfSy/HkaboMDXOhSnj
	f4bhhPcnpMnfkQT2tkvHa4J53PSosPRate4vv0Bg5DFQfFx/5IUMRLx+cchvDSYf7y7F8
X-Gm-Gg: ATEYQzxtLo8ZasVm09SMRfhiFWQSZ/nHcG3JQ9P7IEhsFmhFTt8jhRnEe5LMguyJJTq
	KnOxotG/3kJMbtjMAWT3jbi+P75ajYGawBGa1Ai93LbMp3Pg3EgW7c8JxF0u6CX6A4VMqRZ0cfN
	2VTot5f+6lvD+tNqFxFp6sJV++FWbaxJku6XWQAvdndzxpRhPCQkn9GODksnnrw/Qnj3pl4opAy
	vrEJxsdi+WS0S/w4nsYqKLApXikuIcyBHIwmVGVtI0Q6Hlhi1iJPTmgteGp/nI6uAXiKpObtrVg
	Pqp244ZJtnsKPnm1OvuqfwsvA1K7ToMXBv842IhuQc0vSqPytPUXSh8nYg9bNHdXaqFq6v/utYj
	jsno4deJ+sONoONlVzo0qYihJeogPU+qWsKzU7dNlJEINv29GQUWWn0guVEAsBjZb4oR6FmbueH
	8U4HsWZWbSSaLxQnbrmWkNjIzAZeKouA0hMZU=
X-Received: by 2002:a05:620a:4892:b0:8cb:50d6:18bf with SMTP id af79cd13be357-8cbc8d6efe5mr127339185a.4.1772151196997;
        Thu, 26 Feb 2026 16:13:16 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8cb:50d6:18bf with SMTP id af79cd13be357-8cbc8d6efe5mr127336585a.4.1772151196579;
        Thu, 26 Feb 2026 16:13:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a31bb52sm1407652e87.65.2026.02.26.16.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:13:15 -0800 (PST)
Date: Fri, 27 Feb 2026 02:13:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 10/13] clk: qcom: smd-rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <5hzzusf34opx3mk5fxvbj4qnnwtjdmqkxkypsouum6pxrm54h2@tokjr753fi72>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
X-Proofpoint-GUID: VsFf37P7W2GGFUVKDr0RAMUWHQ65sZqz
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a0e19d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwMCBTYWx0ZWRfX/ou9TqIMXlv7
 WiVo02WSXDUkBB+Nf+j/DVMwQ0eEH6V1kNIL8zoYhchq4HN8fm6wtcu/Rlf/87WO/Sa2yUgmIHo
 4grmHKOrGXqbAY6EO6d4TYkspn11nU0vsjMDcb6SCBNKbgqnvoPmDGVvdv2wZK3wBTQd+PlhqtX
 DBl/NfgMvo0jRSKCRTA33bkq69OWGHIlXy+dImaDzW86QzcXVMK/tn/vBzpvpD12ibaQEfIa1OO
 OLijYL/nayDhLvgj+qmcwL16E0ImGQ593PxkNgeJ8kI4sWxFlJ2+K/YWErcoKg7P3v06ErNSBmH
 vJNViT7djqHU19myhh92dovPrMNLXj/UMVO4lX/GKXJZKKdJmYnw4ZnD35+S9NQdzpclpNFefUt
 MwlCn638WxOn5ok4co9TIHfwUzH1JmCULE5R+tZxClv0w+qN5KKd2kYFv6OcKWNhYel+XEW6WF8
 GnlPDYTDfGw9Bqtxiow==
X-Proofpoint-ORIG-GUID: VsFf37P7W2GGFUVKDr0RAMUWHQ65sZqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94356-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 635DA1B12B9
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:16:54PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

