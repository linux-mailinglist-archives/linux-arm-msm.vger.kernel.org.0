Return-Path: <linux-arm-msm+bounces-71056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF3B391FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 04:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFAE1C24CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 02:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B5E27A47E;
	Thu, 28 Aug 2025 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbi20Lr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E842848B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349872; cv=none; b=a9XqV0/HWlJpEbzYWWCGXSzseg2HRVS42NxhBzO/84pKxiEvh7I4TbZil5b+QSrl75ihlWzxS75q0xeKAxIa/Yuuqru+IT44g8n0lTRCloLz1vtUrkf1WY2ZhV3eYeCXyT20mYRHGwTpbLf0g1RD8xDhxtVmQu4WSWV/9aaS8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349872; c=relaxed/simple;
	bh=tCept4cbc/MaNNvuOftpkH1x/HrsKm53+aYvSBoxkr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBgzsnn2bRgMIJVyF1jE9O56m+kzo/eDS8j51yb0ApBSGILy+7ueFYIF7GM20J7IdEQaGLBAMVF874dNLDsCf+eY0d+7CkvPGDIRHTFAjH8yqTqbvljsHw65wW2/qLX7lsv0/fzLMq8XLOLO7GZGLLli4h3FhcGbmTPC7JIRvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbi20Lr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RNSAtO007869
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVszMljYD5j4gBrasjeb/5znK9oOZEjvYSTgQBHRx44=; b=kbi20Lr+BaxvV3fv
	HX4n2PRqgU/FATOMnc8aKpUuAqPAeg/2ZWe+vGIuaBASeJeGK2toncdhk6J6RZWY
	I9bnOJbp8gnw8ye1PH2WEQTYz+ypH51ichPEUABM9ezu7Ri68qNmCliSmwWrkLEI
	cfTk0sUpJXhoRXqzIsGNrDFmHWOZxTl9Tauu6hN1IVCNePkNP53ZIxgsQtsNdtXd
	6wQFpzi5fohkpqEbxzbCch2XjagV0cGo7+daIVN5inZtXFwWw/xHj/ZrODTiUcvQ
	aFzwcCjNE316aB6HEWJTKP8uTzOAEHX+O921hlShBYCk2Xf0+zlLwva+D1B1LYAg
	yffWHQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpggdkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:57:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so854269a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 19:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349869; x=1756954669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVszMljYD5j4gBrasjeb/5znK9oOZEjvYSTgQBHRx44=;
        b=ACZEQP7ctrQD3EYuyXrWzg726Gf5g7ydgH2j041K+5tMrupsT1ciJ1NC5otJDtJdX3
         4MNi/FfwdFgADf9QBZzq0jcVwYcwfToufPatSJW8zYpmdTER5zbiFMlHx+IB5Ol1URRx
         apW+Yl/3axZfT0DarggfmJoAb5btio1vAjSkuoFsZrEWLSiOAFPUr2jS1myKweJwYfm0
         xfDfjsrFd57prFQrfPWC64SsJSVOmyPfjdmtxlrJud98UfrOYzfHcHfnHf4l5fycL1sb
         Qbv9MpAcoKp2RFUsq6GHnhYmW2j/NfLX58AyT668YHCiwXUKGdm9f3odIo8m26wR1mvS
         Zu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSYy9lh8pVwsqr0p8eGROuh5nHJhP2z2r7rbB6JBKTXecT3DwTSC0U5tzsQc/VIjC9BHw7KbmswCXAaat+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8J80saxrJDDLWwqDGF7jQWeHMJK+xH24zItqQik4t3hFTqzJb
	L4hOQ4Co5EnTYDDcZHBfLogwBX+mdQwQ/iJn6+ismvZcQt5qVLyKuckGjtFl/DC73gwtxxAU3DM
	VDJ/sjU1Xm0mNlvwxctkEQeCyqt2FZCTO8QonwJEIwSCcJCEhPCVJWWxJ7pyjUL0AJVKs
X-Gm-Gg: ASbGncvyVUMtgWyT0eEhmhhN0r3Jolycyzi5D/OKgXUOQubpQKNnCTjr1B8ML8xtjP9
	EC7jga8pesuPsV/bZUs1YXCsmwF4hKgb+mWOlVYB9Jb+97vL8ec6UV1SwbAwM2i6MVJcXuWwTDr
	Obz6r8FT5G9NAPGpMQjrsA1O0Sdgch+S5MVJTWc0QxSzGlbqTMIIS02E0pRSTrgmtUGigDl/qV+
	8ShZ8nhmcza3kBIZ3FzioYqOdsH+B3PNp+zWmB3QprzCp7q5+WvWC3x3YSaSibsSq1ylr/tlIIQ
	Dy/AtZPn0u0vuCIHUT3pO93uhyS8SWH9L2VDe9FFMmff/4JvOuYIgPGzomNf83AeUd/wRfoVExU
	Nl/FzFpl+nBoP6dDajzE1yqnjV6ZHBUdd3sA=
