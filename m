Return-Path: <linux-arm-msm+bounces-84430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EECA6F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 10:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B37319D469
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 09:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB169328277;
	Fri,  5 Dec 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHlDQAiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTf1F7In"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1592D77E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927549; cv=none; b=ucljFssxqyRVbWBMgOB9i7PxF71G067LxBDIs5wb1wlijvj9WSdK/C4/xfNK5LEkeGSp0nEuZI84c93xdPbJYw6yaHYX/dhy00pvMj4ESfZRsFOgZB1kujN1H1v/6CfQ9tztu9uLHKgBPmh8CB30SS4Ull9i3/mHdzsBoDXM7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927549; c=relaxed/simple;
	bh=mSopZ5eSMSVh8uu8bPk4hbVXL2B0I8uYCDh36a0qlaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ki3I6BMZ3BtkoK+b5SIzbBi2aRS2sFv5c3mfMTu7z4r5bENR+jZ57vWVMC6RvAhApsET9L2uf9CZoLA4X/SaS/XTnxXIEYhDkWa5UFAwfXoIbJSArDVf/yMIYmUDL208Wiu8+1SoyAQQtW3aQ92+g+bzzNHCY+eCh/hpvD9TdQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHlDQAiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTf1F7In; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58pvcS2297536
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 09:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZ0G3AW86K+AdzoPnjH3oCDXKA47sYNZSDUfmg5RO+s=; b=nHlDQAiZ7PCB+J//
	4cIJk23UNa5kAPEC7I41Fq9cKGlLvPMbRmq0ipia6EKfL2Asoj8lHF2uvO1lI4vG
	Q8GrDs0ZKPJQDns232BVLhxcHK0SYTl0Ije0nFv/2qUQkrzxKCBfk9NwepMu9c8i
	gvKgCq2FzYTDde+PKpMg/j8wCAaxgCln4+98NqTY2MUF6tmlVM6DA563LxBBxOeJ
	HBfLp9metvzGjiplh2nXMdE5an2RSeQQ1DI5yWH/GYHp1nGZNNajC2nvahqi8POn
	oLL949eQdSNUFi6S25BeNyFGPbWa2C4aS2zeB01hhuGcT/OYsQyisBcH6UDI1q8N
	vwDBUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknf9ggs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 09:38:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso6526601cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 01:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764927524; x=1765532324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZ0G3AW86K+AdzoPnjH3oCDXKA47sYNZSDUfmg5RO+s=;
        b=gTf1F7InMJNPOSkOcxFVW2wLkYcu4fzCJc92EViAEzd6GZmKUGGCUb3E7z5hEFc5Pn
         ML3AadjTfzjBDqgf9F+FIi+sPhNMORTc0B59/Y5ZhdB6/bHZIyDZcKyNGACCuev+J1bL
         nmrpIRiGsln9f3JQzEmVHeMvIOdsKEOfYj4MH7p2eeZfFl7X4CbvFEyeVjjkEfiSOCRU
         JTf1C0DLHagfq20GVruuMfM1BuUmnft07NbO5tOHvFl9TrnybQR61zDDqJ8eCbGD85uu
         jh5EHktvoKLWxtk9sifdekOy+JqjpiPXb5daJIvUkAcLxq2rIY1Q8QRMRMCisUvb/TB7
         kqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927524; x=1765532324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ0G3AW86K+AdzoPnjH3oCDXKA47sYNZSDUfmg5RO+s=;
        b=eIBfJ30+PMeuolgLqCoDT6K6QA3X4S0lFBgwsxGYRDWJM1rSYycJ7Bj6gv+LAKY80U
         yGptBLAMeWGVwRXiPpnhQbysIWLkAjkmyoi8CebX5H+iQiQ7iAZ6q/41v/mkAlID2plw
         /d8OwPXIZEP0lpVHGzinb2xNu0H+emA5AYNeOEhhIElbWwF6kbSUv1/NJaMYG9c9eIxC
         WYxJxEgUg/4e7e4tj8itg8w9nqVXRG268B6RBxOGQQJ+/uvnYHFoSHf/GDLSFph/Z0j6
         T5wIlqH3GR09nzIS1e2i30aIxuaBinrpeiVTT1quK3PTl5g4lQi3aCg72fZ59tF9k1r1
         rFug==
