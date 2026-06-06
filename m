Return-Path: <linux-arm-msm+bounces-111500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fQ1MTQRJGpH2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:23:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8D64D64B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WBmeTuPI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YEgWHmFb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111500-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111500-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACA7A30093AC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B922D3976BE;
	Sat,  6 Jun 2026 12:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1BC378D8D
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748591; cv=none; b=dVe67tZkaX1/5VWjL7UERjxbs2xStMxpjwQjRENbcFQaMQzs5xmEGE5kzBrIesdJurtCgK3QyCIUqsd9ulEkpNNt1ZmAhqZkJ5FPFQB8XRA2im4Q5nfbLKrIe4MdCT7rSA9x3nT1Snl2NW65Qx47sOihLYd62Kvg1n8d1cIbrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748591; c=relaxed/simple;
	bh=IEDW3y4y/S1Dxq+eQ+GqKXMRpq4vjTkLsXm7j9tPZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV26G9e1IWpzC3TJGmscmmIaxMgXCi0kvSnGwjmRnv71JDuikYib6fVH61NtlThPq54773NnLMSwvFt+x8/DSzJbeVwuCJCo+bk88cfAAUmJYw3YE4yqQzZO8jwOBi2ur37sk3L1Mq3VgnBFfaQnU5eucMg9ju8NZYHjKky4Glo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBmeTuPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEgWHmFb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDl771279320
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CACWQZmD4R6XLQ6GUpqLrmsN
	jTowQtAT8WsqwDHWPdg=; b=WBmeTuPIOwbj+d1qhz3dLCw/DxKcDzYN36fVQCa7
	MzqzyPGZ5yNuJvDk5V7qEnXnGW0mtIM33IIH6w0A80MLFDoP2KoMDxG/l07B6D6n
	NH10gHN7+BCOTTtMiI/B85/yLHwOeAKr68Q4KZF4NmrZD0wS2fI/5uP01yVK6l/x
	xm+ijz0lWyd0LYGdJHgtH9sMH6KVCa04fgsRQeWGOsor9btSqR4eLuP8qYVA4opQ
	iMj7pKTJIeyS+LW9wR3Tn2awb6DgOJ7+I0/POtGuYVOQ9QNoMujVAUB3zV/rEn7F
	9WcInIola8DuFHFAuMWEQlDy5jt1WYnSwrJICXSxLS7wKA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagr9acb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6ce6f8465a9so3475565137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748589; x=1781353389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=YEgWHmFbsiYvmcaVblW0nLNoiPAap/c+AhLNFMxNKipzD13GwbEaKjRgPxKVso5gdO
         IERlC3xeWoZMv/u0i/DGraq4+GXMRQJfHSwfmXMDxD+5QRDnJ50riMXeuQIphZWNcSOh
         N5d8fK9DuuZK9Omlxqz5wESoQcU0NhViNqL57UVbF50j2oQI+0Cq7OKhlyVvt6iUYlSR
         lWcSFiKqD62pmiTuig8ouFySDc9HifSQbWbEdvSRPC6Nk4AHcHPNZVg7IWFY5BaobXgO
         NPkkrWL/nCJUU7aoke2oQTx8Zcv9gw6sRHUDwsE+aYm52f+i8aN2XauPzXOtl+stvvAA
         DPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748589; x=1781353389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=KvC+HZI4Er2H3uBHjjZIbTyrmU+gioxVWevUWPWhpI1Rot9yFkjmlrdE/YSziqgv0T
         X0ApZ/NJj8TOTYyuC6+Oc/McZTuFv4MVhiNzwkrxfNUQenI4HpyL3VgtRgWHq5aL/EbM
         kAF/bxwQpdaSkc16mUSe5J+2wte3ues8yFD29MLSF77E3D6/ZPOTLAQWGKF3ba2wPnyk
         LEw7SqFjkyIuYEZjkDncJe8Q1bIY4GtBcZptOuYtFW9hGStt98UbCTHX2MF8gPck0tC8
         TERURUNN/EMWyw8jE1GCrcnKdygaNY0tfq2Bo+N3ozY+H0GP+79+1qgfoVtkEboAjSsI
         evhw==
X-Forwarded-Encrypted: i=1; AFNElJ99BKtgA8z6eTqdTLYfjWfJGt2as6VLHB36DPFSusERmrCGzn2lbvizpgzj9FPrws1DhGm4Nk/vU7Tyf6Ja@vger.kernel.org
X-Gm-Message-State: AOJu0YykuF8vdkA34cBGBP63xLjFcZnGf9joJDn+toqK209X+MstAIKi
	LpRnrKtw2D+sE93q9Y/8wGR03h9wv9Q9Kwizh47+Cojw1kzJMWi1swnrLa/EUJugzHwQlNoGbPm
	QAqaTNTqJOw3wrY8GWkSQSNVusXshQ2MpiqKsFLYQez29kMxs1HHQrZJN/hjakUGvB9wu
