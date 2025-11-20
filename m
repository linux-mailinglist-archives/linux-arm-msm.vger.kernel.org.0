Return-Path: <linux-arm-msm+bounces-82676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A8C73E0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B0B212A758
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F6833121F;
	Thu, 20 Nov 2025 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSNFcJjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtzWR+dl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA20308F36
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640461; cv=none; b=NxjQrAwcd+VywnonOgUdT1zorqZ3Qu0EKguZEMCKrGLfDB0maUqOMXVoy86bDb1fXWKEBXNp/Ve4nHY2REb3+vIfpGGBB1rholk+oTgnPAGTF0Y8aqBM1rF9aRFe27i6n560icFG6MJpP02rqSFEjj5iDQa6NjUy0hAg7yH8H6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640461; c=relaxed/simple;
	bh=a/FYQGu4Dtd48mV2r2frvBl1FdBxmOYRbxt5tSGaUPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1PQktI687LUaeRAA4RcswuiS9CaiN1StJXQ3WdGEbFKZWMcYYZZS+tvCxRvFVDUkJ9dRkTSIguQ/Ox4cEPoWO6pSAn8xteRLWdI9xeQJNPK3/+f2q9tz6F2BuBw1OY3eLoK8CKGRXZLNHCgB+e3/qXHYrPYRHUAlm4yiYMNxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSNFcJjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtzWR+dl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56ZYE4026491
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=; b=bSNFcJjzfM2eSZVf
	ap7LPSWqzx0iOfNw2FHgJl2e1XDcCHL5jQ095fGr6BUpn4yQtsw74Zz1t/eJrkUg
	rxm35bhzhwyulCh2F3rGzLU5Sp0dV1nNgh3fC2bBs8miPZZtHjAN5BE3i1QmfJhJ
	6TOD02J2KMYAqobOhBxlDtJSUa9xTflsIAUoVqNA2WOOzqWpWGf2EJY9nSCBEuRD
	8c6AD/Mw2K7VSe3zGHvexXf7smHw6Mn7KqfcSJekKr3LHFbMVuD3xi8SMhRG1A3C
	v4YSkkoXSjAXHqc2JAo2Xp3j++EYALsSDHZAWnJkfkbPpKSsYDRfqItZvw3/MhjJ
	5c+f/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3h8kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:07:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed767bf637so1101321cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763640458; x=1764245258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
        b=UtzWR+dlJ4gebtcr7AIQ9yb/RS2kEbrQRICKCkXZUrQP/6QB9p9HF3jAOHBjU+I15t
         S1ccYamPyW6dWQGdNbkq9JpQSjPqYapGMzp13X6wbsfM322+wwcBx/GTFSVxGRMFCyua
         v7xpIaplMklF6WYZ6WQTw6Pq4JesJJCKjpYouPMEONEw0FrEZxVSB/MqRzIo4Hhs5Pwx
         9o6rDD+pRO0+cuvynerRdmE/RUsg8OMmm27Zk3+0Q8UlBx1p3jQ0+JELn8g+BhyKpOXo
         evR5VebfhDfeTaO9mvobVhg/n1ziZqTOvKvtwarpGhqGgYVUoYBxnTwHxJAjhSgEGhLe
         Wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640458; x=1764245258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
        b=Y//pD4G7p+mOZKJdJckJSiMSLeJq/pQx9P6EL3SW45mucmkodWW/dfMnnhFbVmi8UZ
         oRxjaTo3moHIHTCMetQfNafGZjo2udq1UyYH7F8m+7OCtnnTkCqNkHRulRkU25QjrMzd
         KVVNxsScK2Z5Swiiqy1DeaEiFbIxsuDI0p4UVWRCFW9OVmnSiZpCpolsC58GEfpgHdU6
         uWf4JojciYtME6bwB689EjS8hYVx9dUb08LSLDaLIAYfYonDNpFv28oEiJFLrl+OAKWu
         DdTBC+p1pic2RP3Vnipk4B9jPoaZ5NITYWAezMYSBXZrq4OC5jMFqcbTG7ZXePsai6nO
         xyug==
