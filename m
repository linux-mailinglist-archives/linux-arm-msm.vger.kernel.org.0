Return-Path: <linux-arm-msm+bounces-73453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6E5B56D27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A913BD7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0B5227;
	Mon, 15 Sep 2025 00:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS5O9eWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24743147
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894909; cv=none; b=r3/pES9gENmToRLSFa/XVdskpZLNBBSgOH3f1tfM5ZHhK2PTWqkgOG+zpLqJRutJhwJGTX8vY8/CTJxHuhjkvIax0WgA7YwR7bXT4JoVEXjHGhWww6vMYBwWtO5gNX3+28FD7MARZ07WZYCKu43p0/BlIaDXi/rEvA4SR+JuXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894909; c=relaxed/simple;
	bh=w5+8AtP73tAF4f80M4jzv+Fd3m1mwSzu1c5/Mxog6IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMMIb20KXb0hPTVHBtjJVnM//d+cmsXToswHDVm/yRTU5qbn5MRfa/EjqjSsxT3wR4Nt0EvvCLHdUPmMCsNF2Wo+BIANmxFAjkIFDuGPSkMu81uz8xuvrORIWxNCaAvpbNpHsida7hwDokQI9nVp7D8KDWAklMnr6+pyAcbPDhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS5O9eWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EHqnXT022901
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jhHQJ2FaZhjbHowvbcKpjMEF
	Vjk3jYUMJhk+fRucFz0=; b=dS5O9eWpq95Bj7YN2/hf0NUR+QUi9prvfH+97CGM
	wGLciooned986w5e0IsJ9fbTgJwG/pNgegL8JTzuY6TIwMjBB2uGTKJt4HpD+ipd
	M73z7oF4ydGllcKJYHhxh1qbSax51CwmOYo61HvMOx2Z2XB034BntzdilBy5Osk/
	ILstF1kthGk8yJAhRRgbyTR7Bb8b3q9bHTJ/xtojxzJBoZ7SlAi6orW6lVrAbtvr
	os3JHoV/nwZJuaTlA4Ehe0ZPxS++rfrrppvwq938nqzYXQGEuy7zwIR7XKVzqtPe
	VG9dLEK6vw6LQ7Z6lE5+8rWGL1No9WO+7sZxWOcE18oTaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbauds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b4980c96c3so131812521cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894906; x=1758499706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhHQJ2FaZhjbHowvbcKpjMEFVjk3jYUMJhk+fRucFz0=;
        b=hXKNhoLmYPpf6CvrGfIBKu42TGtUolQmtoNqG++4edvnX/B9SBNA49lPkFii3LNawT
         JBVScPNYDSpEcwlVfwARLYh5BSpU56TTGthCqFXlN5SVb0m6tPDaHiRt9oaQ/NnMLu0o
         Xn07OqVgivoMzSpl5I841FB7hNUUN/Xh0UjnGwIEIWsUJix9X7NhnQ/WgeGd/0ktitIy
         7byhQ0R/L8jYU0dErHNaVBLTRgnLbda4BdUYG84KUZb57ZQ18Liis9SBEdr9dOdRtvSN
         eWGtGU0Jw87MIAmycS1yam/DeXzUuo1aigSVIfM5NH7rwsx/Z8H2VshJTG1NGqVG7IeG
         ytug==
X-Forwarded-Encrypted: i=1; AJvYcCWzVjDXAJ5fJJFeyTK6sCzNeQQN0PhBeZTKzL82yaIDW+w5gfKlz2iH3srYKS2h4sYPtO/on5gsmyQSC0WU@vger.kernel.org
X-Gm-Message-State: AOJu0YzG6m2wnk5f0Oq/k5HwgQRfg9oAwB7pNsRaMIbEqR90ZB+64u+U
	TedmFJrQ+Zfcu24laKXzQNt6l2GIM3BR0JQnxJFbbMCAdRfxpV/Yys3Rfg5ObCWrD9A5EulPxMy
	Bjs6AmAjEs0hSrC/X2ev0Zg28B4ZoqtmY744zNp/PzFxx7rh8stGkpvHlNf2wbLwQ1v50
X-Gm-Gg: ASbGncufxfdDIzgbnnGxu9FR+UsBBsWTPbXueivl+0jffuS+OSCAxcTiZ5c1Kpl9Ezo
	jLNwWeDOcyHXl9HopW80tyCx4kupeKUnkXPMBIMydyt9ZAPSMlTU/7i8MdTSSXeyPdVqQd9YQAL
	lKjn8b7Ytnosy6gGizcHhAT63W2yahBhvz3ZYWslqd0N7MEHxo8fGC6X3VNcdC0BKe5BWxAZ1T5
	d1qzskiPvAcJxEGRsUQyNQuj8ON4fk1xHIlBOuUSV9bZJmUgsO6DKf/UwL7DhzQBDjgbRMES6QL
	RQ5Wsx0AfTWVV9VW7N7JOCf6gVATPHSGNc2FD0TKlro4m3MZPRRbxlYe8JygTNSMCNRWLc+js0m
	Naz6I7zBcA4E8w8OAT+Wb2iMy5hcS2nUZw4BSNrn5Ss4u0VwjJ6Yn
X-Received: by 2002:ac8:7dc7:0:b0:4b5:eec2:fa with SMTP id d75a77b69052e-4b77d05c20fmr145396061cf.62.1757894905767;
        Sun, 14 Sep 2025 17:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlzWL1Pn7gtuuEpIlHBZn+SrnRj7NK/IECY8KYfOg+8dAVUiEVUigMgQ3DRWqq0FAo6LUpYA==
X-Received: by 2002:ac8:7dc7:0:b0:4b5:eec2:fa with SMTP id d75a77b69052e-4b77d05c20fmr145395871cf.62.1757894905336;
        Sun, 14 Sep 2025 17:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460ded0sm3264619e87.105.2025.09.14.17.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:08:24 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>,
        Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
Message-ID: <nudo46pgp2uaegztcpvp7iu6fuotkp4hjhpl3qo57jpkjr7dph@5ypen25l4xnc>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-6-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-6-84cadcd7c6e3@smankusors.com>
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c758fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=WfKvcdoTxDYLXQoqPjMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: pFo29XXjJ5faaosngnm812ouQbS78CrZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfX15srROIMWV6G
 XDne3GNhf9waxpwD83jbD2w0Usvevjmg6BswBRI0l6rQRB+t2UfefxKCJ1y0WDh/8zbrItECovi
 /m1arMSOcgeiawTAhjebftXKoAo0UzP9ikOWUtVCjMe0usFfIEc87yKzWk4HpLSOJRnbXBvJNDL
 sle/2G9dg/Un7zPyUi99/DsZJPX5s1zmOv+YeGkliQYc5WV64WN0N+hlmeYkSM6qAIkD6foAHdy
 erzvdZMY7ma6qTnWGJ4d5g/7OPzb33GJM/cgN+aY557VtUz0fIlUMW18dYoUo2hW3vFskggKJ3m
 /3iYNR0EVWwqjr1VzSeQFvCTN8HvlaC+B9JN7QIlfqULWzVPqJAFdQrYskLGjP/gL4HryzncJBu
 qS8abTNI
X-Proofpoint-GUID: pFo29XXjJ5faaosngnm812ouQbS78CrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042

On Sun, Sep 14, 2025 at 06:35:03PM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 10 +++++-----
>  arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 12 ++++++------
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts       |  2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   |  6 +++---
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

