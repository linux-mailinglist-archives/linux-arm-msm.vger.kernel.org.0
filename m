Return-Path: <linux-arm-msm+bounces-84607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF4CABA31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Dec 2025 22:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAA63300983D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Dec 2025 21:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B8529BDB5;
	Sun,  7 Dec 2025 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7kikaI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdiNehUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC4225A38
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Dec 2025 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765144174; cv=none; b=W8wO3xn73AidwLTjx++3DFmx/OsqbItzPs5vkCY1/4a7EWoNywzUjnYiCI9M/XHlvtcinYElSUoYHTX47yjUbJtl+A43tmUdgQorH+Bto9E7LTb18ZiyrU7iPOftXDZ6FYCEntG5su9kRcAsbqeCX9FP2co6Z370BsTDjTx08R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765144174; c=relaxed/simple;
	bh=ADIUFF3NaF66VjOH+E4MOelUR2rRGzihe4N9ijxdzY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5xzglV9V6LrlJWukgZpaleUHwraV2gnN9u/ZW9i/oqb2uMg3Sjdy+5NDjggRS1mycY5wVxlqHOe20wLvLRQEPtSvPbQmshAC5VIQfS6j3OdGPijf5cuzE9YVwT7+joKmEGaUEOAzsSBOvJHI95ZxjYyWRTaubonSPVRp+Jw2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7kikaI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdiNehUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7LjfmQ3288630
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Dec 2025 21:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNixEomyDSFdFEBjauMSbnu+
	A9TeWfJ6DWWKq8tjyZE=; b=R7kikaI2zntv7Yt0DptXvIwTPgEbsEZAR0+6+hCR
	X+AiPaIxZZnDwHJxMz16XF4PX0/n4i9uy1+QMnEasHfovg+nARp4tIo+nYoXXwTn
	4OL0sDo6yQQnVmEG6NzvalZ3PzrEVBIAQuWWsYIXnc26F8Amfo3skdarr9jxplzh
	aieLlypaJV5LGFEHDGcCMuWOIwC8CJLkYpL+Nk2Gd/9Vo4lwLz0DwNSTxKroasKm
	/K0tIeQ8oryUOu5Edxj6D9R00dCYF+S3zMlmbWsWrxf+6zj4ZOue3b4kZdptf7MJ
	9klvW4mT3WjL/eATSBeilD4crd/LKDcrZ8Tp377oBuYj/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv82wtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 21:49:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so85642701cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 13:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765144170; x=1765748970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNixEomyDSFdFEBjauMSbnu+A9TeWfJ6DWWKq8tjyZE=;
        b=WdiNehUVFUq5/eqOv+ZFtlfl27+ViDWssnIz6Lcmrq2D+LD2vjyj55KMbXLbiDnq0x
         vRTPcENXnMoGbECaMGJkK+zlKRvr0Y9vu91mAEe2j/A8q+8UUwxonk/axNgpai9Z7d4w
         lY/bIBEx193thfA/Eaoi/W9up+ji8i7cZf1bWiALIJ4k6zS7P3uUdrAdrE0qD3Z3MML2
         aVMSXAnE/wIQx+jR8slIGfNc4+ZDoEkBhST+7U+sakF7+XVoNm/SYmlJ9apRnJUfrm5h
         QtlSLtzViPgYlI9qR7CJm7bSPfAiDp3nAV+7k737eXeXLi/E3U7crKjNw8yOaI4CJiv0
         FmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765144170; x=1765748970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNixEomyDSFdFEBjauMSbnu+A9TeWfJ6DWWKq8tjyZE=;
        b=jiLdns2WvvnFPW+Qqs7mVxInwgvDyju93QQkPiF0Yk+82sHsAu5375AH7vw7Ag80Vs
         LbguRI2msycIX+VW/I9+fgXYOekvGjnAgcMFings+HqQBnXUszvv8GOQB9FCaFLs4iqz
         gp7JrO2fHF5qkbwUZ4BHZYsaXAe0TD0Dtr3GTypmV9Tb6RIbbhTcuKpMSI9ttjgutLrc
         gNbbdbDe/Urz9Y/pRg9Grr/4VjEXlj59A+IHYqknMhFpB8Q4yO6+QQaVUwk/4WItmWih
         CrQNQzfLZ53f2ti5YhclUfdzBtbrDvOT6Rrna2uQVmklLp82vcQtFLgwK0WDZb5U4b7i
         AbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYhcyujG8J4/XDwJdRWIC4+caYTz4NK2zTBIMZgWAP1ISfnBWKCu8+2cQPzRU6u/Z5G08WH42irGfCPaXs@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBh6VxK1sgQYmZOu1rYzT9+Z5npS/iGfJbaIfYQ8dp2p64IHT
	cG7ZH7/lF7UL9sI7qEGXCRScEd6lkQO27nDJQFFWemVP2jWlGj58S25YcdR92BE5C1Ua4vw9Dd/
	HZHeGPJ6fQrDmoaQ8c4uk5h2SlaMIl7E2cuF0yxlTm/G+qv2KKFpIWhFa3dpxyxKee8Nk
