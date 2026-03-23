Return-Path: <linux-arm-msm+bounces-99259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDwrBzs9wWk9RwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:16:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86B2F2A73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FCC300B138
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A686C388E40;
	Mon, 23 Mar 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA6rNZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HS/gpfeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8912F2910
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271229; cv=none; b=cVjVTJilgfA9LcNHeDhMovt5VAnXSiKl758GbY17JNboaSE/hXUcrzrWBAVF28/jSeLQ/H4A73D5bh3kbCcV2XhIXtTGXxSDk5Lfa52NBt7HavjDpNBsZ7Da5oAGL+j/rptXRCRDVestxtV691mDpGt4j8onjxmqG7Gd21mT0Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271229; c=relaxed/simple;
	bh=TAF2ljkTXiglz3efmjh6vr50tf+tfSJMYlApalKamNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgSIZuhlXMjmFrQmv4sE5ap0DeSV/md2iikdvAvGPD77mz1AVTE3vqvdnH0fSxh5evpykagihEDeLJiwALQ6Kum8Ok8q/nCDOcwABa8Mlj9nGWlX7QSmiOmAObxmYoGwuUVT1TcCW825jLsvfXt4ETsX6nK49F42CsFB3wEiURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA6rNZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HS/gpfeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ND6VqI1627050
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=; b=jA6rNZgHe1Wb3GaZ
	FmNAHX7DNv3zuu/hR4XfyvT/JUmJpn1VfwYnaH5Jnia/gWQR/UyAAVrWUizgql/w
	Aed5a7AAQ285z6/VYZNfmdjSWFaZ3yjRdXnjdBIkBBia7m5HEyJdFECsJwXmYY8y
	N3O7ofY8ybEEMwLnhlz8Rywx7ICNR1tTcaW8ODO2prZZeF9qQ7X9VG62CLOfs8La
	De8Rqp6lOliK+XDxgZpHO4YcfIq1Hnns7iRTtVN469sQRWpCj8u8jJvEFOcRi73b
	SwPUnLWiawiZ6u4x3ljACcsjJBdE4Ed74Bmo8/X3rubH3M9yg/wh+PjVmRWjbt0L
	6ztxuw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc12ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:07:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d008f57f3so170568e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271226; x=1774876026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=HS/gpfeMF8kQfimsvR5YIoQ4cxQxqEoX3ahIBEfSfc6Ln4I2A6DkugPmVJsJ0TQgDi
         WhreYzu8cQ6t2M84K1SXtPIiTUVROFePD+gC0DXhYX/TGtBnli1uYJe0vO0MXs2ViHjw
         VE6JmtT3+7iD6dgswUch4PAP5kkfpnfRPXIMbyiByA0C203TW7QK2r9Okt/OcAAnk1vK
         GVYkTnOPpsrDogA5i2nWP6rk5N/3vXio9k/dpQkcyfXe/PG/4LcBnDI9zWb2Rajtx7oi
         B4gqcDxdp0a+vgJHH/7SddQdryYap0AD6M6V9mxepwtIMh0+C1RuGL5NsFbFy58ZGbP/
         w8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271226; x=1774876026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=JeSz+wgxJfoXQb+4rd1ixxkcELL1Q2gxBEkama2LMT+vwuG6AIcAobXaa1xUW2ONKW
         tnCu1kWAMrdXEe0QX5TKB6mrqHGB20K8MOOaziWFlW2l9qoYAo/RTwek/ZKDyOkx8jsl
         mwXZHsdAuBs85g2HEZJvYRjR1gf8lGIz7Qg3wKDUbayKJ1Qy0RaAPCPWQjU+PxsKKe1F
         udcQwExyirl3WlzBZWvv5eZ6N2F1TsYAgosgq0W5jagq7k0yJ+LQM7sToek4BKoxwrXU
         5QfBigk3YP9tWaDoqW8DmMnnK1L1omXuHDdILGWx/kWNMt3b8uIKVD3JsL5ZQRqUZ3hE
         JA5w==
X-Forwarded-Encrypted: i=1; AJvYcCVRsEyI/fny4wsg93i/uSRmTZKh+y2M/8mIgue1ja5n7um/uot18p/V3/Yx8MhrV+Gtyo467qeHzgvjcOeL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9c8sZWXMkd6SDZOfb1xZymNkmNvMrPi41mrt/PMWbWjfSP0oS
	rj1gQK8OzgoYXv1Dlk3/kc3XQ7dO8kETjsOWs1FqNdMJEL6bM+DkEmYxn3uRMFmlr8+0zFC6ncM
	BA4nZZSbtMDddqB9R8ZAt2zIXv+a/sopOQm98mjp4uhKNt7WsamrW4NxzmofJJSJ6i69T
X-Gm-Gg: ATEYQzzL/E36RDDMPRmXfS12XjR2N2QalJn53m5PQry7+JSGwks6XMdpVQZSaCpCNmZ
	ONgib6H4AMRK2Jv5rkcXdZSe1pisEJih9trnQe0+JsXMS23nVYb6c4AR++ZocJklbxLkxCvsKIw
	tbdx1I0IoPDf8mudcnqhyMvlk+BC9GuL9IXOKcukb6EI9XDFkme0RJ70HYp//s8KGcptE042S7Q
	niD2GCN0eX0QyZLWOfwrISQhMvYVmShJL3ypf/aPEoqdOJW6hrDSRVWjeeRDF6aVWBecyOkS8Yf
	Dpcz6XZ4RjF5CYt8TMTsVmenbYwLOqQpNDAfW2x49pICNfloJ5xg1tG8V29zxsbOJrRMJG8T7GY
	FnIpO6bcxM4fBx+FZ+UgS1yBhY8vvMR/F+76U8mvMg78s+XUyMzLYhakQRyoH2Xt8odXtunw/RF
	iDb9A=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292507e0c.3.1774271226533;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292474e0c.3.1774271226008;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d238edb7sm3897292a12.23.2026.03.23.06.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:07:04 -0700 (PDT)
Message-ID: <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:07:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13afb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OGlg79zl3ubmKLUECRcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 108UPQgjuW1eAMM7ue_yikrXvhhoz1vn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMSBTYWx0ZWRfX2mhPuUR9GSvl
 4y0eFCkaI2HoR2Gzy5vn1skqOXhTuQvSyt8FgAkRn6ip5QO0OjSEbP5ecwYOKMOyxHJoXRzUarU
 MfRExU/j1nxS30eFtqR6PgXBCh40hxrQdlFYwsAWHdy8tHDcJUtY+bt9o050Og0Q5a4Y5uLdPZW
 +XlkMQ1KGWyzramRJPdu7KZfmvoRHt/OQtTrL80aZhl70LDbPY2qtDdTNMngPWzDT6R4juKyHPN
 GMrdHsaIHBGTlfKDthGMqG83PMSTd0/6Hokjv3uEO4FnxRLKu+xyjPEHLU97Bh7ZGOxAVLbOsvA
 9LUjLVfLVtnIlqdMGS3a8OsZeN/+oxKajC83pdVktWQmAMuGrq4RpOGVHnLk2RJT67alAiW8eBG
 wlCWa434ri4VmIG3C9XbaVtbQLSCjAN4WbK6jfAqAj1Ec4nGXgY528FpNjwLF2KuwPNfMShPChc
 d96as2fiXwnjiG/IK5A==
X-Proofpoint-ORIG-GUID: 108UPQgjuW1eAMM7ue_yikrXvhhoz1vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-99259-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E86B2F2A73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 1:08 PM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So add the power domain.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

