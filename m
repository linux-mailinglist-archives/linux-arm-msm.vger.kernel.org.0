Return-Path: <linux-arm-msm+bounces-102857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFtAMKvJ22nzGgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:34:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C633E4D76
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C9B53015CB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 16:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05022E2286;
	Sun, 12 Apr 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IadS9seV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhI78cXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6B2BE03B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011686; cv=none; b=Boi53o5BWVLHjSdnXYKdDXyg26gHBM9qPjbcFnvDEkSi8EJdfEu9Fmp0b7atZAUS1FF5/AWCrrY9um7rbZBENMzoeKwIQ6Mj5rmt0Dr7ZnFRchkgelOVW+Si8kms98rqRl95IUxmTt1h17i6SnZLBFBd3rkOBr+oJ9n+IwEPpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011686; c=relaxed/simple;
	bh=sQQ1raFPnfYVub2aYK4hG7HPzM5CMPrNuWw/8Nr9hig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK7kGXvxx1ZDyablscJk+JNA9gX5Rv/Cz2HHf6ECfwYmxoUYQX2AqLk88MrZrQJTgeQFho5HOqZkjxUoidMrnWml+IseF4SQkQf5g1aA2mxl7MxKsHw7tMTQzwzBeMvQweGJ4JmdPHqxye8AQCZWs8l8Oi2G0u0o0vEfcC/XN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IadS9seV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhI78cXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4c9k3560421
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ookRjATknzpCpqleUHMhSAcK
	w7MrG8zOkEPy4ISAvEE=; b=IadS9seV/E1hVs/B7ADmqSiUjcRErys/DNBdmqyQ
	ff2CMVG0ERHm10cVPGoP2fjolS2tLYBew0G6Y/H5LC6GnlVbQ0u7DCQjMD5EqEtf
	6DFbUg6H5oS4eO1R7zzRDzIeS/eBtxJIrr60OY8gGMrpRCmrRI2imtseUQk0tw++
	7+rqHFT1e68meD8f6LKRts1lSDQCoy02XI3pn5buSeiZ56HDsAstI8ro/g0IRXZ5
	dLBjPUiPPNr6MngEzjntVk8Sy+Th3GW2JBl1nS/RvkzJj3WSV2gllv94c33zfqWJ
	KwvE2IexUCxCCY479DNa4yirfRrGEJdBqkedSEi+lOXV7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jn4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d84b5f73bso27483041cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776011682; x=1776616482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ookRjATknzpCpqleUHMhSAcKw7MrG8zOkEPy4ISAvEE=;
        b=KhI78cXm5hLHrLAPLAvHzaSeLomhr5frjQu272zzdV6FX9vRpqNy/ugl8VTHpFIeL2
         XMxTT3RLrY3oC/0WjcQsyOaEE7Ct15utjZSZdauVAHFoXtC4zi4OMuZdonHX2RF7qdaK
         ZXrY+Lmi8pnmudiuVkqvk3BFt7uD1tfJpE6SQpKYCco+B4BS1LPhRVKVyEG/VJNJ9LOM
         M3Sa+LvrIVNNsVmrd9LQcEKeNIaOCovqE0khAPDeCkEwma/0Ny4n+3dVUmPztdX06f0e
         T1jN58OTKXvaDGj6/3Lwyryt5xUzFUJJpSM4fXeMtqxeVZQaTOoI4FnIkIPslAEMEyID
         NZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011682; x=1776616482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ookRjATknzpCpqleUHMhSAcKw7MrG8zOkEPy4ISAvEE=;
        b=rzBh5BkCMBtPbLtI+dForqqmKQ2GZK9MoL23/wVGjnjbielfGUOjI92A+G5bhgd4IZ
         ctBO4akld2bcZMyj1MT8I8axtRLplk+jlYyZDS9tRdf4buh8M641RYNcZtH12TI6+1GD
         opuvDu8IND80Nq3i/yX6WGPOYr/KvK0nqdWSxfjxl1nijDeyvKadEZeGja6SVHCQBJAV
         MJwwSs+9SOo44Fy7cIhFEdYLFOCnquW+9Ifvz1VK5GEVrI7Rv1zRD8BN2ZydK80FIBl4
         SwX20Zq+DVj6e99K92OBIpv14uyM1aRqGfZm6jwN9np+MlsASFJvVy5dc2fVDuk8mV+N
         W33w==
