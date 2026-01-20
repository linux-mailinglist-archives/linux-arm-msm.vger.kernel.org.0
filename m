Return-Path: <linux-arm-msm+bounces-89861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BA1HWDGb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:16:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C24943D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 33B4F84A7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E0833CEA1;
	Tue, 20 Jan 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/LhGTpL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMVJwbeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13B33C521
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927923; cv=none; b=Y0F+1jScwzZP3NpbIuA2BWyyIRAIsvlQpYXH3uRU8F5LWTvFjYRidZNuGK6NAyOA8wcS/1H35QJw2VPwutX08hGmx3AVQWl42z1MwAD1PanHX+ZUcL5OQ5KZtnsWwkE8NMqb767/FXux7aIQx+LFbrItUORw1dPP0MxAvYlHu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927923; c=relaxed/simple;
	bh=CCPuKReYRvj41JQnhT+HuPW9azB1zQxKUlg4cII68YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGYDscQGqS634kQapswlDfD5FM+vy8aL2+9/zQymstvcSIrRJvcYsQLDYb4xQp9PGgk1U8bCZEtd6S7r/MlS210V5Ya+Rw5vNQc5gsxmvptCcYyM8FhiQBRagmbZVwNnVGGu3mvSoncpsFZBvHur/86IF+YW3iH5Cuc4rcBNB+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/LhGTpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMVJwbeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KES29k428958
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=; b=A/LhGTpLo+qcA/zD
	7r9LZxOot4g0vp9T5qN2dBy0K/D+nuYRlTyeNgvlMKKcjYGpxypDfmUig3q3ajTx
	j6yf869lBaItv1xkZs2OGLzI8fFv1TLnHDcyssF2JCa+K9x/avgf7PSCkBDZsEsY
	mi6kXz5jE1IT3dfctCe0YG43yRadMP6zsnQH2sAH0z5cT60nLzAxDKc39+LuFu9n
	E2lxvNmp7YG7oN36C8MfurAvG+jh3xZ/Xg1IXXTiLWal+4iq5PnWlfPpfuV4juzc
	SoGTzqEStuO75Rdt6pAx86Wqsfo5mNxdBUONdNBer8e0oI3mLI9RuEicwPHnpArZ
	umGqDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps1u54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:52:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a090819ed1so36619885ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768927920; x=1769532720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=;
        b=aMVJwbeQyD2BFa3U27mjilOa9c5OpDsOPh5oR67LdipG9IHsyTvSSc2b4afh3PHM5i
         IarkGk0PO6+2NRWr64b49uF5uV2tqZUxoNwKy4E1uKCRTSc6lD9w3LELIClPwwBBbKv/
         qHgqr3v0Ob+oPhq1tHxoPW4LtBRyQO4wxuCBooz2JZ16Pqf7GdJFhUKeTrEELKnbccxW
         00OPvH0+1BKBEduyHGAtgU+8aH2SkBB5FB39hQgY3EQbnF73ypKeAHDNmZKEVwrerZSv
         arVCmSvTQw0bGsL5rcNGqvUYoAmWfAwwWeAwo+/ljFMkK175Z7Evq2YxslTipcrrY1oO
         lTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768927920; x=1769532720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=;
        b=gEeU23Nyg34XzNWunsrcE7km1KTxsjgMRrqAVM2lo1bS1bZgrO7fvzGsF88l/YjOKA
         w897k0m6spYCxZs+4q6jnGLdeotAdRq63DO+zCJW2OeL2UZz/SpwK+6LpW3tN6rSy+c1
         vGg4phEPQYOx8gguwFhoB/b5jHTlblFPjHOPQRo2cqdgMn0yHbh3oYWwvph/QLsDwkhS
         TuFEWuzqoDune1mrzpK065T8WO9ljrcyp2EDw54WybxULlO46MLuvSKyFAJ652gRMR31
         9ejwqTZnHjJc2nYXtZzb7RxRinatd4BWMIqUDcCXgkEIoml+mFJH5c/VCBOPyx19BjzN
         J//w==
X-Gm-Message-State: AOJu0YwJqGhoI2bBBOI+YGb1UMUMmiC3r/zXiapYCGtGnMkp98jXrWSA
	D8yDT7dwacwCptIo7zKVOU3D5bffNE76SRqhlYIi4AdGBzMqinZjL3efjbCPrz5KP4n7aSHro2x
	aWza9t6+Q5Dk5BrDcOE/18c7aA5LwsMGqc51O5I0636Hc/dzUmGwXb9GLavbDv6fYrHDM
