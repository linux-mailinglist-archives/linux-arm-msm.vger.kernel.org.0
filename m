Return-Path: <linux-arm-msm+bounces-96624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFfNNrgEsGlAegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:47:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444224B86D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B68FE30AEBE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE2538945E;
	Tue, 10 Mar 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ALmujp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdFGCRxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4A388E65
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142964; cv=none; b=IIqjmIRhYPVv+RZpBj+cqcp183KnTWeHKjpurREjluSowxi7fwOyQI6W1Qa7ixeVd7edMMKdRIAhsybR97Ax3URv3hsyaBc6RotSmbyGrDnguuWjmuyrFJeSy1v08x0Dn0HoRQ5iQXE+DT1NZrDHMWiaP8KPdOVk/lhfvuTrQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142964; c=relaxed/simple;
	bh=nWcFV/TgJjUWyb5YTMgRKEfjE+gwDbAhB7ZBjZjy0OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCOCZHg0yGpu1ATg+ZJ/TZNxaZwM0z5hLZoUBLmOvfbzmaIFcakZ2HGrCVCjNibuOKc+eo9VbWroZYblcHo0zVbc1AurQ4ZF90akyMhSXpv7M1Q96wrcMTy5M7qUJFrg5W+Mh6fllMnq+ChbVqd4BI3TFRdS+TnUUpKzRKLBWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ALmujp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdFGCRxx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8fgqb2460725
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=; b=V3ALmujpwpcUR1K6
	N7Wu+sbXPFwt1K9M2mqE3PIVUDirWHUYHezgR7RbWat5c/062JfmPqaVJYM15BpE
	1yZofLi1KhJZ187ZqlfLKb65smYNDSv12JQuziALrBVON4O6fJEbLcNX5JOpHThj
	9GOUwS9K5FxfMxEL6QQVXmA7QfdDTftovLru0SCOxyZTFDjYtEe89JuteB3RQuyG
	rIg5BCdHn+U1WobRUjYZekOiaisa7S0wMo9V4ZrS+v3f/1vMbMW3JR4CpKDa8R0R
	tqd/9KG8DzOOZLat1ucj8M+VgF+39e9S5MJGsNEGGR4dqt9TbDDbh4d8WZ5P62Hc
	cSEhjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1c3jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:42:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093245c2d4so502211cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142961; x=1773747761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=;
        b=CdFGCRxx+BcGT+k4YdiQvv82rT1793M2ngNWvWT+RUCLkDDYMUHxte4t/ga1dpLLKY
         OSOovwcpdWr9yYcE99kOpdjQQHkVGU/VX+iqkpxiwh2c4cm+98Ro9NXXCtlC4XmCJDnM
         Y8LEHiB8UzGcbDkg0FGU6cJNRXRttwjIHF97kD4FZdsTHuV1vl6JzQtWfuWMXhpocECj
         NJiI2otvrkFeXkjElYofskoy26B+b529z8MnvsF+f04nk8qA05BgV6kJ13eY3N2dUu2h
         o/ksKbNJWXFw62ZQo9L7yRJ6g2mhfGV05ckEZz5y1HPk3yOFJsxzOPeI3d6DHRMrYv9s
         irHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142961; x=1773747761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=;
        b=QJBQ6Nylxcbv0FIZzktVNtkfGTU+gPaSVnmPu5lR/UePbez+6TbWydrijIz/tU2ngQ
         uLMLr7W5jdU+x6hKPVuprvtxOZKWC+GGVDNjdJZjg7Gvv7+lYdP/l4l8rOQZRGsIdgfG
         koNvkn9gkmhj7VfhLafidztf7OQ8Khy0N1HeWIyQHfh6m7xtLS+w4HIfD0wR+euoTJNR
         KAJatVBeK1yva9IZqE73wTFK2UvbgW1kC+j9lQ+7PvPnBcPky28eOsbbfRkgts92BYkK
         hlAzS31hVeFmCA/mvwnpJL7SfSNlHgWCfgzd9xr/MooJeaEjJjJb8OckJ/iy4uFWOJv+
         8b3w==
X-Forwarded-Encrypted: i=1; AJvYcCVMGLJ/Zr0tj2xxGhynlMykz5nyISQAfJAtQBmIquNtlOL6uBaiQV8UirpiHiXQQ4ciBNqQ7iDS1PpsdeQk@vger.kernel.org
X-Gm-Message-State: AOJu0YwjY6HkKcydo71npgupOn1T7dUG75G2ze5LO5QFNwfrqaxozc8H
	bZ5HkHq5WCzC2aJuhTKNzqiRQ+yjNAaMBYzPjuzmLdF+kJTcpSTPw03t4RjyDUDtwHo8NRhNO42
	yV3gbyYx/AE9BJBMRPWi13Ic+Hs3AGHgTQUjWkJYgd5ceZ5+VxbcYHSE6kGEbP+8SuwIj+fyltP
	XA