X-Received: by 2002:a17:902:d58b:b0:248:bcc5:d1b2 with SMTP id d9443c01a7336-248bcc5d379mr42830535ad.32.1756349868603;
        Wed, 27 Aug 2025 19:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPDTyJMIGDxlyKpgyZ1liFR82SkKrEtzGC4gPqxT5AbPz+li0JlRxHkrYbz7/XOZEMKrf6vg==
X-Received: by 2002:a17:902:d58b:b0:248:bcc5:d1b2 with SMTP id d9443c01a7336-248bcc5d379mr42830225ad.32.1756349868142;
        Wed, 27 Aug 2025 19:57:48 -0700 (PDT)
Received: from [10.249.30.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77054bb0c46sm11600288b3a.41.2025.08.27.19.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:57:47 -0700 (PDT)
Message-ID: <0c2a4877-d63b-4650-b7d4-a06a2730c73c@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 10:57:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
 <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
 <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4sF6eIHDAohesyoBLeOD7IV_Hc6nMJhk
X-Proofpoint-ORIG-GUID: 4sF6eIHDAohesyoBLeOD7IV_Hc6nMJhk
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68afc5ad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=qAPg_OCVEOE_nEQcmFUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfXw7g84/JU7ri/
 xQN+pOILpAhfpMinStAepcFrhByUvdGRUdmNON1xVQ42Dhs+o2rZK5qSjAPgC0izHHHMvZzGyH4
 Q+aaVsAMgbyIMOZSlFYqFvJHD9vEhxzrH7WVuuzqZEpsABaQF5GOgt8bIdMOvBtl6iOHZKueSUb
 oMKzWhmO6schoA7MdCSABCK5CcsWrOlZ2PqeA4cCSp5hoTviH3O2wiegv1PhfzQDIp54IQvKqww
 +/dgw5GvKCeREwVx5nQlZa+TtVbTwcT+YyPFBkMdnoBDhp2VT8BRy2ukPSbKpJcwldyOkxtN9k2
 yq9HyKG3+sfMS4LqKH2AlriRH/VaLsuHr8G3Fzycp+7Be0LbWU84y4pl9lQirigRWKY3SIjKhxU
 W/j0mrjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199



On 8/28/2025 4:01 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
>> From: Li Liu <li.liu@oss.qualcomm.com>
>>
>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>> QCS615 has a DP port, and DP support will be added in a later patch.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
>>   1 file changed, 150 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
>>   		};
>>   	};
>>   
>> +	dp-dsi0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DSI0";
>> +		type = "mini";
>> +
>> +		port {
>> +			dp_dsi0_connector_in: endpoint {
>> +				remote-endpoint = <&dsi2dp_bridge_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	vreg_12p0: vreg-12p0-regulator {
> 
> I should be more carefull when doing reviews. I thought that it was
> pointed out already and didn't some of the obvious things...
> 
> First of all, the nodes are sorted. By the name, not by the label.
> Second, there are already regulators in this file. Why are the new nodes
> not following the existing pattern and why are they not placed at a
> proper place?

Initially, we referred to 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250604071851.1438612-3-quic_amakhija@quicinc.com/ 
as a reference, but its node ordering seems a bit unconventional.

Would this revised ordering be acceptable?

...
+ dp-dsi0-connector

vreg_conn_1p8: regulator-conn-1p8
vreg_conn_pa: regulator-conn-pa
regulator-usb2-vbus

+ vreg_12p0: vreg-12p0-regulator
+ vreg_1p0: vreg-1p0-regulator
+ vreg_1p8: vreg-1p8-regulator
+ vreg_3p0: vreg-3p0-regulator
+ vreg_5p0: vreg-5p0-regulator
wcn6855-pmu
...

> 
> 
> [.... skipped all defined regulators ...]
> 
>> +	};
>> +
>>   	vreg_conn_1p8: regulator-conn-1p8 {
> 
> Tadam! It's even a part of the patch.
> 
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vreg_conn_1p8";
> 