X-Gm-Gg: Acq92OGrQHI4aR+rdLotyrwBhMF0EUWuMf/hXtXv66MfAYyd8pu/OXo+FErXTxClJh+
	IbNa6d95JtEqkY3Y/NlSJGNoO5KnJiAGmotgG7gNQ3RrU4Ntxop/akrC06QHBnrFu9L4VCHXwVn
	OllTEwLop5tjkFA3iVQuTS6Y65CHsaiwpohUZSsBTe5Pyo6D3Bc47JBjJYOCAgAQeo78DzblNnb
	NXGNzWV+4a0SEqrlryVhtlF8puhLmM4YOJFkNv1vQ0J0Y+2G+gHrKiLuD8Xwb87HY9rjq7N6WVv
	aqymziKtz60U7bUR5sBrs2gegm2vKjTY5d14RDekpKyqs++Pl4CLa4Bg7k4IllaVS3PihUf7Q81
	R0XgN9qcDK+20Uab1wUgtBKmrwQbtqI7sJdFqfqqc20kRY4NE4XqnjfpG8QDRv5VAifVxXO7gd6
	hlU+jHhfcHLvKD/KC2Nf36zGSaKtcjld6NDZX/im0uBPfHpg==
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974184137.22.1780748588658;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974174137.22.1780748588296;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm2444082e87.39.2026.06.06.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:23:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:23:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <fphua2bsw36libxqkrfubnaybvdtwncplddhexx26dtbjir7ov@jvmu4avug54z>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNCBTYWx0ZWRfX9Tny+xCvFj8o
 AQBhGR0dQFjwJPFqTAcJTVwC8eyThbgnSf+I+VCxNSM5yQNUm3LuOaIdiPJfSkEL2tYDcldcoKr
 eprl+iRu/wi8cRMvBC9OqNB2eywI7SRw8XxRD79le1d3Y3IVSKZiPdiLUTUsI+7Oo9c93I18LWc
 TzqxInY1vaOdUg12nBa/U9KeMDt/Gv1wIPe/zYpi02kobVNpwQgJRyrHe2Qq3lIy6LfZ9PT/71l
 U4OEDBDA46ePAAFdH4Jklf59bb9WZrYhz4nboi6l4NkF3l22ttJUqIqi8xeaVbQ+AD5y+RanhMg
 UfOz68Uvi5FvzRNfBSTFo2NjpcmpJoP2yBYIkLNrC/5NcJ1jybTd5wZmTXC9AYId3hRq6sYoDvw
 a0JhD7uTW5qJayKYWE8YCltJBi3vbqefj1zvF1ZF3i28+hjSMFhU50LxqrumnLzsYfERZCe4wjy
 IAnL6XLi30QfNYM7p9g==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a24112d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jtPkKwLRCkpF2dlEjY4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yqW-yEbjsyElmo7iFO0bn98I1Ybw6FZc
X-Proofpoint-GUID: yqW-yEbjsyElmo7iFO0bn98I1Ybw6FZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111500-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,jvmu4avug54z:mid,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BED8D64D64B

On Fri, Jun 05, 2026 at 03:48:51PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..ab2cfd6d6e3e 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -57,6 +57,10 @@ properties:
>            - const: qcom,eliza-dsi-ctrl
>            - const: qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - const: qcom,shikra-dsi-ctrl
> +          - const: qcom,qcm2290-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Wrong sort order, qcm2290 < sm8750

>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> index be6cd8adb3b6..e166a73651df 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> @@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dpu
> -
> +    oneOf:
> +      - const: qcom,qcm2290-dpu
> +      - items:
> +          - const: qcom,shikra-dpu
> +          - const: qcom,qcm2290-dpu
>    reg:
>      items:
>        - description: Address offset and size for mdp register set
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index bb09ecd1a5b4..ef21b2c263f2 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> @@ -12,13 +12,18 @@ maintainers:
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-mdss
> +    oneOf:
> +      - const: qcom,qcm2290-mdss
> +      - items:
> +          - const: qcom,shikra-mdss
> +          - const: qcom,qcm2290-mdss
>  
>    clocks:
>      items:
> @@ -52,7 +57,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu

Use contains:

>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +69,8 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        contains:
> +          const: qcom,qcm2290-dsi-ctrl
>  
>    "^phy@[0-9a-f]+$":
>      type: object
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

