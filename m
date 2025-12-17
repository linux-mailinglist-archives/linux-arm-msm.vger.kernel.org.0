Return-Path: <linux-arm-msm+bounces-85473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CADDCC7479
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962A73016DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF21B33B6D7;
	Wed, 17 Dec 2025 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S32ymEyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdjQge77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA33358D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969709; cv=none; b=uFn3wtEaAOJRdxkqd9u07JlOQt9XHNlG1b87TISsT9lcWi/ArnBDzFvAC2EZsvVNax2UykLsZtoNkSnzeiP7vorySdb/fKW9JvywOlqt4feQuUEh1Fc7gvE3nbCLY71DTNIUqOab7KaOs1xNQA0LxDI8OwI+yjrEz5IaeQ+b4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969709; c=relaxed/simple;
	bh=K/P7eHTyZirO2llsqi8yVIiX+WvfeZNaSt01B/NBwkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/tvwkQ6x30HzOkQTaxyEOuex+WVF47YmoePkACMC20qoJUoYDjihcnzu1Z1Ec7HRCERzpqpc4JuzzZUoABhItHXq7G4yGXUfblfEQ7C9kZviDGvsJx+ceg1ToUvZjqAS8/Qeq3OqEYdeLw2yvnCz4fsRmrNKM8t12RoyexT2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S32ymEyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdjQge77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAP2ec1215364
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wAhEmJDGrw6aDE9DLS1cD3wr
	e5yQt2IBwsU7rJcpATk=; b=S32ymEylGEQCdDDuZSNb0UA76mELpafZpCU0buKH
	IEd/kVe5YMOpX+Uq4CS5+G+WE8ufPwOKDF7YcIXYhkrcn6T1q6RuE+8z06eyrt5T
	g5QWN5KQTYPtbvt/d+PoLh85YIFEC80+xyN6W8JhAFSOdBaRgVM8LUamlxCLimnA
	RyFPTkWAUyjJ4dpQEfejgPXdua02UerL/OBVPOcq4CRZOGa+pkUMNHYBRNraSPK+
	rsvnI8AMrV9NQ3M4CIKOTRgtF/4pB74dDWvPCBmUMCDXF82CqRuPls+DTbEY7Au9
	O8/xOafSpS92YAeRkBxOsU1i0GZJ6Tt0zYSjt7K6PCrbJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g30yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:08:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee41b07099so67062081cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969706; x=1766574506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAhEmJDGrw6aDE9DLS1cD3wre5yQt2IBwsU7rJcpATk=;
        b=jdjQge77DAo5s4baHEejoiu5LKBMQwCFR/oqfw9aUQUhQjfU3jQcPineW+Wp6S1kxy
         UCGD+vDDMTWcXoGvIJqmg7gBtOIcuZ984+nZwdR/kf2Wz8+kKn+1/F6nF27ygnZqgSvY
         FKZ1YIrtS0PIOl13ty9JhXplg0Oy1uYRlF6HilAsLnlM7m5MKudoi1kdsy2qTJ5U8L5B
         IONMFFdKDEPOXWI09bP8fx8Y54LZbxeRjj2RuzuY7cKUk40/8KkmirwQLvGkNsncK8iG
         S7IdqnJxDKgoxAxfKHRptPAlrg6qppHOPp1U5nD8Dw/63W7WZ6cf0QAzI3qZ5XtAv055
         1pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969706; x=1766574506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAhEmJDGrw6aDE9DLS1cD3wre5yQt2IBwsU7rJcpATk=;
        b=Qq7dFaJzQgprXPDppK1trmXMMRAEmFKgnjsu3xQMbqKcRuMCZWeO8lGxjs/AuzmBJ9
         SR+FWAMPL864cvmlttgukv76EYd496LUjjutwUJh0rMh8lgwJ/egpjmCmrxDeXBf2JNd
         f+43Yt48vdi6A1+OojW/kK974UHp5tefFbZ6/fQUISH/ECrHAMZQZeEe+vx2nE7/BJOc
         NUyeZsQoQBJvPMqlC3f4ho6qy1ysi7MRp3lMhp56h0zbgxrCwGXphR49wlVeLl0tSccx
         jYTqgctM9yCYGv64cvrT5YSyPsg/tTtls2m9eo55/UmKPP/R4yma6FZXvc1hyXo7bEZX
         BBWw==
