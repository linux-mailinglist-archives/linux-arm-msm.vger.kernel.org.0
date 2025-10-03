Return-Path: <linux-arm-msm+bounces-75952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E913EBB83C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBBC3BE017
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55FB25785B;
	Fri,  3 Oct 2025 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b69CqWUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AC33F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528189; cv=none; b=Zyg717Z57JxipjrW1BBfcWbkR7ks4b19zf3n260+oWxXjRr/vGR1tky6d9kASXlKLe/qUsbxMmkQn7mtZGYDhfg2L/cowmmfz1sbrLfuoYWxrDQpnTKYAbW+bPPI1AwwNn3PKnxJkcqJLs6giHs6sFzbBH9xx8K4B5lxT7BX4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528189; c=relaxed/simple;
	bh=V2Wkyjp61eE2yNsrEBIrnO48rBvAdczr/Veo5IHkEoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwoxVrP0UBVbinOiDrgFAfPKFAABhAB1uK+dWQkdrIYSoF2Ndt4BX0Or6JOSkdSt3puKcD8kArJkDu7KjC45hXnVr75iMaBuL7WTDt4ifY9SbfOWGPwXPeF8kJ4ve/xmwe51Atb+tjPmQtjOOGmVGaXIHS0vecXNAkR89lBDH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b69CqWUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Hujqa007817
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CXTO/NJSy1u0WPzx3mtYRDh4
	ZwyImi0h9HK1EEN2E90=; b=b69CqWUCPXNQx+XR9KGvjrsELBSn1i0u8Y/CZX3g
	Ub4gODHQGEfvPZ81Kd1tem2N4sxj+E/KQbDSL4XOPc54KECL7eM+g4jvn259jwSB
	1bEcEYAQRnvnYAdLYupuU4n5gwymNGc0lHuu1npmw6qgYyMfaIdYknzr2p/zZUXf
	46bA5giMFN+BdF59vk51EXdJcIXVXmGWAOpv+2BuLrnEhPhWZNiqasJzkWzjZXoh
	uUz2F1hWNB82zsw6qGkiAl7y0odTvr0utvruHJaRHD+0MM1pO9o/ePn4wZdaf6nP
	BiODUX28TJNYZKkzzX2J6c0WP6y5AK640XYne8NlBaYxPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh577e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:49:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de5fe839aeso68920441cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528186; x=1760132986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXTO/NJSy1u0WPzx3mtYRDh4ZwyImi0h9HK1EEN2E90=;
        b=u6y67YmeLbvS8aydB5KXDeP+7C6uSV6n7hfHY2JYUviocg4QqmpcD+774peT+1JByt
         oI6uM0lKIZZAretZlytXuu5pFccMREAomXu/bi4JjeXumYr8XoS2OxLLOcpIFHCm8Gdt
         fpujF7L7SyYYR0vYoDtLxqCQ/iPVNNKMMsW4q7yIIglKtdRlxuqy2WTkvARyZ/XcXRWL
         xBEuU/ryn/nDWxbXd6iyneLjBDS8/htz7atOzUkvv9HR/ggY4Uo8IK9w83+s7Jzh6zZI
         mdtq3oiknCT0KhROChQk9Ti9TAPCDb5mCNMgZe8540O7pPDwCZYpH7NCg0vVDQW6vBx/
         QZqg==
X-Forwarded-Encrypted: i=1; AJvYcCW8QT3WkMiaEsOn0N2CjMjcYKb0zmAWv0vfOb5OpKkK8y8y6dSo9iQn8HCgVpgsevbUkRmoFtBJ8Av2thI8@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHNO4ISdgiJ1dNx7McGI3ONwCmmWGTIYF9sPXsGuXv/3JmkNa
	DFlcpoNMzmB2NnV+tzEde5C/2qicfS/+BcWYV9D0YwwNRuXX8jHlkoQR54vjF40plDkSNCwtUQZ
	Iyo0hTfuN5QSBOzh6ZbIk5Is5OjSFT1brQrMrxgZoBu26jEzJ/pEFSM5RUm26OLoHh3/t
X-Gm-Gg: ASbGnct6sJY7YkKP7EJpJAdIwuMGLNwtogHuShqgZ+r++tAkEZbageADkggk0SlhLes
	3Mtdnzod0m9yVapjuX+kVRGQX5fRtVsLi8T7oGmCoY9oPAAhK8nSN2euSx1RK67COM5iRT8Av/g
	fHNBrpUbucohU0KsYEziGds6KR2PaFZz63Wdbp70lr/u6RYZc0lfXZf4bwTHD6cHPasi2u/I7AA
	r3bqX2cy/f4CmtghdrTaaO8ZX4bMbBa2vmJWUoItPgT1hH4YT2TtItyu2u9SErv9oSUiMGWaUuN
	Dij+NDzE2On9/GNbqlTyWZNtd+Bp1kItXQYGnyOFHQk/N8rjxlJ1xebWwxh0mwlW43JpoERhZYm
	UautBBftGuDABzeyXtqTC2VtOTx+C6ssFVxngjj4ZnryzaS1ycWzJY6R1Wg==
X-Received: by 2002:a05:622a:8d:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e576ad86dfmr68919421cf.58.1759528186305;
        Fri, 03 Oct 2025 14:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqQ5JrGSaAju5feGXkIeOACPcymH0FWHYpUhlOk5LHmhvDelT1A+t3RRJ22rsbo+36OHGoLQ==
X-Received: by 2002:a05:622a:8d:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e576ad86dfmr68919091cf.58.1759528185860;
        Fri, 03 Oct 2025 14:49:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6dbsm2208525e87.82.2025.10.03.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:49:44 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Message-ID: <xeu4vsmkfws74qxnzwmsbvdr76taapa5bvao6notfttu74yztf@fq4ap7hid3yf>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-8-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-8-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: _XqgimBRhJ8cm8cvlSF0RQ2wPIMoMvHq
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68e044fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=xpcYJZ5K4HInNErYrfIA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX5THvakBp4iy8
 VwtcfT/rddlS4a9i/9ED8a9qw69jxOjygEu2T8YAkXMHuBQZjxX0bl18cJqEchyDnppF0YxI0Io
 Ki8Je0dNA6lPQsU9EWmNK6WAuOh7lYOBU1tQJv1QZvJ/ywvGLLjPiKCsZc1HpwxfWpWyUq8R/8P
 Jc1gK+Xf2CoNxQP7ltzS6243MKXLzMKtKLKd5gxkM7fLwcnYuVHYT5dM8Uv6DU4Q2SjS441fVaJ
 uojDfgjN1mBq2XedX8RQPpV0IyIToTUnoXPHeP1A2MJe4PNpW9OhILGMVAMTGKRT9ORpNqBsOhk
 xPn2DnHsxojI8VQ2kGYNK5cKsomoo+R0OoRqz2zl0IGApeCsm7f4zPhu+Px8nZ00E45d6IUifEt
 4fx/g1ELfFhkciHMXXjPqUssM1Geuw==
X-Proofpoint-ORIG-GUID: _XqgimBRhJ8cm8cvlSF0RQ2wPIMoMvHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047

On Sun, Sep 28, 2025 at 10:05:31PM -0700, Paul Sajna wrote:
> The sdm845-lg devices are all phones, therefore handset chassis
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

