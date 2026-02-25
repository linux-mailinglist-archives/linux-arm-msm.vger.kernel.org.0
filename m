Return-Path: <linux-arm-msm+bounces-94077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJuDDlXUnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:52:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D879C19606D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A613038A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960B135028D;
	Wed, 25 Feb 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN6zPI5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRBqRp9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31C38F244
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016545; cv=none; b=FzqdDiaQq5+Jg+PM8uN099CdM0bLor2ZiX9egtXIt0ri0mJEnYXjmonjZoeA0V3OTNQOLXrQukg84OqQo5O+cGVXPspN9KDPXC5By0vP9PKgTmmY2QdOKk2OwMBYV8VbHeWn+02h497BecUyKq7hakRfMBAeOgPK0hP/YRCd1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016545; c=relaxed/simple;
	bh=0x4P34qOErC6LXj6XLgUAmcFhZUAMcQzK9an4ghv09k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgzogawqHLRW7QRGmnbAE2xYbXoOFwIumymH1mU98nU68kg6wGJ83cTedwUyG/mMaaG5v0G1RiL7Vd2NRjPjYnYnTcTHhUd8FnzfbLYB2f7HNAistjRYLkIdz37nykCLOdJgTk9npeerGBE1CQuXUiGCAECN4+Ye2Z+3ZzR/JEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VN6zPI5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRBqRp9a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9T1V71305760
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=; b=VN6zPI5IiCr+gGGL
	53BhooNHxkG3qdCFp60f048jASDrYH6JKOc5noRharURaTiFMZgu15lGXHYlPcix
	0006N4TLPzhix+q97aRgaliH9SsMWBgU2em5V4JQrbEqbJyvyEsowx3KYmOFnMzP
	uN/7umfbkPHGI79EGLtGDCfRhdk7TPJkWDIfCVktB6WajlnAZjmDNmf14hY2X219
	XNIPk1W9pUgRM6m5W7tESwYXTUfhqaqHsP0B9IJULt7sYujt57aRK2ATIT07BD0w
	tQ9BxkE0rIckETouBI/kktzFetAQBPiv2GRaeVJc9q89OiD6KD1wPJUITekaPmdR
	6Is1AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chemnua0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:49:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8960257db65so60125996d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772016542; x=1772621342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
        b=WRBqRp9azmIR8gCy21ey37tewMpigRVpwxviDXtIn9t7SraPXagjx03H6ohsPEb9rR
         9FULFShoxmyFLQmsheN+ZoS9pu8WuNr/KgxjBf9LzucwwPbEPN/uXtMyENiCMDrqg81v
         i468KnHtrDVDqlxzleo+lRmbRkJ43O6batD+z5T35EvocgNjXoocVimVIeNjCiFiyKjd
         BJZetb283GmQ1mp+fuAGkRV+d/TEoQF+Ho3N/N+FlOB6D7NCvmeiWj+cr9kGedcQSYig
         VttyCStYUE4K/4kxA+cB11h85jACCKn7i2rbmAe0nts1w3mOp7CaUwef8Jad75GRMVyy
         L2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016542; x=1772621342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
        b=MaL8FykIyfp0X7WrrIWis99382q0zTBPNOydVIWGy9kqU03FsqmRtR0vBY1Jsg5zpQ
         +k4RrnyLh4QgeJ7Ldxgl5+0EMvSmH6SvQgLp/e8bmPsDmd4wkxH4PLQUVYLNRaeD0gyJ
         IaAHVdD4Hq8fDX64QANjXHLuOsuQb8PkcmiPyLPqjK2172sGt07HSjHuquTFPiI9pKlD
         PDjfoenS7ddsB7/4AYM6FWBwkQ6042VYJj1lPuLbL+YBdfQN5F0SX1Qb77hBTgBpVaax
         vr0HxbJrAKiE+dDyiaeFXMSOFz3YZLRrFebLrKdYCKtM3Ca1IFXBqdUI3d29ztQyavlJ
         4CSQ==
X-Gm-Message-State: AOJu0YwsEGd0LyUCch5tChLdvXL+wN0f/18orYT85UcZKqrWp3mm5fR/
	jbPZqS0A+59N59Xp18woojMoU4uMmTqtn15h2M3ZNLFG+3vsO9WjkNtV/yS7PMjPW7owGxL2sEk
	upwGWaGmapRPvg21zNrAAQ1RpnQtVz9ps15E5Uh6CQVTC52X6vVUj0Gn1T6zsHXxGDIOw
