Return-Path: <linux-arm-msm+bounces-94521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K9BL4P1oWkwxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:50:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F91BD171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22CD6300BE04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014F346AEED;
	Fri, 27 Feb 2026 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtWRKVCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9VDrrv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A3466B75
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221819; cv=none; b=ihWCFC346wT3aqzFoUgYAHyv41kjbbLhAydzolZW53Po+l4i/gg2ZnRY7tGxn1K61HpoBG49DlA1C7IWd/RNovYae9QXnUOtbeD+RGbt1UzavZJZcdp6dpxviooozKl1l6BtlIHgNzJLJ7TxA2SKAXBeQ8xPMnpnnaHVDXVtpNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221819; c=relaxed/simple;
	bh=71sNoWWbzCoTGL+MEvF6vyCI2I7lAD6LgpzlVkmixA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trF0raGwaQLsxexuah+E+iRxnf0MmFG+s+WrwQr9qcEhJ3FADWfR3uQ1FjZ5oTr4VCIIVXB2EO7fN4qvlYaAg6OMbsLKad8kIYU0wHY/2CrVFTEn+cQ1zwEnQ9IKIlt1nfofzjyyRf1MKjewDXqtI8vIx2ZlY0k8MQyZ8Vb3mwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtWRKVCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9VDrrv6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Gqm1912472
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wFIgtrXg0u1ChKpmRkH3FEKr
	gne5EbOmuAWq1Gc9o+E=; b=AtWRKVCKTV+6JoWMr4fBMWqVF+5R2P7ZfZhp3tj/
	B3Am2v062umAnRlCQryhJkynlNMFVWTUyXQEhajGXPEtad+iLvMLg3TgWSfKT7Dd
	u1rAzmn44MVucqHr5mGGmwC/n1D9Sd8ndapjHqoZRVXWOSCsMZVK6Wef2NtisWwX
	ZnEoHKqDTYwgr+9HRdPV6IE0JW9QHdE++dRA2bUIlDQfGLViHvZfrkFnadMThmZj
	4qhcXvw4WU65CIsl0NZJKIV7mm2M27YIn7vjE2NUwTZOFrMhGSrCkg3aptE1htAH
	sx8uMzDeILNpTK2/4ZaR3W+/FbYnSbTRWObtE+RUL6zLCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur4ctc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:50:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so1562786885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772221816; x=1772826616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFIgtrXg0u1ChKpmRkH3FEKrgne5EbOmuAWq1Gc9o+E=;
        b=a9VDrrv6sGAwNxni+F5vK/GMBfN8sgAR2LI7cTriS5rYqJV7eaZpoyPPbPy98+mbk6
         RbRZ5Q/nBXlv4HELcS6swi99DOtFlljepDNCKPSCHX7f4m79Q7oy9CapB5GlcxO2jMAS
         gezK6O1R5NXhl76dLpCAJUk/taYzA77qfHW/AKV+yHyT4UchzqASldCb46kklA+DvEXL
         u91MiGdSRyISrJe6AT7iB4XiRs/tbwAP9NUTlyX7fquH3dDcF8ouS3/KH+hv4xeIuYA0
         Ym/PiaWhxcCkfMjyAG5eJ07h+g2nFhbIpFJvcMJw6ue8aR+7QZ4lmCO00nb5oJvIrfUK
         icOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221816; x=1772826616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFIgtrXg0u1ChKpmRkH3FEKrgne5EbOmuAWq1Gc9o+E=;
        b=kQ3sGAhj728jYemD98nDi9upUpqGs4wC2ZILGiSaDcnrslK0vgD4jC2sMWOKOeXbLY
         FZmJ1GlJ/88Gw7ndaZORPt4UcvQizliR8+038cQuvHpNRFHV8hnclCOehqVoO3IXx8li
         1jmYAqYcdTSt/Rr58c11inSqSwPr9syN1cZk49ZR5D3Tim7YM7peUc7j1sA0Ula80S2k
         cmWS2x60fAX4pde6IJawGt2LoKbRDRTEDsowjasTK9UDvuBvdVEPFDkT/JRPAK72dcW5
         3bqw8GQAlhFnXvYzAg5JUENbvalOw8yopneuTC2V42ChJPYp73qgJBWKQ2SB4OCdtqpk
         6Ahw==
