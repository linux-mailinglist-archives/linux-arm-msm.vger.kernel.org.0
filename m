Return-Path: <linux-arm-msm+bounces-52855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533FA75F43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986B018897F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 07:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F9A1A83F9;
	Mon, 31 Mar 2025 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7ck5pAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92F1A5BA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405078; cv=none; b=qM0muqc7myB/19N0zZpeBKbJx+yBWlgDdjr8D094uQJVmN7xPbTuqsy672t7Wr9dXpYW9P+ItIXjpraf6MdV1Uz/P+mKiNqPm1l36gI6tS+JAMnL6UYXglzQxOujhWDZjrVTIrglBS64S7rjyrm0VYRLGtaKp95E1XjtUlx12hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405078; c=relaxed/simple;
	bh=L6rn1x5A5+wfm0PDKvhfGQ+BESKOMDaxPAF8sMzLBm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8p7Ce6rnYdu0YrCcCW68cfqQf9/SrBecv4i/bQONfUSPccY+q7atVYs7/A4RPTNd2ssh9PISr6DQsMBS/M2qHsFwbbdAS2gc0m6edb4gcc3OzfMUuusB+yeAZp5F9YlLCg7SZMUzffZNKwfazEA4m1K9V6aX3FZRQxYAqiX498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7ck5pAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcnT003574
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 07:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RBNFJsVWL4PgXAzyuuowhh82
	Jj67m4jlsLI/4jjzPZo=; b=e7ck5pAfFLHIUTWl3tp8w9Yj51/6YvxyF8IBEKq5
	vdyxq6Asj4FXByhDncvOS+j+p7+FDcL2AHU0Jo2AGTKFt4Nf0ZtWPy9lU3uEXOO0
	gK8kG5TacZ3MYCJTsQhXmafAfHdONDIQowm6OrQ43VgRu+pZ+8fp1nsdJv2DScMd
	rmHoSe+Sms8GU/BGTQr5hy38XUecxDDyBecf1H/giRduCM7ykwKBlQCAk1rUkB9A
	WKhJg54mAM5TnAqMSEjkFbvZuOxhBVaI310CHPIw+nZP6Z4p3C6yaxITT9RvTYVc
	wyx9+HBK2t9lXPBVi8GFxaxTkemlmwlp61gKwPsmdXysMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935uqg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 07:11:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0a3ff7e81so769129785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 00:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743405075; x=1744009875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBNFJsVWL4PgXAzyuuowhh82Jj67m4jlsLI/4jjzPZo=;
        b=Iv7MdPFd1PA+pla5io8cRYJkXgRsQTNF/eEg6rjzygzXS6ym5YP24XVuWDxxwDyCVb
         T34S+QNvk7o8asD9aNtiYazpQqn4eiEht9pZ152SzuLsTKyjnOx44mKqrNyBoKjWJ7VF
         dcL0U5SDPDNLjl0vRViB4e8KtK3VzEwzq4x20TqPhUX7W9OFOfRxClwi/+vUQGwXlUBS
         pvHMX8BSIor95DUzIrfGlyuI/gb7VwhI5UmKbhP1jVi4FXHAMBYvHsyttg3HEu0h64sf
         CzN8DccLI2ZLGGYH7G1ddgm8D4jtvk1NeDI5MMwm/wWtil7XCCnNnG/BDWzZw/4wVa1a
         jPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXApRBvRMe4/3YSqLiv9TmBy49ElL6586JSr7cUR54IR80H1zSg2NgDniEe0R9vttO5lna1toIeVwvb6QDY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4g/udSSYYqMolxw9msQZvsrv03JYEIM6cOGOJaIC3rdWFkTz
	98tcSyJRI+CcEJMS6KxxT9ouNG62Yg7QNr9quOTzrnaLsWGiHj6oLUxJbsn33zgL5iwFBWmOVMi
	AWud+PIGwN4UWQY04PKGEcXifGWWCfcUjCZXw7DQSQgTd37q/iZxeUGTKWV+QIrqA
X-Gm-Gg: ASbGncsw2jqQNr9Ej8wYzVO9SWF5bRl5g/9cXrd1kW+uePmyB7SK8XUAlapZmk0yfI9
	fmOf/qX/u1DOPo+1zKCzklToVzHo5gOOH6qm9tbOhqROXUUYJeO9IKLMeN+UVKJ6CK9cHcLO806
	+LYX8Biqg5RMMu6hEiSP6DyO48cWFbw68aj1CoEWJR348UHdAanwpJTAka53ENmnzR0bx32193+
	KcexCKjLBAqw8ZnCQr2Yp/Eyv2SzvU38YA8ukLUbw72KGGY2bZ+0aNZR/jVE+qM178sB+/oo6Kq
	dmTPg9j+QOumdgZiC7ZJg6XxwHEH8/TAyoIvExbSg3jXOOmvzkVFwXQ+49bedJ1tUvqGo7MNEZY
	pEkc=
X-Received: by 2002:a05:620a:f02:b0:7c5:4caa:21b6 with SMTP id af79cd13be357-7c690890298mr1124964685a.57.1743405075195;
        Mon, 31 Mar 2025 00:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvEzzN33wSfCePbG3Q/WA5780zBS0p6jY6oM8qtQY6P59wr29Amn9FE8eXSIJPxOmRJUfAMQ==
X-Received: by 2002:a05:620a:f02:b0:7c5:4caa:21b6 with SMTP id af79cd13be357-7c690890298mr1124963085a.57.1743405074880;
        Mon, 31 Mar 2025 00:11:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fda2sm1080882e87.158.2025.03.31.00.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:11:12 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:11:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Message-ID: <ou7w4hvbbz72nzrm45gfhpq2uzkuwpfudqeh2o34tcnbnazxgz@glmuryu5dh3s>
References: <20250330212729.3062485-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330212729.3062485-1-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: Grbx8rhyTCTLW_HBgG7UAVyt4wjOxNKc
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67ea4014 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8E0pdk2udJ605-SxWBQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Grbx8rhyTCTLW_HBgG7UAVyt4wjOxNKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310050

On Sun, Mar 30, 2025 at 10:27:09PM +0100, Aleksandrs Vinarskis wrote:
> Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> Derived from:
> arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq

"Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
WiFi/BT pwrseq")."

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 


-- 
With best wishes
Dmitry

