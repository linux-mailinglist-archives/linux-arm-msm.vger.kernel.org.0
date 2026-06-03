Return-Path: <linux-arm-msm+bounces-111071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z6F9DW20IGrD6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:10:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8F63BC4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:10:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CyaQWLGn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P4aFDSn1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B25ED30571B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBD84DC533;
	Wed,  3 Jun 2026 23:06:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB234C0433
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:06:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527965; cv=none; b=AdyneX/XyPqHF2WNXdPrk4UxonIK4A8ZBcH3uLxS2TAlWYE/1fNK/Uya8Fw43qNGbLdWAvvbS2puL5bEhvP1pW6OkA2Y3kPkYe7BODZnA/8rOmhtP6jXFCWmM3VYqytV50Ip8kVUFyCba9YgUvUxl/1DutFASRAdg+uDE9ce/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527965; c=relaxed/simple;
	bh=DvqM6O+dyYTLZ01exqPhdqzx/bR/VnVcf6GbdXraF2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtOxYSgTT7g1SZDiYoKZBLU8PgwnvFASPH4qQyHTyq+g0ILrMNikM1rK4LEvyw7AQri/QbPxvZtBNrdVJ38iK8l2CoUp5j9aDjvWcgCpE+OTj9MdAj1NKSk4JEm2dbrd0oxpDUJQMZbPl+aQqtrQFzd6VZzzWmJX+fDEjW93SRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CyaQWLGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4aFDSn1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Leifm3240572
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=82ey+qtJsmPiYTMGfZ7xO3mJ
	zQh9v2P9f6+Hi1Den34=; b=CyaQWLGneLz8ABhqGM2q1pm5pPR0xVvspzioIiPY
	9JiO4kj1yR//gc9dsRZ49rychKicTdjrbCYdy0nfEJWEEo0rMlqfGfHYHoTmLJVF
	nKFUlY3dxyguXZVYwxKGTpryfmqaEXFoAg6lehvguV75ncruZRgfCS4RR9rC6Wza
	1XP/ChzNjImi72U7A7cWxSmgiLKwgrhPlbwk2wAbE2v7ZqS3CLDQD1U6JJn4x/K+
	u67Nf+R0jELRGKC52nTsdLQBLjI2hhziBIDrKhSJAUVAr4bfYe28Oda3wJfL1QC8
	SYGCS3Sf0cZH11Tiw0duHvxE4u9GMYXfzr914Rd0KyJ1qg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd087rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:06:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so46625137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527963; x=1781132763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82ey+qtJsmPiYTMGfZ7xO3mJzQh9v2P9f6+Hi1Den34=;
        b=P4aFDSn1Ys7DHhzSaCO/a77273iw/DOVA7xRlov8EG8iVT8nU2EHgbsHXnr3uSs7h8
         mjfc/pquBCEVZCjFdOTH4WkJftxvqATjBoCU936bL0zieOpWqWOTcvmZ47chHlOP1bWN
         JlU2pVtaU6TxXUupFDMykBFAkVos+89BYuhmnzN+Sg4GjTraJfSQxcU4GHA7MY+M77N1
         LrBVm3DA6k2svm4KC3in2sF3STZvJeHnaThLDkJfngGYSRK1akWbAGRCgh7umXRQy+hF
         a9UzZKHfTOzqU4VxysK5kYw8K8SRVL7ePbrs4Mng2FRT9c9+L2Jz7/hjC/+JK82seEyn
         1luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527963; x=1781132763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82ey+qtJsmPiYTMGfZ7xO3mJzQh9v2P9f6+Hi1Den34=;
        b=Um+30Zx8m23m3UD0PJfgMh8y07euhRMJiYN9AIWt+u449MdNrxeSTSZD/6oo+SqxkJ
         H+0/Lx+vPoDWkhkGY5cWL/ym5fKxiUKLDxTMypsnh1tpFMR318roNXqJKlfc1nlq6iBH
         yvtCJrNHiUf0x5GPcAZlD2m6P74/ycsRdCl7uXYVdyP8DOjrSIB369+vpFQ04P11iSz5
         AoryEoa6mtsmcjnV4+Vl3Vsd6Nk7gmQEar/dtixVpbeBVfmEPkn8aUMGRe4drFveNIHY
         /WjxQkmFswT6MiAz3E1k55Y90qyqukPrUChVqr+l1fMwHvg44nicvyTb5duYOHesGdEw
         ObwA==