X-Gm-Gg: ATEYQzxxG5RqWKUCOc77fsvon+FDez3EDDaDq1sGQxbFC2ThhN0RgO9vJIcgsxhboUa
	o3doE9nnZL2mL4Qb4fI2YJx8N61CuCephkbtjH7G5d/xEhj87ACMmNgVuKMlaBMm/ZHkY/DY4dm
	rSTuOlNdrc5CmAGDlceoSK72THAVDBB60xDFjyKmmqtoNZau7IuDr/5hFmljpIK2GFdnZM4FaFA
	EQJRMmQFzDl4xaE/4bG75shpXSdndr1QJmqkzigiz+xfmybZw38oMiydcCWnpPEWjcqUv+3f3Z+
	u+cY2cMV3F+9+sT/Mv92XL9ahXmat7+kDQdgF4r9GEAZtXMw5BhTVjluSWPhb8GqBaQjtR2J9W4
	GDIaSTOCuej1879ALBsem1cb8Pbv73OH82zcmnZc1yhAqfCeC+1TX2W5gBtEjPLoDKr88Z8fyCV
	K2eGE=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr621894385a.0.1773142961119;
        Tue, 10 Mar 2026 04:42:41 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr621892185a.0.1773142960709;
        Tue, 10 Mar 2026 04:42:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b6a1sm467184166b.18.2026.03.10.04.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:42:39 -0700 (PDT)
Message-ID: <09fbf867-7d0d-4f8e-94c9-9b3353058f76@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:42:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: sc8180x: PM-related fixes
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e5pnRI77l-l1cYJ939HF2f4ng1Q1AFXE
X-Proofpoint-ORIG-GUID: e5pnRI77l-l1cYJ939HF2f4ng1Q1AFXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMSBTYWx0ZWRfX9R5r5872n42G
 gULEumw0HHSpIjGDGQ4ifaMOJ/ajaVRkiJbVYLwVQ9LZlaintgddj5CA3WNcEvit5gjoK3Zi0HV
 mN4uEqwOjNnY+NyCL5I/RzfZNs+OuHomxsbCPM1Af9ANZ9TMDynW2GH3PVIiIBifvOhGaSZvbmO
 Kze6OikhBF3Q+npl9KcOeAXRbA/a2LkvYiCK0UtxRFbeNRF5eJvSkPqPZM+CLjilblY0YHEY8bL
 MQoxZEd4g0GvL+kksVqRFU5pFbGc7SmMZ+rgEuslNbcaO+cGJaGJStFsj45k+G7rdGXrZFzLBgk
 rOilpNLSjLVo1Zfjkq5776GnkQI/tCwo9OJ6LjfQbi+4Emo4MaT2uk7eYZUnIcR/ET6E4jbW6Pi
 GibY3aXCMAyOm5w7EywGbRpD7Ye+48bpu7VgTgeOWqO5fA5b4sdKYmOpBJD91B0BeU3fC96wVMu
 oNhu7Z7f4CGXZJA0VDA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69b003b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UohXaN_ZemWmdIUgp5IA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100101
X-Rspamd-Queue-Id: 4444224B86D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96624-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 2:00 AM, Val Packett wrote:
> This series mostly ports the fixes that were made over the years to the
> sc8280xp drivers to the sc8180x ones. (With apologies to everyone for
> somewhat stealing the commit messages in places :D)

imitation is the sincerest form of flattery!

> The most pressing issue this resolves is s2idle exit on the Surface Pro X
> being slow and breaking NVMe:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
>     usb usb2: root hub lost power or was reset
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme nvme0: Does your device have a faulty power saving mode enabled?
>     nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
> 
> Hopefully it also contributes towards improving power usage eventually..
> 
> One thing I'm left wondering about is 8d114b94fc39 ("clk: qcom:
> gcc-sc8280xp: use collapse-voting for PCIe GDSCs"), not sure if it
> applies and if it does, where I'd find the values. (Downstream dtsi for
> sdmshrike, which is the closest SoC that the msm kernel supports AFAIK,
> was my only reference and it doesn't seem to have anything related.)

No such thing on this platform

> And 9410fb940114 ("clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe")
> .. we don't have the _src clocks for PCIe defined at all here (o.0)

It'll take some time before they become useful I think, but if you'd like
to add them and boot-test (absolute addresses):

pcie0 0x16b028
pcie1 0x18d028
pcie2 0x19d028
pcie3 0x1a3028

usb_pri 0x10f05c
usb_sec 0x11005c

(all are phymux-like)

Konrad

