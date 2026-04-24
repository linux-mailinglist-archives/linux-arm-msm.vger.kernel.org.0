Return-Path: <linux-arm-msm+bounces-104424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPVAMudH62lYKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:37:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D045D346
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212E630793F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107C837266E;
	Fri, 24 Apr 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLr0pvz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH9WzZ8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F336A03A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026684; cv=none; b=En1GBJk4SESq5ddfGVezSu3MEb8dTlac7OmzGyfFUYWL2D/+NlrOsgp7bizvE1wcx/XfFBwtgolo11eBkGc530Vxm0sWPyFtVOxLqQ1pF7ptzPCuXLaNxk7k3OrtAGeKQyvhvt+mEBg/EZxgmSxi3j+ldLVrP3ZU3wb5dhiStR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026684; c=relaxed/simple;
	bh=PN79pQYU0En1xYe9D+IRKMbvoUqMajBOh8B1Txg8eHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxNQQp5j+I+O/fcfEu3TsmmEMFMifUZCCN9nfBc8CA9dT8zmNmmrKJnDJyC0hD5VzAz2Ex0Pn9qpjjIkCwLUTcZ/XdKb5Ej8mVF5MIWHqf30npYdVC/2BP3gFGs4XK8Z/+HDBt5hKUjuC7Egeupjdb614LnYtoBjP9v/beMkWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLr0pvz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH9WzZ8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8Nl4a2291596
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7eORED+9/+BslFSauOCIHw6f
	S43tga0F3hzdxbVP/sU=; b=FLr0pvz5chPV0cdTmlj4y5X1fDorKDx6GiftLL7R
	ON5xQIL66MM/chO7m8Qiy7FOs4iOeq94VBQj09JTqXjRz392+Zf6YWe5VlbwrHYw
	/tyWwx8iGlreukydk+ZURNKenGyDIfC1Q4mhSb++NF5jq0zq7m0/x4X4PpLEfOec
	HGPpkI+hpT8lQrLWx67UEmrm2zdLoD0fcn+SX64/nY65xes2R4QzVzJ5ubXcF1Ga
	VQ7fL/TSESk8YYugd7lQd8eZ+AWZkgD5Vp75/zPFoy3VZFAJ/1RaaEz624eCkqqJ
	kXQT3s8a73Mp0qJupJ1Saw0SnKFLfkH7TPwVUyZr6q5TSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbpa0k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f66493ef1so3997794e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026681; x=1777631481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eORED+9/+BslFSauOCIHw6fS43tga0F3hzdxbVP/sU=;
        b=RH9WzZ8t2yQRySoewkzQ7KSqwDkCwc2i5DdH9C1Lz0Og+fm0CewNpOkodeGQOuL6h+
         DSXzl+tuub944moI6YEFdoZqb1on6IncTkHGmD8LIQ7sR4zobj+TzuhNoBhED07j8AsP
         kMzWvFX8s0zxmbREBLMnLCEAeT532zUS4GCbfr04sgUgynxhFmEOxK3wAo1LvzrmqfP9
         wdxhKsvMbd/pxeab2OEnkjYDPSre2LT2Qa8GolUs30ot7C05v5TyteTZX4orVTnPonEL
         qBhi3QzwrFw0U6qtz+EUWCkLEqqiumu02b4r7DqsPKNjhxKR5HCoLS+GHH1eh3L+9Q5U
         F7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026681; x=1777631481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eORED+9/+BslFSauOCIHw6fS43tga0F3hzdxbVP/sU=;
        b=atoe81fipU2l+VY30uhlYODlSZhx2YbhLECW7dWqklu7PKitRNu00MA9rAoeUZ00ES
         oVVmw7hVdudNgYTmuohCn8O2S4PYVUHpBrJKWx0GyshpfTOfmEug4TtszDuxMC4xFSfw
         7kMCbW0jT8Y9ZvGVmQ4aL46Izx8TRSECBA8JVwOMgePbQGLjenavTuPgvYcaODMNDLLR
         HidmIA5wSgmp/Pbl18NqJkYOPw/q4v8US093lJUBCB4fypPfwwiVj+NJVRfTFXIouhne
         KfvE5zv7Q8J2WU1oBXMXw0RY4Haf+MINf7GFyigJBe4yr2Nv8psQvY+uB6/ZaL8pv48q
         1liA==
