Return-Path: <linux-arm-msm+bounces-93054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKx0FtMalGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE160149381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 853823020A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFA923C4F3;
	Tue, 17 Feb 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxXzaQnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kU0Tv/DT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BD261B78
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313845; cv=none; b=QACa7c55aQmby1deQET3O+aiCb3V/XGJkQdKNngQbsKUHmZ9LNnXrZOnw9aNlDhCT6Rl+ybG6N9EmaclOB5RvRUmQyVgmu2jATS/q9C+crd40MPedLCdk1fmbk5+CwgHZXeEFoMJV8SqSgUau+wn2vs8raOGmXNm8Uj52oEDoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313845; c=relaxed/simple;
	bh=5ymOAA/qX+6v/E57hzw88s4Ajr+oAMkZohNiy9JVhZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR2kLARICoahvxu4snqCsYgZkQg2tQ4rw5EiAOxn46X+jQEaU4VrnZxh/Ppj4X6srtHoGD9h0h/s6joLUnsJ5Ms2PjrMumzm1K9WFYY37h6We/lHNuum4NVRCCmvGZXdO5+b0kkd6dBOP3DTHyGOLgMWc1EAestxfpE5xXpRt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxXzaQnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kU0Tv/DT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7lqT300833
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o7NIcT1Nl7BtalJetdwfHe6L
	kIdG75IZF8wDqN6G36E=; b=dxXzaQnlZRuyoSTepdhuy4lXDErSuQGkxStfb0G2
	EKllEczgyahk8p5zLZ3rY+zWADFhPIREp7X6xLWWs81BQs06lxCPfpR2ndij1Ctw
	cx16oNWJhavAkDAiqS20z5YghwyTdUFgZ+JOJhcBt5Awkpv3bZAFocyw0zJhcf8K
	SHPq16vqgi+h8rgiK/qDfQF52qG3lvrr6BYFmD6LLS8e1sbTWSN4qy9a5p9eix90
	NwCgdZoI2lZJ+T5Xh5k7I8dour0JheYLvwgd5/NO+OWIYRDz24k+H9ZxChxJfmcm
	5Y+jBDydAG4dY/LDtCitae4eK/HRGcEhvbOrhILrkPAewA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9kn2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so2613310885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313843; x=1771918643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=kU0Tv/DTsf9wC4Fdo2wmmjaW9BFSoHZM1SheX7ZCs4dnBUZjqzmOe88ElOuEaKlFyE
         fV3qr5rl5bcgKPYuq1InywiHhaIWY11T1ythB79LCoZon2WwmtleRoCUWhvrG+L+tsvZ
         tNe3Rr9lq50K876Z9BieNKF4mczJUK6ajoxA0vZ9k6e1p6NlrK8/Cw4uodg40t0hFMmG
         Q9jmgzEJEqMw5JDqMtQmkWJBFdMu6izNLYHgMhHUA+OBIP19W9407Faq0yAZXENkfI2c
         uJByJSYW8AsdwHrsOYOeaOg34GXtv7z6vZWd6k3uLkNDdSojJ8IbD/WFmpeKTSqA9vaJ
         +Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313843; x=1771918643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=u3A6C+qZKKZBoVnygwoHvFdbkkWulrKIkvRjQnJN4YJ4yqsd1jn4x+MeZA5QYKrela
         mAYvt92jbSB+f7nsszn3TaylDLrvZPnfLCdYhLnNX7Rn6U8Y1WjffTaPeTedEMdWjsQr
         Gn1YqlcYhCnu2VwE7XPgG1PZCFGpXM0ojoUHEo2l0ognsfQxpgeJdq2vPlPilvIyPEcF
         wlrnQSMujbjVVRQla64caadY466lE3qRAn+hEPd5DA9oA3bx84myspD+mC0OX7Ir/ltd
         j292+8pPu/Kci3M5Ej8+Q3/QJHS6q3DXdmUTKfo8VmNhthZ5LRTFV+2euUzfbdp5is5c
         c8QA==
