Return-Path: <linux-arm-msm+bounces-108218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLdYN9ccC2qiDgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:06:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B956E4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7365C30CE41B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DF536493E;
	Mon, 18 May 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBt/rLnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZS45/0Mj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB63EFFD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112683; cv=none; b=YXeu7Tfo2/uK0QZbyxTHZ7CaGBoM2zWW9ij+KBRKFlS3iFewsrqyPaOVvMtKorwA57WFHTHRIAH7AggYWTcLtcFT+/IA++iRWUHedUQeQIRNNNFDxg7kR7DVIE7t96jR++HyebDXMKvCyVh/CKmcahEuqu0W2tP2QrylLYfg5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112683; c=relaxed/simple;
	bh=yfQr6oLUayQBBCZxtM7GuIaWrTQbBf8KpYeQggUmKhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVOv83N1hucUoShDZrR3Gwi3Za/oReZdsQLyRvwn20f3E6KOZ9C+AbiXlm8PYwRx4Go4EGFk9Ea0cwk/D06tvOHAbERNd8X10ipNAX6OP9V3+vlHqw2rsUTkEIEnCEQMzXhDhQRhU7SlPLBuQWEdAqHKEfXAKwtPvJXwQKrdhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBt/rLnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZS45/0Mj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICG10D2701134
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLXYm7cmK5lZVfqyqbHK14WV
	psNYg+y7RQD2MbOLis0=; b=gBt/rLnOEPVJ29Bonn9jZD/MFBmF8jPA2RGRpnIY
	0eT2sa55wpiniX0ZWKOR0ltWCK66MMfGy2drT7ImMyjL1tu1+zYqOU9i/lOeUyCt
	qqyLtZYt6pxhxbP2W2ypKVHrweJyKNgEFiwBOIn6QVks32L0wyjCtiT33eNm1vTY
	zHSX6O1Rm0gLZCWk2k0NT7dRWxYM6cpnf8Np3pL3Z2v+tFn/U6rOA203B6Avpwb5
	pG5+wuaraUuvLn4tAegWM596kCJ8DCTv2V0qS1Mbbgc0xLfX5M6lDZEiLm3DRP7a
	iKvK3X3CZhE0fJG7dBs1aT0HmB+yWvvMMVtbLf2CNlxi0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82megbxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:58:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514551d5f2aso106929511cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112680; x=1779717480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLXYm7cmK5lZVfqyqbHK14WVpsNYg+y7RQD2MbOLis0=;
        b=ZS45/0MjlUjwDnaQQXA8uvuyJ8ABjVwK3MrjYSrXuJEOn7K6RGaF9PKSNrR3a8Kpbj
         giMKXVzbucINC8kt69iQ4uv/o37wq4+3CogoQwDHm076e6yy+wOK+0lNOONyfMZObiyg
         VzpalCzlv8JUua0kSydr87h3hUYQbADFWEtvt0gn8J+Gh0uLf3Da3GLj0K8N9qaRT89u
         FzfyroJyIVbSaHt7nHjcnHF9GCmji2LFFK14gb+vLma3EgTOemPTN4WsK+qqVnX0Tr7I
         HqdbYBfmnhttqoTzNxwa6Ta7qCxxL+hoEmvuHfglOgcvly2BcGSwMAZy5kW2wm+JXx/t
         JYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112680; x=1779717480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLXYm7cmK5lZVfqyqbHK14WVpsNYg+y7RQD2MbOLis0=;
        b=X2FFwrzjRlypdJG/+v7DERAoyNVPrtMzvW0JASFSegDPafuT/3ucd8EB3k/fF6txGs
         bujU7nqSVmsM9BzJjjRB++pQVlpOVY2BrFtUez+n+wGAvY12KTZ6tjCROjcWrhnWsFP/
         UW1mTa5IucERva4QSANYcN1/emqah3DJB0coyH059Vwkn66mtYsPNU5nIobt6CG3kPzm
         BEeznylYbBQ3vtcUlUqL2WxhcZpWmtyyjmbNscF/lW5CNSEOGybDIJt//gds+XsScRKG
         I3evjDDIdY7Vq3UtrFCnQukUr320l+2OBhiqeasieRjbupRHkDxSgRGMrBds2CthU2Y4
         WYyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b+uey3vJlYOSaXKO+HdlVxdcPQdUyuJusK4iezV+XSWRP3YQaO4BKBg95D84KBzCRbpVPHfV5b0og0bvU@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdGGxfuINb3KFWwxbakAIBo3SUlZvZio0ai6BbWX3QjyAdISg
	u+gXI5rFlotRtAIei29z5W/SQs0/RTBRGoO36LH8BY00THvC3L7n70QFJKj6QzoY4pH6Vh7uN6h
	v/upihgB7HxLWuKuVBlbVV39m5oGka/oYr8d5mUi31BL6rClt+vJv7k/ngevm+lfvTEe3
