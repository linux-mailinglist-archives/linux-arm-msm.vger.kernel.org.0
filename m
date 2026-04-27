Return-Path: <linux-arm-msm+bounces-104807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHVdHFGp72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F1478784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C45D30131D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A963E63B7;
	Mon, 27 Apr 2026 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cA1znqri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOOn4bvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072953E317C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313925; cv=none; b=sqQMYLkeD2S8VhUi088FZXBa2acfLuhHVn/5+16tRw1SaQN4izZInfZDWTa5DW77dMVirCg7zEylaMnE2d3cA72ahnm81wF96VPA9b9zsC18/6FnW2fsC7Uh6IaDaDz5Wr6IR8ANr9S1nvoyIlsl3oCqkqZ+rOuifhnEdTyB2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313925; c=relaxed/simple;
	bh=XWz2b8DYDaLIIiyDtf+GBRRTgJFCkw4yyBezhqIWX8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm8ehcqvw+oYlrmarRyxcMPNcxWUoZr+SvMzWPwbhsWeGhgcEOJrHpnAKkurzB3IjPevXQNjANpROqW+/HSo5kISRPey/a2MQ3XiwF9E/aKA4ZewYRPWNY8kziW152++f8+mLGuSM4EdTBSNXGt37OCSc5EXArYUZtti3ZArD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cA1znqri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOOn4bvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63REEPbA2913800
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhDiK6qYw1rrEnW7/C2FzVLd
	Yl35djd7wNOVBtB2jiI=; b=cA1znqriAZCqMDtNOsIGJyQvxhFq/L9Kt/yQDyL3
	QBvL4h1g8eYMAAxMkySVD6x2jpoP9ryLjwGoOd7k/64gdaz5aqGfDfxswXvWhm8K
	8q+j7vr7i/1tqgL0h0PfReKOGkJjcXYpnnOQzXJSt1edf2/wmi43uOfDdTVXEIFK
	KjWBhMjqJbb1ojx20fUejMBIwSBBp96O7iNtJ2uAq3576Qn0zJ0/52MYsxHy2RYc
	fycPpApfBmwSwkOLrE8RJSH09HMbE7LF+SpS9R/EszWpfifJPhQx5E0GMI2f8LDF
	UlLSqkynBH+eTrV1QoCFC3/CD8hd2pLfpFvq6VsryJiT/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjtaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:18:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8abd6e281c0so48502206d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777313920; x=1777918720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhDiK6qYw1rrEnW7/C2FzVLdYl35djd7wNOVBtB2jiI=;
        b=KOOn4bvHC/mUtaOaRM+o/QZNbPqiTYQIWiUSY8O3M4F9ZTedYKUr10UTewqProENw4
         CT/DwLCoFSw7gR806vMDVDfRpcLoop3TcLchelpNf1vZYrf2F+T9TYF8+77K616bI/D1
         lHJiL4iwOWlCfbYQx+NFiHpQq8uOP9gYJxemP/Efu0rGvrMICxr8FUC0ZXxb2bGb/b4j
         pn9mwxwuP7kSzC8aVi7p2uj+B9IQesY0fdEWJIoCaJtRBVKAYFmHQIFNfaQF7526JIzo
         oM4b15EyTxofyteSfsCKnKwp4siKSLeH3UzRmUsLKB8dyrY+CTBudX9hFHUhq1/Qi7Aa
         4dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313920; x=1777918720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhDiK6qYw1rrEnW7/C2FzVLdYl35djd7wNOVBtB2jiI=;
        b=g8cZbTunPoLySF0LQnoYYrYm7B0x6Vgph4EDCSW4dFmjJ8e42tBD8NAlz1TRc4fxfr
         5VIypLBjCjvYbH/koWOJTBYhvHRnzaw8Mdp+kCEgqcH2myXOpgoS+d9YxnsYb9Mvc3M+
         nYR2MRshOgyAGkQDP3lAZ/zjpGlBhWAJuFdJjK0+7QP7scEhLUzHts2jlhXfW8PE4Nwe
         V+bFENRgzrmlI9Om/6JEbVhUAL3ytJAbSE9osdym2OjZACXu/bka/xcTAiZ/x1mWpkP7
         +JLFKvD7dRqERMScGS/luziENgS3+S1eu2Y359SN7542/NLV9jTECDrZk+CwBbTO5AQu
         152g==
