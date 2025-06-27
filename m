Return-Path: <linux-arm-msm+bounces-62707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB64AEABC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7E95651C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56853442C;
	Fri, 27 Jun 2025 00:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0HnS/Ui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E841F95C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984056; cv=none; b=WAS6PblaAemalykqRTCLINfzsEo3qN43ahhKEzoZ2KoEYW/PRv+Ue0IUUA6eCHevA2woJFJPXdws6rtC6xd9/EYprfDmFqc8J1CWQ4Nk+kaho7P/lDAb8NB0t2sr2vTZv3ysSSIgvlDZQ1S2A+Ob24k3YIyCFnwdnzeouyr5LjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984056; c=relaxed/simple;
	bh=FLgR1RAVwQuARNNhUbrWo4jLrjd2p+X86Xi8nmksNs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQvpEZUqc6j4rph+yMiibQ7QaPwN6s/2oh6XG97J/GgtnO5IB7nwEYRb4Qj9W1Hwx7vSmJV0Bd3g4KNlN6EU0IaK1eWU6wJ08guykAvQ9SbZFrT5MJEfsWyUDvbpzdZZpOA9vC7I5sk5YYT7FbbXflSrieTJrcMb/A+0HTJ9svY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0HnS/Ui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKAWuQ014018
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/yyQh66OFWOTcOVBQEZDbZWDtw0lJCwMvCv/hgMGZU=; b=k0HnS/UiKJbD5yzS
	M/5PnQKJJNXz892+Cqd1alpRMF7dpaRVesfActI/hxJ7d/XiLJCsbeHUbgl4gJyo
	zy8L3VmnwE3h5E14/63vS+ejWy1JavUUKIb5fndNV2cFzy0MwwBCtIa2KMXEd7+O
	K0+ahaLqgrW7h6QRC+K4cwqXUnjVztBynpSVrPqG6MR7HLIbyuh72dpldId37ee2
	+RfRPnB96QHDw+mUnMx08KEqdQhXEWXkWCzPc/cULhXs51jbA8tRTfV1alO/mMsA
	3a0X5muwZ0LAsBSyErQsRFdTjVrMZzAKpmfYNcwOoVMdU4t47yqGdXyoE0gs3m+W
	gt3Qgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmx6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:27:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5911ed20cso1855791cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 17:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984052; x=1751588852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/yyQh66OFWOTcOVBQEZDbZWDtw0lJCwMvCv/hgMGZU=;
        b=Dj8oqAMMBuZmlq/aAMKaHlCNShBeVRfadVofMO8ysi4vZRLVcU2om+7K7vG0Jj9BHB
         ac76KRqUrmOwHG9cdMqGiipcsAkkqsnVqfVx3wG+P61x4ybn7jt3KTZpPV+WSQsFO8Po
         dPg14/w4xqHkoAq49bn6qmG0PyeAqaq7PXhwZ5vPDRP4GHm0MR/F3gq15ZZh30UstsMi
         U7BCzrUCZ7Mg1zBVCQByfz3rkPt6WDzwYkEfe2MSs5i8pE/d5tcpC5rGbvSNpc/sT7pe
         GcmbvKhCfrcL7jzYsDpYZ2U3Pj6ymuZfhe7a9UVSHChCAiSFCf0cjqqERhsb8ljcP1Kl
         /9hg==
X-Gm-Message-State: AOJu0YyqIpS97rj+WF6kJHBIonyUzYi+B75Y3BLvQ6oz0bDnDVgsyOC9
	LcfHSMaFu0jmr5RY+RiLKvakKtrm7FYVWUJZW9FOOt2lqm9Q4C3IDJAlhTpn/EbZIUfI0gx9Sl1
	cMRkDcOinE2Q+FsiEl7uZwTAIidGMNqwqwwxEi26Z4ZvLi4TZLlxNroDFYg/Ao4fCsky5
X-Gm-Gg: ASbGnct1bqfhfdVKURKeHf3+1dfKQATHo1uNG7GydqVo8vxueAIt9+zGCQAdETtKKEc
	/e0Xul6nZHhLzhBuJKPqRsM6/fI8MN79w2eDaLAjWrWL/GByr2VwBOrdWHDi/WAY3yc65DF91Fq
	QnHFbX3GeqW24PQGU6JBHJwA0VL1eOii4p5rU5YhufKosjdANSuYXab66DfHbjDFEDU6jrr3XYE
	vJPlNVF7Qfm69bbhFo8KGaIAiBTiqz8c0jU7qHzEOUI8gILIcK3NwXQmC2q8frlzOtXtkARcjE6
	Qbcm0KzOP/GWofjtSdX5MOhc8tAVlsQGvAUjanjCkoiXb5ryajcuzg6R2iveryAnwRwzolvhKRI
	L8L0=
X-Received: by 2002:ac8:578e:0:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a7fcab4e4dmr9723811cf.11.1750984052207;
        Thu, 26 Jun 2025 17:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf+Fm2VsB3+UMV4et8MXVrn8NnN+RwmgZmsOUUV51chV+bVe/y/ao6xi3CeF1iYXaDIwscOg==
X-Received: by 2002:ac8:578e:0:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a7fcab4e4dmr9723681cf.11.1750984051724;
        Thu, 26 Jun 2025 17:27:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b5aasm690791a12.76.2025.06.26.17.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:27:31 -0700 (PDT)
Message-ID: <a703a581-dfef-4ead-b5d3-7ca75424c898@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 02:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
 <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tyI7MKzOHhtTRnqA_yOYqpl5bdPoPtdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwMiBTYWx0ZWRfX3iFfbNg4Tgcl
 qbvCB63c95HD1deMgUVWixFR2993ikNOHFbEfeua5kvpK/hQQquQanPqcFs+pEZBwNB6XtojDEJ
 HngzsFa92BVs9vM+404sii/+R4XHHV4K9o4GhMRMCF9vSOCudBjDgzy/G3MVznNyu5rv7yH9sOu
 o9gRcUsmnheeJO3iuiXTcM0Ug6fmwWiKdaBAtyJfkY3EY+0f+p+OrGcX2Q2/6sDjdgbvph0wcbk
 OM3cjqtdyToTfsx6xkD+OOHMTrphOJmoIPIkM8cI+Xa2baUZbPXJPSnNYwDlzcINc8+mhZukdlw
 AkzMzG2ZGgf4xasDsF75amojguXoMyVw3O7q88sLMUB7W8xj/Nvs2R4F3PXo4RMA3zaC69+ZZ84
 Cibmnt5oyhSBNgsc5KD4v9M/OugWRzsRyD6CuWBBmfEv9ScuHIG4fmGhSmkH6VO9Gerior4S
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685de575 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BecDG5H4cdSP3E7N7P0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tyI7MKzOHhtTRnqA_yOYqpl5bdPoPtdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270002

On 6/25/25 9:55 AM, Yu Zhang(Yuriy) wrote:
> Add an original PCIe port for WLAN. This port will be referenced and
> supplemented by specific WLAN devices.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 7cec7f643a84bd59dadfc4f7b8d95f52fc81c7f2..c996d5a9e31ce283109d55fb61db8e09d7edbf02 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1181,6 +1181,15 @@ opp-8000000 {
>  					opp-peak-kBps = <984500 1>;
>  				};
>  			};
> +
> +			pcieport0: pcie@0 {

If you're going to push another revision, please name it pcie_port0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

