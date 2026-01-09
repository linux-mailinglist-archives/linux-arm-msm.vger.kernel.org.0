Return-Path: <linux-arm-msm+bounces-88240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989EDD0839B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700C13070D71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D719CD05;
	Fri,  9 Jan 2026 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsNzaqk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuXIcF/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C81318BBB
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950936; cv=none; b=cXNp/cgMhY8P3UKBgo3RhDuOP/rbjR1dZo1ztdHEZdjYhyQaaLyrdddgJikjy2NZnU7FhkEfylFhZWJ/XdDEI8BKw/BMs6ieI/th6gjchdsTlcYt7y28VOdWs16GrSvGzyJAFn1pTFAxLbM9u5qumkOm/F95pYWn6HWBRprzflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950936; c=relaxed/simple;
	bh=kYTCB/L4YHbdTOD7hf9mh07CsbNXHbc7XowcRdLeJgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iERf/eCqQgI7+PFAJKfCKiSCwO9BrIHjtj5eVAbFg7hOY0a0R3SL4Cex8UH1tiHGeMIhhOGwRgijA/OCiyXckjwZCMEtKFpe2lawDE2WuKTRAKx9vBPrOIq7s+z9QApnTdeBc7gDN2UZO5P97kTItGoh9a1ekPf5rlNA0yWBiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsNzaqk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuXIcF/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096HTaC3019417
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEfRPuJfPIO4a4YKDu7GRpCX
	Q6wrN9cZ+pQjZslwhBA=; b=TsNzaqk2Pb3MDKyQI7m85mOUSpRzPXxCWKwdkgg2
	18fc+MOF3jfKfzrPhWQSPHp+tED9oZ6tJR/RBUrGgOocXyVCkNT5UMV80BgHs/mr
	3+IS82Gpq6fw+n8DbPP8WwrYK4OrVMtguLfpmUN+N/2NmB5eCnrXHhKKzbO1OqUC
	AjOU0NnyJrCcaZVEAdcwf+B2kRKDJUIxx56FTvJpyJXMtGdcUDQWqxubUqSpvPeg
	wqaS7gfM9HQhfh0V7YTgADwcDqLb5eB6Jez93Q8s1z6FIW8o039AZWoxhFU+uu1K
	bTvanVJf5eWGzK7MfJyZYngIGbwE5veBvpciOqEAJVtLOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3j59e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:28:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so612332485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950929; x=1768555729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEfRPuJfPIO4a4YKDu7GRpCXQ6wrN9cZ+pQjZslwhBA=;
        b=UuXIcF/T5z4YLUELT7kYeg+y/xAbgl6pOh9Toz12fF3KuE5ucEqdCrx/C85tI+0gji
         4q1Atyh2RLGoyuhu6wVHuU+Q5ob6iTjJo6SSGPFHjMZMC40HocT6tIEEmfCFkRVur3MD
         QiZsFJSeHQX5AXsBuEgvHvPjvgDGTlvoSogXgUw0W4+Bt9SdbWWaoi2Zsi3mtDi5B7jN
         4oJd/3vxzHqGPHA6W6igMz3EPoTYSAI/dKA83iHc+ODkua1eyi/YUxz0XjJuQdMAkddf
         bCBp3KuFK3TXSJN4f5yl0HOFqjbUbgqCVebE4yZ4jdWCy9toxseEhEyPbQsQ+BQZmE8X
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950929; x=1768555729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEfRPuJfPIO4a4YKDu7GRpCXQ6wrN9cZ+pQjZslwhBA=;
        b=lHEMSHIdzagOzReyAIQ00cJZYEqpMV6Srnl4Sy1bgkAQ7ugqiRfzw/MalMPoYBQtlG
         hnH8e5SDSAbNSfK/Igoj9e8YkkvsTZxaInRU7rS1eC8Rs7Cs3wLLgj8eNc7z1NMM0wRp
         vjUsO2egmqbwbjtEFjWL5L/OT+bzvB5TIgYh+TyqHvmP4YB979KhnHLZ1h7WMawdGU1U
         R2Gu7o/yj7dy2p2pHYSp9f0zCxrCT5d3YJS+Un8q3Y9VPBvzd15xilJuVY1dSUCi8Vq0
         OeZKTBIgFrqdXt62+i0lMAi+08dkBEcDmMtBdCarVee66W6k/z6fsQ9SwVksN+CKXHWk
         H30Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAZMEAk5kUFGi0lz6h+uranZWtC5IMrq29vSqAgcFtUbRYHsK5hRhRPmM7F5AFh3csIP2HhhDmSYxdJpiO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+vdQVSY0IMCLDYSzk7q0YlM2S/uHxukoxdzmeByKsvAfMJVD
	v2hAei++zIaob7QdCUdvPEs7CnmtcYa0ih7i0jUypb0+zL47FsOfO3MCPpVX6mcSDvSZokuwVDS
	FWFlCle1MQ94R0Np5LoYzlfiHHq0YLiYjKnFvdvJCBVqO0CjimLR0NXn+CpHM5b8bUpoZ