X-Forwarded-Encrypted: i=1; AJvYcCViZF7bg+jJI2WzCcWkUIYg18AKMLCop+4ooNoc5fEFcT8naSc3HQRtX842yMqiV/j+RsZggXBEgZm0Ati5@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBq7sFM3Iih4XToKJlrlcTqPvt7nBQy5mI0s0xpzX87wW558A
	j9MrP20Mx5zdyAOnNR+QWW1NxALDX9fpaZGO1MLWIUp9X9rvrDi/8v9ROo3uhT7dwT1tEOuefk8
	DTlYN86Y0M++jcRHjHaZ9hzjW5iSr9ROEPE82Jep5Ty4aV+DGi/WX47MIbtQ5t0eZnYlJ
X-Gm-Gg: AZuq6aJ9Pq/k7fMZ11+NuQ5bLh3tMhRtvm4/Wa3zk8fb6XpYEnmfTdzC7jrxjo6J5oB
	9Kjg0EsULSRuYlEySpU9jMAsjLpyVooQPKCbJJbT7h8K88Tief8cH347mYBeIds8ec4g+Aru3z9
	bvDLgDZhqDQVU3aFXu6xicHrvdR4ljjd9Nr9N80ttnxxwLWnoNBp3ji6o/ZCJs1s6Sjpk66OYss
	NzS2C0uo8nMmyJQzAd0/Za2WExiyfYvnlx14rLn00AM2sjO0JMJoFoo/sFyjEM+k5EHOiMoFApY
	xDplTGsr8i9W/wWmHeiOeuLzUhfbxO0jqbzzFYdV0NFNWSvzzh45qSkbnLKa7KKxUN5fe/vnE46
	h72RNSe/bcJbqfb2CyKBicdUkHv4sYtLW5J+OakiShg7qcDVC+QKjmWppmy2qpMFB1U+Unu+qHw
	2YZvjqBYT6FkGoHpkBSnjAEt+MWfCaV75J3ys=
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309053185a.27.1771313842584;
        Mon, 16 Feb 2026 23:37:22 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309051885a.27.1771313841945;
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm3688319e87.0.2026.02.16.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Message-ID: <oudixl456f3lzu75npcincr3idh6itkbmltd4ypu4ry5ncyxe4@epuii2b5wl2z>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
X-Proofpoint-ORIG-GUID: GfcICrJjs7rEZZ24A8NPm5PlIbR2G3zJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX+iG+PnsjECDO
 /K0/7+GfMvAiD40EBgVarLTPsiSiK8D0OBdsKHOJ9s2VtE2dVcuA8FG4o/hyqHgHM6x/t4KTSBR
 GypADWnLg4tliOTM5LoBrmcw+Mou3+Xj/l0ofqtVCSqbpjIOBWvnM68RQ1ezs0tBu6yIhL9+mRI
 MvEHwJzZLx+5B4ZN6got7emxYUTFM0AW80NWVKAnjMMZGqZa6j40k+28RNNg6Oaz/j7NljXlhBN
 KUIbxcRsQYhsuHcPJEWK+jrnLhZBS/XiOV9KQvIpfQ8TfsSlGbnPGAPJ+d0L8CI0F3mopD5wWIX
 WrmqOSI0dhbcvxC91djPh4slec/dzgTkIZsonYNWhpTKWfcDBkB2e8ewY1QNYbckYL27CirqaHb
 X1WilalST934C2MOF+ynVCsCPaMY4iUnZInwdux3DcIqOnu/UiSQbd4CtLiJM1grknmF7/gyZx0
 GFB+pZzZyb5vF3aJIuw==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69941ab3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NzzAIdn2IQfWdxSLNSIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GfcICrJjs7rEZZ24A8NPm5PlIbR2G3zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93054-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE160149381
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:22PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

