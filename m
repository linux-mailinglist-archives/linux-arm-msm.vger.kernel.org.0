Return-Path: <linux-arm-msm+bounces-86064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B59CD41E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 16:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5DF63007FD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 15:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2187714A0BC;
	Sun, 21 Dec 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtuvB0tG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilxJTU6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE222A80D
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330264; cv=none; b=uIa1TQc3jYczRP4SyJ3qjwWuY5MVsDWzzOk1/vXJ84H09U+m605RIpbpDojLtJafrjPRXbyJvwUcyUCf+gmbyEq29bnSKh6qtghhzELEQVJWXQJLL5Ezlrg1rsXphC8LlLYEBQa0cYVzmykRaGTh0Da9VHslZntbrzhIiLFjf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330264; c=relaxed/simple;
	bh=O8Ljl6ny4gYtwfeLGWgqI2OsKwy1/hR6f6slv9eQmQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1VbmsxOWcaYLOedW2R0cXbtzDscJfHVhIIUXGHosaJZo4MQY+H5GrItFAAuieHjjhZ6vDIMvsrF5C2JXilLxa4LVMjQJS4atEUaG1T9YmWJ76PDu3zK/g8G9HfqqJpOAOaddl8yk2hjp5Y0JBCQx36on8FILS4gcjENKRyCSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtuvB0tG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilxJTU6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLCsNP42627494
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rJ80TQJNXIxDMVS/D4unPD37OYkqJJte/eUJbr6V3s=; b=dtuvB0tGdKvRHHjg
	DfKvuXa4H5Cirboh4Y12JHjvbIX2qp0TFJFlHZjnZvgYSHChigwiiptYfcpPAenz
	VZJHmvhMZCA5aBPYfAUtZbKJCT0vxNsjDe65J5Bj+0KmrP+uwq1EF26KGuV5SE8H
	HGpy5mzI1BqbKGbrMowp8ylbr0qqCcwowXNTzOt6hTgxoQy/8iQHXMT9ytwobiXr
	Y0mPuKHGpC5qrROFAY7mmux7ZYFOVB/n8TibCh3IvzWO/M4JSwIb3fLUX24s6VUl
	iuSMbvAeijMJG5QY2+G4X1of6pv1XAKdSuOLEXIWCFqcSCOKm+uNv1QFL2Sp1+np
	fO8jpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru2gxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:17:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee21a0d326so57290311cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 07:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766330260; x=1766935060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rJ80TQJNXIxDMVS/D4unPD37OYkqJJte/eUJbr6V3s=;
        b=ilxJTU6HkTWnSUSJreaWQsO4Eft6m2O3H5AYAZcV9BbYmQfElDKA8FvbmcczV6gK9l
         Qs6GMAqc3NqR3dXJCtlYBqxcG/ubjcCVVFBA95S2/YQDs+8Mj7HKlUy6H8NqoSUf8i/u
         Ksf1JzY1KF7mPvHXUtjuFCvgxwRwXmVnbu3PZj17yFrPcbdnPttOZipDKGnK4SPsoYYc
         R+bwK/CjXagOjC9HUll0jImvnYvUPqlRXiUlWxONiE9od1LsYqKKQgWnw0aHTqiVCsky
         BrX5RRHEBuQhX7muCVDeE/QbQggLM+UcQd2HJxjbwV40H/+DHK/eIcDt9a/uLhUFCiJD
         8+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766330260; x=1766935060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rJ80TQJNXIxDMVS/D4unPD37OYkqJJte/eUJbr6V3s=;
        b=oXfCI6Kgt8s7VsSdfnZE35SKukx47cgwPhPehDhLMJO2QwP+GbuW5sd3yneXyD9214
         mpX4Y/TnR0ZXJLRStGOw3xb0/jTNd77IHI8QR9URAu7i/KcVIlhJJNfrwXyOh+tYRpy5
         lAyb/QMdMaYuOLXTpRzL+krrSzB/Vf/baaPHE/lZQvDpKaOzY2aIXmIUXeeAL00J6Yi0
         E1MYJ7ZZVwbdnhwKjYwsUMD/9KN3AL/JtT1sugK9FB9F8kLksoYR4QOkxYvraIE2kYFr
         /hCi1hQ8PGyuWPpEDTwu+Lz8XXKnZUYu5llcAtDOzwXj9IwneHLN8hxtv7fRwfoV6L6E
         O2lA==
