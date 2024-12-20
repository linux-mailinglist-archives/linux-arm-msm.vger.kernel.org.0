Return-Path: <linux-arm-msm+bounces-42955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4709F8F83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0C11168726
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C5B1BD00A;
	Fri, 20 Dec 2024 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShdJ6xlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863A31BC065
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688731; cv=none; b=NVnE1tIONlMLdFBn06Q/I4iDR+1tJP434ecap7XRJo5+9qPoWgoT+1K+QSK2YooFhH+UfsJxlWfT2MKgfbGd0YR6hPzMN/UsCMme9lZlxe6sa6p5pwMcHKFL3ad19VAOgFk19vk5Y9QsG9YYzn63f3Bbl7RyVmJ0EUdQuwsfl4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688731; c=relaxed/simple;
	bh=imySxLI+xVtc5JfpHMAWOzIYiN0ng0zYOR6IfzQEzAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsgJLTUlfJ6azu79Wsp/u0gc8Im+4UutqY0dhndshMwuc4e+tZ12DUrzigr6v3TZBeVwAN6v0VgCnp4xMPZdvkQRkcEfSbN9ui3/nXIhLjjT/6d7AF/3ri3EXo5zIt1+XmXxnK/bsFzxNL1JwpEtFab63VRcqgapDQqa3cjbeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShdJ6xlT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4Piaw024660
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blksKWbfz7iJ73vjVjSdGaxJFijwIi/hjpQpMcGlYQA=; b=ShdJ6xlTXIxnP3k+
	kEBHMhqrxaI9RAz1ZLTYKff0rfg+jDOI1RvrB0GNfqqvzKcZvdtX+h38F0ex1sj8
	DTIjQRIsw4h8zfb+eDYa6Ca2QsWbWRhZsAARs38K/vE66ThHEBnlduDbEBgQawi1
	Yr5jJB38SCbgwZbfKV/z2OizaW3nRM1uV8J9S+AX0vlai23BwUC9trT1Xxi5JTzX
	AOy4EEn7WDk4r70sfrXM73LmiNb1Sd+nanZSKg1CjJLePihUzZOPW2R8IVNnoVyX
	WTODXymuYAVXothUgUNnk38OZ5Rh3/itUOn0aviqi26s6iPv2G0RwAHjbgclz6vo
	F5Dt/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx0u8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:58:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a0d7fb9fso4414251cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688728; x=1735293528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=blksKWbfz7iJ73vjVjSdGaxJFijwIi/hjpQpMcGlYQA=;
        b=hfG/HCkjb2nbOSJsP5JG//9aLYVfE6hjkSEEVMt/O226kOPuVgJx6tHXViE6rk5L54
         N9nxGRR9gvpDi4oHzvqwDhOYkXUjTbxdjHjKBdduIiVtu/iu34nuxkXY5Xsl95pHky/m
         REKQphkP+CfVnsrBpr53XwKmJV+/32vWDzmhmpvPcXUyNznant9w9/dK+kN2YPQ5/QK8
         BWI+UpWn7wHmEf9aOKPTRKVj2I4rUpbh50jhP/2ueXwEzNHfoOpkXuVx35DbwtqDkzGn
         vj89KwGo7Zc1RYt5ozFUDT/enI/70jOHXF+LEIYMGnehex1lawYUz2oU1wM0rKOy/Yvn
         MOGw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOFd4XsuC/kz8g4r1dJxlAoISj1BgAlK7BBsuLq1PGVFERFyXpjAgEJeOuQv76L42tlunlMnC2/BwlOeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUNQ6tOW8lsnNUpkzp650wLsk8q3JF305qdfXD40pZJ5YctWG
	HH687ZFbgbbMseNmqOn1CW3lJG7jAPU1yC8OQYan+ULzNCEr9sNLUtqpSt21dbYWhP9CdRCmQ5r
	lVSUB7JYRdRwN25VMInBjihN44MTvG/I5emJQiKKbB2//hJE1oJEqyV96byDsseGj
X-Gm-Gg: ASbGncuO/exWfoFCIapifnl8IZOJi6wUbxffL7WSJT/QtOQhRZl4SzsNog3z0Hmp8dy
	+IpU7vqSnkocUKLhYNDSmMWbMlb/KZQok0E2vW7RolrcH8kDTv44iQ1U6hgj651IggfTGfr63HX
	hc7o2TnUC7WpC2PI1CFTsVHko/x0KB0Si8/9f2ZiBsGv+zZLlT4cTLs0RQhZxzODAgscu1KgB9V
	U5oq/rIxJNmqrxa/aC+OM2LunU6UloKleg6qLwAXahm9DqmoYGmJ1Th++X3dwgGYXezKn8tv/gM
	IAnpO1Y6gzOKlfMBaMFd1ysLB9Dj3D3bc+w=
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr14303991cf.0.1734688728439;
        Fri, 20 Dec 2024 01:58:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg/XjXPUy3NM6qqF0HqwQmuUXctgdk+5eZjQ2B4M2wRVitgkcn6HzJBq2Bl8mYsFSmLBXKYQ==
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr14303821cf.0.1734688728096;
        Fri, 20 Dec 2024 01:58:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f7casm157398366b.3.2024.12.20.01.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:58:47 -0800 (PST)
Message-ID: <a41eab9a-665b-48cc-aa4d-63ddfba27dca@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:58:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for
 blsp1_uart6 rcg
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org
References: <20241220095048.248425-1-quic_skakitap@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220095048.248425-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E5hFcpue_c9WJPuGIi8JYxeqbsiJw6gF
X-Proofpoint-ORIG-GUID: E5hFcpue_c9WJPuGIi8JYxeqbsiJw6gF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=834 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200082

On 20.12.2024 10:50 AM, Satya Priya Kakitapalli wrote:
> Fix cmd_rcgr offset for blsp1_uart6_apps_clk_src on mdm9607 platform.
> 
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