X-Forwarded-Encrypted: i=1; AJvYcCVDsdBVBtaSdb7aPUO6h+QaFM6F093FJPeEAFtDJmR1Tam5x+6qr4/b/8nlsd5WZKj8d6Mb6S2rKYkFWqC0@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGmaLMyKVpdPW5hTElVm+irQBXbN0rmzFJ/FiV479m3SX3IfH
	7O9Gk+6jiULxDjRqpnkTAOvWnJGXYSJ3/vexs3Fcf1yK5qtlOo+Sj+pJKBi5zUnX3RccZFo4MgA
	0IhIP2BBYljpWYCu41tYvsbSV006S38gtVWPVTPInqVfpWdCmxE1JwJ8Gk8Zamn9enqcb
X-Gm-Gg: AeBDieuLy2XesF2sVVuWtJ3lWtPMlhHA7O2Mo6vqmK5q/HOzuwTJxZAERlTSSpete7s
	D34vI/qAbGocc6IkxHrYRDZ69lKsL7wSC8HX8/ItIQyUOj1ACa70GNxk7mQKf62C4CXHnkpKQ8M
	/jqWrFYmX5U07Jf0u9uRjWZF5q8UtY64ee5nWGYIbTh3ATsR0sjlrfuy84UUHRy/z4bXQhP4su8
	AhMjk/kI0JrBNYqeNh+w6amTXkFSEsJJRdx/w4RLQDZcY+x5NOvLqacixovUOUdvWK7xtJeHhSx
	ynofC9VcZrI3aTBea21WlpvdVkTjoeloOyoOQIxQgPT+Doi4xCi9uqy6r5JmOxMNMY0np9rSBcG
	x0YH8y93njAV9469LZYDsYD/fWY4eN+VUxXGWDIRXpzw1XtaWpUmJfkOD8aV32V8pq9fjtajhF8
	Bgon9Ob8lbljvIW+BTKYguZPjLJDZcVl5n3VE=
X-Received: by 2002:ac8:5d89:0:b0:509:238f:ad8f with SMTP id d75a77b69052e-50dd5b15971mr166679811cf.5.1776011682211;
        Sun, 12 Apr 2026 09:34:42 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:509:238f:ad8f with SMTP id d75a77b69052e-50dd5b15971mr166679551cf.5.1776011681831;
        Sun, 12 Apr 2026 09:34:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm18146301fa.41.2026.04.12.09.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:34:40 -0700 (PDT)
Date: Sun, 12 Apr 2026 19:34:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <geovajoi7srr6j37eeykvoa3vwntahqqon2lksis64jbgvtwkp@rj463lvtt5d3>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
 <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbc9a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=f2K6P6kOlr1hZ3AlffoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2MSBTYWx0ZWRfX3TZ6ymH3brKZ
 Mt2eNcHQ4v7zl4rfIoSVcSLBbiUwEo+cTTGb/imzafe1upjzJZi8qDEBptYMmKXyvDQFLp9XLcw
 0DBRznasvE0aZfD3NV2wcjUvmTkpDMO36bANTh2mkhRt71QcMMkd3DkLfNye3ymGFsQ3TNraqJ0
 MI2fuJZkyoZqUdldjXgZdiAO1Ir6rOASQkkTnbbQFZdqgG4RQIN95jFdk/WtYbRZmnV33Y1tv7X
 8+GIAAx3IdzzrFhoFvBdksPOaYX0GJ/KfH1oXYxDtluOppH2w+zM9AX9yDzzU9NeNk2In4P/u3y
 xp9HDZt6NTDNDrPFZUk2trHsr7olBnx5Jnk9AKETXUwa8Md7aidFMpnLsIQOEAdlNpsfNXvDMdF
 jySXQ2FyE3nmo5vMLzshewhlZAl+ysFt7kggdHhAdSt2JBFXdbEu8KXEIITSY9gdwnnH8G7GN82
 E5NEXuodtBU9qBUNbGg==
X-Proofpoint-ORIG-GUID: MVJdZwOK2jG-znnoJdDRr91hhbRrFeWW
X-Proofpoint-GUID: MVJdZwOK2jG-znnoJdDRr91hhbRrFeWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120161
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102857-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24C633E4D76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 03:42:44PM +0000, Alexander Koskovich wrote:
> Recognize the SM7750 SoC which is an Eliza SoC variant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

