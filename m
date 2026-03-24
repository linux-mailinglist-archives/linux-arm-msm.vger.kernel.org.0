Return-Path: <linux-arm-msm+bounces-99710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMsaKre9wmlflQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:37:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6793191A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C9F2306874F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419DF38756B;
	Tue, 24 Mar 2026 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqCY2NKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8dCy1PX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B072355F4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369850; cv=none; b=hf0AcmIpLB3r+EAeMX5CSPOsb1Lp00HHGqDDAjmTP/oYZSAvugzkf6B33ASn3xnkBjrC/kar2pIDolGW6rgO5emhnueUzBz5JqpkMGhBeyVPQLABFA1zz+H2wMpuuv8if7SHa/DKKEUvXC6Oh+4gFEuuvo7UKCAck81ZUl02qbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369850; c=relaxed/simple;
	bh=CULxo/gDTB8XGUt6p9aAxOcLZGPLwy/zLwkql1jD2gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erwk+utiKO1kd1ieyUOJ9dpWPv4m+Q0ao9edvYfb3Sb3FXQU2LchzRUlIUNKV3ZWAtLXi8j0u0Pj6pz44JJRWD9vGmtq6509RqcvMBu7wjq5vtxkDNM4C2vuXr1cFzlu/wvV9QIYXjufQ+SEfNOvbyITv2VK7lpmaKHbutQ+RfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqCY2NKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8dCy1PX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBarhM1291256
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y5NJUYdtBmfzETbQtHkB1dh2
	zk3LqAbCqpHCY/q1gHs=; b=LqCY2NKe+5zyH1YbxAtksWK7EKax5PG6A+O3YW8H
	QTsfzXs7Sylews7P1HIBkDrmc2R9yG3AA8kL4rVgBx/GrAhYdkvGBWvWVS0C1KGa
	UaK6XyO+wDdeEqoYeM+qQlnfDlinEN22MPNNx3FbWSQ6tdwwirRwGAkf+oCJ2GK8
	j1f02arzJGDDgoKszLpQkYFbjbhS/iFQ0AJedWCFrjM4D7CzZ7yf9m5DdqO+jyoZ
	c1yHlpL9scVPtaoxTi5ezYktkAcbLzqRCZdzRxYUqepekUWginNGrYkkZZw+mL9i
	CpQ41TH8tj72pyBomSZJQYniLv4B0nSd0G3fEthdjP6QRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw417y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:30:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso88367991cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369847; x=1774974647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5NJUYdtBmfzETbQtHkB1dh2zk3LqAbCqpHCY/q1gHs=;
        b=X8dCy1PXt57/7pS4c4+TGjPqLbCI1XhdYwWhP9cJN7w2XFEkiCHjRceMWpfyH/UFgE
         zKc7ea6vb7L7zyiEpMAu5wuPxRrlbFcbGCF+eQmFnvfGeRdKc4tAOjM5ZKojEHGlvzHS
         5YzDRIUrHVy0kQiEiP4Tg+9WHyp5upsQIND0eE62YgCZSRi5ChL59sIcSr1FtanviWj/
         ZL+CM/9TlQKE7QDNseHmHQqFb9v1uyLYireE4YGDvUoRIC/Mo//yNLcw/sww7vaJqbrB
         g5NfymmD+V5oDQZ0gliAAk5ksIc7Zy/bKsQQBebep7pmB5GjNPrLVmUEvhaAYq6lDfUU
         fDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369847; x=1774974647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5NJUYdtBmfzETbQtHkB1dh2zk3LqAbCqpHCY/q1gHs=;
        b=S9gg52wuhpjUbBOFTL14n9xN8wtHKxPwhceZ6e1LoMwgYFz+jC1QE5mw75ye6dNG+p
         1Py92Sz3M6etKnaLeXZetKvwve9EpYi2+ct53kdPtJMlIPAQEmlKcQGx22c2vEBurNCL
         fb+1upLq11W18mp7WenHcVBG6sfxlYzZ7OO22vPG/2v0/u7T77719uEMIzxRNWen+2hj
         T3gEiU8XweMKMczJeItTNP44RtDtYmymbw04x6tVXZXiQIraqBqJDFl5ukeQacv4BrBD
         jCwBxbrK3KYzqyxfTY81zSBQDyTqiVTYJ00QgEYLp7d1JRqY7V3g3uXe6WXiJadBPVc9
         SE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr7cRFfA5qjS6IkveTc//ZYlhuZCPj57Umyiq7ryWClK3FPhFmJnsPttRGvSp5lzGZsGlUzkGy7QoNDDI6@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKaxXSiuiiC5GhV8Wpk0RNlyTjbi+B/x9ZOie0yMUL2E8nUKk
	/Eqk17ErBEsWeyL41nwXJMeqJzwhwgnbAw68m+f6ZiQ/qeIi2qlBfURExtxV1oNiVY5ERdUWZ51
	2ukQMfW3cmUHVM0osF+MEkoPME12Oo9dLSHh7ycwVKLpfImV2Xfg8vwBq++2LfQfYwUCR
