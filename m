Return-Path: <linux-arm-msm+bounces-83336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 767ABC8782F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB79534ECEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6472D9EEC;
	Tue, 25 Nov 2025 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RS7Rlx16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIwgxhs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171AF2F5A0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114524; cv=none; b=KbM+14RHenn2Y8PGchfjkNbJKMgY4aXam67ozWCx+DgPRRnL3ilmV6L9MNdfM/Nk+G3rop84ci/dQKYFpZaFJqu9oQyABHvYXjG3e9ZRYA33xMUyTlmjahTwZTSyqM4htne+Nroyt8J4lfZf6ZEmsL6cO62Okk5d1uZhpA4iebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114524; c=relaxed/simple;
	bh=0Mlyhx695BkVTyiblfoWvSYhVsoxNzGhcYR/1u0Vwps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ujz9s4d1Dijs1p7QkNv5PuqCEjObeSIvkGgp4JZ+hh/ZvJ2+pATcmhhgnpP19am5pv8kTc39wZIswOF62Ojh6IQwfxHPV8NGFkvFSKHzNHreZw8kjRS5eBVz3KdETQvoZBZmpQ1ty/IUHmRm1F4E5TM2L2R1Ce6vxtZBrnaXk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RS7Rlx16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIwgxhs2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APKDJHA3255891
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k5jDEGG25I4fC1NOVLJpbEU6
	TiEXOx1Y+8hrvGoC+dc=; b=RS7Rlx16a02VrUIvd5ojRZi43FxbiQJfJ2jlUXyI
	IE59OhamC/V8eqRUFB8ss/DwbQtQH1JEEhYn9Grcr8gVlQrp9lm/LpFUGmAbKE9F
	QKcbcAJbLqPQiMDNd9ncpf7PYLLaI/bogue4EgDVSKK6lNbfYViClxMgRBA30l9a
	YEIfgxwiuwhohQFsJQu0/DGkuOWWB6Hl6x0bYqdOf9+Gis+iw9xD0dga+qL7aJBr
	wQyBRjm7q8WxdXcFkeRWGc5cMbQsUzAGh+ruChgpNR2sbOsbmAVVBRZDHY/3sVLw
	EjvWo0ElbnDBhmYqBHQMBfABzuZarYIbq5sK0BiOTlFuNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c1xvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e4b78e35so1386779085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114521; x=1764719321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5jDEGG25I4fC1NOVLJpbEU6TiEXOx1Y+8hrvGoC+dc=;
        b=MIwgxhs2vpUjNctbMPzOXwWoi8NfTOTSV8GsWQgTSAwhPwAMigDhv0ivT0XaOmXkuX
         uJHlVB4/tZ0LoraRIjDVjiRkFtERPh9P1TJnGan//GKfY1djHO4Pvr/Vkn/fz4xi1QQo
         iClCPJJwPF2Pyql5GoxkqJ43P9F5rCY7R9W6vFDvzYcP/neD5UAdime6bD4vtr6TkMIV
         kXZayx3yN/e+YEWw4hpLzkbYGNC2iDNtDpD3MaEJYDqsYY8quFHHKufAty6C+uddbGp8
         I+DAH4CjVZ3UPznvgrIK1JtD9KUA9W2/9JlJMnGMefg1XwQCqk8l8oEDLMh6mn5UjWbS
         Ag5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114521; x=1764719321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5jDEGG25I4fC1NOVLJpbEU6TiEXOx1Y+8hrvGoC+dc=;
        b=ZoGY9zDHGlLBR2uvt/YT4S/4n/Fzyd4O6YCMSMd3YJxlAfp278bBBszfJ7DYGJvt41
         R0FLbC5l95f8Q4hXnP0mIlya/3mMY5CF2BzrfQLLyrN0+J78EuBBp1gxyAPLByGiJUnq
         aHDXVwfqWsEqD6eMIEwzygCc1AyXpFsAkMC8gIt+yKo90gWpwXs8mCWWWbOHYL/1jpwN
         Siugrbmlq7odkzTm3vmdl+05t0eaDexhprWFXpo7R+ASWAdoc1XXF5F4Ly5BCN/XITZI
         iYYHvGqOki6NDAdwHMjTSzjJ79/gdi5z8hB0mrbro0D3T5ufymbcHndPgGcnSeqaWSid
         cEEw==
