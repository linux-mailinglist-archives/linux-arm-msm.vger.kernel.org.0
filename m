Return-Path: <linux-arm-msm+bounces-101997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIRwDgUK1Gk1qQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:31:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939F3A6A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1CA63022917
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F77396B78;
	Mon,  6 Apr 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlnFJ70t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbxG7CDU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2280322A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503873; cv=none; b=futoWgGvGcHGicZUui2mWHWEfzGBU0B7wjxHOb4EnXnEc+g9mgoDc8i5qQvjIGBaLS4R096QvVzz5bJ0qqiYtq7geBa0U/6osau4gvhclqiqT+R6cUF7w2c5AAFm181IZs6I8rBzIy7LQ07P431C2SpVsdxme8vhcpFIKnSEPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503873; c=relaxed/simple;
	bh=+K1I0gLk9D4lY4MWqXbRs/6gCZue4rSPha+hNOGkjCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEGv6Pm9rxyXg7O6mpyI6rrr+FMgapARuJkaPWH1WF1m4AoAOHvERB95QO7AuMNvbx0V2vuf6jOoBVFQJjhEkZmp2Rtkg5xdmxNoOLpiXGpPXxmr7wkBmIMLW5PgM5oQdE7WOh4NJeaYpcgmXkuKtEDfdklmqBmmKNhVq0t3XIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlnFJ70t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbxG7CDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IfppK1235390
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 19:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OUAuVjw6jEh5pPAasMROYRXs
	e/6RfPXa/nkfNBAA0nk=; b=OlnFJ70t71mGdOYa/puFjkdf8qip+O5zcH7ThoSg
	gJXAd4yXbzlxdjC6qKBnvhAcOdiW+wGv13YL6AXISmlMq+KYcpr/Fk7ZgghmPAYZ
	xKDXAbK/sMJR6R+nHCCi2047ceZWcMUnKVOyEjZHyULB9TE/PotJ25bk1Myk/Dlk
	dOUuZLeHNOduqPM/3u6eYXF9bT2mUGWSZ/J4T3D38hgdCWp8aZl83IyYkqrA5LHj
	J84pxhAx5vpoVPsp1EMebALJALXR8lY+zDpf3yK2Y/i2AmiD2SYee3j2/pEep41n
	eb5pXWyv1Ktt6aJ3UovGI8UIrFtZhReLfoaY8SxtsWW3zg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dceyxgxwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:31:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605664a1046so2435622137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503870; x=1776108670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUAuVjw6jEh5pPAasMROYRXse/6RfPXa/nkfNBAA0nk=;
        b=QbxG7CDUbbx2EtxUR8G9+Sjv/4RH4f8oNsfZshpm+wsrhw8pZrKxDvYk4UYmbtcw6m
         Y8C/G30nSbKUIYR692hLqXCCXe31WLvVv7dXX60S0obL1lINazEir3Arv0e8VQAH+8hA
         9IVHHulNWPILY4lgdsbCa/Cf7kgbWymvuCmcQmzPqrrgqGVdmgH9jYB37ZGEOpy8bwvk
         P+yyNZOTJMsxR5Ul0wZE9ZgZZTd51LVfCfIdofEXfIPVIADRzHNhrpEZXD0teRiYEMJh
         ev7s/Bafd+EQSrfafdb2bzadhNtHFILEXKdDOkkkovEg4UgElhW706bNImEE8aBva0VM
         buKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503870; x=1776108670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUAuVjw6jEh5pPAasMROYRXse/6RfPXa/nkfNBAA0nk=;
        b=YA2b+Esw0LFTXejkc5b5RLUSY6773eFPXxF16po/TWyZSIOoWKXBGey/8jRbFULZtT
         DrY4Qkgzg9bSKloVeNCrWUSdmxKh++Z0UK6fLjQXh/ePHDT53gYeQmu1edXDBl9AmZbU
         YRvKOOvVoWRaBf7YoYvdQLxV8gXD5i2M0VNz/P3KxrAWHJdv6VhuD9vpHUDdPyZxyhc2
         j2499+DGb9FW1T0qxl0s25jFrSygY2qyINn6M4P2/jh3gr+XtAEipQOYfl7RJelQeLW6
         FupvbH64s5p6LT+OsND0OC3PX0tu+HKNSSo7zod0iVTD2rM4YvmL2ay1eMf/noo+QebL
         sbcw==
