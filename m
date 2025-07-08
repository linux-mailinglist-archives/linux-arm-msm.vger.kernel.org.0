Return-Path: <linux-arm-msm+bounces-64046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D1AFCB96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E1E486336
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7B32DFA40;
	Tue,  8 Jul 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCpbj28q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6022DCC1A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980200; cv=none; b=OaQ8Bs2qcvmzTEkolk5xQndjOuPaCG0Jix0nMmMS/BjWi46vhE40cG8aU/L5JGZweJV+7Ry9wgytRqMk63PP8XRca3VyHQORHlbiWrfyPB9kI07dpjbS2TZceGD48mUykTMXA1wvMhMrhWIkpAKs9OJ90NNziGRSOWaS/BsGVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980200; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XS9ccAncXwT016bZlr8aw55heCqmZwt9DGlt3c8zUCfMl98TTosCXCXeqgpafikL/wYztap63foyVo8ZzuGkyoNEDOf08kCfuBBqjtuvfZs7bUD/Lukf803G56qPQu4wJSa+pndiQ85/LAouh9c96bpzMl+cY259fnn2UTn+Rqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCpbj28q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAN9o030304
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 13:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=CCpbj28qOrmF3wr+
	ylO4OFXys2TQmkJ2Dmul5uQ3ibyYnDGD2l0rIL4VZTVNuw8+wmsDZu3FFUJvqWIO
	cuXSxQSHSNviD7IHV6qCMxAVfKjH8zVK+5igRyJeKLPbPof6oh0ONw2W4ozKgEI8
	9y0n5wQyvwQIO76VfJD3Rr9DFa2uw483kad2luphG4QLnlQMa0eKAs6JlEWZe8Jy
	qtmkRS1kgi0oS/hxsQ7biMretS3BroonJXIFUxbf+edCiduWrqE3DtFLh6O5iAig
	frEXKZkN1FvwgHY+yIz4yJp9C/kg605PTA4wJFSWG68kYhP8hJd5VHPXmhes35rU
	Btq1hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0u5j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 13:09:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ea727700so27586785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 06:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980197; x=1752584997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=ZfHUecgGni0sezwL97SgCE+KbL5ax+Pw06ReZuJTCASoHhsUQvXGF5VncL8ummHKPk
         7PKcp5j7GRVB/YSqSca3RgVMwFRQyAmHzqc3gmpNNjc94qAwIBF5H1A/GH7fXG+5dpi+
         4x6RBQz1A8npSGgZ8gUfvS7vU+/FFvPQCNgDD/zOai4k71JytUXHZfglCOtjmFITyZx2
         BQh+L4g1/zjg+Vr2IRXJbESN64EtF/4e+MzkkwlTVgS5x7qqt+CsCzkH+V1Rio1mUylr
         UfxTr2YanZqhI/kYK+xj08oVwpqwkXI+64kfnFf9hAzyaXZCNgXolbK5FbNde2Ge+CTU
         P66w==
X-Forwarded-Encrypted: i=1; AJvYcCU2OrY7LV5tXiWR1ztfLe7T6XzFYvuVI/SjWnwRkhKKVTy2gSQRrmuBi6mWrSh9KjsBtFkBBgJDfj60ieVW@vger.kernel.org
X-Gm-Message-State: AOJu0YxfvtmATdbD8wuW/87OTjdO6vut2ULoado9ALCusPO+ReKn3WaG
	xL/NFhR4vexKlqghIpd1Vijyi3lInVBeaNWRB+zY5xF/R5i+LRDYAidDbg9LG91L5EsnwpQ235v
	zD54PG1JV/US7NGVqLDPJYEYve9CNMIqZOXa9QBu2rFAlZys6CV91VXNsQUt52v+PhYo2
X-Gm-Gg: ASbGncuGMAubkwOhS7TqUoNsm2QMh+8fzPYH48hI4QNqChkwv8TMUtC8t/DA7itmxyp
	EcFhzbg1GSRnW28DiQFpfOnQ4oj/uSa3wJqyW5pbIJEsa6UryzETtefeoCPS+9cKi0uW3TJuJ2K
	dQ6znoPmNz39PxZ9FhKIC9YMhh+2fo7qj4HHidqiG37pPCK7Av8Jj+4EzJLwv4UDHhN9QhryoZj
	1WQBP0YpxGrwzLnUCS+pkYSrKTbFJ3854nTCrLqqvPNQE5L0zffWzxA/jS6UrKzoMCXVg0l9kQI
	hpjchohTI7beuC0A6COpna91/uaiUJZsaNhdQb5ry+4g4bzqFBfn3Q3NiI8kBoedrohDkEQySd9
	4NhM=
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978557885a.1.1751980196533;
        Tue, 08 Jul 2025 06:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2dYjcZuaIWrO6O8xk1UgLVaTuTICWlO228fFZW+hQppHyMeiJyzzbcXYRDvSDFCu/Asg4pA==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978555085a.1.1751980195907;
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb2f890esm7151467a12.61.2025.07.08.06.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Message-ID: <52dfe364-9831-4425-a2bd-0541286b4f74@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
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
 <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d18a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX15HNrwuXFZEA
 f6euyuGMASjm5FO7I+B5B+o0RUv4C07hODy5rchSPJt9O2+u6G6pK58wYkpgSYc6hsblqzLGLU0
 bP8ZZQ4aPLOa9ZTNdE73asPbcXTE4yuQmcsos9PF4yIn70DyRZEm5+uqUzOs2ZjW5ViEKS5xPV+
 fVuXEPBUh/l/oqxSRrkbWcw1zfVfk4DgZicWV7ESyJDUeSIYmaFutlZBwI5zKA16iejigKEiVt1
 9wmMuKQQVxY+QiCL9owjSvjp3Xn5oY7Kjp3vDIFeBpc0u+B8u7U63O5RJfNndGAVFp8X/Zvp03B
 wXA/df4m2xnvO7cnGYpbzBD81DRFD0D6yV1V5a0fwQCEdU08wqIa9+QLXK2pq6rtjgCj8a+DnrH
 rUt6SmMDNlnNgImxtx1UPJqgKG/yXsqSGbfkVWdPnf0kdJT1WUHuJ13FI4tNFUWiX7clYoA2
X-Proofpoint-GUID: 4S9emwPcWl_I8MdMmSbhcmwU0ifgv0gu
X-Proofpoint-ORIG-GUID: 4S9emwPcWl_I8MdMmSbhcmwU0ifgv0gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=796 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

