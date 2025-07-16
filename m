Return-Path: <linux-arm-msm+bounces-65136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E31B06D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 07:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12401AA7C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8702E7654;
	Wed, 16 Jul 2025 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZLQMUvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F52E7648
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644548; cv=none; b=bJxsytnaCGEtuLaZRLm0l1vZExVOi+2WCqzOluFLr3pc1I/9G5gOaO8WgVnbIcGCRtH42cQhTd4uG0u3YXy//OQ9uRVoy0GCFE6D6xnFaB60+TGv/5y+ZCs6igSXA7a4QAXXEUlyk6/5C4NtpqK2srMcTXpA2u5xDIE4CjnC6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644548; c=relaxed/simple;
	bh=9emCwRX9uwuuSwtfrYrmYODy1rDggg7R5huWmDv5WHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iM5iNLFqXc9BD2M0M2e+flBnebcg/9tRnDw3QvNiBccg7V6KgE7E8aMXwvW3pvCMujh+5t+YhHksDDU++I4JzPA0rJhtlO5h4IQtZztMWivsewOej9MHJfMRGJBx3yUkOjj8OUrAE5tvrhmFa6t8Dfc7sgOfyc2Tci2JyVs/4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZLQMUvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDIup025949
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fel58DiU53u62PDWQf0yyjSOhupfseMQSzLMoMrf6Hg=; b=HZLQMUvjxksm0kzF
	/9+x/GtcLWP6rJBlU4bAR6M+R+byICk6ggwdOa1jiP6LPPCeCYeR4XGnK1TvEGvO
	8wP6zdABQLvln2xopvdvm8ITEv8hvBlBrDmNJ7PDeBhzzM7dY3sUm9HVuy3Ojub3
	KlNh2fATU8bUqoSjh/MA6hueKoPJJAZGY6T5KOHBU5XBUXkNVm6FibK8VMZEsSpz
	Qsrilr+9cU06+r8NOiWyoLrJLpNZs4z+it7sDsNG4/Ijv0okz4Uj0QKhfGLAUgpX
	arrR2VeQ7GNuGM5DiZSYBX5v0ygXOkZLsTIVUiCCAIK1CqvqNbtnCCc7pHfthCIG
	pR3uGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy2dg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:42:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab657b88c7so38372691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 22:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644545; x=1753249345;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fel58DiU53u62PDWQf0yyjSOhupfseMQSzLMoMrf6Hg=;
        b=xF8BD26TvMhFdskdUfXFmV/JzZy7WAJ7o88NbvciZ1AfxFVOx9lblFux0EKpUJCNfv
         DWgH8Qs/IK3t2AduNAptlPGO/x+7n/6auynZR4UIcNNfh5N/n580F77cOb0D6V/Zka0Z
         8kpcNkLd+vpXaEI78Kvhg0q7yHwHhvIfYIr6yPF4+xeTgHtRskTfJabT9XjLfV3popL/
         A7NtmJFZIqsxRd8XHrCAKWyZg69d9efplxG9no/F80lf293Bx0SLr13Via0EnxWbqVqs
         YDndP0eT3TMrB72ssMsqfHLNh5h3exuwQZU0Fp+EPC9+T2fmYWOibqSE61z5+9iqrNN8
         SIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Pe4sXRoqKvKotKwOZNu/VWFjjM1VJV5uiCjIuNXieVYxE5DVsfmzzzFpsHWeLQ7egi+/ZNCQBUCu7NAP@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWcE1rp9zH5MtF1i+o3pqYSiWoIPtwdUb01OnTrzACnMhITdV
	/y9kC/3/ZMu3ykViju2bohAybNfXCsxdtjgwB8EtsSkQ72ve7ICmDdlY5NKYrjayi8DHKJ0SjqP
	zuqlriy/eoRYxKKe4VvVtS2/viHorL34ZjDj21MwA1fBlIUH5UvrDNLJqzi2RWKRJmlSX
