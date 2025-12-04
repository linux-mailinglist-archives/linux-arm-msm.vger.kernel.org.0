Return-Path: <linux-arm-msm+bounces-84334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFECA302E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E595630CDFE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32C81917FB;
	Thu,  4 Dec 2025 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5QddFXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSsyT60r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001E33506A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840654; cv=none; b=NT3wRFUi/MNTa+C1TszuoKdUhafB+1HYlCiT3tufRpweJFPwCXJ2Cc6plt38wwtzXG1aMMSWoECNPK5yI+Y/lwmVnH0Xb9FbGewgquXPqmyoxVY8DQ2aEk0mJdZjlTb5pCLuPc+5CzEpiu1UKMEmN+8raw8un0EjN17VeH7r2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840654; c=relaxed/simple;
	bh=TBz26Cy10C6Fv21eVbj1sydmxq7/oUaPVnXQT40SY5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBD4ktMRYNB2s9F8LCrm1oidH4X+W31b9EWwfGqZKBiDbhT9IvgAFxu/86MJocAoi7NLRnHm8Xsn2Db+Okc7LtCPcMF8IZ6/ymuU37ldHHvLwCzfkraXl2QvfLrv59UYpwCVZ7P0R/h8HzOzwpLEob8eEIT/lqRSo0VUEuhq6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5QddFXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSsyT60r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468Ysr559851
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=; b=O5QddFXj5oDC78Eu
	AFD5D0c9iubG3vkR+/J2i1qxT3ElqH9myB2/Ni0eABOe4motCjDWJRqaRrzfrqmr
	rCqrsAW06wJ9Mdd+pN2kXo7dsrXcc/iAoOh5eOstWxEDjsbqDQRis+H+2rtbsdS8
	qioiEqo/yx7vrRucFB/2ccooRVd88Zf5F1qFJuS22jQvHC0nTkO4lKUPCX4VNQ6J
	dPnk2aMfigsN0+4dnNjpU3ExnmO/CEWqcr+BYlS7QncP05Jahf2jwcddRKDC5D60
	wSbIVCZZ2r3DQV9HrzD647Zkw6/IXXfQn/sPuTfJvyeLe85KIKzLCwwcXHdPVXl/
	O8mSoA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmhaauj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:30:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88820c4d03aso1896476d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840650; x=1765445450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
        b=fSsyT60ruAgYDARGJVz0gF3Ik83GQlOzMRrmSYHEjZvQX6E0dgJqp5FTeSKO0Nfqe2
         gXaZP2hliz+hR/Fu+atHHC0XnTLQL0E3hGJ3EfOUDJALcSuRwf+RDc3yw30kl0sqYJx9
         Xkk9K8jYPzXe/yuyXN7nRqgbyqJkmHv51cc29hb9JPIp7p/JJQ8gZ0oqsLThpOLxEZIN
         OgIJkFC7/yEErW+aqdC3Y5UcO3cQiIQ9enGkW7r/eA50EdSKDus6tAyyl37hXdlD51E1
         CmCaZ9AcLusk0LoAlMA4hnlVriPeSBXsQ7GK6oXvnmBf9/B+gVfUM7SwDiHDslhP98Mb
         9L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840650; x=1765445450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
        b=iRLCjCJDXw4dq3rMWd9tXMKiyvwV7un+CCYn07w/hT788sPnGQff8WQ8qfdNcROAfQ
         nOlEt69zJH6Y1DcVbV8c12mRziju+e4BQ/XD5F+aCzcUd1WtvoxuErHreL+pC+tzezyM
         whCNKwALj0TA3AIRTW/5bg1N1/4g4eAItYMObzrRoKPf/3vcsdwhEb+zY/ECurWoDvUs
         tOooCLyNwF8oKNCNPKxSiAVv58CMnxV2kes9SQ8Et23cpnOq5fn0NdPMW+mU9SU0FS1x
         0YmRUQ1uheUbeeAMDcJQb8P9rnYIH0ABJI5CutmbhOE4iwkBmK8r4TgyaOrEAAzuxw2i
         DTSg==
