Return-Path: <linux-arm-msm+bounces-85631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0DCCA6B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 07:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EA0530487C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 06:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7634131064A;
	Thu, 18 Dec 2025 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgPCOkei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVNcLT7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CF311C38
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038444; cv=none; b=Fznh1Xuv0kd9Y4F1jt15sPZWXncDdXv/OzoU0hyQUFE9UEkSHY9Yrrml6xJCaWwvQ3FqE57ujnnBWKYkCzd9zgR0FyhQv4hAqUTK5Pnx2IeWX6c/A7zGmxB1qpsxI6SYUOiKiA6iYH/c7LjesoZiFHuCHZPvqKP9neK8OXdIG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038444; c=relaxed/simple;
	bh=jn70ywdX/gpLHa89qdo+dtRBqFjZHwxTsX20hKp8N3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JyDh4HNywo5vBQr1VCcV6zGGFylFUpON0iam6W2cohWZH+l1K8hmxgv44daDq3I9iv2ttlY8VLtGBOKQ9WsYzRJlI5+YC3lnt04y5T3NV38R6/0RmxqAomXMmhjoEj59a/wPI/+dRn5mmD4km8KiatUzyTJV06zFdffCbbHdiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgPCOkei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVNcLT7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YjNp3717113
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kJ6UUwhcE3rIAszoRnhoodK5ZgSTOrtwR0yg/qVU2U=; b=UgPCOkeiioyybYHX
	r9TZoe+4V2g9l+VE9F0c8IIUXWC1aIXmlnAzD9TOO2YsRGBgX47HDR+voLGyv2EU
	g++9f5csKH0RdvpsIU6795MMhdFCRynFZjLBuT6QyLAiw474VptmAhdFO0h0AlPs
	wtzPmRNIodGHulg5EGITlncNQXk2TwWrU8p7ta2sfNODMG7K4BTsuMlScVrrZEnv
	S4dNLQxyrAdNr8IlWNGMOU/Pk7B1eNPBhlfazAK4jsKy4XCgFKR2INpbIe6K6EP+
	f3ZuJURTXfHe7CUCCJa5C/1DRW0mJlfBI+5DmoH5VmqE5Gq95tIOOkz9rpCAXGsB
	7jW0NQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79y4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:14:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso809753b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 22:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766038441; x=1766643241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kJ6UUwhcE3rIAszoRnhoodK5ZgSTOrtwR0yg/qVU2U=;
        b=WVNcLT7wP5eXzTm/qHBVJDBjIjQNiVGS2iR2mHhdMgIhzbBg7lW/iIEmL9A9QD41qs
         Zuoub4cZbHS3S+jeOF4pxnxipE4BHIIoLRRd2Vx9HaCD/jH2V8OyioY0HdeQQtnIeMTM
         9HghwEjSFVuYFuuIKey5EpiYu7+T5nQJ8crmLREvobMXNWVK9IOUDrsyD2VUuOd323gk
         E+blQbOtE3FnDn5FwisaM83PLAm1RcKata8K60rc7RDckK8K66tVd+K5FkpqqctSviYu
         KmfV9391Sdr7ss8e7gjsJW79kRD4jA5Bkrmtk8YvNtfr2S8fNJ04D/W0EOznnC0NhgFV
         hSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766038441; x=1766643241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kJ6UUwhcE3rIAszoRnhoodK5ZgSTOrtwR0yg/qVU2U=;
        b=dZaNGXIbgk4yYxLV9EgOA1BEeQOQEA7OvpRX63N/qRKm4uEnokmfDyY3ysJIOgzKCB
         4rZymah/vIOSB7PPLcKN2/5E3+iSNyJ8V3PK38hiZgXKJvnjIWdhAzheLlPHlGpB86v3
         QBtXRvS3SlF4D8L35G9NSorjONhT2gus80Y/d9NI4S+/MFWLcpQFIutWsrKFFF6kBVDb
         scB9l0E2IBcV0JXKJfrZzToG0wSCDGq8yRj5Uv9762CyVSIcPURiHJAYUDb1Nz7xyMxi
         zrHTnyylCCxA3NbtaT5KgdIJ9yCHGDlvhgBZEDX3JkDflyjFQz/RtFUAJZGsJT9Z3hW1
         24wg==
