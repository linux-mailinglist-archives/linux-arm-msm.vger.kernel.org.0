Return-Path: <linux-arm-msm+bounces-99611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFMaMrJpwmlScwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:38:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E38493068AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 190683009809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22A23D4102;
	Tue, 24 Mar 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe6ghYhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR0v01Va"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527C3A4535
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348443; cv=none; b=izFm449e94qLPXkGEwEG7QbphwmhbxsASs6DQidPAxVbtrVRg0e/wBb9upYtippEM6l11YAjpexvAo2v/55EEiQgOMa4pKZKfvgXCBTVl4WvL+oHhGzQG03snqYSAuDIELL8MOVXHfMhiCLbiW75PKHCgkhdaAKftxXIxhhw0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348443; c=relaxed/simple;
	bh=0XW7qq/cYCeR9OCvHLhwCJaTaNC5jevWMmJPP9v5ty8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGY1DlpCN319Y/SRDRSc+9jFBAx07XTX+aUpyOPQ+ZWAWlxdGhdjth8S1i5JTqzmry2YSXnoNfi4vbW2Q3CMinn8TDvNDFftiBHzL+a+vXzI20ZCXXLtFZJbhf7cZruUlGZScTmRI7e5o8g1ftjuDxmYy6+vhTrrHsTAOj+KLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe6ghYhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR0v01Va; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9tvh73903733
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=; b=Pe6ghYhQNzOwwkOS
	8Gps9Fz/tTbU8hgNy77E931fsS+tBNOCA3Acu/yKP7wELYlCVBJ4PsRei9fqQpMV
	t73oEnnZInzoySAhis0ZsPyYjp1NUC6GCPVLam6MDg4WjvQ36F7AD6FjQ0Vn5UE5
	Klzung+YGfqF7gmuU/XE4wXiBiViM1UbHRTBVPN1QmhqMkByd+IQ9e5j3/gNnMEw
	jqZH2MKTn1w6XGNq99VW2skJGYy0Qlj3BEAAEr0xmCYLqQWnpklS1UA4ZCvaOriN
	mG6P8XivfGTXAaDfmcgtuOuqNPGBX/JTSZQ/gdQGZqklZUozBlJhMd3KYnlzMb7G
	m+TEwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0heud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:34:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a82f78a20so18840610b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348440; x=1774953240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=;
        b=AR0v01VaAegcbc/+SG/xqOjkAZMKc6lgUwoM0sVlP9GZBXO6uLR7jnUvRsEEGWBNqf
         iE0Vsbj+fFzSSvGRti8bkTwXuM52Ry1sx30aEODGLliNriaaEw/RLd5Kz1GSGAlfGhBs
         XgswrYZLBg5sXFgK7VbCZw13D1J1V8ij8brM2xP/Elyk8nqM+nSnZ3FedC0uNx7toqs+
         ul9H/IqoXXS4uKMrtHbTC2nCHNSF7DOSGbGD//ifkZIxyeEIbvlIKMAV0XiG/QWLcbBI
         sNj+Lk6rcJT+/BemPvJiPytVP8Cotjt/2AamaBjEu7OTdKUP0OE9yPJQTwJAUyp1oLeU
         aCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348440; x=1774953240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=;
        b=pEWmWGZ2PekMOH5BLdA5c1DlipRIta0raU/io/aA9R7LOD9i1S5TfxbS1iPzZZXiVN
         MydizY7Qn4fv7QPT24YD0m/z603s55dcYgn0TAQo+dsBDdmf0W8NXM/icZM1tzsp+jvt
         8vO139Bs+tuVhbVX0LXhPe1wM3u1WqPrTvHgavIF9fDMK5PA//5cSspw6hTL1hZ1bQUM
         Zzrtte4EyIKnymhCYLBOlEUkv7TLPKioDOHubNVDppUeyLsABIoge2UW1zLw5XVadvJV
         KNY90dQaZMBS/D7FBCY3H13aMxNLIPiwlXVt0sy3xwhGRQZZbw9Zq1G1vJ1hLBis5QVp
         3SLA==
