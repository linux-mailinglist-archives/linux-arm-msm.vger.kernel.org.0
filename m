Return-Path: <linux-arm-msm+bounces-65071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC70B06534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35FCE164EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C72277CA3;
	Tue, 15 Jul 2025 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtSSWESm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1C26D4E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600906; cv=none; b=U1WYEOMY72YtVTJeyfPhCQ0XMJCIdDsYjR9mnU6z+IJqnodBI0XRVC4HNKm2jgNOfPKdhUT5ts2qzZJvuEDnPR32YdCeaym5orDsRp4PmDKloPKkhLJPM9ti9xKYolqSvutwpUbe4hSAFd9tSkN5wnji/qzClKEw5olMB/m0cGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600906; c=relaxed/simple;
	bh=2J8c2z5EXWGctgukrb93oHp2+Zfj54zLjUjpoTWXKbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8ftF9VLnNn/p9XeMJTl7F75DO2gXRntX7jNfh9+GCO2MwmSTJYFAkUFVirxIZnwKkFxLJtWisxgeHAUbaEaLgJxnvcfgymUFqjHInGzdBcJyNo2jW5D3OmBgl5GhkEjo2iC+Qm8uN38iU2DLWWn8C+14pHj33YYzT5VyqJPeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtSSWESm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDD6R022755
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwHMduJFVZ0XMQsQOdCu9rTr
	BXiDOqf57dZo0ADVf/k=; b=HtSSWESmR1v8aUvbmxFz2n7lv4gFQQKPmoVqHA/B
	INn32DeLsRf5fkKXgD8Ae2eet3yealk6LUaWq0zXbhU68ttL3LRbOUs2zi9WrE9/
	BE6OcAqfBGfnVef7n4cOSUHHj8x2RwS9kz5mM6ktfYrTIHh/QVm1Mz/N5DqHsmRS
	sW5YkTnZxb8Yb1s5jWyY3BVwMJyOGf6hol4Iip/9FYjYcHI0ha8mdGWinyNdxX8T
	Z9TgsfLgWSmJepkif1i/zHKYX4mJBXsmwO3vXAdTXdS/2RMAfgCUwIULweluiAQC
	INvCL10uUOkWDMrPXwAe72ATx4/BA56yOJVCCORFzx3V7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruhrwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33af599bcso142457085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600903; x=1753205703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwHMduJFVZ0XMQsQOdCu9rTrBXiDOqf57dZo0ADVf/k=;
        b=N+i3Ztg+4sAOdc/ju5JhRciOmEjfKs/7oiEN4I6UIgK9WY77yBBFmXzdxzxZZvJJpm
         v8kSHRwOpgQZFS7SFbjes8jKkzEMqEe2vGgJ2nmvj21lHVPB1+GwPwCiDJy0wzdl2zWA
         yshoB0iDzN0cqOqRSl7/Gs1awkQMMxc5PzImbvsWRv/y78nYZ9b/itD9QRivh8szIMhZ
         uMfgMXzgOcOwrFy6U7FhQTRkmO43A8rCSYysD5zz6gGoE56atNOz4z1laBrUEogI2HBa
         K/VFqAYY8ZI710cFnBc0RVKB2LAiHi77oanwO4T32mSIS+v4SuUlX3XNngnbvgPkk4Bk
         urKA==
X-Forwarded-Encrypted: i=1; AJvYcCWzYw2W+hQXucrNE6FidcTaxemygHon2B6sSGQFl58IJVUrWpBINhhQ7eJQa6PaJqPG1Yt1U27zBvRCHiQs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9g2aQ2xIQ1HR41ZJFRm+7CSScWM46n+iY9l+Z2O4bTyc2diB9
	iuxhtNd60av5M/fEVKA9rMJ8T4t5iv/GebCpeqyHngreioO8+guJwjsEObpw8OuznPZoJ+Xv2KF
	qYhO2Gvd7VgJLY9Z31fi/KQUFkWsEgEHa3L7SlaSSMmonIxqW3m/d4h6qbtgH+ivDNthC
X-Gm-Gg: ASbGncvErxTpaNU44Ka5kAWnGGq1iJUT9xAU2VMNtrGRfYZ70/INuw33h6w9hmEDzhj
	9QZweHZMlKkCky1hKvuh20BtiPkue8mvCtAE4dtErca7ukocTJF0kY2v0fKGXmPEgAXaDX/Rf+H
	64Phqzd8nPgLByzVz907Cz2VRbvXa5p0Kdo9hHJGjpDgLR2Pq0GUSXh5ww4Tqc4PQsQEto3tCDU
	NHYfy7egZ6qqZZq8yPXsREFGknuSX1L0+1DMnGhTThlKtqY2tq+E9OmpFKWqIjkP79U3GJwNkaI
	AnKpP1/LlddJFHhM9+jrjf9yiD6QPwUsa8ZMU30DRVt4xs6QOKvx25EPsRdMsMwbeWYiq6xFtTX
	apPz1ijEJIiq2ffK7ebeqci0LPX9LPEGh5Jg1ozxurBF5wLXer1vV
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078300085a.49.1752600902884;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkC/RAmmlrlOop2nd4cM+Qb/s+gLrKuUEGXd0Hyq1/Zw3CSYcbKVNpSB1ZGZ2gTFs/qFsWQ==
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078294185a.49.1752600902369;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed429sm19601101fa.85.2025.07.15.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:35:00 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:34:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/4] phy: qcom: phy-qcom-snps-eusb2: Update init
 sequence per HPG 1.0.2
Message-ID: <n3khphjtqwcfhzxbdici255in2cbceujp3jlrtkrqsd77jtftm@ggpa6eek2xna>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
 <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
X-Proofpoint-GUID: B2VAjVL2NLAMnAnlnOg0hqnp2EpAFdxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfX0pXv6LPmN2IT
 MFPwrEpqkgPW27Vb3lZH3Uw12rZK/OAt+dkxBPtOuJMgtlgB0gbV02SdzEH23o11PxieSlA3MyT
 CbfWG9ZRG4OpJU2iQBdm5s5Y+VZdLgX+HpZsR8dVw8kS+IlmiXic38KX7w4h7SMRQIEUXN0A34O
 vequehOAG+Iy3lHJ4bEKSuTbI2DDdQgNvS1FfGggmn5Iyc0OgOVVoYqWeOELQNhojX6l44Ltaoj
 Nz3gEJrC60igB3efxC+cJi6ZxpUzsmH5h1Jb7GvFFxBJVw7U3xaqqYUv0yJ/hiialZugP5z3ODb
 MKGGjBjQqUrescFw3rGXglMUxCz63cqV16sqABk1TSen88mLsxuxkG3pgxN/4fwZImXmowLsrfO
 aBy1CpMoYcjGEB7K2MFko/TInzgOrJt6ResDsyS0g+2i9cJ0CoYCTYxIPh8a0jhtLNGO1pR6
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68769148 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=xixfk-lNQEsWtM5knIAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: B2VAjVL2NLAMnAnlnOg0hqnp2EpAFdxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=906 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150160

On Tue, Jul 15, 2025 at 09:29:37AM +0200, Luca Weiss wrote:
> The eUSB2 HPG version 1.0.2 asks to clear bits [7:1] on all targets.
> Implement that change in the driver to follow.
> 
> See also https://lore.kernel.org/linux-arm-msm/7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com/
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

