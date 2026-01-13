Return-Path: <linux-arm-msm+bounces-88887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B965D1BAD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 00:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE8193029218
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 23:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFB835CB93;
	Tue, 13 Jan 2026 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlE5wPS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEysJod1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94531812E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768346384; cv=none; b=K4TdD7xRf92wZOjbNLshx7PWUI0OqGNrIWwdDc7UgSoASF7EkYQ3K5cuL9Qd8bbgC3GGu9bmLdjia7K2T0w9xr5Tqw69ftE31FjCy6Y3FknKgZz6jdx46jUpNuTI9QXcA9d/vT4rOdP8kTFOARPDqKVraH42r+KfxZiP5ZKsMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768346384; c=relaxed/simple;
	bh=9q9qgttNgcSZ4M2VYUR8G0nYA0yg7Zyr1X0XF5XlyJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU9WSLtpYuJjOkkC/cBvtujIePx8HLUausGu0tB9mX4zl/yohRB4aYIYkaJdmylHnXmP1G/BnTZfE8vCc6SyTBttvLUnPvxRywGwrXSK8N/2PnOyA65SK/q4HH41eM3+fYDNJANzmofZpa3Gzqx+7b9Y1I4Hs1fNhVQjwW1tv7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlE5wPS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEysJod1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHlp9984993
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=; b=UlE5wPS0f70Rmc8I
	4ZaYTJDUl34fB7bD+I4BhoKQcx+c4RHb5OqcYVDLgc7//c0oozUTdTIPf15wYvur
	XZNR7rzeWs/zoiq2z2l6oxF2nerr7R1ey+uOEoEG+O/A5+H+oTh/NaiNcrNL5hPQ
	ldVfr4sxFw1GGDZMG8jvArStoH9CVBrT2pb3fbSlGNf3vwJJwmOKJOPMI5FJW2q2
	gLRQWCcdR//t7G+rJGqu4l/HE4UH3Blc9PN1ZGsDLFAnARgPrHajwoKgcoZ6KDYC
	ulzM2RTg5qEiMLVuduKJcsPhxKNO1CSPqhuqkt/5TxB109BHIJNheEujITj61Fty
	jYXGFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e9k29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:19:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52dcf85b2so202505785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768346382; x=1768951182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=;
        b=UEysJod1C6dahPOtYeIPQzDBtjxXAViRbRP9/AX/5O6L4BSeqZm6xgqzJ1AaDwl+xS
         DT2eHNB2mnyW/0Z0NlfIBDij3Ls+PTr1+nltXg1wCQx2xupqblcYNMJ3qZKAumN6TSC8
         WjZ2DiZLTYofBt0PvkKBg3tgfjbbNQ6b+7I4OJcVTLszUZc3TSCullCemHzkyC4BAlaE
         X4biNFaaJbpEe7kLu/jSw0i/N2jMOhYEVFi+Kxb9I/VQvuh3ePVhTV3rAovScLohRZWN
         meJrHbDjvG+VOPfmXUHSCL1GcmYj+FU5j029Y+GuBWkgVfxJqMVlp6QgjSvwq/G1+3oM
         HkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768346382; x=1768951182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=;
        b=oXmz/Jh0oam/v+JEGYt9Fn4oB690Yq1myp1mP1RUtDm+DgufX2oH57N3Ex0DptElhN
         C++5EVeLyZukia9HN/sMQ4xQHKznpxawkbxXA5z7vBKzOJVv52xWwjZlSQUdKkVTF3uj
         JgxjrQ+uu+4dMd56rhbYWfD14hdm3LJkcWcKRUjTwfwxSfXFaV1ZZeCsTRTZ62DCSrZW
         WbAPYaLcDkvBkwMNsb6IT0h5tl8y07FR6fVrf4NKoDIBdNLjtFsjJ/wk/u+8W6Wq0QpA
         8KJ5EV9KcTTa3eZFnnqqKDNKSrsEEqiGGbQ7ZmbiDY+wXU1lAvGgTXfA1HPtAl4yW4T8
         7vEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXThBlWawoGLllCXMWE87lAY7TY1lhmYKGfjT2RLg0rcn9yL6e6Fkz9mHbqn7yvU5zBKT1ddFR0IMlORRW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cYQV7l2e9GT4kG8MKAGHOS3af9BerXwl4sb7k+3EmTnSK8xU
	FWyvUAU4nQksY0St+xuoEcQkLFCdlO5cgUJ5pc92gLZfWhABu5E/48RlIoabuOX1z41b7hMNRsi
	tf0cP9s9zt/q2yzaf48inJbX306K7NWGBWIhcoydPgg2bhKV6tleTCaN6YT89oX69REZh
