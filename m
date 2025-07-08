Return-Path: <linux-arm-msm+bounces-64045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D411AFCB8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667FF4A1A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD622DEA8C;
	Tue,  8 Jul 2025 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pupCTEsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405262550D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980142; cv=none; b=NZVXaCIcCFpt7IfijL+QRnY2b8g3vlmf7ySz9pdgvD88cErBO9VpolyImyq3EO+NXmLPUo0D2a8+SIoF5e8Y6MtKtqg1wlzGl59yZFDIi+XWEz4b8H3MqRT1mfSOqCiMoAr7laHCRFURxtv5xaKz2/IzNz0+6sd8SPH61cnH1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980142; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iylM6zKUnMisB+BiXjmYD2K7Q65EJ0f3hQ13dBjXXeZZKHrRq/VnUPDFf4r9h8Z9nX97sAF64oMmb4DEp0ZEObFz2laRQb2riihTF9f/w8WoAmzqFao5bm2Oy1KYaVo9EaL0ewjL9sonFlUToE1MI3ke98VkELqgV7t38WJTxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pupCTEsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAb7M017098
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 13:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=pupCTEsZWKvwVFaj
	Fq6QywPPikTVuTb2opn7tBRmUSEnJJECoHJ01EtmgUVbLxLOaD075yS3vjJbXjIy
	eDLtOVvY9EXDf1XlS1m4glK1whQVre5XUxKqevxPd1z2Am0ltKXyNEGJV5M8HJ6I
	rDuNQ2aB0zc14xIOvLdnKnsree6PHxThRxB6eVgnlNPXkPZCGPZ8dUBWQl8EkfI9
	zcEglYLLg3fwOL5LnZwz46mYp2T91EJWAs41WEDy9VwMEDxaNFJu8vg2w+/WWyft
	yGYHLU8xAXjoy2eXqbmsHAa3tr2SnaAFG3+pmv5hbErRZVMbrPx90pAPYxlxbENu
	BRMTYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkn99f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 13:09:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso50810785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980139; x=1752584939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=FkNTzIlSKiP6wOcxjfdlpflZVI9FfTm6VYQXX79KpXo+VroYIl1dtfswS0ZxraMzpf
         MQMUPRBIetvsR8/YSTzitVaq0t2hsb6dQlRts+jIK7Hr0rw7UD2sFtVp1NDF30HoEStL
         X4oWwaZnNol2NNiH2vqgOUaWyy5/pQ3oBGkvIR1NDDvOmtIxd3aWP505RZZqaj6YsRGZ
         7dFfA8DXbJAGaWaAj7GJR9CuzrAUspT93+yCjHtHmN5bciXmf56YCO8anyDmLQsz9lts
         zN22TLnGuq6KBEvaLf8JyCBFdfR+uKPzPplxSNxQQ/OCNFAvRBIngh3THe7ncKrc4Yyk
         x3jg==
X-Forwarded-Encrypted: i=1; AJvYcCWtQxckahOVtzl5YVMbsMGVwKau851OdGu20TnjMmkYVk0ufFUZoXkWG3fjizbW6zGtNxxIic3H2BFCHcfn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ6GIl0VipIoZSDcSHMht5qxZ7zPXjVj2ISjmedMd2gGqKTMmI
	GWO+9vRldp03aEJJ+soVhsyAnb0MhLRhOlU/BOk6wi17xwChWJXtWuokE/FoxxOdS0qG8y/J4/2
	LZ0EA5TYDtiZm0e8NK0cO7OgWCEh6LmPvZN97koCPPK5g8FVQD7xDmlQSLMyBDHlEtqGN
X-Gm-Gg: ASbGncsnj3iVw6cdpLAig0AvXAw3mJp7/d9quGLLf6pw8V8LDoAPe5YTyLQF61SQqI6
	vaHWkzx8sCbFUxKn4Xji9jhEtO8AMkO/Qru7MIhkz5m3nTLppbx+DKC6z+hYcIYpw2U97zqB5+M
	BQmo2UC7a/ezln/yRnnmjgqK8onaFdL+VlBN1UnZ2iWsDszdmVAFsfSeKOK2BSaBgWiDdsc4NWS
	cj6RgdnnkKyC86OdmtpdfKfq6/AtfCTkB3CxDM6RcZV3SfNgaquXC6si9rtGnLxx8sjbBPkpJVd
	pr0HgeanC/gHbxwSackDI61mJSYl3YmUu8eFtZpfDdIc57MsZia24sfaMfR/dZ3z3BBcUaXlYX2
	2NHQ=
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765450185a.11.1751980139183;
        Tue, 08 Jul 2025 06:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTsfzmJAfztbrESgmPdNkncNaz4K8G5/fia2Gnn0NF2orxJ57CWlxeDI3ewmnGQ+XWEqAMA==
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765448285a.11.1751980138638;
        Tue, 08 Jul 2025 06:08:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb726csm906327766b.179.2025.07.08.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:57 -0700 (PDT)
Message-ID: <3cdef7db-4835-4e67-8125-9406a0532394@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX4Susw8lJ/gQA
 Kd1RM935vfTsCa5f/DOWXkpkuZqa+MrKrj3yIlMn5dZNvI0qIHbfham1YFGn5Zf7Akdaa78cFWo
 JrYB7b1m/5WWsT4602rgf1ZgATU9go1TueycKBHbpr3xz6NcQVEqW+RY64V1NI7+QtI+bfoZGzD
 mkWGSNGHYVKQERE2zDI+ndaQp56idTnCEtd2MgIVK/qNurBTNTcrVr3GloNXx13eHVlRlaleAyc
 QAamKPLNbXvxYgPIJ8Wqtb8hcvwmS5g222GYGQGAxACn7u9UZeLFR3sRlq1zLYfqIpauLt93gxp
 PPN6aWCpQqPLCxGSopARGbZ0xzbtGAwDRTWRu4WtTfSO8wq2V5UsLYpzD7HXEGQkA2WY9y/wcvg
 PABa20nq8SB4xXM0obWg9LNUtrdaULM3cAaR21g5wGAWgewKNEdxI2jtT8CmAC2DnmjRWmx1
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d186c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6uk2ePrR-nDVQS-g9x9_VOVUAHy_tgtB
X-Proofpoint-GUID: 6uk2ePrR-nDVQS-g9x9_VOVUAHy_tgtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=796 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

