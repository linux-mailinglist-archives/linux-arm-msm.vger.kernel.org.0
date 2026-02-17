Return-Path: <linux-arm-msm+bounces-93168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJEBORBnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:03:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A935814C4BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBDE3305FD9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23E0357739;
	Tue, 17 Feb 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTzlayDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9uJw0g9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA5D3112A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333227; cv=none; b=h55Fcj9KtFu/hNyfByzGoVOsPupZ+fLuOAJCZjc/z7nPaB7WiJNnNwoOmfZOHXjadx4qdcfXNLO1DSo4zlH9ZQp8uIJdU/Uc2yFksSTFNuVXVqqEu25d2+K+6yXYuUu0ZRlsNozKQE3NK7W3liMSwNryAXgZlAeWIawEWd5sMRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333227; c=relaxed/simple;
	bh=38zneP+037Vy7Mbk+7KlLjFuG+3hjob8r72QOd9MDa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pww32W6+Z2kQcQSA6wqfFAmKl+3zxX6suBucwOtE3nKJpnLqtn3Ehwb4Gn3bukwgWMSij7S/74GuQyrisO8i4xzf4goB7yelOjmg4AWEDgV2Y9K87NZSu1bDEowTjCNNhxghzlsBhI637K0GxQRc3dA6KL5KG9fSXn3FYJoW4qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTzlayDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9uJw0g9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAcsUY598036
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=; b=DTzlayDlGdYju8fa
	yAFmDByAinRgzVfM6SWSMPjFxaivGX6MaC62mi/4vJNmg9s6XeqTrmXRUUbv7mtr
	9dB3bd0Octj5btmEE/Ad8cpF1BRoB1IPLak7Xop6n14+mguArVSQdTPOMC+mqNBo
	eQYg7tRT3tUredzttD2SZQ3wViNImzbS2o6Xzwb78imntNPA+AgfzcWdELY0rZn0
	57Zm2zmby4uBtrtWNcdTI+E64fjXD/ibKGwZ369VOgipC3uNsm1GET1CZaZx+3NE
	yFQQT6tiOW0nFY1+C3XJhHjfTzNqgrRUKIFvzyj5eTUdbVFDAISE0doaGJGQ8VyP
	VXhxgQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361vvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8960257db65so31012566d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333224; x=1771938024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=N9uJw0g9CoCHNeZTIOXZio5zIPgU4II2BE2quZY3UXh4sIiHFw4h7bvTmzWF26qgUr
         CLhQAGLFHIhywZYORfC7BoPZMxZ3cWHl5ESfNFiaPq4l8mX8R+Kz6D9YZ9UcxjuKU5Nj
         nh20bjre//W8Z0zNL2b60A6IuPdTVvGUspYcdqfp0CX1bSj8PlyW2PZmnyeeiRitZm4/
         TbR/IyjXf48c7lMO0gl2kXfoWMFeU9blptcoEh77Nylw1w6ffcNApbZ2wrYrWRlg7eO7
         gG5/uqm+Yuc2/HIt/8JW43mkfWUTmnAt1JsznmX/DdGhAcl018rfizcR94dsvWu+q5lP
         uC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333224; x=1771938024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=LIyPyI3sxE4WeDHKCjOEYL3PR7vavI2FWfBMsC6TQT73iI+MmETFPVzL+fYf4m8ILB
         Wy2oKCPl5Mpa/TYEEt7GNPLxuR2n0LKZ4PDGtbSKjQcXVRxekvOm+hw+KpWxTBtIqt2e
         aNLtKRHm70iYnO4mVmBgqRS0RathE9J+slrH10S2ndGMqqnSfzcNEo0Un5awE1WdSye+
         5kdqdMChlycRvCA6/lhcXFAGjQLLrc38VHAA31/82nQRfTU10zTjxr2MrXMcDc1BeIRd
         XIuu1KFX8A/3X6N69wwJTRIMvSoXPQTSPBcZTQK/zkAuDSvZl+e4lKYpbOZcgW/UD6o2
         tvHg==
