Return-Path: <linux-arm-msm+bounces-33628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D4996116
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFE71C2394B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 07:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8806187843;
	Wed,  9 Oct 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NTsv2DQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB5183CD9;
	Wed,  9 Oct 2024 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459597; cv=none; b=Pd/02B/RQWpi2g6SKpz7eCBrhTtQ4smlkeJsxLuOrNVrFnxTFXBPhYSHXrOI6CaZ6eIH7xiaQHuDUvVnSroFyDWWXVp6oEKIA3L+Umg5Y8vi1ScdiLDkD++RKCIWKONFzGP1OiKlrFX3v0Xevj8u9SONAz9d518WmT41qCvCkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459597; c=relaxed/simple;
	bh=ZXALps+EHwY7XPezKlK/CkIw6NgcRIiespUxDFCgz7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k8jYmZHFPVjZLOvd6TGqRg0y8QVjI8d/bU55cpuqdmh7/23HfQTMWZmhUP6rpxIZUCIEkrCTtD7yjH7nDbauzBfFR4HF3tcl4FQ+uf/Dp6YO2jmFbxBtpkEBfwVYNRZRavgVzG7stwe+oBrEFWfBez1xV3SrIOOMkC6wELGkDWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NTsv2DQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498MMg02000677;
	Wed, 9 Oct 2024 07:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnsPQONfZ61MaZhMi/vcxe9LQ679D9pa2oHkYGdMnqs=; b=NTsv2DQ+2lpXJdUy
	7YTQ6IuB/wGcEmL6xmIOYpcJL9ffprnUL9fh4+H2CWLWkczXtjmatlNYgkb5JYeR
	e5JZ9O3qQ8QHLYDSCfXHQ+xRa2WVAQdVguSq+tyyqivHSg2SikwciZ+5RHoDs1Hv
	QlVQo0oXj700MFE05QJSD6xkqo6SXytnXMw5EjGZFx4tKJVkH0yiCOr7yZ2uURhX
	egQy9BFNPIa7mdR4xaM8rD+MIxgarg1ziHnQ7SL+CRrgdePnA19w2+cfEXGe4Zn7
	sAcFDGhkLhmMzTxpqLenPMpjTanjqkPpsphPxynyQNrPk5C4YjzxorYT8r5RCYBK
	P3STdg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4252wstyyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:39:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997dbPO014720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:39:37 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 00:39:30 -0700
Message-ID: <7383268f-4655-433a-9b9b-ebc9ac3d57ea@quicinc.com>
Date: Wed, 9 Oct 2024 13:09:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241004080332.853503-1-quic_mmanikan@quicinc.com>
 <20241004080332.853503-6-quic_mmanikan@quicinc.com>
 <72r4uowjwoxkeqq6bxhdv72wq4rqogirb3yyp2ku66rr2cnzbs@i2lk6sgfvenh>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <72r4uowjwoxkeqq6bxhdv72wq4rqogirb3yyp2ku66rr2cnzbs@i2lk6sgfvenh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cumxdSoADtOksco1skilAfCwCTXFKRac
X-Proofpoint-GUID: cumxdSoADtOksco1skilAfCwCTXFKRac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=727 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090049



On 10/7/2024 1:32 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 01:33:30PM GMT, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>> devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V6:
>> 	- Remove 'nsscc_ipq9574_desc' and use 'nss_cc_ipq9574_desc' in
>> 	  probe()
>> 	- Drop of_clk_get() and clk_prepare_enable() in probe() because
>> 	  ethernet node will subscribe to GCC_NSSCC_CLK and enable it.
> 
> Does the cllock supply the clock controller? If not, it should be
> dropped from bindings too.
> 
Hi Dmitry,

Since GCC_NSSCC_CLK is the source for the NSS clock controller, there is no need to drop it from the bindings.

Thanks & Regards,
Manikanta.