X-Forwarded-Encrypted: i=1; AJvYcCWqyYqT55iHFaU3r0BYy0ZXEJ6R/5EnrSvGb5z63oiQmfYYJ0QokoDtxfKhMIXS6qEsLYz5cNtebipzn9iM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10F9Y5POgcp3cbh9TDqbetE+7YT6bgKVGH06/nzG8fyIj/fZ3
	wG6JsTxF9kD+2SoVce0dJJ4ZjZv0vPl6rqjPNYfNwa1qDycC3MrwWcqquot/EKET3qMuBb0SEy8
	iRbfkF5jJ/BXYqIhgo2kp3XWPIoiHQNZf9wvUDFVnxhcU6X0NCIs8Hh3IhKfEaIailjiS
X-Gm-Gg: ASbGnctE51PknjvRLFYM9GM68gHokc7i3mNq8zL6pe0ERZe70CoTxTaCcPocjSSly+b
	fRVEYUWU64XP0dwwKNwdPQ4WJIAf+O+ffSDrN9ihIyusEGAGzzLaXI6tuFJvKqo0R1tCmFbQrhd
	1R1RQd93l56zkeo+e7PLRkzOesx7WqpmWdNsPGpuDB0svxgiJCMa43f44TqyEEOdwUffILb7EbX
	LyvoKLm2Zz7FWkKgL0mS+fTjZ1a/B+1Hz9Z9IGQCP7dosvrjY+g2bkqglJSCLp9uDVhMu+XQNdr
	0bV6VNcbL3vaWfT5luQQmes3ATgXOlFG21OhovOgCnENYz6/dJu+B3emb+964PwMVmvS9dNqBQt
	9+oH05kZ6YLi+VojzMmk1GY93fWFieD1edd0c0XUMsnqYaZsiQD5TLGnF8OfCUJnyak2TdyBuGW
	BXLPKGLFCroihN6zPSq2O40OE=
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr613779685a.37.1764114521458;
        Tue, 25 Nov 2025 15:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd7T6aPJkSDHrzf/XM/oH9ZfLFa60qTGg28nQcNctnpUzmJUsrOR97i7a4b/c9x3o1jjM7qQ==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr613776485a.37.1764114521011;
        Tue, 25 Nov 2025 15:48:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm5568378e87.14.2025.11.25.15.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:48:40 -0800 (PST)
Date: Wed, 26 Nov 2025 01:48:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 fuel gauge
Message-ID: <eysmjuxmvl4nfn34hfiqw4pwfptepibo6ez6tlunegk6dpmc4p@hbzex6w4dxnp>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-6-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-6-dd3791f61478@ixit.cz>
X-Proofpoint-GUID: vevFqEW4ygfOpV_OGXj8__UGv-PktyVH
X-Proofpoint-ORIG-GUID: vevFqEW4ygfOpV_OGXj8__UGv-PktyVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OCBTYWx0ZWRfXybEfjp4bNf8r
 TjuI3nHM1bv02bUhA2YE1EFfKEwvam1tPuhJQvBIZxrm1g7QcMrzemmf+S2lZjnHknH+2vK7uae
 0204NNYOVruKkftcLrKBKay1FeWxLR+HpB2/SWCzeXykeimhNb/HkfYXS4YFpZJbvtp+kvaCBPF
 uTgiC0XEVM/uF/zUbcvnS0iAwpYwMQdCFj08FkZfjDgQH1a3cq4nNfBx4g1a187lCXTRRyDH8fD
 K9xoBfKTokJ8ZAumn32xJcWM8/UtYnD9DxqBfUUvcp89r6pDC2hTOOaEmt4gwf7dbcwCqdlpvoj
 3AXsP9agU43ZgNPfM+mnfc9V9WPA8uWk6NOprsRPKgT3e0cFN5eH/m2Mg55gHxV9Dyq6os20fKW
 F0eI5DVRFLDdFGfk9MwemJ+mhOJ1Nw==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926405a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jB8_oC6jW5EHyFLWiXQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250198

On Mon, Nov 24, 2025 at 10:53:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Enable the fuel gauge and configure the associated charger and battery.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