X-Forwarded-Encrypted: i=1; AFNElJ8BdmMAj2NPdTKpB3WWw7BEL68kwPPeNu2kLAbeBuvRk8j+hC/yvAbRd/pAwHMeZen4l08HCIjcjj2ILe5P@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7QwIQuv7L6L7J3SExnzMUL/KGAauO4xqRoTOqeBoK++Vs0vn
	l/D/vWanwYKR6zcJfLPfBfVBiqQKoZ4hlRiOjkBCkTVQYNKND0IpvcmH9rHXjSPyV7ZY1BBEgv7
	W2qxmmaaNwuH95y6E4cLXwo19M7Pxf2lb239LxEXTeNrdYIhqHIOrPn4tyjHVB3bc7Kmz
X-Gm-Gg: AeBDietPb5u6YUni+fPFJU0J1ArWYwFizwo7oWZ1FeUXEQI31/9JWYMK4zfxnyXGmqV
	aaq49LromsTniVhza2Xxsiv3y0ibs5jbbgb8H1PudlUSiPDBfRi72w2FTBq5ibMsgsmUejQ3ikF
	wAv3xkWLGhQ872br+/qAAs1Y+RtJdWGbFSLkCsC7MjdGe9ZhbEYIbWOGabSu9EeXnmpCg8HVtqN
	kbaIbYfBf4VKCdJjHcYZQvK54ipErGNPl2NJ4YRRA23vP5c7iOa/H3yYnb2kLgm1QeqcC+yG92Z
	7nPzV51oS4vJxs6viv3IQE2TF3kJExDOyIWzafbcM75531nluLsVqagdBg3XczqQ5HWGpfpuA43
	eyYrLrKs+KfWFnemfV4R8M2hyHjyay408TBYn9curuK8byDE=
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr11361009e0c.11.1777026680938;
        Fri, 24 Apr 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr11360971e0c.11.1777026680323;
        Fri, 24 Apr 2026 03:31:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75a913sm177753365e9.12.2026.04.24.03.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:19 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power
 domain to GCC
Message-ID: <5vwqco2zbhzb7phdtkvirytj6p34ig3ab7nm2x7jlsj6domoa4@7exxwqsyxpss>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
X-Proofpoint-GUID: xX9sQQKwc59s1iB-2sAJnae7-E1i5qQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX3LtPlQmLYXGC
 1Jcgg3MZCF2pNa9CPwrH/myJP5m8KOmKS/bsq3SRbybKLYwOirELNNwn9h+X1mHfyvQ0KqCbTUC
 6JxlHGdYSzW60Qrv+wyq9ECRXRuWOeCaGHKiCWcPtu/W2RF94AnoEbyOsXoQGv1FZyBuLaBm2Ig
 XE4881L7sUTK31DsUltuwKuHoNApcF0UUlzA5K/9tZKK+0MBvR+DBQ6Sz88OwkIVVEumY3YlR5J
 I/lsmrm/0lKEwOx8H5+3whx3eYovKnEq9uqbmYZXksl+aDPoQXhw3UYZpFyvD/AeX+Vx9b20zWF
 wmPxm6NEmvDxp+wK6krvBH5gh3Xfl67MD7a/1JDGa0NzCV/QO9DsHBlGTn7pP0IsLayn9TTwNdc
 dpi5OvoKjA7oh6yArzVIXr/yXeuHoxcdYV/6hQviRfZrMsFmaeXyG8WpfCZh4PsKYEOdcX/A1cP
 Wdtv1Epnl44UWRRCzXA==
X-Proofpoint-ORIG-GUID: xX9sQQKwc59s1iB-2sAJnae7-E1i5qQW
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb467a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240099
X-Rspamd-Queue-Id: 212D045D346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104424-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-24 11:08:00, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

