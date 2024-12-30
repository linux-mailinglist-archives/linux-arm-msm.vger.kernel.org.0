Return-Path: <linux-arm-msm+bounces-43656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1A9FE76B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29241882390
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3AE1A83FA;
	Mon, 30 Dec 2024 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRzagZ3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D5CA5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735571181; cv=none; b=hR4UTAPwSvLjdqTaA7S05WaBk2rzZsBQYJw/uVziYig+O2tNi1Ncho+VzTfZ4/KonwVy838kDnY5iVn+2QbgESt37zPvnlk+qysT2UTsNTrrkgzHPeogEUQPPIMKH8PW+Jy8FFddK0tns57+TQxyHtqTip0o1Kd7FkmlmTrdnSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735571181; c=relaxed/simple;
	bh=3P1N7aXCvO0uphOPa8U8nOsYXKeppbeAFr24u0IB9qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekK6yA3k3lNZoOhHVQZlpeaA6ELU9Zc+97gle5bn8K3/n45aMLZnHHIP4/L4urjnVN1aXfQZEsk4qPrpOipcs52YpPkXUqpN004InC8BilcCW0/pJZcxlCx2/I0x0XQNlXP7XsmgRHEfAtcOc62WQns5HcDLpH6VUxlhZ1Ms3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRzagZ3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2jpdf026640
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehWfGPcCLSEfEC42hvN/XOS5H/EYqBO9m0oPbiJ8mWA=; b=gRzagZ3ZWUXQ3lau
	45MumRAmNuaKtUOTeAp2MgI40pWbvK/mBiMW3DCQtZI3QFzVHjQCCpKJvzCeX1b6
	jQpN/FrmlXtAeNW0gAqD3M12G2jpvJ3m5VTwJLbicS0tyrStXdjDJ37mncoU61QT
	JmAqKMeLF67rqCh99ZQiXxrMfj1Sj3mjaiOFAJTX+tezfotiSxV7jOl6ahO2/R4l
	sjd152e8i4viRmD5+A2Pg/MUbEJx4csLiel9DsaUTsIbdwSAek8roFlWQokUmx98
	DHfj01C81kaPWLFT4Nl5pu4YKL4TgeYjgd2z29OtysGnm42k6clIRV/MSmlxehWl
	apOPxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk121dby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:06:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso24722321cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735571162; x=1736175962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehWfGPcCLSEfEC42hvN/XOS5H/EYqBO9m0oPbiJ8mWA=;
        b=OmDIsWdh09A029AN1H1EMISOomXUvDtjuTx+POybRlRwyLanBLeVT1yenxwAA80MtG
         JlYfqHK34w32ytoAfInt5CrtrFU3rlsnq8iUNMePyeAjPTx1b91P4Dv9ZlO8dMPpU9yu
         GFVXap4gn4JKoK/LjEq5KrZy7fMK4+2TonshWyTUBxl/+JbduAEu/5+be4ZuBiAW66mt
         YMRA20TQpZh1cU+ofhxUvmzx0U/aXGre9JHuuVc0fd+ISXcy7IXkfy+4lD5+xhczY5hf
         6upo5Wk9jvwxdsw58YVXLJGpeNKLbrndiezdGCulVjxlc6ihLXh1ctryh3Vbgc+A/mfe
         nKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdKj8YdDSQzxW7rrJ4+1EFD/NaSPr3XesrJc/uDXAXXvwCUP2ny3hyVsoha72KEqeoK8uX6MT1Krn5yZZL@vger.kernel.org
X-Gm-Message-State: AOJu0YwNaE0R7jie7uc+EyOr3ePS26ku1BrVFWcgRn+ImzxRVV5ktfkq
	QhvmB+hIKKyZ/z/5E7Mc5shFo4uGprO/gn0qAVxXXXx63W3qK6RcIO5iQ+eTgrkO5GcFFrL9K/0
	/NZVhbPBRo2MnhkTmn2aIARJAskFL24DkhW03Yid+nZnyg5LOPKosaufR1MYmWj5J
X-Gm-Gg: ASbGncvYqdZeZgvj7dd2TyHKWPuKAiNuKnAkJUvfWxkGI0buBX7XnNGo7pgJweIr5eJ
	vjp/YBHNjsJ0/21J2+E9cMHzNU6KviPT7G6KWfgbufweHuanfUO11QiH2CCYDmu6lV13oKi0oJT
	vhlReyHhr2/NviKuW1x9mbrpDIE6oTj6yYLW2LZf20NgUeXnEwWVH3OpOl5jpo52RKFMP5V2deB
	TmrxMop0hffVcKiMgURocVfOw/hZ5uQRGFOe9MICf2XfVOf/6gj9iGwudq9W93oSkIx9h1jGoGB
	Vope+JljplhyR64DkI0/OEZMUC1iCRI13IE=
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2332799885a.1.1735571162499;
        Mon, 30 Dec 2024 07:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXsa5g7Aqph9cbjlEpfN+a2POv8ZHcFZcVA5zwUYAJMZi9yRoNMP5FC+yqW0MHB9wXyzdGUQ==
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2332796785a.1.1735571162139;
        Mon, 30 Dec 2024 07:06:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe46casm1502781266b.129.2024.12.30.07.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:06:01 -0800 (PST)
Message-ID: <8e60ac5c-dabc-4790-a663-717b7fd6e232@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 16:05:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: ipq5332: Add PCIe related nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20241226102432.3193366-1-quic_varada@quicinc.com>
 <20241226102432.3193366-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241226102432.3193366-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRh1POLj4pq6mBQH9_4sDQdoHMwJ935e
X-Proofpoint-GUID: NRh1POLj4pq6mBQH9_4sDQdoHMwJ935e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=707
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300131

On 26.12.2024 11:24 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

