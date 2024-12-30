Return-Path: <linux-arm-msm+bounces-43650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFFF9FE732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43903188060A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F08F1A7ADD;
	Mon, 30 Dec 2024 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go3Fp6oP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AF194A60
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569332; cv=none; b=M6E9CAYfBFnfpcCzbypFXL8ZjxBHGAQs1YB3LJKx+FYUKRW1PxHZwJoQkaOgUOSX3kyfSsPHMff5wJzV2kWpXbCFythLDedVHCPgPpN7ayssa25u8v/DxAlY2qzhwUKJjK/my7+/5U6qf20N4VdXszj0+7fZjsi3XsUHDOW8Hbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569332; c=relaxed/simple;
	bh=4/VnyOXrT3JGf5WsPvk3BVKaMaqy8D5O2Q3cR8n/yWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7d7YCLnO+Ey1NRYXlE4tGtO0yslcHwCvCCyebR1Bdu43P1tlrB6YCf6Rqf5cypjVxKw4TVawDW8EspJbsqkBRVIhik8JZRFSSVl/fBA2hjo7QJozGqtiuGIw7aIeh5e3uzjbawNE51EUuPBjjU2v5tWmHSmCYJnrftf2ILt7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go3Fp6oP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5S8Aa005694
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ca7ntn6iD6tGchtGKdEcybi2Jcp/1fo/wjRw6IKzrwQ=; b=go3Fp6oP1sqbigek
	83Q0gZiNwPsM1DcSJKQoHK2+z1aRXr89DwlVkwDaVXGwgOe5Ap1LR3xD8U9MwITW
	Alz33FqUWsBWYk8J3y/hJGxPtjAaaCTdL77jqn/tjRN/ht0eplLMSZ9aMqxvpzKL
	p0GwACFi2NN9Pggpv58k2r8xuURClzc9Y42VZdpYMR7ENfajpkhJSDbivCHdJC2G
	sGngku7jYpdurZa8hEPwOMcS1tjdRXYs/X1os6CBrG7Tn0KD7WpD94TDqH/NSdaG
	RK58V/T3tT6s+rxTtOLpK5ST1yeRCmU8OqF4CB1JafrDLG/3AoK8yL8NuIBVHYx/
	Xor7xg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43und2s2y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:35:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d881a3e466so15707806d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735569328; x=1736174128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ca7ntn6iD6tGchtGKdEcybi2Jcp/1fo/wjRw6IKzrwQ=;
        b=OFYQ1taqeRMBBYH7tXKurEdd8h3tOAs0E66U9fPG6B+M8naUKWAEZ+zNZkiHtpHbEM
         c358CHpunM3ADCU45xcMoU7W+4r+4CELN0eryE+Exmp/izd8xL/X4Rey8MAFohEcdUk/
         4PR1Vajs1NgR7XD3EFZBe9FFTqK4Oxm4TbrBvUF6A57NlyPeYXV/fAeQAQnB73oFA0RM
         ieYDfyV+k2mgGKk4HghgF7dlEiYZ4N/Nsf0jyCzymWJjkJjvOE1UpW5GgbRnZXaHbO+w
         doy51GG2E6IIilI+Y1piGgDu23d3r1umjyuih28UUvRcGfYoMbIGXRKO1X7XMQ4yNFh8
         YX6w==
X-Gm-Message-State: AOJu0YwyNz9CfYT9dkT/DqUTVpal4wgj+UEeZ90XiBF3Wz86Umzts/lM
	ZQY2tyocL8YSHZRau5Oa9zHvP6law7HpepDrzE032PsbyYlxbYgpVVqtK2wsfAJVrdtI6z5ZY3N
	ed9i/aqx2OAwp6/x94tj0XtLXFyC3JD3iIyqltk4In85rpici4/4/+A9Aa1bfPq+t
X-Gm-Gg: ASbGncvQy+btUuMJM6PrFXZrNGEP+TmeYG/Gyw6ZEX6+3FY38V81ofy/7FVlIq0U7Xs
	QErenKhlZ1uwYVe5rw5DkvZkmcWnilkqUCJMC7NTh+1DRqxFBp0/tsV5uTta76kYNve8muJ2y6D
	HQPsKjZncbqAqvWuBgPmHAO0muzpkZo1p9/Zd3o3w3FHAk2jOBXxrk4c9CoYnKC/7ChLURkIzrz
	mhe2SgKBpOJFysNbnviddMT5YuOgAv/PvNki+5ScV/6k6f2/EtKDAr8l8Z09Jt/sVDf9/X2A27s
	GnFjUqNTu5ec9d3OBKKZhRoibik3YU4BED4=
X-Received: by 2002:a05:6214:319b:b0:6d8:a150:3eee with SMTP id 6a1803df08f44-6dd233a4531mr190311056d6.9.1735569328564;
        Mon, 30 Dec 2024 06:35:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXGxWXxBqgw8dXA5FF2+gOKXaqW7sBSe0wlRITAGHk3QFW7PPHISzbNWqrjbjAlpl0ZBv5jw==
X-Received: by 2002:a05:6214:319b:b0:6d8:a150:3eee with SMTP id 6a1803df08f44-6dd233a4531mr190310446d6.9.1735569326630;
        Mon, 30 Dec 2024 06:35:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701a4cesm14660082a12.72.2024.12.30.06.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:35:25 -0800 (PST)
Message-ID: <4738ef57-c7af-42d6-b620-2e81b09a3223@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:35:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display
 Port
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
 <20241226-dts_qcs8300-v2-2-ec8d4fb65cba@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241226-dts_qcs8300-v2-2-ec8d4fb65cba@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KUhxBb8YPh-zElnWXMI44rG-sO6XxRwv
X-Proofpoint-ORIG-GUID: KUhxBb8YPh-zElnWXMI44rG-sO6XxRwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=944 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300126

On 26.12.2024 11:43 AM, Yongxing Mou wrote:
> Enable DPTX0 along with their corresponding PHYs for
> qcs8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