X-Forwarded-Encrypted: i=1; AJvYcCUVvF9uGOVe0n7lqM6vALKBI1xHC9n83QMkFFCIUxME7ZDCIsKp4P9QXyIYclNFTdVJDanYGqoCh59ORnPl@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCA0jRH5kVShU+Ji4/hJh1mPKNoJSCfzxJNOgNEgRj/rHHv1S
	hDUXauUqf1uZMS5Ohf0f5kkgrEh3VBAiPagVm9rh7+Y2vctQhU4wrmeVqmUMHN6fz4XkSjKv6bM
	O0v5YfkTnG2rkiKToMJSAWjNjvEzHuo6SMU9wiQWGBNJPMZhr4RnwVjHNuDM6c0Qv4wbCeDdsf5
	yQ
X-Gm-Gg: AZuq6aJQUt9fUvvN2VcQzpqSXu85nmTIVEr4n6StqS0CZsdxvpYPgd6jgUobhAlTcKy
	gRtL8xoYybPeEf4TJbV6mr/sMDpMTJB2u5vMIju3Wqitu72buoENONuJYtNtMpuhJKxOmj70lJA
	HrVL8S6iNtv1R3JiOZgMlZn4sDNoLEnKptlaQWCQE29GVh+Axiiyau/JGcUP0REZeqhbyMefCiT
	8fzxPpGbEiaJcqICmX90OrHaQl7Z2dTJQpoDpFuvOBNi1SXVlkKici1pFOHZCjFrmnanRy204KI
	TY0BdZd2oXOpuOe1ejGVLN3T5UMHllnfoP3Ejrq9BreNwqs9z6tsqJaX9NOhhh5Fjri7EkieNg4
	W7jYviQ8xCbWdebozKnKCZvgIRguuxSyld7qiKfcm22KIlPABD77x8niNnWNLzTjQ9Cg6gbinLA
	kvPzc=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr142991836d6.0.1771333224370;
        Tue, 17 Feb 2026 05:00:24 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr142991386d6.0.1771333223961;
        Tue, 17 Feb 2026 05:00:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7b8asm346310366b.27.2026.02.17.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:23 -0800 (PST)
Message-ID: <fd9a728e-51d7-4c8f-a54a-a45b2ef0038d@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX8Y0VvJhjYo4R
 +uKMRnz0v0jcIlW7qXLqW0vNJR/196CnnH1tjAvnxQRA9vY8ZzOEoqTzaz0OAk9txtnez9/c9Vm
 9NvVMnHiWhY15X1CChwwePnfFnQyzbaBK58l+8k7YfOEizmuXpZW3C9P519GH/Vq1vEHDn2xFpU
 r/ggtnC9CovY/yqFEVcU0Vu3fSgacrHeao0gNSW04dEnyuIwh1VBVPxyfLwF5zJsOA00yYbZ/fn
 7HsQjaDGsWNuZJcP0PH+QijFw8zki3LuinYNsPs/vbhtVzkS0HJM9oEEqIykCY6QhnpRjkSexrP
 lyFJmfRvz210PvCLmCOALf8xrMoWjgIRZy3P0oCEUC9BjoC1tdh/CJ/oapuAwGKn5MkL0VNRL6D
 1c3kbcXUdq8W8iaksGrxU4mJ15IGzonm1f7tdF/fL/ASLmketTIsG4KQE6zagmNZrgECBdv88iZ
 PfgZW9C+Lv5ewScSR7A==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69946669 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Zkbktez0t0WzskmUNUcR0wzzTGce82-7
X-Proofpoint-ORIG-GUID: Zkbktez0t0WzskmUNUcR0wzzTGce82-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93168-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A935814C4BC
X-Rspamd-Action: no action

On 2/17/26 1:58 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

