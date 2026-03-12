Return-Path: <linux-arm-msm+bounces-97248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAlANHDCsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:41:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EB272C49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0DB53026D8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28273C7DFC;
	Thu, 12 Mar 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNZwPxTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JO/PQToa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0433C6A5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322325; cv=none; b=Mi2RoVd9dIX37mfUTYJZsoG48HyTzcLtvbg5GPcs38v27fwYExa1MJzLSR/56B4jHgmrs8XyOoDqlH0FkR5NbcsmfPgSMeLQp7caY8bOKrLz1x6+A1VLHYJAxdJIOg+MaObmA2Vk1C2SOlfJGL+Qm89LLmZQaUSRTAvYvRhRiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322325; c=relaxed/simple;
	bh=oli4SE9DckFcQdJbcfZE2q1jOchUAMaYwQ7SjYKQujU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT0xCkHzosXF8yU7+Vk05UsnOdmiZv7Hmy+JuFdDBalX1XTXWj7OxoDuD+EiF2s/rFPzdo5+91f8NGOEwTVwBHrV31Dqn0y2x5EEdmAtx59ql55Ba2GQrYkQm+Z1ODQwOBtK6dNUDlCqFzLl2U/qAo2wgWnly2SeQmfH/gKxB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNZwPxTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JO/PQToa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9LTia3137213
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=; b=dNZwPxTaZzKoDxTF
	Z3A3erSeuSxJBzn3mbGY3ItQvz++wVq3sUzD8RuWm5bgG1oC1ygpzSoffTgVT34c
	uA9AMKJjh364jYcu8Xb7jVy5OiyLeuMLc3FhQCF/WanIvAbjh1n+/Mb0cdqsHLaY
	niRKn/b7Gvkn3RHGszYWniUAH/4O1MVVad6ja57+0OL43s/PY1RnpgcbgF5+SKux
	awqOAHcSO+cKIuUmqdpYnkG55XUpe7/WHXQIupA55XH9i/MgIP/dBRTGCylxX4HI
	blwncXxciaCuoaAa+vK5qNslLCZfQYdElTrorjJi/NafjGVbqDr1RoYJG9SI9bCO
	YFWz2A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wa7r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:32:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948df60cec6so1766689241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322323; x=1773927123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=;
        b=JO/PQToa6ad0nLw7KTTB8CZrna635H5bWU44adFY3ZgPxP+GPtM+Y8LwKSGprjfmb7
         eUN5eZYbF2fCc22I+ltHyVVo+qS5JmWjCVGebsPi4vRrQmbPkxCXf3sxcDYbyvZEKAYm
         zjnJjvaWQ0RBJc/ZUa9i2MuPVK8eiOWbIIfqpmu24TEGN5ddr7B8W0wMx3aRexs72Bfv
         Q4wDKvqy8eXTOPwLS5LNzgigTUMu3hL37YJqEZ+cHKcfqma81nV7pWHHqya5IAP7lPlV
         fnlc/Q9ssxENDWpeFD43uW2jI+I4145f2TojLRqMfg1lbcszCQ8+gnMxyNrlQF6TbE9j
         Uk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322323; x=1773927123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=;
        b=Tx2fk03/FTIRx3cCzRkyd0crKUV9GVQ0MsCE1rmHip7PT/QF0nZI41jJYO2KoNq7xL
         MAW7eu8d49RWZxtOuvp4aJ7gGskT2rom/vwARxBgcJsELar6zMbYuqLxp/OkqibMEFDz
         pU5nNPHqyWQ5zQ8U9tYtanH85gfAHzzPoFoWKLL1cn/lZceFbKBnsgt/Fd1mizs6Ewp0
         iO7YQAxFFSrrv0hNTYJvFGYyobCSVTkwIkUEE1iO2QluukFH3FBVIWuA5WzUtNuizC9W
         VGqXjmG009eJDPofUXhfxY+4nUXky7xbb7/NRqNFMLwpMUDfnN16Hamg/hnMv6mSw+p3
         be5A==