X-Forwarded-Encrypted: i=1; AJvYcCU6w7tvVYMhN9ykYvzfGrtDpFdANa6QzdzXBMwfsf8pj6ljXqXVH4QaZnos6wf0GmgGI0ruRui+AZUv2V9v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XMkOfuIF+nnKUqTuaukbYIIynYx7jT7IkKtDgirmWZ2oRIyH
	33Zx+0t6ysSXEbHR+++z+RXUthqzG0ZjlXOBG6kWvYQXsYvbozaAuH49THVOzHV2OCaUx/X9SCo
	u/QetM2dAXITxP6txwJzvnuvkFzSGg2DVVNAchwNfqrttdBjZiVMTZBBDqDChBzLkM+UR
X-Gm-Gg: AeBDieurYRujgR2QmuNhcgL1pZ2BCAbUWudHGomB+uGDt9A/qYB1z6IdGjcEMOkS4OU
	fVO6b7cHyFazg8qRvUdY1G9xROb0ZkSUnPUuEc3brihKHfQ4DNsxhrklD2g1a4YEgJoQ5jwoZG7
	ElN1zOLeJ+dgLBSunGNCH4JrXw8HHhAhlybCte3uiU7n6qN2fo4591jiSpOuxlYBdnuM8otJvZF
	UQazBedFsJk+zZZXvNpwVlR2z0uHhZx5V7xEqXib7sxcxeIaxLna2mVPrw2u3HqvIfEvPpP+VpE
	fx7kMI0gkf2/hslKbFBlWsonS3Q6hSMSQHQ/RaQGDVvZm3h0MkHb0qrlfX2oMvRH2JFqmETBNyg
	qxI/VTf/13kkPp5igIFPlD11Hj5Vl4Xh4y48/gCh8PFAciI+yPOpCuAC1mdn6bB5Anyj14tsWfV
	mtq84rqZW6pCe7Mp2U9Wqh4xi7KxjAFC1FRM0=
X-Received: by 2002:a67:e718:0:b0:605:2df4:c5f7 with SMTP id ada2fe7eead31-605a4ed577emr5141683137.11.1775503869990;
        Mon, 06 Apr 2026 12:31:09 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:605:2df4:c5f7 with SMTP id ada2fe7eead31-605a4ed577emr5141671137.11.1775503869582;
        Mon, 06 Apr 2026 12:31:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c96asm32724171fa.40.2026.04.06.12.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:31:08 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: fix temp-alarm probe failure for
 PMH0104 on Glymur
Message-ID: <3n7grsucqh3k7cxfikytjatx7r6s3cxg4wpanm3wp6zn5ohamm@kuzz3xih6u7e>
References: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
X-Proofpoint-GUID: g1g_Bo-m3to_RuCgd5CBgn75HG9P-zZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfX4hajbeRE7t45
 WXsv9pL08KCGxAW7/kZw33vRZDo2OowbZoGbCXF+5QmCm2RSTwkbvapjolXHBknvU//oaJwfQlJ
 ahIchp0Iu8upBMXLcBDVfbJyzgY4GCFXHH731kt4mu1idGat5NpmtVgevAmb+2+MTO9TrniC1ib
 SkT+9/hUg2h8IoobsM4Zx5z7zqy870pDmeHoBnYfEgZuOQV9yR3fg0LK9ScM6sGjZxoVDoxwkCh
 ZpJuvdIqj+ISvPz3WYPF+e9yQ7TmF+gQdSCKe0AEYgqHU+t9yfAJ2T1aS/+lu0KcJHxC+xqFZRP
 SxlsoXPegkoA3xEPGlxWcJFFA3cI++H4AQI1HIXHfCYTIRs8yJDuoSk8LYZt3zA9mnu1F425vsA
 TF7hbbIUTxLtCAcbdbEc5OjTlcIq9q8wwdkNWl3fI0wAUxpMBKEXTD71dU1XePwMYW0ssUQqRTl
 9Qp5rcv3QJDQN1HfQCw==
X-Authority-Analysis: v=2.4 cv=PNsCOPqC c=1 sm=1 tr=0 ts=69d409ff cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QfO9YVjIzUkd18xYenoA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: g1g_Bo-m3to_RuCgd5CBgn75HG9P-zZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060191
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101997-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.8:email,0.0.0.9:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9939F3A6A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 07:05:55PM +0530, Kamal Wadhwa wrote:
> The temp-alarm driver probe is failing for the pmh0104 PMICs on glymur.
> 
> [    3.999713] spmi-temp-alarm c426000.spmi:pmic@8:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.015066] spmi-temp-alarm c426000.spmi:pmic@9:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.033908] spmi-temp-alarm c437000.spmi:pmic@b:temp-alarm@a00: error -ENODEV: failed to register sensor
> 
> This happens because thermal zone associated with the temp alarm was
> defined under the thermal zones parent node which had a typo (used `_` in
> place of `-`). Correct the typo to fix probe failure.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