X-Gm-Gg: AZuq6aItv4jr3uWmCYJ7w5bITWVYrUaB/x3j6BGMdv711/KUMGejbfXWa+q5aWNE57S
	oqjhvf0L3DUQptWYTZL/zkaPlN3mT1VZ9NUWz4JHBGXwnMChze+asUZcuRZanSNJJpzypJG95uI
	whv9drZ2fDEaz7zZ/upnxqjexxEdPsum8ZoGuaJ6bi6qxfRR1N5Xdi1Pd4Aeif8WcgBnQXWLAO8
	9ITn8GFvrcAM9xABttGPsPhanSRn6J23fwd7vTEafcwJBQd6W5Z8kKFW3rPGTslrR9H+Kf5uWx8
	/xKOda++fy5l/SljCmB88KX4x+9qUmTHLbLn2wvks1BA7jwsF58d2tUvsy4m5HTkUP244AY9t0t
	XO5nX+kY1pqGQXGbAJEsZlX7uMNFOhIWgj3xsMA==
X-Received: by 2002:a17:903:228f:b0:2a5:8d30:58f7 with SMTP id d9443c01a7336-2a76923cc64mr22709665ad.17.1768927920129;
        Tue, 20 Jan 2026 08:52:00 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2a5:8d30:58f7 with SMTP id d9443c01a7336-2a76923cc64mr22709425ad.17.1768927919485;
        Tue, 20 Jan 2026 08:51:59 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71942248asm130052615ad.98.2026.01.20.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:51:59 -0800 (PST)
Message-ID: <3e973c02-c804-43c1-863d-bb160108face@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 22:21:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS
 resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6OtaG0gfM3DBerW1lPkee_dUez-xD9fc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX7CwkkWkwpZ7K
 Qwq9j6zQeSaZkqO7dZun1GBinXcCxTuLwfbJJC7O5uSiz/Tgpf7KvAwDTjrcYKJbgd1s5FJ1dCH
 0H3Rd3wf2sUDmnUwccxu/DjI2gq9NtOCBcI0+judiaorytxOJew/Jcgwp7RQuqntLXhKftuFIRq
 y47jn+NbEmijqqQqj4BfafuOt7MikIktpYsvZ/6/yqpOcHOl+jg6JiMTzRPDrnEC9z1VmjC9rAn
 eGoI01OkJCTt4LRTIDn+Z+sHduojsAviksphWKKT5fWpezrC5V8ARIUaLGLA+rEmIQzpizJ371G
 eBDqJKyQolwr9e+SWo8AlcKqqnjodERW9ybNAfJrOA4NXb5j0LgzpcHZN0vgYbGumq+yUunT+Bg
 orE5tx19hrjHk2B7VoD8YDegbhkbiZVIpT5shNYjxjFVscORPaPaLhluOQI90p0+1QCsMlu+3Q/
 lja36iLgft+HcUbEqYA==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696fb2b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=NUZ/Q5sP+scsJfd5oYcUKA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o43xtqzOwXQgjmHM5CwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6OtaG0gfM3DBerW1lPkee_dUez-xD9fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89861-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C7C24943D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/20/2026 4:49 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: 75616da71291 ("dt-bindings: clock: Introduce QCOM sc7180 display clock bindings")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7180.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7180.h b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> index b9b51617a335..070510306074 100644
> --- a/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> @@ -6,6 +6,7 @@
>  #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
>  #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
>  
> +/* Clocks */
>  #define DISP_CC_PLL0				0
>  #define DISP_CC_PLL0_OUT_EVEN			1
>  #define DISP_CC_MDSS_AHB_CLK			2
> @@ -40,7 +41,11 @@
>  #define DISP_CC_MDSS_VSYNC_CLK_SRC		31
>  #define DISP_CC_XO_CLK				32
>  
> -/* DISP_CC GDSCR */
> +/* Resets */
> +#define DISP_CC_MDSS_CORE_BCR			0
> +#define DISP_CC_MDSS_RSCC_BCR			1
> +
> +/* GDSCs */
>  #define MDSS_GDSC				0
>  
>  #endif
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


