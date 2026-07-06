Return-Path: <linux-arm-msm+bounces-117061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yk3oFu8qTGrShAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:23:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1A715EFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:23:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cgSK9Zar;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZEqf2Jlf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117061-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117061-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0B03300728B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 22:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E90432BE3;
	Mon,  6 Jul 2026 22:23:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265F430CF7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 22:23:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376618; cv=none; b=HZi4WrT6FaWz8qde+hor8tqhq4TrUCMFl3av7PWxyXGv2lnKXjDPyUtn2+FpBAm4VHwDdEaZtAALpyukOSTWv5i3PYgyUlQ/pkaeF6C92h07GzLoN0/LgIiLQP7gH07gKxHKHfSzg20oGZE/5n9U80lUCw8yYX+Y4hbkXTQCt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376618; c=relaxed/simple;
	bh=an1W5Mo0/xOtBBJU+PkEQmauIy3QAIV1aElRv70z4cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uok6/+lcGP/HLeiv7CwN5Y1VsaAlMwcXtbrbDeAOx0Mjl6Yw1fbIQWrTrJs+NHxjYOjj8eiVMMCvAtLtLAT5xBXnnEMYl0TZoVIYLuGPUKJ8NGM0Up6OHf5G9WfMT+KIgNGgl3NFdImfXL5S7tw7RRrckppXgPut/tP2ULOd9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgSK9Zar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEqf2Jlf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEJLi1567205
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 22:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WaWa4MGfpSWu+L1vhHqpxj3K
	PWIdAgUllBsZqFOfmBc=; b=cgSK9ZaruPNrvWg45rTPSYJSJ8Dc3RHumZCRnjOK
	NWnu9BNkdVFvmhjtJE0lr2KMhV3K3FS2H3UWrrlOes/jZbpTWoVSK+7CQE+ZkEyB
	X9FuO7DgCt79QhhUiDI63AEYK6YH0y3ZIBhByuw8a1S/16ieeFh9DvJ5FmAnBbdX
	8NaX9xNzjALX25XL+rQWFDXRcOTnvPnOW+8h3NymVxY6mDYsgBxJ+8MpdOn1/mzZ
	yP7+iktuSg45691PNUAl7KPBHod6Ija6bHExpwZHYu5AcHFH/vMQBv1NQlXiWO+f
	bNKRCpazyauYqKT5BRdYbUg53iatMT0J1ArsC62QEY1oHw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7ksq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:23:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d2f02d2fso3569115137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783376608; x=1783981408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=ZEqf2JlfJioR7LYP/kbgj4AlWcHgkPlJ3gd2tqqwomOT1S+VxO99Nf2dKXhpUunYFM
         99GUrZXvhtnUvIabgjkjpevqLS9AiLxZD4I/FjXfccYKQ6RPW2fDn9dPcsoyQLsvMDaL
         Za9DPZ28sNl4zScEEUQdNDM4PUO2w2Ye31smgVS2g6g30/7O7C5agIw2ie28XfQJtPnA
         r37/UFfljxrvn8IHm2chVrMFzh7jmTWHTSs4BwVh4K4fPC8v8XI/SMf9ZjWYMw2pbJ7b
         Im1A38p/WhRvb6rIEThQrzut1LBukIH9YC9AVJvYIat9XfydR3pIgbiR5QFVjWcCkc+W
         FE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376608; x=1783981408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=YMRiafCG/PG/n2YE5Zr0ktbfmyBQ6vrjDOSZyuC6sS+2fcgkMQvrnc83tqI5I7qwms
         b2hRHKTP1XWWXGTkLiI+aS/qxf70OnVRULG3u68eJ4833iQRb0mEnNc1UdJSfce/l48U
         /DCYKGoL6xrFjHuTqcZrdJk10n71oMZrFIg4jIAuOoXLud5FVv8ugaXgkPn3yMTSCfpy
         XpM4/U3HQGzkmXric8HL1O0B4zbtxW6quAyQcop/6sMZYpPVATlrxy4r10JaEh39BxTb
         /zT60DFV4p3Gi+sxP8/WVjPfzqY2L4KH9tw2chZkkp+uJLdTFwSkYsEuASxABJtUchm3
         upQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf6EgawSGnDYdHVvExvxZzGIZNY/mDA37ScaETTtnupZ+/v/SFkEFqJmexooiRRj35IpKaRWXp0BITVpSS@vger.kernel.org