X-Forwarded-Encrypted: i=1; AJvYcCVw/sZNqazZ46jYk8/PXWc0e0xPWZ7LJddWIobg3v6GA1BwF/9e/qcb0kDr135IqpSi3bx3zLWCGFmyCkuy@vger.kernel.org
X-Gm-Message-State: AOJu0YwzH11tU757WrUJuQic675CNV/MgFEQlJMzv1E2iIfj8i8mTxgJ
	eNy8dt+p96v4pVnaIVWEh92frYNSPYoUsQ3kJAYxd7pM9RTHkl2LxjzxAd9SqFOpBoNDhTPwmy5
	riEBq443C3+PowNeSNEXyrT6WnYyLb48Z4YtbTAoqxQL2ImrMey3zQ2Ve0eLldsxOv3+X
X-Gm-Gg: ATEYQzzW3yOI+8hmaNP+2SS1g4qAJu/g83MgwVbmPR2wbDYKAEkcCuWMGBbeQGxuc2o
	ExEzFpumoab41ph6/xolXKgm4uEBMe0xHqbtJLt5x315i+vPDE/8b5qKk94u0pkQKcoTGMcAoWa
	STrZU+BS5TX8pPT6W1u+IJ0ZBfd5aNLwfiSgkvSjBfoOe4g8gIYKrrkM7F+sMc2f1GYy7wvjspR
	fbSwUPNyOesIjTn6OuFER58PiCl/QimfZcp+xzX7yFN/uQAdWEzOKPdYu3BM15p4Jcjlx4I5Gdd
	LpN28FRQ9xWx3pZj1Z1vBBjhkD2djs9n0VlrJw6O/1NIyJs0j8kZt9xAy2hUdIIzLXOxHtF5ZqM
	372cFa4HGXj+Kzbk4bx0SJWrQe3wVIObySIdBUDfl9S7L+xUggZpUPukvh3r5FmJEKmkzhEPFqj
	naWB7JG3sdkJk/x41jKg9wpPUi2VFMg9vYnTA=
X-Received: by 2002:a05:620a:1a1b:b0:8b2:1f50:ca52 with SMTP id af79cd13be357-8cbc8e0fa90mr459982685a.59.1772221815599;
        Fri, 27 Feb 2026 11:50:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8b2:1f50:ca52 with SMTP id af79cd13be357-8cbc8e0fa90mr459979085a.59.1772221815097;
        Fri, 27 Feb 2026 11:50:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115c33c37sm140397e87.82.2026.02.27.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:50:14 -0800 (PST)
Date: Fri, 27 Feb 2026 21:50:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] phy: qcom: qmp-usbc: Fix out-of-bounds array access in
 dp swing config
Message-ID: <xpcltytathu5qsqqxgaidwinid4lgrhddpqxfmmsqszswirxjk@45cvyiy7qnmb>
References: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
X-Proofpoint-GUID: qMwF8m2IHlxrJsw5lyRKtktnSmGy5wHa
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1f578 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=r_RmVpEsDzQWxBcQmW8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NCBTYWx0ZWRfXwBAw7rknq5OI
 1UA5GFYl8C0eBVn8WxqeOEa2urjGIvhiaiKyXkxaXCgwmbkLt7x7naPv8bUBz3IWhZBJIJWFa3s
 rZZTbUkMdVrqfGSrMG3L1Bj8WbK4FHHLn2XuMzim2J8w2x8m5XHre98i40UjyBBKpWG99lSPD+d
 A7Xhe5wXMsnw4dlQTbTnhVS00YeXwnebcHE1eR609LhuoVH0+tQpa/kkCZjrPtYXtdBJjmXUXYQ
 VglcISFKD97MKn1WsbzteGhCBRrlH/9mHpBIKaK/0h6ct6F6d4gK718U3/FT+kIlv35n+MLv6ws
 qbD4U5zYpjLY8DJk+0Q+a9kQJUFZhj99/U7J1a/JNbdhbFuHYKFc3omLY5qddFQz3sJc2odfEFK
 dlgyeRD8nwcsSjuPbUa/ZnYxfwrkvCK74SEn8ZBmnJsMEtca2ppk0mFjyyJmlJmab6XYH7jYiei
 +uy/efCk8voC1ob2iYg==
X-Proofpoint-ORIG-GUID: qMwF8m2IHlxrJsw5lyRKtktnSmGy5wHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94521-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D32F91BD171
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 08:15:01PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> swing_tbl and pre_emphasis_tbl are 4x4 arrays (valid indices 0-3), but
> the boundary check uses "> 4" instead of ">= 4", allowing index 4 to
> cause an out-of-bounds access.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support")
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

