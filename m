Return-Path: <linux-arm-msm+bounces-86407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62984CDA511
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC218301F5F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFC52B2D7;
	Tue, 23 Dec 2025 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpVYT1mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbqHdm3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6422E7622
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516988; cv=none; b=uj7ucERvwHw8ykNm+BU/9Cja1cVnazWdcUunmh05TVi2Bi34sa9UwTv+bGZXkH3zW9EsrFcPVtDTh8X1hPDpn27FwYwJg15UktD7HAER6BAOkqxBVP2ZmIQxVsESNNVUNmtL37VdQcripDwTnmExL3aGoPL60KzUVihwFr+ASS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516988; c=relaxed/simple;
	bh=k1P8gcYDDeOeqWk/FWOYVCXOdcRUDFNLxdQk/b8AQnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bzd+OD4+I+WSE8zVWG6XYsqWtUS9C0R1ugKl1LfQUTMCX1Fz1X3xbuF+fnQvMJo9deYYfq2fuIWhhQJ6Mc1WQXAp5pmUyG8SvvvyYgK7sqxiUwLtB6WUksqRm42irOXSAtX7QrsY3tO6WbEphP9VnYZpUYqec9gDcbTM9MPlwpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpVYT1mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbqHdm3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFt4J82570004
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ne7yjIik2sLB3kwQPbmGVZHhIxzt9wvlXp+yfKAZU4M=; b=jpVYT1mcpeIcZCsI
	GENE/BBZhcyEMpsiU14+X6wA/t0D5cx3OE7OzTmrq/3TrIST5FRldoQAPonCbS/P
	2luhbZ4H8gD7POHFKgvPJakiK3ZXWcz3xISib2pckl4nz7U2r8m/eYwbstfVpYUU
	gsuJen2WE3+XGq6kxpN+8Kyy1R36l/a+uf/lA3caMER4WS1w4NSmpAfvfCbAr9eZ
	OfVrPbNw2pEPlGZnfiie6LwSAns3AC22Yd5vsjKc8QY8itGmMDZGRbOFNjcuux7P
	N0/bn0iu4iVtlCqn1UUVRb7tzMEyMuPV8Ip3pqcpB5tJH3v/RMefnyXeVImcd+1q
	X72DUQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8m47u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:09:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5e563c429c4so8596799137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766516985; x=1767121785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ne7yjIik2sLB3kwQPbmGVZHhIxzt9wvlXp+yfKAZU4M=;
        b=cbqHdm3waYaXFabgM5CGrQEc5Zncoc3B15VwaS/LW/+DMrqjMxcqdPDi2wv15gxoZw
         R76e379DGfWS7+Cw5vWXScJ9orw/SJitLo0apJB5PBqvaPurwrRsblbMXNF8NF8rM1Mw
         b/FMN5BtwBBdFZAqAakTGhy0RjYqjk+dvwrvHuxQs2a+lkZiVqyC+f7FKP46giqfyat3
         Wt6KuuiAEqbKLz6+pn5+WFbWD7clPPYCxp/G1zVncBmJzD8oRXfKcL87ulJdkNwT/WHZ
         axO8lfrZjKlzooQZZHtFfCPs56LvMALKwHmfMRVEVBkMcJ2N9seIcKIU0G6w+Gh2ilMp
         lfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516985; x=1767121785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne7yjIik2sLB3kwQPbmGVZHhIxzt9wvlXp+yfKAZU4M=;
        b=OjekczHDHSYPpfgawdpJ0cXIyd7VR9wtnkO+Un8pkgOr2jMMxCjGatYoyp9Q1CzLIg
         RQe0jKXJedQFyrPETdxe+ZF57i9XpUT1+V6YYVaWqCICQau94X+daz+yNWQ3ifb+4UEi
         8O22a+1F7NR+wfJFoA/ajGujlwj8D4hzh46Q3hoP89sNG8EMsnMSmRZyjD1CprpxzPEE
         saV06XAf0VvzLqE+1YSJvO5BnTX0eGSDwL+WWv31eXp0sHOj0AXng1NzfXD5LraU08HD
         SP58mpsvhgwX3ZKCflY42LrKixQPSj7OqekvYuTdnVbXbyFb6SKFm3MbwBvA2lQbM8FP
         16Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXU6K5E08p195R0IxmOtIVkczEwJYd+4dGgZqCXk93fK1EKjlWcC6AzhAwU32kD9FnkM8EJxI7tiYRDtxed@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcxsmmk8ax/HksJeDLEoxJPffaWFTgjp57gvQf4DPYJWNJ6Uxz
	aG3u8fJt5QWh0uSMD9C1N/mCmlyGVNYv63XVUy8ZF8Z+6Gp1I5jtZ0o5cNWeeNwPNR6BwBckb/L
	L7by81aDlgtL9R2+O9qXJnPwX290JDqHppSi4b6Uq4nLUUbzyVLHtsMzOOAh9+phdYJx/