X-Forwarded-Encrypted: i=1; AJvYcCXGN3G+Kq9e91i060rEdh3ZmbbTOBJGb2qPARsdHriV/NRLJQXiwpHl8NTBHtB24X4q4Bt/0xFqymMIgaCs@vger.kernel.org
X-Gm-Message-State: AOJu0YyQta4MFzNzh/NJjcVm+HFjfKk0Zz2mGvj1az8I9rrZ+LZoNtCw
	ud9MFZCZYEUP/sqKRQjrYYRW7Lo+an8b+F9gsrHX0Unwsaq3hIF/MXHXtVDAUdCngofZYSy3tVw
	F5RO9YQ2M3rMCnLa0lxRYWw6rHu9kWj9ndnQWg2/E2TAxYVfaAeKUUEM8ABuUqSwDQBNH
X-Gm-Gg: ASbGnctYWwrZwSl5MVgjiZFkACdEwGZ1fCNIbdmF6OkK3aFFuDkRyxDboj4nV4HgnlE
	5058XSzLaToQ+qxrBfCVB/djJn/C2sd6BfeEuEkYldrcjKRrZg7yetVaOWh7QmK+/iHXm/jGkfR
	zh9PAXbdAWZg1ArwmMMZbVC9pZQEo3aIXs1eprcmwVhm9itFDWUlfD7eeK/L5c8LIps19X8dJQe
	ePGSQG/kDVzl3nb1UWJtXreGkd/3Ranu29D9UN4HOHlgu4wEXDGFR/JsQhhxAk9oKdd5EtVxVya
	loRgzKRGs4SGdwSxyQBEKUNb3IvLc0WQv1k48JgzKNbrGe5ATAGHKX4f1hkmUbkpiNI+HLTKxxC
	kdQS7n1u+pwxJNGpwMF5EuLys7KU6gLul7TXlPfWHAo/X61l4jDTibU4xoXO+j5mrpSY=
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee4979d58amr22346621cf.11.1763640457827;
        Thu, 20 Nov 2025 04:07:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7C0G7oIjRGR0HYITo/8aJIWfL6aczcG7wVEVYDZP+JyR4xosC6Jsi56JuaGBd1eQMFrosxw==
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee4979d58amr22346301cf.11.1763640457383;
        Thu, 20 Nov 2025 04:07:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdac18sm189684666b.11.2025.11.20.04.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:07:36 -0800 (PST)
Message-ID: <02b73243-f7a0-404d-913a-f95c0ce80632@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
 <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691f048a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=-t6nT1al7WGe8XWH3MkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: hFHCJJftxJQaq9CMDxWldyGkHdHW07Jp
X-Proofpoint-ORIG-GUID: hFHCJJftxJQaq9CMDxWldyGkHdHW07Jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3NiBTYWx0ZWRfX4SMcvIAE9I7f
 tT9ZfXfwrdFbkJgoIhlPzrZ/kksyQe4ZHvYZMLvoAGW0/7/gxBwwYaCssBdufU/xGXMueY5YkQp
 hmnKkZLH5yKmm8LGygts1yODNHfzZkjJBHo1MzfMUI1Bma0CJ9vquFKad5zN0/3PyjnB5SCaqFC
 pustGc5K2UZRQiQVHCVrXqldjCRePtbxRV06W3GzRbCIuqD7K0OlIVBUyAdj/h4gjVorlgGtNXW
 NAHrGKm+y7zl/RHNA8diUSY9y7t9azRz2FgtTBRkxh6wrPgAhbz4k4bhrFoDVr6cUsHg0yNbtoK
 3vqUR7yMaeGDLPEMG/vRMtluESV9LWY3/GAkVp83t/4QbB6bwE6cUc/3/3WduArYEmT8szcsire
 YwkX+7WGoPLCPjRfbPBcfL7rDrPpgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200076

On 11/20/25 12:25 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

