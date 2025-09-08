Return-Path: <linux-arm-msm+bounces-72654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B536DB49B40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 22:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC001B24FA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18C92DC34B;
	Mon,  8 Sep 2025 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3WAj8hx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C732DA75C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757364786; cv=none; b=jlyevGxEyGluzhT2qeE8jNEufCXc/H0vki+AXUcT7XGesHsLkWbHOaY9J4cf1KA+/X0f5VuDbB5iFNJhOrSpGBkzImRj3M2FYufApaLF0sNZ/2gxs5da/dq+aSxtEUcR0kVGaaXSBwM1WCgCiET1KyFUrBG2Cfe8lEZBpG1CZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757364786; c=relaxed/simple;
	bh=LEPVDJM5KJBRhq5C3sgsbrdDWUsFbSlaXmV6QC8esSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpQcMYT7604DBxssPcw5lb7HDBmyhnBJv3XIW+2XUqkssnuBuzQEMsfuHFiGXrRJrijx/fvN1bDOIZXDR7Q9o/i/pEd8xFVDuyUvGm0babLMN3Hl14KRzTiiaXBAzq9h53Gymcj+zDt3Yxk6CmvqcEvgxR/Niqw0UDbsJjU9DEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3WAj8hx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588HI0hP017237
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 20:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2cwBnJZmqQBEZM73zk8hQa/m
	ZMI37HHNaj/5XDzx4Kk=; b=e3WAj8hxbQLWGuEpn6EP2MS45wz6U/HtBBCgJeR+
	TEsLeWpp9R1O7BPEX9HdSMDwrY9J5qmh/YVNGulPoFHdYE5695FDV7ivU25y+lX1
	9s5qpcGUeKir5n7SVSIIAT7KGP9LR95hJBV8jKwjTA1ic2chaoLWfHx0fv3vRN8t
	tgj6H3Ilz1jEVzDKO0wiOH8XnffhXZo4XM11sMLsUAZWXHweyFCYJVVVfU9NBNTT
	KBz9Yfhse0E4FLYs+iGS/zTnEkhn78EZy+JeM9YQbRN3LgPotYrwRJ0C67qwJi8M
	XX7i7OjSkql2xvVIEAQWBPKh0ROJSBsf7U2PQBcpXdBg6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws61wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 20:53:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so105397701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 13:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757364783; x=1757969583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cwBnJZmqQBEZM73zk8hQa/mZMI37HHNaj/5XDzx4Kk=;
        b=naHZ14UQu3nUVKuekD1c4gR6UPYJG0JOGnzKZ5xYzWWEBWUFzJ8l86pMaX7V/ewcqq
         A45OQK6DdFkAhiipTVbZDBI7ZxiUstRA5QSJsSWRyMW3qZYOrePGFRkl7+jvS8tQb94u
         RFAFWqXdizzR1/Hwoc8C88eXUfQ4+43ErhnRtkvqwcpSdS52PEAltReMm6dYPC5tBVFK
         Vfza5uH1gF90NXxaj7fVau5fK/1234er76vLJzBGUTEok2Gb1/VRACfPEkR95N0fq94u
         tPbQlBJPI6UpYv+090AQnFFyN8oJhQX5zt7XRTpg/MNd5IxpluQfWA3KT3UzBq8S61nR
         xbUg==
X-Forwarded-Encrypted: i=1; AJvYcCVCZ3evZVZQWAaFlg00xtoCEKn+gqbRgtrArlVFXSacwFkyy1eGADEri+81zchH42Lcwir4nKMCfqQ4/8xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz150SaFDfaIrgWEdkoFIJBh1+KhjvS1xR1vRrq2ds74tYDetQ3
	kIQbCTARhjzXfco8Mwyo2cUfjvxR7ETjTGV3U/dPyQk3Vr9SgXISnmsKjDlVCrkhR2nD4CGNGGx
	owvertu3p9TkgcKiKnqa0578NCk6WceiRIh4v1IOpyRfudVf0iXrbnC2gMU6+l1RBX1lE