X-Gm-Message-State: AOJu0YxBjcfq7HnzMFD9ob/PQZXz54Hzdko3Iy4VbBzNiSUMdKAnNbu7
	I/K2AB6CYoSTdK70CRkSyMStkyoXyk/HgjnAyE7P0gilACaby7hx/Lo868y+BEyETR8qIHQw9w9
	Hq+IX+/dfYD/X+Iu7UxyXuyn+8ApUBJebSEy3/m4CMLc1KTq8IMQ4VVm2Rd7Q6EIk8u8H
X-Gm-Gg: AfdE7clwDPZztpMzO7kYBSJWtIKotnxl90d4Rw/EvFe/Ozex0Cb/nCwh6+pS59B3XQb
	mioeYzFrcxLLPZXM/jmpqW6J6k2FK8reQStS2eNSnDp6rqOp6e4fldW5bdUvnqSuHPOA39VRVuG
	gxtvd0O3/bR7eFBpMTTf2U48/TLCgU6J97WTv6mLxTf6V/JZOPNh22p6chp7xQmwOI7sk/UKRlA
	Ec1pzzL5SfdW+awtRjieWTzLfPWZVk6GpkXwrwE/SjIHw2RMCMXL4OLxRDiJGFPoJxZoF/q17Gv
	Ednhzfw/wEzB0qrauey+mgpTTPFDGAHyXe3xfadrHOsEQRCI+7T5i9kMc7+T/yy44+Iym8LA4RF
	6w3eXvn6BiMis+F01POdv9P9VG4K4HAztVq62k89gDixyUvudBFXWHgeyrRworGU04ZidwyMhR3
	p3FupvgonxfHGgeEMHRajrlOQW
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244224137.6.1783376608521;
        Mon, 06 Jul 2026 15:23:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244139137.6.1783376605954;
        Mon, 06 Jul 2026 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3177862e87.35.2026.07.06.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:23:24 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:23:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Message-ID: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfX7rvFejSLWbpY
 7nRC+j1Owmt8YcF/b/hlxOk5/qhLgTkVBpO6BpTabYrpP6MV5NXy1wW6QDOOkXYimXcPCytIJOH
 FtzxHt4TiKD+zFLkj2rYTVwU2I/cvkFAHgvxo5n4sihvnsq0juEWCk3pQ8CzdNXMgwPuOE6X7MR
 b4jEJ2fENKhI3MF4Ud5Y6XiDptgBWbOH4a7SK1ZHfpxqEkXJCyOwIIkMAOVIJIdHMuvL7zmBnDN
 70kV1ZQWOEHIA1RMd1Lr7ZbSzqSM4gjLxTQgBcYmAPIsnfw3/IvW12OXc9/HtQvXAKOWdAPaMMJ
 VWDcxZjKrHtsC3+HIMLHHvdoLKdMq1NR7RKyQEnfeM1JvdLEIkpaweodCa2XLXqcw2eQ35kRy9R
 GueU7CDYFY+DwI4osqz/5TUSmWLKVxqjUkRaBoAgLp6SPExp4RAL3lQTVyoDVDmhIGobfqDlX+i
 eE68R90sNTlwk+OKKOg==
X-Proofpoint-ORIG-GUID: PR2evKJhnGVQyPluq4E2Z2qGeF6_7Ugs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfX5XfXisVwzeCN
 tb+MACh+Lti+3YVt+bsMMM/KjrIvgh2DA6F0ScOAdf5029FHcx3+NkO3YTD8vmLPQIHEiTi1Ncr
 u1WBP8PtprIYCZYkHr2yXvZLHdjkHcE=
X-Proofpoint-GUID: PR2evKJhnGVQyPluq4E2Z2qGeF6_7Ugs
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c2ae1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117061-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,xrrcbfdkqkjo:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97D1A715EFD

On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index 1374afd9d14e..b280d8e845b1 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";

Should it be gen71700_zap.mbn?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