X-Gm-Gg: ASbGncsov+Xd2+hpML33W6+JOkjyLAScb7vQG/KquVKX0qxlfjdabDS6Nnbsmzd619d
	ClxEwoAR1L7j8u7MNZb5Il+klzCsTAwai8JEypjERXFZ5mVpMLTIT48Oyw4+Oy0mpZNMvgRI601
	ii7/deMLI9iwpuc9qiAwNh7v119+PsW+7EQmfIbOgw0sN3bEVNYwVLjPq9XOyq3q6STFMcl/eGN
	ekEtrwW6/ljnh79diDqvclPmNxu4sIi5Y1awVudeokkunRtjtgSCx+Mff9Zh7Q714p3SRbPc+ao
	jxCR3CtJXpWboj8tcRZ2Sd8oNeAP3At+EtfHpHw1Okm72id2GJvA+w/hb6b0vERYCq02WOx2YlO
	u6kmitvUNvuXrU9QMNfv4Ig==
X-Received: by 2002:ac8:7d12:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f0230627b0mr216341001cf.8.1765144170413;
        Sun, 07 Dec 2025 13:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuCrwgs4G7PoLCqx7vQwkWcAcli3TelJ0o0m6XK3NwpIKsq9rSS9HSbvJpuZLjZT0AH84kUg==
X-Received: by 2002:ac8:7d12:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f0230627b0mr216340781cf.8.1765144169940;
        Sun, 07 Dec 2025 13:49:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm9597809a12.5.2025.12.07.13.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 13:49:27 -0800 (PST)
Date: Sun, 7 Dec 2025 23:49:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/10] Fix up WCN6855 RFA power supply name
Message-ID: <xykyhprdmcotntx6kaqhobupysvyhedfktningltk6knl7owtu@rlszij24zirg>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cbbj1uc2td2TVxUAM5Sd-EziCF3ZzzxZ
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=6935f66b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M7h3R06PahCMBt7vG34A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA3MDE5MiBTYWx0ZWRfX6MDlDqnimh0a
 8Ze6YFeAo1y9A243aNYjlU62phaGF7BxDI5jxUlIw9zhI8vAIe+QzJ7xG++ye3p+JOlUuFFnhw9
 mjL0UtMIVo2JgI8TpO6buFaX1tWPO5w7lOxA0eVydV4lYG8ONUhrJjqWhpBU2QZgz/mXZJTiULU
 opSvObkqpkG7mrozJPwoFpbtMk9niLRn3YSFM0QA1zrlpyfFkKRZWpRBS1jnt82WYIdRVgTr73T
 iir4bDfqp18x7V8YekAdpm09oUbf8U6EaGzvjBaNUfn3xYwjcpEdXKpErls/ceEOGpPoCYoce+N
 +QL6oxw6+89J8scsGkMfhDPB7YCOg4NYXsGidbJyUN9gAWptlSbwq2bZ/yB2DatOXSjrL2iK1IT
 0ss6HlJ7g02tUEePUNRZA64jGPLyHQ==
X-Proofpoint-GUID: cbbj1uc2td2TVxUAM5Sd-EziCF3ZzzxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512070192

On 25-12-05 13:47:19, Konrad Dybcio wrote:
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") renamed the supply representing the
> VDD17_PMU_RFA leg to mention "1p8" instead.
> 
> While the supply's voltage is normally 1.8 V, the bindings should
> reflect the actual naming of the pin. Moreover, almost all DTs define
> the output as 1p7, so that ends up looking a little odd..
> 
> Ultimately, this is a "fake" regulator that is consumed for the sake
> of DT sanity and this series is meant to bring uniformity and squash
> checker errors.
> 
> The last patch fixes up a less-trivial warning.
> sc8280xp-microsoft-arcata is left out because I don't know whether the
> mounting of the chip is on-board or as an M.2-y card (although I would
> guesstimate the prior).
> 
> Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
> bindings split of qualcomm-bluetooth.yaml), mentioned below
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