X-Forwarded-Encrypted: i=1; AFNElJ8nvzOa+AWEG8StdB4azNtFvNKmd5DNoPdKUf9SJcOvFYOl4PVnKuMXm/ixBBbuAFczez8wQbfmWnvDmUxR@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIsXkDMt27BQ+GNd++xZ/x1/qO7KRIxJSmddmR2JnFGs+eEzX
	05w/pEDk2pxGXUUu3fz5Q8pXzp5ZWy1dVCsZkfSrvxg+2Ui2pQIWEipqk/oKvPiKL1YDA5uGNaS
	zhQhx0C89XYWVl9llw8gaanQd65ePrKrMZ+L8HmqwLF4A2k7o3+DgXFX4f0yWMk3D1MZI
X-Gm-Gg: AeBDievvvPrh0q8X5by/at7iCEzrXQRcabLDSofI8D7jKjKch6eyK4YMZsMT1vS3GaX
	aPn9C/s/IfhaDu/sJK63nSfW3ZXXI8uvxAG003kaWXpnyeKY3uZDtzp7HcAJacvRhS7piM2E4yr
	WDF2twpLM/WIcwtV5uoKrR4+GYbQIkecRQB+ys+04T1A3nnFzVFPl6I2+UOvPaWqL9ptNkR6odQ
	/lVIvI1GJRQ+8NVNlkAb2e48ZN4cFr8Yqc/JzEVYOn/QJbRDUTyvcPp31RPd/EXKYyLHkdRJTgk
	8JNSyUTPZ+0fiWegHxnWCxFwmW6cjTiPz/Y3tg94xOmUi3Iwz/W5+xAKfzhQ/mS+6tjreIODwtQ
	jfw4yeTLC+vYfu33ALZWUqqKP/rOdQC+JnZsj3iezXHHbUKm+ICOIMmM4icFTAEA1xDWeUi7gol
	rbhpaPZQQ9qwaJuZAvdhvjwpjopVPfEI4Bpxg18oeIwvuKOg==
X-Received: by 2002:a05:622a:a06:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-5100c9c1990mr5796221cf.40.1777313920410;
        Mon, 27 Apr 2026 11:18:40 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-5100c9c1990mr5795531cf.40.1777313919851;
        Mon, 27 Apr 2026 11:18:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ca0sm8312126e87.65.2026.04.27.11.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:18:37 -0700 (PDT)
Date: Mon, 27 Apr 2026 21:18:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
Message-ID: <daceahzxbmwmxxnyvx33ojhgwr3x4n4b755sysaz63brvw2qih@zcrybuy32ozq>
References: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
X-Proofpoint-GUID: aRMg7StJ_5bqplCT9kTCIeC3_-lVsY1l
X-Proofpoint-ORIG-GUID: aRMg7StJ_5bqplCT9kTCIeC3_-lVsY1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NSBTYWx0ZWRfX7pbW/UuqHzry
 a1L28hsfOPOuIZ7/GjlYmaehP3TM27pHUrQxLsDHhRuQXruB0RnxfhV1HnaQ6/a5m1Fb0sFNWAc
 dZW15cR1AZ6BvoGH9YbW8QTjDFKm/TZ8UX0+QmtXBR8lveuphzA+4i8dTokbYZAb7SJC+SnKW/l
 3tkZ9l/hmsi77K44r06WZ/vkkz/qoyCelRLyTMTeqpUuLdRkAE9Suj7SK/WQub4KCSPmbpVS6no
 KY0xBSuNiskhcPw7yr0p76aQuYWV4vpeYWFwD025pd2AS1D2/3HS1dLzRbTcJ747RTcZzaDH87A
 /IGKt55Kg2j5kMGtWuG18ooZUtMUmfy4N4bezyL0JzWk7C+h+LM9rRGpVYpiAa7s9vRpYGXgox0
 2MxjqQdNp8cF6mz+sRPvLBxcYUu8Xy8Cymu4C+e6BzD2eJLsT/9Wz9cdIeA/utzlVvFkI+Nsm8i
 rA8K4uBiSdlX2zb1wpg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efa881 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270195
X-Rspamd-Queue-Id: 115F1478784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104807-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 11:23:53PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for hamoa-iot-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