X-Forwarded-Encrypted: i=1; AJvYcCWfiOYt4ZTb1ezv9KZPOdS/r05KA25uwfIY8/c/j5FEk+FVngiNrEoaTkGjE+r9tsg9s9auQmdou1BLWWzh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dUyHyIvS1nhRMRJ09LXAtbhEKESv1J0t7UuWZW/05LnYSGZz
	MwfZzsp6uke1B16Bq2TQRakbFHvoXHFppArmum6Eqsf9iwgMKNpnGEgHCX+P7mRZJ6u5TWknCki
	oGKcS3sCkERpp5u2h981F77OH16N8CyXkVgd/UnV160RcVbWBUUP/HfbsQbtlAE1vwuThops2RB
	7e
X-Gm-Gg: ASbGncvmS6twg6I4QIk3dBeWY0Mx2tId+17YpEO4pduzOJ0609IoYjT5O6WtHss/toI
	C8c65X1SUKp4JgC+jkNnQonc72uH2QQtqo1oa5RnhVid/cN5SyQO2A8dDcIM5Hb/hDUUSxxD0jM
	VUwZIVv/hAqMFzKnS6+CUHxCSg0XqFrzI+EGi9VorfdQ9VZ2JNKD1hw7xboZOyVhHBafzeGoYvC
	1TfXMDyztPRf0JWDL8ANJvGjB0E2gOhQo+NGFLlO3z8WbYZ3dlep9BJsuaNmE5eVGB2aaNlFPC4
	D2O2NI1DmF7bgE7MfzJOik4+vWBuVvSBHzV7gfq3Eadw0JGnJmM5c4GV2TQ2hlTeitRVWw+TLo5
	PJaMfqtBxmC85AAAeErlr7GPrW19ml7sXns7uWGH/65WDONVEFVF0KA52dTzklBd04g==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr486936485a.1.1764840650299;
        Thu, 04 Dec 2025 01:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNiLdjRNKO9ZcI4TFhvnmYWWXLXzFWvAeb2BmQ6tBMrffZy9O/0DUsPB+d6zCalUQC5juiFg==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr486932885a.1.1764840649717;
        Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c88sm78208466b.35.2025.12.04.01.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Message-ID: <46d2aa15-6866-4777-a080-f983ba3769d3@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MuoH_eeYgz4SBg6crJUwBcj_QupbdAL_
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=693154cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX3udiRUBG8QCA
 G8DPAzOlwTdxNOskKY0mreYJ5kfVyM+f8SwEAIk9FCkc4w0UNR7hPLxQu1v6pcySDLg8w0h/Yiv
 zDk3PS1GBAaNa2PFyyQuRmKEIZr4LGh2nsu8c4GJCZsyua/Kg+Hopl1o+CQZap6AZTS8foBXfwB
 KdBqFOkpjFvbCpAG9/6Upz8fZr4aSBfkb5qZvzjHjCWRO9S4MV2nGw9L6LKQU2NerR04XSKCEse
 +Jqyjx5FKucqSyIyU/Z8Dmzxay3smf9TquAagD0O2uxf6rwqoE1KQQUfn6LPW4CL8Ar/YMFomrQ
 KZBZOsNsmlqfHoLnrom6P3G9vBtbAFkmDRl3ZSvzyOFimk/LTQGDCofAQTxmwii0twnry5Wctir
 t82TBTmwj8tToD9hl5Xny9FpXwg7cg==
X-Proofpoint-ORIG-GUID: MuoH_eeYgz4SBg6crJUwBcj_QupbdAL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040077

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

\n please

[...]
					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {

here and the other one too

> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};

[...]

> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";

1 a line, please

lgtm otherwise

Konrad

