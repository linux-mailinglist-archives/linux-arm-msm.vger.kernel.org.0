Return-Path: <linux-arm-msm+bounces-75742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5102BB22B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135793C16C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2977FC120;
	Thu,  2 Oct 2025 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUCYIKS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AF139E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366237; cv=none; b=o+aC8msXryk1nUlkA2VaiDKXAveBaKO5M2iSHsdnlwHsJHbHPkBafKG2fOX+4muxffUKO8CIghLG4rXANGsxyEXAmHgo/rTc+DBF8frBd9/3q+vmMyAEaHfX7GUcYs//a/AfbKRJoVN+BvDVMOj0p034L/Y+CXuYNK6vF1Bezd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366237; c=relaxed/simple;
	bh=pcLhHJCXTY8Rx0ZoTvbpeKJuwGj5s/9zbvQnYMx6r6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDuh2O010mayMIp8Bs+qE4MqZQ/4Jx9SE3bUGeq/XGJdCqCRzcsL0LoWhJM1R43sj6Rgf2RD9cgLQk6LE6Sp8VVCaLkvB5DozrGrOTr/hgFhkdIu08/mOtrqY6ZsQQxBfh/cLqdn0i0ok5AzZU1undhW9BiieYv/ELdHNFJ+pxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUCYIKS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibvr3031946
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 00:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ulc+vZjEzPbgWCzpmuRHchS
	Qw8CDsC03VwUjnWv2pA=; b=bUCYIKS1qCqINuoUlonGTpaDrnrudeOj9rri13av
	08u3b+JgNuAU5NWh+No3hB+UN/tBWMnQQwgJh4nHwhMRAE+RVK/qsuwKu9rX3He9
	pQYKsoR2BFMo4VsfFzgQWLNRvW0auWICrOfi5osNG3bDzqjTAmjcgLbtbO7DjxZu
	vSWQ9a+9+GuUAHrn8tjxNR1CojFVesqF1gBjnYuVJimbWwZD+7Ih9BsLmgWOIem0
	c4CpC4nU0CYKeNXRoGJLqe2Q0sqeUZLtgNxUKOnraLhu6bcmW4eLcMQMz3Tp84es
	WEi1iPdxGc6sCfh2uX/2wchoobsSbsTLUzufQxC41aFYxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5xdjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 00:50:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so6296621cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 17:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366229; x=1759971029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ulc+vZjEzPbgWCzpmuRHchSQw8CDsC03VwUjnWv2pA=;
        b=wj3mlvufI4Ojw6ORAshjg6+TZsycbFlzuQGUO0Uz7MW8YbMLfzBa1U8ptM2F34Bwuj
         METqCoWJbLOraIwbPeqqoCy88j9r8YPy39zyKuus3pAhD1bWydDlS3+EZxsjPWIRRwcZ
         +sOMJQFdKY2OWKFyJg8I6184E7Ife+yupBpMdj4fcacK4dih1jz2BvvdMYYI828TPK5y
         Hla48dQMXPbpnpSepU66KgYn9OFIQtmVWY2OVfZcqht1Kx0AYHBexRWQxGyMAmyjHtIg
         heLu5YGI9q4Pe9uAn/W9jH7waK7C4C2cX20JnIOBTE9RXOAGUPIrg8iEYAXVnNKUl5Gg
         lTaA==
X-Forwarded-Encrypted: i=1; AJvYcCUW1I30sAwJ1X5dwyoUTQ5lYxVDVIEQaLUqUFORoPH8IHXovqKoAdyew2YXxop5CYeTdEKo3E7VLrRdZMLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ64y4Wkg7iSPoYvtb8Ua6IBl6n0oYKVFtMIuWTHOFRngNQTDK
	1HDhIDoKq/pQQ8Ql4Y19CfHY/icoAheSJj9UijfhP7YJjtUR4iySlE05h7ZAk0ydL2fC5DBZVBI
	BtG665jivcb0vN3+ku5nbFUD9Wq3EX2m4e9QU1vnD9VDUHScGezYhvGzpnyRcLp6HgyKD