X-Gm-Gg: Acq92OGR8WkxwkfHJ9meFZ5PsmJ1k4Y2c8i/e0qntaeBcls8aelDyz9MtS99cSjEPRX
	T/qqnyTZr9LRpvaSlIGbJfzk7w+Il6g9Qb9Fe6Hm7qGnvTgEJWi9Zy/IeakuT4GS8+ZQ1C4KKpG
	fHLT3C5nuMUFbQKgKXmTbstUCNCgHWFYhNIkY7bnEpf7g6cPSC/DGVUHt2IdJuz0M28O3qdrPrQ
	h1rh3BeabLB/IkmXXsFa+HQOj0mfh+jGUJnZJzT07AsnOgaZWl3XLH8zVIk61b+jc9b/aiDFZGM
	iKMfBjNOK4AKjrc4fSAUU3txWXL03LGaHKNz0vSssbUZNw0CRiBnJTP4s0qLOFm0+IzZvN0oW8s
	w+kxIioiwarvS3sCUqXAAI9e/G2CAUbX0BAN6R0C2gl1dR4lAAtfoarKihB7XGyZTamoUj4EJpu
	0YuxWCZz1t5gUI6WtzATPGfKeJThZxUszGjHEESEN1EBQ8Cg==
X-Received: by 2002:ac8:5c95:0:b0:50e:d330:f62d with SMTP id d75a77b69052e-5165a22aee1mr219638111cf.56.1779112680047;
        Mon, 18 May 2026 06:58:00 -0700 (PDT)
X-Received: by 2002:ac8:5c95:0:b0:50e:d330:f62d with SMTP id d75a77b69052e-5165a22aee1mr219637331cf.56.1779112679498;
        Mon, 18 May 2026 06:57:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm3341803e87.18.2026.05.18.06.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:57:58 -0700 (PDT)
Date: Mon, 18 May 2026 16:57:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b1ae8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4-prPhlKnIwNWIxOTkcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: d8OBbiotP9Kv7haU9BzhN9coTbqNpjVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNyBTYWx0ZWRfX9k6U5PmOflaU
 LN3VWHmH2kUhHMAwVNyik2XSIqVV4EymfKB54bfX0jgDcIoaxOwS4PkDc5YPqIhDnB10QZ2PKUe
 PU0NbDlsjHHIB3y+VJlrYTewVeojtgccWbqt5KRuIih69vEaeF1F68Nq9y2jUOeZaGQLRgsiOB4
 tOuo0zxO17HSISrKxC+tY5m4ve3MsHo85BhgxCNbYCJflVYzYtpSGbByejJtNL6nWIqr3N8NY55
 5+CmYi3awa1VpoKbPKAKfYD//7qrVUAZajmiECQRSseuDjgaLsW758Tpz/S49rvDj35LqG0hYqe
 mnOesXHIfLJ2EpUF4PsQPM92mekcCnrBAladz54wTJsb1oq7nD67YCp0q6aXginWiyQBNvk2URW
 VhtGt6xL/8vQMCG354a2/2efsk08NFLPMZDcl+JJKupdx5VjKpmPdlMzfxQKumOlTDDGKLteZ9B
 +WFU/9bOP4pL4xwfZXQ==
X-Proofpoint-ORIG-GUID: d8OBbiotP9Kv7haU9BzhN9coTbqNpjVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180137
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108218-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C96B956E4B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>  1 file changed, 322 insertions(+), 70 deletions(-)
> 

Overall it looks good. The major question (after looking at TODOs), do
we need a separate submode for USB+DP / TBT+DP?


-- 
With best wishes
Dmitry