X-Gm-Gg: AY/fxX5zO9yWrFAZtag8ngX73glUrQzVUmM4ecv/FiMUC4UjoOyVGBHKHVkrgw7MPxU
	1t47V2CA2E7mKnijMMZ7wil5HKOmzvDHXsWUN2XvaH59KBaNIiRPZimwKVDqvg+RJGVblCShnSy
	t5h/Y1fI5uPfy0ZLEaOji//LFT3ECUL6m3lMQBOZRIw+qV1D4UhtIeR7p4+Yzj+1iTc5JT0LwCQ
	Innfg708DcG00OUEPCx2SZA9sywSMGOw3LoZZpQdTdS0K6rN5Cbg3mz6wgXGn4XQ8iyo7rgoOEW
	YC/gFzJykrhZLmXocE7fl25fb1opWilVYevbjdioNk160rfA4Yy0wfUlKDBNbe7lNE39qSUBBzM
	AeY+Gs8PfvVrAyxDc7fOszJsx10VV3yZLYj41F4kQfFAzQZaF166U8LyrTkYmdyKHkP6ZQ+Yxcc
	76C+ZIhhj8/TdiXWYN+9PAf50=
X-Received: by 2002:a05:6102:3fac:b0:5df:ab05:d85b with SMTP id ada2fe7eead31-5eb1a827856mr5230790137.37.1766516985359;
        Tue, 23 Dec 2025 11:09:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNTHftbf3Bkw0PlB6/3WlRJvubYan548Eb3RBlBedqIiE5HjH1XZcKd53bNwkKFaMRv6iJvQ==
X-Received: by 2002:a05:6102:3fac:b0:5df:ab05:d85b with SMTP id ada2fe7eead31-5eb1a827856mr5230781137.37.1766516984986;
        Tue, 23 Dec 2025 11:09:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm39072981fa.18.2025.12.23.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:09:44 -0800 (PST)
Date: Tue, 23 Dec 2025 21:09:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
Message-ID: <febd6ziruli5qqk3vk5v44agpiorqb65miinsc53xomoqtynih@l4kk4xpmen4i>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
 <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1OSBTYWx0ZWRfXzv9TF1dIr+8K
 H2GlMCoqAqWhhqug+FKyMAp3DREsSuGYR5d0DdQPILKpv8fXp8LemV0nqjdjvmvw6PCbeQBAufU
 h+roQBGTrcxd5OZ7rzA6MrgLDm766769ouDdU5lAN6l3Up1rmEktFjhc0VfWa6zcbQsPR33K0AZ
 RFZgR54dRqkQB2Rd7HZ71CB3i5gL+0b4PnJI/XtXqj1pWTJC6NesfzwR3T/z7ahIlD/AvQzoaSw
 D/OXZ0YThGkwGmU/12x7zVpEQAVWuQSPsPQLRsA9BeH/aJbm4faCGf4/QoOhzhLAMR88ggxruGQ
 NTFjWi+VW9adAWNz/HOAwYI7xGudDO4u0vLlYed+0VbD7iVpsBvMHFzn6U53Evf15RkIWC1SL+f
 J1NLt5TMo9LwCIcaZx/RZNTgyZzf+eK5bB76vF/+ppJC7WaSeI7rGPaiiyb9ADc/1h0gOu4rilc
 N+hfZifkImVsPom2zbg==
X-Proofpoint-GUID: zOb61aI0BHcg4klPhy4wFsfXd21_HIqg
X-Proofpoint-ORIG-GUID: zOb61aI0BHcg4klPhy4wFsfXd21_HIqg
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694ae8fa cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yY5GkH5VgDlcI4x5A0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230159

On Tue, Dec 23, 2025 at 06:27:05PM +0100, Konrad Dybcio wrote:
> On 12/23/25 3:12 AM, Yijie Yang wrote:
> > 
> > 
> > On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
> >> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
> >>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >>>
> >>> Introduce the device tree, DT bindings, and driver modifications required
> >>> to bring up the PURWA-IOT-EVK evaluation board.
> >>>
> >>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
> >>> the IQ-X SoC series. Consequently, the two common files in this series are
> >>> prefixed with 'iq-x-iot' to reflect this relationship.
> >>>
> >>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
> >>> except for differences in the BOM. As a result, most of the DTS can be
> >>> shared between them.
> >>>
> >>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
> >>> the PURWA-IOT-EVK carrier board.
> >>>
> >>> Hardware delta between Hamoa and Purwa:
> >>> - Display: Purwa’s display uses a different number of clocks, and its
> >>>    frequency differs from Hamoa.
> >>> - GPU: Purwa requires a separate firmware compared to Hamoa.
> >>
> >> Is it just a separate firmware, or does it use a different _GPU_?
> > 
> > It uses a different GPU.
> 
> I think it would be useful to call this paragraph "Hardware delta between
> Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
> about differences between Hamoa-the-SoC and Purwa-the-SoC which we
> expressed in purwa.dtsi

Nah, I pointed out that the letter is incorrect. It's not just a
different firmware for the _same_ GPU. It's a different GPU revision.

-- 
With best wishes
Dmitry

