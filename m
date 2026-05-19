Return-Path: <linux-arm-msm+bounces-108319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OdYEDv4C2r1SgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:42:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B91577839
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27EB43022798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21C033F5BE;
	Tue, 19 May 2026 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7ya6lOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zv158bbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E3342514
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169334; cv=none; b=BWBYCIq2X3U09xPPMlZWBLC+baVGHxTR68GI7Rb+ff8nOdYsmJ+4+29tVdvgij/p0hG93CZoig0P1a8BttlO4OFULtPCrf8qvrW54udpY9buab/g1vw6KuWcyhp/gm/EZ9p1Dbg0jyR2LkFwj+6XNKGTHL3susbM9ULmn2SVV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169334; c=relaxed/simple;
	bh=mhrCdxChMDhgWAFmMENxO/e4VJvigUl6IXPQgg0NzXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzjeS43/Jbyf8d+G1Rxu8nLPA1We2nrjevSE0vFm+FBX0768Frp6O6tv8Xrua1NpqitfQwZg5rLX5k+ZTsMx3ZxbFw7jyBGLrj3HslcwyIf6ibbJWtEc45hKdvBJXKFuh7L/6RFr9QtUqwCM6g9xOo83sdI0F/0zMz500fOFd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7ya6lOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv158bbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IKTZ552438007
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JX0XOqExg1ihyFZghsG8Hspr
	FOqaGOW6mXNGniz8yLo=; b=C7ya6lOmK9ZAhXkm9zkhGbwtO/SVrezgOwuUwSqr
	85HrocrK045GtKIwNcYaq/nD57C9h6W0I1pgNxlZwhAblrqQ32/d6gUEtIQ/3oyO
	86y0sv7/Y2gy95VD5EPjRudajR5da9XtIisJXLabF1mLoL8ljqp1cE3Eii1UvX1N
	70ZUnI86bzTCom+f28MVbAeuCa4v0zE9SxoeSvB4V0c0Kv7yTACGlDINhx0f1vL0
	hjmWwUIN00n++YAROG+SHomchvgrKGkHhq8n82P9q56xCvO/SJarmyF4MZX/OT/n
	rN+gjJH1kxhZB6PeLdZkVAcoJ++AOVmgzUqfMnQaBPBVeg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v39py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:42:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-130aab78a09so3291219c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169332; x=1779774132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JX0XOqExg1ihyFZghsG8HsprFOqaGOW6mXNGniz8yLo=;
        b=Zv158bbu4UO8aIvSbidfsdGDTUg/sna3xwEXYt6xrvmOGJWynpbZKEir6KjuCf9m75
         sH1YlbvkpIV2w1UYGF8ztTIhLvyGfP9uWw3BJ6O6bu70QY9zFE6HUxuDYAGeucWzRW/n
         J/ZqN40h0l74jvTDYlQILkUtpTPDeZZ3Ri9dyuKzhsNb+kW1lMGjyF/TyPKsZ8ucaYUo
         v7/nB3NoNzFxL8q+woOSZxDpUMwLjMvW+dFHYD3s/fc0NbzxIZPMGI5AhvvW+DBLNtS5
         pPp5lHNbHlWaeh/GrSBy8XtJZT4wzcsSPLcCdV0xKoVsky0hG9QCLVmbQBvKQl8xqero
         Y8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169332; x=1779774132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JX0XOqExg1ihyFZghsG8HsprFOqaGOW6mXNGniz8yLo=;
        b=RFCgsESALu9AddPBTGUeJ5dnoa/ANfnYa1xWWB2F3nXo+IeRNbQTgOaPXXwm1h//20
         Z8gV33xq/WlYX6azFRW6+CJcbbk7mSSXkVPkG2GvwWj2BcuO7l0l12UVADIhRG1yOMNS
         OGrqDUgsdoqPnH6D2Egi+D0R0jmpOebbrE2ZC/dobmfjtVvMjvlqQSscK34jT84kWQEZ
         LusUvTNV8cJ+rqh3sIxNHR/a7x2adgMTh8dKEk4d/JlS+QjiBKtbXbc8MrWCrqxDgnNZ
         xUMO9RfOEjPRvD0nOCpWjX7/hn/B2bRTE4fY3aH/SkW0IBfXLrKkfAr1Fd31b1RitTd1
         rtGA==