X-Gm-Gg: AY/fxX5fxsPT/kFMLFaeczqR+mjAQPdW25mkdBf+7tHup8hiUUQTunsO955rwNSXj/Q
	y3BPF1RfUONB4B+b9BmaZ1OxmhehZRnSrUhec7CrykCaKGCMEgrYKyPg1DmML8gFK2rXRrlK4kY
	XrYrgjaNvMBLUdfIjzTf3n//rX8B1KG74+cPq4O8z6lZmMRiEvysNTeSmzPc+Zjm2cKQK1YQ6Un
	A+BrbLQxAuAV9sOE/8sZizXvz3HI6kYGtDXXQFDDayHbwj+4/p7PSyWDCQLcUI+16Pa+x7E8daE
	1qCHOqSCsfqEmiTl51Iu2WJtyPdg7b5lAenHpA75uK3qVBEpEZM81T/kO4kHCDgvNwVbKnaf5EQ
	xgend3X/NHq9OIyv3DCU7BJg2fdNAM3Z2KKQ1cyxMsRONftfyQ/HpFU1WD+8L5nBNqTnv7OXIYv
	6dxnwhGjk7p94nIYpK6QlhDk8=
X-Received: by 2002:a05:620a:4089:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8c52fc0cf03mr140248685a.76.1768346381436;
        Tue, 13 Jan 2026 15:19:41 -0800 (PST)
X-Received: by 2002:a05:620a:4089:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8c52fc0cf03mr140246685a.76.1768346381022;
        Tue, 13 Jan 2026 15:19:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8e0e29sm48548611fa.35.2026.01.13.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 15:19:38 -0800 (PST)
Date: Wed, 14 Jan 2026 01:19:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Szczurek <szczurek@szczurek.yt>
Cc: "yedaya.ka" <yedaya.ka@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <wg6j47rwgca2pyruxlidnidjfb3fkepxngfp5c3xilfs332z2y@s7dpbiq6ft3k>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
 <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
 <19bb972b9d3.12a7d3da3105717.8521466650832407846@szczurek.yt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19bb972b9d3.12a7d3da3105717.8521466650832407846@szczurek.yt>
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6966d30e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=vU_bf3juDL7YJUi8oSkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE4OCBTYWx0ZWRfX5DyIpMFxHxpx
 ZqV0RNuYBnALXrHtAN1OsT+nCsxTR1pIwFZbIgys9nwrfD/3dEhU+fPnzDnQDTZ3mqvvVNZcgRZ
 wXj++vEemHQtG5XYY+ZKXN8Cy9A5rfuUaoS4qDDs3NPNOr3KHDtS4Ze1mjxGM+6MtIcDhRVOXpN
 kxpoT1wf7Ol9e/1kjiyL3h4FMc2Jf3UV+btzxg9pxl0IjnnrhWuUuYa6bqToec4W1jCIIdPyw+S
 EdM/vE77gCThL6Te2rJFkMPpU/W4+Ko38HlHHsNuO5r01lFmDxHqR/cxxNONzVKNrd3+QEDI2zW
 KwSP84cRff5mfMkJQgZyuuoL7sARbd6t1kRs7RSU+5TmijHb0dD+INGyoyHKjFgLX00+78v/Bgl
 KOalkBCz3hAMUhLJ93QGIoSgr6Oq2o++aQaMv6EpmGipUwX5XklZxVmYBy90JeBshitIZ/hOBqa
 cgo3YPkNKeg5virCHPg==
X-Proofpoint-GUID: u6ujG4Dz8h-Soj7J90dYc9x16QEqcm54
X-Proofpoint-ORIG-GUID: u6ujG4Dz8h-Soj7J90dYc9x16QEqcm54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130188

On Tue, Jan 13, 2026 at 11:21:02PM +0100, Szczurek wrote:
> On Tue, Jan 13, 2026 at 20:28:27 +0100 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> >On Tue, Jan 13, 2026 at 09:12:36PM +0200, Yedaya Katsman via B4 Relay wrote: 
> > From: Yedaya Katsman <yedaya.ka@gmail.com> 
> > 
> > The driver also works with FT3518, which supports up to 10 touch points. 
> >  Add compatible data for it. 
> > 
> > Co-developed-by: SzczurekYT <szczurek@szczurek.yt> 
> > Signed-off-by: SzczurekYT <szczurek@szczurek.yt> 
>  
> >This doesn't look like a name.
> 
> Hello
> Yes, it isn't a real name.
> Yedaya Katsman is upstreaming those patches by me, under my permission,
> and I forgot to tell him my name, so he took it from gitlab, which is just a nickname.
> All of "SzczurekYT <szczurek@szczurek.yt>" should be replaced with "Kamil Gołda <kamil.golda@protonmail.com>",
> this is my name and the e-mail I would like this to be under.
> Excuse me for the chaos.

No worries, thank you for providing necessary information.

>  
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com> 
> > --- 
> >  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++ 
> >  1 file changed, 6 insertions(+) 
> > 
>  
> >-- 
> >With best wishes 
> >Dmitry
> 
> Regards
> Kamil Gołda
> 
> 

-- 
With best wishes
Dmitry