X-Gm-Gg: ASbGncsEWHTWDF3yqA3XAqayzij9uVsrq8+g9PuorZWey7PFjsgRdXBdgDgN8K2EqrO
	GUMqg7fSXvRyv+hMNtUww3/bVnvrT8rXbnJQ/LidR9Kc8uDHQXa2vHO6dy6RN1VX23FsOThJ1r4
	hFyHMiuafmOiKi35qJX8SlQzy1T9eQPaCUCm2+bF1SuavXS7DHI2Pb7qnFJyS2xoEF2RGrGqaX1
	dnz0JGSZPCPWPsEmamVRlfB//hFn+74512aq5p5nDMEBAT8Ec4dzUyA8xuOge7XRDc8xmC9gOy6
	/Q4Sw5WhCveI9+DwBn05ye1ON3jHRlxcP15Kj1aaRXL2mhQqS1ZlKv7i5dpas4h0tGRFng==
X-Received: by 2002:ac8:5846:0:b0:4ab:62cc:971b with SMTP id d75a77b69052e-4ab909f69a4mr35149441cf.17.1752644544904;
        Tue, 15 Jul 2025 22:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3JE62vWEy0Kd57nuVo8vs0KR9rFmnxWCde1gqRMMqj/2wfqH1t7yA1ClSaDapY3QHD6Yi7A==
X-Received: by 2002:ac8:5846:0:b0:4ab:62cc:971b with SMTP id d75a77b69052e-4ab909f69a4mr35149211cf.17.1752644544541;
        Tue, 15 Jul 2025 22:42:24 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab82242a82sm14407081cf.35.2025.07.15.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:42:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, jeff.hugo@oss.qualcomm.com, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        youssef.abdulrahman@oss.qualcomm.com
In-Reply-To: <20250714163039.3438985-1-quic_yabdulra@quicinc.com>
References: <20250714163039.3438985-1-quic_yabdulra@quicinc.com>
Subject: Re: [PATCH v2] bus: mhi: host: Detect events pointing to
 unexpected TREs
Message-Id: <175264454067.7322.11906740521696501275.b4-ty@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:12:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0OSBTYWx0ZWRfX0NYISJ73k5Yw
 MYSosfFsUKSHPtcoks1CCRmBuLjsFSFhMZB+cxfOu84GOnAMBdLr1c0PPwxZHZYcY82jSWEx181
 Grvrtafd3jJWR/+QLjR3L4FNkIz6pYuahQjyrAr0yweeempbNvDeEa+jGnubjQTu/TyNsHINMzI
 p6uWwPQr8sG9/O3MJAY4HCc4Z2J5lwfpEMXjNr6jxwGk26Xu9gW91CWF6d6Z3jH2VDF8u7UBlC9
 dnHOHaWBv/JfGOS3DHrqGmYqtML3aq+iFhOQyup0G3Wo5YkBwh8NoagS3lH8ZhJaz5LqroAtYS7
 tZrMYIGG47UEo/7jQjazh6DPdbMcEzqbziEP5lZOZKLgypa59+0dJpdEMhM2aWvWJKp1h9z77es
 kTMXfza9P9HkBs0iiKujdwhFVb4f477skHpN/7K28Z+sy3h+s6KJRBjhbk5u1mXWTIVe+LIe
X-Proofpoint-GUID: dP8JRT6BgapXkkLiwuBk04ZYf6LN6u64
X-Proofpoint-ORIG-GUID: dP8JRT6BgapXkkLiwuBk04ZYf6LN6u64
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68773bc2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lf61EO2sYuKtChjirwMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=529 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160049


On Mon, 14 Jul 2025 18:30:39 +0200, Youssef Samir wrote:
> When a remote device sends a completion event to the host, it contains a
> pointer to the consumed TRE. The host uses this pointer to process all of
> the TREs between it and the host's local copy of the ring's read pointer.
> This works when processing completion for chained transactions, but can
> lead to nasty results if the device sends an event for a single-element
> transaction with a read pointer that is multiple elements ahead of the
> host's read pointer.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: Detect events pointing to unexpected TREs
      commit: 0bfe192d90fea2c1b523868a9c110d176a2be741

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


