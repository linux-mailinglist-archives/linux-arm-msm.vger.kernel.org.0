Return-Path: <linux-arm-msm+bounces-85333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5ACC2BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DF2F301558F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D242359FB2;
	Tue, 16 Dec 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cU/5bLfZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9clgNYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB7359F9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886708; cv=none; b=Ncw7C2331HLajK70rb+42TSkI3ly9WWvmHyTgXZiV94nGr9HvRai0sA365CvRsUiJXSa0XrTpkJLBQP6qBlXXzOKkHZj0iPNIpE2oge0oSuGgiHM4t49G/fTyNp9YeJJsRWeZVLQwEaLCkDpfcUjklEOoUoGzeqftqrxRj5nJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886708; c=relaxed/simple;
	bh=Wv7WyBrmIKVjc5YjY8/RSHmaVQ2Lige3hw7dw312PkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d371IzO24Opv6ZmbIquw786xDGgZQXwvEjQ7YdLAtifJiGi2J2qQxR0VXaEd7Ak6GYNkw7X/IgV1bG5Av11WoXli4HCCuZzNFjMae65dGv4cjIL8p83pT8qzOSh5W1IcVym/c8YDTmBBuLe3a6+pWf1QkkVE1F5S6eoHLig4Ke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cU/5bLfZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9clgNYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8JWSB2573384
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fk1danRm6AAivCgBRvzM6gL6OuxDEjXorHKkmSWVB/Q=; b=cU/5bLfZLGbH4h0Q
	proSuwOTFYXp4WMh47H+pbo+1pRhCHwJAxTdM6thPvl/uXa5znlQe8ioBdtmLDJh
	bEav2b2AWtFPymmsQ9c5dMF2Q02BpeAJG2Jw3fiPpr+a1W4hFB2PRRzuoInBVE/z
	VUrZR8DCCFCe66u2Wrq6kK1J7fG2W0rhckByjjojfVjzfcQjDc8QcFdC5cK/J7hL
	9/kgXOqGkCFm3VpQrKl2Mgg7A5Vxnz5DX/S0OKZL9bqeEMyKO61ODnytPqhW/aNM
	RDLK9/v9bCu6n4nPzc03GDvqwLaLffsmmNrHgc6JMXHe8k4YOpUGIVLCYXomRrJe
	gDvzqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thrx75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so16419001cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886704; x=1766491504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk1danRm6AAivCgBRvzM6gL6OuxDEjXorHKkmSWVB/Q=;
        b=N9clgNYeiAYesZXmrqVBD0kqrpO5wRuKYycABGTTnW/ratVXtbFFOBsl6lMphEc71/
         0Ge6lzBvDJVDRhMNvDCgpZ51WHQMYNut7G92E5UONNXgU0Fwp7XIodkXy2CcU5cBDuyp
         EBCRXeU8P536JEMXzFr84sjtw8fmVMILku8GFiwh2G9VAaW4iIbLqU6xlidjujCVLouY
         f4C92xb3h4AIAOwjzhA/qci/bYTOA23iLKTKEJNsd72HRL7Z2P69kH5NqnxHpJOZm3rB
         Ow6ggnomjbvIDty4jh1te12UkWMD57VhvuR3eceB7UkqADowVn6vh7zohVI/tMt4p3dn
         +3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886704; x=1766491504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk1danRm6AAivCgBRvzM6gL6OuxDEjXorHKkmSWVB/Q=;
        b=nIj5nqok4/+4Fjy/yuRD5eO9X6GDBGNL6x/R/H8KtXQqMn+xr8ZI3IlX/Guj0jWmNr
         mTpBwSrkRb0v2Ecr72D/VGkEpBBUT2fC8yldfF6Fgn8qMNn7nV1+7TD2qhOndbPKhihC
         XOmGC4rg6WuGzdvXrf4EcxWO9T6PsEu1GKp+gwF1fYjtddohkGikGVNGObFVHnDtK2mF
         15WFGmFbDkoZu1oOP5QwHx4iLMob0pzlnjMLGUm6pOp40ajCMrTnaBJppCj3xxUzy/M4
         P8wcx4ucMH64qdmFEwU3QSbs5fmdia50oAwhnpS8fEvWpVe+o0DJNP2nB4Lf0PPX+pFa
         08hg==