X-Gm-Gg: ASbGncvfT+UJgwpNT+7kf66uPH/xJyTKkRxyZMAxMVDfWqrHxe4K3vZ4gcjrickMsOJ
	lAS4A+wWB4vq4yQwYG0xCBp1Nrj6eLmgkftDxftc81vk7hmpN2hLsxLwhJZ4f5xXUMDsWoq07oj
	RGDqOKUt9th3bJg5NAJGJu/IlxFxYwMooJvlOFqIQ2ht135pO6mFFBIIzGtIKWonQGpJVmN/ZOH
	5Zgq5yMXCx6oVTP5hxR8uhi3W/Zyu2XkAhQPeQcEJI5Q3AY8M/x7ScxUAZkzdMu5fIsKmHlM/y4
	IrFs6LQT4CbdOJJ8l994vHdkWNLNpiO/N/Z8nDcRjax8QBtFKtjy77tblyTYMVum8gU3yoQk3pt
	fiCJwc7d48CLTYKjN6V7yHW+WEpc/92t+8ELtqUO2tNDQhvfI/OcN
X-Received: by 2002:a05:622a:104:b0:4b0:6205:d22b with SMTP id d75a77b69052e-4b5f844db47mr118280341cf.52.1757364782716;
        Mon, 08 Sep 2025 13:53:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbgttt18cresQ+Ad/zQLdvrRN/v/9ChJ+Ozvktu88IRLlutb625Zv06Rrpn/u1jzrCVt+Q8Q==
X-Received: by 2002:a05:622a:104:b0:4b0:6205:d22b with SMTP id d75a77b69052e-4b5f844db47mr118280001cf.52.1757364782156;
        Mon, 08 Sep 2025 13:53:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm19629e87.52.2025.09.08.13.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 13:53:01 -0700 (PDT)
Date: Mon, 8 Sep 2025 23:52:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Introduce support for Monaco Evaluation Kit
Message-ID: <sftju3vzmxu26yeldakj7ksih7x53d7jdmw7ninjhmfmjc2bci@hizerlnne64q>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <175735727830.2621347.7880458499216772171.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175735727830.2621347.7880458499216772171.b4-ty@kernel.org>
X-Proofpoint-ORIG-GUID: TBjf-aQEHhyyuuUZpE9gYTWVknVsqQSv
X-Proofpoint-GUID: TBjf-aQEHhyyuuUZpE9gYTWVknVsqQSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9kdfiT5Og4XH
 ilDrtBkVcvxKmBG6H2G2IWvdvNqkwVMD2j8/uAcArM9QO7aaAEXHPdRaaCB8d7Ges2ilYEWsnsP
 drHIRPOnIyKYQbJLp4onUkqNhlH5YdT0YwPCCh5uhWpokVDv5dOz869CN4V94Ehe4jNbhQzxqO/
 sv4ERyRe77M1R6jhUlZ+gHGGYHijtv4uIoVW1oBeGi1WSuEps5FMtg5e0ltv3RoZ4mAM/yRKljO
 hcdKlcHsANUR8YREA1BgLzULAAYGvzhqCEK8m2bARbX/u9zG4yFKZhHb0vljTF4LiAffsSrvaxF
 8WZbx79NeJPiqWxZC+qD/zDmBaGGYxe9OlEjeG9XgJDSNyaSJagrmeTMKR5k9WhcxU2tDMLNghw
 C7JzX8tm
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf4230 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=yfUVIRKG-kQQsbwJQfoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Mon, Sep 08, 2025 at 01:48:00PM -0500, Bjorn Andersson wrote:
> 
> On Sat, 06 Sep 2025 00:53:46 +0530, Umang Chheda wrote:
> > Add support for Qualcomm's Monaco Evaluation Kit (EVK) without
> > safety monitoring feature of Safety Island(SAIL) subsystem.
> > This board is based on Qualcomm's QCS8300 SoC.
> > 
> > Monaco EVK board is a single board computer (SBC) that supports various
> > industrial applications, including factory automation, industrial
> > robots, drones, edge AI boxes, machine vision, autonomous mobile
> > robots (AMRs), and industrial gateways.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: arm: qcom: Add Monaco EVK support
>       commit: 49e55bdbcbe0abf04d7c8c882d69755ecf43d878
> [2/4] arm64: dts: qcom: qcs8300: Add Monaco EVK board
>       commit: 117d6bc9326b1ff38591289f9677e273a9a467ae
> [3/4] arm64: dts: qcom: qcs8300: Add gpr node
>       commit: 89c85214735b633e846d8f6473fa57ba4cc11b81
> [4/4] arm64: dts: qcom: monaco-evk: Add sound card
>       commit: bb12da95a183253b619ca1691d6fd320b7e445e9

Just to check: did you adjust it to be qcs8300-sndcard?

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