X-Forwarded-Encrypted: i=1; AFNElJ8ttGOcN2U59r+THF1gy4rHdc9i326sup9Q5kc9gTINfg+9QWmCQGsvDWYeezJaFMPese1aB2cEzaDJXgqK@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7iTpToIR/bDPlbvDd8Y7klrH2SMJqt48GYmf/m7GyUaAeWIB
	u7a69mEOET/2WwcC3QENWhOtqhoHIk8u5BVUUv74Lr/NkTUGuv5rns5BnU+hfBHhDB+1ny7JRTp
	crcDb64r8X14Mkd2NwgI95v2B9q8l6oGil7U7+M++4jupH/jA0cxwCYFoszO2vl+cZehV
X-Gm-Gg: Acq92OGfhb/1xPPckFLAsT9xTaBIeQLntdEdKmbUjjFZTFMRRn6BMNZNiOJvcvrVDv0
	mp7UoZathev138G+Q5OI5zDBS/3vRuTroWV7crZ/VOkFI15z7m6Zj80KfzVCyMRSU9eggxyskhh
	VRdVzed8ok3Yii0ixnyGH6pA56SAJmRn/yvWhQjW9DZsyZwxw0TQbuUJqZstor3bhxKFA9c4rA1
	MBjyVFLuLQkFOFSGZL9o18Jf8kaXAc46EhTOcdvmaDjIPag5cQnqlNFstckYiciRQW09eb4wF9L
	bs26nPz2CUE7pp2ZN07PEt2+hAOvyl9q4kWIl4/PX9I3lchnYVvUhR7WXfI1m22MBQ6t0Q/qQxo
	w8Qh6E5IFN09D5E7F8mMNVwCcykNmJ+xWGagHE4P6nQg8yFzEJJzfjDY3AEw6x+iT
X-Received: by 2002:a05:7022:7a2:b0:130:ab68:2b5e with SMTP id a92af1059eb24-13504312dddmr7789195c88.4.1779169331726;
        Mon, 18 May 2026 22:42:11 -0700 (PDT)
X-Received: by 2002:a05:7022:7a2:b0:130:ab68:2b5e with SMTP id a92af1059eb24-13504312dddmr7789187c88.4.1779169331113;
        Mon, 18 May 2026 22:42:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm22075659c88.10.2026.05.18.22.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:42:10 -0700 (PDT)
Date: Tue, 19 May 2026 13:42:04 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add SoC ID for Nord SA8797P
Message-ID: <agv4LFqoFGYpSaav@QCOM-aGQu4IUr3Y>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bf834 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2EGthrf1TTqiorYWe6MA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 78YrgsmkQ3KC0aSRq-RHs_mNI1JDnz6u
X-Proofpoint-GUID: 78YrgsmkQ3KC0aSRq-RHs_mNI1JDnz6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfXwus12XlLAWDP
 jAzyyS/+K4Q5xH/HUGrdY1ZDZpxZt1lPGtXoERBkmAA71FPsg3v0PQUiTk+QAf/dk17UCWPB8n3
 tifGql/sHCUi2vWobi2vD/wVPRrBifyb/WQxaRSqYfqjCowFuUQreCKiiIHwakxMecfKhILCjYP
 TaDzKV847ZDcEdrsNu8dIRDmaZ5NI+3NuohVHcs1us7e2//iNmBht5Fv0D7DTEl/hfyUNvxSu2A
 z70TFHTDtwLx3ZtDZS5qokHxpWpOz8qoIt65vtApjFdCwLyPP37tqn3tnlezn8yTRz+zKpj+op/
 pyAlOduI1v/JfSmWo4X+zJXmq+zxMVtgaZo+38XNKQNq1W3q70/ncShvY5sEdvTQoDzEcTeHvQD
 +SlS/rkrN65fX9G1rhWlARb2yZDUp5MS6EP2A2foyTIs3u20sctyjg9OsvFMsjq76B6lzlFM1EG
 0ylcnDuXX/S0UnmEorA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190053
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108319-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2B91577839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 27, 2026 at 08:35:29AM +0800, Shawn Guo wrote:
> Nord is a SoC family from Qualcomm designed as the next generation of
> Lemans series. SA8797P is the automotive variant of Nord, where the
> platform resources such as clocks, regulators, interconnects, etc. are
> managed by firmware through SCMI.
> 
> This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
> driver.
> 
> The SoC ID of Nord IoT variant will be added separately later.
> 
> Changes in v2:
>  - Drop the Nord SA8797P introduction from driver patch as binding
>    one already has it
>  - Change typing style to use "single space" instead of "double space"
>  - Link to v1: https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/
> 
> Deepti Jaggi (2):
>   dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
>   soc: qcom: socinfo: Add SoC ID for Nord SA8797P
> 
>  drivers/soc/qcom/socinfo.c         | 1 +
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  2 files changed, 2 insertions(+)

Bjorn,

Just want to let you know that I'm including these changes into Nord DTS
series.

Shawn