X-Forwarded-Encrypted: i=1; AJvYcCUHMXT0j0NOSlYQgv/GEo2GIrW9n4pcCi6M32mlTLw1vOE4g1I27psU006YxCxa4t9TTaSjgA9YMN6fY8H2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6oIjt3vJjG5/PlHmCjftWkFrZ/VcAyDfDct+rgOVGTG+EyjF
	F0gjII+3aVhr35AtoaU+gGtHJVb9Cl0fAifA0crQ8SwwX9Z5vMqHLjZPBbICWErnDksiBtfhejr
	JI4WAzlt1oiIIDGWwCPYHVzBLypSDVo7yiBcngkJqQIenYQnuS0u+bb7LMP6Kp3VBGdS7
X-Gm-Gg: ASbGnctIYrADDce4UE/NWZeFLkgcMq0o+lllojzSUCXYk0XY/7kOe+FZWNYKxws4ive
	e57qHnkno0lpolZ2CKWWsvbFkw1PklJ65IdIcKZT6aUg5v2CyffhSTpJVyoI5em3tOFwPKEigIG
	V6Q6DXn7fn0x4xBtVsZFKEHejNoztlLvRdwAQkwugHdlVfS5Tx8CyrlNNVjSkjO7Q/5RIY3bPQw
	PYE2Ate0Rz3zsQy/Fc377PiAR8czlgjUmrjrhdDaUz/NAea/w/kOP9adp5zTEOecmKP5QLPW5uq
	ts3FcYkCLW2/sXAF7jb5YETxNkq2iCk0re1bTaDTPytmH6lUZrtGgRLFyi+hwvd0yHuvcBSv5nU
	bDHmI7qdoF9bfoPT/sluOozLpZCIjskQrJZ99DKvHWFqTTbOEraUjk2bHUdx3yOIVBg==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr887368885a.1.1764927524599;
        Fri, 05 Dec 2025 01:38:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzBrsVxpYEbBThA1XLFHeXzcz4UMqBEAYiaqakzQpeNSyG3w9AymeEkalDnuQH+VGWH+ThKw==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr887367085a.1.1764927524155;
        Fri, 05 Dec 2025 01:38:44 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49b7177sm323152466b.50.2025.12.05.01.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:38:43 -0800 (PST)
Message-ID: <b36de004-25e5-4701-9778-3ae02a1bfa87@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:38:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: qcom-nvmem: add sentinel to
 qcom_cpufreq_ipq806x_match_list
To: xiaopeitux@foxmail.com, ansuelsmth@gmail.com, ilia.lin@kernel.org,
        rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
References: <tencent_D85C91225CB9F5A85A2141BD8C4E12E6D009@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_D85C91225CB9F5A85A2141BD8C4E12E6D009@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2OSBTYWx0ZWRfX+hLTLfTGDAHO
 wq480+lVk4TFSni6pAoW4AnswvEj76C1Am7oGjDEfA9fndZcCqpqp3tQMG1yJUDoqJSXIW48Oox
 4tQM4HcRePaq9ZEaI8GlyIGIn5JYYTLP5u89diYVBdqw+r8bUA/FKJLg3xwspD4Zf0tX+tHRu8v
 vY7RIFtIbHtlhiir6/7tMNEx5zBgXJaozeInZyjkhnqZgpZ3dV2E0btO8+uuo4oJuTGQ8CAwVl+
 1Kxo3HmAykDRqeYw9uRRIRT9Uee1VkP0prBDNnkqlwY8nJFw+MJ4Ge8gRcUdQo3+5wAuk+uaPbx
 Ax6ZzGbzduPG0aByRxQX4MlxJPvT1q0iz5o8QLj3pfR+m34jAKni3upGHj/xDIHcin2bZIxW/65
 8F5VNENbfkybwf2VOWRkTa+Nfc/gRQ==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=6932a825 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8
 a=NtSJXH4osi7-RDkubBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: DmtVOD4bdP3k6MgPajMKc_76FdfgsRRp
X-Proofpoint-ORIG-GUID: DmtVOD4bdP3k6MgPajMKc_76FdfgsRRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050069

On 12/5/25 7:38 AM, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The of_device_id table is expected to be NULL-terminated. Without the
> sentinel, the traversal of the array can lead to out-of-bound access,
> causing undefined behavior.
> 
> This adds the missing sentinel to the qcom_cpufreq_ipq806x_match_list
> array.
> 
> Fixes: 58f5d39d5ed8 ("cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

ouch, thanks for catching that!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