X-Forwarded-Encrypted: i=1; AJvYcCUEu+PNvpu2aZCPCkah5SsnpK9U31qRbDcqOelacf/c1ZxV1vAD/Ww2xI7j4aAMZoKSMmag8W6bVJUHafqy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cZjpDntKaTOjRs+ciA4KigC2Xqted4o0dHQ4S+lNP+hc78Yk
	wmA+Pg1ldgHZYueVqGnixyy8jxWC37HgnxNvTg+FER+K5NY5xAVF9zjFCJenpAHzlADkB0CAxOH
	QN8gS8Y3jL9OSRUmzod6rXlkcxZdO9F313l5fA3NAGNXFmmahuX6alDddwGEmUNfttunn
X-Gm-Gg: AY/fxX7y7hiFGQK8A8/tpDwX0ucsp8athPj4Z5gb4yZsKPNBbDJO454naeldPVFjVB6
	c81A8jcrIDg/pQx6Ip3A/BSMrWYNUsIG5VlFP2DR5hDK9HGQ+M7D7X8m06fmoXsP2F4DTGsYVr7
	z5lzATDesO7c/alWJfYgpk6nBnR5KwNWHNjTqQvbbL6TMGmtheOhgUp5gTO5a8+T+wz8UQSXkvF
	nkWOjcT05nWXpZm8ukuQ6U2u09cR9RWs0KTX7honxdXjelvHdZ5tNc9vWROXD2koGbhhUkMPGdl
	WamKEYX83Ay/3xGKqQnbbq/K8b26RWYv73q+ATb/XhZQd7ABZ8jrKPLoaWnNRjqwdj2ybmIQz93
	zwwmzYyAQXeVD9C/BZ+zQeg==
X-Received: by 2002:a05:622a:190a:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f4abdef53amr131922781cf.80.1766330260333;
        Sun, 21 Dec 2025 07:17:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxsoHvnfZc+w3gGdVW1PaCmmIwz4dUySH+IJcVNBG+ANeGJU2P6XViHoZuAPhTeBb1aaOQzA==
X-Received: by 2002:a05:622a:190a:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f4abdef53amr131922101cf.80.1766330259645;
        Sun, 21 Dec 2025 07:17:39 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b82e7sm7925612a12.35.2025.12.21.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:17:38 -0800 (PST)
Date: Sun, 21 Dec 2025 17:17:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <5mxpioeokzvn22oirgvp4gwjxvn6acvwfe65sch24fpapklvl2@x2rd3b4nrbx3>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE0MyBTYWx0ZWRfX68kRy4yg9d3U
 LNxkREnew5uUyKI8XNSbVLddvncT8kS8e64FQB6qalxE1QT9OKsvKF+6kjDclXVAifClAVeSRHu
 R7y1nrPpK6V4O2ZjZbgC91+clri+nwIh/hNL8QnxFxwmwj9VVe2sebmiePz/WniCQreZWeJz7ca
 wsLw9vTUkDfcwK8f7YILJvVg1dtNPdSxllAV3a4wpyw98rKPq2SFoeyD3cvpDVznB83IKhU0nk7
 Fg+ivq9jQEgwuB24ovUJdcsopizqyws6xXycrH8KrsLbNclBCBaFBEpGf2xxQyF9lBjyYuAn3ZR
 WvxD3/tz0b+euEQoM4If5GdrPrixWyslnHUEk9yLaFqEwlCcJkEEEkGaoj37a3qNmQki1BPmhmw
 /+pcPJ3R+hJVwJKXf6u/siFf3z1Vjht/elfj4yWH6XmkSZxVPwdBPWxJG4ZXay7bZYOfnCq0jE5
 VKOePOPYkWZ/48G2z2Q==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69480f95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=2YI1vyslcR4oq2EFnN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: INRfxsydH_Z6M0AdxbgbwCMkee1zgYtO
X-Proofpoint-GUID: INRfxsydH_Z6M0AdxbgbwCMkee1zgYtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210143

On 25-12-19 20:16:56, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:
> 
> - CPUs and CPU topology
> - Interrupt controller and TLMM
> - GCC,DISPCC and RPMHCC clock controllers
> - Reserved memory and interconnects
> - SMMU and firmware SCM
> - Watchdog, RPMHPD, APPS RSC and SRAM
> - PSCI and PMU nodes
> - QUPv3 serial engines
> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> - PDP0 mailbox, IPCC and AOSS
> - Display clock controller
> - SPMI PMIC arbiter with SPMI0/1/2 buses
> - SMP2P nodes
> - TSENS and thermal zones (8 instances, 92 sensors)
> 
> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> 
> Add glmur-pmics.dtsi file for all the pmics enabled
> 
> Enabled PCIe controllers and associated PHY to support boot to
> shell with nvme storage,
> List of PCIe instances enabled:
> 
> - PCIe3b
> - PCIe4
> - PCIe5
> - PCIe6
> 
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi   |   11 +

Separate patch for each file, please.

Abel