X-Gm-Gg: ATEYQzy48kEdsF98RO5MBM0zbt18XIHaDjxMZBfrA/JxXfPzi/AwxYI2eIOuuxjGkrg
	KOkbdUR5z4km4800qDVKH7TU+NcCgaIeSyA0Vu2AEY9KxVJnkYRBcvGwGLgTZcCMJquWEH3iD51
	TSEY7eJSHzKdqY8+mWf6107kYjzCBRpD1Zpu5m291NV+1r+06lyziboG/7T1WbV8IuVGs+OiBae
	B4R5ftz/10HCxkN0cyTefHBpeQrm65P0ajpuBREOrwU6pjjOJi6xCEeS0dnmy7ZXTpLPwQop+8z
	4xCubWeaK4iO02uDShSXpZqzmt+RH9+ye9pvu8f4eGHW1gqObFTRdvt26yOavnTimruD5CgrUpQ
	HE231BL7d39UU//eoWVIzVON3CM+K0zypdegipmglqIHkp/NmAGj6rDcdao6QB2Ct64VOuKRVxx
	LWfyw=
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id 6a1803df08f44-899b986975fmr10482636d6.5.1772016541614;
        Wed, 25 Feb 2026 02:49:01 -0800 (PST)
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id 6a1803df08f44-899b986975fmr10482436d6.5.1772016541153;
        Wed, 25 Feb 2026 02:49:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90bdf80b04sm186150166b.3.2026.02.25.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 02:49:00 -0800 (PST)
Message-ID: <75113126-069b-4aa5-80c2-e9cfab9b032d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:48:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
        White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNiBTYWx0ZWRfXxhW8amIBg+9z
 MmZPdDEmT8oD4tMjmOfNo1uUcpHg7VGpjNfRJaBnz8UWYP67YQvAvwzx6OCLQ0je5L1XyVz55GH
 RRb2HEsTLCPrikEntDxtqOzN40oECV/Ee/TkQgwPgiABUvYhi2FDnZMutselhjtsoR+8+EWT1rH
 FIrYlp9jdo4aYl+//xihYI4/QHXMteS+a51QDcPr6DNJBJeQQwRpIbadcEXcfzCuOapcKzeJvlD
 K/UELtTknhXeX9MLlcglXmCqKKZaxWvvQXrzG9ZB06mfmJYP6E/n5cZCCX0tIokxSLKrva1IPRI
 2mI2+72UvdwAjQBWTCrh2KvMAijMJ401Jntt76NmuzegxlVH2MvNiKhRACZRSk/ijTsLRyaiEm3
 cKo/ilTA9qcSG1PzO8RebhddToa3QP7ofM/umk5tRTM+NpGkGa3fuMwTTILvrQwJepwDmNB6TJD
 KusUnpV0Zs2LLl9eDWg==
X-Proofpoint-ORIG-GUID: ybPwsojhGEKfWzz5XO5eEiX4ElzZD-v8
X-Authority-Analysis: v=2.4 cv=Ro7I7SmK c=1 sm=1 tr=0 ts=699ed39e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=mSDy6qZ-4McrUV2NBLIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ybPwsojhGEKfWzz5XO5eEiX4ElzZD-v8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D879C19606D
X-Rspamd-Action: no action

On 2/25/26 6:45 AM, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						mdss0_intf1_out: endpoint {

style: it's preferable to keep a new line between the last property and the
following subnode, i.e.:

port@1 {
	reg = <1>;

	mdss0_intf1_out: endpoint {
	...
}

> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mdss0_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
> +
>  					port@4 {
>  						reg = <4>;
>  						mdss0_intf4_out: endpoint {
> @@ -4791,6 +4806,195 @@ opp-810000000 {

[...]

> +				phy-names = "dsi";
> +
> +				phys = <&mdss0_dsi0_phy>;

property
property-names

in this order, please

[...]


> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sc8280xp-dsi-phy-5nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x27c>;

last entry: size=0x280, all instances, there's actually a register at +0x27c

[...]

> +				mdss0_dsi1_opp_table: opp-table {

You can reference the prior OPP table (and just call it dsi_opp_table)
since they're identical

Konrad

