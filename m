Return-Path: <linux-arm-msm+bounces-63210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE3AEF7F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A26188D0B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5EE2737EA;
	Tue,  1 Jul 2025 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D4zS2eWD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08A26C3A3;
	Tue,  1 Jul 2025 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371782; cv=none; b=F1x6ljSYjCn4dfOpf2Jbt2iYHUDCdL3d3Ec2zPPFOXxDmVpgF6Y40E46TPpx5oGakuWDmOPzcDyrUXRkdo8IWwxWibZeuESi1pnaBXyOfQtpR83uiBkT1DJXPyiNZ1bEyaSqqjBHz/2XJvdMgj3MsY1d/OLgV4KynmSShGd61/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371782; c=relaxed/simple;
	bh=PneFwavh+8QO2kYiZ06RkBnUkUTkdgwStYI/lFKTt/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rxic0GlXC5qfZpuez4cD7lIzxK/lgOn9tJxJarVZOjTNVIxbAZyyZudY3uuPKy0oe9PbAP/P8CJeo+Fc3ytsUyp3WPAN/dJChWTiAXOdEFFDkWBx15P0FhM0Zj1/X3mfKZxcJcUVNbTjrfrZSOGDKhQmdqwbVdHUiLmN/0IxX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D4zS2eWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619gu9t024724;
	Tue, 1 Jul 2025 12:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSZNYAJ4h59nZT66T3wthVtma3IFYWOlm+ogmeO8LQc=; b=D4zS2eWDlDlY9nsb
	UJyFkB5pgROLq8C+vqIznPAIz+muMLnOkQY/S/yWTLankQFzqDWLbDd2t23TvNaB
	y9k4Qk0gT3VZGomQoOKn0RtjpFpfaRp9zDG4AXS9lLFZAf2liWyClcAzgcdYcFzO
	NBSsssfPE5E6S9pfGKmRfU94/4PbkwPMzZm84UcDv8L10UMXUir6wmIVRhRJin+d
	Hbz9Zj8d9gO/QI6ILMpPE/54Nu9vYgGf1clWI7feU9l1D3i6E2sbU26nR3fHwaOM
	viVqhNT7sfZdNHKIL75D+lwLTdM1TZ1oEGZzkjN5eVE7RMeIo/Cn/Fm8iu/gENri
	4aWaxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9gt5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 12:09:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561C9a0I005155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 12:09:36 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 05:09:31 -0700
Message-ID: <6d44e289-a20d-4dcd-871f-20b1854cbbf0@quicinc.com>
Date: Tue, 1 Jul 2025 17:39:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
 <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
 <9b6de81e-54d4-4448-87f0-5ca83086fc27@oss.qualcomm.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <9b6de81e-54d4-4448-87f0-5ca83086fc27@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863d001 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=2hdoFJyArRUE589rrgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h2ZeIRJO60DgYgB8e5uVRvvc3R2AQu1X
X-Proofpoint-GUID: h2ZeIRJO60DgYgB8e5uVRvvc3R2AQu1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfX+RlvBkjqJfeu
 xZPu93Tbvkp0OYhEXSwqSgdU8YYfQexGDfFx5K7fPbT4Vb7u6piEVw75YwDnKJ7JZrX6HfPNjvz
 drv9nNGv+yB7TzT6UQ67xqj0u+lgA9DXz/NHqrbqQU2Z9znoPkfhwj90IedLl556Rfs1o631azr
 pjmXUJfCR0Ee9WcsavwMhfTf4bySi5+p7viLQvucHOjjjDnASkiveduDyfgxPlLZa1tsf/WBY+d
 fWevjjMQZS9xVPSFI1IWq68fnC8NWXxgA9ai+dqQgpzjuDT8c6PiYAIxw7/kUHv10q6Crlu1W+r
 T7rQXA1tpOJtboekHfw9M3uyTdzwuYryKHRd1kcLYbzIbMzG0E3givmqZ0StDT7HOBgJV2HEjdT
 r1i9MtqySVuJQkv1iYSpL/kXi6pKmbUeyi/skkcStUuz8C2QWwf9LH/AwqTxn2A4bwC8g5Wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=871
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010075


On 7/1/2025 5:23 PM, Konrad Dybcio wrote:
>
> On 01-Jul-25 13:40, Satya Priya Kakitapalli wrote:
>> The sc8180x video clock controller block is identical to that
>> of sm8150. Add a new compatible string for sc8180x videocc and
>> use sm8150 as fallback.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
> The yaml checker throws a warning:
>
> make ARCH=arm64 LLVM=1 -j$(nproc) dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/qcom,videocc.yaml"
>
>    CHKDT   ./Documentation/devicetree/bindings
>    LINT    ./Documentation/devicetree/bindings
> ./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>    DTEX    Documentation/devicetree/bindings/clock/qcom,videocc.example.dts
>    DTC [C] Documentation/devicetree/bindings/clock/qcom,videocc.example.dtb


I somehow didn't get these warning when I ran the DT checker.

I am able to reproduce these warnings by running the yamllint tool 
directly, will fix them and resend, thanks.


$ yamllint Documentation/devicetree/bindings/clock/qcom,videocc.yaml
         Documentation/devicetree/bindings/clock/qcom,videocc.yaml
               28:9      error    wrong indentation: expected 10 but 
found 8  (indentation)
               35:9      error    wrong indentation: expected 10 but 
found 8  (indentation)