X-Gm-Gg: AY/fxX6+oaWFLSnviKfeUIM28IKTZ9iKAdTb3Yo+Fh3B+Km22Boo11KdzwkmKUNbw0i
	9MNrJTnop9cNIq4uw2ZFDl5xmEqgmFIlLBahI5AZHtuvUomsUoObWo7EnrYPT1oOR1VpYO288zS
	SiGMRMUaT5cOAzo4CnPxh04HN+USStCP+JtKxstuzf59Z6R9AnPEkWX5YMzuOOJ9+qaVY4UrD2Q
	A2ho9dQ6lwwQRSTITZ9zsb6LM1R6tE9aYwnB7/auk6OWl7SQHQx2+gSKhv0G7Fb207AkJe1mq1M
	8BITSxZdO54p5ohzYdY2o4YRI++wYNo/qvx6gbqKXTZkUDNCyTn3TtwckG3fQH0ofQ7OOFWJ7Ir
	AQkSH5FP1D/xrMelheDvA
X-Received: by 2002:a05:620a:690d:b0:8b3:83b:6e9c with SMTP id af79cd13be357-8c38940e5efmr1159352885a.90.1767950928717;
        Fri, 09 Jan 2026 01:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESKlavIIxl1Ha0Row7R8T2rvX7Maaz2fxMRuyWkE5PfPRsLbtuY5ok0WgCgBw0ThYZy84nrw==
X-Received: by 2002:a05:620a:690d:b0:8b3:83b:6e9c with SMTP id af79cd13be357-8c38940e5efmr1159350985a.90.1767950928089;
        Fri, 09 Jan 2026 01:28:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfd97sm1019058766b.36.2026.01.09.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:47 -0800 (PST)
Date: Fri, 9 Jan 2026 11:28:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
Message-ID: <srhglmad5fjowp2fmxvtoz4gw4knh55emflyhfoqyyhbq23ati@fejm7dya7cni>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
X-Proofpoint-ORIG-GUID: GULaFNxqjNPClT-6-rZFMa05JcIaJyhn
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960ca51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=bI0rxR5HNnv1m9k-B9oA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: GULaFNxqjNPClT-6-rZFMa05JcIaJyhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX3+kjqJuLIojd
 seX6Vif9HZXd/p6rZ4mGA7v+lDEEd+X7VcdxmuDLRSiOZruiPdRvGU6O+eewp6DeVYejzXPZKKi
 buYpxgujKZjo5UEH0ZgFc8cDWem3d2I6W5tNeTGu0PXeP+uHldAPN0dNUO/B4PEV5SpXjwm3bwp
 Z8+OanOIoYVTr+YsWsEjy4qN3LQwHfDON/4j5adPjsRsJR4bVsDUQhpv2VzPH9OBNA+A0P3J98X
 INZcppDhIWSgry0NXedSWE6cKb58IM4c/ozqxc1StiSxIJaZHaLg+fNsrOmUrf7jVgl66qRb/hn
 YhLU43MhwiFhavObWCMHvi50gEPmep413byRwN5GHDnKDtRLSRtw+f7yiorFvTdsx97pMw6obMY
 ozOZ2mqgslnJPPeOEWRwWk/eQii+9SsbH9gJ/9ItzfBb/XHcwZRpb3XvcS7bwji4YMvZ6VudgTs
 lhQRWXoVsyFSgHfdunQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 26-01-08 16:16:33, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