X-Gm-Gg: ATEYQzyOPf0P9NGdP30F1yTHXVNXoK+Xy6gRP2YGd2lTn7sw2lgyLAshuG8uj5KUJsU
	wIEmYzNy4bek+09R7DzaHxPqAWxOv2I9r7YnssciiIXceMaJQumzVUQLDkERWoVQkCx0uszbza6
	W5WRnX8Mvhc3PyJ5ZWq9tkDoXXC/p08tM7zymS1ryU+EBL990j826m/OuMme5Zbzdni+kdPJ+Cq
	xa/Km+pNckidPT1CjoG5zppVDc+mdmwSK3/1SeT/7r2Yl4/kSQScuk/OTWNSxp7BnRkdFUzmCTp
	kvXsgk3tTU47SIX8Dd+qIKQLyRUHZhs1KYDuI5IPuDy84brilkmX+aRzp3hxKABpL+R3OwD+Cd4
	JR9T35S/6QkbkRZHM2MqZmfjOJP9sdHVwWA==
X-Received: by 2002:a05:622a:4109:b0:509:61:b22 with SMTP id d75a77b69052e-50b80e8cc5emr3728831cf.57.1774369847256;
        Tue, 24 Mar 2026 09:30:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4109:b0:509:61:b22 with SMTP id d75a77b69052e-50b80e8cc5emr3724311cf.57.1774369844400;
        Tue, 24 Mar 2026 09:30:44 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b87f80976sm1206728f8f.4.2026.03.24.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:30:42 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:30:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org,
        angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org,
        neil.armstrong@linaro.org, festevam@gmail.com, Frank.Li@nxp.com,
        danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: glymur: Fix deprecated cpu
 compatibles
Message-ID: <cavflftjyzqiiajds73slhq3qucwmv43rdg7uqgwhan7yujuxn@hoy7kbgqwz5b>
References: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
 <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX6Dy0+P578/+Z
 NawBhEvdOR1KFcD6VJaNbt3/9KAeoP/MybiBwW5gbRfZavQHx1H7IxI8+hIrwIRkZx1zcQ/bJj3
 rh5XkEaFJ0ub45lgyytO5pZM1woOI1gBJGUeMaPpqK2PaHOtBijprm65vuyu3S9SF86IBvG8AaG
 kfUBaPGCNaSllubDmXCsiHlJYM7N44hm6Z1HzIesY38RyHh05Z5Cf8k5/0AnOupLSGWV0BcsSHp
 mM5thiQMtnJewCQadM4WPZoLTI7ifM2Wpeokpvd+7y6EgPnq+17YjZkJ1HJtvgcpwfyejJVYGuL
 OEaORBNoLJ3KtjsINtS7vHWlOEIZ7PMjICjcaagYnFsAZ/Lh11Vhl+0TxnCQW3YTjw1Cl+AYWNc
 +28AlcHJI+4nQkzQYRGc3a+boG6Ol14XHUH61//qkJlHevlgN97zmOJvEzOIx9/ZZoxxDnzGKNl
 z/LVtKpyAFpMcS0pnzg==
X-Proofpoint-GUID: lv42p8cun_ntKFODP_rV7qbz-hE1PP9O
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c2bc38 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ElVf3PSpgwV20Ma6fAUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lv42p8cun_ntKFODP_rV7qbz-hE1PP9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99710-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C6793191A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-13 16:04:39, Sibi Sankar wrote:
> The generic Qualcomm Oryon CPU compatible used by the Glymur
> SoC is deprecated and incorrect since it uses a single compatible
> to describe two different core variants. It is now replaced with
> two different core-specific compatibles based on MIDR part and
> variant number.
> 
> CPUS 0-5:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x2
> 
> CPUS 6-17:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x1
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

