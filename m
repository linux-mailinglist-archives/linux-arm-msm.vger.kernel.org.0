Return-Path: <linux-arm-msm+bounces-73101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE32B52FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7786F7BE84A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBA131353F;
	Thu, 11 Sep 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCo+FZed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC43101D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588968; cv=none; b=jnYXknRqdZAHyJYukBMVPagcJghJQGAz7YTscvgLsaWfQTtw708a4sVJN7JmTxRPw6bH7xwT1nOan9IxpMcMew1GJz96jEmr1jqiTmLlc6Pi5WYPpwjJqEr65JrPXKG+8DcLf5Recc/QknTRVLmkUALbrio2caMLueSc6jkW48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588968; c=relaxed/simple;
	bh=6+hW6PzjWDgXMyeBzEyMR/C1LLoqI3u4XGnzS7ZbQy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=citB8xoad5K+U+b2DtYjMFQF2M37RwendgeSdaxi+vdNQXHokJ6+TlIdcNxQAIJGnXD6gBakHfdJJ1iwbfcWxdPzhsjiHjD75wJ+WOh9aT9AaHy6SX0dqmmnJB5Gsz9DfGumyFVmc9k5TAm9KUEoK6fpbSIRuIEu/G2WKrv5ZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCo+FZed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVOd008178
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfepPxxbAjL/Co1tZK7XBqJiEAaPkOTL9NAiSIvz4T0=; b=MCo+FZedGVKGP143
	3Dams+1DlvrflP7FZZF1qUyAOG8C98RDJBaLOSAQk4Il1cbpdi/3RpHMJYt5FC/x
	QqHtj3GFSej9AhzW5YTGBP58cfgf3HFrHY5tfbLsEFiXfCfG3NfOFc5Cy5ScrCpa
	wBX6YZy2NDdbPb37fhDPQXtrkx2VrYI/V7rzfH9GfDqhZSQY4dZa2OgRvtz4D0mA
	rALaeP6Rctzjdl7zsCmTyMLhQLxb9VwbUzad89LbeftwTZL7zi/B3DFhhfW41Jc1
	50E4r3so44xW0zT6LOBBncG96+fVfIhYMXDaKB1eQNiuQg6uth4bZTt1GA6QYczW
	LhYEGQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapqmh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-772642f9fa3so1466343b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588964; x=1758193764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfepPxxbAjL/Co1tZK7XBqJiEAaPkOTL9NAiSIvz4T0=;
        b=FzYduH1ReKhJ7GN0ckB+CopoX6QhN4MSAFy5Ke0nMimuLzBeTwj1B7bqs8+MSX/Y7Z
         xO2sNWcEl24MFrf+LIf9mzXzHHml7mO9kYfZrv8sNU7bx4A/GtlQLhQbzVGGQvpB+Sp6
         7JmHMxXeNp1OH9Dc7Q3zLeZAT8AzX2WF4DK63Gpz8GxxyW9wCw9doQbes4H2bh1PXVSe
         XSgF+EpSskvEa0JeT/EyXNLgXQuYV57z1I8h/jQ+7u/mq6FTmw01K/FSwVL3vBkBwKO3
         xiN/dgUhLCgRoJLRtD4GXdHdn67xXDV9+T5Q1dP/a8XIkHJity4DbXjnRUdDkiSGuI7R
         0KZA==
X-Forwarded-Encrypted: i=1; AJvYcCU0IcYOoPwQBOK7txrZFpuG7yVNu9V3ZWGHb3f4B7XUQoG/cd+jZjF66Ih6G5SI+JM/2/PbSaf2qSerfQf5@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCVKtVqgxaX7nruMpA9F6riMBAHhsT4goN2upIsDHcXV7pdOE
	zvzveBOaaGVdZ5KyJMAY+JncW2MK6NC5Of2eiBreJzHRtEO+rt2Edc4f/9y/mtt5kS0pr/3GXwR
	Hw8vzu4wjtahv5z8fnz1eC12kU+2oRBfSVioHv0yyQCUKykSgoTIlgII9N3spXRKX5MNC
X-Gm-Gg: ASbGnctb9jR3gkgiLGKq63s42a7mNfm3KDt8me/qL7sWZfCEbNjrBP4qXtjiuDq3sPV
	xEJqcYZJixi1WoY5I2bJz3ADg8wcfrsH271ZzCiX5QXbjdCSPwPghJy7btzjoNUA0CfxhoRRYsJ
	wnJAUNDVghqeGzAj+lUCPZ39jCWQG5YA6AZAHrA6OfUVu5Ci2S/5n5K6oqoZQQyTcULAG67obeE
	NQOjsgv+HQ7NrDSWzwmMXxknJe2iwnrv0/2PjteJLdpjGVXAO4qh3jJCD9AcDIwhdCVsQc011CN
	ixpiqagsfqJQMCuNw/6wx+74PJwtoaNoIqrtI1exPvDC8OGtO07WCt5kSvgMNUiYSI4dXTA=
X-Received: by 2002:a05:6a20:1193:b0:243:78a:82d0 with SMTP id adf61e73a8af0-25d0a7d6262mr2250243637.29.1757588964153;
        Thu, 11 Sep 2025 04:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1OoF2jiSdzRZIu/K+5m049r0DLrJJHS9wh1TM6nPLGURZqakjy3iuXPRDHHmzHThvM4b8Mw==
X-Received: by 2002:a05:6a20:1193:b0:243:78a:82d0 with SMTP id adf61e73a8af0-25d0a7d6262mr2250216637.29.1757588963693;
        Thu, 11 Sep 2025 04:09:23 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1917dsm1770172b3a.52.2025.09.11.04.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:23 -0700 (PDT)
Message-ID: <84345fe1-4a85-423f-b461-5e8637705f4c@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c2ade5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PkFlns490kmrXv5xOd66GXqrFdRMi7Wk
X-Proofpoint-ORIG-GUID: PkFlns490kmrXv5xOd66GXqrFdRMi7Wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX5TniWcOxwQv7
 0/ftczYtuT64GJsD37o51U5gRGOKtQTxSMLGXOnvlDYtz7K58ByFlqf2lvkav/hGPLppo3jEr8N
 lGGZWHbIfZiFNtUw2B78T10VNUt6zyHTNtzwlbe2HjporlwcSSfkgpxnTBCJsYYKrOT5SLhWX0S
 X6bNhsMRJEmX9QDgdeMvvmYRPTLm21+Wp1hpSSJgAwRUE7Zx0yll9pwZ121BbLpdfT0ufMAgu0q
 fuKuZ9brjPI7WiN9xg5D5A9QFOzyBlXFFNqvzbj3dtxW3pbCuOLyrJOTOAJEPmML5gOqtjEUwXZ
 09ZHnSYf2aclav713u+Fhs1GnOUQFipM4d8JNzOsn7Ey7aMpZWPl7YsXcaS6maRKAb7N2JlUelE
 F8LOJkaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sdm845.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