X-Forwarded-Encrypted: i=1; AJvYcCWnhGPAQ3HPj+nWscdddzVbP3kZ8qXbAtCZZVPhlwyO3xCu1/BoGUgbbjtvRgzexIlU9rHTukLqwXVfOZ7j@vger.kernel.org
X-Gm-Message-State: AOJu0YzczoV4ZIjRxz1is99wwu3cPkd41F1FD/otD2aNK/7s5fOcKhk3
	iEUdjj+zo61o/YMAMRd8jfrr3T7NvwW1Birfo2kaWzIlklRDNRAMCbU/y6GGWc1X17LythdYeRh
	H5u+9JNqFbwj7M+s+jxfYwATFEoOiywoNgEmv3IbISXhdXAxATjLCtHaIwGnA/dvcfNku
X-Gm-Gg: AY/fxX4Me61CubQ/aEVysv8jKSekf9/rw9n9zMGlJtdIEx5OSWhSn9z6XIxrj6Y53Dk
	+7B5pwrW52G1vSZSRrvSMNdrlKI1heqUOh/w3uXlfn1wqECYbWBKR/8oWwV3PuoFYTQMGOGZ0vK
	Gzkusne6Sa2XuM+FHDRvdr1U1Y4I4qUGez+mbbBu1xwTU+XTAKXIzCt8xjgNfqZJXcIASi8ArxA
	+cnxKbdeHNts7tY6ocbAwICSjJt46lMI31Dh3QBDm/wsJar+XrAOnsNN8lwjsoNGRS0akn9GM/w
	v0e82EI+bwox8OkTQfPtmJII4uK7zANpSYKQluRExAUqAf/RF4LGkGAgQIup59GI4ynJdd3EYiY
	Lynk07Y9Hovg=
X-Received: by 2002:a05:6a00:430e:b0:7e8:4433:8fb6 with SMTP id d2e1a72fcca58-7f66a07b23dmr20074103b3a.62.1766038441550;
        Wed, 17 Dec 2025 22:14:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl4mnxLasK1BJk18MFOX9EHZ2yWedAuh8yyDoiLYuMCRvlDIKoojGeq4Q2qMy0BEfqdqRz5g==
X-Received: by 2002:a05:6a00:430e:b0:7e8:4433:8fb6 with SMTP id d2e1a72fcca58-7f66a07b23dmr20074085b3a.62.1766038441088;
        Wed, 17 Dec 2025 22:14:01 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d851bbsm1358948b3a.34.2025.12.17.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:14:00 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Niklas Cassel <cassel@kernel.org>, Alex Elder <elder@riscstar.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com>
References: <20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] PCI/pwrctrl: Major rework to integrate
 pwrctrl devices with controller drivers
Message-Id: <176603843625.18353.5483272070289729221.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 11:43:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 9FqM5GTUFthQhKbDbbRWr9-017p0aDRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA0OCBTYWx0ZWRfX1A1FCDB9Pr0R
 aNnBSgnDpulWXnA5l7T/uJqVB2GQL/L6iIa4iFzZ0dh2a/T9eSFK/VwyF95kMPAWsqIGXz5Eaq9
 AvlGk0eNj1CPnnqK7yg/jMPbP52fkNVlUE7LPGRSzUwZ0n1tT6OoHUA6/XlanNNlZYtUdpGK7iA
 EwNkNHnUa5QwPzZV8Fe1e7Te/NSqPx42mB52FM8zJ6KEFJhWSlVWR77HHOBScfDodnBijesCmVg
 jSlFlVzwvsiDnwOZuVzZca+VzLdFHe/HnfZ9kCwNYDa/byExoQ7ujdJLDLuUUP12FlKIgSa2Nrs
 R9Ug68jakfmF4yySIDGCCNMu1wNhb0D9RvOiQo44WTeUzeNaZipMZImOi4RjKOuY0+NSyvYA5hY
 3E+8UAGanrTQYNXQ1fsWF+8B6Qwb2g==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69439baa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=2ooHDjnlQ54ReXCGMuQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9FqM5GTUFthQhKbDbbRWr9-017p0aDRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180048


On Tue, 16 Dec 2025 18:21:42 +0530, Manivannan Sadhasivam wrote:
> This series provides a major rework for the PCI power control (pwrctrl)
> framework to enable the pwrctrl devices to be controlled by the PCI controller
> drivers.
> 
> Problem Statement
> =================
> 
> [...]

Applied, thanks!

[1/5] PCI: qcom: Parse PERST# from all PCIe bridge nodes
      commit: 36777244652a7fe773bd7a1fe46bd3803712d3be

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