X-Gm-Gg: ASbGncsoxT7kjFJdZbrwpO08fZe4CgTEZyQUtBOHzxHH9KmuuRWhMfaoUUFb0ScKOFE
	vf9DTspnlgP7DRfOsIgqNvw2sHSDfXBQudWZai/GLUmuQLbwPLo2JOrdVPVwwKiW2iGtOvu7M5r
	8VNClu6gyt21RXnAiVUk1aMYF1LlxFo3m4p1qOGAVutbF7mYu6ot45iDlPPKZSKpSPkB8MQkTSn
	LIF4Ic3DUss/y+YZIlxLR4xtJI9I9GpxooBu3OSeQfCQbsy/Gj4lvQ+UH6sHF+lwXTVd70YBtgb
	+SilzPMegC7M5oB1Spi5kFVv1LMXwHFBECAY5Ve+CJXI5XlF1ql2IAHPFFC7g6Zoq5BEthlAfD6
	6wxfS4jF0UwmrdZQwXZuWJSEWJ6FoM4IKtcEZ4MMAVjExmtx0DXWRIpDVNA==
X-Received: by 2002:a05:622a:598b:b0:4d9:5ce:3746 with SMTP id d75a77b69052e-4e41de6f81cmr73081151cf.46.1759366229514;
        Wed, 01 Oct 2025 17:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCclp98+N6Qg6dRWsktO9GaXOQng3cW+YUBThiQY3XzDHdMc4J/Sf5gh5nJ+36guSA5Lv/2Q==
X-Received: by 2002:a05:622a:598b:b0:4d9:5ce:3746 with SMTP id d75a77b69052e-4e41de6f81cmr73080981cf.46.1759366229120;
        Wed, 01 Oct 2025 17:50:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ed45sm320922e87.104.2025.10.01.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:50:27 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 &
 PMH01XX PMICs support
Message-ID: <gnutyscz67spmu2nmsiyptcqsp7y45emirdwlsldrgsddfwi7l@rm52ogzmnorv>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-2-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-2-11bef014a778@oss.qualcomm.com>
X-Proofpoint-GUID: FRtdvhK5-p8ZNJ_axC_cgDX_gO-cyqfA
X-Proofpoint-ORIG-GUID: FRtdvhK5-p8ZNJ_axC_cgDX_gO-cyqfA
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68ddcc56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=rQW_yBrpdR-Tfh0GWmIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX1Zb6OJ+xvzA3
 UynCauy3lOMut/ZEisCeA0/khlGIG7Xl78mm8ZRa2tLDgbW+TIIekw4u6JalToFeSWZVjt48RCP
 HcJwm02+0KM4qcgSP9WX1xooToSoMraQH5PvPWJXUMVoCrjjHvWs8dTIquMJGzZN2Jwx6yDFPdp
 ptGfVdbTAFq1TIV40+8A3Uw9R580wtCV7Qv7PtREZu2/TMADTTep6OwmSnMfTg6ehL90gFDx4MM
 /l2wGwlld618QIM+Pn/5NEOfcl4pfJCGPhvGESl6X38um1Xn4rGtoWvAAOtJKIdyeALA97AXdZ9
 kj639wttFZ3uyFCXYALoPBr5xbPyA9hb9ZOWUOZQCw+uxDPV7QngEBNq0dY0eUzQ/BF/wrQVQdK
 n5brYC1AK3HBopgmcHsyC7KjEI525w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Wed, Sep 24, 2025 at 10:31:03PM +0530, Kamal Wadhwa wrote:
> From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> 
> Add support for PMCX0102, PMH0101, PMH0104, PMH0110 and PMK8850 PMIC
> GPIOs with adding appropriate compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