X-Forwarded-Encrypted: i=1; AJvYcCXzFBhhGC24KbQtLncodCvGVIR86XDFylzpU3sUynIv4v5uCpVNEPgf7Te/37sl/5eXxe9NbNBUo8BBrD2N@vger.kernel.org
X-Gm-Message-State: AOJu0YxSag7ZpqOTEzq3r45yGan1t7ZwqXMxwhnWWz32KKD//nFySgzT
	jr9EBGCtbq2xFoEOFOymMjlyBogHnP8y/JuKpV3AnSkuLmOsP/L5COmLDxKt93M1f73MUrWU0oo
	J77AAQvov/7KfMnGRa9ODwTnowCNqQf6DgcJViUwHDTeCxbBjtLLPLt1uKI68epBS4nvt
X-Gm-Gg: ATEYQzw5JWMil3zJGfguVfJN+Da4nDk2DMFm7JL3sGBCRC651lrUdqSQvaWX7uUYCBJ
	Lt4i5f3MRzo2oAp+3YQYMbVQvs8+J9do7UcBqltXrbGXVR6bhDrG7qc6Vo0xK4qOod13WsBNkcV
	yTJwhs8JPKmRVoCxC8OSxCWo0lPGK7nRvBxFVpyfUe5McdyfX9gYmFRTH1bWnplR3OHkCE6N89u
	DzMkdZAlsqAlf/n8eKpmEILDhqKDdnRgvn70bvKM/8k4rwQ8dUC7mkUFYAxrs/2N56VE4DeDyRn
	AHvUCd4UrlwDpbByVFk+bx3/D6S6JRe1Tpixei7+a5tpBHqMppvfTHFJDGu1gT1jJP6/RBX8rez
	I1MpjSD3OvHbVmerNu8pLfMws+VqHS8A/jRBkF91Nt6NGfGTuma2t
X-Received: by 2002:a05:6a00:139e:b0:829:9382:50ba with SMTP id d2e1a72fcca58-82a8c3b3bc0mr14523348b3a.60.1774348440320;
        Tue, 24 Mar 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:139e:b0:829:9382:50ba with SMTP id d2e1a72fcca58-82a8c3b3bc0mr14523307b3a.60.1774348439776;
        Tue, 24 Mar 2026 03:33:59 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm13264445b3a.14.2026.03.24.03.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:33:58 -0700 (PDT)
Message-ID: <9c8dfa88-f820-438e-8418-4919e1175edd@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:03:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-4-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-4-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sKusM5WTcDnMGIKhQbsBZolqhhFfM52N
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c26899 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sKusM5WTcDnMGIKhQbsBZolqhhFfM52N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfXw1VU2qDl5msi
 cB47509ovCM6tDh55UYQTLVqjDDT8kYtwK94OdaFoO4GJQzA256E2hSVang6Mb6vh9H+rzHnS7g
 jeAzpvdhjt4r+rKMgVbDfokX5TBhAJ6TaxPZWT/Wb0TVMdmZ2d5ezGfXThrdOHLZka1ZQZgf5Ak
 fgd4FozUe9hy5D7HHkmGoNRXijsujfWbyeNWmvgoXek51Ex8M2Rz90JLe+HzM80wTHYOUMX3rya
 Q5iZvw8U3Zoov/OjK7k9R/TktY294VtbIQ5hGZI9uPNZA0lwd72KfLsZ87g1UEC7N6Ytn2PsmEc
 4DsczFVwphBwuiLyJVkW/aTFUntSUm128Dz3a1y+1gZR+TB5kU+It+Df7vXicKwMakttq7Zu1gS
 gxMQRtDIkEihq3GPZPk3wcvrv2tYVL5uoOXhIKcqKoSuG5ORGXN3rSL2me8q4eYMAIIbMReoMHU
 +HliP9EeFeHlCXBsvcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99611-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E38493068AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.
> 
> Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