X-Forwarded-Encrypted: i=1; AFNElJ/Dd1avHly5uhQhShVPI3snuRe1HLqSq6YH43z4qa06atFVYvq/Cdz1vsPUWve8jifkAvSwo/Q7gs9ptinz@vger.kernel.org
X-Gm-Message-State: AOJu0YwisaMs1nzuA12a8X6iEu5+ZXRy1UBK5SXfhTyQYj5Q5giiqe3x
	dxmG39rZDBE+b2OjS2M+rhNe7scY+Y4MOmfYx4fLZty4jUuopix0TaAv1XW5UbHq82BLlql7Vua
	HLIrtt41hw7bCIsXZYhwTY4LBPXCIRdk0EUYFrFmzfmO1rz3WI75qCR2i0Y9JG6YLJn2L
X-Gm-Gg: Acq92OFN70zqCwWzGBHrNdO1eXbkGb59aSXva8n23/FqbZxqCjYBJQpuQIBK1bDTrom
	pwhHeu86nhI0oArk0l+M6n6qTNM0Xn0kL0Ezsku8Stp3T66TLNplYAk6kcINjzeLukmgNbvHXpr
	yAIlh95N0aGaf2ibGFbO5bKqSTX2MtO6vUParIxo3kp5A1TVaWn7X6/pfCaXLFSl3JxNp9VBukx
	Yx7GNtHQblFZhCJtGcvX8yh1Lo7FhmPs/NfXw4cKe0eRMReiqXViwGJh7/j48Jgbx+mFoTf69gG
	xzLrnWzHChCUAmjqhycET8faSKqb/wV9Ty0jpw+JjUPcghDSF54hzr1FGFysNrzalaO39JT6hHj
	vRx8kEQkNeescbxCVjPecVNarx1ClbaEy+bhPix1A59LXAo//jQnCvU307r02BUykY8D4GzXP+w
	9qK8v9S2DnM1Dhb3tAgM8xd2kWlS2yA+9ODwOtqNAbkBUaVg==
X-Received: by 2002:a05:6102:4421:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6ec15aa0d76mr3238956137.0.1780527962921;
        Wed, 03 Jun 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4421:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6ec15aa0d76mr3238943137.0.1780527962506;
        Wed, 03 Jun 2026 16:06:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07b66asm12801841fa.11.2026.06.03.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:06:00 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Message-ID: <zawxi6n4dfpjltpz73ciipkhui2qpo7xop3pctufazukpbea6a@5zxauixsyunj>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
 <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
X-Proofpoint-GUID: wTKD2RvGiqMp8R27z4LI4iwy0qSgtofL
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a20b35b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=K3YF90I9_K2rrUiFlBAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: wTKD2RvGiqMp8R27z4LI4iwy0qSgtofL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNSBTYWx0ZWRfX7oB+TLg6MmUx
 zPexFW6dLu+JfJ1qwY+AVP3myveC8keuaOxtUwIPGd2J71K5ytW03fwsU2R2jsfuT8mk9LHtb/P
 4gwXVpfyhakVj4tXumcVcuzTOaNKAGSWG8NdijlGuenieIK1zctXyPcPCiEXCa8nIG8JJU3aQd6
 eyPA5VTd40FDG1GIbaDFwQmpmlLzehiPNHwkPOuQ6ygai5VzMvdkl8KHAVkbZMTt8itVbZGHoIC
 PLlmkuhtBowmHmhJxRaFpoF25bzJE9jsdf3N7CQIGKQMauOE1O53kLCf2ZFMQynjyeMFgegVxUF
 +8v1dqi5qfdgT/xD/IcxEJluYCsE2CGAZG204L/fT2zkSpMIumdo3hk2WRmtr1p9bFI9CDCWaPX
 xdhyehl+Pbeial2tKflLASNgO4IllI6OHzZYaX+kLsXj6FFwYR4lPjG/vX7fVhxgsDAXq5SXv+G
 Lroa7yidYBx+NsgGXgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111071-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,5zxauixsyunj:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83F8F63BC4C

On Wed, Jun 03, 2026 at 06:48:22PM +0300, Erikas Bitovtas wrote:
> Add device tree for Sony Xperia M2 (sony-eagle) smartphone
> based on the Qualcomm MSM8926 SoC.
> 
> Initial features:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Magnetometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - USB/Charger
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
>  2 files changed, 404 insertions(+)
> 
> +/ {
> +	model = "Sony Xperia M2";
> +	compatible = "sony,eagle", "qcom,msm8926", "qcom,msm8226";
> +	chassis = "handset";

chassis-type

WIth that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +


-- 
With best wishes
Dmitry