X-Gm-Message-State: AOJu0Yx0R33njJTalkT/r6YVQbfU9/vq2Xl7u4CLeoUdNjqp68HwM5cg
	uoAr5fSd1MV6u9u05QyIJQneyYTBCyQK8DFiKqkYna5cZjoHfXGb2Mq9FbyOVIMdZuiT5bn4MGx
	liJnoNxBEZqeB2nBM6yagOECb3HOZYO1acngztZG2mFa5QCDED08OjRv3bqRb4GokhwGz
X-Gm-Gg: AY/fxX4Mh9kUWhDovvg4X5cmbyxX/EqkDsZw0zG/Z+JYOre4XFGbP/+4uXRYbT8M4qM
	p0KgOt/PT6//VG2suywC9iq8JbDzS1RwfX3IGNwg9YQGV0BURd2bgN9mJbKB/0lAaYjo9ujMoP5
	KpaHDJM0Xq6IfI30r7RcuaydMot9vbgq9XaL7w6dQO3CiE0RwTH+urrzoOfwJclRmDA4zGz9hJi
	UuHBpKu/0aPdaS5cbr8zgwdZmHqc1nEGmgvZ0t1AF3bSjXiO7aWoR01oEkDGc+ZzluYHDjjOI8N
	7uqTaM2/bW6dvsvrwc2sEOMrNp6mwtvlii0feQoQrBBVGfxiZ5YyJ5i8Om/XfElS2ryTX+vYhMC
	T2ZbnzK03Z4pD56915gVpi5AGIbOzjdncq7KPeFxrgMouOxeFrYh44qza9twswH3chw==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152183861cf.1.1765886703810;
        Tue, 16 Dec 2025 04:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF67a55RjSmzhw/JfkX0RQVSFoe5J6TaORkP8AEqX6Rc4f++xuyIUsnv7VvxBZKkfZU9PWxHw==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152183491cf.1.1765886703394;
        Tue, 16 Dec 2025 04:05:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982040cfbsm15825612a12.7.2025.12.16.04.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:05:02 -0800 (PST)
Message-ID: <584ecd2b-47b2-43fa-a15a-934fb515d8eb@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:05:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP
 firmware name
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
 <20251213-zap-names-v1-1-c889af173911@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251213-zap-names-v1-1-c889af173911@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69414af0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wPDdPnR0QRQf7uGA_pwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Vom-A3hgByu6sfCK0XWPhzx7I0PR3ma5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMiBTYWx0ZWRfX+XMiTQ5ZkzJ6
 jni9nQml6yv5qqBiKPDnLEP8/awYe96N2/gP0JQc/+bIdrcIhMBPAsTMJmC6S20Kvk1u36pX0FU
 5z6vSbHXeUf5EawTXuOhrL1rV12MoD9jdmjJihP2JKYQsVveG2jQ/a6mbluUx9ZfGSX3h2/IpZf
 bZ12w3HB3ItVJ03g4nS3e9jOG2uc2j6a3yb88ottQN5lUT1saKVQPqaxVNtZjog1BHCy+jaYlbB
 DzVd9F9PnBwN/JKMUQ0lP1vurrxwqqPu2OzeedhRjoMX8B0E0Cbo2U09/T6Yxzi8NTJ5smMFQTx
 6zee4EWWJ0IeqAJhFO9jHEjtQAD95L4eB1Q0/iGvtbV9zyS5kfLbQ8B9/WMCa27OticbsyUVJ5Q
 YZjblAYoGn5HDDY+lWqXW2RoLSCoCw==
X-Proofpoint-ORIG-GUID: Vom-A3hgByu6sfCK0XWPhzx7I0PR3ma5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160102

On 12/13/25 10:28 AM, Dmitry Baryshkov wrote:
> The DT file has GPU node enabled, but doesn't specify the file name of
> the ZAP firmware, which means using a default file name. Specify the
> name to the ZAP shader firmware, pointing to the file in the
> linux-firmware repo.
> 
> Fixes: f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