X-Forwarded-Encrypted: i=1; AJvYcCUmdBxcciTZeSkrmvFi7hvx4/rcWAjt7Un+1ilcYAANVtFFe2lQsx43Z/7NBKziaX+zJnb/i6UnpOqg6qZl@vger.kernel.org
X-Gm-Message-State: AOJu0YybhgGNoG4gFPJPui1+hTxjH68mqxWIKtnpkjZvcZ3Xe+9D9Y9h
	UmGUE6R+6q5Y0QBMKuKXLlgCUaP1FROah60Uex2oxUp1ebG67DP0nY6d2ynn413uC4uWnXUJbd1
	o2h0/d9MJgPLypTXSXfphgKFKVTJ597CQi2ciLJCexlObEIDtHQhxUCww2sBD0o4iKIngVdI+sO
	OH
X-Gm-Gg: AY/fxX4kpPyeVtVAftNaU58YOd+xQDunrf2Og3e5VYq/4Kx1HCOmrZv/A5IErcJJqp8
	o7o9hq+Si764hIP6QF7avcJ6ek/0Sm9eNoaWvgvzGKj1aw5YKcoe2CmI6IMLIA24RvJU/221aS+
	izJ5ET+tgmDLrpNMdNe4k8FKI4Rx//LSYVImlkVtt/e5/7eZd0DnbOaN5mwOca2lnqZ74yC6mnd
	pvjvRrXUwVbiF+fPKa3KZg5Tkz5E3iE2FsiznXuEvddBvC6JbiVNPo8falfvS5uyMp5/k3nNMki
	q9vfFT3RMS4bSfj2lxneDDocUZRqcLKONZGLpRMONFH6cIeUwsc7geIrhv1mmXyAmUnqdJe6S/6
	VVFbTjTCYI0p3IoSwdlq72Q==
X-Received: by 2002:a05:622a:341:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f1d04aba7bmr222878781cf.1.1765969706299;
        Wed, 17 Dec 2025 03:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRq0BGyibu/ddoyhTl1wr7+kskB2aUBm2eFhYLTZ08/nRBiWg41n28Vn0FN1dwtMLq1pY0og==
X-Received: by 2002:a05:622a:341:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f1d04aba7bmr222878381cf.1.1765969705581;
        Wed, 17 Dec 2025 03:08:25 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f56b000sm2134927a12.26.2025.12.17.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:08:24 -0800 (PST)
Date: Wed, 17 Dec 2025 13:08:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort
 over USB
Message-ID: <v4fhyvtvymsaydg2g2sx23mmb7mhvowm3hcjfz3injaigc5hn7@mzcacofjbnax>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
 <20251216-sm8750-display-dts-v3-4-3889ace2ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-sm8750-display-dts-v3-4-3889ace2ff0b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cPls1EPOH-oVXiSm8bK0tpq3yEyu5SRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OCBTYWx0ZWRfXy8zvQPNWixkz
 l4nxrkuqUlk3m+ahlhi7g/9HADh0TYm+EZtzdAsV+dJBCIFR12YotJ1+XsYnRw21U0EXslMO9LB
 3LlGfDoK3UxBvcAb76qwYQ50OuIYQpzG0iIy6sIMznt+CQNR5kqBTkXaOhar34+VEbune0LhcLE
 QB7MXpV1KWDRYjFi9iG7kuYRyRhbb5QVdUEri69tCaZaCpW/r6IhR9d/IIG5NtnpTokzfFb2i9j
 +5qw/xk5wENun3JzfJzh/PQNDo22L/8v5pgTbfosbIyZDYXyXOg038Vf+A7ZhoLFL/qqGoUcOQ3
 H0Meq1fcKP5pO5cXF0stA5f6pDy/OktSOyzMhvSV+BxLU5sM9I7KQocGtXmawBzyO9zryEX1zja
 au5TLJGflw6r4zYT+6TNwTW5AuXcew==
X-Proofpoint-GUID: cPls1EPOH-oVXiSm8bK0tpq3yEyu5SRh
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69428f2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xgWhb89BDjTtD9WMArQA:9 a=CjuIK1q_8ugA:10 a=3Q3lADbaBCgA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170088

On 25-12-16 17:47:34, Krzysztof Kozlowski wrote:
> Hook up DisplayPort parts over Type-C USB on MTP8750.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
 
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