X-Forwarded-Encrypted: i=1; AJvYcCXGYxAbJd6v759t7QxdxqGfsvk3mQe6B6kBnT7NVSN4PpL0dKS7SwRPam3sefCPhCxaKj8RH/xmDv/4R317@vger.kernel.org
X-Gm-Message-State: AOJu0YwROKK0oZ1bOCJQl3yr3FQDALb45XjE13ksbbqQ4Qwwf6LqdvLp
	CJau5uElWrn3CNAVWPljpkC5/VUx77byypXk9z2e09ovnG0XPRLWnaekWH8cWIsBQHmtG2N4rsK
	BUzcpTuua433A/RCBEjIRHJPxYcAH/A1W86eoSdHO5pg7v9cazaZD+N4P4Dqk5AsY8ZcK
X-Gm-Gg: ATEYQzwtcHnBeCURNB+Zr3s4M5Qb8GSZlOtcycX3ylH79TcN2r6bTbdrPVzQVQi+IME
	+OFW2WVNpjgc5mSvTV3V4gwWAdNmRdetuSmzkcoFQvKdSFDK4N4as2vZmY3Rq+h0V/S/LVPUToU
	9Vh/hf9JA7XJdAZ+3A0+fW1b9RlKYPp2UBMbYZ7oOTPxYTLyUyomQTqBW1H4eY2k+i3JxxuTVSh
	ENItNMSMNDYhrH45nfVAH9nhilRsE+WdxDzjXaZEx/rFfZhDfjKNe81aB6jQUa8YzW3Hfhj2c98
	W1Mvl6UGhEb00duCitZgyXbyS503ABcXmnW42v0Qyqcbb2yu+pqJSeasgORrKLHWX/Xo7q3Rthp
	wnLpJvHPuP2yVoW+bJfNz5xsPwb7GaJk4i9nx20+aHKi2MMwAyd7pIAaCSif5Og8NKrYlDC+wWV
	u3lVoS5lM1Uia5Jr7S23/ijU94+IStm/My+rU=
X-Received: by 2002:a05:6122:2a52:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56b47438c2emr2410966e0c.4.1773322321074;
        Thu, 12 Mar 2026 06:32:01 -0700 (PDT)
X-Received: by 2002:a05:6122:2a52:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56b47438c2emr2410621e0c.4.1773322317270;
        Thu, 12 Mar 2026 06:31:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8656281fa.9.2026.03.12.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:31:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:31:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Message-ID: <vjpnt6xefyssqlaivlvhtizlnlw7gfsmwtexcc7ukccwhgfeet@egtg6oe6za4c>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
 <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
X-Proofpoint-ORIG-GUID: cktCtn_sF8KYBbDJZ7obiXC_us21eVuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXzdFuhXtVoPTu
 h/ns9TzWCJqzB6IkfHGbw4jzax9yyveIsTj7O0nGMADsNsAwGM/+TInjt4wwTI6f/raYwVC24OW
 3efwrv3W1sZGsfG+mBtWAlI7biyX1MuZfChAaKxcpk1F1qG9lMlR2QfVgZohCX4/PxbbczXXCLn
 3p197sN0G3Xz00A2G1LCY8TJGCdrXnmiGDFchZPrsuq/pKQU6tq9kNG7iFBhMZo3Gm8ySzF1PMK
 xZ6k4/kTxY30vhLtDYVEexqIrAiMgmxiHaN7jce/e6V12yh/Wom6s7W62iMSLll9WyH81RgoJGb
 rm+lR9fZbqkO9zBhj+mEE3Qe5YKWojQSdlLiSjhsjFwHssUOEI51k/AoE7SsjYZpWfjawCh/ob5
 ENBqpTSgxKuBV7FT5PgmZL9+7zraWvSjEU+j2Y3ffyjrsBnEL3B4huraIjEuC73UxItWzL1wawG
 tY31/ruMxXrUeolhJ9g==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2c053 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bqK5-dEd6McJkE9xslgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: cktCtn_sF8KYBbDJZ7obiXC_us21eVuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97248-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,protonmail.com:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC1EB272C49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:55:10PM +0200, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
> DSI controller for the M1906F9 panel.
> 
> The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

